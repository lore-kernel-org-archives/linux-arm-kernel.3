Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFE8CAC58A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQMq4XFtoATrbQB4MivFxur0yQnArRqt8i7j0LTryyU=; b=KFb+vK/3LWLiqgBwFEq3LU/BPo
	HWDweB2MokcXsaF9RORfwJcx2jTtmTdHTdxPz2YV5hmQ+REpic/+J3bmIKjUxlds5mmMxZIBuDwls
	cjTa0XvOepm5h9DoSF8/HlLacb6PVEGY7jkwlxAeQ499VvxiZy5I8+kyYBTbEd4zfk8xJ+hvm4RxU
	BKBGy1maQhdU7Gm48+7cSxoymDkGeAdD1gqqq5VGVltWo/qRixPJXNsz+qAp//xj1diXs1RdUen1D
	c2n+37soh/yLFcKK+yfD/90ngUb3/1vb/alAb/J1Vk9OWtv/U53WvX8lpWrdb3XNrz3f1VV38Amuj
	v1ut6olQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvabo-0000000GqLv-2zVS;
	Mon, 08 Sep 2025 12:04:32 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYg8-0000000GDib-45Px
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:00:54 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24cb39fbd90so35423995ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325652; x=1757930452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQMq4XFtoATrbQB4MivFxur0yQnArRqt8i7j0LTryyU=;
        b=ed25qBjGNqfWUIC51TiGJ3x+6XYK8pEGdGRzLff5oT6kiQpsP6dVCm72qUQ/h/DnlN
         TWxPyPjILC1pwCuQVaB7/y/OKjCOsANboDQ2yE7VJ81MC6CXbVL7w1z5fEvhnyCrlAal
         7a9Q0UrbWFp06DuSDjgZ3YfAWUTrqL0VO374uq4c74EasAWkCCKrDdBrckD82ynzX4Uq
         yabhNU3cMO407kXjHytTpaNnqCzY/NO9pgTtaG650jvJ36ad/YTYm2FIDFnaqX/gR3le
         jdjVQb9YHgU1GL5mdonHm8LDvvr5BIwcwb0h6EhG6hevaTzGrH/LWm+JIW0ClS3uKh9e
         D9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325652; x=1757930452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQMq4XFtoATrbQB4MivFxur0yQnArRqt8i7j0LTryyU=;
        b=lmBExVnoY00+I103/CgHj6nqIv8hH89Wce/gEnqqrO2gyF+AhOwosc8TnOyPfX9cKw
         FGZQjAWVtBpcblghwyNrHnAq50lkfnzAYBgmDj0yosSDjb4CrQdwwzmmgmqoQdUKsyRX
         mbDJRGd63A8phU0NYhwCG2NNvdX/Ic+nh9N/Nw+uaU1Dz6ZSgiVcFvDP+2SwWREVCN5h
         ONmdV+olGaNAPMwdGzd3EkGaMLGxjiqjQR9PlI0n5PfAGTc0YldKeOyynTh1EpOpvlki
         BSCyY2t1ySXZKw11mpqcDs2faUlCuqgzQf6zdm+ThPtvDWmO4JvbsctB/ioBGcQweSij
         V7Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVhUQDWMLEZaeb8wN4Nx6jA/MEkLdIsVRJAyCx24lihfGoM94SDWx35oKzypzqj+YMrc5UULuU1sxc9LrEtxCOn@lists.infradead.org
X-Gm-Message-State: AOJu0YxoCRrlifkCoLFBAbBa9Vlo7FPn/12ZaqHEAxvKgzdH44V2dsbs
	B3hf3CJnMARU5YpFGj4g+WnlIW85ngYeHKdJVDjgy9LaYpF1N8oxzpzO
