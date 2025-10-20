Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D768CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 07:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wMIPfwxIFmgU2DtKGuEKOz6gPwOombg7G5RLq4Dz+g=; b=kAhGMR53e6j2/xujzd+76myKed
	tUG3Iz+52ZKvwHg6oTkjp8RuXSgjg601u2xc3hsDE2WtTc501s38xcETeZMbQFThFEHO3vztCgWOD
	XdZqe58akVk4GGtwWQaWCEbgay7gjiAOXK7Vu35Ow8ygCWAk33Iji7ayCF1CGl6i4fkk0kyAlZiSr
	qrYqd8j3Dvt43Cud4/khaGKUvc/z66PKysLATX4C4djv59xGXe3j4TkTbwHLq30JsI4L4AC3FCLEZ
	Pq5bxEF4btYr9HHmDSggDhoLTimCXJFGCkB6kOcyTpAlMnSuX3WWZsUbFMkunQom/hulQmRIDGA0x
	WPkIPtbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAkVE-0000000CDkt-02x4;
	Mon, 20 Oct 2025 07:40:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAkVB-0000000CDkE-1To2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 07:40:22 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso7496803a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 00:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760946019; x=1761550819; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0wMIPfwxIFmgU2DtKGuEKOz6gPwOombg7G5RLq4Dz+g=;
        b=eEV4ktdATdij3bCn37c7KWRS8QdITXFAtPfhImUezGzMaUT52lFf38DZVL/kd/8DPQ
         7VAoK6cQG0mu5oqXmTxnSXHkY/wvdL22imkY14mWKzTg7/jmumGVI/Vsw4FmjLPwm0ky
         PwrVFm1fx0QeodHTvqIpkhbYgTatYjRoDrDh8ozsEcGzdxcdDPkq5V4wD4ki4mzw8kGY
         qVsIxwoNtw0mK/glwZ/OIuqaQ9b5VJdBk57Ys8fLAM6mfhAm+LziU7hzLK8Vl7ABxJeV
         7p+nC0BPgn4xFvIADFHoVwK5P+k90xzDJ/lFxV4iqKn43n4rhpO+nzoQtOED6ZAoFGgv
         joCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760946019; x=1761550819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wMIPfwxIFmgU2DtKGuEKOz6gPwOombg7G5RLq4Dz+g=;
        b=Mw9GnkY3yS5iZW7UTbYhyh/jwYySAHgFIOG5IUGfYD3AldKjWfSFDKP3toBAqxpzrc
         7WCuOWtqdqtMpr7KIi0xaD9edxqP5VdMUqgnMxXMyNJBYe04mnVLIv/ZFIvZIuYYXnlM
         d4v43gigRtXi6z2jeKocYo7sCiSV8L9amrcWPyOO3Go+aYBhsZRmYSXslKOK/2Ix2cC6
         aFXvnsxMMxgOPIssOByOKfDfLu3dODH8FZuO+wf2AgiiHrIy6OJEafKcyKPYPEFtSuSP
         GUBbGdZfQqVZme8p3TQKvCW2qYdHt0fsBGX1UCEAXrKFLaYYQ7xfCGt9WwIoc9YhoA5L
         YAJw==
X-Forwarded-Encrypted: i=1; AJvYcCUS09sSwSkGokPrTo+tZgD0xx79BXtTQE1YM3MXWi6hMx4Vc0NKmh2SFnQBHTGM8SzKp4QOHge9FDRJ82Ob+a3Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyTUzuSFDaCIndMSq1U0egyCPtpENt1CKk7CBtG5Puvh8WSeyw0
	AOx+2uwyUt+Tl822ycneCm9ulWsKES7gUjtQ0vqPhaiLvHjmtsM3LpR111a8L0BGLvnLTtu91oj
	XH6G0PpRSz+TG3F2KcPSulbk+FsyDd2teLUaGSWJ38Q==
X-Gm-Gg: ASbGncu2Mrte8hVILF1+2KOa04xcil+Ev88ZQtHHmHn0ApWhdsGZKkIUECEGahKUNci
	aWjwkQMqEQGkqhbyDwNfVQGt0tEX8ohHT2DRQ0HazRxIyIEJ7Jxsjn8N+1BdEXuXlwSuq/9XWfM
	6/4fxN45FM7hiQES6pRsz8j4MgQGMZwKEYiWRvsVj34xheErPRlMkYT+fHCMMAlI1/NoEGvRHzy
	kzQggWEBDk+Q+61oD+JQ1pbiy6XDfTOKdNJowhJK5qwkL1R+ATA4waJIPUTWXIqvSBiLl6/DNFz
	inIfQkXkDrtnPHzb
X-Google-Smtp-Source: AGHT+IEO+V8VAFMfi1d+Dpc8VhoXd1xOMdOzj7La5+gPgRBFBmz4EnWtgFm++KSbXHUMJdJsGohBl0OEYJE1bSAL0Zo=
X-Received: by 2002:a17:907:a07:b0:b42:e3fb:c950 with SMTP id
 a640c23a62f3a-b6474940089mr1185686466b.42.1760946019110; Mon, 20 Oct 2025
 00:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
 <CACMJSetWthCcJo8v7EuUK-aDKhf5KTNG5WQQ9aTQu62B+E=DMA@mail.gmail.com> <8fb6e8e0-cdca-0bd5-d0fe-56b5f6d27a5c@oss.qualcomm.com>
In-Reply-To: <8fb6e8e0-cdca-0bd5-d0fe-56b5f6d27a5c@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 20 Oct 2025 09:40:08 +0200
X-Gm-Features: AS18NWDQAFben5J2E63tcGMgXbcz7DeN5SPmzBXSPc44YmLC1GOGJsimgnGM4cs
Message-ID: <CACMJSetTrze028iXmH3i=JguJy=aNOMcnkLhO1ewYNiusvVmgA@mail.gmail.com>
Subject: Re: [PATCH v16 05/14] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_004021_425238_8EF11F17 
X-CRM114-Status: GOOD (  16.87  )
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

On Fri, 17 Oct 2025 at 21:40, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> >
> > If you're using devres here - at least make it obvious by adding the
> > devm_ prefix to the function name and make it take an explicit struct
> > device * parameter so that it's clear who owns the managed resource.
> >
>
> sure. we can add devm_ prefix to the function name.
> reboot->reboot_dev is an internal member of struct reboot_mode_driver *reboot.
> The struct reboot_mode_driver *reboot is owned by the calling driver.
> If we want to PASS reboot->reboot_dev to the devm_ prefixed function call, we
> will need to kind of split create_reboot_mode_device into two calls - device_create
> in a separate function and then call the devm_ prefix function where we add the devres_alloc.
> Can you suggest a bit more on this?
>

Ah, ok I missed the broken logic here. Devres should only be used in
devices already *attached* to a driver as all managed resources will
get released on driver *detach*. What you have here may "work" by
accident but that's not correct and is very fragile as soon as you
have some non-standard behavior or error paths. Devres won't fly here,
please just use regular allocation and free whatever you need in the
corresponding release/free/whatever routine.

Bart

