Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147D8CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEGvXsceU9JxGTr8iEGiHxb5w1XSn5I5iKljd+zrlDE=; b=Ux7gzuBILqCu/HvYaPcFEMGI9Q
	SHIoXy5RE3sYD3z+FkjI+fuFKs4AeIrmUhvJzMKesv/sqpbsk2VAwkUU8KZO6urNOdhyDrcN77eOr
	LtDipkCzIxaRZXgxJiKcCR0VZsJYfGpHRNdHln+tHPhYp0UGwv/I0s4pbfyVgjQ5fiOiuEdJbXK05
	MgJnhdpvptlNJ5HkLzFotP3NKHlHIqHBRBQwTAP4souGZXnWGO2ZkBmvU6Jr8VBx6Q0x4ahcAeJiT
	5IqQCJEaf8qFz+sRxiwRi2CEgS6LjnP8AfhzEOjRGzMTITCHXRW1CzhjjqzIB8FxyR2yC7oi8OOSR
	MsIjYlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7dd-000000016Jg-2dsD;
	Tue, 06 Oct 2026 16:03:33 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7d9-00000001668-1olS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:03:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so9721235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 09:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791302582; x=1791907382; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iEGvXsceU9JxGTr8iEGiHxb5w1XSn5I5iKljd+zrlDE=;
        b=bFo9ix+73cdtXkYTuLT8/Z8jlkG0DppYbxxZlI7YHGlrZ4hQ8p587QL2UyjECWRP0/
         jMRbk1viNwXTx8nv0AuTfcrE+Y06p/kgaKU93T7TTRt9TjessTCnkHQpGMrS5NyN2k0C
         HJcTI9kHjL7TuQOX6nkOqL4MIPyblteVKNE7FxzFW0A9NvWFc+VSHKr7aydBp89zgu9i
         7pcJlGO8cN/GglqEd62R/o7DBPgUmdRxrLzfXOJuxadC2gOH3lJCvLQXN0i0I+KF4BcL
         WRgkcqgSB9Njke3k1ICfj1vpsTm2bvC/kOJpMCGIMDBnPJLXnXKLGXVGeij7eMigtJh+
         mBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302582; x=1791907382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iEGvXsceU9JxGTr8iEGiHxb5w1XSn5I5iKljd+zrlDE=;
        b=ygovsMLzZNRqLvuuf+dXVdhtaZH0nG2qcc1vQfzdWnius/sgGL5d3cWkxcS6YVC37I
         oJ9ha928RezfUoAvkrDkuwH5x5B2PoAcVLgRMqzOXxbcvdR0scwtWBPusRRy2tiz/P5H
         rAvwpdapIaRL5R4AVVfoJPjMFj1zSEJFfFdmFg5nySWdTq8YbSn5cVtsTRLGvB7rLI7f
         H7rjdeKftECTDqob0BJzYkBhPeGQH2Mu0fAyDQ+OQcwsaNuFOr8yDixEt6v3AFYCc073
         eDtORJMo9fbV842fHQsxfnB3GZDRDYl3zczJbChLJZjSlZLnEyEAAQTAFBu0Ae8Y2+x8
         SYHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwV11TW5pR8vy7X0bIZGnVwRWhXfbqYeoOHC1pkETGhhKahyriTweMd5WOU0byCdSNSe9J3/kFx0Vav8jPX0g2M@lists.infradead.org
X-Gm-Message-State: AFuF++k2oPROc/7pn1wVoSQkcLP4Z5LejIkJ8fvCE7ev9PVXNs8iyjGz
	0Gm737e+ArazxMC2p06/947L4l/9OqzxLhJcBfSrKGL3KOiwUSZGn+djwMqxHeRsfvqHbRIF0BV
	9hbTVSdVTJg==
X-Gm-Gg: AYBFou1EJZ2uO++TuNzxnnHXuHA6mDMlSYmcgoUqFT5UbdyKCM1mZvqZ8dJm2CDky/T
	z+AW21C7A8cEaTF3ROdYSofknzENWG4+erCpdX7DnbRJXPFQsy9CHay4hDt7AIiXc+wlmVcnO/V
	cw4bB/pNx+C65CjqfNY2/EKQy9hE4pBO4a1h9DwcruWcWjGEkxO996PRwtm49Pdek1LduTAPJDq
	2V5h5yTewzWjbg5DU4XedDQFWHXrVry2P54cToQ5GvK8UEPHvp545ync3lFifmLmxefQF+3c/xK
	Tq9oKPrbgb7hfPBCj4t37wcbLZwu7fBo5QeJVQAF3owEVmu1YgfnrVGH7njX3WOcFJhb3X92vU7
	w4NfdrewuWe6YnqDU12bfra0MQZUIwvoDVE6exZiwXbxWj+UQbWuJD2gkuhBB4dI3C+yaapxUYQ
	yHpogAayxCmrfgq+0h3Mnp9tJVdoaHkgoGW0HZbP5XiVGyL01w7+Vw+N+p+izkD4dwxOxHWsJFQ
	wryOuEi46wt043TBw==
X-Received: by 2002:a05:600c:8518:b0:4a0:35c:8953 with SMTP id 5b1f17b1804b1-4a17b527b00mr31622365e9.7.1791302581769;
        Tue, 06 Oct 2026 09:03:01 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.85.242.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm369641f8f.38.2026.10.06.09.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:03:01 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 06 Oct 2026 20:02:42 +0400
Subject: [PATCH v3 4/5] arm64: dts: rockchip: add reboot-mode node to
 RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-rk3576-reboot-mode-v3-4-6edba064693b@flipper.net>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
In-Reply-To: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, 
 Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014; i=alchark@flipper.net;
 h=from:subject:message-id; bh=cuF3exscH8i6nh8FMRwgY1X/VW9bce/DQsITl0lqfwI=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQdlV7DaTPvZdAxBeM899Qjj3Pj12YwbN22u+lOXHPA5
 I4fl2f4d0xkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVd2Yw/LO6u7U1UbdilniM/ZxXqR/PzAiZ7dGl/P1G1CuncE6d346MDAtD+Ka
 cmsEsf3HBspjQ/6ZLjr6tXHzlFOcipY3Myku2TmQGAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_090303_809616_462E0367 
X-CRM114-Status: GOOD (  15.06  )
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
index 9d9e9d7868a0..b40f4176f870 100644
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


