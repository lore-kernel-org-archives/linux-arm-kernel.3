Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D48CA5FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wqp7f3x5gi8Fa08DrT1eEvtbc+6lIp3fUU9P0chtfKI=; b=eht5o2L7El3h1CRPgsD95HEKe5
	OjGXz8sGmUCan7jaPzLbWe7SbAPjwPAJM7n/fY4xI6ZhMQL4SlmDgPzL/spNrRGkUDVOYs40jWgYm
	7YZ0gP7E6KlRsEC/rkE89roG2jvntRZlLyd3sDNBeyqZAe6vinmGg/QVn9VKBAnJoyIxKp83Ruuvi
	MHYGFYgmqu0zE5mXA/n+WwGovr/p08XjxvswK2s9IWkMNp3mAsEhcGXkCQVkzHGyw3ZcAdXNQF7sS
	iFA0qrZnX7Yop5blszmCGKr1kdyvhCKLNrUuj/J7rKdB5K+RBZ/bbGQ2M6/PgMrYFFCUUo31810Jb
	MvqX1mWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV4r-00000003A6S-13tw;
	Tue, 29 Sep 2026 10:28:49 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBV4n-00000003A24-1hIn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:28:47 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so11067935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 03:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790677724; x=1791282524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wqp7f3x5gi8Fa08DrT1eEvtbc+6lIp3fUU9P0chtfKI=;
        b=DEu/bA04eZfg73DhWV38qCqTVHkJHRu0C0tXRw88fFCAqKzzSHIFVE9ahTletbda4Z
         iVx26mmQgQMnz/cwkNFPhPsL4g14jc3EC3Bp+BwFgFATspwYeKP8VEIkXJ1Pdas0N0KH
         k89c2tXq15qckY2KAvbf0FFklBXR8fa4zDh5tBtOEjfaTyF5A1nFAAaEEN31qKoeyRLn
         HOFR8YP6kQnNvPgxt8sTEKDf0wFdI5eRMFHyiCmjiPWczd+zuFn44nSlHqpYsZKimVZj
         u0UXm+6lK33Gqk+kKo2uZR4oRmqdIU9UOOywv1QnHbDYM6bfdc8G5h9JVF38QMPYeIiy
         a5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677724; x=1791282524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wqp7f3x5gi8Fa08DrT1eEvtbc+6lIp3fUU9P0chtfKI=;
        b=DcDA4Vp/o1AZsB4SP5vjJgEgYQqK1gMmC1Fd7H6FJDmVUGYAItOAcqJWcgdrHp+GcB
         HmWgnhthMT+QJxUlGtI3vL5ApLFKUVh/OdqiY2FZ0HK7pc9wrIRgKicxhpadoQ2Jlnyd
         D7Jp1+L1hcBOjl5fMgt102sCZm/IdgswRHcWbZD6YDmfDBvwrho64KX4PhjRcN+648rF
         D5ItFX3sT8cQPDtm6A9YBd2JptKoJzfqPALdIVw68j26PbTZuGmYfyD7w8ViwfoJxthk
         PfhEVNRvweHktVxSfqKCs4udJu3Sq7kN66loM80elDvB0y2+rZ+iHSWlXYcQ1stbvpII
         MR0w==
X-Forwarded-Encrypted: i=1; AKwUvBzqy40BuFIJVS7MGBOn6lhZvX8Vkd4SlVWd8XGq6jhwHzaXirehPy4PGlP5LcQEgCchq5As+sLGNE6S78EFzTIg@lists.infradead.org
X-Gm-Message-State: AFuF++lTnqYr58l9IE5R9qKnLDF/HVXn3IlVLTVfdXKf0o3vJKLKl2ki
	f5L6F7xkkhzRkRE1dp+/R11fCCrFa7wY+22MQ7MP2xpK9vVSp9IF2/Nfu3rSskGGWkc=
X-Gm-Gg: AYBFou34rlgMnC+TeYXQaC6x7YhDxVR0r3wz1TfiF7BRV4UOGNOAZP5UYxLvOXVbckC
	3aniM6JzFhpN0lMcBBbXafwmB7dGgT1XQYmxj+0V4RrpRGNgB53Hzz1P58poFC+usWEUd7/FoeL
	uroQJZKm9GnxFxoUwz0BwwR577AHfVPhundPuZg0ED17732/vv8d8913wom7eUj/8LfT97XHWul
	Z5I9CTFnMHLhQUpA48X+FPveWBX9He6lxqNTy4ei/8zx/KiNPbCoV6h+JY5Gr1ZvPDLiSafZmDb
	+jl7HlH8K16aJCNRhcVae7ES/e+AzxS+iATuhk049HIBmBgDN2d78Ur2adAyUT2W2vAihV/zN1w
	0RwYaI8oGcU6uzQQJkV2AQVQH4ASkiDvIvJujNnuRHAit7AEz0cif7Y1SzbJLf5YPZuaazmbbBi
	lvrM0OXctj9tzshnTqcEjy7iklSzKEUJhhJLe4BevndY+pjNbF1jrb8N3t6icNupFSfZXPVp5b2
	y0j2wueoIGGGnexWI0=
