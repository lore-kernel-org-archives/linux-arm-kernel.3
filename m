Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA71ECA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4n4JwE8v4Mr3QVDSwzWaKWzZRaoqi7g005C+Lh3qQo=; b=TISa13SI6fiZ668t4+gwF3dLrr
	7RPatmAagPxFAhKSjOVSzFoXvKjtDmk2qntVs0dRMg344wxoY1MG3yy77w9HSFN3b68Yb/del1jla
	3e3oe02ixoWITeXY4J/62mcfAbKE1rzWsZ1kf9xGQyFZmXjbx6KfnURikTNnNxWzHmcCPTf1h9vVV
	s8384s8dChr5AjcFA8JwsxmcQEgWMbId+7qsNuqcJFt+lwql/u99514qo88RrdkAFeNKM2faUKdyW
	5IpZcEDtb8Ifd1QQL5tRdD9n6PpTjbQSykQsnYMzSr2vrSosYBQL1KmTBVH+q8hN1hGwGFiInwoqx
	XqQcBp1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7YC-000000015NJ-0yub;
	Tue, 06 Oct 2026 15:57:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7Y8-000000015MZ-3Tti
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 15:57:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E58C143D;
	Tue,  6 Oct 2026 08:57:46 -0700 (PDT)
Received: from [10.211.55.7] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49FB73F763;
	Tue,  6 Oct 2026 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1791302269; bh=Pf8EPNhq9IaFtueugyD5BlO9dMOI/Pc1XaecLXQ+tQA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OfTYXDfmzBiGrhfZhBz5ssW0iPG9mWbR1eLtqv7qX8rqBIlDxgSv4FtiebdjSuMbP
	 S/USuq7SI9SmGJiB5G05+vtV08D5otClWwBakLiB4zlhLaan2cpXO4N7EZO8x8P+7W
	 4ExllblFVwsIuHyb0gMfWd81yVsoom4Xp5jK7aTY=
Message-ID: <8c425dac-11f0-4267-8745-d23d6391a6b1@foss.arm.com>
Date: Thu, 24 Sep 2026 15:49:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented
 by locking
To: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
 <asUIWgHk3hdaLEu5@arm.com> <asUQdaTtMF1X_Hsa@sirena.org.uk>
Content-Language: en-US
From: Bill Roberts <bill.roberts@foss.arm.com>
In-Reply-To: <asUQdaTtMF1X_Hsa@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_085753_020903_7DC96C29 
X-CRM114-Status: GOOD (  18.66  )
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


On 10/6/26 10:15 AM, Mark Brown wrote:
> On Tue, Oct 06, 2026 at 03:40:26PM +0100, Catalin Marinas wrote:
>> On Thu, Sep 10, 2026 at 08:00:39PM +0100, Mark Brown wrote:
>>> When we refuse to change the GCS configuraiton due to locking we
>>> currently return -EBUSY which is an odd choice.  The only userspace I
>>> found that relies on this value at present is the kselftest and other
>>> architectures are using the more obvious -EPERM here let's switch.
>> IIUC, riscv is returning -EINVAL. Should we get an overall consistent
>> value? Personally I find -EBUSY quite descriptive but I don't mind
>> aligning the architectures (before user space starts making use of the
>> return value).
> Yes, it's using -EINVAL though it differs in that it's interface for
> locking only allows locking a single enable bit in the enabled state
> rather than letting you lock unknown bits, or locking things off, so we
> need some changes there too.  I guess we could also go with -EPERM which
> would also distinguish the "I don't understand" from "This is blocked",
> but nobody uses that yet.
>
> I was intending to do something soon to pull more of this code out into
> some shared place since especially for RISC-V and arm64 where they're
> using the prctl() rather than arch_prctl() interface so there's less
> reason for things to be duplicated.
Bear in mind that I do have patches out there, for x86 that enable prctl
for them as well. I looked into doing the lock check in the prctl call 
path before
it gets dispatched to the arch specific backend, it does require a 
common interface
into the threads feature bits that each arch would need to, trivially, 
implement.

