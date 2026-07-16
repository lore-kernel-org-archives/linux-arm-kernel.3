Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7976C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOYGBUzuttzjNwAULMxEzwYgf0C3/ljINpKlMQ6rfFo=; b=3148FNZxbbc17cjXqspJ/XrVEs
	sXVNE/DJlhy8U2p6N7zPZ7B62ER2yuxlz/SYZGowQMoXcstGM+uiUR4ouQhIV9AerT7/7RN9FN5lL
	gAbIjlsi960cMIciW9xjPc+/qQdmCOsAESe/nJJG1TwCNmHe6PiMNVtutc/LHBgwdMu7IiYkr7m9d
	x/rBg3rK+L/Jghn88AzCdDctFb1H5JxttWvxidZBQxHejlFK6tMKZjCRJOwRE0wV4KTWBpMPBxbyU
	H0usYAYmIgOGr36EtM2eBszcd8C64PuED8V9WpbWS9xPiOPTCKJgjTAAnhmznpe+VWRMF04LZEY68
	OVe/ykrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIH8-0000000GqW1-33Zc;
	Thu, 16 Jul 2026 09:21:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIH6-0000000GqVV-0GtH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 09:21:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 146822B;
	Thu, 16 Jul 2026 02:20:53 -0700 (PDT)
Received: from [10.1.25.27] (e122027.cambridge.arm.com [10.1.25.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACF2E3F905;
	Thu, 16 Jul 2026 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784193657; bh=mAmygk40Q0mJC5G0SZA+g5cL2Jls+CkcOyQ0X4Opiec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XCngUfCtXkZbA+ocAbat2Ig0u77nubEABa336hDNq57vrwTORg4rpsKTctAVRUC93
	 RoOu5AAAHlZydxttMoBU52GjH7HUmBuS39Z+Jmn4yefRwpweYWXEZMhEz4UjpcqHAl
	 YKOCa/NNQUSg1sFPIM7zYgWqG+LUhNeUy0BmkGDw=
Message-ID: <2aba2dc2-eac5-474f-9bed-af2cb3003136@arm.com>
Date: Thu, 16 Jul 2026 10:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/37] arm64: Support for Arm CCA in KVM
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260715142841.80544-1-steven.price@arm.com>
 <868q7bnxf3.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <868q7bnxf3.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_022100_162134_3DF0E1FD 
X-CRM114-Status: GOOD (  13.86  )
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

On 16/07/2026 09:36, Marc Zyngier wrote:
> On Wed, 15 Jul 2026 15:28:02 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> This series adds support for running protected VMs using KVM under the
>> Arm Confidential Compute Architecture (CCA).
>>
>> It is the second part of the Arm CCA host support that was previously
>> posted as a single 44-patch series. The generic firmware/RMM support has
>> now been split into a separate 6-patch base series[0] so that it can also be
>> used by other work (and hopefully make reviewing a little easier). This
>> series applies on top of that base.
> 
> Splitting the series this way means that no Sashiko review can occur,
> as nothing applies on its own:
> 
> https://sashiko.dev/#/patchset/20260715142841.80544-1-steven.price%40arm.com
> 
> In the future, please post this with the relevant patches as an
> integral prefix, so that we can make use of the tooling.

Ah, I wonder if there's a way to teach Sashiko to deal with dependencies
like this? Anyway if you're happy with everything in one series and
(hopefully) merging a prefix earlier then I'll go back to that - it's
easier for me too.

Thanks,
Steve


