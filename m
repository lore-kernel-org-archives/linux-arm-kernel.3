Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52897C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cF3oUXtlWczJf2CkdqLNOlQ00s3AVE/oaTPL/XyKwU0=; b=jphffuSMqfJA74WP227EoasPv6
	m2f5gPyp19t3ioLmXYhbK5shtUf7rZwpiOsdYYS/KZ8MSIi5aDYEySk8VY89lRqw52vRV5UYlpf2M
	BxMHPdju3v0gJ6larOKxGjnhTv0kPUZAccoNddEIV46zA7nDXS2aUE9G1f1MW9QlCYdrJjq383+2E
	IKjUDpocYzPtIM7MJJb9cVyE53UhxAuQKIGK9UNSlZUlXRJgSu2JgcsE09b1b8t5t9HzDk8G03b/J
	klZSzU+moDh+iooPpI7EM7N3a/oJHHd6yTy4ZpGch2RYHR0T7VLCJhAkL6BtPcDyVaYEAkefI29d6
	5MSC/qsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglZV-0000000CxBA-0sfK;
	Mon, 06 Jul 2026 15:49:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglZS-0000000Cx9F-2REw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:49:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BCC51BCA;
	Mon,  6 Jul 2026 08:49:16 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C5AA3F7B4;
	Mon,  6 Jul 2026 08:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783352960; bh=4pV7GGRE4+B12sGcbtHLfldXfMh6UfXhgLyVeuaZ+hs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MOHAloydZ3OtDpev36IzbSM1TojqUQx0V2RZw12oHqukAvb7FfkRzJ2CdCcJP4sQC
	 Ue3FBf008FZCN2yv/arqAjGKDGK9EQlC8x10GO7LFNumliK9tQTKmljfS3XSQLcQx9
	 iLeq33o4FCGFfCf+ghHJ/xGST9lNKzR0BNfWVsi8=
Message-ID: <49436a6b-ab0c-4c57-8eb7-a332cd6c6f6e@arm.com>
Date: Mon, 6 Jul 2026 16:49:17 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v3 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: james.morse@arm.com, fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net,
 x86@kernel.org, linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260515140612.1205251-1-ben.horgan@arm.com>
 <d53df455-437e-458e-a7f8-72681ab4d3fa@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <d53df455-437e-458e-a7f8-72681ab4d3fa@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_084922_693616_E906FD50 
X-CRM114-Status: GOOD (  17.31  )
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

Hi Reinette,

On 6/5/26 19:41, Reinette Chatre wrote:
> Hi Ben,
> 
> On 5/15/26 7:06 AM, Ben Horgan wrote:
>> This is a new version of Dave Martin's patch [1] to delegate rounding of
>> bandwidth control user values to the arch code. As there is now more than one
>> architecture using resctrl, I split the original patch into two, a core resctrl
>> patch and an x86 patch, and added an MPAM patch. Please let me know if the patch
>> break down and ordering is sensible and whether the pattern should be followed
>> for any future similar changes.
> 
> This ordering is sensible to me. I find the patch breakdown a bit fragmented since
> the logical resctrl fs change is split yet I also find that you did what was best
> to ensure bisectability. I find small changes that are local to subsystems easier to
> consider and believe it would be ideal to only have patches touching multiple
> subsystems when it cannot be avoided, for example when doing otherwise would break
> bisect. Even so, we may learn of better ways to do this when this series is considered
> for x86 inclusion.

Thanks for giving me your view on this, the review and the R-b's. I find
all your proposed changes reasonable and have included them (and only
those changes) in a v4 which I will post shortly.

Thanks,

Ben

> 
> Reinette
> 


