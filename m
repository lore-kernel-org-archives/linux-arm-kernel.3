Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC214C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ban9Sg3JmZZKWNtmhFABzgOrppTDwX/Of6kW4P2C+wc=; b=SIi0AbQz03WwzOcFs4IhxIANZ1
	C9Y3d07VB+b+IDyn74DXLmITlEnPfAgns4J5VfaG5JSzA6q32Pkcag3DqVl7raLCu9bl/aZKUq7h4
	mZE4eUB4SJfegl8S/Jd9/HIhVEdVpvpLAE75ANC3RJQZxSx7wNjfj/yvXjJ2VzsMQpEf+mHMRr5vd
	yffBdjYTkyHhCfbFxTvS2i0OoASKb+YKgyO6gClxp3zkY2kZnaM7bGByRDjFj1jdQiV9ex7JsIYru
	R5r/tqeEiJ3rITcrO3gPEoFdWcMGqTfKLuQAA0lb/k0VPCwVqobhjI03OYpvgMUPwF4zSTnZi0SyZ
	+8GNAaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7NJ-0000000BRZf-29xh;
	Fri, 26 Jun 2026 14:17:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd7NE-0000000BRYS-1K4G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 14:17:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D3B1600DB;
	Fri, 26 Jun 2026 14:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE0641F00A3A;
	Fri, 26 Jun 2026 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782483459;
	bh=ban9Sg3JmZZKWNtmhFABzgOrppTDwX/Of6kW4P2C+wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KRxm5moFoSA09sDUutfW2tckKmgIFbU06Avgu5Pyy1pAT4mUsIZlGUyoRXcA1vw5+
	 Z59vJDJ4118sTwyLa++8YotaydywIjAsDLnFsvLgoOpYW2W7/VVpOKhjyzkJG7521/
	 v9lKVFiHw/tTZq7IJDUqTX6C3/DpYkO/GFjkcTXHQ+dLNDA15FkrLRBtYBQ/aHiSUi
	 XRTLqhLILdlnqTBSm/RSG5ewKdPHljb4HbweWWGBOWS0xbYj9bnaWN2krISoDdMwcH
	 9sL5xHCn3BUy0RcjsyWIsQqJL/5v1HTwCijlKOONYoDN4cG1fwnWEB4pPXr2svi1U4
	 nwqH/GuetjnTA==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	David Matlack <dmatlack@google.com>
Subject: [PATCH v2 1/2] tools: linux/types.h: Add 128-bit integer types for arm64 UAPI structures
Date: Fri, 26 Jun 2026 15:17:28 +0100
Message-ID: <20260626141730.5976-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260626141730.5976-1-will@kernel.org>
References: <20260626141730.5976-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The arm64 UAPI exposes some 128-bit integer types to represent things
such as fpsimd registers in the sigcontext. In preparation for defining
these using the '__u128' typedef implemented by uapi/linux/types.h, copy
that typedef over to the private linux/types.h header used by the tools
directory.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: David Matlack <dmatlack@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 tools/include/linux/types.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/include/linux/types.h b/tools/include/linux/types.h
index d41f8a261bce..b6c473b7920d 100644
--- a/tools/include/linux/types.h
+++ b/tools/include/linux/types.h
@@ -23,6 +23,11 @@ typedef enum {
 	__GFP_HIGH
 } gfp_t;
 
+#ifdef __SIZEOF_INT128__
+typedef __signed__ __int128 __s128 __attribute__((aligned(16)));
+typedef unsigned __int128 __u128 __attribute__((aligned(16)));
+#endif
+
 /*
  * We define u64 as uint64_t for every architecture
  * so that we can print it with "%"PRIx64 without getting warnings.
-- 
2.55.0.rc0.799.gd6f94ed593-goog


