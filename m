Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49F2C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 05:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hI3ZZc6ZIfeQWRhkKtoqqhZ+/gqSR8tSQPrVMAH9qpQ=; b=V+ltKqJEALsM15yBnmsZbeZ7gH
	1f6ozuWt3E5kVqijovFlq03MNiVKmh80oL/qvUHs8bXOMaP66WwgZw9YH+jj9r4f7BKUazwqr1FXl
	OOuYr9XUXaNhz6CFdQeRLts9d7OQmZxz5F0Q2TWBE9VZSslyaB6J65Nlw1N+mrz7leIqJHSIWUbTy
	XNiugnJYsLO/35CqOXDf3FKno5qK54OBmM5okO0gPNxfN2pOhYfNVBMEKeCAIFiQyABT3/TXZWTqP
	ycMqPrIMGYa9KfG4yB4OdEEhWYAOme2Vbv6yDK4B7ioqrhaQM9VFBkR779wGg78KElepLB6nPE9Sv
	Z8SGZ/gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8IJ-0000000C79o-2NH4;
	Thu, 19 Jun 2025 05:58:39 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS85Y-0000000C5Gu-3hmR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 05:45:29 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ade33027bcfso55726466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 22:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750311927; x=1750916727; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hI3ZZc6ZIfeQWRhkKtoqqhZ+/gqSR8tSQPrVMAH9qpQ=;
        b=hhi04zvJkdNnDkfSV/r0/0QLcz/IU83A1G3nKYbZwq5rt5dp19a9B36pj5DV+mzvi+
         YepV/gBPKwvX9UJoqQRLsSuYYUnBBiwXy7kWb57R1NM7xJiiOtMAD+Ozsu1DzQp8y+YY
         hOJu/AQS1zl8TEinVJ5qq1sjMS9TyOrPu39LNq9zRiocvmEAArPDMPz2lQ7SBa796ZDE
         oTkXW/h5C2Us8GXqw6VDU57dzxBsLtduqQeIkBR7PgUetxOW9jQjgL0EKO3G+qawcHNs
         Lo5OD7+yqKcoLY9jvI2j8KfMK/CSLAjVYXm7UubczsXCPCU8hfBhHMfbRr9LujAvNf1T
         iJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750311927; x=1750916727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hI3ZZc6ZIfeQWRhkKtoqqhZ+/gqSR8tSQPrVMAH9qpQ=;
        b=ToriFiIJ7yAV9qQAQeold//RqoVPuhZm4jyAtN7KOB72dcaXvUN00ainusv0M/DqwG
         gkegkyEoMUAaMX0ljWO3SJUEffJAS/H44ARGZ0z0l7LujY0/1QBz5193Ygwwa5sYnPYU
         etbpRAOreyjTiVRCoF1J6lQGc9y/92aHNfCRreN4knvt7zFemesUa54gbtKOi/V+lYbE
         idGOPA/X7h6wMA5MHJpaFhOoYDkyF7B9aXIgaz1yViUqi57FdrDeBTrkvCEJNDqsRn8p
         6vPvs3mo0FAgjB1iQOGd+YQkPVvmu/BemX5C2SUOrlexW603f28DOHAz91w1d95avo13
         pHsA==
X-Forwarded-Encrypted: i=1; AJvYcCVAbJKyvHfr0JqosdJ++N69Gw5XuAvYawdZMewleN2M1oakSK4FNTDvoPTxryb3NXfm/ynG8ZhHZBjEhpKKBUG6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywup04RahD/f9pKBujoIfvdoYElC5skaTK7ZRblLlcpCYZKIIKM
	hHAV+lIsYif4o3ZLf5yWPPKY5ikMjbbzHL4l6Iq6nuT/iumqwswEAyrdFj+NOxEtUcmG+e9an2V
	7UNnSpem1SUwPpA5kCyfXXPDBz/eQYfw=
X-Gm-Gg: ASbGncs0qV1P6dviF4n9VysYfianjzaXO5+vEkVLbCWMQjtbN+JtYW58Me+tDuoOXb/
	E6YUIvYiae2DkYp7ckUyTG2mPdkdyJZuhcDp0KoyYI+i2BWPW0zsLQskuO4DhhLHqytbmjoTs9v
	iBFtnx3rp0Ca92SVjY2HhUEtDBWw4oe4oejlrkkE7JEA==
X-Google-Smtp-Source: AGHT+IGFg/QouhetKCeGlm2hpPOaEv9iGS/ZDHM9GFWAidTxlUSQGJypUzbVDg2JCtPaYb7KWe7s2hBaEa3XMYsvQxg=
X-Received: by 2002:a17:906:c109:b0:ad8:9e80:6bc6 with SMTP id
 a640c23a62f3a-adfad32dcd3mr1803340566b.22.1750311927097; Wed, 18 Jun 2025
 22:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618125812eucas1p11a1ab5210d4efa95a51b3bc7c4f0924d@eucas1p1.samsung.com>
 <20250616163831.8138-2-linux.amoon@gmail.com> <20250618125806.2260184-1-m.majewski2@samsung.com>
In-Reply-To: <20250618125806.2260184-1-m.majewski2@samsung.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 19 Jun 2025 11:15:09 +0530
X-Gm-Features: AX0GCFtoTWQv-WPpIoBPQ69MBoxGVOjhzrs9aOAgkXxAX0olEdrXbf4tn774ZnA
Message-ID: <CANAwSgQ-NFBtUareFmRzNVuKTSC8Vp7HTA0psBqYu2r=aqAGxg@mail.gmail.com>
Subject: Re: [RRC v1 1/3] thermal/drivers/exynos: Remove unused base_second
 mapping and references
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org, 
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	rui.zhang@intel.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_224528_927636_3A495033 
X-CRM114-Status: GOOD (  18.01  )
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

Hi Mateusz,

On Wed, 18 Jun 2025 at 18:28, Mateusz Majewski <m.majewski2@samsung.com> wrote:
>
> >       /* On exynos5420 the triminfo register is in the shared space */
> > -     if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
> > -             trim_info = readl(data->base_second + EXYNOS_TMU_REG_TRIMINFO);
> > -     else
> > +     if (data->soc == SOC_ARCH_EXYNOS5420 ||
> > +                     data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
> >               trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
> > -
> > -     sanitize_temp_error(data, trim_info);
> > +             sanitize_temp_error(data, trim_info);
> > +     }
>
> If I understand correctly, this means that the triminfo will no longer
> be read on other SoCs calling this function (3250, 4412, 5250, 5260). Is
> this intended?
>
Thanks for your feedback.
I will remove the data->soc check for Exynos5420 in the next patch.

> By the way, are we sure that data->base_second really is unnecessary?
> According to the bindings documentation (in
> Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml),
> the different address is necessary because the triminfo registers are
> misplaced on 5420.

As per my Exynos5422 user manual and DTS mapping
thermal-sensor tmu@10060000 is mapped to CPU0 with tmu_apbif clock
thermal-sensor tmu@10064000 is mapped to CPU1 with tmu_apbif clock
thermal-sensor tmu@10068000 is mapped to CPU2 with tmu_apbif clock
thermal-sensor tmu@1006c000 is mapped to CPU3 with tmu_apbif clock
thermal-sensor tmu@100a0000 is mapped to GPU with tmu_triminfo_apbif clock.

Well, we are using tmu_triminfo_apbif to configure clk_sec, which is
using the data->base to enable the clk.
So, data->base_second is not used any further in the code after we set triminfo
>
> Thank you,
> Mateusz Majewski

Thanks
Anand

