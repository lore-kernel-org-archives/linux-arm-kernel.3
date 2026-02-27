Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9068BFD7F95
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 11:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUhMUDhfL+/TRZqNizmYRzahTLS12PIWYIZdNppFiSY=; b=k9v1Oujam1x1gN0IucNNuSubeu
	jU6KOBC/wnvPGuj7FOM7OD5PYJtJ1lhtiUPNcz1vf2y5B5WPfl+eXwiINJ+zLA6tnP+mkMu3PhgQo
	KNqwj6rO/fwp7+Mcam4HdsxQn0mO0DPrGCW9SNv7/2RDD6BWX1fKfSOWF3Fb4mwY/sIC21B/4InnG
	01ziuFPO6cgosARIx3zvSSnZy8cmLOKuEzN7yPxg9cvQ5CcJjjAgXilolaOvLneK5H121sL36cNFU
	1HLCcMqmloA98FubK2WiBoRO+xF8q9vD16zcY4Hl7dL9pZVh4/gLD2Yx2rlZryKF84SHkENzdY2q5
	vEmaAhsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvsa-00000008HW7-1FYJ;
	Fri, 27 Feb 2026 11:19:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvvsW-00000008HVP-0Cwv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 11:19:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A45A1516;
	Fri, 27 Feb 2026 03:19:20 -0800 (PST)
Received: from [10.1.28.164] (e121487-lin.cambridge.arm.com [10.1.28.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C290A3F73B;
	Fri, 27 Feb 2026 03:19:25 -0800 (PST)
Message-ID: <3048e8c5-c14c-45fa-ba5f-1346df084486@arm.com>
Date: Fri, 27 Feb 2026 11:19:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BOOTWRAPPER PATCH 2/2] Add support for GICv5
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, maz@kernel.org
References: <20260227102049.8015-1-vladimir.murzin@arm.com>
 <20260227102049.8015-3-vladimir.murzin@arm.com>
 <20260227110626.GA1980869@e124191.cambridge.arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260227110626.GA1980869@e124191.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_031929_153662_DFC44943 
X-CRM114-Status: UNSURE (   6.62  )
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

Hi Joey!

On 2/27/26 11:06, Joey Gouly wrote:
> Hi!
> 

[snip]

>> +
>> +static void gic_ppi_init(void) {
>> +	uint64_t val = 0;
>> +
>> +	val |= 1UL << (2 * 31); // Trace Buffer Unit
>> +	val |= 1UL << (2 * 30); // EL1 Physical Timer
>> +	val |= 1UL << (2 * 28); // Non-secure EL2 Virtual Timer
>> +	val |= 1UL << (2 * 27); // EL1 Virtual Timer
>> +	val |= 1UL << (2 * 26); // Non-secure EL2 Physical Timer
>> +	val |= 1UL << (2 * 25); // GIC maintenance interrupt
>> +	val |= 1UL << (2 * 24); // Generic CTI interrupt trigger event
>> +	val |= 1UL << (2 * 23); // PMU overflow interrupt request
>> +	val |= 1UL << (2 * 22); // Debug communication channel
>> +	val |= 1UL << (2 * 21); // Profiling Buffer management interrupt request
>> +	val |= 1UL << (2 * 15); // Hardware accelerator for cleaning Dirty state interrupt
> What about SW_PPI (3) and NS_DB_PPI (2)? Are the left out for a reason?
> 

No reason, I just missed them. Thanks for catching that!

Cheers
Vladimir 

