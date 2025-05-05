Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35E2C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiExT28N928KJxGOvNnkBz7+WgsXz97GUgdO7yEN+nc=; b=ga+MUDwwu5H/++d02tc7woChAk
	eWir7tG8D5RSR/6bd71KszheJaFKmT2yLpEdKHF6YcIaqcSGCOfn1OktDVea+PuSuQ5A/fB7qD4cg
	Xpf8nBo+mAEfQuBW7lzqEinS7HlW47xNZKXudCjXDy5TpIYvHhIIAJWroC2UVwn+1NQpDpAeJdD3w
	4oA4eTfqEbpX/NkRU3HT9doeN6kMlhpHIBGzIfDweSU6EediAtzuOnQ5+ul00qAHODfgOGIByrMPW
	bNxLa0OyuUWE9MrACvxyyyND3ocxwiNpCRtPEZkhl39vL8avS4g7x8wY9o48ivxOmwfKN6stBfeeV
	ANlUPu3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzBk-0000000856J-0PT5;
	Mon, 05 May 2025 17:01:08 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBynq-000000080gP-1A7s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1746461581;
	bh=OiExT28N928KJxGOvNnkBz7+WgsXz97GUgdO7yEN+nc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UKh9OIYnlHsOqDjy64J8Ie5+AZcUrPHcGUbWQZoMgc7+Js0vChscbme0LC1cirPWx
	 hrx1NfqO3SBkv6VTDcx9k2ES4EyOUk8tTjQSRfFuBTgXReFIashdsssQpqg7u62DSA
	 2gE+4scUEKjYuw7T7bzJtKsdywjeYxV/LsUaIJEY=
Received: by gentwo.org (Postfix, from userid 1003)
	id 39FE2401EB; Mon,  5 May 2025 09:13:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 3728C401C4;
	Mon,  5 May 2025 09:13:01 -0700 (PDT)
Date: Mon, 5 May 2025 09:13:01 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, arnd@arndb.de, 
    catalin.marinas@arm.com, will@kernel.org, peterz@infradead.org, 
    akpm@linux-foundation.org, mark.rutland@arm.com, harisokn@amazon.com, 
    ast@kernel.org, memxor@gmail.com, zhenglifeng1@huawei.com, 
    xueshuai@linux.alibaba.com, joao.m.martins@oracle.com, 
    boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v2 0/7] barrier: introduce smp_cond_load_*_timewait()
In-Reply-To: <87selmok1y.fsf@oracle.com>
Message-ID: <6181ff8b-bb81-4dd0-f8ec-0f9d0944885e@gentwo.org>
References: <20250502085223.1316925-1-ankur.a.arora@oracle.com> <a85fbebe-aa44-5ca0-f8ad-f997ea7e6622@gentwo.org> <87selmok1y.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_093626_350193_3924A9AF 
X-CRM114-Status: UNSURE (   7.78  )
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

On Fri, 2 May 2025, Ankur Arora wrote:

> AFAICT the vast majority of arm64 processors in the wild don't yet
> support WFET. For instance I haven't been able to find a single one
> to test my WFET changes with ;).

Ok then for patch 1-6:

Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>


