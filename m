Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A244C5518E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuylrPdrEaEkDMOBtcRoI3+nHqQlusbr2r+Jr4TGeZQ=; b=28B6dt4m8FUqx/TuaDmUqeFl+K
	NMeOktusknAC6pGM0lb+g0L+HRDjrpCk5FTi25nyv+bCdTdMleHhmKEue0eDCqKgejj1GNtvS0i4S
	fWYVni3dWcggeiOijyagzyg9lrm+4fREWopQ1eAdWU7yApdx30o5/Y3pJr85uQnnL9c2ORl0B2cuU
	DwgRE1piljfduL5p9K55cyG9D5NDlj6Rjy6xYaOBOjqt+3SR1H9mEpfVIeU0xpTL++4NXWYupTBzd
	021JUa/P6ZBLlBevSc42+Hi7r5eOlI04/j7bKQOziWmQsc303j9XpPv4EglcB8gpZWnK1aKEyLKc/
	FombzU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp9v-0000000Ghz1-04QA;
	Mon, 03 Aug 2026 09:40:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp9t-0000000Ghyf-0BD8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:40:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3B1D143D;
	Mon,  3 Aug 2026 02:40:27 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51C963F66F;
	Mon,  3 Aug 2026 02:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785750031; bh=j1cW5jeKlqYcO+aAqtmwH+fOZmVmZOHsD+AJaMY4wg4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tgcXCsKeICQaMsfDcDmaK20b1U2hR0L2/MmI+MjD7ugxBNqm2S/B1Ho5gLzJw99j+
	 Tg7DiLhh1JT+SlJZytnHm1m+qkrviVsDTfrlqLWyc0GoGUvot4TvjHps3lrmZRYtmu
	 xA5Dk4S6NJIZbcg/ccHW/xWqqxYZvibdCB5LnjFI=
Message-ID: <86ebda30-26ad-438b-9f98-2ea9e3849cd8@arm.com>
Date: Mon, 3 Aug 2026 10:40:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/45] arm64: interrupts: Add common exception
 state helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-13-vladimir.murzin@arm.com>
 <e93ae08b-64e2-4128-b1fd-910c4d197dbd@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <e93ae08b-64e2-4128-b1fd-910c4d197dbd@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_024033_131692_56166216 
X-CRM114-Status: UNSURE (   7.94  )
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

Hi Jinjie,

On 7/28/26 09:20, Jinjie Ruan wrote:
> Hi Vladimir,
> 
> Using two tables as below to map different contexts to the hwstate
> status makes the code appear more concise and clear. What do you think?

I think I already tried something like that and IIRC it hurts code
generation...  I'll have another look before posting next version.

Cheers
Vladimir

