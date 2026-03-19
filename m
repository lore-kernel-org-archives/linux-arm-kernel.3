Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB431090254
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27yAPs+HhqFzoHuJl01kUQFhB7PF3j6LuIGuksYyV+o=; b=mwZjs7KPex3IGLuOzt5/4vIldB
	B7cCII9Y7KbyhBudBH9QV3P9ta6R4W+EL4i8IF95KhjzQm9oXPixQK+E5SeWnViseXTeWXIanYUKs
	RM8w/NDz/nEZldcsxJatdtGMb8JGtxS5M55hoxySnAZ/xXmZiVMGcHhp+SzWUKXOVev5UF33h3r+V
	m+fB7n/mSW3atmc71UZ6+FSV6tRL718DZVVZQpAk7FBGRydTzwc43Dheghd0zsMUaSxSjfLOgbeP5
	7eY63L8+8guhO6ZSVGEvEJsahsaRseaURuFa2S6QSeeFeFMZcCtkIwc+Fpe1FY1GsD05YPD/vtG6n
	AbLF5eSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Giz-0000000B8Mf-1LZq;
	Thu, 19 Mar 2026 16:59:57 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Giw-0000000B8Lr-3kwi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:59:56 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a27c021b58so1272160e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 09:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773939592; cv=none;
        d=google.com; s=arc-20240605;
        b=Aiw4fNs6gf6EglKt3LFFVScfEK4i1sZazzJE9tGU9AhTKXR+dviiH7SoliHgeWswrU
         aY1u3fQLF1Nm+l4BCcsA2Sr5vPAvJscWOBjXNs2McWmE6cnJc/ih5HEfZfUfYwFFgryF
         Fa7aXZCVzWVQOcopLJpAF1bshX4BMZNould0vubAq0PK8ln0Zax5QeaeP7VqDeJm0ET6
         q866nJazYdhDp1sCDg1M/2+oKU6NaIQoyp1ofqO9ctBC1GY+yIDqebYXAjmX5kfywBKH
         mWczu73CvMYu7uDZTJzIsuYETB2Dsshzk9X3kEuJPoGvXenSv2cxGpcoFsT25Ag+hASG
         lMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=27yAPs+HhqFzoHuJl01kUQFhB7PF3j6LuIGuksYyV+o=;
        fh=SDEupT0FAYktRcMowbBMLobdWmHPUCNMgEQsTko2CRk=;
        b=NTHJg67IFTWsAGC3e7juRhxwyBGMBZVngYqBVWsH4rbfAPcXikKiyENS4hZ8Q8vUN/
         eBQEsT849hWsQ799B6SFpavk3Psnbs4mVoVos92jDSIlP/jHu7GacLX7uYCLQBRPw55j
         ELRCBgamQ44DAQSwmIjQ3mTyuYIDTZwsU6uLBKRttoGNZagg6G6lGgM2dRyYQzYzFPng
         fHdngPVny7ZvIAId3ENYCLYxl0yGM3X055f4fEhpGB1sOg09jDZaxZKYkk8FVfwOgmll
         hPKB4XD/Atx6499Ydp6lxV9hG1fTJ4/tPVichFcVQbO1UVUTeOYS0BpfN6MixwhqDmNU
         EAvg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773939592; x=1774544392; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=27yAPs+HhqFzoHuJl01kUQFhB7PF3j6LuIGuksYyV+o=;
        b=ausBzk5EPNWOCXA/2PE5dKqnhETPqrst+2h7La1HkBSxR8lZlPRBUOXVIfHxPQKlOs
         0kDsn7o1PBfmfQswGLCI8d+W95IxeTAFVdx4k3shYHbI5deenYYJta2O7PRKutfoQLAu
         720ivN4opBSPtsWh+kVQ0swhr1O2bn+LxeVzy9GpPirrt85SAEdZyHYCCyodFj9Q3Vto
         S1CERTHSoNtAboufuacFPnsDc4UyrBu9tUiX3E9915KmXqMPk8dKzHnhevbalnCqatTR
         MSxSYitsnztutQFyUYKRVxtdfrh6C0x2EwQF+nIcw+hxZrO+lFmDBVDc2ewAndLvg7SP
         sFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773939592; x=1774544392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27yAPs+HhqFzoHuJl01kUQFhB7PF3j6LuIGuksYyV+o=;
        b=bcpjTbxEqJjjqofF4t2ERWXJH+jHb7D4KPJ812rOzSNm8JcpyMPjnOGzldcAVYNbHD
         dzVSzFvQ8xL+pkpT0UlMJefJUU0d21YD000VxKOLGN5+7E2u8MqYoyMultdeaML6weue
         7OhqNCqb7vqID4PoHNxssp6QKgyeL5dV/syPIqj2vxISqSiM8HGzrmw75rH068GfZUgX
         W8liP30+5UX7fOFU26JJzSL/4yKBUxQthT3ewAbhH/xikixo7B/yAcPEBW6su15G4Afa
         6k+oN4sh5BEOByByULrLkfUvfOAIbbU9Lzp7JPck7zkMcfq74XiORCJ6/rmq3HwokPQr
         ObMg==
