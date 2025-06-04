Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C08C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 04:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=; b=N/rUt3kihgBCGm2i03GJY/SWoW
	o55eFt+3fSeS8cn2sIotjglDpujaL9E5YnyCuslvwH8a2JTeKYGG2T2V50xObOXMnYez9vV8jimcY
	anVJkhBMQPGsyJ+elqmGxLsxqoUdiaC3z8vtq22MRKI6xDduvQ81rrkd3id7kFI1Aadzkxbf6k0vY
	hnH16qegOZHeQ8bc3Fi8+66fr9mkYbLfmJO6QMBPXSDzuG+HV4OWGiu3NSrDJTvit4DsXCIDXcpY+
	Q6tAUk9enE2kWf1KohQDewtSJwl4dFPpDNIEUH1DZji+fl86JfR+b/873gTWqrfdFgmGQs0HdThSk
	Am57g4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMfq1-0000000CZH7-2fV3;
	Wed, 04 Jun 2025 04:34:53 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMf2G-0000000CT49-36h5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 03:43:29 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55324587a53so502081e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 20:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749008606; x=1749613406; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
        b=H4tPAs8pUe+squ4ZOdWhS9TxT1KM68f0nUfRtd1moVkUNnPFoLHdczXBp+XrQYCjDv
         ptguQIWXiyAspY7A26y8s+9jiUYQut49v9+e6cGmW5dBqn/d0Y95/cIuKdVikXdEKenO
         Efx6vSPioGRdoucrV8lhzmhrApmaqEbhO++3vbU5+qadUxKhqC8GqUXPvQ83d/HeNX9A
         w3W3ytCFfr00xz2fNbkHGq0a/dy1BLwRT4SRP+vK+QsRj1U+5PRr+DBosgerTnpkKdQt
         kylRKE3rH6G4P+bfKdNltraYK0YQr0gpImRawlOFfISNc+P3t/I+2GNa7dnZhetL1wP7
         MxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749008606; x=1749613406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sf/4+POn7BVTFHEDrs6asZumcOeQmLNTI7IjWHUUShg=;
        b=K0mWZeJUEn+VYSCwtSP1lBxypR1/dE/W94EJbt6wnzBTmp0c8hWUJYDWA0WnDQzN0h
         ZNzQSU4hX+vj1m7nhjxqqQum+TlejRDsipn7OLGbadtszwip6c7Pgv5mbruNEc3rfFNh
         mmkUNOz8DBf+bWYBE81DPe1E7+Xp7vsQCorXWhDUXm/8+GxCxrwwLx6e8gzlwvfA3LQw
         IAj8BkziNN1/XnJe7prYkvWwoaZm3qEHeM7qDS9bKYBSo+AzOkOofAuG76d2+4BL2+Nu
         5D5ykgeNQEkIHQfl0GWQkbRi8TIhNBKei6Z342dRbpAL0xfwTALMDQhl2kWjLCklS4rv
         r8sw==
X-Forwarded-Encrypted: i=1; AJvYcCWyCfXSf4DjuTjwwNmsDaPLIwIpDKwlqMqvo9CMzbB8fOH5fPd+2dI5hB+qA2SFxIZ1AKGhJNKAS3QVE9G/zhjB@lists.infradead.org
X-Gm-Message-State: AOJu0YxIPFqNt8dPMIjsBmPpZCiMGAegF+tIlcfDfLD92jdaRdYYiEkm
	kz708WG97tI63QhzGTKqB2pwKijrsxF8xFdasvzxdo/eAqcoHP41+QkU2ulKdQv7YdnsTgvbLY2
	oti4zHeEO+IMx+XIJ9/AO1HN8dKmouCjE/D06xgI=
X-Gm-Gg: ASbGnctRsceVHpOcxOl1JZXD4cf7EPTyJKRc788pYRnJ+2toyqzZrIPsJbIUmoMFCWg
	2DChFDa3EBPEn1ivFoddB8VZmzV649OIWrjhCBsYoue2Ks6Z8K/+9sXLXkahvFn12hI1bpZkzgM
	ROKRigei6oC6cbsJsZ7STDfygz1O2eoWk+Y2oYSuZWD15KWIwBxBVQ1tCRvD2EyptYuZ9QVfFe
X-Google-Smtp-Source: AGHT+IH8ZR09cOwjQWxlzzIIzvv/qRTFHJMY8a37VDJ4S/kE7pfdaVMCEhiK2Gv1YMR2kEbER3eXRAurwmgsUUQyZRY=
X-Received: by 2002:a05:6512:1110:b0:549:8c0c:ea15 with SMTP id
 2adb3069b0e04-553530e6bddmr1432974e87.0.1749008605694; Tue, 03 Jun 2025
 20:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org> <20250602151853.1942521-8-daniel.lezcano@linaro.org>
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 3 Jun 2025 20:43:12 -0700
X-Gm-Features: AX0GCFvc7MVw8hFnvp1SKu5kFSFas_79C7UyjmOU1fxABMnJcu53irlnUJ9Jiw0
Message-ID: <CANDhNCpngvSEC1bXP_djk2957n-_LF1CUXNgZ-eEQ8vcCsizMw@mail.gmail.com>
Subject: Re: [PATCH v1 7/7] time: Export symbol for sched_clock register function
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Will McVicker <willmcvicker@google.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Saravan Kanna <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_204328_792958_DA91EF25 
X-CRM114-Status: GOOD (  12.06  )
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

On Mon, Jun 2, 2025 at 8:19=E2=80=AFAM Daniel Lezcano <daniel.lezcano@linar=
o.org> wrote:
>
> The timer drivers could be converted into modules. The different
> functions to register the clocksource or the clockevent are already
> exporting their symbols for modules but the sched_clock_register()
> function is missing.
>
> Export the symbols so the drivers using this function can be converted
> into modules.

Thanks for chasing down all the details around this issue Daniel!

Acked-by: John Stultz <jstultz@google.com>

