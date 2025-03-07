Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3F6C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0Zt2jhA7ZU0TgS/MrOl7ZuQLXDeL147bPK0+m8I4Uk=; b=jfOUVyG8S6UY3UNt9AB5DzbJIb
	6iBlD8YHWpcQwsM7KTa+gY6WhPRpI8SRVObVTqIz+bjzUdtmCJ6RPoGlWJGpyvQ1txkx6unuoChpb
	QMDPN6Y2XR2DJV8WtZVheIcXoXxttwg5B0FHkmLbW05ntSNVQiUM4QO7DDOUVTbsPHIvfg3fsdRcr
	yRwTA3DPZ4dD2oKG8Vfg5sqrd/YshAw9zsYfVMQT3sk7aOrfr7IVpFnME6Qq0Bv7BUPjC2saMKO26
	fVdBaBW8pArEj1ygL/65p5CCHJte9kaT4UgfFMzUofD7voJRRM91RZxyTLYAxPg068iN9AZKvMR1B
	ZeHf7PMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqb02-0000000EyfH-3H6l;
	Fri, 07 Mar 2025 16:56:38 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqax6-0000000EyJt-1G7i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:53:37 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso10635591fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 08:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741366413; x=1741971213; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0Zt2jhA7ZU0TgS/MrOl7ZuQLXDeL147bPK0+m8I4Uk=;
        b=MGY2wMCCs5bec12z1UQxx7eWaOW7AiUwXf5lxzfkQZVPCE0XqpVHsbOsxrlW6n2Dsi
         78n/iCme3Y/hcpaUEP+RU/yGRmDOyi52OdUnr9NXdgxv6ISAO5Z/9eXsPTztTJYhs0kX
         dg8mdZGj40yyhKgTkGAYtATrpAfzKntTZQ5XI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741366413; x=1741971213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0Zt2jhA7ZU0TgS/MrOl7ZuQLXDeL147bPK0+m8I4Uk=;
        b=OCkVk3Y7ddxpv1pnGR/ZqjtiD5LjMlRVQVMyoZ310rkrM81zGSjSyzkqKk2zHtyfRe
         fydwA8NnPRyKFOveo9CLErpIU8ImU+nPswV5kf+qNTGWrsVAVekQ/ttQzjc6pMr21ZwZ
         U6v4NxuBtcFgWsfgbE8U2mkbxINU3ryXujbFXbl3NyW111wK41pq3Mu7aorEWUThyiNz
         VeN5RfmEAy9v0V2yBYxv6PSd/IS4JwnnAHwIJEcpdu6b0kiRWb894gIfkiVPKxLICsdE
         ZTfV88eg8TS2RYGk5lg4mKA1prulL4OyOE/Iz68QgpVwbsSN8qaG72GkIp1sfTIvs/BA
         V2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWouXvWJYT3p0EJKV6Qwa/S7tsgbNnoBGLRJ7euI0k0kpvuQEo7c9srlrINGH1ZfEBej2EZ/WjQhsssgB4wC5Da@lists.infradead.org
X-Gm-Message-State: AOJu0YxAvwY1gHoBZPScuaHJwiuWJ3DZb5YPM0eIWFaeLcITLXE7G0wJ
	9jKdgmiD4/C8hGw+B3vDclyESpaxwxN8bwc68Hg99vyp9dPvoR+6VxWEsT8MnAee3oke3EsAew/
	cBA==
X-Gm-Gg: ASbGnctsiilEZnS9IfTV45TiECBy+VRXud5E08NJLEZWEee7uu9wOuAf/ZNhGad1Zif
	TSAf8gOi9wKCcnnGBaV5f5FWsLJXgZ7EWDLf99oUAUK4JYL7ZONOjm36ODpKhHzX3ALG3uiH91M
	EgrFVquMYl5wefl6YDeX8qwzkfshEtH3Ambjga42JY2Nc6bkf+LXBYDkKWPCVHx0/NLJI5GUlK7
	KCFW/YfX5WYEybHiIwcjAoIIGK3eipxM8zRaun+KxBkfx5vmUItphxVRwCKRprIShC0mKlautBJ
	Lpje9GYnVLJ1M0E++qE+xVxE7H0SWapk0eK+Tcbz1r5paFgMeahLgxhF3yck99Dfp7jf3C/8PTc
	ZRjrhW7KE