X-Received: by 2002:a05:600c:8718:b0:49c:fc6c:be08 with SMTP id 5b1f17b1804b1-49ff06f8316mr198386125e9.31.1790677723751;
        Tue, 29 Sep 2026 03:28:43 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm66579305e9.15.2026.09.29.03.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:28:43 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 29 Sep 2026 14:28:21 +0400
Subject: [PATCH v2 4/5] arm64: dts: rockchip: add reboot-mode node to
 RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-b4-rk3576-reboot-mode-v2-4-5a34ca72065a@flipper.net>
References: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
In-Reply-To: <20260929-b4-rk3576-reboot-mode-v2-0-5a34ca72065a@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Shawn Lin <shawn.lin@rock-chips.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014; i=alchark@flipper.net;
 h=from:subject:message-id; bh=7swkMqPaYDA2lMwF80q1xxmYZJyUeDGGLHz75wJEGRc=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtnnRxhxTnvOtxPyRcGQ3fxJrWGafOslgb+c/oYvNpi
 YgTnl/OdExkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV+14z/FP7sOKDnOvU0vau9+kKW9L3Hsl2X/Byh7Dif8U1fSfWrmZgZHiwzlP
 pbIz83R18W15f8n6uNun4gvXfzbv57ewEDBrM/JgB
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_032845_670224_E42D2B9A 
X-CRM114-Status: GOOD (  15.19  )
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

The RK3576 boot ROM chooses its boot device order from PMU1_GRF OS_REG0
when that register holds one of its magic values: 0xef08a53c selects USB
download (maskrom) mode, 0xef085a3X selects boot mode X, overriding what
OTP or the SARADC strap would otherwise give.

OS_REG0 cannot be written ahead of a reset, as it is cleared by NPOR.
Instead TF-A takes a request from PMU0_GRF OS_REG16, forwards it to
OS_REG0 and masks the reset outputs so that it reaches the boot ROM.
That register is the one U-Boot uses for its own boot modes as well.

Describe it as a syscon-reboot-mode node, so that a reboot can carry a
request for maskrom or for a particular boot device. Under Linux, for
example:

	systemctl reboot --reboot-argument=maskrom

Requesting anything other than maskrom needs a TF-A containing commit
2a97ba20e901 ("feat(rk3576): forward any boot ROM boot mode request on
reset"); older builds ignore those requests and boot normally.

Link: https://docs.flipper.net/one/hardware/rk3576/boot-rom
Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index e87ace5d05e6..c938dbcad712 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -881,6 +881,42 @@ php_grf: syscon@26020000 {
 		pmu0_grf: syscon@26024000 {
 			compatible = "rockchip,rk3576-pmu0-grf", "syscon", "simple-mfd";
 			reg = <0x0 0x26024000 0x0 0x1000>;
+
+			/*
+			 * OS_REG16 carries a boot mode request across a reset.
+			 * TF-A picks it up while resetting the system, forwards
+			 * it to the boot ROM through PMU1_GRF OS_REG0 and masks
+			 * the reset outputs, so that the request survives NPOR.
+			 * The modes below are listed in boot mode order, each
+			 * naming the devices the boot ROM tries in turn.
+			 */
+			reboot_mode: reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x40>;
+				mode-normal = <BOOT_NORMAL>;
+				/* 1: USB */
+				mode-maskrom = <BOOT_BROM_DOWNLOAD>;
+				/* 2: SPI NOR, SPI NAND, USB */
+				mode-spi = <0xef085a32>;
+				/* 3: SPI NOR/NAND M1, eMMC, USB */
+				mode-spi-m1 = <0xef085a33>;
+				/* 4: SPI NOR/NAND M2, eMMC, USB */
+				mode-spi-m2 = <0xef085a34>;
+				/* 5: SPI NOR, SPI NAND, UFS, USB */
+				mode-spi-ufs = <0xef085a35>;
+				/* 6: SPI NOR/NAND M1, UFS, USB */
+				mode-spi-m1-ufs = <0xef085a36>;
+				/* 7: UFS, USB */
+				mode-ufs = <0xef085a37>;
+				/* 8: UFS, SD, USB */
+				mode-ufs-sd = <0xef085a38>;
+				/* 9: every SPI iomux, eMMC, SD, USB */
+				mode-spi-all = <0xef085a39>;
+				/* 10: eMMC, SD, USB */
+				mode-emmc-sd = <0xef085a3a>;
+				/* 11: eMMC, USB */
+				mode-emmc = <0xef085a3b>;
+			};
 		};
 
 		pmu1_grf: syscon@26026000 {

-- 
2.55.0


