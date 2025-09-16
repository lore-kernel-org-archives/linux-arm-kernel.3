Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02721CAC59E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+yWYKxZUxDBZHMihl0imjeO80P1w6g7k5xbNhn3cOWk=; b=3Bgqja/OD2/0GzOjxsVk9A9Sba
	B1PIjZpcIp+j4bZESaxn+9xdf6/gm5JspwaQZ3iR0DBrDa1VJQnJIzajOCGOp1SkiEPDxMei6VsXW
	RCVi71Qt8zgT3kYaFbSOVVz+ip796lv9l4qoWaBE7hHpfns1WqwFtI7WqLHnZzxezgY0z9rIMf3IY
	zcGICl9dVJ0NJhSyfYOks+q+InsaobXkBFGoMKNuKvfuOAIzcKkAlUAHh4Cb/BQ/Lzi3rVI2UIivA
	rz/I/gJ5Z9j5WvEj6//u2OkxsYsEhLU2pDl9hnkq/zwTngNkKjAgg0/Z3FwEiSbJp1i6qTrw7Onj2
	7nNeL5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQAp-000000071FQ-3VHn;
	Tue, 16 Sep 2025 07:32:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyQAo-000000071FG-3rRw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 07:32:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 561D66013D;
	Tue, 16 Sep 2025 07:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C72C4CEEB;
	Tue, 16 Sep 2025 07:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758007942;
	bh=o4HjOjUl8KogcGYW9HXIKKgJvXaiisXNIkdpv7PUUcc=;
	h=From:To:Cc:Subject:Date:From;
	b=qwsRZjFEL7oK2mF1/WX2+iqlGcMXKwfk1Rw+BD2fsqiw8WO42F6gGF/crufiipUim
	 4FZ6GYQZ28lU4DsQUOZFNbDQjPsLyhCC4nrJQdLYYSUdJil1ujEVKqw5taNIB9qUry
	 KsAghOIXP57dQoLUFHsHkP30rCrpaOzgVn/1Voe0GXSCtDx38WNLRxpWvAkyPfqfUj
	 2g/YWgrdlnsGTzjDaqYhK+a1NeMyRveZOJfEuvzBW6Bb80H6QEnnY9aPHhhZjchrEq
	 eECx2NJf4BpIM81CPsbEq7hVSSo3VqVxPGI+fXibPFpa2FrG0RdK9+jH1vNLsFgoI3
	 GIPGPw1uQ+dEg==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 0/4] Preparation to .map_page and .unmap_page removal
Date: Tue, 16 Sep 2025 10:32:03 +0300
Message-ID: <cover.1758006942.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
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

Changelog:
v3:
 * Rewrote the series to allow combination of .map_resource and .map_page
   to one flow.
 * Added two new patches to convert and remove .map_resource.
v2: https://lore.kernel.org/all/cover.1752734252.git.leon@kernel.org/
 * Added default "else" section without map_phys and map_page
   callbacks (impossible).
v1: https://lore.kernel.org/all/cover.1753003879.git.leon@kernel.org
 * Changed "else if" instead of "if".
v0: https://lore.kernel.org/all/cover.1752734252.git.leon@kernel.org
---------------------------------------------------------------------

This is followup to "dma-mapping: migrate to physical address-based API"
series https://lore.kernel.org/all/cover.1757423202.git.leonro@nvidia.com

Thanks

Leon Romanovsky (4):
  dma-mapping: prepare dma_map_ops to conversion to physical address
  dma-mapping: convert dummy ops to physical address mapping
  ARM: dma-mapping: Switch to physical address mapping callbacks
  dma-mapping: remove unused mapping resource callbacks

 arch/arm/mm/dma-mapping.c   | 98 +++++++++----------------------------
 include/linux/dma-map-ops.h | 13 ++---
 kernel/dma/dummy.c          | 13 +++--
 kernel/dma/mapping.c        | 20 +++-----
 4 files changed, 43 insertions(+), 101 deletions(-)

-- 
2.51.0


