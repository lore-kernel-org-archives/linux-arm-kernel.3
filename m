Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EAEC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blPT4iKKpVbMKduQ/TccuCoN/1hD2xV9rVwy3fQyQvA=; b=ZfBswAQpMjYI60IHWrAS/USDJk
	TtqtsGppLPJOL/D1970QLuTAXBmw5Y7gi9WbY5MZ0kkw6kdq/5bhGMyamdxB89FvNMMh2g9iRp1HA
	I4tGSpCcFDco3X0WPgxe9BRprie9KBfuobmlOdyqtdIErxUxK+n7mElZmMG5IKgHdfjYWt26K+SZE
	haMquxan6Lrui2lfdp3PtFp2qH9i07gcuzVWGdaGVZezuVM7cHG9LaxX3zU7n4tUDOzU56PPdz0Dg
	U24R6+3kocKk5iE4HIdhs6eZDTwLbCNb6D0sq7yYPkYjKjcD11EKs9plh41Pk1lSyBynlG/x8JbW9
	vHiwcKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZjG-000000028kf-0mga;
	Mon, 10 Mar 2025 09:47:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZRJ-000000025Fj-2UFv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40CAA5C5AB9;
	Mon, 10 Mar 2025 09:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3263C4CEE5;
	Mon, 10 Mar 2025 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741598928;
	bh=5mwoTd08jCfdUhN4DoQ/o5bTO+/4KPbpIou7ZLK5CwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=moRUW5ZQ40mb3/aIpiaUN9HkU77pvem3k8eDxlSM/9lZUaUKukj4CqhZvUe9L77zC
	 MN+2vbTMTU3+BLE/2ld0UBhKQS5/ba81SV2HVw+ZA3Yz3md1rj9n1oi/rIFpS0ceFQ
	 /omVZU4PqA9TWL9LfJuqg6P7RCJQ6/BrSt2q3h2CoPNyi/He613YCzZB27Pff6NEjc
	 YXtecGZz5NtbHWv7fAKwgV9RUZ+ou62yHAHyS6MQV1nL5vhT4TzAPYYIv5ECh/jAne
	 /yZ6tNsiGfzxvB4H1/ph9rTQtybZmAJtNlXrF3KTZChZqotBBafZrkqj9bmZ4otaFP
	 DxO9pUqVWT11A==
Date: Mon, 10 Mar 2025 10:28:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: arnd@arndb.de, bhelgaas@google.com, bp@alien8.de, 
	catalin.marinas@arm.com, conor+dt@kernel.org, dave.hansen@linux.intel.com, 
	decui@microsoft.com, haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com, 
	krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com, lenb@kernel.org, 
	lpieralisi@kernel.org, manivannan.sadhasivam@linaro.org, mark.rutland@arm.com, 
	maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev, rafael@kernel.org, 
	robh@kernel.org, ssengar@linux.microsoft.com, sudeep.holla@arm.com, 
	suzuki.poulose@arm.com, tglx@linutronix.de, wei.liu@kernel.org, will@kernel.org, 
	yuzenghui@huawei.com, devicetree@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	x86@kernel.org, apais@microsoft.com, benhill@microsoft.com, 
	bperkins@microsoft.com, sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next v5 07/11] dt-bindings: microsoft,vmbus: Add
 interrupts and DMA coherence
Message-ID: <20250310-demonic-ferret-of-judgment-5dbdbf@krzk-bin>
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-8-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250307220304.247725-8-romank@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_022849_673300_83C55DBB 
X-CRM114-Status: GOOD (  15.24  )
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

On Fri, Mar 07, 2025 at 02:02:59PM -0800, Roman Kisel wrote:
> To boot on ARM64, VMBus requires configuring interrupts. Missing
> DMA coherence property is sub-optimal as the VMBus transations are
> cache-coherent.
> 
> Add interrupts to be able to boot on ARM64. Add DMA coherence to
> avoid doing extra work on maintaining caches on ARM64.

How do you add it?

> 
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---
>  .../devicetree/bindings/bus/microsoft,vmbus.yaml          | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
> index a8d40c766dcd..3ab7d0116626 100644
> --- a/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
> +++ b/Documentation/devicetree/bindings/bus/microsoft,vmbus.yaml
> @@ -28,13 +28,16 @@ properties:
>  required:
>    - compatible
>    - ranges
> +  - interrupts
>    - '#address-cells'
>    - '#size-cells'
>  
> -additionalProperties: false
> +additionalProperties: true

This is neither explained in commit msg nor correct.

Drop the change. You cannot have device bindings ending with 'true'
here - see talks, example-bindings, writing-schema and whatever resource
is there.

Best regards,
Krzysztof


