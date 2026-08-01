Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806DDC55171
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 00:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMABh0sp2CLAMvAaOZJ6Os12WEF9NHcunqGFfBVy2Xc=; b=2LgUAGiZvAhB3tvlowsHeeL/at
	9OKmQufrHH9JsJu20MR8x/ksZC6k6zZwZrqk89wBO48wWX7G7NJZJxZb+AU9qRJ4SHxHLqKOHXSpF
	6tLcO/J9Hs6BXb1kpZ3YuDln1G4lyC5ResYejs8acZeyPF7fcz14KqXHjiaR+3MP5lQk0OedqQZLn
	gmAz6nVkjLgoFUqQfRCsruIlW2wYVt2lpq29nWAsxc0nd12LKathn5tfiXkPXNDRCsUQPc0LiXbhn
	oYXZP7AIFlHbt+fLeODOA552alMjOZn8YDKxq6MDqtBKSzUcPRpHIpLPmG/unhzpsjU+thc8v6Nkk
	9L3jRysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxWX-0000000Dl8V-25iJ;
	Sat, 01 Aug 2026 00:24:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpxWS-0000000Dl87-2VZg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 00:24:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 051451595;
	Fri, 31 Jul 2026 17:24:10 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.65.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 677313F66F;
	Fri, 31 Jul 2026 17:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785543854; bh=eDQIXM1OVa//5nRVyjR/EED0Zzmr4Ifp8MMz5b+Y97c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ndvYob/B08rDgFN8UGLk9cCVxgEtIwerbLtVMtqpv8KMaSRifmxLeS4Hg+poraF5I
	 s1gHU28NCtlOZPTNDmaYiRGVqMtBgo2zu49os5T0KXZY6vLQqKvRc0xz6kzyKZoSDC
	 sh4jKjuZtSt0HJ5ERhigOeOMpfuq/56s8owJwFGQ=
Message-ID: <0fca2908-e8eb-4842-9a9b-a876fa459e02@arm.com>
Date: Sat, 1 Aug 2026 01:23:57 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH 6/6] arm_mpam: Apply T241-MPAM-6 to 63-bit counters
To: will@kernel.org
Cc: james.morse@arm.com, fenghuay@nvidia.com,
 linux-arm-kernel@lists.infradead.org, andre.przywara@arm.com,
 gshan@redhat.com, tan.shaopeng@jp.fujitsu.com, sdonthineni@nvidia.com,
 jonathan.cameron@oss.qualcomm.com
References: <20260731175243.904730-1-ben.horgan@arm.com>
 <20260731175243.904730-7-ben.horgan@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260731175243.904730-7-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_172416_867070_6551BD87 
X-CRM114-Status: UNSURE (   8.52  )
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

Hi Will,

On 7/31/26 18:52, Ben Horgan wrote:
> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> T241-MPAM-6 causes all MBWU counter formats to count 64-byte
> requests instead of bytes. Commit dc48eb1ff27c excluded the 63-bit
> MSMON_MBWU_LWD format while scaling the shorter counters. Systems
> selecting the preferred 63-bit counter consequently report bandwidth
> values that are 64 times too small.
> 
> Apply the scale to both the sampled value and overflow correction for
> the 63-bit format. Unsigned arithmetic retains modulo-u64 behavior
> when the scaled counter range exceeds u64.
> 
> Fixes: dc48eb1ff27c ("arm_mpam: Add workaround for T241-MPAM-6")
> Link: https://lore.kernel.org/lkml/20240816131432.993859-1-sdonthineni@nvidia.com/
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Should have put this before, sorry.

For handling the patch,

Signed-off-by: Ben Horgan <ben.horgan@arm.com>

