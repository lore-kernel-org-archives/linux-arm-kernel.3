Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D868F532C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 01:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oczxcm+7nIYhSCAxtv8AlUWabW040X/K7A4VrdDatnY=; b=Jdo0gOSYDVgsfdpQJTbF7KT0p1
	qniToCAZ3PfgmktwoAA6hA9O9BNTxp2eOYsvVgnR7ubXGcjWggpc89dnD2hCdqIGtRFxag2V/f2gE
	JsJXYLWnRrrPyiaLEgMiBgPs4MW+8nQ1DgVps7qVMFxA90Zduoy139TLvTrrP8jMKeWQG7/lYc66q
	Xrf7jyivWLw8nbt3bymUBaC/Ex193RDMK5+QAcX/Ky+skZivEHRuBBqrnapeAUv0CjbukPqvEKwhG
	PaKRmZFRg4KBQw4UOCSvffzll1KSVnLXBtKSdzCJqGSDkJN02TBGSx99RT0H7nvO4tx1zDDOJoo7S
	KXZAlf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qmc-00000000KFY-2RF1;
	Tue, 24 Mar 2026 01:42:14 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qma-00000000KFE-0LWU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 01:42:13 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-43b41b545d9so819996f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 18:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774316529; cv=none;
        d=google.com; s=arc-20240605;
        b=hZnHm8eWk3MehOg443TRHMt2PkXFM/jaxKOr5dzk/iKmRdDqhmMHeZH8Xm1p5ihCGm
         Zje97JPgJZTBBDemBmx5A0aeQPiv1TlVFs2wWDibyy9avKvD0i9NZFd/6j6XNds1DRSB
         KCNVAeHZemPZL03nnkHm8qfDHeHZuxQQVX9EPzhJMPja7kkr9EEjQNRMR3m8kbtgvu0F
         7icCYAuul0qUtYpjqAIZ+joI60HnfP2bOvIBvptnYXG3Cw9B5aZSj0swYvDAstESVG0g
         B6AAXcT3+B26W8npz4/v23JnD9gGUQfTGqfR6AUXNxN6/KQim3jWrPo7e6zFrMpp86NO
         5duw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oczxcm+7nIYhSCAxtv8AlUWabW040X/K7A4VrdDatnY=;
        fh=sxM6TaUTeUtagwPIzbWo7hIM0XKeDeimM1D/WEPTEBM=;
        b=YtT3j0J/TTP5nubwXWYfQSuhNd5KirxexYdmHSepksA5yrYM3rhWcx78sMapBkZTM7
         MoZIeAn8b7VDpwI5TqDDUv5h0gaQfzs+vJuzqqJppoouiAHVwbODT94URLjuwScocGR9
         MNbPE5qGlisx8PrsZYuVuj0VtMAKhUqcqBPwfihzmhXnEXc/OH/lDsnEeiTx7BmSoA6E
         mFgAHUqANpudMG0vIvuDm9RiTpVBdVpE8HXBkhDm31UM8pLmZeroeavSWY2/NImokhsP
         s0MYUTmRmxBoizC7SFTsJP2DW2QY1pGHryYCo41NL/GXHb7jpxIfon4dq5rD20aFxZJ9
         HofQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774316529; x=1774921329; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oczxcm+7nIYhSCAxtv8AlUWabW040X/K7A4VrdDatnY=;
        b=Q8g9H+GEuNGRbUrJ4E2zikhmDqYbkg/TlLM2Z5/gsgDZEvvVnlcAj9IMBlgM5BSP9z
         mxORbzyuy1NocTU6OLVNKuFN0p1u22nFd/b3xlypdu5PCBwkj3qRi7Do9qS/nAySDhcu
         EYidZWq+PGvq9psSl3Ixhbl9W2rFKKPMQpnXkSotq+ejd/29RdtJiQTkACRQWvAPE1lq
         mbzmrzD8PNcvVXyWe5gEaQZtPVsePcZLIq4QcCoAk9ifEnq9L9lGA1DKrYoZqnUDz3G7
         FVumM4Ll4CSrNVuKQJyQqkxjeOO5VIIimzAywPGOhxGiTVm7dp+ZC6p4E3o9CTiHtF8Y
         qk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774316529; x=1774921329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oczxcm+7nIYhSCAxtv8AlUWabW040X/K7A4VrdDatnY=;
        b=NU2MXWAR7sGUQFL4/a2UI3k2QCih8IGUOF+XQ2z8leYiH0olLMDnb0o1ZyD5eWDam0
         rdIeMuy9F7rCjrBHZuGkrPxYSQ6fiZPnG0bVV4vffSTrnym4qWA4AZcGXBN0bfSVbJRT
         3MTnMF63t8gURYkHFXD+GuZVeJJ4XPQZZrXxv+ZPQX4EM4cy8fbtM8ISNCkdtq5pj+fX
         MSD3w8ZrlQPeBkmAmEbJJ4tqYZUh7BvjhENTh9MeEu6R+ImZ7gLG+lfOBUJg7taSjiai
         TxC3Wnrk87yz3tzYMCF6MUj4mHTmKlycH2RLFvRrth/R0+8Zp67vIbB9gssWwnspKn7W
         SAVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtxQnOTBA63Ehvfzl+rEfBuYtGryln4VJTPHxRmrfMPr1ZOonIWEfneZyOsHqZouYR6KTdYhxGzw9osqposZUD@lists.infradead.org
