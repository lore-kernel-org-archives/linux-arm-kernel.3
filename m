Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D3BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9EcpsvlfdILzMAQp2/jsodVgf7CmKMPZrf0qtieAZk=; b=kAGqkI+9VDg55/F4jPRPiVyijE
	XzXsrU984PQC20yuKjxUTwET6d90mP2r3hVfZnMgtT7tDuErquRroSHvYalIdtK/caezMqSILqIzm
	TPtRB/+cKqK6won85gKMlS+vNsqZbxNLpdYjPMPjjFyZWKNEYQzOiNtqnjh3j599ILl5b+OroJKU/
	xB3S1Uqv/jPM6DFsefiNev8fTZfFSIus+RxRM0ZS4PrrCQnwxKRYRDEUh3xLpTrdryvi1B4NbLv1n
	/8B+vFMK1oA4/Fr0fcrtpi9/yt6e4Jk2pq9vC3oVMWZFeK7xOuRDUHTH/K/w+t42MzP2UDnhvaApN
	p8Lgm+Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnvx-00000007wFb-20XS;
	Sat, 22 Feb 2025 11:44:37 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnqf-00000007vXU-0RmE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 11:39:10 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab7d8953b48so45148566b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740224347; x=1740829147; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9EcpsvlfdILzMAQp2/jsodVgf7CmKMPZrf0qtieAZk=;
        b=lbRcFdlY+RQnQTQY8kBPT/f6RgWInZdMCZMtUtoNX17g1EML7wg++nEqquN+wM7FLu
         SWvBRSg/h1tbtMKMGj9jQoiMWEHT4OoBjtJHv4kU4EVkjSxkfLYK5LYjQOwx/kcCfrtp
         /s38eo/Ex0Mo+boygOhsBf5XRl/BKVxTq6zRyZ+WwKcmLfET1Q8vfujRJnnU+Q5lvmx/
         puFdwWU6VUxP1oB5w7tYbnK7loMCW0MQFb/lFiii/Y37JQTL7P+0q70qUG2Lg504Mbck
         SWvRVT5Xo7lBDUDRQnw2SR8tp8kVZWlqhyZqRngey2WsZee0PQ205dDgq3hdk6JDm484
         +V2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740224347; x=1740829147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9EcpsvlfdILzMAQp2/jsodVgf7CmKMPZrf0qtieAZk=;
        b=ZTR0B98cP9244ZMqDs7NTdJsRkgQyngMwCQx39Myz7Yun3AEClEyRs5HTunstU0qye
         BdREukJmtOyn8HVIW3gWhl1P66i7JY1nB6z4U1tk3yeQedl/PC2j4z8YRSXErG1CmfzN
         t9oOR4i7Vd51vXPZ+8+FAl/BNZrzwjEegnZGAI2ciqCm5tYr/ArQCVWgvMWnILGXjafj
         OaFKNIVFCmr/xtt5n8pTnQuydUlN5Sb0NTkyTWJ3Of417j9Ef/BbgRoTF+my4wgy3Kfq
         yiwqqzDqOYMqOAR84ddulQQ97Y1pAkC/6GwyxbHszPkoZn1cgOVm0ZdW0sfl/0R3Wsqm
         +CoA==
X-Forwarded-Encrypted: i=1; AJvYcCXtsBdGEx4K5CdmTFMN53/rKaC9Nw+blpcWZQ47vguuAUAprLwJlZBp3BwZd/ILgEefKg+W5Kd45mfSCvY3JdCZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyoBnE7KDpgzcMGMVwWZ15s/Ge7MkLUBkrwbuELhCr+bJ3GKWL8
	GFbIpSZKQod00Y9ma9A6UkqWH7NcpWeMvjWl9VvC5IP2u0j8f9QrgWBKbJuqmavcW7i8JIcHC9x
	z57A=
