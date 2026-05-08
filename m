Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA93CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=; b=YGmp1L2rqI8+D19RQl+D6b6lfH
	y5gRGFp6ZfOGyozMHMRh7TOg1wwFOc3rqWcBKLASLwFEx5f67RMsA1jRIRnie9bUoAHk1TtWZ2NVB
	F2srLyEZ1kWIw4X7HP2JO63HTj3luf1PfpUuo6I56rX1h7fXXlTq0Bi/o3wtqi7QDbRvMEYWNt7m7
	XTj4NYFg/AOzkrnxwmyw+fsxGfhm5NP6UwWbtbfoyofZ3JyzhKuGnDHxwEb/QZr3tzelxau9u+fAV
	0hAcFyrqZlMrxmAHWU2GNq90ibK/H27bOXvQ0LPCx+jHZR3L2Smvj+Z3+jvqRHOvLj4aSDYEM3MIv
	gzFvJHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN6q-00000006pOv-2JTI;
	Fri, 08 May 2026 15:27:24 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN6o-00000006pNQ-1g3t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:27:23 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso437162eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778254041; x=1778858841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=;
        b=PBuH+enxWd23eaiaYaRN7UV4vz+dQOLpt7mt5dFOLnx2xnhKCsepMbY1zQr8E8qzqz
         7lzVYH+vcQDqSDfvbNR4ZuT8ZZVh8S15SDnBR025ZtukyUhiVtnqZapMyTIRhQnouoGV
         jK2umxKz9LeMwxo09/3k6yyzVIjwVwJVVLwSWcX1ruX2s7wJ0asjXi82m47AR+LjsauF
         vhubv961pIxncTD+my4cr1cM0Kc466MpMvhAJVhsdc3OaMjsoTSI3667r1bl+hXZ7/ry
         2kCAn6rWrumUL1fYPW/f1aEWud7+UDPSgUUCOOHVvU1EadOWFB8IBhUxLmk233/4fXmx
         DTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778254041; x=1778858841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IY5VpH1QCqNL+Hxqm+EMdHN3zeBtEzU6Oz9nJybwNNI=;
        b=HeyYGY3PI8VrmP2lpL1C9y9hmM2h43x8Rt7BqBsENNftklDffyDryWRCnq09YWTZAm
         3zP69JWOsR/LAMjNvt3uRehkn9dLhE/9FTV9AUuL3pE63WaIjikBZDA0efdDZf58E106
         zZvGdBtz+JE2tCPYkDFdCch9Cl15oiyJGfKwcbihK+l6apHSlu3f1YIioSENaD3y/+yT
         cKfcrVRV8J8OhchF9+1o25HXDtx47wvnXxidIRxkGiQnFUSnmkj9Rx0Qd4aszPyi7se1
         VMZKkENDUot53N/fbgAjXH0wIs4t6B/MqSW8uEASdyAmSKFkDqU3J34FApo0dRBEK4Df
         LtSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qSpV2EUxXthbXUZEGdyquVg603kjIqVoUScnABKak/kZu8m77oG+CnHc/Pmgvh2v+ULo1s1wTayGBPfcrBF0B@lists.infradead.org
X-Gm-Message-State: AOJu0YyLg0Gysc9uEnkj6O8txaesTmH4+5kljB5B8yrGvIF3Vel9s02S
	vVjHEfMXtLCaOQeVQ7THagzv8ZQrR2a2W+M7pq3fHKzDeDN/xIpbc5Ky
X-Gm-Gg: Acq92OF04gY2wRegqBsq4dBN7mzty740uOVYKXtROVqAjzCmJmfwr+encVLBPqis6/x
	ckqQi/jvfVsWd5Ms1XooWZ6DTizqZpRxrg/rANoI3MUz5qzJT56qxGC35KBawt8KlbfU5vDIHrr
	7LohQAtYTSwdsa5c/MgjZHTAm1qAYyty1WlwMlaJWnMloIMUa+JlELGSMDFk1kqMDoWR8k6jZXa
	Gy0E0fDPeQYA92C+YuJ/vIdaePu6rllujP7gL75Rpw7q8+dZKX6bfym1N5Rcjxzq/PANJyMpmBd
	FPeFOEjLatglGhQN4fCRY4a1VwEfwHqTSN8tWNSrCjWjF/Jvk0GvpWtVp9op2EzK9mA3HH7Do6m
	3CzZiuoCfwBLLnzO1LNQ8ut2r5rDVuzwP7CauQZleKusVwi+PrX4QjqjTdYEcSFPzf41s2PokF/
	jUQmuXWmeT+FlKU7M0vgv3Z/i8EF3krOMdkYqW2Ki98BY3Vpw=
X-Received: by 2002:a05:7300:434f:b0:2d1:299f:521a with SMTP id 5a478bee46e88-2f54a38cc95mr7218915eec.26.1778254041341;
        Fri, 08 May 2026 08:27:21 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:27:21 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown GPIO polarity
Date: Fri,  8 May 2026 23:24:22 +0800
Message-ID: <20260508152435.21389-6-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_082722_445830_1F8259F2 
X-CRM114-Status: GOOD (  12.75  )
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

The is31fl3199 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3199_DS.pdf

Fixes: 737929191283 ("arm64: dts: marvell: add Globalscale MOCHAbin")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
index 6bdc4f1e6939..cf690a85cc2a 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
@@ -236,7 +236,7 @@ leds@64 {
 		#size-cells = <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&is31_sdb_pins>;
-		shutdown-gpios = <&cp0_gpio1 30 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&cp0_gpio1 30 GPIO_ACTIVE_LOW>;
 		reg = <0x64>;
 
 		led1_red: led@1 {
-- 
2.54.0


