Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815A1C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sr/aIsRtVZTTmdi0MYbRiz/Hji+Rbh1yrHyYblC7Xtg=; b=GQeAOhdIbqbHAu7sEOm5XUfA4u
	IQs9IXYYRJiSMEVOoWNb+cmAxAxbGtoqu3hETpjjpxlj0DDWj3EiPwlzb2tcM26jlV9pdzsD6MuHZ
	haQUL5ia5KzhaWQZVsSqJFBn9GwKvnOfz3JlCAs0aVwrFjASMW86hBvAqQ0IyHmyqUMn+GOBkqqjW
	uCXpBImozsxvBXfx2v9QCCuU8aFReacxEHab+/CW7nkDI7CZHdE1mIIOKfdAY4Lb+UZa3GBoeSk/H
	198TI9Ln0WbIJgE7w6LSMFNWO15XVo0GJObEs+UDlOo46K6rf8frd0V01M7zDpbtJ3IGq0gdaIP4E
	cxEbza8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXu-0000000CqsO-1AP7;
	Thu, 03 Jul 2025 23:40:50 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSfj-0000000Clv3-0axT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 22:44:52 +0000
Received: by linux.microsoft.com (Postfix, from userid 1032)
	id 656EC201657A; Thu,  3 Jul 2025 15:44:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 656EC201657A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1751582690;
	bh=Sr/aIsRtVZTTmdi0MYbRiz/Hji+Rbh1yrHyYblC7Xtg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UShXlfxHkXNG+/p6Ib7AxuHsBUIW7JFqBhlADi7hQCc+vtt/Ur/1j3nh6AhR89UuE
	 XLNznSCEjpeN94Fclp5X/o1R13niEshvr1UqmyP+o5tRzadYLsSWlWJXnFx04wD7Qm
	 JcLMRZviYW3FZAldMYu7zn8/oQnB9ZRNzDB2JyD4=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	mhklinux@outlook.com,
	tglx@linutronix.de,
	bhelgaas@google.com,
	romank@linux.microsoft.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	x86@kernel.org,
	Nuno Das Neves <nunodasneves@linux.microsoft.com>
Subject: [PATCH v2 1/6] PCI: hv: Don't load the driver for baremetal root partition
Date: Thu,  3 Jul 2025 15:44:32 -0700
Message-Id: <1751582677-30930-2-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1751582677-30930-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_154451_202397_196FA547 
X-CRM114-Status: GOOD (  11.17  )
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

From: Mukesh Rathor <mrathor@linux.microsoft.com>

The root partition only uses VMBus when running nested.

When running on baremetal the Hyper-V PCI driver is not needed,
so do not initialize it.

Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
---
 drivers/pci/controller/pci-hyperv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index b4f29ee75848..4d25754dfe2f 100644
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -4150,6 +4150,9 @@ static int __init init_hv_pci_drv(void)
 	if (!hv_is_hyperv_initialized())
 		return -ENODEV;
 
+	if (hv_root_partition() && !hv_nested)
+		return -ENODEV;
+
 	ret = hv_pci_irqchip_init();
 	if (ret)
 		return ret;
-- 
2.34.1


