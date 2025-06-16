Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE1CC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 01:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=; b=XHTOvcljItSGLNX2n89aMpxxxc
	RGp2/sKTwSzLN88Q5XdgTVLHd3HkSFkFEYUDVg7ml11aG3gqCrIDHKfARljauHyS/IDDMYFhUD7Ey
	PJt0v34EiLpNEGsYVHl3CTCk2wmk8B4KlsQ9vL4320/cPL74FIH4Hzjk44nvjH6QPFmVSzV9b731e
	7O39yX0dNyZfgj0RJBdH0efAX79wLrX9qde+Bf+Wsdv+2iFB9rr9tOY2tGxlG/NMyXlJm7QnHJFdL
	yZiZdX+nZXYxe77lxy4sbtr5pgDMkgZnWneTExGjorGDUCPJQprnwCC2Sv25uSnNzt6wd5fubiSJh
	6bHaoP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyoS-000000035Pt-0C15;
	Mon, 16 Jun 2025 01:39:04 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQyhx-000000034DB-1cnQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 01:32:22 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-235d6de331fso46537805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 18:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037541; x=1750642341; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=epnmeXE+Xe8lyWDPJ80+FEZukNKSf0NU5cAXyJkBL52nTIH6V6FSLTFWXndAi8xMUT
         LkMLSl9Fs+Pk1M2Q8egsw74et7qwJRwFPwr7s22NqEQBX5ZVr4pFvsP0WiekkYVoCzOw
         K/c/MN7BmkFynuf7NoOL2kbDVmo5S2oBWbr0uXhZOT0Z8NfJMBzUCVvRLSzMvdY9RhLe
         8LXWkuARrQZOr9y/lauyxEhIijQb83NypWnjE6mTrLp9O6clw5lhkwdCtqmcPhw6/IcP
         v06vfzWtWZ43oLNYyeHzO54p6s5oSPlj4CQmRV3ArsSfLZiPRbKElTJqxVgRKw7N092U
         +vDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037541; x=1750642341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xedAeEvApSvQrplSU1ekdbA9NGbHkG9Nteo4ChiFRyw=;
        b=tM+jT9tHf4ULWrIzvvenGb9n8QAZOvKKtlj6cCXjIvYP3qEL/bfRDNNVCKJplZEECE
         tYq7BmC8rR9lj/KVmU5ZFtua2JoaFMekz34xY7hqEpM71qYVxkA/4QzIpHnlEYTdt6ZN
         8W1g6WddVjCCV2uafDYET8o/OLueXOihvWQ2fJzmSfIyq6r43q/BD1d6/txm51SFgaDQ
         xbEeQPmwLoKfPTGcUehEiQ9RiLCZsy+cPTsFLlXHekdRjkIWYAZsmNDiBZB6fixX5s+D
         LiyIRZ2/j9J4OG9he3T+ZZ0S7VMrOngMLrMBxpYXiO0z+OUfSBfn0XkgSdud0hzSHKP4
         JEGA==
X-Forwarded-Encrypted: i=1; AJvYcCXoFNMbF9FZPcNb/CFk1TYDZnXizrWOuJqhfBrNtS1FTd6AQqS1BuqKmDpF4Qsk/71Q4q+a3ZhR1uGhtnS7LOh6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx5D2t5B9KmEwsKTlx33qVG6JiXtTCQQsPyDgJlO2c5D5BqTJf
	gZBQCzdh4VpAjOmjo7Yt1jOFiOM9SDaDs5pi5lY7gFiRJRPOiqagaARj
