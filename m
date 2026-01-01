Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406A8EEB57B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 23:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRSrv6S7/xNmyemUuGujBGmF/mxmauPTPzAgG/7VW2A=; b=IMbdwSwj/ucdLs/iAk+8/2acOC
	XFgVjU/ZlTJkDB0kQP90mMmCNvun7XwPY6fARzAmSf9cFPe9FXNKFlxoXKaxBaTAOiZABFf7XZFny
	dO4ozFcAnsNh0UrBl/RQ4/k+7gCNy2g4Qg7e6qlbezDMqnle74Yq10iHbMdPeTN9lfHKNNsdnwSyn
	i2kzcDwz3/ifm3lSnM2MVHFYaPpspyfezyovPwnIZMHVLbi5OgXN4VInO38kRgCwmnRh4/YK9uUmm
	Y3F4JR3uW+C7IBgYwV8/b5R6nxBVLEj/f4Cunf2sc+oJMpfeOMO/yplw0deiXnGlQAEaIZlN0FjJg
	/l2no1Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbSXN-00000007eo6-3aVg;
	Thu, 01 Jan 2026 23:57:01 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbSXI-00000007enE-0Xq5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 23:56:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767311812; bh=X/6g7pQWQreRu4YvFqc/rdgGFTpWurYyFYNcnz90z44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OJdJWl2fYBfhOEWP1xNIqVRPQmYyhJ9jcIhLyMMF9TmtFE65qUmJXfbHUCgXMitL/
	 ts3vrXCPCYcqHuOGepXjRptCCOUl8KDIW/kDYtZ2Te6AATPeOrDe7dvR+OVcNlVeYC
	 cPnkKFV3eaVounXCxrqhViXq9A2/dy1ERbm6/mEJ0QgLUcvsHYqnUe6jT6Mt8c5KvT
	 zQMgUdDBEeGsqS2IFqmjszMZBLMdV4QkLpbjxy07Ao45Wvu9OyNt5ir9JAp2ql7cCZ
	 XUTQ81LyGMT3s6S5nDGcgMvOfnMsN/LumpyW0uSefOGAmvqsUP62o1vx7/g9xXSqXY
	 M6s/7KK+WOsJA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 32A973E956D;
	Thu,  1 Jan 2026 23:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1767311812; bh=X/6g7pQWQreRu4YvFqc/rdgGFTpWurYyFYNcnz90z44=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OJdJWl2fYBfhOEWP1xNIqVRPQmYyhJ9jcIhLyMMF9TmtFE65qUmJXfbHUCgXMitL/
	 ts3vrXCPCYcqHuOGepXjRptCCOUl8KDIW/kDYtZ2Te6AATPeOrDe7dvR+OVcNlVeYC
	 cPnkKFV3eaVounXCxrqhViXq9A2/dy1ERbm6/mEJ0QgLUcvsHYqnUe6jT6Mt8c5KvT
	 zQMgUdDBEeGsqS2IFqmjszMZBLMdV4QkLpbjxy07Ao45Wvu9OyNt5ir9JAp2ql7cCZ
	 XUTQ81LyGMT3s6S5nDGcgMvOfnMsN/LumpyW0uSefOGAmvqsUP62o1vx7/g9xXSqXY
	 M6s/7KK+WOsJA==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id B6A3C3E9B72;
	Thu,  1 Jan 2026 23:56:51 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] soc: Sort the list of subfolders alphabetically
Date: Fri,  2 Jan 2026 01:56:46 +0200
Message-ID: <20260101235647.2411062-2-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101235647.2411062-1-vz@mleia.com>
References: <20260101235647.2411062-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260101_235652_221550_F3174F70 
X-CRM114-Status: GOOD (  10.42  )
/bin/ln: failed to access 'reaver_cache/texts/20260101_235652_221550_F3174F70': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_235652_221550_F3174F70 
X-CRM114-Status: GOOD (  13.44  )
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

Move 'amlogic' to the top, it will allow to keep the alphabetical order
of subfolders.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/soc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index c9e689080ceb..47a3925ff84c 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -3,6 +3,7 @@
 # Makefile for the Linux Kernel SOC specific device drivers.
 #
 
+obj-y				+= amlogic/
 obj-y				+= apple/
 obj-y				+= aspeed/
 obj-$(CONFIG_ARCH_AT91)		+= atmel/
@@ -24,7 +25,6 @@ obj-y				+= mediatek/
 obj-y				+= microchip/
 obj-y				+= nuvoton/
 obj-y				+= pxa/
-obj-y				+= amlogic/
 obj-y				+= qcom/
 obj-y				+= renesas/
 obj-y				+= rockchip/
-- 
2.43.0


