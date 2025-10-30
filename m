Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA94CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABr3gcTdy1AEFkY5sdZ4MfJ8Bnsm1SQbnHUT6ph5efY=; b=RdzjdrLAwXOMd4fiQrtiToXMtS
	JjPr7Qp76dQVaU1+4Zu4j0v9fPKj+2JODpykG/Mcs/yA5p9QmuWq1GFOL+w58+qOqfMhwX7oJuloU
	ZPw+9cKCrCqGF2MZgB1T7DqSRmp2C6T5kHZ35GfkeJXTIwk3NuyHdyNnZZkOLY+8JG9gB2DtElfFs
	zYhrhuYBXIOiOkKJNyBbRmFumu5rF+oyl3y5v3FptLbEw5jRfclOGHsS1HHCHW2jCqRSWYufod2fX
	diOGuCb9BOpnY1FGVwAyK0ZzbJ7E7Fx9vTmLRl+dAJFRI4zc8cvgzJ7sb05C5YdybLCb0TwGKzNKi
	pXHHfeyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYMl-00000004gKR-1R59;
	Thu, 30 Oct 2025 19:31:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYMk-00000004gJZ-0ICO;
	Thu, 30 Oct 2025 19:31:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62F28603C5;
	Thu, 30 Oct 2025 19:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A2CC4CEF1;
	Thu, 30 Oct 2025 19:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761852681;
	bh=ABr3gcTdy1AEFkY5sdZ4MfJ8Bnsm1SQbnHUT6ph5efY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oP5D3fX1EMGh9c10kCDwfDmiGMpOZtXMyPQL9SFXPSo5AL0ohcKb3mOMIL4H/HOW3
	 z7JxGhq0EQFRfw1LQ+JpAl5zajomatIEYiljoPZykixCR87GyxuiqHBvwQUfMCdOQF
	 riMzaPCGXlYqCLnxAx57I1eUr7mp/9dRC9so2ILWNJaonPz9Zwg7w1H/MX52BRewMD
	 KLprEy3IxXML/IW0QCKyYzo+6wxecMknLFy1ZEL2SqaR5p/FcWk+RQS4A3li1AcVV1
	 mb9F5bZWgLLFlyLiw7YbRKr+qK/T8ttGm9yysmo+eZaUFLtlX9+12TUlfc1I5pZwpE
	 5pS3zIJ+Ihn1Q==
Date: Thu, 30 Oct 2025 19:31:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Jack Hsu <jh.hsu@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, srini@kernel.org,
	ukleinek@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
	chunfeng.yun@mediatek.com, wim@linux-watchdog.org,
	linux@roeck-us.net, sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com, andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com, jitao.shi@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pwm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 03/11] dt-bindings: nvmem: Support MediaTek MT8189 evb
 board efuse
Message-ID: <20251030-mutable-stash-8638eed370e4@spud>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
 <20251030134541.784011-4-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c7Po6BzRobpZEEj2"
Content-Disposition: inline
In-Reply-To: <20251030134541.784011-4-jh.hsu@mediatek.com>
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


--c7Po6BzRobpZEEj2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--c7Po6BzRobpZEEj2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQO9AQAKCRB4tDGHoIJi
0rdAAQDtfOt9xXOJY3LJZ28eWWlhiiz47oR/2Mc9KTEE2+w0WgD/faqEEQD5epc9
1K7ESHczUP4YKxIVb83Twfdsvc4n3AI=
=lU7u
-----END PGP SIGNATURE-----

--c7Po6BzRobpZEEj2--

