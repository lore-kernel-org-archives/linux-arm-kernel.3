Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02ECD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 08:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5QyQLMURNcrCc99cho9V8h9KI4BXTcX0f/zycekJzk=; b=gvQpP1c2k24hfat8+ENMDMRidS
	q05cgDroPXx50GW8a7wdqNMEbqhJTB95TVewJC2NBPWO3D4mF+nml0YzPkRyevyklqyIBYy/awbkm
	l0Q3YNGQA+cCi2EUxMINZZZs4tY94UCp37keBaqMudwRvF799BsjArzFZ60AtvX99jUC6/GdQ1S9I
	ej0Jl457LN1B7vRCV4R8E/6U/C8BBLgZs7jC0WzK4Mwxh9lh5uAPSrHoYreTW2I+Xl32wUjQ6DSjc
	JN6DsF7EpgZUtglnUerhX1cab4AV9DgEW4Rxgvyay2eAeaWFvVvijSJirAoOZQC+DkiqHhBFyuy2C
	ji/o0jRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhwS-00000006Hm4-2f4E;
	Wed, 03 Dec 2025 08:10:28 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhwQ-00000006HlP-0gjV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 08:10:27 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-340bb1cb9ddso5525133a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 00:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1764749425; x=1765354225; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z5QyQLMURNcrCc99cho9V8h9KI4BXTcX0f/zycekJzk=;
        b=j+fcr4HgqQK4+EA8QC56KAtsVn1/b657j/NwBIMPHfiKTQhxLP8mbo/lUbswtODITV
         v+EEDC/F6QyS9TYzKaLuCwfGFES/CAPSZsEV4QDQKVLK0DKKbbZMQye4xD7yU9dl0BZb
         fMn5L0zmXhf547487ruB0QCre5FlI3OiQWX9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764749425; x=1765354225;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5QyQLMURNcrCc99cho9V8h9KI4BXTcX0f/zycekJzk=;
        b=KbOq6h6Gg8K7e1XpTLS0Gjr5Y+VqXSDAROuBAGk5cjJEgIuf78L8fMFO4j53XNmaSc
         lBy13R6L85madeuTEQW5YOgs5Eqyg8+4ii1gxSatVnEa917yBuj7cw1Bn0rkW2aMU5FP
         A/TP8qPrQrRet8Mz1WnxvD6O6RQBKesUcs+1jd8oR3NWCkiMr++bV+5VSTfQeP4ZGEgV
         8EOQfJVBTc4TTBl/6HXGmdFrl0xrT/q5Qehi3fDfC5LU7wjmeLVwzK9l6D0tmtJFZHvm
         ljON5V1ndM5qrevPHw6u2edvyPEm1y1+GaylKwU5ynoGD/7Y0mvgXlWdpRsJJB3gatlV
         B+fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUayQnEXMVyS2ETviLqDgCqefSmTf2GsLyp4OL6MGNznh4DTspwpuNlF+tZVOhCslO+201/AX/BG27o8s1tWm+f@lists.infradead.org
X-Gm-Message-State: AOJu0YymAcexkxbH+Za3p4+sigaxbYTqavTx+qZC+2T6AJhsf3qr5xCF
	9EjMJPdMw3QPQP0gwPhDLBYnbS2iXFnxVWg5ZHbUTGt+BAiicjjMA3Gckbuam+tAuy56UYg7c7B
	FRGh/t/p36ku2RHJ7GTvh16KWhMgQ1ON+WHCaMdpLPA==
X-Gm-Gg: ASbGncs2VraWH8I/vt75hVhWLMaspGCnoRUCBWf6YUMw/Ih/J46kYATWqTPxAG0mug2
	aRegripJQm+gKDHih4TLoxpMI58tN1qEMVoNFuwYIztM+dkaz4pcsAgDXuS0oPW3QaUm7vDnriZ
	caS6wa91SrJ1ZEL91/fwfxQ99BcN3nLHTyNqPXd+cH2zwcxkyihl9ElecLNCm7TroIAgFu+8jxi
	+aKKo0Kk9ETeMrcM+eh+WGK/EsBZUoKdDhB7TbnkqHBrS16p5QbIZz03gWkWmju6r7CH36d
X-Google-Smtp-Source: AGHT+IEq5y63hfjT8YHjilACNJqyKvg5j+0plLqT3wpsKD5Q7MH1znsyxIQRdeefXp8WZbUY/IfgJtcujn/JnV7uScQ=
X-Received: by 2002:a17:90b:17cc:b0:335:2eef:4ca8 with SMTP id
 98e67ed59e1d1-3491284b4d8mr1814924a91.33.1764749424655; Wed, 03 Dec 2025
 00:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20251124002105.25429-1-jszhang@kernel.org> <20251124002105.25429-8-jszhang@kernel.org>
In-Reply-To: <20251124002105.25429-8-jszhang@kernel.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Wed, 3 Dec 2025 17:10:12 +0900
X-Gm-Features: AWmQ_blMivOz7cN3cWbzITo5XCmwfcKVIQTdEzDBywa8v8-CY7hjUyWixRG6J94
Message-ID: <CAFr9PX=zXuaOBoEUGkYjrROK75e_xt6XZQu=mt0zQQNYWn_TYA@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] gpio: msc313: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Romain Perier <romain.perier@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_001026_206410_C18CF4DE 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
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

Hi Jisheng,

Sorry I missed this. This looks fine to me.

On Mon, 24 Nov 2025 at 09:39, Jisheng Zhang <jszhang@kernel.org> wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Reviewed-by: Daniel Palmer <daniel@thingy.jp>

