Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85258D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zg2mBZ9w8LQ344DKjJnn30Gx+/5hAbRUGgtojX6y6sg=; b=sy/GClzjiR53kzCSiT+A+HZEd3
	pRCnibJVVyUV6QCgvDRsBYdCJMQHo+slpKGCr6y79zxVJDXkgDnU+TK+wYHvtdhWfBkfq+lt/Lz9g
	wEuwhiEzySBUyC+Hfa+IUNBJOeoBeuwk7srbvh6FdyX41xdQx3/ZzveqhIpMSvd3Eu0Rjfa4z4kZf
	OYzs6uMlpLFfQ2UALIGGzoQ3zhYlHqHlfoMTcWYUqTVhBvdVW0x2yaViJl+cv1Ane2KSR+yZovo+r
	H8mQJzBgOW1Z15Nm1YLo/k2RCehhjFOzVymHd9Rjk8dqLj2gmzHZqpqjrBJHw0V0N4HYTQ5XJohh5
	orMkf2Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ415-00000003z89-1XzC;
	Mon, 01 Dec 2025 13:32:35 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3eY-00000003hes-2orP;
	Mon, 01 Dec 2025 13:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=zg2mBZ9w8LQ344DKjJnn30Gx+/5hAbRUGgtojX6y6sg=;
	b=LmEAuJIAIde6QXYHQ81OHgJz/63qNbztwo7RKc9HSU2kL+6HQUmsIwmwTzY61b
	24JKl6HgbWpx+FHYgqa1uOXnjRjezS2c/iu7CqODxB3RUNKIQPe7mFVaHkM4W2OW
	RCQMMEfJL2NStEMEqXO59/rG6HG9VW+iDV9WWWRP4ck+A=
Received: from emily-VMware-Virtual-Platform.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wBHrZAvky1pnbQPDw--.3674S2;
	Mon, 01 Dec 2025 21:08:01 +0800 (CST)
From: huyuye <huyuye812@163.com>
To: sunilvl@ventanamicro.com
Cc: ajones@ventanamicro.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atishp@rivosinc.com,
	bhelgaas@google.com,
	catalin.marinas@arm.com,
	conor.dooley@microchip.com,
	dfustini@tenstorrent.com,
	haibo1.xu@intel.com,
	lenb@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	rafael@kernel.org,
	robert.moore@intel.com,
	samuel.holland@sifive.com,
	tglx@linutronix.de,
	will@kernel.org,
	dai.hualiang@zte.com.cn,
	deng.weixian@zte.com.cn,
	guo.chang2@zte.com.cn,
	liu.qingtao2@zte.com.cn,
	wu.jiabao@zte.com.cn,
	lin.yongchun@zte.com.cn,
	hu.yuye@zte.com.cn,
	zhang.longxiang@zte.com.cn,
	huyuye <huyuye812@163.com>
Subject: Re:[PATCH v7 08/17] ACPI: pci_link: Clear the dependencies after probe
Date: Mon,  1 Dec 2025 21:07:55 +0800
Message-ID: <20251201130757.7032-1-huyuye812@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-9-sunilvl@ventanamicro.com>
References: <20240729142241.733357-9-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHrZAvky1pnbQPDw--.3674S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyUZF13Kw4xAry7Cw48WFg_yoWxZFbEgr
	n5AFyDZw4ftw17Gry3WF97JFW3K3y29r9xGa4xXrZ7Gw4fAa1DCan7Cr12vr15GF4xGr4a
	kr15uw47GwsI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjVOptUUUUU==
X-Originating-IP: [111.30.199.151]
X-CM-SenderInfo: 5kx135bhyrjqqrwthudrp/xtbBzwgXCGktkDVHogAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_050919_101735_F1E04901 
X-CRM114-Status: UNSURE (   5.77  )
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

Hi, sunilvl

Based on the above patch, I understand that you previously resolved dependencies between Link devices and PCI Host Bridges by calling acpi_dev_clear_dependencies(device). I would like to ask: on RISC‑V platforms, if we need to manage dependencies between multiple PCI Host Bridges, could this be addressed by adding a call to acpi_dev_clear_dependencies(device) at the end of the acpi_pci_root_add enumeration function?

Initialization order dependencies can be defined via the ACPI _DEP method in the DSDT. For example, if host bridge B depends on host bridge A, bridge B should not be enumerated until bridge A is fully initialized.

Best regards,
Yuye


