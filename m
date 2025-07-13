Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5128C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lM8usxsSz+hgDvjepavl+3hVj5I731y8p/a4jtJD7g=; b=jv7Hito9jUMzr3TsWxbWcwBhz9
	aEf2ayIQjPpib6Ca60QE3U50GSDpNYcsY4GWm5OxtxKXUokXFODm8qqqjsPy0Kn/dBaB26fUGMYph
	b3L7WejFXizM/YcSAsplRKUBCW525s02VS/PrHdGcYnOvX+Tb6OhwY4WfSZLnivoeIE6Gj4fGYVmi
	tjLEx0Xaeo9FaT4HzBXW8jtPloT0C+igbNSrkni1d9WWkvu/3zWj2wnENeyhMeAmCi7F/+I1BE+5B
	kJEIC0vJtoJdCdxfFAgKUO7Tug/EV+Z5mS6zolFmwE1/meLiY60/tOfgkFTZEuwTX0VqBUHwXFYZv
	Y65f8KGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uas1g-0000000HWCt-2siz;
	Sun, 13 Jul 2025 08:25:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarjl-0000000HUKr-11xF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:07:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-454f428038eso18833215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394024; x=1752998824; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lM8usxsSz+hgDvjepavl+3hVj5I731y8p/a4jtJD7g=;
        b=A9UGXbgtD9FbKE76L6d6OV5361EVWWtfRZjOoBHldulDZocx1VyQ0kvNuj4vkoy1Mx
         1F6NV2I39w7LG37oL5lwhonaA5WW7/T0u5O22M818HxsD1uDhe71sL1eA/mvlLVcS7bm
         GqGpMO7VFy27+njug3Uetju4R4fryNKMY86PROpETc7n83ufC48p6qKLvK8oMyby7VRS
         LxBciFFQ1H5IvhM0GqyIdYxBxnzfDFVGtvEUb7UjTNZtQKDUWc2H2GiLULr1kfK/nOW6
         yXGO62A0tQeX5E9SWsTyD4Qf9t2Dhs68oIduwojvZBqmhUqv7+FDQ1isnS3Xype6Bvnu
         zFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394024; x=1752998824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lM8usxsSz+hgDvjepavl+3hVj5I731y8p/a4jtJD7g=;
        b=iqM6OIA/Kumlo0E4GCalRTZHLAMiVdHR3UIiULjbN+Gut7pEs+34ClFy8tzvtdE/fh
         WRDCdbSu8B6WNSVRk+dseqf6KlwLe3yGqrTERMtygTfVQ8TeomZ4ckuNlhvhOqSM4Sh2
         9iMUxYqDG511vCd2arKLmiSaUISqkD6SG/RmpXB0kuSb6BDYrvOGay6CgolID8gXghVI
         7GOXDljasJxwcStOt08jIn2EoCiohVFiV8PgcGSR7OqwsS/9ospCKVEX1fBJTRp7KgPZ
         PurevY2IDBeXiF0vfsJbgJOeDbplaJbwIIvMG1irFxEORAtzPIgg9UQNXpfMDYaQzfZ+
         rw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfUMcEuLagPix/e+1WZhcf6xBd+PETEISVMHTPK2qo1ovbGp9bHeqgubC7XVmX9JI8pfueNrMDwghGkRXmOJRR@lists.infradead.org
X-Gm-Message-State: AOJu0YwFScynKoPWVt/SEvs0dGp3s1P2IOq7d3vm1mCCVb4RFaqq9tqP
	TMFKdZCYv+lKfcxEWPAHhuux1L8Dy/FdmxQH2WgkLxgvmbvgell99dWHPszOw2/NFFw=
X-Gm-Gg: ASbGncvYIHiLuHgK/xEn/F5u5cGZROmYHBUybg6AQVpe6VZRKpdvN+Cfgwd+HyVA+7l
	gKYfx444g0ixcMaEs+H9uSm081ZW2tI4h6XrcL8nTD3+1axiXZT+ZOen1XOVNpu8xxOfIeTC//m
	8D4NXwehQ/CXUJNW02i2X54pan4Twn8zxkiX/5L0aTlEy/3Ij3c7+ZQbqwqkLu+asEz4Cvg/cth
	nT86kCTV0jqwlaQVItnG4H6lldJZBcKeJ4sMk6ExnXICnKX2gMoBNHNTsjSeePRUCKudpYJgdZQ
	K9/lKi0XR78vgjqxMOHxXiGSrCr4ZucDU52Z+7Euw1elHfZhGuWgm6eFdSJCItjJdcSjP454al1
	1AtiRJxXn32bqE0YWsx+M/vDY47ZR2WYWuvSR
X-Google-Smtp-Source: AGHT+IG3pwvpc6BxS1YVZvmLXezCAzje9Y6cdBA2Ax5A0e9Me5Q1M68h5GqdQnaD8/2y2jlQ5aoTTQ==
X-Received: by 2002:a05:600c:1c95:b0:453:86cc:739c with SMTP id 5b1f17b1804b1-454ec14a50bmr77388375e9.1.1752394023657;
        Sun, 13 Jul 2025 01:07:03 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:07:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:29 +0200
Subject: [PATCH v2 07/15] dt-bindings: soc: qcom,aoss-qmp: document the
 Milos Always-On Subsystem side channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-7-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=838;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=psKgizPd8idK+9Xng1zZOiGE+n8ZxAcQQoK6CGGlaAM=;
 b=OPdqk8kzOonRIU/FvMHf4OTch/jvk1/7G0B29tz1FcPCzLFyfw2MFYAPDwPtuFr0E3EKR2CfP
 Ni3Mb/Ur7LsDyQ+nsHsg5e6NHg8v4v7jXauIS2CrOl7e6VQ6BFwELcm
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010705_286528_EC860090 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

Document the Always-On Subsystem side channel on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 41fbbe059d80cebb214317df8ae15b86573546bc..d11bb623d08c0877cbef8e8ce4795974188b2fbb 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,milos-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp
           - qcom,qdu1000-aoss-qmp

-- 
2.50.1


