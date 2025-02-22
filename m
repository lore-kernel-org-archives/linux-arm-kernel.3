Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F7BC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GciUUqj1RmNWWcZPAfK8/8tZx9TktRuEfZAKKaKTmos=; b=10h+kSygxc2HlsDgDzIoWKB0j0
	DKA+ziJO+M94PPXei4E4PzmCuh5Fv6h60kZOZCrO88auk+v8tPvPgoxooSyxlhJdwb8sxrlU/km37
	m5F3mQktL5h4iZZNAjpFiK7CMeNavzqO0yb23D+vNH7d3PoFBEAe5n5KLpaq94ZgdNeoPPn8PLBUR
	iczqaxCAV5PRD+HIkGfgT8wRVRXQQf5QcbReaUPqxiWn7KV8weMWW5Yw62ssv1dF2raKYk8x/fbEK
	7gm7cKLgiXTkOT1E6q6smjEC5UtH+wDdZcafbaeXjiZjSc+yn08I4kil/IHUTBcC0JCkOZgPgzsnK
	mU11S0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnxP-00000007wMz-18n7;
	Sat, 22 Feb 2025 11:46:07 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlnqg-00000007vXq-0QZ2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 11:39:11 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5debb4aef2eso473988a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 03:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740224348; x=1740829148; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GciUUqj1RmNWWcZPAfK8/8tZx9TktRuEfZAKKaKTmos=;
        b=OadWc/1udspIMObJZn0vkPfTpajtFJ7d9hB3a64XiKaNx1iYSq8qLcqmpFIQknAq0s
         kEpfFPVjFUm3BHi+MAQI/eZGhoJ3tNIwUnkypCJauUwbCxAGLYlrBUBKOTLMUCYvMYtj
         eEiWpiDHKa8XWNPEEEaFrFfd/LrNhMbWTyV8+E9NC3mCfhPTUgFpwAOZNXhZmYBjRbvZ
         cfIfiH56lxIFT8fLHT+PqYqdRp+JkVJRHLR0Vl3u+wwjDcvw2TL+Sq+XE3aRH9G8CW1t
         me0A2MXb5zHjN3rwyC3MmEaxXwAVkNWyfOFRZf1nQ+RTIn3BcVQCnCQpIBOzA1C0YZby
         AysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740224348; x=1740829148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GciUUqj1RmNWWcZPAfK8/8tZx9TktRuEfZAKKaKTmos=;
        b=PTxWbkf+AREYB4rNmsyBcEXIoUSeMOvdFURsRW1okOGIqeI+cIMMz9DsMhptcLC45n
         q0zPaZErgfI77uso0d1ViP/Wx9zHOR//HS+tpgeQNhDfuQhyGcVsbD7hz93UKT9VV0rX
         abp3cC7WgF8s9vU5VD+0aZT59WKsV6oHu6YJGYDFu1CjNEQTTyaBq48i1OY05I9A+XMm
         vsDGHgVfNHEjMDU2FeM4eEooABVXEmTR9A8MoDaWMyFS8N1c8PvPZmfSHljEAottMoal
         R8C4c6MJ4w55wz3x7GetOuQs6FwC/wdrC4P9cOXIUY6BSWdTKs5Q8KU3/bURdHFC2TXl
         JsXA==
X-Forwarded-Encrypted: i=1; AJvYcCWlXdJWkdogCu7oI9ZSaZmLm80eb5c/WbNaupc1Tvq4oF4MmBBpo6w0x4R7+MHMbUzzSrKjOPhQX0oqd/Ju6uAV@lists.infradead.org
X-Gm-Message-State: AOJu0YzEtOCj2VRTR07S4kS43l/Hd502aTIIv3FESnorjfkn0f/eUaMR
	9k5goFRj6hb2MwqXmUYIK37LdmCjC17NfnsTMzHMWis1RUqjdxGzCnUsJYBPUCjn+scQ8vfF0y5
	Z4dc=
