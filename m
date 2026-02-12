Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8A7EE369D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJCNIdsXgOqoDULdSr1unLlWeh32HgM31dUI13xFAEA=; b=FL1FiktYe2zA3m4ZV5HWhzLckI
	lJXlghCVZyu5WjDfBzS78Q+FRId4tmXFc0iQDeGIhVjiej7OBsnd8xRqN9YkG3b0jd9wpQZ3nbKYq
	2ctKnMUUfQaVvG9cr3r/YcojON8rx1m4InlcdGmxvJN343oUe+HbajlbI939EQ0tFjHMabeFiuker
	oGPChsWc2JizINGvcXSVedLGSc7UXxQzBHEHkAWJHq48Z5/UDvpoPRRG8fDL74b0KTJP0iLwVSpMv
	3EhpoZxZ2LmDfQVpV6sdvpoVPNp4NQIgucxjV78wfU6hrRnnu9K6prLfTs5TbTjILetKhJyEv1qCE
	hB1eNDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYxz-00000002IBb-13b6;
	Thu, 12 Feb 2026 15:50:55 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYxV-00000002IA7-1n9L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 15:50:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770911396; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MJuNzbw+KGVIkKLyIu7zA0IPd2dbYRhZA/u4N8qRGspt7RLRcvxbP2CIMOfhw7FUkc
    kpSno87c4Uqs5XJs9JcsjGsXgC/aP67dLD1bGE1sbdy9iNpcxsCYN1teSrpPxEz/s06p
    7ksPQlGN9KaNU/OQIQ7JQMRqMxblUu5tdaqjIsWVkU53QSPgHoucolGrhHSxyM8gGB6S
    4jD8P1aLex4jMmKwMtPr4RN1Hw1Y9jS8yry8mlaUXLSX+WOSD11kVw7rnE2MSJbCyQWq
    cUhSPMAvZNI/gqNoe3IepyDTI1YPFiTDyQzCrBdVOsQqKmDLrfsHqRxYFz6DgEpBHVpd
    AyTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1770911396;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=MJCNIdsXgOqoDULdSr1unLlWeh32HgM31dUI13xFAEA=;
    b=NpCZvS5RjsPvlUIgBVzpNMK8eXMDy26FJaCgZvk+gVW9ppc0XvizdzT5hmf50bDe0u
    gBcRT8H7peb76eg5l2yKcI11kfhbLGOA+AKzwZZ9RzQZk+32Kj+vdxAeaty+O6RL8evs
    YxF6+3ms/VCKaf/sJxroe9wZhprJJ58gBWOFrP+RGGThin3YXyDlWIB5zEx18lPHHLDX
    Dt0HBbF1jY3vshFzY3UBP6hqeSRknxAZj758OYb5ghk0In1gVZM3af4jZsLcbAd63dkK
    khtd79xIaXm+v2hjBx76jh5uNJlcZQ8uPQdk+zgVfF7es0u6PLnD6bwjSoi+zDmmfnz7
    5fGw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1770911396;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=MJCNIdsXgOqoDULdSr1unLlWeh32HgM31dUI13xFAEA=;
    b=kql0YCEN2/Lix3x+4eNp7G3f0ERH3oxYKxK1s2gy4XVcmORuS93yFNxe8QppBI0dJi
    Korkh7NOilUYSJDLpcQ7+hmm3miGIqWQFoFzVFwSe3GT5rEHgBO44rCiO+xkqCGDXjnZ
    uYbxaS9ml/fmLRdN9KpCy2cLIfj9RBHG1UdColLG/gdGku2MixAHtj3tVKskN9pvvph1
    rZSXppRH36g/Fg/3ho/Z5NRApMGvJxTzwty0FSMxd6jsusETX3h0LBGfHmMOrl9bZ/9y
    K+7IjWGe6yTszGQ6VqCuvj0agDlNBTztYvi2dHUEMFK+2jruecEkH2UW06d3pEGPd+LE
    wAzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1770911396;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=MJCNIdsXgOqoDULdSr1unLlWeh32HgM31dUI13xFAEA=;
    b=vmZv9KJC5D/I/e97tUyq+SF7Oz3aJFr0vo5Fy1RA0UAURJXUr9YBtlmtTb2GWcjsiz
    EeJVRmMJUewIU4/NrODg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfzkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
    with ESMTPSA id Q3a36b21CFnsQZJ
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 12 Feb 2026 16:49:54 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH 1/5] ARM: dts: ti: Enable overlays for all DTB files
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
Date: Thu, 12 Feb 2026 16:49:43 +0100
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Bajjuri Praneeth <praneeth@ti.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B3366A17-641F-4E02-A5D4-978F525E0A96@goldelico.com>
References: <20260212-feature_bbge-v1-0-29014a212f35@bootlin.com>
 <20260212-feature_bbge-v1-1-29014a212f35@bootlin.com>
To: "Kory Maincent (TI)" <kory.maincent@bootlin.com>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_075025_761210_2051FC43 
X-CRM114-Status: GOOD (  10.21  )
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



> Am 12.02.2026 um 16:26 schrieb Kory Maincent (TI) =
<kory.maincent@bootlin.com>:
>=20
> Allow overlays to be applied to any DTB. This adds around ~40% to the
> total size of the DTB files on average.

Is this unconditionally enabled or can it be turned off by some CONFIG? =
We have
our own defconfig so I would not worry if if is enabled in =
omap2plus_defconfig
and disabled in ours.

We have several devices where the boot loader can't handle overlays =
(never touch
a working boot-loader :) So this seems to only contribute to build and =
load time
without benefit.

BR,
Nikolaus=

