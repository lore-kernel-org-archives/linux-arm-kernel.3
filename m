Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DE3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0/rnce+Rd2CzFJn7uWLGWjtLuFwcjvq8VkWuHMSEk0=; b=Z+INIHP2EA/KbLyYOJpi59Y/f+
	2NAiOHFR9ciFqu2z37K8VEgtbIRMZ6hRTTBGmEzw8fnzUTo4IksUZPSW8Wu+eGjYw73mO5ximSIj/
	xPdntXDsDO5U3+2IF+f/15s5Gb7OnOD2CiFquydtOtSosFuGpIYBe2JIJ4So/HqEvrJT8ItCrST7X
	ynlS86BNHgXXpqDYxy0H52o72npvqtTP2OiuVE3fGkIgyIgTN5QnL1/zup7xiGFQfHsS4WtxcKpnu
	YP8lgS1tBAmbn2hU8KagrWmEoUr+zAg+a9TI6th0+6mU647iCIMCkqIpPdD56NlCG48t1H3P9bCWx
	FMcpEQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tirau-0000000EEA4-2F8N;
	Fri, 14 Feb 2025 09:02:44 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tirUw-0000000ECdj-2sgp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 08:56:36 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739523392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k0/rnce+Rd2CzFJn7uWLGWjtLuFwcjvq8VkWuHMSEk0=;
	b=y10N4J9imkiBtiYErNuQfAugaMY9dHIlTa6jk8nKosC2v3SJXWJPHGe0xyePWHxt5jNQ6T
	L/ztRknGyeA7Ns0IJ6FPBweOlUPBYXdwQ22t13502qrl/DYm+97dI93sRuilT2WFHVC/EX
	er0YaIC3PVdb575p/Y3t+1pBXzT9ZJIp5kXqP5muSZ5gkhkgdbv92HWqI5qkQ4gl1QdOsu
	VAZKX5eFMzikPH2LlvgnyCY4Ir85tRH4gO7C7O9Q0qVCZxV/BChg8B08D0Xc0TyLLwbXF3
	UXNEo+jwiwNye1bUL3UQYINieP08qiLR9RH4GvRI8adb8RWPMDzevf+2L7L4AA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739523392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k0/rnce+Rd2CzFJn7uWLGWjtLuFwcjvq8VkWuHMSEk0=;
	b=LDC6z2ymJ85I5KfU1stXIGjBN0B1fRLsUag1totGNYe1kesSKGeCfmxgBkcQVb3dce2pYR
	Xvz4tS+FkQBIsZDQ==
To: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>, Vladimir
 Oltean <vladimir.oltean@nxp.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Simon Horman
 <horms@kernel.org>, Russell King <linux@armlinux.org.uk>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>, Russell King
 <rmk+kernel@armlinux.org.uk>, Serge Semin <fancer.lancer@gmail.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, Suraj Jaiswal
 <quic_jsuraj@quicinc.com>, Kory Maincent <kory.maincent@bootlin.com>, Gal
 Pressman <gal@nvidia.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 Andrew Halaney <ahalaney@redhat.com>, Choong Yong Liang
 <yong.liang.choong@linux.intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Vinicius Costa Gomes
 <vinicius.gomes@intel.com>, intel-wired-lan@lists.osuosl.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH iwl-next v4 0/9] igc: Add support for Frame Preemption
 feature in IGC
In-Reply-To: <b7740709-6b4a-4f44-b4d7-e265bb823aca@linux.intel.com>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
 <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
 <20250213130003.nxt2ev47a6ppqzrq@skbuf>
 <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
 <877c5undbg.fsf@kurt.kurt.home> <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
 <87v7td3bi1.fsf@kurt.kurt.home>
 <b7740709-6b4a-4f44-b4d7-e265bb823aca@linux.intel.com>
