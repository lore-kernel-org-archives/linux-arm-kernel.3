Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC59C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 22:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHn8oZ0zecHgsYzvQ4c7hdnvmHb/ysPai90QswJYPfw=; b=i0cECJiPe0pIcBS4MIMim0jGxS
	SuSnGGbDu2XCijnqmCOYPFCjtVecSUpHOftbPgLo2A0kQg7+oDoTTuZI82poqidoDo1fRuQU/dEiA
	41l0PKY+oXOAwzHVRVIJPOMBauqn9KaWrS8e1/7UMSwDGQ3PqD9AyWZyN/jHs0Vz+3/hTYe1iLKBA
	aRvbAK1MD+/tKMwmz6Op3NDtWCTFWrTfM1ACLj/IhYsZMyhg5Gh2kOfWi+ciPgPq9O1hWde2u2Kyg
	unWU4jiqSINwVlR7/QSiD3VPk9YHn/u8yxAE95rmHewSv3nZ2UlgsADU6hl7KIcW0IqZq8T2yDsZ0
	O0dLqq9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtBoV-0000000An2d-3fCu;
	Sun, 09 Aug 2026 22:16:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtBoQ-0000000An1d-3nYk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 22:16:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 47D1543793
	for <linux-arm-kernel@lists.infradead.org>; Sun,  9 Aug 2026 22:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2811F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Sun,  9 Aug 2026 22:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786313770;
	bh=IHn8oZ0zecHgsYzvQ4c7hdnvmHb/ysPai90QswJYPfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TjUZX9lc2KGpRuLZ00Xm8ZVQ+BcX6tOcklCDT97NH+mp5mKoKufznyAXWs2jPPCNQ
	 FLy6+7pwAZmsPdbxYsubQLTHKCZJsff2Lqrr6kGZakTKhGL98EDoqCtEmuNjqiJwAe
	 ipA+lR/xyBSGMso16aSHQyrXSVjWkKsx0ZLN5kNaZXaOgNQUt84GY1Guq7xSD03ekC
	 ni5KzVF8wd618k4POpKKcWg6OZ6jnojOpDVdirQKGsRzYhgOB1yPT6jxG5J/BbBJaG
	 XacCKiI/AzhLsm2f4/JPDA7qnE3qoeyid6cV+oxyfNYwTzbpJL/Pg8ggNKxuRQFXUp
	 dvF8razTMYFvA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so1297446e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 15:16:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrhQ2cp4EybWQ8ETGZlXKNR74ZMSS1vKArp/Fmnfyf+9RYBXA+uHpXNQAC3Eui/eGVoUDcGL6Ehs2WUW3ltLQE8@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd+9naqhk40gy1Y+OF06dsGvMQhzOe06vgBhBIegQj+Q0Q7qP/
	waXNQlPuTvn4u0jR1gvIs2U+aq4pW1ejZTHWio4ev9lacInX/2VXyFLy1N0SonG6UEC7bWV+KUU
	JqcZqWTossopDXy8w7b5erXi1uejI0z8=
X-Received: by 2002:a05:6512:304a:b0:5b0:eda:de2d with SMTP id
 2adb3069b0e04-5b30b73cec6mr2290080e87.19.1786313768907; Sun, 09 Aug 2026
 15:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260808105657.2762974-1-lgs201920130244@gmail.com>
In-Reply-To: <20260808105657.2762974-1-lgs201920130244@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 00:15:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLnAr8jcnqrFe+h5tjw_TJSuXChSS8PMd8WX5LAO5Q5PNA@mail.gmail.com>
X-Gm-Features: AUfX_mxw6Et_ErCVG0q1-Y3BIuXJcHPuyvd84V3ZxvHfMVsEVCyxxMfdkHrG8m4
Message-ID: <CAD++jLnAr8jcnqrFe+h5tjw_TJSuXChSS8PMd8WX5LAO5Q5PNA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: fix autosuspend cleanup on probe failure
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Srinidh Kasagar <srinidhi.kasagar@stericsson.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dan Williams <djbw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Aug 8, 2026 at 12:57=E2=80=AFPM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:

> d40_probe() calls pm_runtime_use_autosuspend(), but its error path does
> not call the matching pm_runtime_dont_use_autosuspend() before
> disabling runtime PM.
>
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during cleanup, this reference is not dropped and usage_count remains
> unbalanced.
>
> Add the missing pm_runtime_dont_use_autosuspend() call to the probe
> failure path before disabling runtime PM.
>
> This issue was found by manual code inspection.
>
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3"=
)
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

