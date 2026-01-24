Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37846D715E5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 12:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rd2Zed3zKZmPmdTTOWk/dlMTWvo4vN0lvMRs9ZwBpHc=; b=b4oxyvSoTtewlSPCJvPSyZMICq
	7uCZ3d7UZxd+v9j4TiyDlJFm5uaVPnexVCAj0msj7ouZBHttvVHGFhMS75vUX3Dm5e0a172ydimCC
	IlW3H7TtnZ72JBFfJMsDwca9LGjj9T4l9an72o6vo0TZix5NAb1Jq8n7YeAoMgPZtzzZLnIZldCa6
	n0emVWwWnmT0FEtZZX3Li5PFpouJvRGNAjDKIekTT/XlFJqfJoJiz5701FI7I599ge5Ha/4J909tP
	dPS/bsjQaU80/W6lLT962AH9lcqos074BGEkbmwaVEJatuI/FjTM2wbQ1dfE7NYyWbXgGFkM0FcZm
	8FGgaVQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcov-0000000AG3v-0Tx6;
	Sat, 24 Jan 2026 12:32:53 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjcor-0000000AG3Y-46Yd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 12:32:51 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a79998d35aso20001425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Jan 2026 04:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769257969; x=1769862769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rd2Zed3zKZmPmdTTOWk/dlMTWvo4vN0lvMRs9ZwBpHc=;
        b=NHHoI/9pnI5ZK3RHCRN5gzMPXTQiFKbTCWyl8xWvdA/wdDAGr5Nmkz4h7JfgS582Sx
         vDmoOMF57jzu8saepEe5lkQ3qyzNi2WEOelX5t7+WoEGmAPjAIb5yuqlxaXlFnp+LWr6
         neqvhm02uTjN/NMlNvldLZmwrR0FtkxvmzCtTB/xuxjIoHvfd0VkPPD/jwvuB8AdUq4m
         kUJpeYsvgrki96kQU6SmAuYsj/8pFpo++ODI/boRJ/eCC3LlCRgkUCCab8RhtTsZm5RR
         eKouQuNxt5q/pVIQz1s6Y6sFIB+4SUUTuKkW5f7WMEAXBHeicmlBpjaLrCwlmxqQzFkG
         sacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769257969; x=1769862769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rd2Zed3zKZmPmdTTOWk/dlMTWvo4vN0lvMRs9ZwBpHc=;
        b=q/LO+m8Q4BVd6OIKgsKB211/iu6gTsO1QEEO15aqVQQQUSLL3V+5FpSGhApkdPFlAk
         CQZ8DURbC4yj94e2mbJRu6k0m1e0KLGREtyjrOAQ/BvFH6gtHIVZ9CKvY//d/SjRbw8p
         aIejzND93dNPMbOKuHqP+9A6qv8zlUoy9sO14MAnLTzhH11kCPxH2bOdlkbnTBpU/329
         acDhyeoefw1bSccKsYMZf4JeFctdVOXDowsWs/S+vy8lJTlr65HBY5ovP8gnk5XdRPh9
         olOFvelZVZa9mtoqHfjLDRvIgHmNjVpeOzXcWs3mYSCRsmp3kZEbt4TQtSaJQbNmPL2M
         h3Ww==
X-Forwarded-Encrypted: i=1; AJvYcCU/CWAJ/qrRsiGcCGzKUpPv4Ai3E6I9K++jSRI/lSLAuE9fiJgMn1pvBZwM5bMZgeczeOp1N2mmrPBGvYYkXlgV@lists.infradead.org
X-Gm-Message-State: AOJu0YyuuC85ndYO8TFvJ1ifYKoHoO+gW4lVC1pToa+mfVodurBCs2ZC
	WNejsrurgRU2oCFhYSVuAN5Hyxz6Mqbn8pQXTa8bhpl2pJAOkvatnTm/w6auGO5G
X-Gm-Gg: AZuq6aJYx6XDeXuLlztTdqObKvJGyMzUI1WtdCBhO6YbK48s3RAIZMv2RwdwFO04cyv
	oLPVMhoBWlnIKlnPBGy8z7b8QDRRJR4ZM6WhjNqOoissptHH+QllUJFWUnDlHP5R7N3effeLV/B
	hOcb8FLF4aLW6oVQ6l5Jy0nWQaFKGAsF4CPnemrQdzYRWUOXk7rnUI7kOFyt2fL7KXCXDX8lV41
	umC89QBlvZY7hBHDAJrY6iu06jhJ8PAjMJJ4ikKWYrw8Q3UoprXiEa69yqUOIxUhgn6BDivnzuT
	1ksimrjt5sumO4N6Wy+cIhn2PaS725qXZKGfT0TDEIuVKuFQKp0vycOAbyNZqU4DQWjs6Ua6fQZ
	iFFugarPP6KdweR7z6Uljf1Ey8NPFzMOl0JcIDn/osS30eHM2+5Y1vL17ufCpChVe/l7Kdu/9eO
	RzwdhBU2OLQd6HIQ6FR8pdOwxZ034oAheyQby3
X-Received: by 2002:a17:903:360c:b0:29b:e512:752e with SMTP id d9443c01a7336-2a80ec683famr40477875ad.47.1769257968605;
        Sat, 24 Jan 2026 04:32:48 -0800 (PST)
Received: from MWDK4CY14F.nvidia.com ([128.77.79.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353354cdcc7sm7366542a91.16.2026.01.24.04.32.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Jan 2026 04:32:48 -0800 (PST)
From: I-Hsin Cheng <richard120310@gmail.com>
To: catalin.marinas@arm.com
Cc: will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	I-Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] kselftest/arm64: Add missing file in .gitignore
Date: Sat, 24 Jan 2026 20:32:41 +0800
Message-Id: <20260124123241.3257-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_043250_017538_2B2CB017 
X-CRM114-Status: UNSURE (   8.89  )
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

The binary generated by check_hugetlb_options is missing in .gitignore
under the directory. Add it into the file so it won't be logged into
version control.

Signed-off-by: I-Hsin Cheng <richard120310@gmail.com>
---
 tools/testing/selftests/arm64/mte/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/arm64/mte/.gitignore b/tools/testing/selftests/arm64/mte/.gitignore
index 052d0f9f92b3..f6937f890039 100644
--- a/tools/testing/selftests/arm64/mte/.gitignore
+++ b/tools/testing/selftests/arm64/mte/.gitignore
@@ -6,3 +6,4 @@ check_mmap_options
 check_prctl
 check_ksm_options
 check_user_mem
+check_hugetlb_options
-- 
2.39.5 (Apple Git-154)