X-Gm-Gg: ASbGncsoRsro+NY0LtjFTHP+k60BBaNcbD28r+gyf35/P0V1r1WByE2ON4ZDCZvO2ri
	ZH6mgPk5JvHFqwkrsxWml1nXboJIYFkiW8Wbz0M4dMYWTyH0idtQ+jUIpZ2xp3Gs72EwW5o+DMG
	YMO6EQvOhdeYOrHmrIaW0Dg/ahaajdtYoiHHm/j7eDqI7c+bw3caGzmZYHR74lgLdUVXivykoEM
	V7MLmUb1+hOL4X5zlpF3Z4xysekvIU4UWMqW5JUpkxBjKjUMriog7/kKLuott+o2gAjYj2R8N5J
	CgBkLuXPGrmQUGmbTle2Op1dh7ZcuPoU8By5FeiUR+ZYfakMMmeZ9qLoQAblFyUsR6FSJQZ7sR2
	i
X-Google-Smtp-Source: AGHT+IGE0bApSp7dpESrNQt49BwR4WA+qiKhIkXWSHbpkmvW4yQXqhCs1JVsFtKIeRDqIfBdSklEfg==
X-Received: by 2002:a17:907:2d8b:b0:ab6:db64:b040 with SMTP id a640c23a62f3a-abc09e5c67bmr270858866b.12.1740224347024;
        Sat, 22 Feb 2025 03:39:07 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9723a559sm1202702066b.96.2025.02.22.03.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 03:39:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 22 Feb 2025 12:38:58 +0100
Subject: [PATCH 2/3] coresight: tpda: Constify amba_id table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-coresight-const-arm-id-v1-2-69a377cd098b@linaro.org>
References: <20250222-coresight-const-arm-id-v1-0-69a377cd098b@linaro.org>
In-Reply-To: <20250222-coresight-const-arm-id-v1-0-69a377cd098b@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xeg5lwI6l9nm70MC/C/1m/cmoxok9e9nkZsk3Cz9ITM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnubdTnCMPcpy6c2h/pgiuP66+FVJGGwEqtA4gO
 wTNczwr0wGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7m3UwAKCRDBN2bmhouD
 14ZGD/9qBAFceci9UnQuGsh2nJFoNvu/OliVMqj48SwI0tusP3wiJn7Sdyk7XzGzeDiZQm4q/Z0
 JrNWwa0v8qy+GPgQZ+/Qpu3yWA9hqOHl3RIG4/UUzDKui3OdO5Qh4OAXUELdPOXg9CFwGcFCtWJ
 EXkJdl3M9btre2yODtwbOhg+dvViv8+5tuTb1ye7m4g460S4Q9SnsdOPsi8oTgH6ri9/g3KKiQG
 DrSsyugTA6gYmBcAqEMl8EK64XZTAmr3M1JOj5msdA5lfgy40nzpi2Y6xlBJ9iqFhgQuSaS011J
 I1WyvTGa4P3k482/+Yi3BdRMWYbEyXDiddotc4BrAiN100k520LQm0chHWT3XtpNORGdD3xY3cM
 w9SWJzPwowHSQPx3mWwyX1EcCWUTA3XypkpTjZg/HSZSKmBzlhLYKpsa5Jd2+nC1Vrzcg9cCYSK
 6XzccWtHE02pvbWexV3BRhhDXsHmYcP+Uex4KP0+hwDnmwHY01/AI4uRIwyUPWC/85ecK6aBhW5
 LolTUMbxXnocBMil7RV0zAakeNCNsW+3QLgivv7/5JwIn6RmXIRHXK4Aq19NFkQlDqne+uDXsqM
 JrOL8Yp68oz/o7hxk+nbNU+USsPh+954RR8/zTBebVoN2tRWK3mS3+WqtF4UsNxu0Nq1p310MBZ
 TVLl6Zqv5iMuQzw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_033909_160849_D3670AE7 
X-CRM114-Status: GOOD (  12.19  )
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

'struct amba_id' table is not modified so can be changed to const for
more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 189a4abc2561e3ec256c63f615112c2159360c86..573da8427428d430ab7f11398d1980193e21481f 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -331,7 +331,7 @@ static void tpda_remove(struct amba_device *adev)
  * Different TPDA has different periph id.
  * The difference is 0-7 bits' value. So ignore 0-7 bits.
  */
-static struct amba_id tpda_ids[] = {
+static const struct amba_id tpda_ids[] = {
 	{
 		.id     = 0x000f0f00,
 		.mask   = 0x000fff00,

-- 
2.43.0


