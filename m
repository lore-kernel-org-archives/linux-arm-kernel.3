Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA596E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNTGzlog7Q9IZQyQd4eTU3kXEBDBdmsulQeLjahgS6Q=; b=wIdf5zzHpbC+LDmNM/mkbCxX+4
	3MxT7Z1PAeVqeu3eXsKMoaFyp71pX7TYwZ/AUuVdki7dQdKvNr+c8K6C8idlLIaVXBOofmsLAEY1d
	7bwOa9mlrgY5iZt+fnPbsD1moDkf4AcUEflleXqD1AQ9HkCZsLDW6sTE7v+MfkyCQQYbyjiJviogW
	kLXJ4Ts9Mn+yErzyQ3IXbviu3eHHYpC9m8aCanRKCRiRwaGyw7aWygZcTUMedfwCyVGeXpwhFS7i9
	U6RsD4BPRk8jqlTE6rpuAVnURcO3/G0AW8MixvVeg9SSvsn8XI4BTTJ7iaIDq341iTFPvK6ZpfQ3y
	ZgEAZx8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLouL-00000001eMo-1lZW;
	Thu, 12 Dec 2024 19:31:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLo3O-00000001S2u-3VIR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:36:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso10080705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734028609; x=1734633409; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNTGzlog7Q9IZQyQd4eTU3kXEBDBdmsulQeLjahgS6Q=;
        b=CE2IkEQc+G/IYLuKwwLJjjIFPTt2UQqUvHzyWZI8TtFnM7x6nOSE+bNmfuH6yqzBFm
         YNz1kaoZofV4T6RbqfFouzTJv8cJvsSA0bzMCoqoLo/wI/5NIjGN1TpsBKDZPR77evaY
         HpmyV6TzekmBn4UJsez7karQUbXdBnIkP6OYJYdOhvNqjAn9pvDCsdfWHbS0f6y0nyeo
         rS/hot7UJwhFXA8tV5l4rKu3sI58Ds8p+C6jgPjMLRll+Ail90wPI8nQWzAZ1MBHp9A6
         a0Zt6CtkWriqBDvdKg1TTcQfuT0B3RJHpqRBScAneHZHEFpQq7tI4eUIA2XCy280nwBd
         J3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734028609; x=1734633409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNTGzlog7Q9IZQyQd4eTU3kXEBDBdmsulQeLjahgS6Q=;
        b=Ndr5mW1gvWKoaDikvD24DG5uNGPjkn6n89T7oYlmDX2zFvapYvBDgzltJ+Edww12Y7
         2l1EAz7u9kTFdYmFSgz97m92lUnP4ZpiRavboA7ZTmLkwHfBi90tLJjBIHLnY6hJCxA5
         OPEE93FT6jvtRT5GE445P1Z40m9gVzt7nxD+6FpLBYia2TOcb1GUzzytT20/wFKHpc7J
         TXYDKhOOgWrNwkg7IEyWWcfUjKGIvxCnS0CpLty9nMo40ibWZx9BNisJcqT1TZPBlpgs
         k/X7xFF4OT1kGfP/YnsP44G12aibwe5g0vD6saEkrk7nmASZbPnQWcJD0vohnDjWma/T
         LKBA==
X-Forwarded-Encrypted: i=1; AJvYcCXMytamZXR8blBDkUaCxOg2BVKVk8paLmYDmpjMG+6+qH9ds5V2oUMfDc/NDP6Qf7yiFCw/UVexoNQE4nH+ZOAs@lists.infradead.org
X-Gm-Message-State: AOJu0YxNFI3+xGRFp2YIrv9P7sjmBEP4Lj/gY694EAEwTxjG3RwzLEdg
	Pc4nlA15C7DXgISkKIOWPv+iMPBF9FsOtLkCXfWw+j6mcoBl/kkGV72sCvO6jVc=
X-Gm-Gg: ASbGncuxD66NzpbHQDq0wYrbzzNxfLHbTWA4j0YQ+TUmAm+aFs71r1kmEXqc8KWfkys
	kiFMmGRC25B/sZXPkJEbl6EZsdPFyn+fZcKveJGTYBxtGzNdqXunwckXGX1ApSCBtVbkpiXweOI
	2r1nS+lD6AuJufkmAtNQG6M7Vn/1g65N42tFODkKamELD8VYThwqaLOA0G1g0zp5sXl1u1H9fQ+
	f0LBVC8i43bZu4BDPPGVktyOC1jgp5XttAiv5+HIIGUkp4G
X-Google-Smtp-Source: AGHT+IHxOChpNRcv2gtV3EutMkkx5eEcKsuaWzHm1MNie1E2mh6dZNeg/6vYwQX7jygVWMDmg6R6rw==
X-Received: by 2002:a05:600c:4e49:b0:434:edcf:7474 with SMTP id 5b1f17b1804b1-43622883cd8mr39952895e9.33.1734028609546;
        Thu, 12 Dec 2024 10:36:49 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436257178e3sm24651995e9.41.2024.12.12.10.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 10:36:48 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 18:36:34 +0000
Subject: [PATCH v3 7/7] arm64: dts: broadcom: Remove intc controller on
 BCM2712.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-dt-bcm2712-fixes-v3-7-44a7f3390331@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
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
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_103650_892640_C10E2C4C 
X-CRM114-Status: GOOD (  11.96  )
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

The brcm,bcm2836-l1-intc controller isn't used on this platform.
It is used on 32-bit kernels for the smp_boot_secondary hook, but
BCM2712 can't run a 32-bit kernel.

Remove the node.

Fixes: e1417095a139 ("arm64: dts: broadcom: Add firmware clocks and power nodes to Pi5 DT")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index f42fad2d8b37..9a426aa27c74 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -221,11 +221,6 @@ mailbox: mailbox@7c013880 {
 			#mbox-cells = <0>;
 		};
 
-		local_intc: interrupt-controller@7cd00000 {
-			compatible = "brcm,bcm2836-l1-intc";
-			reg = <0x7cd00000 0x100>;
-		};
-
 		uart10: serial@7d001000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x7d001000 0x200>;

-- 
2.34.1


