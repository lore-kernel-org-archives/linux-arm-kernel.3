Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6D9C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 07:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBtkM+lPh1Z7DchYgyJTUQnMUxRoJyrWM38PYO91ysA=; b=jPAhOp9uM/GR9TAhjMOOO73ZMp
	86giLtztQdPytGh7nR9z4b95MoSMHBkk4MSaRyA8J6n5tUQ8reF2Z5WrA7tj6F0G1MtQMimJ3dO7f
	fa4tWx9xw+0Vasj0DDnqhO8zCDHLQR5XizTv4YEENWsUjH+vNWCst53KQyHTjtWtulyRVORooPfjS
	Jp2LkJid9Mz28toTRQXT6ytEbv/1gFkS+RxjUDNvVPna5YF0NBvTEMXf2r2uCdqbj3YSmObjcoy+V
	PNlpTOFZxlkWxDBEvmx3WPdj/4RV1YhdAhJc8OTRM4E7WjReCW2wRTIFxfCM2PeaaYJfF2cGAGO+I
	cs0xWnsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtd1-000000063Eq-06WY;
	Tue, 10 Jun 2025 07:42:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtas-0000000633l-1MHP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 07:40:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3966F14BF;
	Tue, 10 Jun 2025 00:40:06 -0700 (PDT)
Received: from [10.163.32.103] (unknown [10.163.32.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F37133F59E;
	Tue, 10 Jun 2025 00:40:23 -0700 (PDT)
Message-ID: <ede82589-3a77-4a05-ab4e-4249c9e751f4@arm.com>
Date: Tue, 10 Jun 2025 13:10:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [boot-wrapper PATCH V2] aarch64: Enable access into FEAT_SPE_FDS
 register from EL2 and below
To: Mark Rutland <mark.rutland@arm.com>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
References: <20250606052602.3387225-1-anshuman.khandual@arm.com>
 <c7c97edf-8e2b-4196-9660-a15b86061c96@linaro.org>
 <aEbjcQLBKG7TepPg@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aEbjcQLBKG7TepPg@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_004026_412730_E6EF15A2 
X-CRM114-Status: GOOD (  11.82  )
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



On 09/06/25 7:06 PM, Mark Rutland wrote:
> On Fri, Jun 06, 2025 at 09:49:07AM +0100, James Clark wrote:
>> On 06/06/2025 6:26 am, Anshuman Khandual wrote:
>>> FEAT_SPE_FDS adds system register PMSDSFR_EL1. But accessing that system
>>> register from EL2 and below exception levels, will trap into EL3 unless
>>> MDCR_EL3.EnPMS3 is set.
>>>
>>> Enable access to FEAT_SPE_FDS registers when they are implemented.
>>>
>>> Cc: James Clark <james.clark@linaro.org>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 
>>> +	/*
>>> +	 * PMSIDR_EL1 register is present, only when FEAT_SPE
>>> +	 * feature is implemeneted. Otherwise direct accesses
>>> +	 * to PMSIDR_EL1 are UNDEFINED.
>>> +	 */
>>> +	if ((mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 1) &&
>>> +	    (mrs_field(PMSIDR_EL1, FDS)))
>>
>> Minor nit, but the extra brackets on the second condition are unnecessary.
>> Probably not worth a second version for though.
> 
> I don't think they're necessary for either condition, so when I apply
> this I'll simplify this to:
> 
> 	if (mrs_field(ID_AA64DFR0_EL1, PMSVER) >= 1 && 
> 	    mrs_field(PMSIDR_EL1, FDS))
> 
> ... and drop the comment.

Sure, thanks Mark.

