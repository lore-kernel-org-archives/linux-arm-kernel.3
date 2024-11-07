Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AAAD5AE61
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 04:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Smefj2JoEA0WPG52LM77apkAI/T2PGFdONYOL+motPc=; b=Hi7bOzdcyRlNg00DfZ4sjZBSrr
	HxO0j/+SxkeU6zzMbGmOXGkb8TxgAQToHR/NmkkF/WnhzVsUgHFWAqAvnSOeQ+gF8mzpSjKCCAdvF
	z8OXgnHZlnabNlvRP7HJm/GONxUdgCEH9uQIbvVVK792R06RLitIuDfgOtEXov/QGPfZ42n6DlJXw
	dsqRrzmROg2V5VT2zRJjBa6hps5cw7sb4irHOohFhObM0D4t5Xe6YmzqYhXd6cIjSB21PfouXg4/J
	otBD9+Cv/i+oVfBE0M34AZS8c5rpAWL2U4EOubUkHv2RLZpf26mOWwTlwnY7eqt+2Iy+Uv10rcu8Z
	n6MJrlog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8uLA-00000005eAi-2z9S;
	Thu, 07 Nov 2024 04:41:52 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8uJR-00000005dys-2x7J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 04:40:07 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A74duqZ038732;
	Wed, 6 Nov 2024 22:39:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730954396;
	bh=Smefj2JoEA0WPG52LM77apkAI/T2PGFdONYOL+motPc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XkS3s5aviT4YQUW9oziQzJW6u7Bro4/lKQu+nhITyJ3FWeMMBgKHPdiCvf3XfYk0F
	 OG92pn/kgYNHmm3ixrduzFui++aQrBOqt4o6ehwYFFtnnd4pPrvvd7ZUi4W28gXSp/
	 onx1CA9J309HF8s+B05TVJjqb/atwEU5K2hvIHTY=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A74duqG023536
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 22:39:56 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 22:39:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 22:39:55 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A74dsnc005772;
	Wed, 6 Nov 2024 22:39:55 -0600
Date: Thu, 7 Nov 2024 10:09:54 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
CC: Bjorn Helgaas <helgaas@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>,
        <manivannan.sadhasivam@linaro.org>, <kishon@kernel.org>,
        <u.kleine-koenig@pengutronix.de>, <cassel@kernel.org>,
        <dlemoal@kernel.org>, <yoshihiro.shimoda.uh@renesas.com>,
        <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH v2 1/2] PCI: keystone: Set mode as RootComplex for
 "ti,keystone-pcie" compatible
Message-ID: <4fc87e39-ae2f-4ac9-ace3-26b2b79e2297@ti.com>
References: <5983ad5e-729d-4cdc-bdb4-d60333410675@ti.com>
 <20241106154945.GA1526156@bhelgaas>
 <20241106160520.GD2745640@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106160520.GD2745640@rocinante>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_204005_930528_1AF11825 
X-CRM114-Status: GOOD (  23.67  )
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

On Thu, Nov 07, 2024 at 01:05:20AM +0900, Krzysztof Wilczyński wrote:

Hello Krzysztof,

> Hello,
> 
> [...]
> > > I suppose that "data->mode" will default to zero for v3.65a prior to
> > > this commit, corresponding to "DW_PCIE_UNKNOWN_TYPE" rather than the
> > > correct value of "DW_PCIE_RC_TYPE". Since I don't have an SoC with the
> > > v3.65a version of the controller, I cannot test it out, but I presume
> > > that the "INVALID device type 0" error will be displayed. Though the probe
> > > will not fail since the "default" case doesn't return an error code, the
> > > controller probably will not be functional as the configuration associated
> > > with the "DW_PCIE_RC_TYPE" case has been skipped. Hence, I believe that
> > > this fix should be backported.
> > 
> > I guess nobody really cares too much since it's been broken for almost
> > four years.
> > 
> > But indeed, sounds like it should have a stable tag and maybe a commit
> > log hint about what the failure looks like.
> 
> Added Cc for stable releases.  Siddharth, let me know how to update the
> commit log per Bjorn feedback, so I can do it directly on the branch.

The existing commit message could be replaced by the following:

------------------------------------------------------------------------
commit 23284ad677a9 ("PCI: keystone: Add support for PCIe EP in AM654x
Platforms") introduced configuring "enum dw_pcie_device_mode" as part of
device data ("struct ks_pcie_of_data"). However it failed to set the mode
for "ti,keystone-pcie" compatible.

Since the mode defaults to "DW_PCIE_UNKNOWN_TYPE", the following error
message is displayed:
	"INVALID device type 0"
for the v3.65a controller. Despite the driver probing successfully, the
controller may not be functional in the Root Complex mode of operation.

So, set the mode as Root Complex for "ti,keystone-pcie" compatible to fix
this.
------------------------------------------------------------------------

Regards,
Siddharth.

