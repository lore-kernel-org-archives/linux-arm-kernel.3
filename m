Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99848CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QAI1/iuQnmfWqwTdKggQ6qlQpdt/mhf+D90s4RMqkNI=; b=f1tpi22mGFWfLPYt2xNn8M/ZW5
	MkV4SBwRXNKbZO4uNd9GFRIu0k7faGsUXa1LEl7XtgLsev3rDAW4IgKe+67c19yTdiNowkT7Mvors
	OYczvVurtPOFi7PcQWSByJxgrSeaKxw/s5En8GV6WFOke8rSjWP8PmXKncFwX3rUlNJ8HjvjNJuxm
	nIEDqi+LnXkFVKZgQw1XMKg/qcRGQgSL0OYEJtCOxh0CThsucrvgaUbsdAlX0wE09c9W1xcJy9qe/
	KNgqDf2wa6U14mMwXHZZPGiiLFgT+xA/OkiPEVzDsBsEOx1zo0j1r4PSavZrlJeNfsJ8AbZWxs67t
	E0AK06cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0ha-00000008TEJ-1NGg;
	Fri, 12 Sep 2025 10:08:22 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0hY-00000008TDM-1fBv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:08:21 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CA89L71011360;
	Fri, 12 Sep 2025 05:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757671689;
	bh=QAI1/iuQnmfWqwTdKggQ6qlQpdt/mhf+D90s4RMqkNI=;
	h=From:To:CC:Subject:Date;
	b=OqAPmlMAOuoKOdqjkDQVk7CR8Zfr19sScOkUTLrQ9o40U29VXVT5qcbB+0zUFJgyC
	 ATU1kr8XH8wO2J8FsofrFlavpJEZZw3D9em9ZpQCFnsdi1/fYEEw2kEOIF3M6LR0MC
	 fFIHP6GLgpgy0CCjwk3di+0WUK90kIcw19WXiq64=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CA89vI1904747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 05:08:09 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 05:08:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 05:08:08 -0500
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CA83MG3740807;
	Fri, 12 Sep 2025 05:08:03 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <cassel@kernel.org>,
        <kishon@kernel.org>, <sergio.paracuellos@gmail.com>,
        <18255117159@163.com>, <jirislaby@kernel.org>, <m-karicheri2@ti.com>,
        <santosh.shilimkar@ti.com>
CC: <stable@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH 0/2] PCI: Keystone: __init and IRQ Fixes
Date: Fri, 12 Sep 2025 15:37:57 +0530
Message-ID: <20250912100802.3136121-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_030820_524532_C6FC30D0 
X-CRM114-Status: GOOD (  16.91  )
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

Hello,

This series is based on commit
320475fbd590 Merge tag 'mtd/fixes-for-6.17-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux
of Mainline Linux.

The first patch in the series has been posted as a Fix in contrast to
its predecessor at:
https://lore.kernel.org/r/20250903124505.365913-10-s-vadapalli@ti.com/
based on the feedback provided by Jiri Slaby <jirislaby@kernel.org> at:
https://lore.kernel.org/r/3d3a4b52-e343-42f3-9d69-94c259812143@kernel.org/
Since the Fix is independent of enabling loadable module support for the
pci-keystone.c driver, it is being posted as a new patch.

Checking out at the commit of Mainline Linux which this series is based
on, I noticed an exception triggered by the pci-keystone.c driver during
its probe. Although this is not a fatal exception and Linux continues to
boot, the driver is non-functional. I root-caused the exception to
free_initmem() freeing the memory associated with the ks_pcie_host_init()
function in the driver before the driver's probe was invoked. This
appears to be a race condition but it is easily reproducible with the
Linux .config that I have used. The fix therefore is to remove the
__init macro which is implemented by the second patch in the series.

For reference, the logs for the case where Linux is built by checking
out at the base commit of Mainline Linux are:
https://gist.github.com/Siddharth-Vadapalli-at-TI/f4891b707921c53dfb464ad2f3a968bf
and the logs clearly prove that the print associated with free_initmem()
which is:
[    2.446834] Freeing unused kernel memory: 4864K
is displayed prior to the prints associated with the pci-keystone.c
driver being probed which is:
[    7.707103] keystone-pcie 5500000.pcie: host bridge /bus@100000/pcie@5500000 ranges:

Building Linux by applying both patches in the series on the base commit of
Mainline Linux, the driver probes successfully without any exceptions or
errors. This was tested on AM654-EVM with an NVMe SSD connected to the
PCIe Connector on the board. The NVMe SSD enumerates successfully.
Additionally, the 'hdparm' utility was used to read from the SSD
confirming that the SSD is functional. The logs corresponding to this are:
https://gist.github.com/Siddharth-Vadapalli-at-TI/1b09a12a53db4233e82c5bcfc0e89214

Regards,
Siddharth.

Siddharth Vadapalli (2):
  PCI: keystone: Use devm_request_irq() to free "ks-pcie-error-irq" on
    exit
  PCI: keystone: Remove the __init macro for the ks_pcie_host_init()
    callback

 drivers/pci/controller/dwc/pci-keystone.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0


