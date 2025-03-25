Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567ABC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g/ZnFTuVYued68oe7XL8RDnKQ+ZMKy0qE+LfBacqvSc=; b=o/Rtq7AZBHdFgK+Vek+luK8SYw
	a41UTha5pNPdT2q9FVPicbS/P2MFjI7Cfi39g1znHQQCP59l0psX4kGfxL/6XNNaL8jc2nsfrqqoJ
	8Dw+7La+8JNIqfe7ipbfZhQZ933zyKQ7/gDL3eXTdTgeenqFmwhapqJI/KPNVL3MzSNI7Tt+N3Ld1
	DJlt+QUZuiP5SuEZUbIP3IdSLDHPmETRzGhAIzpo6gqVdmwSXA6u5hBWHx6cs6VdT1/LCSQC0vcwh
	DuZjWgccJkWZwshzvaMRCIhAmlLG3OqpRfOb3s+468yQbie7Bo2RhfnaPidOO0g+YV9R/HmHF7yEb
	JRFa6KZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0IY-00000005HaG-0s5h;
	Tue, 25 Mar 2025 09:10:14 +0000
Received: from mail.ventrixio.pl ([57.129.137.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx0Gn-00000005HKG-1SQI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 09:08:27 +0000
Authentication-Results: ventrixio.pl; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; d=ventrixio.pl; s=default; a=rsa-sha256; cv=none; t=1742893571;
	b=uy4ATKwjCoyEz10E5Dq1+Gu3UGsULAxutiG0FtNPOaP4p6pusURNrLBb31Kv8e2yapFM
	 0UQOudZnz9RjW6MbcA3SQoyDi9UzMswe4ez2k2PShedppC2d5fnJwOvaYl6DxaDWXh3Wh
	 +vpA9cIrgVPc+f8eWqknCMtapeCDnrlbu5TGe2cJP0Bfqve3pdGGBItngvyfqQxFrkOUA
	 GynzMfc6fWx+xgCUARVeQgHLsNxOzBnl16SwYfNWA8hllGiQ6AcwJQYNevJO1QF+bEoi4
	 O49xerPNNWKw4HViMECtmcbzunAGyElAPftlDJViTRczJFcaT3kZn0nnytnzuax81/w==
ARC-Message-Signature: i=1; d=ventrixio.pl; s=default; a=rsa-sha256;
	c=relaxed/simple; t=1742893571;
	h=Message-ID:Date:From:Subject:From;
	bh=g/ZnFTuVYued68oe7XL8RDnKQ+ZMKy0qE+LfBacqvSc=;
	b=JylorEDQTtgV8yTINucDM1lolcTXDkZe+9/gHlMFm5EKq3UWTVSmfpgaPEqwThMFtm6y
	 bi4kt1vcCdx+XIzmsXlNFjco53J0/MF0orYuuQh0OwyqXcT1HWLaPCuhYA0p9d66l+Px6
	 TRkebtGrBxoEIHPggKXywe+F0xAARbGgyjuWIq+zyrmxoScZnx02hvdS/5UCv5XaMNM+f
	 95zCslteCrVvkFkoJrVdIlUzEegZAMPj9JqW9USHbEoxuv1m+COfJMy8ItMuxH9PzyCIa
	 zSDpmJ1oEX4NAhnRdw5wpxv/8FoaZg2jrVSkP6L380di9Kqus9vP5ztd+8CWpOC3lyA==
ARC-Authentication-Results: i=1; ventrixio.pl; arc=none smtp.remote-ip=127.0.0.1
Received: by mail.ventrixio.pl (Postfix, from userid 1002)
	id 9768523A31; Tue, 25 Mar 2025 09:05:20 +0000 (UTC)
Received: by mail.ventrixio.pl for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 09:05:11 GMT
Message-ID: <20250325074500-0.1.19.af9t.0.3oglsr4v1j@ventrixio.pl>
Date: Tue, 25 Mar 2025 09:05:11 GMT
From: "Karol Bednaszewski" <karol.bednaszewski@ventrixio.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Mniejsze_wydatki_na_samoch=C3=B3d?=
X-Mailer: mail.ventrixio.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_020825_534007_6AD58185 
X-CRM114-Status: UNSURE (   2.52  )
X-CRM114-Notice: Please train this message.
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

Dzie=C5=84 dobry!

Czy m=C3=B3g=C5=82bym przedstawi=C4=87 rozwi=C4=85zanie, kt=C3=B3re umo=C5=
=BCliwia monitoring ka=C5=BCdego auta w czasie rzeczywistym w tym jego po=
zycj=C4=99, zu=C5=BCycie paliwa i przebieg?

Dodatkowo nasze narz=C4=99dzie minimalizuje koszty utrzymania samochod=C3=
=B3w, skraca czas przejazd=C3=B3w, a tak=C5=BCe umo=C5=BCliwia tworzenie =
planu tras czy dostaw.

Z naszej wiedzy i do=C5=9Bwiadczenia korzysta ju=C5=BC ponad 49 tys. Klie=
nt=C3=B3w. Monitorujemy 809 000 pojazd=C3=B3w na ca=C5=82ym =C5=9Bwiecie,=
 co jest nasz=C4=85 najlepsz=C4=85 wizyt=C3=B3wk=C4=85.

Bardzo prosz=C4=99 o e-maila zwrotnego, je=C5=9Bli mogliby=C5=9Bmy wsp=C3=
=B3lnie om=C3=B3wi=C4=87 potencja=C5=82 wykorzystania takiego rozwi=C4=85=
zania w Pa=C5=84stwa firmie.


Pozdrawiam
Karol Bednaszewski

