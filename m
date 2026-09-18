Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51380C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 05:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/+syGeUNEJOxEY9gMP7VFdRM+M8wX1vbeHPt2rwhFE=; b=Csxiw5WRkysCIZIFanBOi/Anso
	ZH3tD4Ox0yOUnWmHG8vBm34MjBItbQ9XT8BiXDidLJZqKm27yLlwwgeEmpOrFtEUMiOKfqxvrQWYN
	wHT7Pman0H4jFXbo8GRIneKEWHzq8W0JWEPNaDyMrFhP9Fn5CCtocV5KC7xIxbyK7Am3z4qcz4s02
	LM6amAG5OV9Qp5ZbDHkM+KeN+ecexnnbY2GK8BOP6gRYup6L5Qed9OasBPA1JAYAdQH9dtK3ubSIc
	FQhNys1mrffXVBFNcaXmSq2d4MoAke6HZptf1dYfZf8xBuNdD4BS7JjuJNulc/Cob48O4NcwF9ntF
	EzVFFgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7QlI-0000000DUO4-1ghY;
	Fri, 18 Sep 2026 05:03:48 +0000
Received: from mail-106105.protonmail.ch ([79.135.106.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7QlE-0000000DUNN-0sJu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 05:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gdead.co.uk;
	s=protonmail; t=1789707818; x=1789967018;
	bh=Y/+syGeUNEJOxEY9gMP7VFdRM+M8wX1vbeHPt2rwhFE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HJiLzNeiLOyVJk8N3GgRIKGWZS2y2g8rGPPy1bHSi6GjZ49hlDGsV7acleBTlmi+Q
	 +Gy0Nyu5+iirO16EB2afKA3/0KTpzuby+3Gr4V8cnw8+uxx75YXomXXZGM6mm8GpmR
	 f35etqowkNI5RwwAEQ2fqfiLpz7DYnCQaAJplGPrfSAOv6+UGZOxD9fr8wH42jcjcj
	 YYSI+8Xg8RTyCksJy+4eroiI/yCJoWD6Eqpr64vdlgAzFU6MtMpBqrK0LIuHe4GQE1
	 4mDitxiyhshY+ee348teulXaKcWCwBYftCuTj9UyPAbg2ZYjuCxgnitUu2RoyDSNqY
	 wUYFsI0+mbGfQ==
Date: Fri, 18 Sep 2026 05:03:32 +0000
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
From: No SPAM here <nospam@gdead.co.uk>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [BUG?] Possible scheduler bug on Rock 5B RK3588 on 7.2.5
Message-ID: <K1jT7_eLEui577xckhp8-0sviJED02Cz2tKRXRN__urWBicx93Hk4uQQDEkUb9nextvaGQNwWnKpcrM0M5NegCLiTHSAxhNFyNaoBrkm9P4=@gdead.co.uk>
In-Reply-To: <11cdc24a-962a-4f44-b91c-445c2ac80c02@rock-chips.com>
References: <f15f8166-c1e4-45dc-9ddd-4ec887e415eb@gdead.co.uk> <d6232ccc-9876-435f-bea8-43cd169dd185@rock-chips.com> <BxAg81spRPHPsVOcNI5jR9tsii3Wi5a_k_BYW6owu3n6D3jn4N6dbkksomSb82KFdp8nT-mY4cyiZzDFHCqtuskOIYxZwBOzAvyYVRy18KQ=@gdead.co.uk> <e045dc5b-5b03-4840-ade9-2c8f98c8c885@rock-chips.com> <iENNazJ40aK7PPjVcvf8KUzlTm4HMyT85UPc2ez-MfyeJjE2HWX1ujGXIA3BGRwegyOJEZQ86kV7UElMjyBc6V5uCkGyK4NRCdw74ZfJwI8=@gdead.co.uk> <11cdc24a-962a-4f44-b91c-445c2ac80c02@rock-chips.com>
Feedback-ID: 206881191:user:proton
X-Pm-Message-ID: 9fdfef5ba3792b52715742e4fa3c36eeed53f5cc
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_JV2ZPfWNcPY3dsiIsgKhqEyNmwX2GB8YJssTQxRhTQ"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_220345_110696_A69DD3EB 
X-CRM114-Status: GOOD (  19.80  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

--b1=_JV2ZPfWNcPY3dsiIsgKhqEyNmwX2GB8YJssTQxRhTQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks Chaoyi, Hello Peter.

I have run `openssl speed -multi 8 rsa md5 sha256 sha512 aes sha1  camellia=
  des rmd160` while booted to the same 6.18.52 kernel, one built with CONFI=
G_SCHED_CLUSTER=3Dy and one with it =3Dn. This produces a lot of output and=
 runs for about 8.5 minutes and puts out a 21 line table of statistics. I'v=
e compared a fair few of the numbers from both runs and most of the numbers=
 from the cluster=3Dn run are between 8 and 11% higher which seems to back =
up the idea that it's just not using one whole core of the 8 available. I'v=
e attached the two 21 line summaries here, CLUSTER=3Dn results are in opens=
sl-speed-nocluster.txt and CLUSTER=3Dy in openssl-speed-cluster.txt.

Trevor

On Friday, 18 September 2026 at 02:22, Chaoyi Chen <chaoyi.chen@rock-chips.=
com> wrote:

> On 9/18/2026 3:15 AM, No SPAM here wrote:
> > Hi
> >
> > On Thursday, 17 September 2026 at 03:37, Chaoyi Chen <chaoyi.chen@rock-=
chips.com> wrote:
> >
> >> Hello Trevor,
> >>
> >> On 9/17/2026 9:21 AM, No SPAM here wrote:
> >>>> Would you mind trying to disable `CONFIG_SCHED_CLUSTER` and checking=
 whether
> >>>> the problem still reproduces?
> >
> > trevor@rock-5b:~$ uname -a
> > Linux rock-5b 6.18.52-current-rockchip64 #1 SMP PREEMPT Mon Sep 14 11:3=
6:19 UTC 2026 aarch64 GNU/Linux
> > trevor@rock-5b:~$ grep CONFIG_SCHED_CLU /boot/config-6.18.52-current-ro=
ckchip64
> > # CONFIG_SCHED_CLUSTER is not set
> > trevor@rock-5b:~$ sar | tail -5
> >
> > 18:50:15        CPU     %user     %nice   %system   %iowait    %steal  =
   %idle
> > 19:00:15        all     99.89      0.00      0.11      0.00      0.00  =
    0.00
> > 19:10:15        all     99.89      0.00      0.11      0.00      0.00  =
    0.00
> > Average:        all     99.89      0.00      0.11      0.00      0.00  =
    0.00
> >
> > Been running stress --cpu 8 since 18:47 and so far it is using all 8 co=
res at 100%. It would normally have shown the 7/8ths problem after 20s or s=
o, maybe 2 or 3 minutes at max. So I'd say this setting is definitely invol=
ved.
> >
>=20
> Thank you very much for testing. I'm not a scheduler expert, but I see
> that CONFIG_SCHED_CLUSTER is enabled by default on arm64 [0].
>=20
> Peter is the maintainer and author of this series.
> @Peter, do you have any further insights? Thank you!
>=20
> This thread background is here[1].
>=20
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/?id=3D7bd291abe2da09f59dca81f35a4ec220e5e138a2
> [1]: https://lore.kernel.org/all/f15f8166-c1e4-45dc-9ddd-4ec887e415eb@gde=
ad.co.uk/
>=20
> --
> Best,
> Chaoyi
> 
--b1=_JV2ZPfWNcPY3dsiIsgKhqEyNmwX2GB8YJssTQxRhTQ
Content-Type: text/plain; name=openssl-speed-nocluster.txt
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=openssl-speed-nocluster.txt

bWQ1ICAgICAgICAgICAgIDIwNjY0Ni43MGsgICA2ODIwODIuNjlrICAxNjI3NzMzLjc2ayAgMjUx
NTY5NC4yNWsgIDMwMDM0MTEuMTFrICAzMDQ3NTMzLjIzawpzaGExICAgICAgICAgICAgMjU3MjY1
LjE4ayAgIDk0NTU2NC45MWsgIDI4MjY1MDEuMTJrICA1NzMyMjIzLjMyayAgODQxNzg4OC45NGsg
IDg3MjcxNzIuNDRrCnJtZDE2MCAgICAgICAgICAxNjg3NzUuNTdrICAgNDgyNTc4LjAxayAgMTA0
NzQ4OS45NmsgIDE0OTA1NzYuNzNrICAxNzAzMTQ2Ljg0ayAgMTcyMTE3MS45N2sKc2hhMjU2ICAg
ICAgICAgIDI1NjU5My4xOGsgICA5NDkzNzUuNzlrICAyODUwNjM1LjY5ayAgNTc4MTkxNi42N2sg
IDg0NDE5OTUuMjZrICA4NzQwOTI5LjU0awpzaGE1MTIgICAgICAgICAgMTM5NDYyLjcxayAgIDU1
ODQ3OC45M2sgIDExMjQwMjcuMTRrICAxODExODMxLjQ3ayAgMjIwOTY4OC4yM2sgIDIyNDY2ODgu
NzdrCmRlcy1jYmMgICAgICAgICAgICAgIDAuMDAgICAgICAgICAwLjAwICAgICAgICAgMC4wMCAg
ICAgICAgIDAuMDAgICAgICAgICAwLjAwICAgICAgICAgMC4wMCAKZGVzLWVkZTMgICAgICAgIDEz
MjcxMi4zOGsgICAxMzgyODYuNDBrICAgMTM5ODQwLjc3ayAgIDE0MDI2MS40NGsgICAxNDAzNzIu
NjVrICAgMTQwMjQ1LjY0awphZXMtMTI4LWNiYyAgICAyODg3MDk4LjQyayAgNjY0OTUzNi42NGsg
MTAxMzk4MDcuMDZrIDExOTg2MDg0Ljg2ayAxMjczNDYzMC41N2sgMTI4MDM5NzAuMzlrCmFlcy0x
OTItY2JjICAgIDI3NTEzOTYuMDlrICA1ODc0MzgzLjI3ayAgODQ3MzU4OC4wNWsgIDk2NTUyNjIu
NTVrIDEwMTYxODM3LjQwayAxMDIwMzgyNC4xM2sKYWVzLTI1Ni1jYmMgICAgMjY3NDkwNS40OGsg
IDUzNDA4OTEuNjdrICA3MzczNTg1LjgzayAgODI1NTE4Ny45N2sgIDg1NzkwODAuMTlrICA4NjA5
MzcxLjQ4awpjYW1lbGxpYS0xMjgtY2JjICAgNTgyMjI3LjMzayAgIDY3OTgzOC42OGsgICA3MTA3
NzAuMDFrICAgNzIxMzI4LjQ3ayAgIDcyMzk3OC45MmsgICA3MjQ0ODkuNTZrCmNhbWVsbGlhLTE5
Mi1jYmMgICA0Njg0MTYuMThrICAgNTMwNTEzLjk2ayAgIDU1MDAzOC40NGsgICA1NTYyNzAuMjVr
ICAgNTU3ODI2LjA1ayAgIDU1ODAwMC44MWsKY2FtZWxsaWEtMjU2LWNiYyAgIDQ2Nzc3NS4yMmsg
ICA1MzA1MzUuNDdrICAgNTUwMDY2Ljc3ayAgIDU1NjIxMy41OWsgICA1NTY4NzYuMjlrICAgNTU3
OTQwLjc0awogICAgICAgICAgICAgICAgICAgc2lnbiAgICB2ZXJpZnkgICAgZW5jcnlwdCAgIGRl
Y3J5cHQgICBzaWduL3MgdmVyaWZ5L3MgIGVuY3IuL3MgIGRlY3IuL3MKcnNhICAgNTEyIGJpdHMg
MC4wMDAwMTZzIDAuMDAwMDAxcyAwLjAwMDAwMnMgMC4wMDAwMTdzICA2NDMwNC4xIDc1NTM3OC43
IDY0NTgxNi44ICA1NzUyNS4zCnJzYSAgMTAyNCBiaXRzIDAuMDAwMDgzcyAwLjAwMDAwNHMgMC4w
MDAwMDVzIDAuMDAwMDg2cyAgMTE5OTAuNiAyMzM1NjIuNiAyMTgzMTcuNyAgMTE2NzkuOQpyc2Eg
IDIwNDggYml0cyAwLjAwMDU3MXMgMC4wMDAwMTZzIDAuMDAwMDE2cyAwLjAwMDU3NHMgICAxNzUy
LjQgIDY0MzAxLjggIDYyNjE0LjIgICAxNzQzLjAKcnNhICAzMDcyIGJpdHMgMC4wMDE3NjBzIDAu
MDAwMDM0cyAwLjAwMDAzNXMgMC4wMDE3NjVzICAgIDU2OC4xICAyOTM2MS45ICAyODkzNS42ICAg
IDU2Ni41CnJzYSAgNDA5NiBiaXRzIDAuMDAzOTk1cyAwLjAwMDA2MHMgMC4wMDAwNjBzIDAuMDA0
MDAwcyAgICAyNTAuMyAgMTY3MzguOCAgMTY1NjMuOCAgICAyNTAuMApyc2EgIDc2ODAgYml0cyAw
LjAzMTEwNnMgMC4wMDAyMDdzIDAuMDAwMjA4cyAwLjAzMTEzMXMgICAgIDMyLjEgICA0ODM5LjAg
ICA0ODE0LjggICAgIDMyLjEKcnNhIDE1MzYwIGJpdHMgMC4xODk4OThzIDAuMDAwODIwcyAwLjAw
MDgyMXMgMC4xODQyNDRzICAgICAgNS4zICAgMTIxOS40ICAgMTIxNy4zICAgICAgNS40Cg==

--b1=_JV2ZPfWNcPY3dsiIsgKhqEyNmwX2GB8YJssTQxRhTQ
Content-Type: text/plain; name=openssl-speed-cluster.txt
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=openssl-speed-cluster.txt

bWQ1ICAgICAgICAgICAgIDIwNzg5My40OGsgICA2ODE4MjguODBrICAxNjI0NzAzLjY2ayAgMjUx
NDQ4MC40N2sgIDMwMDMzNzAuMTVrICAzMDQ3MTQ1LjQ3awpzaGExICAgICAgICAgICAgMjU3MDAx
Ljk3ayAgIDk0NDEzNC4yMWsgIDI4MTg4MTkuNjdrICA1NzI5OTg2LjU2ayAgODI1ODYxMy4wM2sg
IDc4OTg5MjkuNTRrCnJtZDE2MCAgICAgICAgICAxNTc1NjkuODJrICAgNDQ2NzkzLjI4ayAgIDk2
MzQ4MC43NWsgIDEzNjA2NTkuODBrICAxNTQ5MzUwLjIzayAgMTU2NTA4OS44MmsKc2hhMjU2ICAg
ICAgICAgIDI0MTg3NS40MGsgICA4OTQwNzguODJrICAyNjY3NDk3LjE1ayAgNTM0MzcxNC4zN2sg
IDc3MDU0NTguMDFrICA3OTYxMzUwLjM4awpzaGE1MTIgICAgICAgICAgMTMwMTM5LjkzayAgIDUy
MDI1NS4yMmsgIDEwNDAwNzEuNzdrICAxNjY1OTM2LjM4ayAgMjAyMzIzMC4xMmsgIDIwNTU2MDIu
MThrCmRlcy1jYmMgICAgICAgICAgICAgIDAuMDAgICAgICAgICAwLjAwICAgICAgICAgMC4wMCAg
ICAgICAgIDAuMDAgICAgICAgICAwLjAwICAgICAgICAgMC4wMCAKZGVzLWVkZTMgICAgICAgIDEy
MjIyMy42N2sgICAxMjY5MjkuNjRrICAgMTI4MzYxLjg2ayAgIDEyODg1OS4xNGsgICAxMjg4MDku
NzJrICAgMTI4ODQ5LjI0awphZXMtMTI4LWNiYyAgICAyNzM3MTY1LjMyayAgNjIwNTgwNy4zMmsg
IDkyMjAyOTAuMzBrIDEwNzM2Njc0LjA1ayAxMTM2MDg2Mi4yMWsgMTE0MTAzNjUuODBrCmFlcy0x
OTItY2JjICAgIDI2MDkxOTcuMDZrICA1NDYyNDU3LjQxayAgNzcxNzg4OS4yN2sgIDg2OTM0NjIu
ODdrICA5MTI3OTQxLjQ2ayAgOTE2Mzc0MC41MGsKYWVzLTI1Ni1jYmMgICAgMjUzMTk2MS4zOGsg
IDQ5NzMwMTcuNjBrICA2NzIyNzAxLjQwayAgNzQ1MzE2Ni41NWsgIDc3MjgyMDQuNDZrICA3NzQ4
MTA3Ljg1awpjYW1lbGxpYS0xMjgtY2JjICAgNTM3NTA4LjU4ayAgIDYyMTUxMi4zNmsgICA2NDgx
MjguNjBrICAgNjU1NzYyLjIwayAgIDY1ODQzNC43M2sgICA2NTg2MjUuODhrCmNhbWVsbGlhLTE5
Mi1jYmMgICA0MzMyNTUuOTFrICAgNDg0MTQ2LjI0ayAgIDUwMDE4My40N2sgICA1MDYwMjIuNTdr
ICAgNTA3MTk5LjQ5ayAgIDUwNzE2NC4yOWsKY2FtZWxsaWEtMjU2LWNiYyAgIDQzMDY3OS4yN2sg
ICA0ODM3OTcuODBrICAgNTAwNTgxLjY2ayAgIDUwNTYzMi43N2sgICA1MDcyMDIuMjJrICAgNTA3
MTUwLjM0awogICAgICAgICAgICAgICAgICAgc2lnbiAgICB2ZXJpZnkgICAgZW5jcnlwdCAgIGRl
Y3J5cHQgICBzaWduL3MgdmVyaWZ5L3MgIGVuY3IuL3MgIGRlY3IuL3MKcnNhICAgNTEyIGJpdHMg
MC4wMDAwMTdzIDAuMDAwMDAxcyAwLjAwMDAwMnMgMC4wMDAwMTlzICA1ODg5Ni43IDY5MDY4Ny4w
IDU5NDk4Ny4zICA1Mjg5Mi4yCnJzYSAgMTAyNCBiaXRzIDAuMDAwMDkycyAwLjAwMDAwNXMgMC4w
MDAwMDVzIDAuMDAwMDk0cyAgMTA4NTQuNCAyMTEzODEuMSAxOTgzNTcuOSAgMTA1ODkuNApyc2Eg
IDIwNDggYml0cyAwLjAwMDYzM3MgMC4wMDAwMTdzIDAuMDAwMDE4cyAwLjAwMDYzNnMgICAxNTgw
LjAgIDU3OTE4LjYgIDU2NTE1LjUgICAxNTczLjIKcnNhICAzMDcyIGJpdHMgMC4wMDE5NTdzIDAu
MDAwMDM4cyAwLjAwMDAzOHMgMC4wMDE5NTlzICAgIDUxMS4wICAyNjQzMS4xICAyNjA1MS44ICAg
IDUxMC4zCnJzYSAgNDA5NiBiaXRzIDAuMDA0NDQycyAwLjAwMDA2NnMgMC4wMDAwNjdzIDAuMDA0
NDQ5cyAgICAyMjUuMSAgMTUwNDEuNCAgMTQ4OTkuOCAgICAyMjQuOApyc2EgIDc2ODAgYml0cyAw
LjAzNDYxNnMgMC4wMDAyMzBzIDAuMDAwMjMxcyAwLjAzNDQ5NnMgICAgIDI4LjkgICA0MzUxLjEg
ICA0MzIzLjggICAgIDI5LjAKcnNhIDE1MzYwIGJpdHMgMC4yMTE1NDFzIDAuMDAwOTExcyAwLjAw
MDkxN3MgMC4yMTE0OTVzICAgICAgNC43ICAgMTA5Ny44ICAgMTA5MC45ICAgICAgNC43Cg==

--b1=_JV2ZPfWNcPY3dsiIsgKhqEyNmwX2GB8YJssTQxRhTQ--


