Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4B3E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ml0Ed5tUFhCd1gr3jLUxCkSjR8Hxpw4R7UQGrVQHY7k=; b=i09jj9y4xfp/+5QvBn3MPPoVDW
	gxSeI3jWePYV4Jgv8xodhNXCnP/JVTAe45omPJsNILXc+ZVcoeVyrQ/KCNI6FbamXqrbta4O03z4n
	oUJZweumMQ0bFSCmH8PBJFrvu7IlLUCK5UyVnbfcj8GPikWP/pRUhyP9wMIhq2vPAD0CMUSaeh70s
	J1e467Pri+A0wQfeMnis7UYhOrs7adUxh+VVmj18ISxb6OZ9a9Y9nnxBm8D5WHyC4VUXRghs6NDjU
	MHzxeBPgVe3v2pXG4j4JIcUSvEMkDF2+vofhzVnSuai2rN1NTGXswcTLGfdw9Sk41f1YZUStDgsbq
	eqE6x18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgae-000000004yZ-2PUC;
	Thu, 12 Dec 2024 10:38:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgZZ-000000004oR-2JHp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 10:37:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F35C0169E;
	Thu, 12 Dec 2024 02:37:59 -0800 (PST)
Received: from [10.57.92.2] (unknown [10.57.92.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77FB63F58B;
	Thu, 12 Dec 2024 02:37:29 -0800 (PST)
Message-ID: <342b9c16-690d-42ed-a6f4-bb3972193a8f@arm.com>
Date: Thu, 12 Dec 2024 10:37:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND RFC PATCH v1 1/5] arm64: Add TLB Conflict Abort Exception
 handler to KVM
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>
Cc: =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>,
 catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
 <20241211160218.41404-2-miko.lenczewski@arm.com>
 <86o71irucr.wl-maz@kernel.org> <5d4ccb2c-da45-4471-9bb1-90212b50dad7@arm.com>
 <86msh1rzpq.wl-maz@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <86msh1rzpq.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_023733_636027_03D7FB01 
X-CRM114-Status: GOOD (  14.82  )
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

On 12/12/2024 09:57, Marc Zyngier wrote:
> Hi Ryan,
> 
> On Thu, 12 Dec 2024 09:23:20 +0000,
> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> Hi Marc,
>>
>> I believe the intent of this patch is to protect the host/KVM against a guest
>> that is using BBML2. The host/KVM always assumes BBML0 and therefore doesn't do
>> any operations that are allowed by the arch to cause a conflict abort. Therefore
>> the host doesn't need to handle it. But a guest could be taking advantage of
>> BBML2 and therefore it's architiecturally possible for a conflict abort to be
>> raised to EL2. I think today that would take down the host?
>>
>> So really I think this could be considered a stand-alone KVM
>> hardening improvement?
> 
> I'm not disputing the need for a TLB Conflict abort handler. It will
> be a good addition once we agree on what needs to be done.

OK great, glad we are on the same page. I'll leave Miko to work through the details.

> 
>>> However, it doesn't seem to me that the host is equipped to deal with
>>> this sort of exception for itself. Shouldn't you start with that?
>>
>> If the host isn't doing any BBML2 operations it doesn't need to handle it, I
>> don't think? Obviously that changes later in the series and Miko is adding the
>> required handling to the host.
> 
> Yes, and that's what I overlooked yesterday, and I replied to that
> change this morning.
> 
> Thanks,
> 
> 	M.
> 


