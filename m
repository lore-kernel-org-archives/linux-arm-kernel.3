Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6517FC55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=53gfRXi1gAQzfOY/gAzQ6qJoVXPhw/w0nq69bgbPOyU=; b=LV27Vv8gGwRMDAHW3rnNK7BVmJ
	OfJu177EVgb07ebBuf4hkPHPO8ybAdoyUkXvMfe0MVX84MrW62E/cKzFFux6o7Pu/150V8/RGDIrJ
	sSh+OY/lLWIGwmKzo7pXRFOKKkbOuJcnFuE5Zxv53bbTm0KPUU1sAbCwdvjyEw/wlcav9FEwf+18y
	wSszJlZk5pgO25a2SpBnzSwO8Bm0DFDWhISx3jGxPcLy1ABaOAZbub6FlP+Y3FI+fbXIilbElR7TY
	CtahrWrPtvTrK43oVzcza8N/ABb+OIZYHNxOkwDHjNuB96NA2tPYa6v7reuCnz/x9udHmT7b609sA
	HeO6OJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp2D-0000000Gh65-0bPL;
	Mon, 03 Aug 2026 09:32:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqp2B-0000000Gh5i-1B2y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:32:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 921D61476;
	Mon,  3 Aug 2026 02:32:30 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 063B13F66F;
	Mon,  3 Aug 2026 02:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785749554; bh=3MPU05x/eTgZTHBGi6uXAVQKbSgp9Z42Ei1aGnEw4bA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vJ3/JINNtKWb9/g4N6UEXWCIlJee3vSwYCX8y6vcdKxWrDfUj/TYzrlidbT2vFrNL
	 B1r1kLN0jEvMkeb9v5BvG528drpLRVC2dOfmtppD1QQ59Hw4CseGVdrpfO1IgQvqID
	 oQqDa78fcSwFMkvteMaMFedon++q7MtMXKkyWX1Y=
Message-ID: <4a383f79-6b78-4c03-b8fb-6f0a0c9858f2@arm.com>
Date: Mon, 3 Aug 2026 10:32:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 09/45] arm64: entry: Avoid unnecessary
 local_irq_disable() on kernel exit
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-10-vladimir.murzin@arm.com>
 <7a54d1c8-bf0d-4940-8d3f-28c48fc5c18f@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <7a54d1c8-bf0d-4940-8d3f-28c48fc5c18f@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_023235_385907_CAC8BF5F 
X-CRM114-Status: UNSURE (   7.20  )
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

On 7/28/26 04:18, Jinjie Ruan wrote:
>> +/*
>> + * We are returning from the context which allows involuntary kernel preemption
> Should we add the irq disabled status for preemption?
> 
> We are returning from the context which allows involuntary kernel
> preemption "with irq disabled" ?
> 

Make sense. I'll add it in the next version.

> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

Cheers
Vladimir

