Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E0FECD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 22:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VVS9U0UK2IIxJF55elsvQ+90uQ+p090ADnS+1Vo5OFY=; b=GXHDgG0D9A1XTYZMmHFMU6VLsQ
	ws0R+BZm2mz7+5BFY6vPnQwV0cfNnk2Rp3hJumC8k4Z3AgiONDPtr60ZZFz8DNn14lsfPW/MnCj44
	I4cPlGQXQGTDmYiw7UMAsrxoWRKJ+U9yHLhW472VQHQAQOyq8kSWA67sBlavNh+cPZ1AUG7cEeVYN
	1mrbdEiZnAeAKCAdZ2LVJTCn5W+Hk5j/EDNzp686kRSVeX182xfzx0ryXWRJ6XTlLk+LMZzlwX90n
	EhcB8gjmazyI/YDUt8tIu17V2hde3cwIMs1fD+nP/6c/9EmDEFX1d45v9WMiKzL5wL/47WzxblDut
	u1tyG9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZG8a-0000000EuT5-29ZA;
	Mon, 15 Jun 2026 22:50:36 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZG8W-0000000EuRr-1n7z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 22:50:34 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-915d64fead9so501199185a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 15:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781563831; x=1782168631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVS9U0UK2IIxJF55elsvQ+90uQ+p090ADnS+1Vo5OFY=;
        b=ZYl6+QIyQnfS2TeGVFTremJ7r7JW2AxgsstIrrncgY6NobpixTP/6llSa2gMU3r4mW
         2VgxEDX5igwSERVCFn56B4NePeJcKSITTf4D6AQ0kaZHPlYOn0NyTFunlsYmdlmGt03s
         1yMa1gbaifLLF5zQoVkO8UhS5euhkhXKuIJ47e9GsOF+XwjxzKZSHGOOu+T4QOhNS6T2
         8PyFOC50FESsQWRatnBAytmDs4zwmPZsZ7Gq/Pd4JscfySEs2tX5oAed3stwbS8S/oc2
         8dZQTymeq8yoNNgd1U1rUP5lIF8npHyvRDc0ztqkzxBRpn1mHhNv6R+T3umnQqcu81QN
         hVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781563831; x=1782168631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVS9U0UK2IIxJF55elsvQ+90uQ+p090ADnS+1Vo5OFY=;
        b=iS+TCFkkpwpZvgO4zJRvivJ6rpOeTFzJXc6lDua2wVwAoUmjHx/WWVyA83AKsjxReb
         u+BpDMKAD7Rlb86C9YWTzDcZLWQ7s3wDOIROdUqMXL1RNl+XKdEtQEtpVgX+Y/oKUQOL
         aLUPJwrnix3BhNNAhOP8+SumnnA21qn8fqQfCNFI/NStCuQYFWwE22GOjPBsd0+DFZYu
         374zdXVc0ZhIG6lb6bDnsPnYgvi5N/O7+9s6sxJBc+ftwfhpWkwDhbAeqPfnNB3IMtV5
         CW+ZYpZUxQiV+X8XV9OO5wWsoq5HD0HJSRjiZYTXkbt6auBmR7UPFn1qMdsPELInz2va
         KhsA==
X-Gm-Message-State: AOJu0YyzPjCCENUL6zIOGOL8EMZWooAhDjoUGYq/WiMWNukjFrif15tu
	Bhe0l1J0tozpNmLnOc3Obu10KtVE1VMycOTcvmYt+Uf3fPhdt+Qt7v/k/ieD3HuA
X-Gm-Gg: Acq92OF4my+1ouWYAlS0iQE70buPeitPyTZ7q6eD4WefWxLtPYgCYaKpDvHuvW+RPSY
	87Oro/C6cnqN+NkQz+5SRTXOp0KgqhoMj3iwdy+03k4GGh4avRprXcfkQq9vSxJ/zvat2ZSDR4s
	bQivycigleY1A3SQQRz8AXhMPcoL0rbkBAeaiEStv1+6G/PE6REbXNODiMtvBLgWNVaAA8i/YoD
	QfpC+byhOXLIEI54ZZ8uirwskxMVWV2DqwjKjk5DBulP/WtFF+cim35BSDPzqxvJ8l43FPv+yyI
	4Qlu8BAa76auDbbg0CRFqMgJ1Yk1DL2a05dNm5Ga46y/N39eBm+Nbn0jd3OXrOZZaNYDbL3aMbJ
	x8777Psvt5crjoUTQS3PJ7QBnVe3z1aLI8dAbfO5hgARlb2XC6IuH2lTn/dQD7sEpFWE5yFqwRP
	R8rboBi6Mllz1SZlxp1aG/GrUub2bQq+oHmzeV5TRANg+Pr1+/bVU4UXL57byvUSicB4Y1mfuJw
	pKvCSxAfvvY
X-Received: by 2002:a05:620a:4626:b0:915:422c:a0 with SMTP id af79cd13be357-91c2e9077admr216456585a.22.1781563830584;
        Mon, 15 Jun 2026 15:50:30 -0700 (PDT)
Received: from oklopfer.hsd1.ma.comcast.net (c-73-167-46-184.hsd1.ma.comcast.net. [73.167.46.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a069389sm1273568785a.45.2026.06.15.15.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:50:29 -0700 (PDT)
From: Oren Klopfer <oklopfer37@gmail.com>
To: oklopfer37@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	stable@vger.kernel.org
Subject: [PATCH] Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinephone Pro"
Date: Mon, 15 Jun 2026 18:50:13 -0400
Message-ID: <20260615225014.219115-1-oklopfer37@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_155032_474023_3C3C7861 
X-CRM114-Status: GOOD (  10.12  )
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

This reverts commit 096bd8c679185f898cae9933c6a68650fa26ea4f.

Just as with the Pinebook Pro, there are multiple chipset variants for the Pinephone Pro, and multiple firmware binaries for different distributions. The change causes issues with some of these combinations, and reverting it resolves the issues. See the Closes below for the full report.

Similarly with the Pinebook Pro adjustment, the original commit only indicates "further description" and not indicative of fixing any existing issues, so reverting should not kick any back up.

Fixes: 096bd8c67918 ("arm64: dts: rockchip: Further describe the WiFi for the Pinephone Pro")
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Peter Robinson <pbrobinson@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/20260607225901.64019-1-oklopfer37@gmail.com/
Signed-off-by: Oren Klopfer <oklopfer37@gmail.com>
---
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
index 8d26bd9b7500..d46cdfe3f784 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
@@ -734,12 +734,6 @@ light_int_l: light-int-l {
         };
     };
 
-    wifi {
-        wifi_host_wake_l: wifi-host-wake-l {
-            rockchip,pins = <4 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
-        };
-    };
-
     wireless-bluetooth {
         bt_wake_pin: bt-wake-pin {
             rockchip,pins = <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -766,19 +760,7 @@ &sdio0 {
     pinctrl-names = "default";
     pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
     sd-uhs-sdr104;
-    #address-cells = <1>;
-    #size-cells = <0>;
     status = "okay";
-
-    brcmf: wifi@1 {
-        compatible = "brcm,bcm4329-fmac";
-        reg = <1>;
-        interrupt-parent = <&gpio4>;
-        interrupts = <RK_PD0 IRQ_TYPE_LEVEL_HIGH>;
-        interrupt-names = "host-wake";
-        pinctrl-names = "default";
-        pinctrl-0 = <&wifi_host_wake_l>;
-    };
 };
 
 &pwm0 {
-- 
2.53.0

