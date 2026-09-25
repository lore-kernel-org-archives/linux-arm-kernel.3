Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668C1CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 20:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJNh9NHi5/A3F2G1LVdmStq9ANzlmBgRdkRzPYlQ6SA=; b=flKHvV/aWYRs49wfoboJaVZUPe
	j/nW5atRtVr6zrEGBfB0RJPz7uzqr6eCqnXLQn2rTgpC2XTkhuzgD9PohwwseYgVeEpIZAFtv0b4f
	q7PKVwFwfj80F+WcgF+usfkfTcdHia2fyFlK2KkaxnBxy3X2f9pHM7ejRka9YEqSONapaZOxLfEUq
	BhY68NOTq+Ydc0DGwJGeIhQSRnrwXp7wqGLNxwvDIc1ySVH7iDz9erW3yvbxkzwhQdaCwU3G26X5p
	6ynb1qCPwTTyNdYtfMZtb0xRDhevGdRm7cOEEuGfyWBPzail05pppHqR2cVHgRD6xVpwYnKpfFOCC
	gJGBoAOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBxm-00000001NQS-3QTt;
	Tue, 06 Oct 2026 20:40:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBxe-00000001NPb-2tiG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 20:40:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1F2B1516;
	Tue,  6 Oct 2026 13:40:24 -0700 (PDT)
Received: from [10.211.55.7] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7709F3F66F;
	Tue,  6 Oct 2026 13:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1791319228; bh=ky+mKliKhEVovZWz02c5m0P4qkXwqsESsKOGhrKT7Rc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S+TM+R44BRJ+mIXKBODQZsUDIolThvjnEFKqYp7JbT5qr5IMiHprlR0xXUt+xEKhU
	 qmoxVe2SLNr5pJCOa279ptm38LV9WQsNndxQQs7JkroNoRlcE+3vGkWeE4eOjmGFr6
	 JJfqHphR+96jQ1fONlmXnCGY4TGdpELdGMT2QgxE=
Message-ID: <58ba1c2a-c6c3-476d-aee0-5ec7a2ed5207@foss.arm.com>
Date: Thu, 24 Sep 2026 20:55:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented
 by locking
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
 <asUIWgHk3hdaLEu5@arm.com> <asUQdaTtMF1X_Hsa@sirena.org.uk>
 <8c425dac-11f0-4267-8745-d23d6391a6b1@foss.arm.com>
 <asUiaocg44i8n3zA@sirena.org.uk>
Content-Language: en-US
From: Bill Roberts <bill.roberts@foss.arm.com>
In-Reply-To: <asUiaocg44i8n3zA@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_134032_170816_478E739B 
X-CRM114-Status: GOOD (  14.09  )
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


On 10/6/26 11:31 AM, Mark Brown wrote:
> On Thu, Sep 24, 2026 at 03:49:14PM -0500, Bill Roberts wrote:
>> On 10/6/26 10:15 AM, Mark Brown wrote:
>>> I was intending to do something soon to pull more of this code out into
>>> some shared place since especially for RISC-V and arm64 where they're
>>> using the prctl() rather than arch_prctl() interface so there's less
>>> reason for things to be duplicated.
>> Bear in mind that I do have patches out there, for x86 that enable prctl
>> for them as well. I looked into doing the lock check in the prctl call path
>> before
>> it gets dispatched to the arch specific backend, it does require a common
>> interface
>> into the threads feature bits that each arch would need to, trivially,
>> implement.
> Yeah, it'd be great if that could land and we could hopefully eventually
> end up with a shared interface for userspace.  We'd still need some arch
> hooks no matter what, but the userspace experience would be much more
> pleasant.
OK let me clean the patches up, and ill send em when I can. Does anyone
know how can I test the risc-v path?

