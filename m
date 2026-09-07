Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60872C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 04:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=; b=DLiX9sN/b8A6Q8KnAXzKeHRoqX
	19Y6TMGlQZFJ52Sa+0mTYXVDhXUbPZ98GYu21AMB0xGjV516P8uUPWF2GquH4kiuLNiyNvEV0M3p/
	DdhovL6pYJkNg+H3PgGPujcJbkTf51OQXtSCu7MVoWwhD9rDy/ODtPJSXOMbTNTYgc3R33nCyjsFh
	u0g7hny/ab/kArSvZEb4hN7jR3szSOpGLzMPkozY5tzpdqXL8de913IBIJSI8lKeOJ5i50dAu2638
	MkYWVeIh5It7EwdFP1ZKyBLoonVn2ka+Drn6GcIvSSXoBDbCKhEoh+nlAL7LP7g473qbljVQJisr6
	rNXIXeVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3R8l-00000005rLS-1Fn7;
	Mon, 07 Sep 2026 04:39:31 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3R8i-00000005rKm-23j5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 04:39:29 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d91518a63fso21887955ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788755967; x=1789360767; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=;
        b=PaVDPraB6M3UofMjk0Gr8GhvxcIuYYNKqPWpi/Z9RGnC4GDFZaNbsvr20+BmVGb1hx
         OW7G0Y/4iClNqNU8ho4tC/OtChayKZ0yC5PlTaO7x211MY5E4LP6amrTjyrWg8bmU+YG
         V2XI1VNwvh7ekavOHBNtcR2RJkr67VCUZLQcGjNpl4DO6KVpHvYp4zLiZs3JaNoN1Bl5
         wVFh9qzSPTy23fbRuPGXl1HHNwELCaN9tpErkh2RBT5LfLi0BYYPJIpsnDf3r45xvrso
         ve955Uavi02kiy+TJg7U7VJ42/oyk9g+f23PSTP7NsIAnYNrB53rcglVdPglvbrhUqq3
         XgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755967; x=1789360767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZVd8AEPtHxGrM09Xmw7u8IpkGldFD91EALn5nG1tdA=;
        b=QKF9lN1/uRMBgbvYZS9fCGwOm4cmavFhyiCR7JouiqRKScZrQHG8hps+TIP1xUMlu/
         guRRvDcLOp3dadk6I56dz/a+FmXBj3EO95JID5b9Vwa3OoGXDD8134Z5OB1K21eztVR7
         uuHdzozgujDL+OwsMkKV7MXovQTi7+dANaWhAAZnRhlzCt6lLjqj1qCvpJbRx2x7wlF0
         t/2TWFKqUDPNzIm3krs5Joen7yJIaYt2X1xqh7ZGaraLAM29aZkWZrFmKur4MmRxpKvx
         dCkPRa1CPUakg22R5iovOpA2qh8P4srOiVsIUsKHVlwiMo5TsqvHPWQqZ5WAAbBtfJaK
         UJdg==
X-Forwarded-Encrypted: i=1; AKwUvBwDiIwSdfdxiepC1FylRpqp0Yuy8an76259z41qCmF00jvr+rMRp2MR19zVY6htFxQhoryI0YjPEklvJ/2u8iA9@lists.infradead.org
X-Gm-Message-State: AFuF++m1LfTZYJMlAAFLPmBvR+GqxusBij95i6yfom+/yp80s4puThB/
	mM36Z0DwVCJIIPdIXyr1/b+nT7vfxW3BpEM7a5R5gOau3AcP5WB1diZ/FOzHDIKoCKg=
X-Gm-Gg: AYBFou1Qz/MSI0eP+7BbanbgkalD+X8he43D5RUlULz+PwMTHHwe3hH/hfsl7JpaEpa
	MsivhuS47RwTt/FFxCvmZH6VWrUgZAOVa+W48XuRNYA10unhgjL7tueOxTgD+4NS+MX0fWBWwTX
	jIf13m6nSWBNcegxG07/IlWfx+KNOe+4BWpg35o9FDAsRJtcqqwDgBytNrEL5ExSWsoEY/ebPk+
	NiAQb6bSP320V48D6EDr2gVWRnC5kHDzLQlbvbgoXJrW8kMF7hpI4bsbcXz3+jqJMuz43qCku2j
	1MCQEPqdjFfwIHrnNnj39Su9ih/LVE2QPundEiK/Jr87BpJJY+TeMKug2lnSZc4d01ArdZl+RMm
	/4E8kiWdq0/8DYG+UDZxYHxai6gaK8M/7zFrUcBxi6YALh3sT2I/ZF67RN3/F5PfCcJvxsFSQJl
	YIs2a0ArCKNx5kSlI9/LJxRs7gA94u+QtSd41vWN7uAk3iQWZAbChNKsNI4ppkBEE=
X-Received: by 2002:a17:903:37c8:b0:2d9:50:a91b with SMTP id d9443c01a7336-2db12667eeemr299920485ad.16.1788755966732;
        Sun, 06 Sep 2026 21:39:26 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm26643998eec.2.2026.09.06.21.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:25 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:09:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com, talel@amazon.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	mmayer@broadcom.com, sumitg@nvidia.com, krzk@kernel.org,
	peter.griffin@linaro.org, myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, sven@kernel.org,
	j@jannau.net, marcan@marcan.st, casey.connolly@linaro.org,
	sre@kernel.org, wens@kernel.org, t.schramm@manjaro.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] cpufreq: Use %pe to print error pointers symbolically
Message-ID: <ap4_-12ta7ThxEjc@vireshk-B250M-D3H>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
 <20260906061755.5103-4-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906061755.5103-4-sumeet4linux@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_213928_537621_BE967CE0 
X-CRM114-Status: GOOD (  10.87  )
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

On 06-09-26, 11:47, Sumeet Pawnikar wrote:
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_err() and pr_warn(). The %pe format specifier prints a symbolic error
> name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
> falls back gracefully and prints the raw integer value. This makes messages
> more readable without any functional change.
> 
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/cpufreq/bmips-cpufreq.c   | 4 ++--
>  drivers/cpufreq/cppc_cpufreq.c    | 4 ++--
>  drivers/cpufreq/qoriq-cpufreq.c   | 4 ++--
>  drivers/cpufreq/s3c64xx-cpufreq.c | 5 ++---
>  4 files changed, 8 insertions(+), 9 deletions(-)

Applied. Thanks.

-- 
viresh

