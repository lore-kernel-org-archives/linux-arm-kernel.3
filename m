Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D4BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 15:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dv5EhjifjcDzCNkO87ZY3qnAuLmZGZmKdrNsDLf9+s=; b=wY+3SPwfRinTT99iSuuH8FZO4r
	q8Y1FzhSt9KHy5jfud/Xl8N74MhQFwFG19bxGrR4edqcztQwnfknpqomj3H829BbbOadZ8tiKUXEk
	LA4ZtW5nj97GPgKH6zWo/x68faY9FdjfnMhYYwOQtlLLss1xwjdN3zp35eNrAiBSlgIs1QGByL/qI
	wzlCUz40B3dnNOb1rUZ55JkZCvlt5n+yVJ2kcn1Ku2Zz3biH/8VWwijK2M6Sltxs8kdSoBfs3uVXy
	2SrTrkChJWRjc2BRQFac5cjJpuYeytkyi+YXgIcbXQKekMqoX2WdsaaLH9/kmPpXPBm+YKsRyuTZM
	TXGQGRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uayE3-00000000Hgl-3d20;
	Sun, 13 Jul 2025 15:02:47 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uayBV-00000000HLc-3PH5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 15:00:10 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-74931666cbcso2781608b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752418808; x=1753023608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dv5EhjifjcDzCNkO87ZY3qnAuLmZGZmKdrNsDLf9+s=;
        b=mui1CgHrU0hoxa2qVxo2MUOSN/u0P24L3YDgP0YVlzLFsQF6dzi4H4zgruRbuayUQO
         IOwRBRlepZiuGvx580kbTqLanUjPgSXqfjl/FXbUnjiZ8eeKx7YLRKRnt+KE09eRkAo+
         jJUXPcYKqBkicOgrHYeK74B5ImE46HM863/bnMNCw9H9WEYxKHTk2rQV/4oGd3pOFY6b
         YYDk7GSikPNLMiJI0zTPJJuWVQghxQbb/mXo7D14bWpO7re0GYNX4ciZ3dkw3PvnCwI6
         XoC+FdaavvO4R2QBHmTzCZO+/gqx9Q/HnW/UPIDYWLXCANe4ZLLPM7VqlR/pkE/u8ioy
         Bgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752418808; x=1753023608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dv5EhjifjcDzCNkO87ZY3qnAuLmZGZmKdrNsDLf9+s=;
        b=Zvm3ozq8TrFqhGr1OH+vWvsloTxM9PNBR7uq59qblVP+9yQD+pH+B5GVjW1TF9ADD8
         rib1XCJoLx4s4B4oydXhnykoe7ohwwkalZzWmPha/A9e6QsPhdKd1g3RvlJgcUIZDxJw
         kUKSpt49uvvmtD6roftXrvU/ro9E1hZj8QMoHhIGBJk0n9zZbqhB0YGcoCwCJhpfpgzf
         vrEqGLCudW51mUdYW2z+/M503GJ+Elr1rVpbAY/aZv3oiwHzSoivRLBsIHstzcEN6SqQ
         rkEVX0YpTpCAVFrOQFSwBzaL+Ldb/9i0SWrIXb5bLvXY/GNa7uRJ8Y97U06l1vuRVIm5
         No6A==
X-Forwarded-Encrypted: i=1; AJvYcCXgEYkz4O/KsxDChoID1dn/b4vBeF8dKDcAAetxgTTL+XT1C1ePCzA29bndG9phPvzwjbfFnFCMRWGWwp8xINWa@lists.infradead.org
X-Gm-Message-State: AOJu0YzFKDd1BWuXUVjzpZJnEia0dp85pVU9NpX+5kWhsejkgS+sbUG8
	5y/ouen1CeYUjizM3jaKXxI2QwtV1igw6rNmk5CW9GLv0ltrr3NoyBv6
X-Gm-Gg: ASbGncsP2n+6tydYLRXSxNwcj5yUC8K+/yzVs3+J6I39N0GHNAKbWl2XlqVv/G65WYG
	RBTt8boSVFW10nUaR0DDssS26MhXn4WoVN6LiAOF0Ux6iqgEmOeNlpSByMw78gC1rQsdMlCzeNK
	STwjxb96WZhox4/cZupgW4Nrf8gjgJn4CNp3ZmE0x2vDjC3e4bKkP+ed89OB52l2Wbmf3oxSeQH
	pOCxSJtKgbbpxFPRUElQ0Cy0uyS9DJmgFoQEGFpFdqeIadN2X2RbGbKWoGYjzUHeFO+girzbj+W
	pLyPOfTPonO4P2wXRuueOYlyvbkXmgxarT8xDMh0nRVGlGpeNzhYQkzDaRBOYdZqxZfwRT6m1KO
	H45Nyq71lrDTwTIvIoFMJItvE904hOwmHxaUy
X-Google-Smtp-Source: AGHT+IFC6klH+DUaMNBobnXfYHSVyx0IO6xBlZQmjyeAecZZVdEr8LbAxJeI6zh63pFNGLXODs6Nxw==
X-Received: by 2002:a05:6a00:ad5:b0:746:31d1:f7d0 with SMTP id d2e1a72fcca58-74ee148c825mr13183813b3a.9.1752418807472;
        Sun, 13 Jul 2025 08:00:07 -0700 (PDT)
Received: from daerolee-Swift-SF316-51.. ([49.142.96.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b6fbsm8650669b3a.84.2025.07.13.08.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 08:00:06 -0700 (PDT)
From: DaeRo Lee <skseofh@gmail.com>
X-Google-Original-From: DaeRo Lee <skseofh@naver.com>
To: will@kernel.org
Cc: alexandru.elisei@arm.com,
	james.morse@arm.com,
	kernel-team@android.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	qperret@google.com,
	sebastianene@google.com,
	skseofh@gmail.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tabba@google.com
Subject: Re: [PATCH v3 08/10] KVM: arm64: Handle FFA_MEM_LEND calls from the host
Date: Sun, 13 Jul 2025 23:59:57 +0900
Message-Id: <20250713145957.623842-1-skseofh@naver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aHOXzUvGaQ1Bz3jG@willie-the-truck>
References: <aHOXzUvGaQ1Bz3jG@willie-the-truck>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_080009_871480_3197F59F 
X-CRM114-Status: GOOD (  15.23  )
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

> > > Handle FFA_MEM_LEND calls from the host by treating them identically to
> > > FFA_MEM_SHARE calls for the purposes of the host stage-2 page-table, but
> > > forwarding on the original request to EL3.
> > 
> > I have a question about your patch.
> > Does treating FFA_MEM_LEND as identical to FFA_MEM_SHARE imply that
> > the host can still access the memory even after it has been lent?
>
> Only if your TZ implementation is broken and relies on the NS hypervisor
> for isolation.

I believe pKVM is managing stage 2 isolation between Host and Non-secure Guest
VMs or between Non-secure Guest VMs

<Quote DEN0140_FF-A_Memory Management Protocol>
2.2.1.2 Relayer responsibilities
10. Unmap the memory region from the translation regime of the Lender, if
managed by the Relayer as specified in 1.2 Address translation regimes. This 
must be done only if the memory region is in the Owner-EA state. This includes
removing access to the memory region from any DMA capable devices assigned to 
the Lender.

From the content, it seems that when performing a Lend operation, it's
necessary to perform a Stage 2 unmap of the host memory area. Am I understanding
this correctly?

