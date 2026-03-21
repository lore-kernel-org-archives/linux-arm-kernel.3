Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9E11093170
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 05:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5slH90cGMNQaJ/nUAO66vR2HM7xhu3omBUy3YIB1Mo=; b=v9Haxm74ndZgGD3CnWJHzZlyio
	Kn5Uok5ScvoKtcTAPHDu8u2oii3a9Z5cAiQIVkRVTW3LO2hpYgCQAM8/unfmQhYSx/5nC8YKYyzfT
	Un2KO7eINs54fHVl5d1Qqe/zyvfdGaXtl5JX6XgFV5jdFjP4M56ZbBYW40Gg1LYqC4YMDKejllI7l
	m0u5+0dSzGZMNOXd7lzPVBxqpUT5Tokjr6TSaE3ZdXTivOg0EiG/hzVgnKr7QZ2P2ng1THC0urSLo
	hNk20ROVL8h2xKhahc167wtHZI7KEODTxA+7pPq2crmrk9eG4Yf/nqY9nRGskqTw1mLMESQ7y6RSa
	LyyUDVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3okh-0000000E4kh-0rPE;
	Sat, 21 Mar 2026 05:19:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3oke-0000000E4iH-14VR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 05:19:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2aaf43014d0so16300065ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 22:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774070395; x=1774675195; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N5slH90cGMNQaJ/nUAO66vR2HM7xhu3omBUy3YIB1Mo=;
        b=PapAKbeQWSS+JJh+t7zgkY6RD9ktK/wJPg2a5ciWWtVt/1N14Ujc6yuP9Vl+YOJLil
         otl5I2fKio7Z3RTorML+3zTPZunz94pqBo6TXGBwyC2Wan7cV+UcYx7hAisF28e3zCxZ
         Bl+CIaH1OkO67x0AfE4CcKnuNQyn6iG51psYHImNoitHTnpGpCRivCq6eSSyKGhvJm+Z
         q+OiQ5nGtH2eXOvQLiyIaUR8Caka8flV23+TLo+d0yA6n0qGrUhZBRXpzk/B+fPVG61Z
         JeldBoPCpL05lJL0qkdXLQ+1xHCViEzvYxTP0dhb5wBYoJPeSZHmF8+mo6Vdx41r42JB
         J2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774070395; x=1774675195;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5slH90cGMNQaJ/nUAO66vR2HM7xhu3omBUy3YIB1Mo=;
        b=HJ6FxykcM0dLoOLoKeUsie7cmehpYTsPpZtTu9RziDJwBbidDpoe+uQ/xNM0RxY+oX
         604Qb3cQWVFN54nVpa2AoK8dqn3hVu2CA/5SHD3W7JTSkURvu9DQNyebfPVxJtvsENJf
         uM/81djIvqKPTN0U5empHXLtYTwCkrmfWMOApuGhld2mVzPpJj5qeifzWhTEfnGAFdlK
         Gw6d779ICCsXsisMrs+k54OFKJNcbZqNdew4VxKOKPzCksGZuPzWnQ06p1PRjAXlAWH4
         fl9VuHMZMCnOoYruVi/1Vm8wtpwrm5/A9VgOSaLlKD1NRCbts4hChV9/E/rwZDXTWbc5
         yOWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUghjhwDUOyoGzjkz/tEDKK7c3FbQfeiuEOufHwbV37b9gumi6QfS5NeD24/jMuRLrycZQwDG0h5oSidnmgEzPp@lists.infradead.org
X-Gm-Message-State: AOJu0YwxPrW/HO6R2iy59f4pFqNRDF2Groo/8goUs3Sa0y5Aqq4Tw+kj
	nKblFIciEBVdJA8Y3Z2BU59kgViKk1KyaEzZgf4XDFc//paz1mYbw9lv
X-Gm-Gg: ATEYQzxbsUn7H/e0yDBvV6kqu+qNJcajVa7FYHnWozw6uli30qVdVZIazOFm92IvNxx
	L8Roex/jitvMbjlkmar4y2O88wibM05k5f3kmDYGzCmjS+Euhtwtay2atAXvVmwAg7GTwWvYebx
	9DK0LJZ1JDtcOJgJ2UlKpJnoVPI3n6cFxijcxaj7HiHoNhBj3v3sU9/VFGNk5nSqKK7MKaqn3vF
	L+I5slqIu2FrEqA/ozQxo9z1T8r+1Yfrlt6vX1x4HsI/b9khII0FHnHAXKtOscp1F48baZg/dMq
	OD4YT9vhDpauYN2ypEpwyhw5CjArop691fnur3j1zcrZn76Yj6FRc9336L/ufuvtmfwQU3geS7U
	XUbNRRqRe8QO81v8j2qSpydHfoh5C6ZkZHrvg0lnqe4PblpaOIvfuKBY6kHYMadclMuAk7FkDse
	O2o2ucW3TMHvp9weAPDeErDg==
X-Received: by 2002:a17:903:191:b0:2ae:c984:6d72 with SMTP id d9443c01a7336-2b08271e23fmr57382855ad.22.1774070395090;
        Fri, 20 Mar 2026 22:19:55 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836955dbsm52944385ad.72.2026.03.20.22.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:19:54 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] mm: change to return bool for ptep_clear_flush_young()/clear_flush_young_ptes()
In-Reply-To: <5d24b34d8b7860dc2188408b3fa530193bcc5caa.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Sat, 21 Mar 2026 10:48:41 +0530
Message-ID: <fr5tyd3i.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com> <5d24b34d8b7860dc2188408b3fa530193bcc5caa.1773890510.git.baolin.wang@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_221956_286076_31C5E801 
X-CRM114-Status: UNSURE (   9.75  )
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

> The ptep_clear_flush_young() and clear_flush_young_ptes() are used to clear
> the young flag and flush the TLB, returning whether the young flag was set.
> Change the return type to bool to make the intention clearer.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/arm64/include/asm/pgtable.h             | 15 +++++++--------
>  arch/arm64/mm/contpte.c                      |  4 ++--
>  arch/parisc/include/asm/pgtable.h            |  2 +-
>  arch/parisc/kernel/cache.c                   |  8 ++++----
>  arch/powerpc/include/asm/nohash/64/pgtable.h |  2 +-
>  arch/riscv/include/asm/pgtable.h             |  4 ++--
>  arch/s390/include/asm/pgtable.h              |  4 ++--
>  arch/x86/include/asm/pgtable.h               |  4 ++--
>  arch/x86/mm/pgtable.c                        |  4 ++--
>  include/linux/pgtable.h                      |  8 ++++----
>  mm/pgtable-generic.c                         |  7 ++++---
>  11 files changed, 31 insertions(+), 31 deletions(-)

LGTM. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


