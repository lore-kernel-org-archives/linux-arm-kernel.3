Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374AFD6406E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 02:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLv708T5nZKuD3uty/GoySjLydeaEBRlk4mAyPiG0Cc=; b=2oBRUkGG8WA4MfNcign/opDyyL
	0EgIxWYupwM5A6dJw12gEi5h21sidJT2iFKgSQo0sazFQ6ebWHQbO3/xa6nxMkrus8DrvhAQ6yUob
	aqtbyD3DEoUtI8d6wTVDasCPDcayDG2JUozV6OCIDbA+Pih88vvBGKSQ7IhghheLxXPgMitdYxIs+
	jBEFmIwNcybxMsIe+1VZhDcx+2TBlbvHz9EY1WoLSu34afVmvK4NBO783hUpWqWw2TCtYTF0to/sS
	9sWMjFoSs+sgNenkcJWxaHTpFuCJu5wF8VDMVAwTXfpJFm73rjN6ReL6amSEc4+1vlpfoviRgoHTW
	9sVJc1Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhUn-000000064Mv-2LUC;
	Wed, 17 Dec 2025 02:42:33 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVhUk-000000064Ki-0JgB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 02:42:31 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so4300657b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 18:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765939349; x=1766544149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLv708T5nZKuD3uty/GoySjLydeaEBRlk4mAyPiG0Cc=;
        b=nj+ALN4DlQ0A2lg9A782qO5hyd4WJsR2M5Lar5StOSURiDt5BtZ+FamB6/8Nmu4W3R
         SPm4MCfBvGz+noAOh8KSykdnbZtoMWfpnWrAqM1zVfK8jFCFK8/NUjsK8X10xxdiEh4e
         U99C1WH1f/JdjHzo8BUQL+ax7ohM+uBg1jLoNChmD2UQIoGOJVh6YOPBfKhO4G0iydVD
         559ESbttOjoemwKjjjupkYMnr/YE5Zcd5EvKtL4JDin5NMlq3UQMmbcJFBpanuHEiQPz
         C9zo4l+Bl8DyqR+Vyl5C84jfEdMnwadRi8SZNyMbOycSVqxCHLMRGWkhOnKo3aN1RNO2
         4ACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765939349; x=1766544149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tLv708T5nZKuD3uty/GoySjLydeaEBRlk4mAyPiG0Cc=;
        b=dRit9GkFT4Ua8bCKbNNy6SE8DoVY0hEZcEs0zz+bV+sBkJUL28w+z8tn3NS/la48zj
         obBfo+sLhfzrFle5LgpSqWKaOVPnl4z0a5qr0o78hjPPlgsgiiL5V9Zy7PJIpquhWIZ4
         /MHNz1A18g45BcU7zBSeePBkvwqxxj9l4kByf43FlkzAcGBqxLEHcJCxBb4AHiAbL62t
         NENE17rdSzrYEK4NruR7mx+GKOrO9DvMeHhHDkVrICeO3XXggnE1ZWU0AkRKeVYijZ8J
         OehKESpZTnQ7VJVBDVvbpIVNRAeSPnP3xp3OiQC4AwK1AcUQ0IolqiHVzh/rdJvmnkY/
         32NA==
X-Forwarded-Encrypted: i=1; AJvYcCV+ntUjQO1Ch7msbVdyHPPhmBfbFqTAHhMiauHr696nuH9nwae4jJGZcStg6PBQ4Vqk1AAHC4nfgdDUoU2Sbi8w@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzt9VepWkrsH8rjPjKchu0jytLZo3VkTO7eLBlDqI+d+anI0WW
	k33TI25vM+X+7b1zCIcQN1l6PVjGoN1ScXYGhXpM+5svRqlpNh6p6ttW
X-Gm-Gg: AY/fxX7+Y7jrZEwIE+64xS0EoRNkbvS4xOgTtEgNUQH675h108aHMzEC6CWBcbk0VUG
	dZZUBC9lvFM/I2OBuUzfyR2w2QCBpD/O4q6fqUbwCvf195GvVfOpyWTTsx7osnDTUMw0Oq1sSsb
	PX27BDEDYLSa2F3n1hkHqeW28QtAqbOboJUnZZ2mQ7YXplUYEBwD8/TQFqtmCpEjiO8IPL34gYg
	b4oAnPeJNrmI/e6zpdVWLjGzfW862/14SAD7uSJx8QbARjtCP+SMW37yqoXpaStsX74zxl8Hswt
	I93UT5v79cVNG+ME/FI8KwtiVt2mcB0gcxT3b/fTWevl7pZlXlycfsvj/cDOghJJETX+Gc2Q9Qe
	5GpVOPDUP9/hlFWKZltj9ddx0NxirxjkOe3IAUWPD82Lx+Z2Cvxn1OqSJLzyWzMmtd8eAvtGhXH
	l/qKq7F8jBYkX7PNGvmO9t/lyG1e0MT587VZVM6mGocYyXUmKwZ2cLkzXtjTjM9q3fEMD/uVqkG
	BDaM6I/i/idNrOizpKojT0Oow==
X-Google-Smtp-Source: AGHT+IF8EmsK24fsPEtUrS3MeJEwiNSX9jxwUKItV8WqJ74LAe6nBQy+G+21B3SBe4yksRo/wu40Kg==
X-Received: by 2002:a05:6a00:4c97:b0:7a4:f552:b522 with SMTP id d2e1a72fcca58-7f667a2ba18mr15648248b3a.27.1765939349129;
        Tue, 16 Dec 2025 18:42:29 -0800 (PST)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fcb8c29738sm941342b3a.17.2025.12.16.18.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 18:42:28 -0800 (PST)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v2 5/5] ARM: dts: aspeed: bletchley: Fix ADC vref property names
Date: Wed, 17 Dec 2025 10:39:38 +0800
Message-ID: <20251217023938.445721-6-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217023938.445721-1-chou.cosmo@gmail.com>
References: <20251217023938.445721-1-chou.cosmo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_184230_115942_0349D0BC 
X-CRM114-Status: GOOD (  10.83  )
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

Replace non-functional 'vref' with 'aspeed,int-vref-microvolt'
using the default 2.5V that the driver was already applying.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
index 123e2d1891f6..7c27bf6bb51d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
@@ -1032,7 +1032,7 @@ &gpio0 {
 };
 
 &adc0 {
-	vref = <1800>;
+	aspeed,int-vref-microvolt = <2500000>;
 	status = "okay";
 
 	pinctrl-names = "default";
@@ -1043,7 +1043,7 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 };
 
 &adc1 {
-	vref = <2500>;
+	aspeed,int-vref-microvolt = <2500000>;
 	status = "okay";
 
 	pinctrl-names = "default";
-- 
2.43.0


