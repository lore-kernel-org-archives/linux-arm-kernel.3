Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E7BD78327
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pli6SsFvDcPYaCKSCtuylkfG7oHLkLI1T7gsEQivs80=; b=n7nzVzcL/mLFvIrx21pFkq68Al
	btd03dEuny1Fe560kS7fCZBICethcJQ0nZ8JGooxoW13Pvo+j9YM/syiX9Q28Qhz7poZ7lYS2JJ2P
	+QkjnTto5lalciAcV5PeR7mPJUiBw+qXvvjRJ9NecZu2TNSDqGu6mM5AHRkYrlcVLHaH0AqeGJzTa
	VR/yQAcmgaQesmOz1bkC4YkW8MVAMhJa767hLHGNblL/OBro/002VjXiplK0lqSWp9+pVqwiTluKS
	aL+3PodOmGv/LRhIGKRNNjnb38Gi6ESzqenpSbpjZFyQvos2+R2u3nYIgnj3W/3hHvkGQQzJMHtqA
	qvYl5U2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7bC-00000006UNa-1nSW;
	Mon, 02 Dec 2024 14:40:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TR-00000006Ryz-2IPN
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Dec 2024 14:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pli6SsFvDcPYaCKSCtuylkfG7oHLkLI1T7gsEQivs80=; b=OhQsNmoT3s4dR3a6lqEmBJeXLw
	t6l/2JSaSMj5bX0KEW+oEZDnrGPBqLotAm5o8yiYMv+IYKZtNN5L3r4nIWr10pBtM+ikUV+7DGNlK
	ObVsS47au7RT2Zq7HMoIoPg9rqokhfIK01VeD9TicvtvqTc2v/lxpQZOYGS1pdcEbpCCgW+nlQqf3
	0It5gSXb1zkfEy8n/76TMadlYdCXfMnXZA7YZNNwnXkHcxBa/0UZBSxqJgZyY88D6qKf2D/lyExhw
	jj/ccbrqQJmGFVbc/OPrgtbkUNcXzsnbD5KDzmRkdnmwpoTdfCl+Ohe6V9iSuR3+maiRqN3ZZlhTS
	sNawE5SA==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7TO-00000002BGC-0vit
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 14:32:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-434aa222d96so54809895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 06:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1733149944; x=1733754744; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pli6SsFvDcPYaCKSCtuylkfG7oHLkLI1T7gsEQivs80=;
        b=IvLD8MiFxHByecsDaqy37UJlZ7IursUKHs4oKuEp3O7DNKuDSKRjpox8fJ3JweqRbb
         cB5Y05SzlikmBZrqmpwObYaaEg5EspS8vTYCJ2zFkIZWT+DR43f+dhXoVZOM0eQ4WY15
         eUGadW6zJyhMy6JwjT6eeSh/qW+FHsVPjS6erRh5ahU4SUUY/ZbLmK5Q0f3MEBnSd2+t
         iaoQMdjyB6f9fuqXbGlRSWu4AF9xlMyx/dmjc/Z/okjnb/Dj0H2pzXGH3gi5msjQQTy2
         vbBAswDBZJP3GUK9RqvZnTbkQlJgCkHI4QqueFCNKaBivOKnOxrG8L8KY7q5sXqSdWOR
         nziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733149944; x=1733754744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pli6SsFvDcPYaCKSCtuylkfG7oHLkLI1T7gsEQivs80=;
        b=RXXp6Y5Q/gFG5fPdTTWHTN0ZW9hRSZbd223R8v3ekp2JnKZ3Xn0vJpK05+MB12B5b2
         vq0INvrLg+Oqle/WeZaoT07pg4Hu1RYWx39QZFisr5Zz+9ip9EH48clQX0IVRseCoHXm
         Jd2JRMl357+quOmdQFUd5DQvz3EGYi5M7P97yelg/8nNti8fnX6uRa2Xx1FOZjBMs1Yj
         6rJTJMNWxqjOk/CcvYFuIU31CsugEZlXNHdyZiQfA+RKz2JcOk6ijjN8k6xsiVgfp+nJ
         yKyz5wRMoZOnV3AJ+Cbq8qKT7QTqyIcu9XUv9du3ko0mHggPcW0Rx7ubkvy923Wpn06J
         r/SA==
X-Forwarded-Encrypted: i=1; AJvYcCUvhR/UVg/+DNVx4MpMDHROeEqgCW1zlwQng2wGjfdLQWb8erR2PDm8TAV9737uFhinBTiix+3i1CfdGoZqQ74n@lists.infradead.org
X-Gm-Message-State: AOJu0YwFUVSuKdyQRLYOj9Eob2RYu9ydn9idReVX2svmn+V7thHTUUb8
	mT7724LenKjWOwHAkpgdkSmp/gF8L1FmGmDERHgC2gzsBWkf0It8qhG105y+9CA=
X-Gm-Gg: ASbGncuA6umnKHJfbKhdYlbu9CoRBLfFfOpUdXDMSUKV48Ckh3btsuTgXaSdO0QITRv
	Kz7JveRZwjg9m8fBqnrhPzsZLD6pRxjvNDIzLzs4kLKhXH0SjnMMJhAPloAYGHZly4wmN13CE6x
	WRz/UZmY/7u2bSxuPx3JDm8KCPljV0fme7fdElH92UD8EizlarDQFYnkJpftmceB6gHSqMVkYPY
	i/H5PaRKjJ3tdH9B5/0BBNUpngK0OCDmNFud3XNnA==
X-Google-Smtp-Source: AGHT+IFok6tkFCPxh9TckNxxVOqWD00WXYrj3eZIwv/5rIdvTJ6mEyRfzTjnuA5/i326onD32S2G0w==
X-Received: by 2002:a05:600c:4686:b0:434:a986:11cf with SMTP id 5b1f17b1804b1-434a9dc3030mr246706275e9.8.1733149943483;
        Mon, 02 Dec 2024 06:32:23 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434aa74f1e6sm188429555e9.9.2024.12.02.06.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 06:32:23 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 02 Dec 2024 14:32:00 +0000
Subject: [PATCH 7/7] arm64: dts: broadcom: Fix device tree errors on
 BCM2712.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-dt-bcm2712-fixes-v1-7-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_143226_387666_782BBCA5 
X-CRM114-Status: GOOD (  12.41  )
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

Resolves the issues on clocks and power nodes

Fixes: 4254a647b6c9 ("arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index fbc56309660f..26e05601416f 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -66,11 +66,7 @@ &sdio1 {
 &soc {
 	firmware: firmware {
 		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
-		#address-cells = <1>;
-		#size-cells = <1>;
-
 		mboxes = <&mailbox>;
-		dma-ranges;
 
 		firmware_clocks: clocks {
 			compatible = "raspberrypi,firmware-clocks";
@@ -85,6 +81,11 @@ reset: reset {
 
 	power: power {
 		compatible = "raspberrypi,bcm2835-power";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		dma-ranges;
+
 		firmware = <&firmware>;
 		#power-domain-cells = <1>;
 	};

-- 
2.34.1


