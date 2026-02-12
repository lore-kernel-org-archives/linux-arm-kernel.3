Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DD3EEA845
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 18:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSugxaTjAF+Vtu15k1dzpbbnjPb77R/eFUqciQ+Hpeo=; b=Y5bjhjqE5G6fG85Cj4GT9rRW9B
	+y6TzsD0GpONXwzHKEC6uynGKvfKNJKTCuw/FWKXcWH3bLezI4lWiruV5XUgVLkO+KmmQzF0OTkVF
	6KfLAVWcQxxRkTKGXVYC7nCRi9eqJRhYRZB0KM54vvxrhYMQv9sQAhVyXkWSWgiu+aJViLA9T3MFl
	MPtOp3KK9+5GafzfmvzPQKRNtja1InMjeXGCkptIpHgUTyHNw5rpcBh6/8jHih4CE8k3IhE7HTYUt
	QjsI+o44eDLQp6lMm6SEZP+hQ4lji8guXt686QxoAqyRV/WolLwHxPIrFv7YtZ4MtGw0ZeobX0Voc
	IOJdGb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbn6-00000002Xvf-15Xt;
	Thu, 12 Feb 2026 18:51:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqbn3-00000002Xuv-2EY7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 18:51:50 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82318b640beso100555b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 10:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770922308; x=1771527108; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSugxaTjAF+Vtu15k1dzpbbnjPb77R/eFUqciQ+Hpeo=;
        b=LhH5g5H7MMbZ7rLgUaK4hmKW3zhgK//v/ksF7dbBwICYim1KyuYRiDW/JUR0bklTSL
         Qacfztm+MjMQr8wAMgakaDA+MTEeNiftGe5OJe3PXYOzIxpwMmKEDpYZUoC3IXd9JMtu
         fm8LqrDLH6vcf9JU2yTD0shv8hE8YvEqbKZ38+VDLhLi4TM4GB7WC75Dp9wfxkFfMVhk
         Ks0BME6iK1GTSglDKS58XHFcif77s0Qxj0z6qENfA4EIGR/XK4iGUq2MVFnMLcnC2Y9E
         qLrpNDMqJ0ROuc6YCPjyBiouy6k4T5xMVwbrJCxqm8w1OoqXYh3dSCZqimZUo1Hd3FlU
         jx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770922308; x=1771527108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GSugxaTjAF+Vtu15k1dzpbbnjPb77R/eFUqciQ+Hpeo=;
        b=ug+pLO+CuAmg+0APw8Y3+QJkjUMJGElCFjKkYoCrVW2jVVPHUgrSNWH+e3klIAZR/B
         unRcRQqCA8JlBgdg3HQ73VWcD0Dy0gataU5IFtquyt8c+wo3X5BYey7LbSR3B4GiI2yq
         qIwj7yW46hTJsvfjb9uRT7bd7tpRlKxWzNfREv4zy7/pdIGUDbGAbaJMY8ScOXGlbDZ+
         gnvcjDcjE+wMo2SfpmgHYZCPTMvXh4/LUAA1OgEl5f0pBMcT93hrCKXq4xGN1ImS0miN
         GROMhaxHr7nkfDWmuEgkFucuJBx4DX6aRv55aDaANJJJ+Os1MXhOpJQOP324687NkEPc
         97ag==
X-Forwarded-Encrypted: i=1; AJvYcCU2hKXAg68N02k7i7r3NYXeHaBFDIWDjIC/8bH1d2ULu/aLURg4DyT7/QSRTw6dUfMFzloDwhEU8FGdRUFF/Z6x@lists.infradead.org
X-Gm-Message-State: AOJu0YzA6G1V0nTPwLrUYMe2QQ2oA0qPpEOkGLJM4WUx3Cr0XwDFqfD/
	1Z4+l7xtRai7ELf0CZNPXC9GZJ3nkmP+XfXLz41v63RB8yrH4zmrOXPO
X-Gm-Gg: AZuq6aKs2zeO3Aqlu+p9BKOfZtwrveaxGWdTvlffWWXKzsGyn0Ftf0FrSFCd+ARSLOv
	SFZf/D69uUmC29xnabnlYXAIsU/xiozKmlGlC3B4Qx9oT3h00IkHvocKVPMnmtdQwklqheCA0Wr
	l5laENlqeeAFFAAEt7/A6+XIliEv9jNc5PPJNiTPoUlloekUUyFPtulng+crM4OZXOWtcoH+gt9
	l0+NZG6CkSnMVbyIwwtDllEwFcDo+Auha3ml8iOYpVziZ5h0nLPC+V4dx8GSVVXoxfNXsXT9ber
	M9GqxMf48uHXkaYeeN1sGrGysVfhgIio6P52iyVzZNHGTBsVue4+BTkZEo7eAv9X4LO0D3m2A57
	TmALXGHzhGKAdyLUpikI3fZz0eGOn9I5LnAJHzvvonaICKTdPMVMSmwRVavviG93gKmnBD2CrEr
	HGLcOmYemPEI4z0PJwQcstervUP+rOdNX1pSjg
X-Received: by 2002:a05:6a20:7290:b0:38e:9ebe:525e with SMTP id adf61e73a8af0-3944cf5c9abmr3161888637.52.1770922308181;
        Thu, 12 Feb 2026 10:51:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197f8bc7sm5318260a12.29.2026.02.12.10.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 10:51:47 -0800 (PST)
Date: Thu, 12 Feb 2026 10:51:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
Cc: catalin.marinas@arm.com, will@kernel.org, ying.huang@linux.alibaba.com,
	ardb@kernel.org, anshuman.khandual@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v3 PATCH] arm64: mm: Fix kexec failure after
 pte_mkwrite_novma() change
Message-ID: <73e9c019-abd8-4914-a70a-277142e4f306@roeck-us.net>
References: <20251204062722.3367201-1-jianpeng.chang.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204062722.3367201-1-jianpeng.chang.cn@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_105149_596521_E81462DD 
X-CRM114-Status: GOOD (  20.51  )
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

Hi,

On Thu, Dec 04, 2025 at 02:27:22PM +0800, Jianpeng Chang wrote:
> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
> pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
> when the page is already dirty (PTE_DIRTY is set). While this optimization
> prevents unnecessary dirty page marking in normal memory management paths,
> it breaks kexec on some platforms like NXP LS1043.
> 
> The issue occurs in the kexec code path:
> 1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
>    writable copy of the linear mapping
> 2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
>    are writable for the new kernel image copying
> 3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
> 4. When kexec tries to copy the new kernel image through the linear
>    mapping, it fails on read-only pages, causing the system to hang
>    after "Bye!"
> 
> The same issue affects hibernation which uses the same trans_pgd code path.
> 
> Fix this by marking pages dirty with pte_mkdirty() in _copy_pte(), which
> ensures pte_mkwrite_novma() clears PTE_RDONLY for both kexec and
> hibernation, making all pages in the temporary mapping writable regardless
> of their dirty state. This preserves the original commit's optimization
> for normal memory management while fixing the kexec/hibernation regression.
> 
> Using pte_mkdirty() causes redundant bit operations when the page is
> already writable (redundant PTE_RDONLY clearing), but this is acceptable
> since it's not a hot path and only affects kexec/hibernation scenarios.
> 
> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
> Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>

We (Google) experience this problem with servers utilizing the Ampere Siryn
CPU. It now bubbled down all the way to v6.6.y (and maybe further),
essentially making kexec unusable on affected systems unless the backport
of commit 143937ca51cc is dropped.

What is the status of this patch ?

Thanks,
Guenter

