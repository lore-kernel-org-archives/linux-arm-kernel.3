Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACDCCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/6zuCbaILpwUGXgd0XBseygKBWeHr1yHI3Nb4KQaoMM=; b=oL0Il76qamGTzxnWQXHbuqU3bz
	YiAMaoArg+C4ixCEpvij+e+oHOXoiokr3KAtmWfFisxbL3TUt95E4XerIuvxrOKQO2D2uDtYZifBi
	beS6ikY7eFTB3yeK29miuBvtcJmoNlJUHx3Vyy+c33LwWdmQE22FRStWEkL7lbgRHUgfCGTCmjGeB
	gQI8kUHw+x/o40nwqLTiqBcoq6Gw3LDNSgniKPxT2ee52lz/J6XyAYdwPUbG7hk5Y01erysA7FzEX
	OygW2h97FaF734SBxDPxyi5BEPK2NjjwVHlcDtTcRSGlty7auoHl2bzd2/jgS8DYvDhtAo/5flZ2k
	R/YvMg6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHihb-0000000379H-1DtF;
	Fri, 16 Oct 2026 14:14:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHihX-0000000376c-3pLf
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 14:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/6zuCbaILpwUGXgd0XBseygKBWeHr1yHI3Nb4KQaoMM=; b=AYNGucCrLZCcY6IaKXOyCLOMZV
	jvnaNZ+TQm05CqIKtL9j3BlpHwEp2em0HDSEfhu946QRtarFceagRCo3Ty4FSNAmlKEYmNSgmW+CI
	8zJ09LXoLwzGsu5zrKM3B8fFj07PGWrgmXBHS5b5G6mcT8nOZYCLlAEh+x3lwYQUoBOfEEqbE92Zn
	z5lxrVz0ZHGV+xVySdOoheF7YvJTAEy7UE0/Nm0lXUqjllGXCdrpD57GFotCWyqt8sImqILf30UDV
	VXt9kM/hAVseN0AtgQKJBBYsdYkHCSZTnvtYASSoyA3B66d7Va+0Gb/g9g4fDY5Z39Yo6ChP/Esie
	If8hvL+Q==;
Received: from m16.mail.163.com ([117.135.210.2])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHihT-00000001aCK-456u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/6
	zuCbaILpwUGXgd0XBseygKBWeHr1yHI3Nb4KQaoMM=; b=bcc0nMwByKWkH11LrI
	rQg4xGkU1ykMA+TGeGtNCzXXjTGOkqZjgC/B7ukDaVS4Oa8Bg64nj1obof/ITsIt
	avXba/WCq7gXi8xidK1U/ZnN3wL1CkeXMuXqqsiWl3UbwZiU6GnJqC8fRMVgY7ns
	j6TpHorIaN8c/x3JOkLte05qo=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3NysnMdJq1dUUAg--.27711S2;
	Fri, 16 Oct 2026 22:14:00 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/6] irqchip: validate ACPI MADT entries before use
Date: Fri, 16 Oct 2026 22:13:51 +0800
Message-Id: <20261016141357.2793046-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3NysnMdJq1dUUAg--.27711S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar15ZFykXw4DJw45Cw4xXrb_yoW8JFWrpF
	W5Za4rtr1SkFW7CrnxAw4UXF98JFn5trW7ta93t3W3Xrn5KF1DX3W7trZ0qF4fAw17GwnF
	9r4FqF4xuFyUAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUzpB-UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgil32rSMSgcFAAA3V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_151424_648431_F092B549 
X-CRM114-Status: UNSURE (   8.22  )
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

IRQ chip ACPI probing receives MADT records supplied by firmware.  The
common probe path does not currently verify that the complete declared
entry is contained in the table, and several callbacks access
fixed-size records without checking their minimum size.  Malformed
entries can therefore cause out-of-bounds reads during early boot.

Add the common declared-range check first, then validate the concrete
ITS, GIC, LIO-PIC, and BIO-PIC records in their respective callbacks.
Each patch remains independently buildable and limits its changes to one
parser implementation.

Jiale Yao (6):
  ACPI: irqchip: validate MADT entry bounds before probing
  irqchip/gic-v3-its: validate MADT ITS entries
  irqchip/gic-v3: validate MADT records before use
  irqchip/gic-v5-its: validate MADT translate frames
  irqchip/loongarch-cpu: validate MADT LIO-PIC entries
  irqchip/loongson-eiointc: validate MADT BIO-PIC entries

 drivers/acpi/scan.c                    |  7 +++++++
 drivers/irqchip/irq-gic-v3-its.c       |  3 +++
 drivers/irqchip/irq-gic-v3.c           | 18 ++++++++++++++++++
 drivers/irqchip/irq-gic-v5-its.c       |  3 +++
 drivers/irqchip/irq-loongarch-cpu.c    |  3 +++
 drivers/irqchip/irq-loongson-eiointc.c | 10 ++++++++--
 6 files changed, 42 insertions(+), 2 deletions(-)

-- 
2.34.1


