Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E13C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 22:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dfFbufE/oZqYpKWLTE17oZPb84Hww5PkyDbRc8FQEe4=; b=waCxG6IEb/82U//IGoT17X9IdR
	Xxqmk3AJTzUVgffIN1bErzEcB/Q1cPVy96zEv/JfQH2Nfyq3eM4zUP/dQdXP5mLtpODn46srKHy7u
	YxN7TXYpDmpxNynIckUpZMjXk+1ZAhJuuNnOZw8z/1TUaSv6+UfEg3ZLREx+Z2NCcvQLvU5v1+VS4
	PJyMfRcAsdg5d7xkBht1FIm+Zhsusaj35hjALbQseQfW9khk5X5AuyPIUkswvEdbetr0PCPWqpHqS
	MgPw+5sJDodZclOrt9x4o4nLaf9yGxLw1aWeuwvDqZ9NDsq1yxxEznY4rrJBgYHwEXIsoSdVVdv03
	mpKCvbSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb5qc-0000000DQZ7-48hI;
	Thu, 23 Jan 2025 22:38:50 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb5pK-0000000DQSS-12ww
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 22:37:31 +0000
Message-ID: <2784cc3b-0b8f-4116-b34d-0de4ff56cf92@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737671842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfFbufE/oZqYpKWLTE17oZPb84Hww5PkyDbRc8FQEe4=;
	b=tFxf07Npt3G59e0jExTBPWWrlv0Q6ZQzxnqAc+CuBqTZInnmbTdwYtTiVgttMaHfrCRx+m
	3kFCtUVwtMnNdfw+wt8J8iF0NVezP7bosn9yV7knS3/ybW85IH1XaOnCbfTo2bgW3/hUdp
	M9fi7Nz61+wCFxA3FigSB6/39PVoZUY=
Date: Thu, 23 Jan 2025 17:37:16 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] dt-bindings: spi: zynqmp-qspi: Split the bus
To: David Lechner <dlechner@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
 <20250116232118.2694169-2-sean.anderson@linux.dev>
 <9f40295b-484a-48e8-b053-ff8550e589d7@baylibre.com>
 <46a7eba6-a705-4543-b967-e83ccc89e7d4@linux.dev>
 <6afc379a-2f9f-4462-ae30-ef6945a83236@baylibre.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <6afc379a-2f9f-4462-ae30-ef6945a83236@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_143730_436235_544BA929 
X-CRM114-Status: GOOD (  28.88  )
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

On 1/23/25 16:59, David Lechner wrote:
> On 1/23/25 10:24 AM, Sean Anderson wrote:
>> On 1/21/25 19:16, David Lechner wrote:
>>> On 1/16/25 5:21 PM, Sean Anderson wrote:
> 
> ...
> 
>>> Could we make a single device connected to both buses like this work using
>>> the proposed spi-lower and spi-upper or should we consider a different binding
>>> like the one I suggested?
>> 
>> If you are willing to do the work to rewrite the SPI subsystem to handle
>> this, then I don't object to it in principle. Using a property would
>> also help with forwards compatibility. On the other hand, separate
>> busses are easier to implement since they integrate better with the SPI
>> subsystem (e.g. you can just call spi_register_controller to create all
>> the slaves).
>> 
>> There have been some previous patches from Xilinx to handle this
>> use case [1], but IMO they were pretty hacky. They got this feature
>> merged into U-Boot and it broke many other boards and took a lot of
>> cleanup to fix. So I have intentionally only tackled the unsynchronized
>> use case since that requires no modification to areas outside of this
>> driver. I don't need the "parallel" use case and I am not interested in
>> doing the work required to implement it.
>> 
>> --Sean
>> 
>> [1] https://lore.kernel.org/linux-spi/20221017121249.19061-1-amit.kumar-mahapatra@amd.com/
> 
> Fair enough, and I think it can be done without breaking things like the multi
> CS support did.
> 
> Here are a couple of patches. Feel free to resubmit them with your series if
> they work for you. To make it work with your series, you should just need to
> modify the .dts to look like this:
> 
> +          flash@0 {
> +            compatible = "jedec,spi-nor";
> +            reg = <0>;
> +            spi-buses = <0>; /* lower */
> +          };
> +
> +          flash@1 {
> +            reg = <1>;
> +            compatible = "jedec,spi-nor";
> +            /* also OK to omit property in case of spi-buses = <0>; */
> +          };
> +
> +          flash@2 {
> +            reg = <2>;
> +            compatible = "jedec,spi-nor";
> +            spi-buses = <1>; /* upper */
> +          };
> 
> 
> Then drop patch "spi: zynqmp-gqspi: Split the bus" of course.
> 
> In zynqmp_qspi_probe(), add a line:
> 
> 	ctlr->num_buses = 2;
> 
> And in the zynqmp_qspi_transfer_one() function, use spi->buses to select the
> correct bus:
> 
> 	xqspi->genfifobus = FIELD_PREP(GQSPI_GENFIFO_BUS_MASK, spi->buses);
> 
> I don't have a SPI controller on hand with multiple buses, so I don't have
> any patch adding support to a specific controller. But I did build and run this
> and hacked in some stuff to the drivers I am working on to make sure it is
> working as advertised as best as I could with a single bus.

Your patches LGTM. I will use them for v2. Mark do you have any comments on this
approach?

--Sean

