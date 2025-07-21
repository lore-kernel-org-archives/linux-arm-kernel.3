Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDC2C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 07:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pzzj8GjdEcvknYctYdwrrCPn6t7CVQ+ZlgbfQZ6H/f4=; b=qqm0vqMpItPusLdIK/+DuI8mxb
	rKj8pCallQcJyMnBcXW+27R4mwX6TIbZ+HanbDO46Y7gGcfds/3H2F6rhoUK80Tk+0tH5TdNnuplk
	XiEkdQ8JuMlZMuRzDC3WoLNH93iXqkBL8NXKbh95evXwNrNhW1eJrrZ6pRJnQnAKiGsfNsZyZE775
	0j77nFJ6xmFC0vByDzgnaVU5exiphKr2z5ttcUXUdOCP5LSMkPYvQIxomgtp+uv+tOYmfqq9khPOF
	Cn7uqMXCiQIHl/MWdsrONbEX4w6DHYk292ZC20sYb1DuYKVEA8WTsSEFkExiQvPWkj+BoDogZRtaq
	5TI5FI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udksN-0000000GU6m-0j0V;
	Mon, 21 Jul 2025 07:23:55 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udkpx-0000000GTyJ-2vRk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 07:21:27 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56L7L8OZ752519;
	Mon, 21 Jul 2025 02:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753082468;
	bh=Pzzj8GjdEcvknYctYdwrrCPn6t7CVQ+ZlgbfQZ6H/f4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=j+v6Ue7BX+/w4cxYeYVTxgnSHIQ5WQ69WF2IJcL9ZB5aK6MYNQgR+mUM8RullUQMu
	 w+WDJWSFl2wfwCMNEzsIzxcFfL29cJKYvV3fu5XA+l53HIL+K0DrKJg9CrCFR/BLvr
	 I1HR4R4Owy3C4clDneFh2BWpedm04C13z7vEATSs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56L7L8lk107316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 21 Jul 2025 02:21:08 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 02:21:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 02:21:07 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56L7L6gT3438091;
	Mon, 21 Jul 2025 02:21:07 -0500
Date: Mon, 21 Jul 2025 12:51:06 +0530
From: s-vadapalli <s-vadapalli@ti.com>
To: <huaqian.li@siemens.com>
CC: <s-vadapalli@ti.com>, <baocheng.su@siemens.com>, <bhelgaas@google.com>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <diogo.ivo@siemens.com>, <helgaas@kernel.org>,
        <jan.kiszka@siemens.com>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
        <kw@linux.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <lpieralisi@kernel.org>, <nm@ti.com>, <robh@kernel.org>,
        <ssantosh@kernel.org>, <vigneshr@ti.com>
Subject: Re: [PATCH v10 4/7] PCI: keystone: Add support for PVU-based DMA
 isolation on AM654
Message-ID: <7eb6b36c-da94-4363-9ee2-d3d38ec46a22@ti.com>
References: <20250721025945.204422-1-huaqian.li@siemens.com>
 <20250721025945.204422-5-huaqian.li@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250721025945.204422-5-huaqian.li@siemens.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_002125_945738_D4B4D03D 
X-CRM114-Status: GOOD (  11.27  )
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

On Mon, Jul 21, 2025 at 10:59:42AM +0800, huaqian.li@siemens.com wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> The AM654 lacks an IOMMU, thus does not support isolating DMA requests
> from untrusted PCI devices to selected memory regions this way. Use
> static PVU-based protection instead. The PVU, when enabled, will only
> accept DMA requests that address previously configured regions.
> 
> Use the availability of a restricted-dma-pool memory region as trigger
> and register it as valid DMA target with the PVU. In addition, enable
> the mapping of requester IDs to VirtIDs in the PCI RC. Use only a single
> VirtID so far, catching all devices.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Li Hua Qian <huaqian.li@siemens.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

