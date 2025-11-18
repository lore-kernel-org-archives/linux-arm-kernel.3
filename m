Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B748CEDDA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 15:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sa6na3P/P/GNM8Iujs64ZSVR7QHzowjsSYVDRpzcN3E=; b=Bnur4iPuI3hcgyuR6tp2x/Mf3/
	RH9o++UhZRhgBY7+1WaN1jy5M4BfEdMOcTco0Ci16TIyu6W+mlGoLnnQWL3bzFo9ETgK1tC3akmbm
	PF12S90T1jEzi1Q2KC160WVagB1A6UxdQ9d3vUQOQSTm01FJwRrmbwdk8YzqJtwAP7cI4p60MCeRO
	fadNWThL7m2ZRRG4fDUd7UWNfYxo650oIsqwlUzJEK/JLQ++dMK50DMqVDb6j+FSEXtVtHs7svKvb
	YylnmO6x4FZZpsnDS0o6m/8m5JyT9nIrJlyM3bWQ3IlBtdRfsAV3Pdi0Dm97TyDf9DGj+KNAG4TLu
	GAc+wcGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNgd-00000000dAG-1vsB;
	Tue, 18 Nov 2025 15:32:07 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNga-00000000d9U-31zG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 15:32:05 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-7895017c722so23338967b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 07:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763479923; x=1764084723; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sa6na3P/P/GNM8Iujs64ZSVR7QHzowjsSYVDRpzcN3E=;
        b=SILUHtTs6VAaYhTEzWMMK8Sz7gNoNUfz3rVpjEllga4N+c2x9sPkkuUMTGk6ycpDiQ
         au0GLCwe2uizcJetftcw1ICNoo072qxn6VU3+br4eznrgEu3E4+rkENQJes1rX3bL8z2
         UfZi7GYz5ejbZRosMv44f2M08De1ZLbqO9UenGFkQJYFNTb2xrglsOBjnW/0TuYKkQUA
         6QeO5815EPLItuYrqsnoIn9tTF0vcqZEt1yCnwXvClohjnQYL0abx1VQ3BVVnZuxwa3O
         1zksuUIV0VF2vF6agqJgG/pN0js6zTFMnaeEGFvWr8q0yx+k5z59EbbjghrgOnEx5gVj
         MQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763479923; x=1764084723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa6na3P/P/GNM8Iujs64ZSVR7QHzowjsSYVDRpzcN3E=;
        b=nZfuHw+9t0eEsBJniT9jmHEnAqdqTsAzOVtsKjq80d4NILzz14BNdOB13jvxXOmwcm
         mjZWzeXjwxr5E0sFL8qBEw+BEg58kUtzhb5grwgU1jvmnI4hkr3DNgkw99872wGTiLTb
         Dj6OlttU251eHiGXcPjKKBep/xberLNA8W8xzk3P9bdczd9B/H8AcWzNNd6++EZEfCe+
         QJ/04wFBS/S9ZIYwYmCKvJLoNF22uGunrIxhyRdLT8m8/7RaNObu7xAJ4DWc8b4BEUuw
         44rTyq8hKywG4O7QBsnsq+UTTSKZEpIbNMp17RRS5DBkvJAvBVltIlsxAqYNRqRHgcaU
         0ucg==
X-Forwarded-Encrypted: i=1; AJvYcCX79ztb55LoLrC2G4tcVwXDlfv4FAMmMG6G/gJ1ZM1Q98yCehda1G+zTPyPQ2KJI/Kt05WECyFkaSjREgXwukrV@lists.infradead.org
X-Gm-Message-State: AOJu0YzBKg7MVtPUzZsDMdm23rQzvguINEH+rDKUzq32kPAU9aAzc03r
	9KA8J6GtD+BoZN0Y0IolrEi//ophQJ6DqdYm62hndmxFQAbeXFFl4Q/cYAbb86wAin/j4btmpSt
	x6+UCxz4tJ1tMWjMIV9ot3fjQ+2cGiji/0/rQbni84g==
X-Gm-Gg: ASbGncvQcWaMhZ7qUN7p+9uGD4N9uZRezjPQPhnCoFg+bWj5sOf761A9+O6c6Hq+56d
	Hpd59Hbcz5DOcm8x3kLmsFUfUpBmeDtu/L584pTNj7F1rav7x011D298De9wbIUcJ8bL3PJAJS+
	A3DGBEra4pUozWuczU2gkD5qtVIKzcSGDbxp0SLDJfr/hieDPsa2wt6QvAMjoDpvR4+KTPFT40Q
	Zh9MCfE6Na03oiEPaxVDlRZkBLTp+OlAQtO+EzINJRO7evj+NqF5H3CV5Wl3GgPkT0zNL7rFv79
	btPR9V8=
X-Google-Smtp-Source: AGHT+IEfuIFqkRCXfZDQ1m2D7snzbjj18Mf6UeMcI+k5jw5cpI8JySnnaOmrmzg5DmorahHQyDmg0Mg7N8R6Vf/3bcQ=
X-Received: by 2002:a05:690c:4b09:b0:786:56ec:e3cf with SMTP id
 00721157ae682-78929f13f18mr148209687b3.61.1763479923209; Tue, 18 Nov 2025
 07:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 16:31:27 +0100
X-Gm-Features: AWmQ_bnsDQPC1FPCE55p78otrm27YbzfdllVOUQUin0JOvD-o9IddmtmqNNalEc
Message-ID: <CAPDyKFqF+yh0X6f5YZ0yePGqCpPWQOauQTZaeE88Fgv2HAxv-g@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] mmc: meson-mx-sdio: Various driver improvements
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_073204_797266_674757CF 
X-CRM114-Status: GOOD (  15.15  )
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

On Sun, 9 Nov 2025 at 00:13, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> This series contains patches to improve / simplify the code of the
> meson-mx-sdio driver by:
> - using regmap for simplifying register access (patch 1)
> - switching to modern clock functions/helpers (patches 2, 3) and
>   make the clock code not interfere when switching to
>   devm_mmc_alloc_host() (patch 3)
> - making use of the devm_mmc_alloc_host (patch 4)
> - using modern dev_err_probe() for better error handling (patch 5)
> - indentation fix (patch 6)
> - ignoring disabled mmc-slot device-tree nodes to allow describing
>   all slots in device-tree, even though the driver only uses the
>   first enabled slot (patch 7)
>
>
> Binbin Zhou (1):
>   mmc: meson-mx-sdio: Use devm_mmc_alloc_host() helper
>
> Martin Blumenstingl (6):
>   mmc: meson-mx-sdio: Switch to regmap for register access
>   mmc: meson-mx-sdio: Use devm_clk_get_enabled()
>   mmc: meson-mx-sdio: Refactor internal clock initialization
>   mmc: meson-mx-sdio: Use dev_err_probe() where appropriate
>   mmc: meson-mx-sdio: Fix indentation in meson_mx_mmc_irq_thread()
>   mmc: meson-mx-sdio: Ignore disabled "mmc-slot" child-nodes
>
>  drivers/mmc/host/Kconfig         |   1 +
>  drivers/mmc/host/meson-mx-sdio.c | 339 +++++++++++++++----------------
>  2 files changed, 170 insertions(+), 170 deletions(-)
>
> --
> 2.51.2
>

The series applied for next, thanks!

Kind regards
Uffe