X-Forwarded-Encrypted: i=1; AJvYcCUSRaDv2IQRfBflCWh8rVgFi0IQmXLwQibHNrAfL2yKbZDu1FJbMNcVqeinXfRa0COjhwF6sgAE0ooot4Qtyq1P@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi/PGJj3dy3yUL+F9km8qvbxTyEzRxmepkxaerJFKZYnAJJWkb
	Y8qMVPkXCg3MjVFdc5EmOBdbxDjT8NXh7ySXJQNvVTOXoQ3aLKEJJA4GCt0s2g/+hyEcyKUXrl4
	2aNu2xxxqsO48LT9OIn/UElwKBDYGM/+ihw+NHSgkcw==
X-Gm-Gg: ATEYQzxTrWQdz2ubDJg8rQFJGgz4H7GuDP6o1yP69pxYELJYlK9fnXHxNxFn6Df3Zxv
	2rovAb+x6oAcDf2GxlRTiF4DqiVVtkF+WU+s0mohz4qGmYSIr8tua6YmkHJNG9Xpq2MpUoRlXLH
	NWT654NIEqS9r4WCTsjDjXSUksOeoRJb0m8xPNIdPF/wSXB0rpWKljGDAjwEvwk0TdOKNl38mr7
	nEzsjn8HTs8HSGdN7EPMq+Jopm64GS8JBiHl88kwE2+dMQ0uiUVa5EsqCyIS01swA3ijYXxUSQt
	nD1ogNl4
X-Received: by 2002:a05:6512:3d10:b0:5a2:7e83:32ff with SMTP id
 2adb3069b0e04-5a27e833888mr1478227e87.31.1773939592231; Thu, 19 Mar 2026
 09:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
In-Reply-To: <20260303132305.438657-1-ulf.hansson@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Mar 2026 17:59:14 +0100
X-Gm-Features: AaiRm51ZTbjGFpP143fXcYxyckRNNuh4DLi9mrrTmtm7zrisbOS504AGBpxTqGc
Message-ID: <CAPDyKFr25L0Omm_uCjZp03_ptnrKR_P2p3e3qxDeUoFFKJg3bQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] driver core / pmdomain: Add support for fined grained sync_state
To: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_095954_990347_A37207B6 
X-CRM114-Status: GOOD (  18.93  )
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

On Tue, 3 Mar 2026 at 14:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> Since the introduction [1] of the common sync_state support for pmdomains
> (genpd), we have encountered a lot of various interesting problems. In most
> cases the new behaviour of genpd triggered some weird platform specific bugs.
>
> That said, in LPC in Tokyo me and Saravana hosted a session to walk through the
> remaining limitations that we have found for genpd's sync state support. In
> particular, we discussed the problems we have for the so-called onecell power
> domain providers, where a single provider typically provides multiple
> independent power domains, all with their own set of consumers.
>
> In these cases, the generic sync_state mechanism with fw_devlink isn't fine
> grained enough, as we end up waiting for all consumers for all power domains
> before the ->sync_callback gets called for the supplier/provider. In other
> words, we may end up keeping unused power domains powered-on, for no good
> reasons.
>
> The series intends to fix this problem. Please have a look at the commit
> messages for more details.
>
> Please help review and test!

Saravana, Rafael, Greg - any concerns you see with this approach?

Especially I need your confirmation for patch 1 and patch2.

Kind regards
Uffe


>
> Kind regards
> Ulf Hansson
>
> [1]
> https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
>
>
> Ulf Hansson (9):
>   driver core: Enable suppliers to implement fine grained sync_state
>     support
>   driver core: Add dev_set_drv_queue_sync_state()
>   pmdomain: core: Move genpd_get_from_provider()
>   pmdomain: core: Add initial fine grained sync_state support
>   pmdomain: core: Extend fine grained sync_state to more onecell
>     providers
>   pmdomain: core: Export a common function for ->queue_sync_state()
>   pmdomain: renesas: rcar-gen4-sysc: Drop GENPD_FLAG_NO_STAY_ON
>   pmdomain: renesas: rcar-sysc: Drop GENPD_FLAG_NO_STAY_ON
>   pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON
>
>  drivers/base/core.c                       |   7 +-
>  drivers/pmdomain/core.c                   | 208 ++++++++++++++++++----
>  drivers/pmdomain/renesas/rcar-gen4-sysc.c |   1 -
>  drivers/pmdomain/renesas/rcar-sysc.c      |   1 -
>  drivers/pmdomain/renesas/rmobile-sysc.c   |   3 +-
>  include/linux/device.h                    |  12 ++
>  include/linux/device/driver.h             |   7 +
>  include/linux/pm_domain.h                 |   3 +
>  8 files changed, 200 insertions(+), 42 deletions(-)
>
> --
> 2.43.0
>

