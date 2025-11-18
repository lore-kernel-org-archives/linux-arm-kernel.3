Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2591CEE339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7Cp0IQzkfAKXAya/Lg64jqfJ1j/YiOKK8shdTQX7JE=; b=Jf180Wq2swLFsPu+9CAjcvsANe
	adYLKqL7AdCOJbu0x5pE4vfa/0mmaVOnTXL8Fnf+8OI1hMR66hwuwUzZzrX01qeqZ/1EBrf+7a0mL
	HaVft7CGUrvz/etjpami/fjKLxsSXGS5AV2Axj+MZiTSYUhBgIH5PkM8bcm7hFyPQYZ9nsB63GGOz
	xt73UlvzhlJE1f3nwoYSgXIk4V8Wp8SgBbsDimTO2hwhaVusDLcXIIGvASzwrUZxNpXu6XvegfxmK
	+RzQ9NxRuwYkakm/4mqsDVdUQqKp5Oob+ZzqKAljeg6NnS+Z+056c81ysNLvj11AHPXT3bfEBES3U
	XRyNIM/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZ8-00000000jWK-1qsJ;
	Tue, 18 Nov 2025 16:28:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZ3-00000000jRF-3MWg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477a219db05so17598215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483300; x=1764088100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7Cp0IQzkfAKXAya/Lg64jqfJ1j/YiOKK8shdTQX7JE=;
        b=lG8JJRjcJb3r7ACWgZOco6Gxc+syvkWhnrco/JJbxIPGaMo6DKMKPRTWeoUu3+Zf1B
         BTF/c9CwcjJ5GnROwSQ6yyy5eP1ONMfeRT+bflT3B1+hEJ4U8DGhhRpFXFUlsbJ/iFoN
         V/qWyNJs2OOWxJKxgsakhPsmkngFZblHRbRbW6VJGxa4wucZ78lLQ3wsAHFqS+WKmJNO
         Iu7wfNqe0qlwURg/nNN4YvVS3FgeQgpclPrFJuy+sDW25qo18WqCuD9PSZF68CX4d957
         7T8CQTrLSviXwwBS3nPMpu60Fl36iz9ayeyjGsmbEEplhnefGUzDWzDaJI4iRB0GcvK9
         jUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483300; x=1764088100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s7Cp0IQzkfAKXAya/Lg64jqfJ1j/YiOKK8shdTQX7JE=;
        b=weRCtpTvRAm8ilO4hhcQzMW+nbWGZLCmc1ChXGO2gegc26KndUjnsVCNCpckKKZ3bD
         V8r0KRZa0aFBgGgBhjzoWykM7KjnKiNsG0MiKscEI5JNS+/eCFI4HO2VEcTVE+PlJQv+
         3ZKBhde3sno3vPCnkhaWN5SSTEPFqg6926AsNeeFIM7aqlnL2viFR3QzugjdDFhWfV20
         Ee0MrO0u6h1jDxGmo26OcND7JKLKxe8TlT2qXoIC0BSblJAdJ8o2Ur/ce8tIqoFX/vMd
         g9u6r17875Jef2/dhjsF/O2WLCJ0ongVxamN2GDc4Zyzq8PJ1okZ5d3arQ63Zfyyu2qt
         +i8w==
X-Forwarded-Encrypted: i=1; AJvYcCXjPB0XDw2HBX0P75hFIigirr4zs18/AfvNyOm9SI3zwEovHzBV3exv4HCVdeMy/Ay19S1UnoUPcgUCYI/P6zZu@lists.infradead.org
X-Gm-Message-State: AOJu0YxB77a15vRdF6f1/Oj7q9iooiAICutAJ443oO10vb0K/32lnqOy
	JZVuHbJ6xKAx60KhlEwD8/La8TSlbxgmtgeZflss+S26jxKhKH/o6iR8iDgahPO7wNfEgD9gkfd
	4/RAj920=
X-Gm-Gg: ASbGncvNqU4ZRAg+ExL05nMjwYxWb+fxKE6fBnDrPZJ9sVXv+altI1843sQIaPKpxxJ
	4Q/kIsoCNZXIrCp5bsICVbJzaYoieYlb4/6uro9BCwL4ziCVU1KAdwaLKruzxJpZfIiWg86OEwl
	G2OyogpU+TO0c7yF+P9YmPuJajv4NQKzMtBOQ3oVnqJTSeeV8LHMvRrOnHYhT60zb85xXCKVBA9
	KQ7ROl9xbqIqtGsw1DO/wIg7BUS0pTL+47JuwS1iO0ncZ4IZonjUoaVMoy4xpxPqUpgBXA8suj0
	GIrnnL05hsK/Yetssq1XgFSOkxmIK40hHOfNgTFSEPuLD7SVG0swkCOidDUiqklkAhUyFQ3Nck2
	buSDFDrFhkGvpA8aQbz40rnO+9uee9a6XsXMsQH4XZ13bZWbiY9+E83uMJBYnTOsz6gH3eP6pOM
	cNaNd0WK8se2y7VsLP820z
X-Google-Smtp-Source: AGHT+IGvkVieQt1G4+tUhXjqKDIAxEgYuGjCa+t00ADvjlhFJ4APSPCkFPkbv/kD5N1u2T3cDsB68w==
X-Received: by 2002:a05:600c:a49:b0:475:e007:baf1 with SMTP id 5b1f17b1804b1-4778feadb6dmr146870515e9.34.1763483299512;
        Tue, 18 Nov 2025 08:28:19 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:19 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:57 +0000
Subject: [PATCH v5 07/13] coresight: Don't reject unrecognized ETMv3 format
 attributes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-7-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_082821_874568_79DFB616 
X-CRM114-Status: GOOD (  12.02  )
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

config isn't the only field, there are also config1, config2, etc.
Rejecting unrecognized attributes is therefore inconsistent as it wasn't
done for all fields. It was only necessary when we were directly
programming attr->config into ETMCR and didn't hide the unsupported
fields, but now it's not needed so remove it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 4511fc2f8d72..584d653eda81 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -333,13 +333,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (config->mode)
 		etm_config_trace_mode(config);
 
-	/*
-	 * At this time only cycle accurate, return stack  and timestamp
-	 * options are available.
-	 */
-	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
-		return -EINVAL;
-
 	config->ctrl = 0;
 
 	if (ATTR_CFG_GET_FLD(attr, cycacc))

-- 
2.34.1


