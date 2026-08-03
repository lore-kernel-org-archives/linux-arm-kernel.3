Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34449C5518E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRWZR/aXzNRtlaANjzO2S5r0yF9L37fVJhN+JbqqSaQ=; b=QEj/SxFqU86+vq58B47W/KIYN2
	2zZyC4u0zOpiO1M+FBs9nkX/wkIljtLD9ZrnSiAQ7nhAiruQw0e2qy5Ol28s5kVPbmYIo00n2BFNS
	wE5d5NnzX4mIxi2U0Rr9PHQ0R8z7kboNk6vaiDm+tWB6clmlADrTXqblfWEEIKv5sdUr4/o82pvew
	pNrnnkBDTDCE86noomwyQ2Esx84Pxs2mlQYrIMaaaH3xqsnDYcDedxU+j/GTrxO34o1x1MC03zhaY
	kNF+RRxJK/s37hLnx4gwWrWTBxUipPLyPoRVj5CTMwqibOtByj8tTKNGPAWysHGNxfKoEquxs3kQr
	WEr9iz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqq10-0000000Gs4R-0VEM;
	Mon, 03 Aug 2026 10:35:26 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqq0x-0000000Gs3U-1qvE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:35:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47f633e6058so3043716f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785753321; x=1786358121; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FRWZR/aXzNRtlaANjzO2S5r0yF9L37fVJhN+JbqqSaQ=;
        b=M2Me9lSl5Rbp3pOIgsQEpPPdsnfHQwVqzpG9Tmc2KDLmYx3PGkaIIuylVBGiTDsj89
         hWZl81MRWa8GFNl5iKr34/u4GT7KlQH2KZ1/c9f95k6HUYejY7TgIv8XShZqqTy3kS7u
         quAfQXe9JVguxUDf/lKbF59jm3+4qwIic2CkSb4HiwoB4QQQeNe8Y7t8sXUESzcH7Peh
         IAQZ2UoSW+8WIv4YeZkts8pge06TOPT9lc5c99faTVRdQM81XfgKRz8G4bAZSufqQEsc
         RDPYWFucuVqUPB5s3rjFZR55Z6YtX4DPj4Zh+nkwlgLIYlX/F60zT3Ro44WFEYiiYgzQ
         9/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753321; x=1786358121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRWZR/aXzNRtlaANjzO2S5r0yF9L37fVJhN+JbqqSaQ=;
        b=DUclK3hOzfpNBz7bKDspsQYZX1Eg7kE78D6pSRzKvJPRp7/MJDH6aVQn5JxAQvQVVn
         6vhRESHDZX5ubCE92jBhbk9aERybmYhpSl3c90P1pvu/8mmP2u9h1skv9qaI2yXYxVl2
         J4pFsFv0j4fKNsjDAreyXpcNAtww2de3btYsY4HTz8NZsn2GpRFV+IPUIv2hr+KzTbXx
         RfUn8uB2N8aLrws/2jfKEjvZbTQPB/qSM2u2Odv3cDxCivOS0a4lG5N02X0GgeTqjzat
         NT2rm5oT0uZ/4oCl/TCDwOrKjLM2CEWS/GZLHluYswFTGab5RtRVZls2IIgdMT08XfJB
         Q+oQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr34Auo3RlBIZi2dHwYfWA2ebClHmSGegYb7hNR83klMWc8vse0vVrjxNwDoEwYxiTDP04XjCkciQLARptY5E7I@lists.infradead.org
X-Gm-Message-State: AOJu0YxHAgNMpNvsz44khXLMOXKKYfjxf8OhrhPW2/uxKylGGXNS1PAz
	vqw+zxTllRaAemoOK8BzqciFJ+E8P6zSztHhyoSj3nuwRNAakPghV5JGIZipckFWOZ2VKtiHPSk
	7wFQ0Ww==
X-Gm-Gg: AR+sD10edCTFoEhRcPXYXLKAV2givs9D9nTF0QWvBUo1dzdhNwilZkoeu+obqYZm9vM
	TgCqV82yZ6Ll+bwBtuW/gZmmxdk8Rbd4A+WWVMXpm7Kadj3K5PHehSJ+VhswWJGwZnUacGoErqW
	kZ3iJfzdL07f/BaSvV9rjPyBTGfGt6BFwmIEz8fjOyDNgg4O2KXod7EXVz3daQ43DPn4bpPn58N
	uvL1n3xkA71Z8uSQQLITu9VmE0CPzfZPN+OOXSjaHH42xvHUnKxBJEgoKfodvHNrxvIg0urfrTn
	AuR3oczX2mXz0QFQZosPh6DMLUzoHiGjc5RksDbE5xFd1736bJsNHHIazmJPyBXp2Ama7b3mLk3
	ojCmPuwxlIwfZFSHIXQ2+rn9gVMZxvcxo0gG8rHkrosQOaSH+9TodDElrfQhckXw8EzrlM5n4yx
	28TZitpfZDGt5bhARVglN1yZ2p14MYLWw2ZYexrb4ijODmCpthSdfZza1R9ejvH/6g85Tp5adnZ
	cZEA9p9N+ba+5qXs2pRbVZw3vpWaWYi
X-Received: by 2002:a05:6000:471a:b0:47f:ddc0:602a with SMTP id ffacd0b85a97d-47fddc06087mr15422708f8f.18.1785753299369;
        Mon, 03 Aug 2026 03:34:59 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm31650490f8f.7.2026.08.03.03.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 03:34:58 -0700 (PDT)
Date: Mon, 3 Aug 2026 11:34:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
	rostedt@goodmis.org, mhiramat@kernel.org, alexandru.elisei@arm.com,
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, qperret@google.com, ardb@kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	tabba@google.com
Subject: Re: [PATCH v1 04/11] KVM: arm64: nVHE: Use NULL to reset the trace
 buffer backing pointer
Message-ID: <anBuzx3c2MJgLF8c@google.com>
References: <20260720161343.1367007-1-fuad.tabba@linux.dev>
 <20260720161343.1367007-5-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720161343.1367007-5-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_033523_492858_800541CC 
X-CRM114-Status: GOOD (  17.28  )
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

On Mon, Jul 20, 2026 at 05:13:36PM +0100, Fuad Tabba wrote:
> bpages_backing_start is a pointer; resetting it to plain 0 triggers a
> sparse warning.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Probably missed this when modifying the type for bpages_backing_start.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/kvm/hyp/nvhe/trace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
> index e7e150ab265ff..177fe3d8fbb13 100644
> --- a/arch/arm64/kvm/hyp/nvhe/trace.c
> +++ b/arch/arm64/kvm/hyp/nvhe/trace.c
> @@ -93,7 +93,7 @@ static void hyp_trace_buffer_unload_bpage_backing(struct hyp_trace_buffer *trace
>  
>  	__release_host_mem(start, size);
>  
> -	trace_buffer->bpages_backing_start = 0;
> +	trace_buffer->bpages_backing_start = NULL;
>  	trace_buffer->bpages_backing_size = 0;
>  }
>  
> -- 
> 2.39.5
> 

-- 
Vincent

