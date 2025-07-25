Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1787BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nk/4Kezo0VhjUc+1VwBBR6iAeqx6TFxLUBENU2vrQBA=; b=nACTd2ouoL3ydSQ6b3Cy5ykUMH
	r+QxI1Xj7eTBWt1ls80OQhTf9pU30VXhjddihp5hqQPAPazGk1ZofU+C+ixpG4RLmNiY8hmjvheGa
	JVRso8Rrf9YHXEFBJSAeCaSlndOrUA15ET37N6EvKBDqc3DHEy3O0Jsbgj5Em+0RMFFGnMs5Y/7/h
	/iwtZ5QMKxT1VBgp7IurEhgurNpOt+jznqZuRgn1+tvmnx4yDa168oBwAui8RGpiIR07Ojf4oXWER
	1ymUA3qQu6g+2kX3Hj+4vgfWFkhPUviYGhBTFvrLpfLzrtNlM0se2kEW4cEEpW6VrOQDDHdqDqE+e
	YF2F3w8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKUx-0000000A7Wh-2paZ;
	Fri, 25 Jul 2025 15:38:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKSU-0000000A7Ob-258g
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Jul 2025 15:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Nk/4Kezo0VhjUc+1VwBBR6iAeqx6TFxLUBENU2vrQBA=; b=eSt3q5Utb2ZxmuGyNE6ozAlAdA
	y8PL2mpJRxbGVqGYbqEzrdj55fvPMmfbnO8UyVg+1Bt0k7esfJofS3z2aKwcbrTnDuUKOLXarqjvA
	bel+waJeYtQdEfaG0FtAMBgyZ2nni1Gy+mKvxc/ljHT2QGJY3lQ6m+gIwd2YWL+r3msAvgKt+Bbzm
	yFiSDVKTKbm1pTfFeOXeLlPrdMIW/WE6pbuB7GEAo5gzufBkdvu9WXN3YUNpm+h7NgxcxmvniqysP
	TsM3Dx7x+vfsUPRKDdRsqDcQ6RG97jA+RC6aabU2LB1P8EeNFyn2lwItzyB3epDB+53XlsuQyWPe4
	Eku8+CfQ==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufKSR-0000000BrD1-22eX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 15:35:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-313bb9b2f5bso2045883a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753457737; x=1754062537; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nk/4Kezo0VhjUc+1VwBBR6iAeqx6TFxLUBENU2vrQBA=;
        b=fvZaxdMBfwemaGbpcLkG55WjJITihq2mSS/dV14UiDd0K14ExhEVU3BR82NZJaOpsq
         qbODmkYK9carbb4meGIDt3st9Y72F0+2Sr5ODksq9tGuuA3upH17NjVOeNAE+6JA8TOt
         rmNCAUhv2FUtApOwOvmaI2J6h/BIhP7v4lBbwjIBOGk6w/2Xt7Ns/uzw0ls4XSLqb25A
         gU6QD0xUCTYALp7mKYYVg/ckgtS9h01rVOfOYHhT5JC4Uaf2sYMqJ7PfpnnJaaTn8p/z
         sN4jQpGf/BlOxC2p6cGregUpv3SHR0M1c5Gyn8gFn+W9lAJv/g+UtjFJxb7s2pKF+zMx
         MMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753457737; x=1754062537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nk/4Kezo0VhjUc+1VwBBR6iAeqx6TFxLUBENU2vrQBA=;
        b=UtWfN6RtZnDLsYn47kxAEqxujgkzvguQ0vTr0UM9dRhI5FnUOdVpyAD/05sxaEWKeI
         c+ArV6P0tXVYU9drwq2iQyS+4SzfK4Wnc4yElYkWv+Z+7CYYND6VFijQSB/0aWioYrsM
         rlKVvpIzG1rYBQon8feQJy/FE/20bogpXjJ0a98kCv4FxheIRTnBW3oWbVdHX6PBg484
         HVPRx9qhdZJaE9tb5VIWkCHHQobT7KZuKhzERJ/rvrWEjCaU1yg64BZxt4lmpQYULncn
         Zb0Kfm9W1q4dYDNCmB69KSpQ+I2IBw8CfA7hSLjmGdbUmSNNKew8e0HllpnQ0b9Q1lF0
         cZVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHCKhma753AHisw0mauH3acZmj3P1cvvK8IUsLwnrZ/LuS38diu7gEqHsUS1C3CeSgfdqbkCwFt77/S7PQeaLS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4CG30KwR44iVdBr2ek80jHJWW7l/fmNnJ6d74/5QcS8/V3Gfq
	YIfYlJXqi6LgDzLsEaHB9XOG17r2a9nF0iLCaKLWwIk0RZDwLigQ4II/
X-Gm-Gg: ASbGnct/Y1aFmQlQTx6Pzs9rrpMRBhK+93zkXxLFAimZg1SHw4UmnGbV6F8LydLM/xX
	j1Dv8HPVzuCSEaNWTGGbbPGtTucyMdJhnkp+GxROO6bs9laROjzqVKCy82W8YOM9oQigONXs219
	7sr8jD0mDFnaTVcG0B10SLbXV3CLLbqX2Kca4SS3W85VuhEtr4a2tyEIrQadGmxH4eHreOgroba
	2rrfK9w+RXXH2pl864ouURgtok9RV6oHT0LznGXUycZc2TKVJ0yTaiiW6mpTIZIoQSDp0Pqg6Po
	q6DltOD4mtfuCsuPQSgUplSf/JaasNCFS5Gb3Yx0dyfD7s3NBhNm8OOzrlxUzyW0u78+oqCnGI/
	7DSpbpkUVV9WEQ85LdFUpEA==
X-Google-Smtp-Source: AGHT+IGA0cG23R/PV0mw3LDx6GRbWc3e50pWW1kDUupFgJn9GdN+u8pGDk/hv6p6XEa1GLMUY2uYUg==
X-Received: by 2002:a17:90b:3d4e:b0:311:ff18:b83e with SMTP id 98e67ed59e1d1-31e77857876mr3896921a91.9.1753457736696;
        Fri, 25 Jul 2025 08:35:36 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e6e3b7e0dsm2400980a91.12.2025.07.25.08.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:35:35 -0700 (PDT)
Date: Fri, 25 Jul 2025 11:35:32 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ste_dma40: simplify d40_handle_interrupt()
Message-ID: <aIOkRHs2bCVk28V0@yury>
References: <20250720022129.437094-1-yury.norov@gmail.com>
 <aIDRpSN0z3Ri1Fkh@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIDRpSN0z3Ri1Fkh@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_163539_730330_4B433A1D 
X-CRM114-Status: UNSURE (   9.10  )
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

On Wed, Jul 23, 2025 at 05:42:21PM +0530, Vinod Koul wrote:
> On 19-07-25, 22:21, Yury Norov wrote:
> > From: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> 
> What is the meaning of NVIDIA in your name?

My employer.
 
> Pls add the subsystem name to the patch as well (this and others you
> sent)

OK

