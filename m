Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15DEC369BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 18:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vrce6Ur/Z1bBcoSkzpW7fAIgWwmrsZNhT8/LajKfaJQ=; b=wFL2X1h4kcfSFK18fMnEdm8iCR
	DMdP7kROoLgb80SZGipz+U2SJooTODBbw9he9Ke6TCYuZjCE+kj72BNLyZkUMDsTkKLcNt0w9sKa/
	nXq659vlEcBMvvDUT1icQw/MfRjBvkQBaWyjCRTp5/3bDPzeFobluGklZNs7jbtc6Nzue6JqsM6jc
	NuoEkj3dj35mr0vDToJsCrCd7iEmB3xZ5g4+RsBbPd9CdTFD8rk0HWuzQMBauqs7gmp9LTvwa07nt
	ZZbitQneme3EaGfuLLjIdgsiMCl7DjIJ58I6grXWcWaHqp+8pihtsFPXf/+/GePUkQWz4N2kxlcKl
	uVced2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lSr-00000006nNI-1RKE;
	Tue, 15 Apr 2025 18:56:57 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4lJH-00000006lK4-1Djs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 18:47:04 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-227ed471999so51569465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 11:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744742822; x=1745347622; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrce6Ur/Z1bBcoSkzpW7fAIgWwmrsZNhT8/LajKfaJQ=;
        b=w0catigIqDOnMVJN5ewMHPiacNy/tadEPn4x/Qv3Aii6OBWgMpT4G61oB6BqI9IRc3
         pdT3f6m0HwVn4ujSbASPtojyL+WRlM+KvrPLzeC82pnL7e018828j/z+vGchnsCvbuz/
         e0B/Cu40MdZF/sR97xYx8959+b1etzdECTAz3bQC/soTFbEvYZlnjvMuSw1wRbJ5MZ4j
         Np2ZCUL1QrqUCBbsXOMnlNVfzoiLA31/KPIfkvCoFjxRFCadzPalxbCCVIruQFW5MPda
         es0PKzQ9R3SZGE96hbeCHymtYd5IByPnOaKMNbKAh0o4SnLG0OMPZwUBhG8sLe1Xg9Av
         GxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744742822; x=1745347622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrce6Ur/Z1bBcoSkzpW7fAIgWwmrsZNhT8/LajKfaJQ=;
        b=gKK/OHymlq+Uau+Nvp7cZErS0KoRTWSfGjpZjpsgCSzbsAHKt8i0TWX2Q6fhMroEQ/
         ruV0Ck/yGYFydUr8ldOqbGwKUeB+hgFZr1d4oN1GTZMQl8tz5iWDpqNkWHkULKN0H9J4
         sFmZxDvmOl237bT0mcQ10IyGiL+nImXnCp15vkGdheI0xBlK51k3DF3chLoKaeROGz0v
         TL8AE3G3mMt/TO/D9y/UK+Cu55/jB+IlNKhjqKRgpQGcxiI3BW/HsP1X9BIVSramxPvJ
         NH9h0gux4zWtp40dG7ifmFn4X8uowxSQQCEUxSI3F7MGceheqVqPZEZE0pabq2+6KKbT
         MjtA==
X-Forwarded-Encrypted: i=1; AJvYcCW0dE3RrOWme33Z/JFcZ19E7jDstcs657qvFAONj4asIl3eZPYRobAAK4JNyVsHbgPbp/2ylTzDc4qBgO8RTVkA@lists.infradead.org
X-Gm-Message-State: AOJu0YxUBTOsQR7KMprxBQkEbCRHca0rOUNmOb7Xa6H0TqaMHAdd8sLy
	/urucT+utknBOH6VHy/mVBeDIrH4lSZBU5ir+XWyinsw11V//UtvFj8/jJH2E9Dc9h3RUB98Xmd
	H
X-Google-Smtp-Source: AGHT+IG3fu0AcNyUIzJ/75A6XmoJKAgZCtU5+fN/L99HtW09ex7tvaGVLFa8UCS6eaNGUaRKbqlz0X7DUhU=
X-Received: from plcy20.prod.google.com ([2002:a17:903:114:b0:224:13ec:ae57])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:eb8a:b0:219:e4b0:4286
 with SMTP id d9443c01a7336-22c319f77e6mr3968165ad.29.1744742822049; Tue, 15
 Apr 2025 11:47:02 -0700 (PDT)
Date: Tue, 15 Apr 2025 11:46:49 -0700
In-Reply-To: <20250415184649.356683-1-yabinc@google.com>
Mime-Version: 1.0
References: <20250415184649.356683-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250415184649.356683-3-yabinc@google.com>
Subject: [PATCH v4 2/2] coresight: core: Disable helpers for devices that fail
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
X-CRM114-CacheID: sfid-20250415_114703_329591_03E50F04 
X-CRM114-Status: GOOD (  12.28  )
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
---
 drivers/hwtracing/coresight/coresight-core.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..d9fcea69d221 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
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
@@ -497,15 +499,17 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			child = list_next_entry(nd, link)->csdev;
 			ret = coresight_enable_link(csdev, parent, child, source);
 			if (ret)
-				goto err;
+				goto err_disable_helpers;
 			break;
 		default:
-			goto err;
+			goto err_disable_helpers;
 		}
 	}
 
 out:
 	return ret;
+err_disable_helpers:
+	coresight_disable_helpers(csdev, path);
 err:
 	coresight_disable_path_from(path, nd);
 	goto out;
-- 
2.49.0.604.gff1f9ca942-goog


