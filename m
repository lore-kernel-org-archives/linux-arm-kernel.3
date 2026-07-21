Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C0CC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 20:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQu+X8yGMFJ886Y/6SkzpbvtTHqaWWFjdm8ySRmrIgU=; b=p9tgj5d/lE2dV3jQpgg8mHnKEk
	6mxYQtK0U+MuIQBI2lz7ZapJvko6Ogoqveym4Qs8Jbwm8sZtn3qLxqM2FAyt0o5VdGNjb3jXO+7jh
	Sm1J2gz8wm/+hALsnUXYloOjX5NFxUlHRQgmXY9jckKUFwBik1pbT6UTW8U5kq3u5en6tlsDJZCbo
	YtOLSmN0TiTPks9kL/ZSvAClV3MDU3ONE0UhnvlPqye+WFy/8Jc7uXdDzMxUIVsHzMMfxGSfAM3ta
	roh0BGzpFCbqA3H2zlUJSKsGSOSE4lSV8LjIyA0i3092EGr/yrFl9/6hzYOiKzbpBTydxEUE0rLix
	d3GDjxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGp6-0000000ALhF-2p1k;
	Tue, 21 Jul 2026 20:12:16 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGot-0000000ALaB-2mZK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 20:12:05 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id B572420B716E;
	Tue, 21 Jul 2026 13:11:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B572420B716E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1784664710;
	bh=SQu+X8yGMFJ886Y/6SkzpbvtTHqaWWFjdm8ySRmrIgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nbMx/SN+1OwJBtSN4jVHReLeoKxQfb25mw1vi2YN+4ZxgqcBN8E7WjYyd9g/i4+lS
	 bHBvGZJOdfTgniOEWqSqeTzCZXyQaAHav6G3Gvgetz4DxwiEZXaGO3RGzP3shrdfks
	 WNvEVPvKgbCHdP5Pf4Jf54mZhUo86iWMQ+qI5U2g=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	mhklinux@outlook.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	arnd@arndb.de,
	thuth@redhat.com,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v3 6/6] arm64: hyperv: Implement hv_is_isolation_supported() for CCA Realms
Date: Tue, 21 Jul 2026 13:11:48 -0700
Message-ID: <20260721201148.1441143-7-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260721201148.1441143-1-kameroncarr@linux.microsoft.com>
References: <20260721201148.1441143-1-kameroncarr@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_131203_759103_797E77B9 
X-CRM114-Status: UNSURE (   8.50  )
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

Provide an arm64 implementation of hv_is_isolation_supported() that
overrides the __weak default in drivers/hv/hv_common.c.

The implementation deliberately does not depend on
hv_is_hyperv_initialized() because hv_common_init() consults
hv_is_isolation_supported() before hyperv_initialized is set.

Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 8519f694f2897..e28612255a970 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -163,3 +163,8 @@ bool hv_isolation_type_cca(void)
 {
 	return is_realm_world();
 }
+
+bool hv_is_isolation_supported(void)
+{
+	return is_realm_world();
+}
-- 
2.45.4


