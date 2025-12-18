Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84325D6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xt56qqVKflx0fkQNFe7QVUab7luc9R4I5ANbQASr0Zo=; b=WPaVPnNj885uGSW2HppGSl3iHe
	1NT89CJAly4whXY2pLo7eswNeDMnnBO39Dj2XPP/gcqGdjvA7n6/yxjxmnLu+grY4l4av7nRwriIZ
	ZXHoYQDgMI9R5TGvbeMRMYMVObbDVVC9wzFs7iMfcJT9zsin7oToOVdb4JDDV0cPR4oPywvGV4tAf
	9PILGwgZ0gexxz1ObUG1QyMBjH/jpipZOvgR0S1lbq6YU7ORzz7jzQZeKkyJflYnVjqYmeNda07Oc
	y2xeCMRT6bICaP4v5WZzZ27xcxVN0qJStI8Rp9Q5KjFJ1khga7kpH5uP5TDYNJpNz1QsexN3ejSiR
	mujkNLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWI36-00000008wTX-0Usw;
	Thu, 18 Dec 2025 17:44:24 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWI32-00000008wT8-26VE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 17:44:22 +0000
Message-ID: <5c57bea2-a9ff-438d-a256-954e291670af@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766079850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xt56qqVKflx0fkQNFe7QVUab7luc9R4I5ANbQASr0Zo=;
	b=MeIIEoUCzE0vOcFWsVGwzLoy/FfD8bnMvMjUqrxMJhnq7qhbhnc3KtQmcdjyGSO2rpuY92
	/Gyi+feLkh4TBpG6Aa2sDOsRI7vupNvfQRY/hB12l3jw2ZR6nRoh4Jtl4Nq6Z9PF9paWM+
	o/Htomy3/Roo4lB2MCplGTxg2p02WOM=
Date: Thu, 18 Dec 2025 09:44:04 -0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2 1/2] bpf: move recursion detection logic to
 helpers
Content-Language: en-GB
To: Puranjay Mohan <puranjay@kernel.org>, bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, kernel-team@meta.com,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
References: <20251217233608.2374187-1-puranjay@kernel.org>
 <20251217233608.2374187-2-puranjay@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20251217233608.2374187-2-puranjay@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_094420_756897_382AAA29 
X-CRM114-Status: UNSURE (   7.00  )
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



On 12/17/25 3:35 PM, Puranjay Mohan wrote:
> BPF programs detect recursion by doing atomic inc/dec on a per-cpu
> active counter from the trampoline. Create two helpers for operations on
> this active counter, this makes it easy to changes the recursion
> detection logic in future.
>
> This change makes no functional changes.
>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

Acked-by: Yonghong Song <yonghong.song@linux.dev>


