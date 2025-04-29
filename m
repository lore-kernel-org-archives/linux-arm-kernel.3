Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794EAC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 23:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5jsaexJJdkxvjPU7Sdj2kvtz8W8nkPeoHdR3jNANOg=; b=lwNKFhxehiB0gm8yaNyQkhALXT
	uolvrOS+zaNcHVtbvFhb10SQM7y97uXTCMfg3tvgxcKv32+TrWHfJOOL/IVPpmK2golXcThZnWB3U
	0EXhd4w7/f+JeI7ghzQDXE/Kikf9bbB1y0zz5JSppqcBidrh4ncvPyHbqw6aA81nScrm2NpRFt4r+
	E0PbCyJmmDgxVGBpkv4PiptDjK09R5fIdYwykMKo8Li+31dqxY98KaOILJeJxfEZAxFs+YinBkK2c
	gmjwMZG/38es/97sBCfBelmf9Li3BzyVF5IqzYlAdGOGTCsdPODUUS2WtdjQ9BJRs0NarYTk+nXKc
	Rrn44Tdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9uEH-0000000B3f9-0mdH;
	Tue, 29 Apr 2025 23:19:09 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9u8h-0000000B2tz-0h6Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 23:13:24 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b16f5365310so3355784a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 16:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968402; x=1746573202; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H5jsaexJJdkxvjPU7Sdj2kvtz8W8nkPeoHdR3jNANOg=;
        b=s+uBbuvjoEwBycyx5ocYsTz264SWGGgc2krIvthERrEPLAc7JKtJ1OIz1+H7UB2VsA
         4uUJR53eXBsJ5mS1ITdUGF5zRZa+j7H8Ox6JfzLbAPvzaMcecTmDOiuV0ra6pnyLbc3O
         0ngwKkeV4+oE1+MdoUg/Bm/ikTTkXNAd5lXXgYYpMSYR2ITsmlOXOt1vpn9wK5o4ERNL
         UFAZuDcgWv/052agxGHZjE46jAGSactM2zXT1LBB2Vcg2KD077i+QNMjlPjcW1YZIH6r
         BHOIrwKv+RJ4Dwwk4gSN38tllqPCu3aircTFETDZrN6sfMUug2s4RD4faPLWsI+2syFP
         Wnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968402; x=1746573202;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H5jsaexJJdkxvjPU7Sdj2kvtz8W8nkPeoHdR3jNANOg=;
        b=YHBg+J5L6OlFhE/IPjrXRXyI6j98EpR3ScRNrB+wF8SuNrM88cZjBDlh0vaqMXjcSE
         IxlbVbVL2aTOLKxDBp2loMDrK4Zq61lH96bXmAC+gGebglH5tEv7q/XYeGGl5tyS5oAG
         5cVMJLIjw7NmkkvTagU8GbnriRNIRHYSPqmkhk7NW7m9Kadp/Th+XSVsNpsexQ7QrsyI
         QgM7T4szSRNaBC/Hqdr/VANW6a05ssOgikEM/gV/drpGRgPYoDgkRZN5l2NMBPuYp2hw
         pwt+fakP9pcEKOx2cUUxprsL6Cviena/ZiDO+ep37KVfJdOo9XATomLF1hY57CNqHhZK
         aC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXF4Vdf0pGVJI+vSdFPltlWv1xQObvOtHk5qKX8XpIm0r1Ocd9f0chOYlyDIElAbJxBW4TgyG5JgmMgMavppeWf@lists.infradead.org
X-Gm-Message-State: AOJu0YzHaK4kXAFQbT50IdDYubDsbmVPvOIScaw1/UaCDyte6HETT7+a
	rADviLivWP3j2JSSXGiturexnGOR/vs08wNmGiTSGOjFQ/Jzu4JMaXLSK8sJD4ReEBJg79gUJXy
	a
X-Google-Smtp-Source: AGHT+IH50STJWtK1MCML9Q9BF1hzSCklojd5KzXO4ucJvZeFgv98Tbj7wq5WAu3vJGIOixVPU9Xw+SqETqA=
X-Received: from pjbnd12.prod.google.com ([2002:a17:90b:4ccc:b0:2ef:78ff:bc3b])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db0b:b0:21f:2ded:76ea
 with SMTP id d9443c01a7336-22df5839f4bmr4572335ad.36.1745968401836; Tue, 29
 Apr 2025 16:13:21 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:13:00 -0700
In-Reply-To: <20250429231301.1952246-1-yabinc@google.com>
Mime-Version: 1.0
References: <20250429231301.1952246-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250429231301.1952246-3-yabinc@google.com>
Subject: [PATCH v5 2/2] coresight: core: Disable helpers for devices that fail
 to enable
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_161323_207855_89421D29 
X-CRM114-Status: GOOD (  13.05  )
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

When enabling a SINK or LINK type coresight device fails, the
associated helpers should be disabled.

Signed-off-by: Yabin Cui <yabinc@google.com>
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index dabec7073aed..d3523f0262af 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		/* Enable all helpers adjacent to the path first */
 		ret = coresight_enable_helpers(csdev, mode, path);
 		if (ret)
-			goto err;
+			goto err_disable_path;
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
@@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			 * that need disabling. Disabling the path here
 			 * would mean we could disrupt an existing session.
 			 */
-			if (ret)
+			if (ret) {
+				coresight_disable_helpers(csdev, path);
 				goto out;
+			}
 			break;
 		case CORESIGHT_DEV_TYPE_SOURCE:
 			/* sources are enabled from either sysFS or Perf */
@@ -497,16 +499,19 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			child = list_next_entry(nd, link)->csdev;
 			ret = coresight_enable_link(csdev, parent, child, source);
 			if (ret)
-				goto err;
+				goto err_disable_helpers;
 			break;
 		default:
-			goto err;
+			ret = -EINVAL;
+			goto err_disable_helpers;
 		}
 	}
 
 out:
 	return ret;
-err:
+err_disable_helpers:
+	coresight_disable_helpers(csdev, path);
+err_disable_path:
 	coresight_disable_path_from(path, nd);
 	goto out;
 }
-- 
2.49.0.967.g6a0df3ecc3-goog


