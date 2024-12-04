Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFCAE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpZRaeU68VEUP44Kc2SCquQp6Bk7eIcWkdeP2RfMXFA=; b=M64pqloqVpf/R/dGUsMqc6Ulx7
	bAxExzPpk51F40e5k+G/tZbsTRT/bIH5XBZqISWrxa+niS11q+VshAsv3BGBu8Cvpuv0Ss4G/I1wU
	WgV/MuQdSiFkp7VuTXTO56IOGA3doBfaP50WIQCNB5BYit+7kYChO4pUdrvQVOIXXgFlrgFeDn236
	kd1RykjBgMxlgyyeG2Ptysrf1ceMUjYVk+rl3AogoharbdH5LSqfBNa7LhwrPWSNMHkpY3Fz+kIxa
	DhIQhyCkHt7Zva/KpufUQsKypQk23LR2r/LVh2cyN50S32jfKS/IQmQaK/TzG3WQPsxSVRvB9SkLH
	Fx0T9jMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoBR-0000000CTjL-2NTp;
	Wed, 04 Dec 2024 12:08:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIoAR-0000000CTe3-0QYp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 12:07:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B797FEC;
	Wed,  4 Dec 2024 04:08:08 -0800 (PST)
Received: from [10.57.69.127] (unknown [10.57.69.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58D5D3F5A1;
	Wed,  4 Dec 2024 04:07:39 -0800 (PST)
Message-ID: <a69093a6-2778-4588-9566-c57cdba14867@arm.com>
Date: Wed, 4 Dec 2024 13:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: signal: Ensure signal delivery failure is
 recoverable
To: Dave Martin <Dave.Martin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
 catalin.marinas@arm.com, will@kernel.org
References: <20241203100322.1626805-1-kevin.brodsky@arm.com>
 <Z07x69L6Mssncg/7@e133380.arm.com>
 <a9aa36eb-d5c2-4d1c-bf5d-e63e4cb55404@arm.com>
 <Z08l0Q9KO6haeSSI@e133380.arm.com>
 <3da4f6d2-5869-4515-a86a-e821d9276640@arm.com>
 <Z1A7ACC+0Vb2bT9p@e133380.arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <Z1A7ACC+0Vb2bT9p@e133380.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_040743_183635_70566186 
X-CRM114-Status: UNSURE (   8.11  )
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

On 04/12/2024 12:20, Dave Martin wrote:
> That seems fair.  A one-line comment at the call to setup_return()
> should be enough.  I guess we can live with the slightly confusing
> function naming (since it was already a bit confusing, and this isn't
> trivial to sort out).
>
> So, with the comment, feel free to add:
>
> Reviewed-by: Dave Martin <Dave.Martin@arm.com>

I'll add that comment in v2 - thanks for the review, very appreciated!

- Kevin