X-Gm-Message-State: AOJu0YwNz7wNGO3ZkYASTXjorvnDQ4BpZo8KZu0Jr5SpqimDwQwvhRd3
	QgLV0Td/3ip7uBJUqJcSP0RmpZBLpkMwDehNRmA6SY1IvsSdWXVmG0G8Sopj4jl+8E6r87rMNPx
	CtZpiN3QKEnNo1nAQaV3yCMVKBeTHaVY=
X-Gm-Gg: ATEYQzzpTrTahmDweU9t6BPoOWc7+F8S3WcBj0wLO/5inGRto8ESwzE869dFT+4g5JC
	xn95xXl3ooBJrNYGaSkQc7yZx8tzI7mUQelQ9XtNwn1NZHFwArlkvmR2Rjg7519TT3JfGo6qSmD
	gAnAIkEGm2cEwkIziFobzykPdKwKaWFczZo9IgmBwsS2ZevywwJ84PX6RuFVan/UHLtXSG15sxz
	s+vmMtGRdP1oGpx9NXtIs2+z+Nszpb4zc+oQKNAT166IU8tQk9L5n9bUtcaudyyKAwfvIeXXOf3
	hW+MLPrUAZffQeDzec5RGRtvWrPQRJzzMZ1Lh5/XVrd/gi4VKJHEACbyoGY=
X-Received: by 2002:a05:6000:25c1:b0:439:b3bb:2777 with SMTP id
 ffacd0b85a97d-43b6423bc5bmr22855250f8f.22.1774316529365; Mon, 23 Mar 2026
 18:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com> <20260316013651.3225328-6-ankur.a.arora@oracle.com>
In-Reply-To: <20260316013651.3225328-6-ankur.a.arora@oracle.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 24 Mar 2026 02:41:32 +0100
X-Gm-Features: AQROBzCFkof4eO3sQ5Mi_04Kqc10_skG3cyZZaVxF4JXZB25lRZil-hxigAR01M
Message-ID: <CAP01T75VaNGk+adULuX3q_8uxc0z78J5B_5ECLy2VR=i7pBi0g@mail.gmail.com>
Subject: Re: [PATCH v10 05/12] arm64: rqspinlock: Remove private copy of smp_cond_load_acquire_timewait()
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	bpf@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org, 
	peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com, 
	harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org, 
	daniel.lezcano@linaro.org, zhenglifeng1@huawei.com, 
	xueshuai@linux.alibaba.com, rdunlap@infradead.org, 
	david.laight.linux@gmail.com, joao.m.martins@oracle.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_184212_141647_1F79678A 
X-CRM114-Status: UNSURE (   8.52  )
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

On Mon, 16 Mar 2026 at 02:37, Ankur Arora <ankur.a.arora@oracle.com> wrote:
>
> In preparation for defining smp_cond_load_acquire_timeout(), remove
> the private copy. Lacking this, the rqspinlock code falls back to using
> smp_cond_load_acquire().

nit: This temporarily breaks bisection (or rather, leaves things
broken until later commits), but I don't care too much.

>
> Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Cc: bpf@vger.kernel.org
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Haris Okanovic <harisokn@amazon.com>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

>  [...]
>

