Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B32D29FA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9E01b5lO3ji2wEte0jqqAxO6EzU7eTUFjSnqcONGvZc=; b=GGwxeRQl5aqrlnOTFtUeuOtta+
	btH4q96gXl7w3u+0yFNx4ffxp54jj93osX08Nhu9wrM6vozMK88uOvXtNu182NF9dYxu4GpLHxp+Z
	06eC53UHuBYB3QgAZ1Kl9WyJRmP5LfTwtEaPSaqRj8pVfeBUo69PooFimCeFITirMkKY5dNmM2xMm
	EnH32OMgSHlcYjFmQOFdRRW8pF5UWFAUgEbVPwu8A205Vqfq4atWWegO0uL2PljV1oYFctiYtlq8h
	qIP0w6WdUsRWthH1tBsDitHHYY7Ce15RFi8DvSsTs8r7r6Vx9vE+WneGt/uOkyOAZgK1w2d8IDuBC
	vjJIUW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8aHB-000000025JO-3ogv;
	Wed, 06 Nov 2024 07:16:25 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ZC1-00000001wPN-13AK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 06:07:02 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A666eoj064806;
	Wed, 6 Nov 2024 00:06:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730873200;
	bh=9E01b5lO3ji2wEte0jqqAxO6EzU7eTUFjSnqcONGvZc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qPDAHpXryy/zsx9k3xi+1+JktRZXpwTSAAaZbCxu+fVm9me6Ucvf+J9wFHMvFMyAG
	 rBbYwq3eCJu6qGSz87s/qsiRexf7/6RQDU/9N8q8kIVua1fJW0NBw8/BqbLHm1yBxT
	 8bKkjOm2LgfkvqIbD8gyG473RFCpgZvZidgSvDuY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A666eAH057444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 00:06:40 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 00:06:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 00:06:40 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A666cvV042705;
	Wed, 6 Nov 2024 00:06:39 -0600
Date: Wed, 6 Nov 2024 11:36:38 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kw@linux.com>, <robh@kernel.org>, <bhelgaas@google.com>,
        <manivannan.sadhasivam@linaro.org>, <kishon@kernel.org>,
        <u.kleine-koenig@pengutronix.de>, <cassel@kernel.org>,
        <dlemoal@kernel.org>, <yoshihiro.shimoda.uh@renesas.com>,
        <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH v2 1/2] PCI: keystone: Set mode as RootComplex for
 "ti,keystone-pcie" compatible
Message-ID: <5983ad5e-729d-4cdc-bdb4-d60333410675@ti.com>
References: <20240524105714.191642-2-s-vadapalli@ti.com>
 <20241106005758.GA1498067@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241106005758.GA1498067@bhelgaas>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_220701_405759_2BCA808C 
X-CRM114-Status: GOOD (  22.79  )
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

On Tue, Nov 05, 2024 at 06:57:58PM -0600, Bjorn Helgaas wrote:

Hello Bjorn,

> On Fri, May 24, 2024 at 04:27:13PM +0530, Siddharth Vadapalli wrote:
> > From: Kishon Vijay Abraham I <kishon@ti.com>
> > 
> > commit 23284ad677a9 ("PCI: keystone: Add support for PCIe EP in AM654x
> > Platforms") introduced configuring "enum dw_pcie_device_mode" as part of
> > device data ("struct ks_pcie_of_data"). However it failed to set mode
> > for "ti,keystone-pcie" compatible. Set mode as RootComplex for
> > "ti,keystone-pcie" compatible here.
> 
> 23284ad677a9 appeared in v5.10.  
> 
> But I guess RC support has not been broken since v5.10 because we
> never used ks_pcie_rc_of_data.mode anyway?
> 
> It looks like the only use is here:
> 
>   #define DW_PCIE_VER_365A                0x3336352a
>   #define DW_PCIE_VER_480A                0x3438302a
> 
>   ks_pcie_probe
>   {
>     ...
>     mode = data->mode;
>     ...
>     if (dw_pcie_ver_is_ge(pci, 480A))
>       ret = ks_pcie_am654_set_mode(dev, mode);
>     else
>       ret = ks_pcie_set_mode(dev);

"mode" is used later on during probe at:

....
	switch (mode) {
	case DW_PCIE_RC_TYPE:
	...
	case DW_PCIE_EP_TYPE:
	...
	default:
		dev_err(dev, "INVALID device type %d\n", mode);
	}
....

> 
> so we don't even look at .mode unless the version is v4.80a or later,
> and this is v3.65a?
> 
> So this is basically a cosmetic fix (but still worth doing for
> readability!) and doesn't need a stable backport, right?

I suppose that "data->mode" will default to zero for v3.65a prior to
this commit, corresponding to "DW_PCIE_UNKNOWN_TYPE" rather than the
correct value of "DW_PCIE_RC_TYPE". Since I don't have an SoC with the
v3.65a version of the controller, I cannot test it out, but I presume
that the "INVALID device type 0" error will be displayed. Though the probe
will not fail since the "default" case doesn't return an error code, the
controller probably will not be functional as the configuration associated
with the "DW_PCIE_RC_TYPE" case has been skipped. Hence, I believe that
this fix should be backported.

Regards,
Siddharth.

