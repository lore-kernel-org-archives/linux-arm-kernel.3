Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA8BC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 11:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5riwbZHq+AMgQ552tOielo/7w+UwrIhHqPxa46W+qA=; b=H5NCcBPPQognQJUGuRHBl8vti7
	ZXcevDxOM41QRZvwGgpWeGrWEv3w66sbGlQkFTfr12a9AiCwgmodxdUToAgeTH6hyBRwRtfYs9ohx
	aCZGSctte1PklGNRBsWPBr8fZpR0mGecbnIMc4ff4zARMYiumn42OmGi4+xZr5dSdVPbbMCeXUTVw
	EOCPFHgsj27V0gznl0FPrFKXW3hJmb/RZLuX+hYerwV6yQAZzp30czlcMW1iNnqbSgGHNKPeDnWYP
	RWpr6SEL68m3uT9N6d/6KJL0v0uQmBMg53BGp6FBjbz+gGkuXCd0EMqs4JtrW6lsDNX3GK0Uxqh8l
	PMi34GKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIh7-00000007rjf-0SkS;
	Fri, 07 Aug 2026 11:24:57 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsIh0-00000007rfL-3HvW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 11:24:56 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-848643382fcso3618617b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 04:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786101890; x=1786706690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5riwbZHq+AMgQ552tOielo/7w+UwrIhHqPxa46W+qA=;
        b=appvmyxhbFnqO1J7bfMi3WNv/rYpzKVg6uPGhOkoPRV27VxMaHhTyZMQ2XY9JZ1nWY
         8RdXsqw1jOKVafWKsbLa2nfv/UKtCpmDGyYFNZKQeHjk9qiyfh5VCQuWDqggdnqG/jOf
         ant/pku/HVUO6zflFiG6aqgkOlTMrwtoSKqmjdMIiH40a9WLKZ4DnAo0/O1gC4bZGaMd
         phNxEBqCZ9ZM/KjRwOgz6QctRdYBiaEIZttwL1Nin1859OCVoi+Nh/ArBgTZOTxO2LLh
         2zCT68LWT+RggeebYBTDl5MwQhMwy+p1u1Eb3rtZonEz86ScTbmnBRX/yQmxii66IEc4
         cQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786101890; x=1786706690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M5riwbZHq+AMgQ552tOielo/7w+UwrIhHqPxa46W+qA=;
        b=EoO6YNGiizJvgHz8iP3n9jXmj7oTCLVXH5+R2I7thSxRzZM1231qzz3uieFGVoyxm6
         7Czr9VoheKm5yZSZ00gxEzujN9MOBv9gTpuQAQFW1rNN/qOQBd1j7kZK1yWKz4SfYUp4
         ijfvJ3rHl2u1MOBsC1dbs+PeOJASeOGc81sgX5248nZvAqtW3ZRJl8hg1FwkVdaIfCEy
         dTHUhq51ReVqtuvBdmKyYnltdOGYKcoDzrLsbA6sfwyMyNXzzfNYutSUXOL4RIvze2+Q
         W5MJHLJIuRb3GsOANh5jfiV8+UhKqpE1acc9mEdA8iyJ8R2WvYG4fXDiioy7ciie7Jq9
         INSw==
X-Forwarded-Encrypted: i=1; AHgh+RpitO/18+wNkLvPMSXJ6Nhg8Zell2Vzuve03pew1q0wiHTKIieZd7pit9vM05QCioBTQ9ku4r5x4ggWBn+Xk7MH@lists.infradead.org
X-Gm-Message-State: AOJu0YzzP/FSoxPXzejsHdq4+HWhBLCJxjyDrVpDeVQjBXsbL5Q24UEf
	647BOzcfgkT957IDiih/ZTcWHnz1cjaX22RvuDpAbYHUojzQjQn8PJs9
X-Gm-Gg: AR+sD13cV/lLDofGu7c+O9+z8aii5mByOlIr1+92p5c3Cwid6+vmcQQ8LswpC0lb/KH
	lFOGrKLc6Y8OekgamVuZwjdlagMKrPhWFu5ilc2A0JAl341Ur+oVzLJjXAZqMYbI2dlBj+1x7nG
	j7KxXhvYO0OmH+RbrDI/a3u1yNCFS/aaHYabzzren8l3zDjtxTE+v8lpiB6NJBPvInao8zLfVc7
	ssAZck2cwrmWnS216cekpMj6I8z7CZfiJ0lwZT29OOXwX66U5ntq59zFwznpen+R8fSr3aF66HB
	ZoY5oxzF6ml0ZSqNbphdhQNYPml7IVvwSL9NedymDh4UbC9EufgI1E5NMJkkSChGJNms9wqcRZH
	ftU3QaLBEZGtUV+NM/l6oW50sSgf9LDdWWEKwj/vDr9gEtLzXREmW8UMgCQRwyuKZC+BnLsswEM
	VQI4RCpuc04qYTVj28I1ybe4eHlY+k2mhVxVH9BkwQDoozk3vMNdw8RjoST2Gd0FxBHwNaEr2gE
	zCWtCYTberRk8Df+C2tgJeDlxgrwZfaW8Wopg==
X-Received: by 2002:a05:6a21:46c9:b0:3b1:882a:607b with SMTP id adf61e73a8af0-3cb85e6c917mr25902715637.22.1786101889728;
        Fri, 07 Aug 2026 04:24:49 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:e1cd:daf4:8fac:b7e6:4f37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199bfd8sm6349351c88.2.2026.08.07.04.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:24:49 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-leez-p710
Date: Fri,  7 Aug 2026 08:24:32 -0300
Message-ID: <20260807112432.49685-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807112432.49685-1-festevam@gmail.com>
References: <20260807112432.49685-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_042450_828624_2BCEEFBE 
X-CRM114-Status: GOOD (  12.36  )
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

According to brcm,bluetooth.yaml, the correct clock-names to describe
the 32768kHz Low Power Oscillator is "lpo".

Change it accordingly to fix the following dt-schema warning:

clock-names: 'oneOf' conditional failed, one must be fixed:
        ['ext_clock'] is too short
        'extclk' was expected
        'txco' was expected
        'lpo' was expected

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use "lpo" name instead. (Sashiko)

 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
index 2cdc2013c320..c449eaa84edc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
@@ -588,7 +588,7 @@ &uart0 {
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		clocks = <&rk808 1>;
-		clock-names = "ext_clock";
+		clock-names = "lpo";
 		device-wakeup-gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
 		shutdown-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
-- 
2.43.0