X-Google-Smtp-Source: AGHT+IFr2kFn3rToZdRG8ApibwBTjwN014kZPIALD3hMDMmu9U0fKkoGUr+65hjE2VPiPMdsud1Cfg==
X-Received: by 2002:a2e:be03:0:b0:30b:f924:3544 with SMTP id 38308e7fff4ca-30bfe42d9a0mr935471fa.10.1741366412539;
        Fri, 07 Mar 2025 08:53:32 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bf11ffed0sm4132691fa.102.2025.03.07.08.53.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 08:53:31 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54957f0c657so2384943e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 08:53:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMia0FHN6h2e4cIyKubCbEHToCfJ/tEh/g6YzKPgCEisVd1PPk659/dbhwBuSI11ZVfWMQ6aLMfPwqot4jDwgP@lists.infradead.org
X-Received: by 2002:a05:6512:2386:b0:549:8b4d:bd47 with SMTP id
 2adb3069b0e04-54997e4cf86mr85675e87.9.1741366410846; Fri, 07 Mar 2025
 08:53:30 -0800 (PST)
MIME-Version: 1.0
References: <20250307021811.46981-1-yangyicong@huawei.com> <20250307021811.46981-2-yangyicong@huawei.com>
In-Reply-To: <20250307021811.46981-2-yangyicong@huawei.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Mar 2025 08:53:18 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WfB6inJPuwfhbw4mtFBYpr+3ot2J+SJAZ3pT3t4fW7cw@mail.gmail.com>
X-Gm-Features: AQ5f1JpI_gfdx4CVaz6hX7OKn6TzrUz6O9Q4J2HqOQo2t3L5O5xDD303Pb33Xyc
Message-ID: <CAD=FV=WfB6inJPuwfhbw4mtFBYpr+3ot2J+SJAZ3pT3t4fW7cw@mail.gmail.com>
Subject: Re: [PATCH 1/2] watchdog/perf: Provide function for adjusting the
 event period
To: Yicong Yang <yangyicong@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
	sumit.garg@linaro.org, kernelfans@gmail.com, lecopzer.chen@mediatek.com, 
	tglx@linutronix.de, song@kernel.org, linux-arm-kernel@lists.infradead.org, 
	jonathan.cameron@huawei.com, zhanjie9@hisilicon.com, prime.zeng@hisilicon.com, 
	yangyicong@hisilicon.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_085336_364333_6EC5AD13 
X-CRM114-Status: GOOD (  11.38  )
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

Hi,

On Thu, Mar 6, 2025 at 6:18=E2=80=AFPM Yicong Yang <yangyicong@huawei.com> =
wrote:
>
> @@ -211,6 +211,27 @@ void hardlockup_detector_perf_cleanup(void)
>         cpumask_clear(&dead_events_mask);
>  }
>
> +/**
> + * hardlockup_detector_perf_adjust_period - Adjust the events period due
> + *                                          to cpu frequency change
> + */
> +void hardlockup_detector_perf_adjust_period(int cpu, u64 period)

Running `scripts/kernel-doc -v kernel/watchdog_perf.c > /dev/null`
after your patch shows:

kernel/watchdog_perf.c:219: warning: Function parameter or struct
member 'cpu' not described in 'hardlockup_detector_perf_adjust_period'
kernel/watchdog_perf.c:219: warning: Function parameter or struct
member 'period' not described in
'hardlockup_detector_perf_adjust_period'


Other than that, this seems reasonable to me.

...but I'd also have to ask: is there a reason you're using the "perf"
hard-lockup detector instead of the buddy one? In my mind, the "buddy"
watchdog is better in almost all ways (I believe it's lower power,
doesn't waste a "perf" controller, and doesn't suffer from frequency
issues). It's even crossed my mind whether the "perf" lockup detector
should be deprecated. ;-)

