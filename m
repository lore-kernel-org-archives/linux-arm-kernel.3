Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C558C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 17:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYBdYDR9z3mRE4UWmBeacQBZtMD0SQa/I6E+IOZm2MQ=; b=Pwe82ocM6iHESU2kBnQyguXfhc
	9hdx1X6i3GSUvDWmw5kPc29YqvKBlnFee1IXNUCgoQJKU27ZAMuTLIiMASqASjYkx6G6Bf0li83q4
	0fGRbiyZeX6gNurM/aGFKUdl+fdVBAUaHJVXmpTI+VSHHFR3dkyKqAkwf2bgdeKy5g1e5M2kvLmBj
	vKMC3qRXrjXijqkmuqc21jX0nWr18A+26rhP646vGrA0VPvTpntPrnGNjhK7GnDolkSjAatMlCzEE
	mCM8BbNJw2F8yEoVnnusvbsm2GMRddUEUjMB4kLeDim0jQZqWKlFpYGtYj9PnBPyKe71X/BL27tIg
	4T9xQCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttrwh-00000000QcW-03Wx;
	Sun, 16 Mar 2025 17:38:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttrv0-00000000QWM-3AUY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 17:36:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 156205C4813;
	Sun, 16 Mar 2025 17:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754B0C4CEDD;
	Sun, 16 Mar 2025 17:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742146617;
	bh=SykknbCWIe+4iAlW2oyUTP1j/isvxfybnvUnqUuCmXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5JfoeYjXVe72cOJuVO+ZB67RBdb/EnWyoZtxffEL9ivnl+kBKYj2cgGoxJCG0TRb
	 tZ4xQo1xjYoDIgSiNWmDhxXRAp4PelD2A8D2XXTKnpbRfh9BauM4FPwhYbvrmM9Rls
	 2sbNaBgDqAf/U4QtCVq20wW9YbRcpT48TALGHWRW/c5muHrjvxmxYonLSX7f5Db5FT
	 sN1Ggo+/TRsMPZiQH41KpcbQEkRYHDExUCImkK/ok19rHkZ+zi0kagauLhx4CAdTny
	 Fmn+g8PWEAy1stUZSOeuHdqAwRc9IjUAWwpiO4WI0WWR86yJ50Z3UMjQe7R01UExSQ
	 wG6u3d7Egwvlw==
Date: Sun, 16 Mar 2025 18:36:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de, 
	catalin.marinas@arm.com, conor+dt@kernel.org, dan.carpenter@linaro.org, 
	dave.hansen@linux.intel.com, decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com, 
	joey.gouly@arm.com, krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com, 
	lenb@kernel.org, lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, 
	mark.rutland@arm.com, maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev, 
	rafael@kernel.org, robh@kernel.org, ssengar@linux.microsoft.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de, wei.liu@kernel.org, 
	will@kernel.org, yuzenghui@huawei.com, devicetree@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, x86@kernel.org, apais@microsoft.com, benhill@microsoft.com, 
	bperkins@microsoft.com, sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next v6 07/11] dt-bindings: microsoft,vmbus: Add
 interrupt and DMA coherence properties
Message-ID: <20250316-versed-trogon-of-serendipity-bf7ea7@krzk-bin>
References: <20250315001931.631210-1-romank@linux.microsoft.com>
 <20250315001931.631210-8-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250315001931.631210-8-romank@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_103658_910740_10319557 
X-CRM114-Status: UNSURE (   8.97  )
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

On Fri, Mar 14, 2025 at 05:19:27PM -0700, Roman Kisel wrote:
>  
> +  dma-coherent: true
> +
> +  interrupts:

> +    maxItems: 1
> +    description: |
> +      This interrupt is used to report a message from the host.

These could be just two lines:

items:
  - description: Interrupt used to report a message from the host.

(and note that just like we do not use "This" in commit msg, there is
really no benefit of using it in hardware descruption for simple
statements)

Regardless:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


