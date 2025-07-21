Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF8CC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFX4yrHmv79Mo15gO+4ELe8b1C08flBzxLCaw5rewk4=; b=KZpud7IiCs3BztA//wCQe/BYMq
	Wpk4gjCPqX+pnsbhs8q2O+cj3hcg8ZVq0KPYlW8HolAD6x6KeK1p6xx1WpPZ/5WpB4jzMFRAYiCB9
	DPtmLc9spuByylceOh5q/5s4UfwgnHovtmyw6Nh1Umi2G0W0Mk6fXzz/il9xFCYZVViJTN636Ajy2
	v9k1zP+LFuRvd7QQDnPwC8L2AWKGNepP08WS8rXDzDHN6nFNiQxt5uErbQvq099wZwnl05ib/KhZV
	KslxW2lFXVXThbta5l0dK1S57uRWaZMtEQ57ZOEE8NRSQ24npc1GnBF08b6aKVohXRojNCDAQ8fUS
	HtDOdlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtbE-00000000C4J-3ddZ;
	Mon, 21 Jul 2025 16:42:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrR9-0000000HVsQ-0ImT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:24:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 227B95C5E80;
	Mon, 21 Jul 2025 14:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DA9C4CEF4;
	Mon, 21 Jul 2025 14:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753107853;
	bh=kSKd+qqk9Adhb4/W/xZARkQKTnvG601WUoRq0QEIvwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c6PxopCPicDshkRsaB/+InyfPI6vrUx2PA1la90miF75xxqAGtsGmzz6yvGBb7BgS
	 4pzH1Ii/CCRjbbzNJ2lSmlAjyWpYVrS5VNBES/wRp81IoHMKfJd+CJJlMlzqe0HXgo
	 2cbTQuRSkss33Y1KFD5BPVMJJLodAGPJ/y2TNl+cfGL/oxpCdelQV1UqO9cGDDGfIU
	 +2ZqfvG1v4V5xc7oVlQDL+rQdNOeU7kAA8+g5LXDGah0gsM2AGdRwFtUGIiVuC9Awm
	 2Qz1kGK+Js91zXxBGuosxru9ogj5pyJVMcMCxnq/HLlLHPxNbg1gslazPs0anmy+Sc
	 3TpFm6g7ox/9Q==
Date: Mon, 21 Jul 2025 15:24:08 +0100
From: Will Deacon <will@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, brauner@kernel.org,
	shuah@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com,
	tianruidong@linux.alibaba.com, catalin.marinas@arm.com,
	mark.rutland@arm.com
Subject: Re: [RESEND PATCH] selftests/pidfd: align stack to fix SP alignment
 exception
Message-ID: <aH5NiFDmnLwh7J_w@willie-the-truck>
References: <20250616050648.58716-1-xueshuai@linux.alibaba.com>
 <ee095fdd-b3c1-4c41-9b06-a8e3695c1863@linuxfoundation.org>
 <0a8d5fdb-28b9-41f5-a601-cf36641bddbf@linux.alibaba.com>
 <821acc51-1429-4625-bae5-daa67bddc7bc@linux.alibaba.com>
 <c6dca956-d0ea-4c63-a48f-d02f21d38b9d@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6dca956-d0ea-4c63-a48f-d02f21d38b9d@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_072415_151294_560FC062 
X-CRM114-Status: UNSURE (   9.15  )
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

On Fri, Jul 18, 2025 at 03:10:32PM -0600, Shuah Khan wrote:
> Can you take a look at this and let me know if this change looks
> good to you both.
> 
> I can take this through my tree after your reviews.

I never got to the point of fully understanding how the test was
supposed to work, but it is true that arm64 requires a 16-byte aligned
stack pointer and this patch appears to achieve that.

Will

