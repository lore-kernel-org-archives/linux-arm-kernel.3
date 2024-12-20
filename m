Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019DDE7718C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7Zq8dzfYU0pxsIu78uV40HDSAETIs2UaQx7HbtWGG0=; b=E4WCO3XRkX8ik4sw7yQpt8SarR
	P/dBOLExRvt4/mSRujaRuCVfx5aDkgJZ0eWwkXQPBo2ZYiw4FJx3JzV1SuElH+zXjMlNjEYPRKRuZ
	zqmBN5QNtxkp+wvSZQuWCvhbRtqdCO91m4m1YtPqM1j+qeS4qNXvqxGQIlIfq6aPymwWCJBmn47y7
	C0Ii20io+CsFhGuY19QWBtsBogXaPr1DHC41fSOFxaUeB6Fn5UUqj8MLRwORlE1BQycSLodWH7S+8
	0RUe+p7dBnzsz4WnklGucU86yvtK+C53EBh1nS9agfvlQDoXoDFOfW16WtMnuxBX3exVaEc83QqhU
	Sy1FIi6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhCb-00000005iDE-1D6i;
	Fri, 20 Dec 2024 17:54:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOh9r-00000005hTD-1WwI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:51:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 420C81480;
	Fri, 20 Dec 2024 09:51:52 -0800 (PST)
Received: from [10.1.196.57] (eglon.cambridge.arm.com [10.1.196.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FF8B3F720;
	Fri, 20 Dec 2024 09:51:23 -0800 (PST)
Message-ID: <ee78c9e9-ff47-416c-8bb2-55b0a903e13a@arm.com>
Date: Fri, 20 Dec 2024 17:51:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mpam/v6.10-rc1 RFC 0/4] arm_mpam: Fix several minor issues
To: Zeng Heng <zengheng4@huawei.com>, rohit.mathew@arm.com,
 amitsinght@marvell.com, sdonthineni@nvidia.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 liwei391@huawei.com
References: <20240722040140.515173-1-zengheng4@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20240722040140.515173-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_095127_447245_FEC36FD4 
X-CRM114-Status: UNSURE (   8.16  )
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

Hello!

On 22/07/2024 05:01, Zeng Heng wrote:
> After completing the necessary software adaptation for the local chipset,
> the MPAM function is successfully enabled. After related tests are
> completed, some issues were discovered and here attempt to fix them.
> 
> Hope to get some suggestions for modifications, if I miss any rules should
> be followed, please let me know.

Sorry for the delay following these up - they should all be fixed in the newer
versions of the tree. I've added 'CC' tags to the patches you fixed here.


Thanks,

James