X-Gm-Gg: ASbGncuBqcTltphkuo8ArJQWStlHMyb9eozBpOZCcKFWemoGnweBRSaYnzcTUMLBXVe
	eMK9Nqw9ehzAAVSClMK6OVRnbE6oGXVp4jAWGQptlVFe6D+7kBckS84IxxqvmPvq9XNvSU1+uE0
	wXVYKaLFeOfIi4nyx/SDVoiSNkxDGPwiTiPxWooyx2V8lRX1LGpz+KqEtX5B/obwPKcI8r8PbHt
	LjVW1Wl5OBoP2ikaU/y4YG9hDthNYYV2DDSTeYAWd1FYNIjiYQKJLN+SbOMVGEr/xiiZzn9P+iE
	2K+kE+v2mXB0P7n03ziio4S2BYkNVKgedZzqu7XqaszXSLj6plNOL+RjZm+owHF2ZXimfQRr4Zy
	Hrwk=
X-Google-Smtp-Source: AGHT+IFISDWBL7BPw8cSUkGaFEbifD6DnUVRGFGlmdHKDSr0FEa14n0OgyU9SWJHrR71gKoWz7K7Ng==
X-Received: by 2002:a17:902:ea03:b0:235:ef67:b595 with SMTP id d9443c01a7336-2366b14954fmr120715055ad.35.1750037540464;
        Sun, 15 Jun 2025 18:32:20 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:20 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:31:51 +0800
Subject: [PATCH RESEND v7 02/21] drivers/perf: apple_m1: Only init PMUv3
 remap when EL2 is available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-2-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Qn+UBxFKpVtKUsbAnfhiKrUYfNaGPfBOlGOEhF8eJS8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QW0RWxD6BW94sGBJvu3l9l41lpp6YjR6y5b
 L13ka+GzEuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90FgAKCRABygi3psUI
 JLfyD/47l3DoVLnVWlN7rfaCtVBAT7NOIUMhhRoueqjpsc5Nr7uxPFgcQBPxEwuCd9zKs5y+z2Y
 urnBCkgvo/EwrfF9IsTpLy+eIvH93tKRmc6mONfBTE5Tg1cQW8MyGVQ6VcTiArNIZ2PKmNz5bh0
 DbUCg3dtH61/hoQqSQQ0lxv8jaFZ6v8/d4bXmXbzpVCTI5EOQDSRxeJYUvBOFGnnDv9e2ZQ+Hjm
 t443NbhyFB/p6afW2FOXWq/SaNW8IJednDByrfUtIG5TMLixf+c+H6bo4/LX7XgDmVdmMkGPWaz
 VsXtP5B1xvdMxv3PXc8YoSvg+pwwQ8T9IVFN56OQ4vIdG0asSJa7FaYclMa27dR1pzMVRmYbQu2
 9/7q4g3pXyesglP+GFSANYVT5nR71/eGDq2nUU2pwv/LDX0hdlkNbdZifAOvXIm67ktwre5sohp
 LW1l226gL8XQhoUBCxyKI9alERX8/tEkwnxOkWB4sbico/dLFXR9KkyQZkkCtOCwzE/394jPeK3
 11AgrKtTjvADhxLX9CTVYrYw1PM280pMU7KwG3xYhnBWAUuojdfdVSXD8MCg/C04kpNidgWGSgj
 86nZPOmShxVZyMmX/7F1dtmlCZnCrZp8BmO8IYjj7Hoqd0tKahjHA/kQIZ9QiF6wSv23fvFrNiW
 9C8DWiYD+nqNMuA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_183221_428297_17B8DAC1 
X-CRM114-Status: GOOD (  12.33  )
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

Skip initialization of PMUv3 remap when EL2 is not available.
Initialization is harmless in EL1 but it is still a weird thing to do.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index df9a28ba69dcfad6f33a0d18b620276b910a36ca..b800da3f7f61ffa972fcab5f24b42127f2c55ac6 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -646,8 +646,10 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
 	cpu_pmu->reset		  = m1_pmu_reset;
 	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
 
-	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
-	m1_pmu_init_pmceid(cpu_pmu);
+	if (is_hyp_mode_available()) {
+		cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
+		m1_pmu_init_pmceid(cpu_pmu);
+	}
 
 	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
 	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;

-- 
2.49.0


