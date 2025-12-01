Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2F5D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jcweNi6psPpjlZDmC6qZ/Q4mO7N38WsRkszImaw/p0=; b=iKlIzGsceLriTvi6EB4CfU6sZS
	Db7YTLxG9hRzoP2TXEZxxaq4dRwyhIkBsh1Qqke9OEQueDzgdhQIOhTId1lNkf+1Z0n+ASuvY4T4c
	jv6pKZRKpk/bADD9CXrBwmGbdYaVGFIE+2AZ9c0ZJibO7RO+xyNRWXZv7h9zkTgTvtqex8S2NGqN/
	bWbnBJLQvV/zBsI7swfZVF6y8VOzRLtFg0PXAVWbWVsP6uTAztcOwCHohtmOYRuKmr0nVje4A6Xyn
	1HHgOtec+zb5ZA2uElKNSMLXvdmP3AmWSWudOy7sRL8Inz0gGAzRCm61bCvPBsFq4pfXqgDrel8ts
	uZigMmfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4f1-00000004493-0oYm;
	Mon, 01 Dec 2025 14:13:51 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4ey-0000000446m-21tl;
	Mon, 01 Dec 2025 14:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=4jcweNi6psPpjlZDmC6qZ/Q4mO7N38WsRkszImaw/p0=;
	b=fLHGQTB2wwpyAu5ym/trd8UA27IhVG8yhhJGQFFZO+C46/FSaJA398a3OGiE8y
	oFIgx/AYYq+CfIXUNiV56NthlUeuQ5u/Rzhktg0uOuS5P0rXaxxtf2RRu0oaXWnC
	dhNBE1cSq399PRWZNKq/vhKcLL4cdIKcBq8vAySanWS1Q=
Received: from emily-VMware-Virtual-Platform.. (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3Ha9Qoi1p2MM7GA--.20690S2;
	Mon, 01 Dec 2025 22:12:34 +0800 (CST)
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
Date: Mon,  1 Dec 2025 22:12:29 +0800
Message-ID: <20251201141230.12656-1-huyuye812@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240729142241.733357-9-sunilvl@ventanamicro.com>
References: <20240729142241.733357-9-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3Ha9Qoi1p2MM7GA--.20690S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4DWr1ruFy8AFWkArykGrg_yoWfuwc_Kr
	1kAFyDZw4fK3W7tFy3GFykJFW3K3yagr9xGayIq392kw43Zan8Cws29r4Iyr45CFWxGrn0
	kr13Zw47K34a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjVOptUUUUU==
X-Originating-IP: [111.30.199.151]
X-CM-SenderInfo: 5kx135bhyrjqqrwthudrp/1tbioBkXCGktloy9jAADsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_061348_854922_CDAB4C22 
X-CRM114-Status: UNSURE (   8.58  )
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

> Hi, sunilvl

> Based on the above patch, I understand that you previously >resolved dependencies between Link devices and PCI Host Bridges by >calling acpi_dev_clear_dependencies(device). I would like to ask: >on RISC‑V platforms, if we need to manage dependencies between >multiple PCI Host Bridges, could this be addressed by adding a >call to acpi_dev_clear_dependencies(device) at the end of the >acpi_pci_root_add enumeration function?

> Initialization order dependencies can be defined via the ACPI >_DEP method in the DSDT. For example, if host bridge B depends on >host bridge A, bridge B should not be enumerated until bridge A is >fully initialized.

> Yes, that should work.
> Regards,
> Sunil

Hi,Sunil

I'm truly honored by your affirmation of my answer.Do you think this solution has a chance of being accepted into the upstream kernel? Are there any unintended side effects we may have overlooked?

Regards,
Yuye


