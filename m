Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C75BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SR8dAEBSVThJQ9pkRVksIzV+KMqmh/S482i7jxxWyjU=; b=MJ4Z/1ZoQ7ne7q
	zsdDFu0dDbMpK+nzkIKhxDih3Sqo9Yx0FFpnPaKvGoGSxHZCCsCjqOXdgamZasItJ24dUifm4oTCO
	0q4cS5mWNqH3pGEXtEx1hozK6IXKao/SoHnz67be+dcs7HLRQYf66YYqZ2xVs2lnA5NtxpdBBiwTU
	c511VRDXKZYuWwglvZQMd/6fCcM1XCdkZCoaj7XjcsH2Pm3xAbmSaZ/cdl1Od7IzoUGR2khZCIpAu
	ZBSYGgqPnEuZBGX/fmuXHOV4b2sXHvkSblX7EzTLodLygmrQQG3f1Al9Lr36unMk2vdVZ1YCJWe6s
	mVnpZR1X2CE/cBQXFi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucogN-0000000DCPw-2rKx;
	Fri, 18 Jul 2025 17:15:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucoZ5-0000000DBGP-074o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 17:08:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94BD816A3;
	Fri, 18 Jul 2025 10:07:58 -0700 (PDT)
Received: from [10.57.30.201] (unknown [10.57.30.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF2533F6A8;
	Fri, 18 Jul 2025 10:08:03 -0700 (PDT)
Message-ID: <2df81c86-12b9-41c9-b9dc-edc032e2ec1d@arm.com>
Date: Fri, 18 Jul 2025 18:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/entry: Mask DAIF in cpu_switch_to(),
 call_on_irq_stack()
To: Dev Jain <dev.jain@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20250718142814.133329-1-ada.coupriediaz@arm.com>
 <e82e69d0-e639-4652-8cd8-b70065cb8140@arm.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <e82e69d0-e639-4652-8cd8-b70065cb8140@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_100807_109494_D3D734A7 
X-CRM114-Status: UNSURE (   8.53  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, Cristian Prundeanu <cpru@amazon.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Dev,

On 18/07/2025 16:13, Dev Jain wrote:
>
> On 18/07/25 7:58 pm, Ada Couprie Diaz wrote:
>> [...]
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Reported-by: Cristian Prundeanu <cpru@amazon.com>
>> Fixes: 59b37fe52f49955791a460752c37145f1afdcad1 ("arm64: Stash shadow 
>> stack pointer in the task struct on interrupt")
>> ---
>
> Nit: We only write a prefix of length 12 for the fixes commit.
>
Indeed, I forgot to trim it.
Thanks !
Ada

