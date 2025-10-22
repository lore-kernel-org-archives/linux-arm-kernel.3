Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE77ECCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RN0bIBVNkP7q3FH7XLaRTCtJfmFmXlaG0Q+0STjPd2s=; b=PaLMYC0E4lPxuH1kc0tRSk/mpy
	TitNLopL0cI+YBa8CQKYgdfNHP8GDCi5ctr7muxFgIYJ7/iHMqatVW6bWAJx6wKK9L4IIIRATDIBe
	LvLqPUWmhvnggpAXeM3NX7DKRK6sVYMrS9W99Hork08FCbjrwnUUvntDqBwLwNm3w/tarVTA69+3q
	OGIMMESAog58fska4GOAWtEmmu4UGVfN4OEmDKf0TpfaAeHraTSJdfjE6q21/vRqMYAG1AY3ms+bc
	/Gn+nJWMxaNMQk1CRUTx6d0zqWN0ki3NnlYGoGGiCyNF+5NfePJXv1pwgqq/ejfSgoWM0EK9xSQhh
	omzTlX2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBamr-00000003PEV-38lD;
	Wed, 22 Oct 2025 15:30:05 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBamo-00000003PCs-1DcW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 15:30:03 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4csClV3F1Hz9vBy;
	Wed, 22 Oct 2025 17:29:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761146998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RN0bIBVNkP7q3FH7XLaRTCtJfmFmXlaG0Q+0STjPd2s=;
	b=t0UnbZzP+S50fR1h/NFsKvSwuO5AhaR89dGoM+8lUYzLiQ+l0o9Lb4BLE2TPtlWvHkplOn
	QW6jtxXnYepTLvrJRO4s+XiLSCnhlwxm94u1qd212buZlQGZeUGiGYNxtMVXPdIkL10mZu
	5UXCMDZEMijyEsMpn3puiactZeGvctTKDdziJF8+qBOb4Ns2lxmz6VntsKIsX0X31o3xiE
	iS51YoEo9k+g0IPnD/RH/EqanoyCxPf51vl5R9HuHX9ngLaZ3fXNkQJZwQHOatI6xJi2c1
	drvDvl2fM52KZ+2tHt0W3nOWMPpmf7E9380FLRR2fNIBfNMtGdGwEvRssMyp8g==
Message-ID: <24c8da41-37db-4e69-b9aa-e33b2154acb0@mailbox.org>
Date: Wed, 22 Oct 2025 17:29:55 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <861pmvvv2g.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <861pmvvv2g.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: ezo84cukef64fk3hiucisabuc3nwd4ef
X-MBO-RS-ID: 094e1b274aad668d7cd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_083002_480644_BC853EB9 
X-CRM114-Status: GOOD (  24.99  )
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

On 10/22/25 5:02 PM, Marc Zyngier wrote:

Hello Marc,

>>> We ensure that the AMU is available in the macro itself by checking
>>> for ID_AA64PFR0_EL1.AMU. If the AMu isn't present on this CPU, we skip
>>> the offending sysreg access. This is similar to what we do for the
>>> PMU.
>>>
>>> Does your HW advertise an AMU, but doesn't actually have one?
>>
>> The hardware does have AMU, but it is currently blocked in old TFA
>> version and access to this AMU register here causes a fault. That's
>> why I have to disable ARM64_HAS_AMU_EXTN until the TFA is updated and
>> the AMU access is made available on this hardware. But even if I do
>> disable ARM64_HAS_AMU_EXTN=n , I get a fault.
> 
> Well, I would tend to say that you are trying to update the wrong
> piece of SW here. Crashing kernels should be a good incentive for the
> board manufacturer to update their firmware pronto, specially when we
> are talking of code that has been in the tree for over 5 years...

I do agree with this, and the update already exists. The upstream TFA MR 
for this platform also has this fixed.

>> This patch is mainly meant to prevent a surprise in case someone does
>> set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register
>> access.
> 
> But that doesn't really fix anything if you have a buggy firmware,
> because you can't tell which CPUs have been correctly configured, and
> which have not.

I also agree.

> I also don't really get why this hack works for you,
> because the feature will be set as soon as one CPU advertises the
> feature.

For this old firmware, during development, ARM64_HAS_AMU_EXTN is 
disabled in kernel config to avoid triggering the AMU faults.

Except right now, I still trigger the AMU faults even with 
ARM64_HAS_AMU_EXTN=n , which I think should not happen ?

> In any case, this sort of terminally broken stuff should be handled as
> an IDreg override, for which we have a whole infrastructure already.
> There are countless examples in the tree already for similar purposes.

I would much rather not support the old firmware for this new platform 
in upstream and pollute the kernel with unnecessary workarounds.

I would much rather be able to disable ARM64_HAS_AMU_EXTN in kernel 
config for the old devices with old firmware, without triggering the 
faults ... and say that everything which is going to be upstream will 
always use new firmware that has proper working AMU support.

-- 
Best regards,
Marek Vasut

