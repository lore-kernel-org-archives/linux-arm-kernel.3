Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181BAC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 07:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B31+gj3MwqN7LoN9ERg8P/Z27YfrdG3tWO6mWfVZyCw=; b=nUAgEwh/UtuIFBRgUXqG9pdoyB
	hm73oBpNP0jvzrKCtysNjGjpuDhMNOneBmo9NcKDBy9lTzjLKCRVxOkAN9ltxIuHlBuy12l1va9aH
	nHLQSK4jYpsv9sk7Cw27zZiEWmjaAe9IUXP35uUWoneCq2DbshF4L5b2KX+Qh6hmVABumgQfZEF3r
	ToLIKLurWd8rgQC8mWpar/L4an6tlvarphAq6ikVieAkll4W62/ahJL2MoiRZuuG8OVudwQgR/fh7
	okpbHSpIiVVpnOwpEFCl2hRTsbmvjT/vuJEkR8VxsktoDBvOhP/c9CGWbgEVLcgTu1xbNLFyj9bs7
	aILa9sdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKnS-00000007jCA-2sAe;
	Wed, 26 Mar 2025 07:03:30 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKlh-00000007izs-3O1y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 07:01:43 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52Q71Q0l1465705
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Mar 2025 02:01:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742972486;
	bh=B31+gj3MwqN7LoN9ERg8P/Z27YfrdG3tWO6mWfVZyCw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=wHjLVFPiQphWSE+jvlERGE9uinhReD6JvrZE6zL0ZfQrHAS6J5/GK3yiGGcN3K8nO
	 A0p4Bl5wEL8Y5A+wYypOy2nkLzACUuZDc6v1sSNGBjlKdPFdQIJKQYQsvayHAZ1UMt
	 8ns/kaYVdziTLdYb6RWPsllxR6U+7EJGJiUCPrXo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52Q71QKW081781
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Mar 2025 02:01:26 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Mar 2025 02:01:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Mar 2025 02:01:26 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52Q71P7s002368;
	Wed, 26 Mar 2025 02:01:25 -0500
Date: Wed, 26 Mar 2025 12:31:24 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Bjorn Helgaas
	<helgaas@kernel.org>, <lpieralisi@kernel.org>,
        <vigneshr@ti.com>, <manivannan.sadhasivam@linaro.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <rogerq@kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH] PCI: j721e: Fix the value of linkdown_irq_regfield for
 J784S4
Message-ID: <20250326070124.boluxjcid4ouszqk@uda0492258>
References: <20250313055519.j3bpvsm6govd5ytk@uda0492258>
 <20250313160215.GA736346@bhelgaas>
 <20250314041705.v5j2fjulol5ywvyq@uda0492258>
 <20250326065447.GC2822343@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250326065447.GC2822343@rocinante>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_000142_126018_FA5034F0 
X-CRM114-Status: GOOD (  17.93  )
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

On Wed, Mar 26, 2025 at 03:54:47PM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> [...]
> > > So I guess without this patch, we incorrectly ignore link-down
> > > interrupts on J784S4.  It's good to have a one-sentence motivation
> > > like that somewhere in the commit log that we can pull out and include
> > > in the merge commit log and the pull request.
> > 
> > Yes, we can prepend the following to the existing commit message:
> > "Link down interrupts on J784S4 SoC are missed because..."
> > 
> > resulting in the following updated paragraph in the commit message:
> > Link down interrupts on J784S4 SoC are missed because commit under Fixes
> > assigned the value of 'linkdown_irq_regfield' for the....
> 
> How does this look like?
> 
>   https://web.git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/j721e&id=b97b5b8cb603a4ba6b3f7f1b6065fa76e69bdb56
> 
> Let me know if you want any changes.

I will suggest minor changes to the first paragraph of the commit
message resulting in the following paragraph:

Commit under Fixes assigned the value of .linkdown_irq_regfield for the
J784S4 SoC as the "LINK_DOWN" macro corresponding to BIT(1), and as a
result, the Link Down interrupts on J784S4 SoC are missed.

Regards,
Siddharth.

