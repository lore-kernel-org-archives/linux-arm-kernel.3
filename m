Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263CCC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wdzS40G5+XkQjj21yhx/Qw5lfwjG7ePaoclwXY13s2Q=; b=uxahExtSlFXmd4R2z5LVTkC+nS
	hhToj4gnWtAO/Q/xHZlxD/fX0ekTqaWQQ5GQ9NgFCcosoe89nU+XsjpEFL2qL8Xbb9/x3VF3gxvTM
	aguvKEdIMSHALeuJeSVar5MKGP6sGNP1YjDmIDFUJZvPEqNY+aSdSgQDXP/twcGI9Tgxq/g84jJda
	wrRSp4MMkg5uvwMXxBmTb9DMsmhyCKPW45E5qofUgOJdnP9quZ/cQ7hmt76dh2hoqxEGaDxrqfJLG
	DGvvlXnn8tgOz7i1+NObXF6iPIewyGB/+t5a0bqkOjyuZxc13TrchCoLPz2qaHeTCaHjfxroFEAQi
	Q0a1epZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U7N-00000002FFS-0PhO;
	Fri, 04 Sep 2026 13:38:09 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U7K-00000002FEz-0lRX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:38:07 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38e58034d05so819489a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788529085; x=1789133885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wdzS40G5+XkQjj21yhx/Qw5lfwjG7ePaoclwXY13s2Q=;
        b=nE/rT2jo8rQDwgFhpO9SgU6Qf9GIfZ2sWJLJkYqzCJglShky8BfLePuccLyzoe4KHT
         RYSSIrFnbfko+oXo+NybyA5+1+lPXqzQrCb2CLtw+6j0B41dX2DfNVahET/0E9zMDOdN
         +AZbr6Nf4/lqLqTCQM8Iif37RgJKx6Xr5LWtMTrc2rDMZ313uVO5D4A1S+lm85YAwQln
         FRHh9uozzrI1WtM2vgmGw+C8yEo4RJ7nTuPv6xG3DsOASpv3cwdjfaYkJ/6VEkS3Qi+A
         3k8urVZXavIB51cYvQpzDPe/2MDwFvoPH63UQWjXwMaEgDLRNSNm9NTmPe9GNVQtWJXI
         iPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788529085; x=1789133885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdzS40G5+XkQjj21yhx/Qw5lfwjG7ePaoclwXY13s2Q=;
        b=sb79Haj77TIF1jltxGIHpVk7rpzo0r8lEvpDPM1q2RnWK3O8PN3Imd5NxP66kxXjzj
         6vmoSWyR4DgLldFEakDxxjOlGlwLzDEJplmtX2EQxlunk7VhnrvgdUzc6919c8T5nxzB
         I6qc6rBfY8R52n69Rh9JjGuAi6ktpsZN3BDl1MYrrr5S4YhGVgQ1xr6LMCDgKy8a2Wjv
         y/+JwpFZ6nSUCrdzVu+b//FXz3pWhgiayMGBqx5I7jB52H1s1X5qqKIGkI7suygkDvZp
         eWyO7SAJcYptpnCVyJKI3I9rXe9fgU1Et4nVcWf9bokocfeIhXCYMiForSFzgh+DL2IR
         Mtsw==
X-Forwarded-Encrypted: i=1; AKwUvBzWcvaq38F5VTz5gEmFDBy5av+RJdhgv/mrXYgNVVDMXm0kSgIo6FM0LuJ74++gd7URCa0LHgJ38nhXixagv0SM@lists.infradead.org
X-Gm-Message-State: AFuF++nMxyLxYmGiaC9vOw5wMkBrPJsyABWC7INjX/LBgFJxio4Z69c3
	MH+an0wxbTcF/H71b5ea7+EBtnrrKc9CGcXiXcDBVB7W1Mwo6WrXd+l2
X-Gm-Gg: AYBFou2z5ipav5rnXFaOaYs2lmydUvx/P1DXQprxXDKx63C9fV2spXSpE/p/pJQozhY
	mwdoKWzlwA+n+5nxYvF+zgsPXVyiy9+PCLIpTJ6F5BSOmZ2wJObzR+rXf868jmamhb/MVCQtrjb
	67bunQ+TMNTmeQaxy4n97B2Sjv31j+gFH2nLGSvDR0/qNRWAjjiYDQWRpz9d8xpZa9oIX1bADqt
	VVSiR6BIjAevQd/BS7AoCIgAVVWR0gtYdn/31dLs4NFe4y/yw4lQBw3SvocMJQoiurLPVn95PEh
	hnO7qB4ODnLirAT3/MGt3dBHg6Z4J9YiNKqfFEvQ+AWPbiV7TnkEuMtypbkmDdQrVQZFs4Pt0i4
	Ff98VUTzkufggdR9IQ4qBV2Jj/tI1jNSuylMmm3+VE15OGCPO2HziK+Q7nyZUJW7aEZ8EpAafEb
	RsLBDT3VLf/P9cnBL8gkhNUWXF+Dqy23A8F14tN2XbEwvHOfRwCJ1uIoAAx/WAYnjMVzPhI5IFO
	5hUXSGiWAZClwFoMugv54nOG8wICbEt69oET+ujklAcmljTa9pP5CA+kJLivOKQpRtutg4Tg6jX
	YQlgsqGDYQg=
X-Received: by 2002:a17:90b:2552:b0:398:e6b6:acc1 with SMTP id 98e67ed59e1d1-39b262728cdmr9882239a91.15.1788529084849;
        Fri, 04 Sep 2026 06:38:04 -0700 (PDT)
Received: from workstation ([2401:4900:8902:9774:f2e9:38cc:6b1d:1764])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm3427785eec.4.2026.09.04.06.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:38:04 -0700 (PDT)
From: tspamiitesh@gmail.com
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Amiitesh TSP <tspamiitesh@gmail.com>
Subject: [PATCH v2] docs: fix typos in Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
Date: Fri,  4 Sep 2026 19:07:56 +0530
Message-ID: <20260904133756.31938-1-tspamiitesh@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_063806_226048_DFD3BC91 
X-CRM114-Status: GOOD (  11.84  )
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

From: Amiitesh TSP <tspamiitesh@gmail.com>

Fix typo errors in Documentation/ABI/testing files which were detected by hunspell and manual verification

Signed-off-by: Amiitesh TSP <tspamiitesh@gmail.com>
---
 Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
index 245c322c91f1..4ee6977381e4 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-etm3x
@@ -2,9 +2,9 @@ What:		/sys/bus/coresight/devices/<memory_map>.[etm|ptm]/enable_source
 Date:		November 2014
 KernelVersion:	3.19
 Contact:	Mathieu Poirier <mathieu.poirier@linaro.org>
-Description:	(RW) Enable/disable tracing on this specific trace entiry.
+Description:	(RW) Enable/disable tracing on this specific trace entry.
 		Enabling a source implies the source has been configured
-		properly and a sink has been identidifed for it.  The path
+		properly and a sink has been identified for it.  The path
 		of coresight components linking the source to the sink is
 		configured and managed automatically by the coresight framework.
 
-- 
2.55.0


