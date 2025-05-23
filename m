Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F168EC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 05:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EB7rgMEVkNHPNOu5eE3mPD6AxaPnrpq2uXYFS720rCk=; b=hTmtdoskgyz4HSpZnvOt989Vc2
	Te5s40Jw03kU9XLocsIH4Fr6aICXEI38zQXqjvMY90ll9OrFj17h1odI1VwftwPMYkryV+y9zZ5oK
	ot8ylV+P9pqHsbigOLduo1ufkcZCwilatNxVT3BjgFb2xg2Lxcf2exdCSyK21zzN8vPl1/0jM6w3K
	qJdY7imNmmwo9sCLqMKcpP9eeag0E8sYRXw3rGxkfF5k/Zg6bjuyCPEtO3kixZbtQQJ/D710wCYxF
	m4RgRWH5BzKk2bqJf4ZZA4YC+UIgMVlRLi2DFQ6x0qGWPYkHi5Dwmw6qWx4ta0LMPJkC8I4Zugi+b
	F89+HvFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL47-000000031ic-2V9m;
	Fri, 23 May 2025 05:35:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIL1w-0000000318P-2Xmk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 05:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EB7rgMEVkNHPNOu5eE3mPD6AxaPnrpq2uXYFS720rCk=; b=M02x+o+0UgGpM80C95tg1vbbjk
	0leH5hHfRMPby8BcGUmwv3qwlQYA3BT3M3MUSdbJvnsoWpVbe6RPhL3NIdtliHvnavEZJieqpb4JQ
	9aX/MEye0MoaiFwXKvYWiWdQt0NonynSHGaUStH3PyZCmxUjF3EmiPR33weYOOA/S5TxNwxfk5ZEi
	1Gev7+QF4VxuuoJFzBGp7NOq2yzAxre+CXAXt1lClLW17X28NiVzPph+t3yS6VfNaDWXYYxcanC6M
	flsn3mi/FZ60/CsFp5OxCnPWFaYOfQwGNIDVaCoB6A4zVBz0GXXrniSmGfTbvc3vo9GyhYKMfu1j2
	EYa/fUKA==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIL1r-0000000190W-1keT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 05:33:14 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54N5WfDw833898;
	Fri, 23 May 2025 00:32:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747978361;
	bh=EB7rgMEVkNHPNOu5eE3mPD6AxaPnrpq2uXYFS720rCk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CsKaf0AwywPoU+/W5Pthl4dZP8BJPZm5H8gPOpT8k/DUoIXzz2koUH8cYjriuodT0
	 t4pVdSLU9pAFN0AyZ398wPfeI7g/Gbg//EdA0CuMF2jJt+1GLaVXyH5cTyqmFrbQ5k
	 VLSaDbaqee2M/54LBOndIs+IDf4egJiY2A15wpwE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54N5Wffd4034342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 00:32:41 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 00:32:40 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 00:32:40 -0500
Received: from localhost (dhcp-10-24-69-136.dhcp.ti.com [10.24.69.136])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54N5WdIF1038466;
	Fri, 23 May 2025 00:32:39 -0500
Date: Fri, 23 May 2025 11:02:38 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Frank Li <Frank.li@nxp.com>
CC: <s-vadapalli@ti.com>, <bhelgaas@google.com>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>, <kw@linux.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <lpieralisi@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <robh@kernel.org>, <tony@atomide.com>, <vigneshr@ti.com>
Subject: Re: [PATCH v2 1/1] Revert "ARM: dts: Update pcie ranges for dra7"
Message-ID: <5a8a4f18-d5cc-4fd1-aeda-2e739502e0eb@ti.com>
References: <20250411153454.3258098-1-Frank.Li@nxp.com>
 <aC97HguxSt56BkHa@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aC97HguxSt56BkHa@lizhi-Precision-Tower-5810>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_063311_807675_556E277D 
X-CRM114-Status: GOOD (  16.27  )
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

On Thu, May 22, 2025 at 03:29:34PM -0400, Frank Li wrote:

Hello Frank,

> On Fri, Apr 11, 2025 at 11:34:54AM -0400, Frank Li wrote:
> > This reverts commit c761028ef5e27f477fe14d2b134164c584fc21ee.
> >
> > The commit being reverted updated the "ranges" property for the sake of
> > readability. However, this change is no longer appropriate due to the
> > following reasons:
> >
> > - On many SoCs, the PCIe parent bus translates CPU addresses to different
> > values before passing them to the PCIe controller.
> > - The reverted commit introduced a fake address translation, which violates
> > the fundamental DTS principle: the device tree should reflect actual
> > hardware behavior.
> >
> > Reverting this change prepares for the cleanup of the driver's
> > cpu_addr_fixup() hook.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> s-vadapalli:
> 
> 	Any update about this patch? it prepare to remove cpu_addr_fixes()!

This patch looks good to me, but I was hoping that Tony Lindgren, who is
the author of the commit being reverted, would provide feedback as well.

Regards,
Siddharth.

