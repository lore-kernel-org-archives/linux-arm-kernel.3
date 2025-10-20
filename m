Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E2DCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hr5ZRu8yWDfywVicwn3T0Jc+Fj4U479umxRvfhTdQ6A=; b=1QB+3oT+4aON3HWKjppAtLRubG
	Ibqehv8XiZPpAgMhgpF2lLSSRFOo8H2eeBR70uPd9SHr+8u7ZtmiZtFFEFyWkt6u24s7zIRu9qfaQ
	9FeeUJADqtUKLZMWO82FWgMf2WkyR/mQmobRs7+zYTp5c0jN6Ov8KL6sXp8hxisFz0ch7KIaPKe/W
	IspwxYguDRnfKmm1NhSKbmoxUnn6eiivebh3BybHX8dxDj/aFfQqGXkqvgH2YwuSyuhIOukWJ4TwE
	Me6ePekjFI7QfIAcEUuLQQ0VqFQtE2fASUrLRRYJWYL33T9jet30kHefDYXwubN15NSHuWX9JtmUP
	gEWZzU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAljU-0000000CUfw-3xMD;
	Mon, 20 Oct 2025 08:59:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAljS-0000000CUf5-1BnB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 08:59:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53F261063;
	Mon, 20 Oct 2025 01:58:59 -0700 (PDT)
Received: from [10.1.30.161] (unknown [10.1.30.161])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E3EE3F66E;
	Mon, 20 Oct 2025 01:59:05 -0700 (PDT)
Message-ID: <0e78a91d-f791-4cc2-be58-a44e2ec7e6f5@arm.com>
Date: Mon, 20 Oct 2025 09:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.4-6.17 0/2] arm64: errata: Apply workarounds for
 Neoverse-V3AE
Content-Language: en-GB
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251016111208.3983300-1-ryan.roberts@arm.com>
 <2025101708-antsy-steadier-5ab6@gregkh>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <2025101708-antsy-steadier-5ab6@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_015910_366484_128181CD 
X-CRM114-Status: GOOD (  12.45  )
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

On 17/10/2025 08:08, Greg KH wrote:
> On Thu, Oct 16, 2025 at 12:12:04PM +0100, Ryan Roberts wrote:
>> Hi All,
>>
>> This series is a backport intended for all supported stable kernels (5.4-6.17)
>> of the recent errata workarounds for Neoverse-V3AE, which were originally posted
>> at:
>>
>>   https://lore.kernel.org/all/20250919145832.4035534-1-ryan.roberts@arm.com/
>>
>> ... and were originally merged upstream in v6.18-rc1.
>>
>> I've tested that these patches apply to 5.4-6.12 without issue, but there is a
>> trivial conflict to resolve in silicon-errata.rst for it to apply to 6.16 and
>> 6.17. Are you happy to deal with that or should I send a separate series?
> 
> Please resend a separate series for that, and then resend this series as
> well, marked for the specific kernel releases that they are for.

OK will do. Incoming shortly...

> 
> thanks,
> 
> greg k-h