X-Gm-Gg: ASbGncvWP4GMi6MerOH60pRPXAGOmOEDREo4SnkWDICkmf3gWDHaGC730Hm2QIgduiM
	JleTSqR9XWgbfBUVjzfEx4FwQ6UOsch72F+yBKi7qnZ09vInGVsEghscEymR3AcxNJgvXjfRV7u
	YehmVDVQs1GN8meAFYUdIbQNxtWX2PJXhKmOOoFn+4SBSw3sWkRDfAqPZRMtVSCAzMRADC2r102
	kWKUvGsOZcLdvvB92y+cTeQ8JIXL8+66O6TGblbVRdqRaXOFsUMh4F5U/FHh9V2Xdd4ZkfhaxcE
	ERrlXqcdClg29ygz3AQe0o8L3LzZQX3tcSv6EqiiZP+5aTIIT6TaDPnnwZE3dC2EYhMG0tIBN6W
	i
X-Google-Smtp-Source: AGHT+IG/9B+Bl7UV1RnTVBHCf1VORpcGI7KStjZd+OYFng1yCCZXzpskS3vRcsDqBd9OG8mC4clNlw==
X-Received: by 2002:a05:6402:27cf:b0:5e0:8275:e9dd with SMTP id 4fb4d7f45d1cf-5e0b7252e4fmr2256164a12.10.1740224348212;
        Sat, 22 Feb 2025 03:39:08 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9723a559sm1202702066b.96.2025.02.22.03.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 03:39:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 22 Feb 2025 12:38:59 +0100
Subject: [PATCH 3/3] coresight: tpdm: Constify amba_id table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-coresight-const-arm-id-v1-3-69a377cd098b@linaro.org>
References: <20250222-coresight-const-arm-id-v1-0-69a377cd098b@linaro.org>
In-Reply-To: <20250222-coresight-const-arm-id-v1-0-69a377cd098b@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Sky15R0RXBLNCxJhjHjePt0w92unXWiCXbaOvxX5Lzo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnubdUTnr/bCumbFZ9TWCRWI0l2q73SVxaJlZ4Q
 T6AybTflvGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7m3VAAKCRDBN2bmhouD
 1/KhD/0Vl495GI6HdSY/B+vUKWLh2qeBUCi+4tl+EQFNUage6r0m1EuQj8bD8/e9OHQGKohQcJQ
 Vtj10TDMDDESaRn4g0sutiP+Pkg/GSsgE6Pdwjq3kWO3EkG8O/a34PlSacmdnkctsHPKuZUYc4o
 XSUdOwS4Y2KN/q1+hKkgMRa+wtEy/dw+cyMQtGeyi15mudYVggZk9ir5D9IxwQRupbx0pXew2jd
 BdMinRcMHBpBRg2LrJTgdd7kOE5tnbZwxr8kgLrUv/Lik0QnXpG60GcwK+eBi5g2BSp2nBWJQ5X
 fTuF/a8MMirtihZQdJzaHuuSgKxgME7+XAIDroK56Idw8LTaxKB1VLX+jMakoq/grb2Srtquv98
 Un9YktybZuHoCs9AJeHvPOqiF73E5NzG1dO6+UHrxRk2P6NN51wlFoXsKFvMISkG1Qtfh6UUcwE
 ssJBuJS1AgiG5HRzE4qntaZiGb/XhD9w9/9H+KBJ8NVEIefy1ioiaUrUhrCYi7ra7xohus7R0kC
 +yOSQaLFsNRCJmfNRaCNrB2lng+TXSS90STPdeA83E9IEN0d25sMOecQmPzjBOmYVedCrVAtIVM
 DbIJS9o7UgyGyt/29ArXpBBez9cTAQSslWoxzji7AZOW9dK7lF1Co0ZVGuwnP/0SILTFRuHBNGc
 Ila9TBdtA/uS7fw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_033910_142576_ECA37A61 
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
 drivers/hwtracing/coresight/coresight-tpdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index c38f9701665e70c0fb58726980332dbe65e09790..afc4c18dd35d0ab1cc474214b1df6f816e1aed68 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1305,7 +1305,7 @@ static void tpdm_remove(struct amba_device *adev)
  * Different TPDM has different periph id.
  * The difference is 0-7 bits' value. So ignore 0-7 bits.
  */
-static struct amba_id tpdm_ids[] = {
+static const struct amba_id tpdm_ids[] = {
 	{
 		.id	= 0x001f0e00,
 		.mask	= 0x00ffff00,

-- 
2.43.0


