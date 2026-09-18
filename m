Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982A1C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0V52zqrzqSXOjtcPE4YmALB+veTpIXrkLmMEtjpOEI=; b=i2Hsnd4k4Ufrr9FjfEkyPF9qCh
	8tJMf3q7DN8+Z3sWBD5ytqWWGVNdiPArTT0b/H/bVqrs5N6FzIzZyold4BXSgBGt/QJEeDB8O7K97
	RkFuG1w28Bojsamd0LwezyshYSXp4iEpYattuE9wXXWtYYmDK+fESEi39z9XwmddC2Pt18jA5OdvI
	5bnLQpGs4YbhnswfuEuuPBwscv1iZenNNncP9xbW1ALM4F6vQiEI29zuijcCeRO656bf93o2N6GzB
	z1nuUWi8lryHRwC3+bpUKhII4soF5aatf5yxsLa3mLNWZEajWQ1pfhSVuoPwe389y0hYSSlDUyYIx
	pQ76Sw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7brT-0000000F6JQ-0gXF;
	Fri, 18 Sep 2026 16:54:55 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7brR-0000000F6IR-2zqT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:54:54 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-398a1676000so902397a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750493; x=1790355293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0V52zqrzqSXOjtcPE4YmALB+veTpIXrkLmMEtjpOEI=;
        b=I2oW0id/vAJuMQ3r5TpPt6337E+Fi8N6HZ0qSPiO952q3Ov+1HxYIANSBHugIZJdpV
         Wrmefenie6MSJhXGiGmtKoU1A9gC6IP48PxkIKVK5lNIYJA1xqXKXU3yQvWDNbF5uUl3
         77rRLH2NGbU8pXH7dXY3efDGxuYIBUZ5h4ZvQ6WacHxjh3Gf2GQPxccAKFKrtfcJ8jqh
         TlBSWxkMFPyG50DnLHfuU0NfqymzkoxTRmMtHFTZlvbUOEg4C5JP1QeGIf5Fkm2i0HAz
         YdWOHBbsc1XDWXeflEy+PTgXzhdaPv1TEx70B3hwgTxCurUIb6psi680dxj8F42fx4dj
         gShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750493; x=1790355293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g0V52zqrzqSXOjtcPE4YmALB+veTpIXrkLmMEtjpOEI=;
        b=vm39V1Iscdv062pzUS4TPqzUhM2reGWhGIiHqOoWRG44oqfNo/CkC8GI1aYNp9wR6o
         2eaw0b7ERNTt5u08lKCoGNdiHD/qJBP+Os1NKVBf9Foep8XOYKod3w58PfjuGxzKG+Vn
         6oTSyuzax0i6vDisb2UCDTV1wk/YOV0/3VCt6RCJ3bl3u7xEv2gLCbVTD9Rw2pIaNpdK
         zxi7upvbGGA5vaJ2/pTNi6az1oe4SiB27uS6g79EAEOQctIBYCxjWMgcb4zWcrgtTIeo
         Jeq1+Hs95kDT5rELdn3BtXeq31vFw0JizU0QPdRScUq4+lhG8/YuuLLYQiyplvsPSZWV
         drRA==
X-Forwarded-Encrypted: i=1; AKwUvByUWCn/HxXSFDuTOZGV7K/MT2BZQfL5wgnofjQp3xvphgxBpJ9E55IoaMXTYpTK6zbvbplco1k//IX/P3qGXZEn@lists.infradead.org
X-Gm-Message-State: AFuF++n18x8ziPB3j8dc3BSMMMCn1MMNFlo98rlC03GpbnivO/IG0CJu
	EZ54A1ByByT9Bat4opDgBGRf72IZJP7us9kfvjs4YzSkEdzaPqvln44z
X-Gm-Gg: AYBFou1jP49GeyyZFeusR0Lb09ED+aTykFee+wU6nvfq1Z3ZNcmLce7zATKxEgGx+zD
	iBVnPqFZBf/f27jU9qOIdYAv36Eg409Vga1bdgIWhJhlaIaA19SMDW8RZiolqxNc2lqs3/8t2WB
	muuSu0jLiTxXhn4i6XI6b8nfIoI3MpexGRTFq9XV3B7CU7vmk8AXfuIVg3v8W2CJxI20FrHoUH2
	faxBI7BEyHcPfPe8mURM4TJ4WXPyoS+W9wZUc5EpxtctoxNHRHjq80zkSuN7KHKMzx8uZi8OgW5
	7Joh2zElZ+SaSc5ciXY7oY2xSgqlxoF2AFGWECQYVvSoG36HRcqeC+eLXFlNLgnnhKhJ9WrFizy
	LdynjpS05dWU3HmC7L7yAZ9ULp1b0bRtLWYW65EklGKSO3u2lwUaWl8Y3bMCO0p9/YlGRlsuLyg
	oexdqf01nxQc7ZxJjFHoasTV8RMb7q/TDNHr+1cPYvZi1PcckOz+vbEdyp9ZGWFYoXRD4dpnPS5
	g==
X-Received: by 2002:a17:90b:4403:b0:39e:6a81:f34b with SMTP id 98e67ed59e1d1-39e6a81fd03mr775333a91.37.1789750492700;
        Fri, 18 Sep 2026 09:54:52 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:52 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 3/4] arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
Date: Sat, 19 Sep 2026 00:54:13 +0800
Message-ID: <20260918165414.1129076-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918165414.1129076-1-iuncuim@gmail.com>
References: <20260918165414.1129076-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_095453_752226_7216562B 
X-CRM114-Status: GOOD (  10.60  )
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

Add the pin groups for the I2C0 (PH0/PH1) and I2C1 (PH2/PH3) controllers
that used on some A523 boards.

Assisted-by: OpenCode:DeepSeek-V4.1-Flash
Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ff..0ec5d19f7 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -147,6 +147,24 @@ pio: pinctrl@2000000 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			i2c0_pins: i2c0-pins {
+				pins = "PH0", "PH1";
+				function = "i2c0";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
+			/omit-if-no-ref/
+			i2c1_pins: i2c1-pins {
+				pins = "PH2", "PH3";
+				function = "i2c1";
+				allwinner,pinmux = <2>;
+				drive-strength = <10>;
+				bias-pull-up;
+			};
+
 			/omit-if-no-ref/
 			i2s2_pi_pins: i2s2-pi-pins {
 				pins = "PI2", "PI3", "PI4", "PI5";
-- 
2.55.0


