Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A95EA4E22
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KX8LyfkGSnwWJK3wQK4qJ9fwSRGCapjjd7Xu/oRsfOY=; b=hy/S+iuIFlyOZ/u7hzbKntQW0r
	aoH+v2tcjG43ufnt5VQ1o29k7A/xPOrBDxY8w2nrq6ZbUcMbd8JtS0PNNS9+mtjfmLEK9Mnx1nGZd
	BwhD31myNZnwvK0U/AePMKo/0M45ZMrQ9gCjvQU7mCXJd9K5BA+VR2NdTcH93ilK2HLPGQjdB9ftY
	jSb/946bSu93ZrQJMFZvIQMTf5YE07vwe6aXY+dY89s2G3tS68KCh2ZmWmPvSeLvDsT44Yp5NFM4/
	1xSNUap9c3r1uYYMYxwd6RaG55XQRK7X1y4Y/GTFua2/r3iTszz1JqmL9HzlhC5lxx3pnyD0kGaBC
	+KcnY/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx56E-0000000DLoc-0DXA;
	Mon, 02 Mar 2026 15:22:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx56C-0000000DLoT-1Fg0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=KX8LyfkGSnwWJK3wQK4qJ9fwSRGCapjjd7Xu/oRsfOY=; b=hPGaoihIGG0n4c6yP1ruGkidO1
	BrNcFzgumjDn6Rbu4/sg45Cv5qyIarsBatmpMSAdsjKf23Bv1qQ8v2OyTWPijYWXNLrCtvYGbctqm
	4VhAZz0WP26mHv6o4xiiBREhVbQLcSBZNKYgHJnn3AG57Uou2zHBjeaA7ZoCC89zJNJ+7Gz+x4kHQ
	Nua55IorFpLuEOsaH+Of73fxyokfZWfBOKjzM1f1OQz9OlJyamdRCfePTrF97fXo5jeKXaWx3LvAR
	uTQOu2wY/Hw4MMVN8wKcxPwa6OW9vEvpK5DwHqCllhqN0y61hiaEZFM0yFnwZ9wJxRTp1Iv9R1DsS
	I0zIsaLA==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx569-00000009g0z-0PK9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:22:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3DD7EC40F86;
	Mon,  2 Mar 2026 15:22:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCE165FE89;
	Mon,  2 Mar 2026 15:21:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4EF7A10369578;
	Mon,  2 Mar 2026 16:21:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772464917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KX8LyfkGSnwWJK3wQK4qJ9fwSRGCapjjd7Xu/oRsfOY=;
	b=Sp1XOY7MQ1zk8WE2oJ+NgQVnj6orYIwfCpXq7fcStXzRAPTbHwZTbSH8QtKq1g+tMuTPoR
	Mjg6O+5U53e/cPQwYf9mVbpUvimmSclHJv5EjRqr936QS6GKL9dG6JD9zX4kt7VSstXWlL
	8yNbfNU1k6OVyVzbK6SdVdXFOilEsc5yJFHuNiIdzwcvds9f+oJe57k/PXR+VfjUsEGYOQ
	hHRsQOmWmNsRfznGmfO+FL+gPnYuZdvwnqXlcXl9XE9coe9XrTJlX+WX4sbycwRLCKLiG9
	IlqwafFJsvgP7m40PNNPE8vIGi8n77wA76IfYR7VLEstJIWCYy+Zswr53wtmDg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Robert Marko <robert.marko@sartura.hr>, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Robert Marko <robert.marko@sartura.hr>, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: uDPU: add ethernet aliases
In-Reply-To: <20260127123250.527714-1-robert.marko@sartura.hr>
References: <20260127123250.527714-1-robert.marko@sartura.hr>
Date: Mon, 02 Mar 2026 16:21:54 +0100
Message-ID: <87v7fefe99.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_152217_197473_6B97187E 
X-CRM114-Status: GOOD (  13.35  )
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

Robert Marko <robert.marko@sartura.hr> writes:

> On eDPU plus, which is an updated revision of eDPU which uses an external
> MV88E6361 switch we are relying on U-Boot to detect the board, and then
> enable and disable the required nodes for that revision.
>
> However, it seems that I missed adding the required aliases for ethernet
> controllers, and this worked as in OpenWrt we had added those locally.
>
> Cc: stable@vger.kernel.org
> Fixes: 660b8b2f3944 ("arm64: dts: marvell: eDPU: add support for version =
with external switch")
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Applied on mvebu/dt64

Thanks,

Gregory
> ---
>  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi b/arch/arm=
64/boot/dts/marvell/armada-3720-uDPU.dtsi
> index 242820845707..cd856c0aba71 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi
> @@ -15,6 +15,11 @@
>  #include "armada-372x.dtsi"
>=20=20
>  / {
> +	aliases {
> +		ethernet0 =3D &eth0;
> +		ethernet1 =3D &eth1;
> +	};
> +
>  	chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> --=20
> 2.52.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

