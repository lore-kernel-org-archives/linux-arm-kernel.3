Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C26CC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hjY3hzFmvN+4at6lT8SAyUwwUa4jwbS1wn4nbJEWn7I=; b=4rsq1G/mtguIxP7nZl5QPG+1Ob
	dkBLTpluHjH17XP6cPlC/rkll8lCW1OmRotQdr9fg8SEt3RymUthCrZU/uKJdMXisD0kczB2tTVMS
	Tey5ajNFaGzUAiTGqi2zHjnZWK228AlxEuw/ft13plA0UEot8P2i5p1eFH8yI9+4QGL+HtoNv5KDm
	nHL4doN5dcLZw06UnZ0Jby46q4sdKEdTdGksYJsZuXfpbcz3boPU4QHqV+OdNQ31BHyqcA++JFXW/
	Xm9+7PKlSB9o1Vj5ebXCpj1teYTCpPTUR4O3dWGMhhkJhOCBr8X/YbjL9BKC7wNVDQfn5ZyqqbmTa
	VBweyRlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjjb-00000008YZG-2EPQ;
	Thu, 27 Feb 2025 19:39:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhBB-0000000890Y-1Onc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 16:56:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E1035C5EE6;
	Thu, 27 Feb 2025 16:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7096C4CEDD;
	Thu, 27 Feb 2025 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740675368;
	bh=ddHSWzfOpgj/d3fX6Fk+tB0XVBjWU5UoN35QACCC/xc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uLC0RUuxuh8h7kPu7nlreNvQnb5TmspiaLbq89qkbZwbb+MQAmsvGzPqVqwmD++Tl
	 q2tQCnPEMMDOtLTjm2JFpm6Zn1cyieReI9toAYgnUOHqO2beknnWYFyeTIYU0RBtpp
	 noYczIz8UEU37EBHnwwh7yBPK5GsDujh0nhsT45nDwXweKjiPMMLsBh/6hetWqRwaa
	 PkpIfXZiXbGWPGMJ1AieQmKBRyh0JAbxQSuJx3DRkEIPlLJMpG4kbV66IvVZd86Hql
	 l1o/x+evwXLpziuDFZGNi3t4T1VpF7nJG3P+9JkBSyMM0KuL6k9gIHU6uDiqqPan2h
	 yGs+GaQmF12bA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34BEC19F32;
	Thu, 27 Feb 2025 16:56:07 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH 0/2] iommu: apple-dart: Support the ISP DART
Date: Thu, 27 Feb 2025 17:56:02 +0100
Message-Id: <20250227-isp-dart-v1-0-161e91ef4f46@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACKZwGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNz3cziAt2UxKIS3TQLYzPLpMTE1OQkQyWg8oKi1LTMCrBR0bG1tQC
 mlcbVWgAAAA==
X-Change-ID: 20250227-isp-dart-f8369baaecb1
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740675366; l=655;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=ddHSWzfOpgj/d3fX6Fk+tB0XVBjWU5UoN35QACCC/xc=;
 b=TasZ/Is8Sj8Qao/MTZTpDzngUe2vnUOdsD1prS7ULnltrgtT+NSrIYi6D2PdSla0qQ1xfJ7KG
 Ln5SGozEOtRDaPc3IZl9VDj3M30AM+ik9Wm1tXZLEm9ntEXwsx0cnBD
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_085609_439841_622AD0CD 
X-CRM114-Status: UNSURE (   7.19  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The ISP block has 3 linked DARTs with mismatched bypass support.
This series adds support for this setup.

(The ISP driver itself is sent as a separate series
https://lore.kernel.org/asahi/20250219-isp-v1-0-6d3e89b67c31@gmail.com/T/ )

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Hector Martin (2):
      iommu: apple-dart: Increase MAX_DARTS_PER_DEVICE to 3
      iommu: apple-dart: Allow mismatched bypass support

 drivers/iommu/apple-dart.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)
---
base-commit: dd83757f6e686a2188997cb58b5975f744bb7786
change-id: 20250227-isp-dart-f8369baaecb1



