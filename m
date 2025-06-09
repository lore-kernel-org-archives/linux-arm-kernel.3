Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499EAC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 12:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNYHfUVgW0j5DR00GYyu8I5eNk46DUSi9eqj7IxksLs=; b=QArVvJ4sS1CFTc/HEYdO02/0Eb
	Mc0cSTdpjCw4H1B8JEfCDAj4x0k0BpOGpHaJVjv8mf2OYxbGeP5OJf5w0YqareJ4z9G9HaNpyIuy9
	/N96VHaQUu88cF2F1VeOJ6OW59QuheLpSXLfqa8xRhkF6il47HLKUxuYgQDzv0y++eNmACJBXpq/w
	8APiL8SKbYWqjTn2Y/guBiUpKzkZsMnzm7Sh+CumImvEzBjBKB+Zm+ylOZLMQtux49kU7naZ0L2jE
	2iqqdBBqWc+j6ny6tMXSPHFVECcaoGNEQ1Ap8n9PlE4cz7zX+RAtFJnPKk/5lIr052+uRqskltd8x
	enSt66Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObFI-000000044f2-0JyE;
	Mon, 09 Jun 2025 12:04:56 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObAE-00000004424-16B0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 11:59:43 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559BxVsV1980964;
	Mon, 9 Jun 2025 06:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749470371;
	bh=bNYHfUVgW0j5DR00GYyu8I5eNk46DUSi9eqj7IxksLs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ckzCGdWdPEln956o6q0up2acMKeHoUczmeCPh5am/+CkrrkcukIYvppbencGgrIQ0
	 PW6vHFLux94sx/W+u4HHzHjHOI6TqHOyr657pGUOt0ZkRkRDP9zQImvz2Bnq4DcRAf
	 Yi1eSNSeyvpuy+/CYUybYwWpYQRrXD2cNVPEn6J8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559BxVkx3783095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 06:59:31 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 06:59:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 06:59:30 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559BxUGP1219701;
	Mon, 9 Jun 2025 06:59:30 -0500
Date: Mon, 9 Jun 2025 06:59:30 -0500
From: Nishanth Menon <nm@ti.com>
To: Hrushikesh Salunke <h-salunke@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <s-vadapalli@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <danishanwar@ti.com>, <srk@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase
 tag to "pcie0_ep"
Message-ID: <20250609115930.w2s6jzg7xii55dlu@speckled>
References: <20250609085429.2334652-1-h-salunke@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250609085429.2334652-1-h-salunke@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_045942_389373_DFDC13C5 
X-CRM114-Status: GOOD (  16.47  )
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

On 14:24-20250609, Hrushikesh Salunke wrote:
> AM64X SoC has one instance of PCIe PCIe0. To support PCIe boot on
> AM64X SoC PCIe0 instance needs to be in endpoint mode and it needs to
> be functional at all stages of PCIe boot process. Thus add the
> "bootph-all" boot phase tag to "pcie0_ep" device tree node.
> 
> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
> ---
> This patch is based on commit
> 475c850a7fdd Add linux-next specific files for 20250606
> 
>  arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
> index 432751774853..268a3183753e 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
> @@ -30,6 +30,7 @@ &cbass_main {
>  	interrupt-parent = <&gic500>;
>  
>  	pcie0_ep: pcie-ep@f102000 {
> +		bootph-all;

For new entries being added, please follow
Documentation/devicetree/bindings/dts-coding-style.rst

for guidance, look at where bootph is being added in more recent patches.

>  		compatible = "ti,am64-pcie-ep", "ti,j721e-pcie-ep";
>  		reg = <0x00 0x0f102000 0x00 0x1000>,
>  		      <0x00 0x0f100000 0x00 0x400>,
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

