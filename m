Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC7CC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 15:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k0A/8eOa3/qxuN6ibHKqnIXti28+I3rQhaeeIBTeaok=; b=FeZcyK3HBHPWjxVqR/CrWV4EK2
	czBdxUOmA3tLCb+WmAMLgJ0QbKhFD1sUida0J65OfQ/ztxYK1woGGLG8wZwfLvF39cKiYXkKjqVLU
	MjNn+kUhX7to6ZsBQ3NLDHBl54qa/U7tfB3VZSJdBajsMzhMD5n9tDGsVmlPp7yfGKyfXExlocSH5
	owTFSWEV2qI2u65712LNDgcRHWCT9kusowKTG9ntZ8nCXhUq4EWWdoPECm5OcYn57mXth7eCwip5x
	uEjCoUOypepuXCgiIPXqpjxZU4iGX2O4VT5SmtH0wcdUhCDIk3vGN2uvbHDtKmG4DCkDrEYRVJ59P
	0qBNofMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNvrz-00000001pZb-0CTb;
	Sat, 07 Jun 2025 15:54:07 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNvnf-00000001pEY-0hxS;
	Sat, 07 Jun 2025 15:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=k0
	A/8eOa3/qxuN6ibHKqnIXti28+I3rQhaeeIBTeaok=; b=Bd7bhc4UH4kUYHYnrT
	xuxQYoU8OouzKeeiwGx8rhHFRdD7g1HX+EW0UAnO6tWcDaTrk80HEEpOcv5jl8TC
	WhhoX+arHMFZaav1G7KREzvM1WyFYzcNR3bPYWrHCremOblaqZmYTMdks8q4FwI6
	jL2mQNq2ZPjrJRK65HRbJQ2qM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnzz17X0RoTZo8Gw--.4221S2;
	Sat, 07 Jun 2025 23:49:15 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	bhelgaas@google.com,
	kwilczynski@kernel.org,
	shawn.lin@rock-chips.com,
	heiko@sntech.de
Cc: robh@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 0/2] PCI: Consolidate PCIe message routing definitions and remove driver-specific duplicates
Date: Sat,  7 Jun 2025 23:49:11 +0800
Message-Id: <20250607154913.805027-1-18255117159@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnzz17X0RoTZo8Gw--.4221S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry7Wr1xuF4fWF1fCF4xtFb_yoWfArcE9F
	y8Xa9FvF1UGryayr4YyrW3JF95Z3yUZrn8Gan5tF45AFyfArn5XF98CrW8XFyrWF4rtF13
	Kr1DZw13CF4xAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRZNVkUUUUUU==
X-Originating-IP: [124.79.114.92]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOhNlo2hEXNoO6QABsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_084939_571359_385E0E8D 
X-CRM114-Status: UNSURE (   4.82  )
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

This series consolidates PCIe message routing definitions into the common
PCI core header, eliminating redundant enums in the Cadence and Rockchip
drivers. By using standardized macros (PCIE_MSG_TYPE_R_* and
PCIE_MSG_CODE_*) from drivers/pci/pci.h, we ensure alignment with the PCIe
r6.0 specification, reduce code duplication, and improve maintainability
across the PCI subsystem.

Hans Zhang (2):
  PCI: cadence: Replace private message routing enums with PCI core
    definitions
  PCI: rockchip: Remove redundant PCIe message routing definitions

 .../pci/controller/cadence/pcie-cadence-ep.c  |  2 +-
 drivers/pci/controller/cadence/pcie-cadence.h | 20 -------------------
 drivers/pci/controller/pcie-rockchip.h        | 14 -------------
 3 files changed, 1 insertion(+), 35 deletions(-)


base-commit: ec7714e4947909190ffb3041a03311a975350fe0
-- 
2.25.1


