Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF79C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqwsD7WCcNuEv2WTK4iZPHlU9QaOgxXWeL2peqyTOEE=; b=IkbDw91SRi8HqicZmgoRHxiDc+
	wkjayvjNt0fOGIxaTQLOcEq55JdRxceN9d8sUCamE+Ca7Zvr+08kGdax8UcvoUP5uNL2IBrzTX6cI
	EKYOjetHopg/nELlq1wvQqSD/JRed4tBpa+0kF9R5V1+lHnRctZygc0DObUtBlW3ozS7WuqPyu9t8
	GLPzKeGJMvt6WJ0+IoNsMDGl587KZOJFi9QCPgpIjXMhjYDSFUfCZmj+Yp+McNiNwmn7OOF6epWeO
	7n22RBucUgcBLkLeJcuGRp8L7cKp5sIoH0rpSC9mJAg6q6tHhf0JSUzEyct1IYk/fpJQs6NkSOi0K
	HA3meDIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCYN-0000000FHzq-2zfM;
	Wed, 14 May 2025 13:53:47 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFADM-0000000EsmY-0YKx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 11:23:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so69779945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747221834; x=1747826634; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PqwsD7WCcNuEv2WTK4iZPHlU9QaOgxXWeL2peqyTOEE=;
        b=oA8mbiKy3knMPbkMoXAEHIoAzVDoOld5kzTEE8IVJjIVbK+gy66+53M1t9/XTNu2Cw
         gqlQPJeGkrROwJd/93FswHykuoMgn0VJVgm30X1Ol59etjCq4l+GB2eh7HqVLTmqZHi+
         QqzGjk08Mrqdb8P//ZBIOk4gb7Eg85JQe0R7vUqD37f1TqzZ7R7oow2SxfBTb8MpJkWb
         b48ZVZapkMV0qPYFyLtjMTRnIWLV3CuVxcbuYgIodn7SiSX0Ho3lXwNZSbw821bnn+0X
         +0EPFioqhXLT07mYI3r5ulxOxI9DrwG9BW/9yBpR63LrjU6bfxnAFCH1Xawe4BMkXx0H
         kbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747221834; x=1747826634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqwsD7WCcNuEv2WTK4iZPHlU9QaOgxXWeL2peqyTOEE=;
        b=cGEz0JS0CPZFnQ/lTOrdAQgpoMRixNMDTEyBQQaUVXoY3hx4GcuSz9HSNstSWBGtcR
         XHPbAmHN/asE1seiBB3Zbos6Dkj6qZAGste9Ib/vuGot/s4/EoUvCTIiYMHdhUOjumZH
         iUARLecHaVVyrpfglQPjsx5f+2g4mn9OTZQfbsWb25gYKLyLycHT/7qlO+uQy6g0aR4n
         Z9HiicAmObfZdtuNuNlo6WWZPLioVIvGH4r7m21bi26wp650Uz5U47Hu7xzOW/Ai/2NS
         A8uyJWuCN7kqqviJUOwOP9NBWMUy3pkZ02/f1Q6IcadwV7+djtU2wwgc8tkVg8hEJXDT
         TmiA==
X-Forwarded-Encrypted: i=1; AJvYcCX5Gjq759AEJORLaespBeLx4TaQv+ISo/8wmrtug5JnI2jaoRnnX7k40zjrjnWJv6n4keGjQK3hNsOsuymGctmd@lists.infradead.org
X-Gm-Message-State: AOJu0YwKnIQSVW2zs5A+Ec6M8HtdIQFNoG5hJOiSRfdo1tyg97BDttMd
	Jm+zZv9IyDZIoioci5oGKF/PfsdLaPgw7N5SMDCjwZ47QJkRiqqeQ2Z6s3IyXuw=
