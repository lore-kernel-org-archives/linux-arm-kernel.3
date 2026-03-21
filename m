Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C7B1093170
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 05:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSrGnm4uwHURRo/Dbgx7AVRGahiZ5mij0ljFmYODkAo=; b=ds9yaOJ2RG2IfyWP7eky0xwLy3
	T7I54TYvtqWyTnL3bu7ZrN3AdWXKz0wrP2jAQp25BPUMtVkGQ4fAjJorCzYxXayNa2spq8X2Q6HBB
	ojUgOpj8X8RpIUtcCHe/mLEHePNzVgwcOgwJMOIyv9WitfHYmql2s0sqKlXzL2Mv3vRC5JhHtPCBh
	TRmWwMhCeZY7Iwh4UmAyGch4vVWuuLQWvKD4hPNo1r0oMGqAfNEZchFmclqS7CzwM9VQ2cddwtBA2
	9MyX6sgkjFJWEN3JHkfsChk5G3APT0kfmQZ9G7dex9MCI0EudcWlw0hEjQMY4pBEdUhsoVjwlek+w
	70DDzTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3owM-0000000E62D-1ngN;
	Sat, 21 Mar 2026 05:32:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3owL-0000000E61w-1szc
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 21 Mar 2026 05:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Message-ID:Date:In-Reply-To
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TSrGnm4uwHURRo/Dbgx7AVRGahiZ5mij0ljFmYODkAo=; b=Zdre5SeaM94S4le4N7WL9madAB
	5lHyHJzdFCoLZJ6mOj4SMnB+lzVdozltp0ih5aLTe0G4w5lQx8Fqzq/dntW1sU+Hve/f1FpZbR35x
	PMWTYzJsRkMveXBBwD/F/yPhRq0zxdHshZ+fyZQjLnmYQz2yODhgq1WCsetg1WEHYuZPd6g8BBfAS
	/dtgaTx0h6ydrPr4X1CxNfyul7h3Up5yoYYnQpGZh2QwoHTiAeAWeYjDRPOy3kX/80I5e2drZkJPb
	cXqSHtsPgVDOSV3Emj23Srh8RJACl7M1GSE0v8XDrgOON9QRIUoikCYmgicIutsxBs4sPsg9t8X0p
	6NxJGzlg==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3owA-0000000Gpgn-0Bz0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 05:31:58 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b061b6cf36so9049885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 22:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774071107; x=1774675907; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TSrGnm4uwHURRo/Dbgx7AVRGahiZ5mij0ljFmYODkAo=;
        b=KAluqOM85iJiJJoCvwphJt4ct7z7HbylGcfx0LG273PmjozpQ02rlecQsqQlQBWUrR
         tpS9YacWJaD2NHLu5xyJiJ1d7GoVA4rt+TnAQk0ELQ92FLiX4nXNMqSmKmACoovjgyD3
         0tw0v785+OoYAbV50IyZSEQOS3rPbTbBVX+WZhqsBkYrXbU5IBK+d4SPloyswYiM4VAM
         tmjUB3OmrHNTUSnqGXkdL7taIDWOw30rmaY9gPMkxCJXdm0rvzgYP0gFKbIz04QvrPo9
         dkfbyAj91kOJ+slTsMXkXBDlKxGf9Kp/tWv/sks4CDhwenllAx3iRi4FT+7y8O3IR7wz
         F1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774071107; x=1774675907;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSrGnm4uwHURRo/Dbgx7AVRGahiZ5mij0ljFmYODkAo=;
        b=UM1IxItZOQeklf6SjC0ZXQ/K1k20zMEbuNmcokcjd9PEbTKmIYj+WgZRz7g57rczlh
         6j468eoXhjQMh1ChreObaff+2JBj3xPmpZxBOWD/dvZT/20YVcM3oTGWVVHP8oAxnf3i
         GIebiZpM1cAAConwUBIGLD89KLEpRVcspEwdVv0VETQb5rNzq899LM31pPb0M8fQgVqd
         hLecB6VBO+V2od+IhXSG7JGgW2xNPNyK5QilnonZK/Y7b3qVM2GUyf6Bjyc5Ixr6+SjU
         MumM2TPeJz16fJJ8U1clTPndJg1LMTGyi+TMWDhJ5QH5bbd+2YvSFvUZqiGYXEy1vmf0
         0VaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnG9tWu8uF2CY+KJnHx4KwybPITjKcFr2dvj2n43aa3ukzsJ4tVdxNPOcB1AKwiFjYl40fHSItOh/iSVTs6bp0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt+jamZqEGl5AYpQCnvHceocqyxnGbTkVUz2i3tfkuE39c03UF
	VhYXwdioFgDORFpPB5JoESdFuqitAH1NC3F5cahxIegmE17otHdeM9PS
X-Gm-Gg: ATEYQzxXEVs97tsecnhmamdM1R7A7adtEfPty+fVN9ZvHH7757+GWo7QRULe3Q1Xgdj
	XE1OA0Ayg6m90gQoelmPOHJctFXvOw3dgt5JJBeyOOmEPfjAFfcUif0jIWHNSztQXZyUBI6dceV
	DB37du7BUBzC5xAZJojTqaWFM7QCPOKLs+V7IjhazFwJd1toc9CEyRtbhOYDcKX20w9rFpqrxCr
	Nv+FLrDPBfIw+YEofccGvshd5+S0aNp/W/kqyynuJA6HNL/mbrIl1puh3RUFGeWOjilpwJT3j+3
	7zJYmv6/hqEGYDx7IJMVTTZmwEVEhhFTGGj5xBWpjYTKwVKV5N1svRWLMhYh7eSaR+xixgh5aHH
	z1cTkpP7PDRpX3oeCV+RR6aJ6g+9NFNpf/LLykpdSyWmYvSIWXExGZnWMgsNx3/v8+e/oRJ7Cun
	d1nuIX7P+QgAmWkyZ8W/jR0Q==
X-Received: by 2002:a17:903:191:b0:2ae:8272:deb0 with SMTP id d9443c01a7336-2b0826feb3dmr54931105ad.15.1774071106610;
        Fri, 20 Mar 2026 22:31:46 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516aa6sm55638395ad.9.2026.03.20.22.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:31:45 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] mm: change to return bool for pudp_test_and_clear_young()
In-Reply-To: <2711ec4bf6c30182004e34027fb31a2e8e24749e.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Sat, 21 Mar 2026 11:00:45 +0530
Message-ID: <cy0xycje.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com> <2711ec4bf6c30182004e34027fb31a2e8e24749e.1773890510.git.baolin.wang@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_053152_383916_5BC2B4B9 
X-CRM114-Status: UNSURE (   9.68  )
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

Baolin Wang <baolin.wang@linux.alibaba.com> writes:

> The pudp_test_and_clear_young() is used to clear the young flag,
> returning whether the young flag was set for this PUD entry. Change
> the return type to bool to make the intention clearer.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
>  arch/powerpc/mm/book3s64/pgtable.c           |  4 ++--
>  arch/riscv/include/asm/pgtable.h             |  4 ++--
>  arch/x86/include/asm/pgtable.h               |  4 ++--
>  arch/x86/mm/pgtable.c                        |  6 +++---
>  5 files changed, 14 insertions(+), 14 deletions(-)
>

LGTM. Please feel free to add:
(assuming you will anyway kill the unwanted externs)

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


