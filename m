Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223D4C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcJRCq97cA9RLrXj6jiFtR2hoqI5UaEO/vTNRSGV6wI=; b=FtWdCCHQvYtzo9eYh3CtrlLKpW
	pmYqVgYI5/HohDE3WMDNA8csbdUh8gWRSviq36SiOlCIIgiArXIiuw7U5RUDAipKGDJI1KxlAjJq5
	9I8RNLS0zAHKbMcgtp30zzUSetgHmF88d+Zlm6OvVYPmupRhZFW4tDpjTJP0KldPCuhKdJ8neLptn
	n2DdbaP3Xw1mEcXLU/2dVxcSL3xogTe3aJ1FcYC6ANTixTzwWaw+2D3q3YSPbpZPTChREhx1FEqX1
	2MjZezZ2Lvy3hkOl0POcnH+L7GANaKJRURV/dlbDcpeY+/frhwdPJDP3Et5m1LxsqCNvl9e98MRE6
	/KR6vKew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR0D-0000000CUL1-2iZI;
	Thu, 03 Jul 2025 20:57:53 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMAH-0000000BsyD-2cyt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:47:59 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bY1N8715Vz6M4lV;
	Thu,  3 Jul 2025 23:46:48 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 43813140447;
	Thu,  3 Jul 2025 23:47:46 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 3 Jul
 2025 17:47:45 +0200
Date: Thu, 3 Jul 2025 16:47:43 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Sascha
 Bischoff" <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, Peter Maydell <peter.maydell@linaro.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v7 00/31] Arm GICv5: Host driver implementation
Message-ID: <20250703164743.00004f3e@huawei.com>
In-Reply-To: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_084757_806345_B7FD57A4 
X-CRM114-Status: UNSURE (   8.87  )
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


> ---
> Changes in v7:
> - Added CDDI/CDDIS/CDEN FIELD_PREP(hwirqid) for instruction preparation
> - Fixed IST/DT/ITT L2 size selection logic for 64K PAGE_SIZE

Hi Lorenzo,

I took another look, particularly focused on this aspect and it all looks good to
me.  Thanks for making these last minute changes.

No more RBs from me but that is just down to my lack of confidence that I know my way
around the spec well enough. It's not anything to do with the content of your series!

Thanks

Jonathan


> - Reordered some ITS error paths according to review
> - Link to v6: https://lore.kernel.org/r/20250626-gicv5-host-v6-0-48e046af4642@kernel.org