X-Gm-Gg: ASbGnctyYmFz/ZRrcf1oEe77BdRT+OkQepNlRSfd4ugbYHl395yASYQYpqTOEqmlnI9
	wfYHb/Ybw/g03S9XVmjN0nCTujPXm7fKHbmYEOfxlNBLcyLv/w4gc1104NnAIHOeOKD+3Tx4Kmh
	5hyq240jo2FP2f/lCgHaVdP78SAc83NRpLx/PiOaJJSCbZATcfyU0FANPKBDLMoZQwVrS3D8WIv
	BNV/DTbbAJRiimPae1t8PR7wo5QMoMhFaMkiQJJS9oU2jrE4j98wgVhsRAZzmRNsdeiaTMlmcP6
	/4Mx/+AWAShykdF36QT+nyQVG8VlYxMeycEXUA/peQlh5EgoOfw7sVRgn3LMCVhJ2j0voknO3M7
	gHD+svHArKf5Kxw==
X-Google-Smtp-Source: AGHT+IHd28mYJHFkZ2YC/3FfmJfsWok8nxf/8sbB3FWwSEaJKR0MYxIrlFfEdGODFNdqer26tUf9qA==
X-Received: by 2002:a05:6000:2506:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-3a3496a48a7mr1875484f8f.13.1747221834230;
        Wed, 14 May 2025 04:23:54 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2b02sm19714077f8f.51.2025.05.14.04.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 04:23:53 -0700 (PDT)
Date: Wed, 14 May 2025 13:23:51 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH v6 0/4] Exynos Thermal code improvement
Message-ID: <aCR9RzGMWEuI0pxS@mai.linaro.org>
References: <20250430123306.15072-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430123306.15072-1-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_042356_185307_964A463C 
X-CRM114-Status: GOOD (  21.06  )
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

On Wed, Apr 30, 2025 at 06:02:56PM +0530, Anand Moon wrote:
> Hi All,

Hi Anand,

if the goal of the changes is to do cleanups, I recommend to rework
how the code is organized. Instead of having the data->soc check all
around the functions, write per platform functions and store them in
struct of_device_id data field instead of the soc version.

Basically get rid of exynos_map_dt_data by settings the different ops
in a per platform structure.

Then the initialization routine would be simpler to clean.

> This patch series is a rework of my previous patch series [1],
> where the code changes were not adequately justified.
> 
> In this new series, I have improved the commit subject
> and commit message to better explain the changes.
> 
> v6: Add new patch to use devm_clk_get_enabled
>     and Fix few typo in subject as suggested by Daniel.
> v5: Drop the guard mutex patch
> v4: Tried to address Lukasz review comments.
> 
> Tested on Odroid U3 amd XU4 SoC boards.
> Build with clang with W=1 enable.
> 
> [4] https://lore.kernel.org/all/20250410063754.5483-2-linux.amoon@gmail.com/
> [3] https://lore.kernel.org/all/20250310143450.8276-2-linux.amoon@gmail.com/
> [2] https://lore.kernel.org/all/20250216195850.5352-2-linux.amoon@gmail.com/
> [1] https://lore.kernel.org/all/20220515064126.1424-1-linux.amoon@gmail.com/
> [0] https://lore.kernel.org/lkml/CANAwSgS=08fVsqn95WHzSF71WTTyD2-=K2C6-BEz0tY0t6A1-g@mail.gmail.com/T/#m77e57120d230d57f34c29e1422d7fc5f5587ac30
> 
> Thanks
> -Anand
> 
> Anand Moon (4):
>   thermal/drivers/exynos: Refactor clk_sec initialization inside
>     SOC-specific case
>   thermal/drivers/exynos: Use devm_clk_get_enabled() helpers
>   thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec
>     clock
>   thermal/drivers/exynos: Fixed the efuse min max value for exynos5422
> 
>  drivers/thermal/samsung/exynos_tmu.c | 100 ++++++++++-----------------
>  1 file changed, 35 insertions(+), 65 deletions(-)
> 
> 
> base-commit: b6ea1680d0ac0e45157a819c41b46565f4616186
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