Date: Fri, 14 Feb 2025 09:56:29 +0100
Message-ID: <874j0wrjk2.fsf@kurt.kurt.home>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_005635_030548_F43B7A3F 
X-CRM114-Status: GOOD (  18.55  )
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

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri Feb 14 2025, Abdul Rahim, Faizal wrote:
> On 14/2/2025 3:12 am, Kurt Kanzenbach wrote:
>> On Thu Feb 13 2025, Vladimir Oltean wrote:
>>> So, confusingly to me, it seems like one operating mode is fundamentally
>>> different from the other, and something will have to change if both will
>>> be made to behave the same. What will change? You say mqprio will behave
>>> like taprio, but I think if anything, mqprio is the one which does the
>>> right thing, in igc_tsn_tx_arb(), and taprio seems to use the default Tx
>>> arbitration scheme?
>>=20
>> Correct. taprio is using the default scheme. mqprio configures it to
>> what ever the user provided (in igc_tsn_tx_arb()).
>>=20
>>> I don't think I'm on the same page as you guys, because to me, it is
>>> just odd that the P traffic classes would be the first ones with
>>> mqprio, but the last ones with taprio.
>>=20
>> I think we are on the same page here. At the end both have to behave the
>> same. Either by using igc_tsn_tx_arb() for taprio too or only using the
>> default scheme for both (and thereby keeping broken_mqprio). Whatever
>> Faizal implements I'll match the behavior with mqprio.
>>=20
>
> Hi Kurt & Vladimir,
>
> After reading Vladimir's reply on tc, hw queue, and socket priority mappi=
ng=20
> for both taprio and mqprio, I agree they should follow the same priority=
=20
> scheme for consistency=E2=80=94both in code and command usage (i.e., tapr=
io,=20
> mqprio, and fpe in both configurations). Since igc_tsn_tx_arb() ensures a=
=20
> standard mapping of tc, socket priority, and hardware queue priority, I'l=
l=20
> enable taprio to use igc_tsn_tx_arb() in a separate patch submission.

There's one point to consider here: igc_tsn_tx_arb() changes the mapping
between priorities and Tx queues. I have no idea how many people rely on
the fact that queue 0 has always the highest priority. For example, it
will change the Tx behavior for schedules which open multiple traffic
classes at the same time. Users may notice.

OTOH changing mqprio to the broken_mqprio model is easy, because AFAIK
there's only one customer using this.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmevBT0THGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgsbpD/9AxFeEEq8XNrGj2pz6LdoAUuyEQfHj
t+9vHsspGPBsJxkOhM3JG10feAFjH823FcdQIruXggTynYrEO8GZH+G5a1qa24dh
6QAhDEi5ALUqVUD65fdIddO/wfEdDzSQj81bkkehRPqJ5V5bkaGGV9EJ6OYCEREE
L0PJ7rmipFvhZkbZ/1AKmO6U2yB8qDh2lwfAAKCYStjQDn7XdKrDhZVHAgxVn7UJ
rlxoaRVV9a419VYNs8lyeOkBrANThzcX4UPv8gs0ar6PtgDriPrVpeHa6wvFa+xl
/s1b9FtCHwZGjhaQVlRSMYuSF4N4TqBW9aXsCW81hJb2wka+MV8PTtGntss/yv6k
WU5dso/sCDXTD/4r4AQiS2p9w5exEIgNkcT55/0mnjiJNJ2Lzk+0ikrEC6LLnfZj
0UME5TLxP09SOIa68d5wHzi4JRKr+NTwcEevieGsxS78sC1UYvMi2jWiUa6C9fdz
TPU8/YpJ4Mw/8orXm/1Dkb5XKd3ef5/RF5uFG5Cu3vem7SJJJya8BrTqiUDesuy0
n3Wgx2CUBZ/sl1qssCGu2HwOfU/EeWtc4Pxr7UE9WKPc+aeMmJMt0qONmPYln/iJ
dPr18MvJNHlWM1NFmuAEV6ZJoo/LzvWEbvwNlJmKb8GodD4To4YEk5/iGWncaXkP
noqBzMdqbY5wEw==
=EOqX
-----END PGP SIGNATURE-----
--=-=-=--

