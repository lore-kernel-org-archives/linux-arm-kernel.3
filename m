Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C3CCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kiPkQKpRLn9qqzIMVh1MRyshBmTUJXqAhlHjPgEk0jA=; b=xQtUcA80h2qDwaNJiYtcDqGc83
	IySJwcQJczK9tvDLcUCqsRd/ugiu1gAKabVCtbG/lqNwp2q/ZMSjssiHHADHcnZVt49mbpNtrOo0G
	JAbXgj8z3R20QLpGeYMvo+ydnrUGD0Yki6o9TqEABBDXIiupfUw1pGv7Ef8sn94d93QvM+YTyVhcG
	Bxvj429Xv3G7yPQlkJTAD6zEa7sTvXed7MAGefS6/FXKZsdLoCp2g7sACWOk6AhSlz51Nlt3VY+2d
	oWzJ07KYnlyq7hdtp8JUSIaYJCQpyXO4tH7vTs5C7UDBdcI6B3pZSpVdUYz8P9Fgm0TCIyjYAPiXs
	RwdcISLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBany-00000003POu-0sHT;
	Wed, 22 Oct 2025 15:31:14 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBanv-00000003PNX-156E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 15:31:12 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4csCmr3MLMz9tV8;
	Wed, 22 Oct 2025 17:31:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761147068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiPkQKpRLn9qqzIMVh1MRyshBmTUJXqAhlHjPgEk0jA=;
	b=YmHnoragkzLHzDGdOn64ahPb4h1231HNOqpcVm0Cliwqj5AwpW3e7PIqhXQNo9Gt9g+q/u
	7OBSVTLLWbUw/diU6mxJ07h3h1usyehv9mbHbYsrBxuWXuzWijmrZU5PyH4GjqAH++Qbo3
	DZNxFGI4sOo5rS7840zIxefgZNVL7GcsCyVPLGiktcKWAdCtkCBxhe0De2crbNC7vVvbHd
	IuvgBboAzIlIkqVl7L2lJwx449/t/SklErnm4plJ0x/3vTK3LR2T/MLQsONN+qo67vmE/6
	kxuR6l+zs56a15rfh6eOe5Jnxdx7/OoOd8iIOD/t94TVSUz0VOm1q75o26vy7A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=cTlsc+K6;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <b0f1a0a3-31be-4ebe-9bbc-fe25a0dc8059@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761147066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiPkQKpRLn9qqzIMVh1MRyshBmTUJXqAhlHjPgEk0jA=;
	b=cTlsc+K6ra2nU36Io1lxrwSmIVqq5ldIZvlrSZk2e/9jYye8cZZ4rt3bT8T8aP9pPQJ5k9
	6bI49k9gb2TlIFLGcRWfovDzKF2IYjYFRAF7r7MJ27wxipE7k4Q7jJIS9udWEJG7EZ+cK2
	E5GsoVmLgORkZu7LEFgHddCcM0D3lbqVVIh3lXtt0Kwsqz8ZX3stmtpDiCCRQHPHN08nwT
	jUAgIe8AUfuO/Y9x0fVfRsIQMRMATY0OpLj0c0mpqlwQNuQg0CZVi3B+e04Bavi4ENoGrY
	lnxZHKPnjpcUlB0eKxMLPOIjmxcAm6Fj8Hq5f1a6T7jPij3GUhYWwRrQi4g5Qg==
Date: Wed, 22 Oct 2025 17:31:04 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-renesas-soc@vger.kernel.org
References: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
 <86347bvx0f.wl-maz@kernel.org>
 <07391913-aab6-4d92-b75f-278506f51397@mailbox.org>
 <861pmvvv2g.wl-maz@kernel.org> <aPj2DA2FwYVSmLVc@arm.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aPj2DA2FwYVSmLVc@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 04cf09bdf2be20dd59c
X-MBO-RS-META: 1nkfh5jx737ewmoei1nspqmr99y98xsi
X-Rspamd-Queue-Id: 4csCmr3MLMz9tV8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_083111_525026_F0260B5E 
X-CRM114-Status: GOOD (  15.72  )
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

On 10/22/25 5:19 PM, Catalin Marinas wrote:

Hello Catalin,

>>>> We ensure that the AMU is available in the macro itself by checking
>>>> for ID_AA64PFR0_EL1.AMU. If the AMu isn't present on this CPU, we skip
>>>> the offending sysreg access. This is similar to what we do for the
>>>> PMU.
>>>>
>>>> Does your HW advertise an AMU, but doesn't actually have one?
>>>
>>> The hardware does have AMU, but it is currently blocked in old TFA
>>> version and access to this AMU register here causes a fault. That's
>>> why I have to disable ARM64_HAS_AMU_EXTN until the TFA is updated and
>>> the AMU access is made available on this hardware. But even if I do
>>> disable ARM64_HAS_AMU_EXTN=n , I get a fault.
>>
>> Well, I would tend to say that you are trying to update the wrong
>> piece of SW here. Crashing kernels should be a good incentive for the
>> board manufacturer to update their firmware pronto, specially when we
>> are talking of code that has been in the tree for over 5 years...
> 
> I agree.
> 
>>> This patch is mainly meant to prevent a surprise in case someone does
>>> set ARM64_HAS_AMU_EXTN=n , and the system still faults on AMU register
>>> access.
>>
>> But that doesn't really fix anything if you have a buggy firmware,
>> because you can't tell which CPUs have been correctly configured, and
>> which have not. I also don't really get why this hack works for you,
>> because the feature will be set as soon as one CPU advertises the
>> feature.
> 
> I think Marek also disables the config option and the feature won't be
> turned on.

Correct.

-- 
Best regards,
Marek Vasut

