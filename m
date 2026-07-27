Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA9CC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 00:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L23i/+dize5vXpnrKQcbbBaJGTAdk8toUK7NA4PU95M=; b=v4O4K5OLGNMnZvg3mIpPyboGrV
	XHMo7nyf4+6IPLOx6xxDzqPkyjWNYR77Qt6HCPZMrV0yx4yc3EfjpJiUCu1q2XvNtTFi935Fy9O38
	fs3vCyPeq6tTs0WBw70gZ+806BoNCc8hQJIeqLP4cWyQsr/Uc1b7WfLV3fh09ByMA+rbod4mDK4aj
	9/G2Cp1wlH9ZpekPHP0E9u4cvev5YylbKBbkSuQp80k6BrgroRYRdFoJxDHyYNdLyMQOE2uKZQyWp
	CyafEW2p/P5UV7HaaqztySzUZAtX4U9rFdbMdbYZgftMJOntrwOOjrTYfp09pHbKpPyCQvj5uztH2
	oPaqS+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo8v5-00000001jE1-09qN;
	Mon, 27 Jul 2026 00:10:11 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo8v2-00000001jDj-34gG;
	Mon, 27 Jul 2026 00:10:08 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] arm64: fix cpu-feature-registers Malformed table
Date: Sun, 26 Jul 2026 17:10:02 -0700
Message-ID: <20260727001002.3016279-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
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

The "visible" column was dropped so that last line's extra pieces
should also be dropped to prevent a docs build error:

Documentation/arch/arm64/cpu-feature-registers.rst:170: ERROR: Malformed table.
Right border not aligned or missing.

+------------------------------+---------+
| Name                         |  bits   |
+------------------------------+---------+
| RNDR                         | [63-60] |
+------------------------------+---------+
| TS                           | [55-52] |
+------------------------------+---------+
...
+------------------------------+---------+
| AES                          | [7-4]   |
+------------------------------+---------+---------+ [docutils]

Fixes: bc7f7ddc64df ("arm64: Remove hidden bitfields from cpu-feature-registers.rst")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>

 Documentation/arch/arm64/cpu-feature-registers.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20260726.orig/Documentation/arch/arm64/cpu-feature-registers.rst
+++ linux-next-20260726/Documentation/arch/arm64/cpu-feature-registers.rst
@@ -167,7 +167,7 @@ infrastructure:
      | SHA1                         | [11-8]  |
      +------------------------------+---------+
      | AES                          | [7-4]   |
-     +------------------------------+---------+---------+
+     +------------------------------+---------+
 
 
   ID_AA64ISAR1_EL1 - Instruction set attribute register 1

