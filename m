Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F00C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 14:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPytIAR32acMc1Jy5NAX4zaoua0Um2xWn2RghqT1VbM=; b=D4mbI2tfiQJ+x5pWVw69muK2cu
	OO5m+iWAJ8nUhOl4sMmBIDfJzgZ573G842EJ3mpKSKssKJWYJlvVtxWcMYzEa4JQjJUJEH/AicIRe
	98azk5byOeqO4Be0zVs2ThjOV7MBeAZK6XbhxEcGq48fYryNsavQmYjrtmYqFPPRr97bbj7v1nvDz
	z+XqD+UqyGohqeZGaV5q39zKGMkUQKKxCBFpEzhqBRxGYBdrWIxg4AacVkOLONWVYEP+u/MGfdBNd
	EckWSp+YRY8YMTLX3JAPS/vUHQcMllN+xiw2pjxpe+kN9BlvSBaKI2TFfK1uQn2XuM3rxiAUtrLTJ
	EcAeiXIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W7S-00000007OlL-2qsB;
	Wed, 09 Apr 2025 14:09:34 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VFt-00000007Fdl-2ogZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 13:14:15 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6fed0620395so66208237b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744204453; x=1744809253; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OPytIAR32acMc1Jy5NAX4zaoua0Um2xWn2RghqT1VbM=;
        b=qiSeIpOuQ8XfeYMLzFx+p8seSNm5Wblzcvu4OdB4vqyilwqY3UeyrmBQ91ygFXVGMK
         3Kv0CCmlstIA5tZinyh5BxId7fqACj9DH+Obmeo6GangGWhFmqUiWiy9SaRr4tLUkM3X
         sPG4/XFllTv6BnewBKibExbRMmYVrSyrsclHubNlx6U2YSO0Drv0WKrJn3oJXE5EhOcX
         Gtr9n47/YL+XEwUaix2vp0CwQ4PXKlTf2OrQSTG04LUnZ1I6crmu3jcYSzKB7itul9Nt
         yL6eZeTaf1+ghyG/+yuvbOoRK0Wd1Pup5An6LEj3ktXKGDZoECbxjpoBiS3/TF/94FG0
         PsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744204453; x=1744809253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPytIAR32acMc1Jy5NAX4zaoua0Um2xWn2RghqT1VbM=;
        b=HgFz6cXiGGKQOvv8no9B6zmxw4A4ZNFjrOdRXkaP5kouwmNQXzxiOyxSmJoRYMTREJ
         x7u98URZ2cL/+4/9ggoLuRQ0Mdj8Y43fSZQPmsAIc2QDvGpN4w1RhXVzTIwrr429pL/q
         vTkTu8gFnKWXOcMgiLsnzn2mJgqvjsOr29Mh4ZcwRPisFsBYBiJwxs1OMTdWDXJdNkIz
         AhHy81a0TtkUDC7+mVazJ++P3sxDfmrvhe4niFJlxfducOH3BQrPCbpaYCy9+Lomuysd
         nGYZxat12qmLdO0RgtHw+C7zW+ax//4EpeUXwX8AyAHJqO8T6sP5+uk7kJsQqrhr2KO1
         YFxg==
X-Forwarded-Encrypted: i=1; AJvYcCX6AFvtQDH5cwM43z+xD/X6SitQ04s63ncxu5Ed3qqZrPruiR+ppBTb4ZgYGYmwqEzZ9p8yeTmmTGshvS4u4pF/@lists.infradead.org
X-Gm-Message-State: AOJu0YyWhozvrgevF3eWqKJkFrvkZJEqZzYvcRs5GaoSfcpdbu1vnqTM
	3tFDTZkF4IJi1IvmeecWyeYR7ZUlj7E5kmkvjnYFUh+lSIRlHdEnQPywIhh0+h2rPU0Cp2BGd8n
	fWjj1ed9QRV5/lJmgmRP9jtareY1SMVG7zIL6nWGxQ2kdZt+6
X-Gm-Gg: ASbGncvKG7JKvy6aiqsumE/sYh+Y/QB8zbZ/n9a13IkPInsQr3l9Y35lAT0T7DxBGFW
	pwN8wDsMpv9NbioAfVrXBVO2i3sI/GE04pm8aqqfzODujeIXrbyGazAqV2b0v3XlDOhyAgeHCAj
	meDORNWJM8Mu/RmA7NPyyIgag=
X-Google-Smtp-Source: AGHT+IHEapgN4KpAu2PH+cMh+2Gzlwfzy4KLVKnXkondFCagfktuVPm3ZUGmWpdWktkF6zuY6BhY5v5enEDZADi0x7Q=
X-Received: by 2002:a05:690c:4a04:b0:703:b606:738f with SMTP id
 00721157ae682-70538813013mr54886587b3.9.1744204452852; Wed, 09 Apr 2025
 06:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Apr 2025 15:13:37 +0200
X-Gm-Features: ATxdqUHSGpiXGAwgK7msekj1T4YSrnCc2mkntlahkz6x0Wt2J4BgD7Yq4ISR4rI
Message-ID: <CAPDyKFrR7S23hCbEpwSj93f3ZczkbQAMgpJo1NNsK4bpMr-qnw@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: mtk-sd: Cleanups for register R/W
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, axe.yang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061413_710791_61C9D688 
X-CRM114-Status: GOOD (  14.51  )
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

On Tue, 25 Mar 2025 at 12:07, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This series adds missing register field definitions for the MSDC patch
> bit registers and aggregates various register writes into just one,
> greatly lowering the amount of register reads and writes especially
> during the controller initialization phase, other than the tuning
> phases and set_ios for mclk setting.
>
> While this will have a performance gain, that is completely ignorable,
> hence this series' only focus is a cleanup and an improvement in the
> readability of the register settings (as those now have actual names,
> some documenting, and no magic numbers around).
>
> This series brings no functional differences.
>
> AngeloGioacchino Del Regno (4):
>   mmc: mtk-sd: Clarify patch bit register initialization and layout
>   mmc: mtk-sd: Aggregate writes for MSDC_PATCH_BIT1/2 setup
>   mmc: mtk-sd: Do single write in function msdc_new_tx_setting
>   mmc: mtk-sd: Aggregate R/W for top_base iospace case where possible
>
>  drivers/mmc/host/mtk-sd.c | 207 ++++++++++++++++++++++++--------------
>  1 file changed, 132 insertions(+), 75 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe

