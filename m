Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2995ED7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIEJcaSGdJPUD8j5XlztkJ0eGqAbM3m0e+k9lVXSNJw=; b=x02vJNpNG8S4kpMbZERWDONE6i
	8dsI4jnoZf69ciUbzemAoT/aWcTNS6iQUIW/m9eWyepsnTvelO6o/QkfO6i4L9YDqPOjJheJMRpHg
	SXFlEaZg6Vh1vr/2eubakJFojmJhl5uzdiamSMzeLIQJx9wtqz1BCtHAfnuZ+c/8xc7683BK/A5NZ
	blRbvJnKoomJ0RzE+UATSNnqdGv4KKly5jgHjng/UHKGxZ3/52rBntVpsNWkm6OjXSZTYVh2h1cem
	RaxMDg+sKbpOL8aux9M7k3EnJrw3ufyqfuyaVHD/z3pxAJUvznrcWnmHNc5iIfWgPBFmXLH3NShPy
	G+ELfq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8KN-00000006eNp-2bgk;
	Mon, 02 Dec 2024 15:27:11 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Hf-00000006dnD-0LxH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:24:24 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e38938a55e7so3535411276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733153062; x=1733757862; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FIEJcaSGdJPUD8j5XlztkJ0eGqAbM3m0e+k9lVXSNJw=;
        b=H35tgsBKeRxuarT6BYtg4Mmd1wDCo1iFXUoW8PwLaCRhLz2oB9Uvcid8ETG5U6c7r1
         20dudTWg2hadcqfubYMXQ5InDADS6fKxK7JWt5xYtW8Qe95kf1pWQ0IvO39la0LhxT2v
         NdLreOc3irFNEDd0QDPjHW2mswwbrcndkc7OR9Yjccg+HcFp6WZroczlqdSNc6cbr/nG
         SA91IcrrWlsmX+mH2WtRfthCk/hOE/AGpkOygWivP3SuqDpDmJt5Ifzhp4Fi5Aiyy9FJ
         bn4hnWO8OPGIVoZzKVJMZoGdIa627du/iUXDff+o8IFZP5v2SDTfoKAp+wRt2HSg5i3I
         Ce+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153062; x=1733757862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FIEJcaSGdJPUD8j5XlztkJ0eGqAbM3m0e+k9lVXSNJw=;
        b=Z77DyYyRNjRb8gUO1WxxioKuetzfMg11a8c+8QxAgyCWBZnRiCszKQCNN0g/iJLxsC
         /zY86IBS9774TL7A/m7IAi2r1g48mWyd1TynXUOBa3z1rgNRlHV3UJCmdp99okp91mi7
         CcwGShep7tAQtF0RqpNodsJ63DeLyQLvuRzVmXQsSPTQncQmZavXEo/eU4z5D0A2P1wj
         hipPt7kZiaa7AnY3oCcJuUlK8ORY/7dZnFm/YauSYJR309vqoe/f/MdFwwa8hGEtqQUk
         loIk+3xCZo8IHa3tQg+/NTCVRN1R0sDZNuJX2FkG8qh5b2nKKVHFrANNPijGJcIMY5pH
         Jjfw==
X-Forwarded-Encrypted: i=1; AJvYcCWWkKKHxp5xhgFzsOV/J+m1M5K0euFslQbMxsqw3PrLQxbKoofAcKSrBvpeINXYE9qbj2M73SNh5ee6PvEGAxfr@lists.infradead.org
X-Gm-Message-State: AOJu0YyM9sYHMHgBVYz9zFo0LLLuqESc/YDNTif6Szxjp16T6PmvNU19
	/nHe35VNPet6yl68sGrPgy6tyu8hHDC4E1genkyxgexa4KLEZip6dmedGVhvrrXgBDf3ZqEVTwz
	0fDPCaelAIK+wbH3Z2BZDequK3kooBq7UTaEXpw==
X-Gm-Gg: ASbGncuaoM8qcdET88rqcZ5oLnZlrORDP9Gx0a01zgHl2g5uG1Nya1KUohvFGwplBnq
	w1nCrn9Mtk74+FuPk9/NQNQhjzmuAQcg6
X-Google-Smtp-Source: AGHT+IGecYwU3LhrUSWFanjb/IVeaGfWBi0iqpClqfJtpXMYSm61w6LopRzGpgTzgxbggBLwJS3eaTaanLLSHlemPmE=
X-Received: by 2002:a05:6902:18c6:b0:e33:1c36:6a4 with SMTP id
 3f1490d57ef6-e395b887349mr19416613276.3.1733153062390; Mon, 02 Dec 2024
 07:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20241126125041.16071-1-andy-ld.lu@mediatek.com>
In-Reply-To: <20241126125041.16071-1-andy-ld.lu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 16:23:46 +0100
Message-ID: <CAPDyKFpSQj295wZf=mOPmSaLZvi769EdgFTcPJ6QRY0sOHA89w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add mtk-sd support for ignoring cmd response CRC
To: Andy-ld Lu <andy-ld.lu@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	avri.altman@wdc.com, adrian.hunter@intel.com, wenbin.mei@mediatek.com, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_072423_120484_F62BB365 
X-CRM114-Status: GOOD (  17.24  )
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

On Tue, 26 Nov 2024 at 13:50, Andy-ld Lu <andy-ld.lu@mediatek.com> wrote:
>
> Add the process flow in the host driver to handle the R1B cmd response
> type with ignoring CRC, which comes from mmc_cqe_recovery() in the mmc
> core. Additionally, the response type 'MMC_RSP_R1B_NO_CRC' is introduced
> to simplify code.
>
> ---
> Changes in v2:
> - Change mmc_cqe_recovery() to use MMC_RSP_R1B_NO_CRC response type.
> - Remove MMC_RSP_R1_NO_CRC in the host driver after it is dropped.
>
> Link to v1:
> https://patchwork.kernel.org/patch/13883787
>
> ---
> Andy-ld Lu (2):
>   mmc: core: Introduce the MMC_RSP_R1B_NO_CRC response
>   mmc: mtk-sd: Add support for ignoring cmd response CRC
>
>  drivers/mmc/core/core.c   | 6 ++----
>  drivers/mmc/host/mtk-sd.c | 6 ++++--
>  include/linux/mmc/core.h  | 2 ++
>  3 files changed, 8 insertions(+), 6 deletions(-)
>
> --
> 2.46.0
>

The series applied for next, thanks!

Kind regards
Uffe

