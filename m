Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A4BC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 06:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bj/5QY246mZTyqL+dU2+QPJEfF1kn80HxD8wCQJLfgs=; b=JQgXLQKSUpm0hWOFkiHmbS/T5y
	1qy4vcYPKivz0i6q9zxH9nYetQBGlEqGaU/V7clA9ZoU+JwoD+S/EnBa0xWJyFwuS8S8YLgR5fNIn
	uMZQgJ9N/BZqIMgTePqecq+hOjqOUmBA7QzSvHSEfXQv49HrXs5FlvvmUzJW9Xu/TdGbZLnEzRXT4
	wADgMJKZVXcXx8xJH9AwtTjvhn2ENRO0Z/x8OdSow3vvtDPIHz0K9v4tjpENpxiaRS6ZUOVfZsvcd
	2S/NCBTetG1Zt92WXCCy2tdSM7lVCDoQrbXBg253TJpuY6NJm7xDkMyGsWNL/vameMJaHg7rKOI3t
	GaKrbLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6UL-00000006Oej-3rpx;
	Wed, 12 Feb 2025 06:44:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti6SA-00000006OFI-081h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 06:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66FF7A40B29;
	Wed, 12 Feb 2025 06:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94EF6C4CEDF;
	Wed, 12 Feb 2025 06:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739342552;
	bh=gcWrlH4VJdCzAwzQ0TQ13bD5T421NNpIotpvRoe8/0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XJHzF+VzfFWlp4P1JPrUMCQkbJ5KBGLBnHIArBL2rm8chHQT3+YCoPK4OJRy5r7E3
	 sAEvp7f7Om4wRIuJbEio3qwxlaK3G6jul9C+7mhkn+/CcOPn94KJGKuYMJNv4kBrB9
	 iyu0wu+S5Pof3d5E6GJVuoEPQE0wwdWUJY3opqtFifXLHL3cOus7Plu+nJbBT25k6Z
	 MLozZWZUL+9x2+p6l1ZevMJfiIYKEVfvQADJL7cew3LCDAreCs1eXEpQof9x5Sqj/D
	 D/2n2MOO/76zGJrkaqFhCTWkj5d65Lh9hCqXduyTu+7RL200etCIuJx6zTQ6XwCouc
	 GTngHdXyvPRoQ==
Date: Wed, 12 Feb 2025 07:42:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de, 
	catalin.marinas@arm.com, conor+dt@kernel.org, dave.hansen@linux.intel.com, 
	decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com, krzk+dt@kernel.org, 
	kw@linux.com, kys@microsoft.com, lpieralisi@kernel.org, 
	manivannan.sadhasivam@linaro.org, mingo@redhat.com, robh@kernel.org, ssengar@linux.microsoft.com, 
	tglx@linutronix.de, wei.liu@kernel.org, will@kernel.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	x86@kernel.org, benhill@microsoft.com, bperkins@microsoft.com, 
	sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next v4 4/6] dt-bindings: microsoft,vmbus: Add GIC
 and DMA coherence to the example
Message-ID: <20250212-rough-terrier-of-serendipity-68a0db@krzk-bin>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-5-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212014321.1108840-5-romank@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_224234_203025_6A343368 
X-CRM114-Status: GOOD (  19.44  )
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

On Tue, Feb 11, 2025 at 05:43:19PM -0800, Roman Kisel wrote:
> The existing example lacks the GIC interrupt controller property
> making it not possible to boot on ARM64, and it lacks the DMA

GIC controller is not relevant to this binding.

> coherence property making the kernel do more work on maintaining
> CPU caches on ARM64 although the VMBus trancations are cache-coherent.
> 
> Add the GIC node, specify DMA coherence, and define interrupt-parent
> and interrupts properties in the example to provide a complete reference
> for platforms utilizing GIC-based interrupts, and add the DMA coherence
> property to not do extra work on the architectures where DMA defaults to
> non cache-coherent.
> 
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---
>  .../devicetree/bindings/bus/microsoft,vmbus.yaml      | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Last time I said: not tested by automation.
Now: I see automation build failures, although I do not see anything
incorrect in the code, so that's a bit surprising. Please confirm that
binding was tested on latest dtschema.

> 
> diff --git a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
> index a8d40c766dcd..5ec69226ab85 100644
> --- a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
> +++ b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
> @@ -44,11 +44,22 @@ examples:
>              #size-cells = <1>;
>              ranges;
>  
> +            gic: intc@fe200000 {
> +              compatible = "arm,gic-v3";
> +              reg = <0x0 0xfe200000 0x0 0x10000>,   /* GIC Dist */
> +                    <0x0 0xfe280000 0x0 0x200000>;  /* GICR */
> +              interrupt-controller;
> +              #interrupt-cells = <3>;
> +            }

I fail to see how this is relevant here. This is example only of vmbus.
Look how other bindings are done. Drop the example.


> +
>              vmbus@ff0000000 {
>                  compatible = "microsoft,vmbus";
>                  #address-cells = <2>;
>                  #size-cells = <1>;
>                  ranges = <0x0f 0xf0000000 0x0f 0xf0000000 0x10000000>;
> +                dma-coherent;
> +                interrupt-parent = <&gic>;
> +                interrupts = <1 2 1>;

Use proper defines for known constants.

Best regards,
Krzysztof