X-Gm-Gg: ASbGnctMX8lA4BlafPn5NZfQjyGbCRyo+zjXDghSAXZKkTuPFtJ6Y7dHNHpeSSyaA9Q
	u1AgNybYrqC6KgkXg/CLxG3xCBg72U65yaEqc8+yL8TPHg4qle/GOVqvSyYxZoMbsv+8tsJbcim
	ve4lVWrSySaCQNXCjXb7ERs/JXbqrUvedIff0pPkY1LNJM6Ix1hfq651bsxEISwX5kNG31B0rz6
	T4PbM+EdBar8iLzHgRD3RspnWp1ducHwCxrxkkKZ03phWwdvZ/j6m2fFb7wou4EcoEDJWWYJo6g
	QzAz1/QNEPKb6hikIIH+F28RsKkQHtdJ8AbZnk0YM+KVFwhw5miUIwT49PZsUQ2VflgdfslYp03
	kO2WrMRXRsns9fnZs2542fSiGCfn4rGkfLQG60A==
X-Google-Smtp-Source: AGHT+IGl1vTxo4904OtH4SWs6LUChVqEb8VgEVVJCvo1a6Vhe/4uyjIXKuDfOVxqGh5ob3vqwyQS7g==
X-Received: by 2002:a17:903:2447:b0:24c:8984:5f87 with SMTP id d9443c01a7336-25170c4177bmr88762415ad.28.1757325652051;
        Mon, 08 Sep 2025 03:00:52 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:00:51 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:26 +0800
Subject: [PATCH RESEND v8 02/21] drivers/perf: apple_m1: Only init PMUv3
 remap when EL2 is available
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-2-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LWdyJWF3F8SjS8P7dCHoXr3nix46HR/GnW+584oj+64=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlCU22oAvgbtrscdWyafurkYoZy3NYlLu7IW
 hWt7fHK+GOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pQgAKCRABygi3psUI
 JOdlD/sFhoqfCpqj7FgtxcF7snNtZue8D3D79Nk0lMIuUtqH/nory8bTsgP5FO/zDHh+FzhBEy7
 GJUG5aMxsMgWbZ4oOhu4BcJsEnQ/HSTwuGElbI6pqsP4KbDS1zIvx2hOJNuJRGbx6jaB2f3ey0t
 2p6/ABbDkq4/k+u26kcWYqUpn2dIdm60CPY9K+w8ymRjXil5oDJtvofwwxxccAQamA/PDtC9b0q
 V1iGE5JMO009hyP5Qe0XzUMxt9p/Xyep7q3SJy6/njas3ngxGwhm3J3l4W01bLaA8Ah/ClLiWYz
 S6se+MQzcAzrjnvg0UEmxRuIprQ76wagNthUVbO6yJ3MAWWGl8SboRYantMnCentWT5VNddrkcd
 A/aivnWTHEZ2j4v7EiqlW2rHR0j9cCO1DUMGQ9dh8HbZKkTs+Tz2qFw8Wk4tyLZs4+2ld3h7QnP
 NjOm71HU+AcueUvdudSQXiQwFFwb6WSBvdnod6JRmUo5ux5T2oFav2FobmJ9iMAewbs/ST6M/Zd
 VxA2irnqTESdTNa9WiNDiXkriDS3z05nttR2zhuQTXcQmlplp30PUVF6IwTMeL+LWvX5xEl/EP0
 JjX0qtoT61ruclg+NO98M0UvrM2ll6YLMr6gls5yLrceca8/2rMdUo5cbp3nmCSMNd8Zk7tCfB1
 PchvliyKYEioyKQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030053_023645_4858CBA6 
X-CRM114-Status: GOOD (  14.23  )
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

The events in the Apple A7 PMU is very different from the ones in M1, and
EL2 is not available on Apple A7. Instead of assigning the wrong PMUv3
remap on A7 or declaring a new PMUv3 remap that would never be used in
practice, skip initializing PMUv3 remap altogther when EL2 is unavailable.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 81b6f1a623499566ef04d04075752f34e2cb6a92..f3948528e28e0189efd0f17fde0d808930d936af 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -645,8 +645,10 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
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
2.51.0


