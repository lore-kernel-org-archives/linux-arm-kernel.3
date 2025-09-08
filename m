Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79EECA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 07:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=INGtYHjQfpr0I5BpFzHQqufbow0F/EqArjbMwO9sRLw=; b=XeE4TTJH63Mcmy+yZsWpSJPPb7
	KQ8LMGeXljGQBUChHXVs5njHC4ez1dzE0lIvIrc+BQi5sQfNrS2OQ4BykZvYTpcm1ng1KgqvaQpoL
	acUHdOTqJDRk0nKlmGhrbiVgdT2nQCo5bsKY+d8VvqK77FtYQCOMFV+9ITC3uxuKZ46jG1A8PCBPa
	KybApqd6EuIjnqU5oG+O/JfwjOLnTw7bqbuCnMAqqGSiM7Snv+PyfhXlSD95nho4HjdDhXTXf27/p
	J40d9nH15CQIjI2VEAtbrT+1u/+tb1SXmaJnG/LHp2zX6Lgtj0NHbVSHW64xJ1eeBj0m1bZUnUYv0
	Zl2pCmGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvW9A-0000000FEJ8-08ov;
	Mon, 08 Sep 2025 07:18:40 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvW4Z-0000000FCtQ-35kG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:13:56 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5887DPKv3737891;
	Mon, 8 Sep 2025 02:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757315605;
	bh=INGtYHjQfpr0I5BpFzHQqufbow0F/EqArjbMwO9sRLw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=irxHTRSuhFggDIGqPEk3fMSzFmzFNJ1qxO+PSh9Lz7t0kFo9qPudWy2jApW0RHuyY
	 B6KucuhyE3Knxbp9Rz4PrVUFYWRU9h5uq5EEQHfP9aHZfknneXTOtkd7U6O+Mu5hHC
	 0wE1BS43NS3GTJN9B4sRrC+XHYS0He3YPYdkocJQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5887DPNw2822048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 02:13:25 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 02:13:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 02:13:24 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5887DN9T485025;
	Mon, 8 Sep 2025 02:13:24 -0500
Date: Mon, 8 Sep 2025 12:43:23 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
        <jingoohan1@gmail.com>, <fan.ni@samsung.com>,
        <quic_wenbyao@quicinc.com>, <namcao@linutronix.de>,
        <mayank.rana@oss.qualcomm.com>, <thippeswamy.havalige@amd.com>,
        <quic_schintav@quicinc.com>, <shradha.t@samsung.com>,
        <inochiama@gmail.com>, <cassel@kernel.org>, <kishon@kernel.org>,
        <18255117159@163.com>, <rongqianfeng@vivo.com>, <jirislaby@kernel.org>,
        <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH 00/11] PCI: Keystone: Enable loadable module support
Message-ID: <5825153e-833b-4aed-bbd5-e0f58e922aa0@ti.com>
References: <20250903124505.365913-1-s-vadapalli@ti.com>
 <2gzqupa7i7qhiscwm4uin2jmdb6qowp55mzk7w4o3f73ob64e7@taf5vjd7lhc5>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2gzqupa7i7qhiscwm4uin2jmdb6qowp55mzk7w4o3f73ob64e7@taf5vjd7lhc5>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_001355_866024_5B7D9207 
X-CRM114-Status: GOOD (  23.48  )
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

On Mon, Sep 08, 2025 at 09:09:08AM +0530, Manivannan Sadhasivam wrote:
> On Wed, Sep 03, 2025 at 06:14:41PM GMT, Siddharth Vadapalli wrote:
> > Hello,
> > 
> > This series enables support for the 'pci-keystone.c' driver to be built
> > as a loadable module. The motivation for the series is that PCIe is not
> > a necessity for booting Linux due to which the 'pci-keystone.c' driver
> > does not need to be built-in.
> > 
> 
> There are concerns from the irqchip maintainers that unloading an irqchip
> controller is a bad idea. We had a lot of previous discussions on this topic.

Ok, I wasn't aware of this. Thank you for pointing this out.

> 
> But I would certainly welcome the idea of building a controller driver as a
> module (tristate) and prevent unloading it during runtime (by keeping it as
> builtin_platform_driver).

I will update the series to retain 'builtin_platform_driver' while
enabling tristate support. Since the intent of the series is primarily
to convert the driver to support being built as a loadable module, and
unloading it is only a secondary requirement which is optional, I agree
with your suggestion.

> 
> > Series is based on linux-next tagged next-20250903.
> > 
> 
> No need to base your patches on top of linux-next. Either do it on top of -rc1
> or pci/next.

I will keep this in mind when I post the v2 series.

Thank you for your feedback.

Regards,
Siddharth.

