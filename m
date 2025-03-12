Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6E6C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 16:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vY4Awnn/aaB5x1WDx2/xkXk1nHfjl1OEmOE4k5LCiu4=; b=SxogFnr8eEf0bDDfdzlz9RTUAV
	PyQBbJaBJveVoAZEUstQyPbSCgow98m0iYVpSNmXX07/7uYJP18n2gyOt4VB/ScX1EwhsseIoGi11
	vGw0ULCZu/hUxQ7WKLFMU42Dp1aQ94dUJXR07241WgzMe0eoZpBGip/9kr3lDEuc1wvF/WnIZPSmg
	eiXIPnWyVDaNwKTn95Hd5aP9YqWtLcN3jHNqkcJFq9QLemXnjoUOP/VmIUIk93PY+NphIePdL45Tn
	plNYFFsux8dU2xvXHpLw/9XkEGkkIozeYYjHm809y8a4ek+8UPQyEVO0TKAD1fLxcdS6KXJWfBJY/
	5CrTyzCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOaZ-00000008ym5-3eh1;
	Wed, 12 Mar 2025 16:05:47 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsNYE-00000008lwg-3NAO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 14:59:19 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-abbb12bea54so1241222966b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 07:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741791556; x=1742396356; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vY4Awnn/aaB5x1WDx2/xkXk1nHfjl1OEmOE4k5LCiu4=;
        b=bBnT7ogwYPmfOw+q4+Mj8sLyIXDLwkjJRjhK6VSFwifQkHLAV3kXZAY8gERCIZ6f3b
         nuqz3K0Lx0mIPsA9AhFhNWg83v6xWYcs+RyWXUh4Rjfw8EeVi/CA4S0SWZK/r17emhph
         0AEv+bIQx+URq5hc/H3cvoEaXSqa4nG5OzhUK89hBXUB9V7Uy7YWdp0IGjuz2Bgm9NlA
         Fl3oD7B75Q81iLz/Wvwcsn/YmXowsOMcK4oDbtMZqxGDz4xJqzcmy9RCNLYgW2i9fSEM
         OawRSyb/WlFysZJtqmIrokQ9eZUATu3W3iJMNSArMinxzSnLBuufYmkZ7sL1XtogRzoX
         U/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741791556; x=1742396356;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vY4Awnn/aaB5x1WDx2/xkXk1nHfjl1OEmOE4k5LCiu4=;
        b=AW6HbrV4ayFkgADxg6iLjOf1V29URx5O22nSB0MgOhcUvIDBGdbU0Xl2uGwBZBwDQn
         hx8URtNx7jWIwStry6OnwHyukaIuVGQbeOKAMl3K8jgHzqTL8hJArHgilMiNxT4qtuKA
         BnbwymAVVwllW4uCHHuh1yKXZVXPii3/TAz7ljCRZFwC+9W9tqMvKEO6wf7jjLWQVItY
         QeICHw8oN+zg8xTYMshodWkdmTEl+TeAXoggR/HKhTk4YV9Qcx0zngH63060LekHN5mZ
         M9b5osbcyueIVLAnPrq08bNqM/L4VH2mGBP5PUKBaFZNfk5z/SSPxdHiWTnA2UJtsauC
         QtYw==
X-Forwarded-Encrypted: i=1; AJvYcCUAYcn4XCsAqpDLR9zMDsl74Kfc2e+NRziqWPLbnJbANKO0EbMXNOIaF7l1umf44fK5/GtQ9WrzptY2npRdV+iz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4gvi/22yK642Aei0RCLJCsHvDgXFPB0luTsFMRSpaAgg//S3H
	pCE4D03ytjUIBRNowIQ2PSRjuYBZNLAyMQC1z+oayIh2JmWgbX518my1ydpkFqBK5mg9hJFbzAV
	eWP/9DDJVzO57ifi9+oOeB09BpQs=
X-Gm-Gg: ASbGncvo9gq2waIriMCgolvKJTQMyJtmuD9arYOYkYs7vcyUOx7aXT47uFuX6uc9XT4
	SBaLisqpQkSQMwP09RSFpI+owmSP66dIccKL3LOKIOk4QZm4EL92otmLMt1SAcIrF8k8drWaZel
	dzXldjeV4h6T+x1UJo737EoUzEJQ==
X-Google-Smtp-Source: AGHT+IGiPv/RqZONre6oHaSE9PreL8gyCQ96Y/2k8z7w+Ar336UjLvC65ewlUy5TkAYOXML/OLtyjwmp9Al5GI6HvRc=
X-Received: by 2002:a17:907:9691:b0:ac2:166f:42eb with SMTP id
 a640c23a62f3a-ac25259836dmr2972251766b.2.1741791555675; Wed, 12 Mar 2025
 07:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250310143450.8276-1-linux.amoon@gmail.com> <20250310143450.8276-2-linux.amoon@gmail.com>
In-Reply-To: <20250310143450.8276-2-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 12 Mar 2025 20:28:58 +0530
X-Gm-Features: AQ5f1Jo-jjPkEoei21awrWrKjHVJPFPfCS1Ru_y01gNm4hp5leBwMNi4MCMjL_w
Message-ID: <CANAwSgRcuMZTrdn27qdEkZF33cQ4RemjExs5eySO-CMv3Qq6eg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] drivers/thermal/exynos: Refactor clk_sec
 initialization inside SOC-specific case
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_075918_842548_405DD64F 
X-CRM114-Status: GOOD (  14.20  )
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

Hi All,

On Mon, 10 Mar 2025 at 20:05, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Refactor the initialization of the clk_sec clock to be inside the
> SOC_ARCH_EXYNOS5420_TRIMINFO case. It ensures that the clk_sec clock
> is only initialized for the specified SOC and not for other SOCs,
> thereby simplifying the code. The clk_sec clock is used by the TMU
> for GPU on the Exynos 542x platform.
>
> Removed redundant IS_ERR() checks for the clk_sec clock since error
> handling is already managed internally by clk_unprepare() functions.
>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

On Exynos4412 Odroid U3 uses the clocks name
      clock-names = "tmu_apbif";

On Exynos5422 Odroid XU4 uses the clocks name
       clock-names = "tmu_apbif", "tmu_triminfo_apbif";

So Exynos 5433 and Exynos7  SoC use the clocks name
      clock-names = "tmu_apbif", "tmu_sclk";

As per my understanding, there could be a common case for GPU clock in
TMU driver
which could simplify the code, any thoughts

-----------------------8<-------------------------------------
switch (data->soc) {
        case SOC_ARCH_EXYNOS5420_TRIMINFO:
        case SOC_ARCH_EXYNOS5433:
        case SOC_ARCH_EXYNOS7:

Thanks
-Anand

