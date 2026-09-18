Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298C0C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FIOb8EF5F+Mi3hObj6My4V5uqyQraRjQvH6ndmKwYS8=; b=acPfyUgNi/x7ed
	n6qhYeNPl9lkwd0NpHa3wFb+rBfmRd0SbDgjDbT/d7eXWU/jmDg7JedmH0VtMEjqvocWFTdwXKB5k
	PXaKRgJlhvbu57/M+xH1ix68Hb1kOj+4zXuR3TLXlA0sQzFqn/ETGFMXb1zEJcGp7iHw3TQHP4aIQ
	io3B/LApX5sGT4Sxx8K3OisXIjrpvGVe7Yg06E2ZJovHiGxTfSLYcPlw7ApSBqAJXZbyPin1ywFsd
	SqSSunqTxIyOkoVpqrKQRf3ghJt4Ab81Yz7D/IKF7uy1qBG4q/jr/Zn9ZX0I490nVcvvB5adOADOD
	XhMM3O87QP3ASpzvaIVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7U3K-0000000DpKc-1IRL;
	Fri, 18 Sep 2026 08:34:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7U3I-0000000DpK8-42T5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 08:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FIOb8EF5F+Mi3hObj6My4V5uqyQraRjQvH6ndmKwYS8=; b=lMXXysMiwqPTkmOmCJuS7HSfuh
	nZu8Pg3YO6Ehev0eAQAgzUCTZ3I68ufYzBFNnyrf+Vpp79J4RShv0ZszsroL2ktLrQs+5cBCsrLnK
	r6MsslsPoKG+HqD/pUdCdX9JiUIlyxXIyPG+kzWTNigdGgNrO1axauV/AbLPLPzIA0cdAsCNf9tfF
	8V1dqp+B9B94quKLYf9sjRggWxlWt1hnW3ovS7NOGpPxe3TgULdhBfY8n2nnuLNoh8ooeuRnEGJLe
	+vI0I4SeGgOX+GNxF+trLtybMieqYuIgA4rMR+/oNN1+AZYJ6LEJhzo+KVYzOlqY1jgQJBiotcVTG
	FzNLJy/w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7U3E-00000009nQQ-2Sik
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:34:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22E6A168F;
	Fri, 18 Sep 2026 01:34:26 -0700 (PDT)
Received: from [10.41.4.144] (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2C1A3F86F;
	Fri, 18 Sep 2026 01:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789720469; bh=1EvbTukYKzP9XG0mXC34VrrPp3kxiBJZWjbS6a/dIvI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=tXd1e4tG8dljKhT5C2z8O5XWqawCvCHaDwubg1WNyr76TtpUGOxTX8nH8qiuk/YOh
	 b/9J5Af920gYnEgJ90ON8n8844bDBVgmTA2n3kYslOa9euNETUWBeDWgS4ZW+3xjte
	 w8fEVJoT9RJ7TGdjCW0Gtz+jah7jOqJKV97IRomc=
Message-ID: <f00c9173-ce5c-435e-a982-7240b71bef42@arm.com>
Date: Fri, 18 Sep 2026 10:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: arm: Add Live Firmware Activation
To: Sudeep Holla <sudeep.holla@kernel.org>
References: <20260706134455.132091-1-andre.przywara@arm.com>
 <20260706134455.132091-2-andre.przywara@arm.com>
 <20260717-lucky-gerbil-of-courtesy-162f0e@sudeepholla>
Content-Language: en-GB
In-Reply-To: <20260717-lucky-gerbil-of-courtesy-162f0e@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_093433_074442_D1A5515F 
X-CRM114-Status: GOOD (  19.57  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

sorry, just figured that I never replied to this - was stuck in my Draft 
folder ...

On 7/17/26 10:38, Sudeep Holla wrote:
> On Mon, Jul 06, 2026 at 03:44:41PM +0200, Andre Przywara wrote:
>> The Arm Live Firmware Activation spec [1] describes updating firmware
>> images during runtime, without requiring a reboot. Update images might
>> be deployed out-of-band, for instance via a BMC, in this case the OS
>> needs to be notified about the availability of a new image.
>>
>> Describe an interrupt that could be triggered by the platform, to notify
>> about any changes.
>>
>> [1] https://developer.arm.com/documentation/den0147/latest/
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   .../devicetree/bindings/arm/arm,lfa.yaml      | 45 +++++++++++++++++++
>>   1 file changed, 45 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/arm,lfa.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,lfa.yaml b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
>> new file mode 100644
>> index 000000000000..ef8e250f2da7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,lfa.yaml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/arm,lfa.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Arm Live Firmware Activation (LFA)
>> +
>> +maintainers:
>> +  - Andre Przywara <andre.przywara@arm.com>
>> +  - Sudeep Holla <sudeep.holla@arm.com>
>> +
>> +description:
>> +  The Arm Live Firmware Activation (LFA) specification [1] describes a
>> +  firmware interface to activate an updated firmware at runtime, without
>> +  requiring a reboot. Updates might be supplied out-of-band, for instance
>> +  via a BMC, in which case the platform needs to notify an OS about pending
>> +  image updates.
> 
> What does the below described "interrupts" cover or doesn't cover? Both
> in case of in-band and out-of-band. It is not very clear for me.

DEN0147 says (at the very end of the document):
"As of this version of the specification, the expected scope would be 
notification to the Operating System to indicate new LFA updates are 
available."
In-band updates are work in progress, spec-wise, and we would cover this 
when it has arrived. So for now this if for out-of-band updates, so that 
a BMC for instance can signal the arrival of an updated image to the OS.
I clarified the wording in the description of the interrupt property. I 
also added that it must be an edge triggered IRQ, as there is no easy 
way to signal completion, and the ACPI notification has the same semantics.

Cheers,
Andre.

