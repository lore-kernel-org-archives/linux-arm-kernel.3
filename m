Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7905AD10C06
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CsVTZGFbY21TI4h6N0MykNeyLT86RRhuXmj+gk/1J9g=; b=p6NlKJwhJVuXJ/mgM10amgQutL
	fGdshb9l9lGJ8cg1ngRelTp/ExBysrkkuC3kt0hVp2NmZI1mb5HznLDque+vSerDE68P7t9r/W62F
	kCcDBvxSpuPwTfUY9sqSozlOqEmRXo7W9R4q0JKZTjE5SpTI2XYfmlj4/UTy3qPoCmIxw522obE1o
	P9lErxgXGJrfk6pyCnlgQbbFbtje2CwstOBdUON+sUTt5VWE+etO8JVxM5TyNX/dwC5RGN6MED5y1
	z41jKn33NOlFck85kuZG7CF5lypUPem/8UaQ7XyZ23nDlx0uWnM4QnDdmk7cnXGqE5vOWKpy/wSE/
	agrr8Y7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nUN-00000007CVy-3gFD;
	Sat, 26 Oct 2024 20:34:23 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nOj-00000007BfK-3fk5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:28:35 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso24736201fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974512; x=1730579312; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsVTZGFbY21TI4h6N0MykNeyLT86RRhuXmj+gk/1J9g=;
        b=NQnvysMpQOzb+l8mOmeyP3lS4xM7CffjYwiIfimtfRHViAPgd+F2dKWoDXR6MDUGIa
         kabXEBmPOIUAmcEF6HmNNCXUO0Aej/4iyziIa5nb/d6vD0nSBQ81FK2aicP5es3r8Jsk
         Jd1LvQvEhxORmSNI7U6u+8UAaJQS7JRTlmUivMuhxP6c1JCNp+igj0w4mEgZlbMFIlAn
         5FCPzJnL7AaZePGmv8Hib+IDZQBfzI6c4OHhZMXpT9l88qlM5kTG53Wx29Q+J5cu3h8f
         hpO1QfDmsPdxZPPdFn2Dg7zD/s1IXyM3HT2cdfNApCBGnV1O2jqig7BVZG4LKPTGDvK7
         hV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974512; x=1730579312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsVTZGFbY21TI4h6N0MykNeyLT86RRhuXmj+gk/1J9g=;
        b=QFtNU+g/oYaNseImCOjBT+DP9cUhC6+OGUGD9cQk0LamZtUX4q98Gf/97iB40lFNQm
         FJJotgv/upC4s7qhyX09Du2We6uvEP4MMcITosvPKGKjpTfeoLbu5kauzBtVWQgsReHr
         tXJ/JK151NK66l13qwbSUSbI7RE3Blzm2BiyNxtqooM4ebSUnK11TWlVxYkyYo7pSDoT
         +m/+dljozsSBYkspEIEmt/hwuMpTOv7A7iD+0btsK83fHxK2fwHHg+IAvlwFLVd5qqqq
         zIaIKFphKfiFX+72/aSIANHmGj+WzbwyuB/aNH8neViCmizLPJysfpNizyFxKjZsZn84
         97gw==
X-Gm-Message-State: AOJu0YwUGpW8B0Cgu8uhBLLSSS+Cb54rqHHtk/YDWqyS8Zn9cMnp3HOj
	680zVPQadhZasM5S+HfF6nO5S1jecUIdrNztPeueR+Efwo+a8ID8
X-Google-Smtp-Source: AGHT+IFkHMcqEsYsUAhbqWkX2bkPWgakOe470h23dN0/WTOTTeXfHC6ixA4LqqD+dEvAB0ZuXSb+qw==
X-Received: by 2002:a2e:a78a:0:b0:2fb:c6e:9a36 with SMTP id 38308e7fff4ca-2fcbdfc6495mr12308581fa.24.1729974511392;
        Sat, 26 Oct 2024 13:28:31 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb451a494sm6370421fa.39.2024.10.26.13.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:28:30 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:28:09 +0300
Subject: [PATCH 2/2] perf: arm_pmuv3: Add support for Samsung Mongoose PMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-mongoose-pmu-v1-2-f1a7448054be@gmail.com>
References: <20241026-mongoose-pmu-v1-0-f1a7448054be@gmail.com>
In-Reply-To: <20241026-mongoose-pmu-v1-0-f1a7448054be@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>, 
 Markuss Broks <markuss.broks@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974508; l=1399;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=J394BmadQmA1BF0F092yR1AXD6HdCMt8v36z3hVLWCg=;
 b=jMGqUvYaEE7eyVFSQzLzTFOFSEqQJZ5vGtuufroNlKvgKvDnsS4nuhMCzmHpP5IIzR/Nupmm3
 dSciX6H/BsmDkAhEovrMcL9ZZapBv9dmxRWHNFnn8O/t3Aik9GRMTX2
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_132833_942143_1B359F28 
X-CRM114-Status: GOOD (  11.14  )
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

Add support for the Samsung Mongoose CPU core PMU.

This just adds the names and links to DT compatible strings.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 drivers/perf/arm_pmuv3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 0afe02f879b45a8600b9cea1bfd88e6a68096a67..9eb5603e1dda18c4bdd2745304737932a27fde8a 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1364,6 +1364,8 @@ PMUV3_INIT_SIMPLE(armv8_neoverse_v3ae)
 PMUV3_INIT_SIMPLE(armv8_nvidia_carmel)
 PMUV3_INIT_SIMPLE(armv8_nvidia_denver)
 
+PMUV3_INIT_SIMPLE(armv8_samsung_mongoose)
+
 PMUV3_INIT_MAP_EVENT(armv8_cortex_a35, armv8_a53_map_event)
 PMUV3_INIT_MAP_EVENT(armv8_cortex_a53, armv8_a53_map_event)
 PMUV3_INIT_MAP_EVENT(armv8_cortex_a57, armv8_a57_map_event)
@@ -1409,6 +1411,7 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "brcm,vulcan-pmu",	.data = armv8_brcm_vulcan_pmu_init},
 	{.compatible = "nvidia,carmel-pmu",	.data = armv8_nvidia_carmel_pmu_init},
 	{.compatible = "nvidia,denver-pmu",	.data = armv8_nvidia_denver_pmu_init},
+	{.compatible = "samsung,mongoose-pmu",	.data = armv8_samsung_mongoose_pmu_init},
 	{},
 };
 

-- 
2.46.2


