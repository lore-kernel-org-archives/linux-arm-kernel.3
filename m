Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD70C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSOkGddlFU/lkCcHnNp+1rcvb+cBDqhlRIZAqPb9NJ8=; b=17vYbs8Kt0myXDIaJn7v2MWhYu
	JkpPuZ42HtU/TIFqisZDu/OWOc8tFVp58LscWegAOU/yK2VJMdq7NfP4oHTYVIBFJPTzkIUwedWZ+
	klte7qE5dNfk6H4/xBRr2IxsdkIvweygVrNCD5m1XkezLOPrA/46Zd+CJe9KHjP9p+OrfKjmDPMI1
	g4PIl0hJ9LBmKvsS3CUSil40ePTCi0fjVMVWKLC5eE+QScuB1uu9QkREaqRFkiXm7DgWCXeoY8Z1o
	hI7Kzum4z51gpuDTgHDdUN6Au8K21c1HvICGXufXQuXma1FdaRZsVYsgEFpTIxmEIkD2Hj+KhS21a
	+OGB0itA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTzL-0000000HabK-1TGT;
	Mon, 10 Feb 2025 13:38:15 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTjK-0000000HWTu-1nBR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 13:21:44 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6ef60e500d7so33346137b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 05:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739193700; x=1739798500; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uSOkGddlFU/lkCcHnNp+1rcvb+cBDqhlRIZAqPb9NJ8=;
        b=cSj8OWV5DN+4XNYMHlLM7VPDSqEotnJDGD67whP6DZ0hU1e4juSjiqVWbamEHD+2aZ
         bRaZWG5+Bzx0gJZBykp5JWfBEUCSa7kMAtHKHjAKKd+hJYRuIMtFkNV3zTgLXsS5nstm
         vvjY+bN2ef6E6KC2Bqc1zolvkFLVXHYimYLCzmEvVlvC4lPVa3KaQE0+jgFBHf5HEGmy
         cMRJ3n9JGogOz8dozuUoZNabOta1CCANrNlc2beUvIR8wg4idIFuQIN2tLxHASw9wDJf
         yypt3bCoz0blWhiDonRCPBVtFUzFmWmFbUfe6+97hTeQ8O7YAEpHNvnhF9DZnXFgGpdi
         byPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739193700; x=1739798500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSOkGddlFU/lkCcHnNp+1rcvb+cBDqhlRIZAqPb9NJ8=;
        b=UGAQuGpxOiPW3AKTGjpfCJ2X6RajJo16dy3rTXnbc/5eFiUaNYIZq2BXZByukSzJSY
         AEUn/GoXoh7eiAeLqxhWESrwXCzc7iEU3o5rB/DA3jo1fvXRiORKPpOLwKJOnQHcJ55u
         iS4Vny4xnooGLd+RXW3oAjNfM++xBXe8VtdYdX5j0OCMjxLO1RgSXZfZA1w1S0BeqaLf
         +XO4fjV1UkwXWXOejNdBz1MY6Sl9A8yTa2OOnXzZ7sK8gfUkIo0Og/bZ39XcXvrCCJR3
         SIKH0z7nGtD2XKDLAPJsPyA0bQNwsXCWUald5tKJS5UZo/YJVfFFmCEfkrews92CN8bk
         BdsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4yIWkEbuWLOy7bh2UzrKWn470F4kObweVJOD+BdK/Dnf+twgNHWIJ5yyXBiYXDc6Cs8QN0EJXymGICEjD9HvP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv20tzRE4p8EXZdSg6kWedRBDO4igjRwMoBvwJ6UICxMFdFENY
	SVSw2mTCZNN3JMYKMwSIu8NqPafc8MMpOb3F8n/m6VcOUKNZcIOwKTlnN9SXmEi4U82yXL2rZoQ
	MjWKyFkeZOx7yT2svrMAvgGtHyyx2xJj3AzQOUw==
X-Gm-Gg: ASbGncspuguuhTlApbcLr2hj0hDfdvVAFIF7QyMHOdEI6vmBdCQaE66/QcQgYrue/v7
	m/A+5R42qBxyxe3loFMh2nojGFGhscSiNOIXtCpDLwm9lK7k9isSKMihEKiPYBTdi/l53G+jBVg
	==
X-Google-Smtp-Source: AGHT+IGT/GDZ6Gxp5I3tVgS1PGL22uLGu8gT3RwgG3Vcr3l8bKWAi7Qxr4psOTaJndd7ZmGbBmIMtA2xZ5DujtxikjI=
X-Received: by 2002:a05:690c:fc4:b0:6f9:4bae:450c with SMTP id
 00721157ae682-6f9b2981b0amr124519297b3.26.1739193698224; Mon, 10 Feb 2025
 05:21:38 -0800 (PST)
MIME-Version: 1.0
References: <20250206220940.10553-1-kamal.dasu@broadcom.com>
In-Reply-To: <20250206220940.10553-1-kamal.dasu@broadcom.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 10 Feb 2025 14:21:02 +0100
X-Gm-Features: AWEUYZmw4p2ewkot51drspCy3hd_woeZ-XwIYUHgv-bUaKg6vpiCs0WxHAlmW94
Message-ID: <CAPDyKFq1ZbP4c9ECfM1SY+MEopf+dC19w9PkqXaUjevf=bPjcw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] mmc: sdhci-brcmstb: Add rpmb sharing support
To: Kamal Dasu <kamal.dasu@broadcom.com>, Jens Wiklander <jens.wiklander@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	adrian.hunter@intel.com, linux-mmc@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, 
	f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_052142_474298_08D25E03 
X-CRM114-Status: GOOD (  26.50  )
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

+ Jens

On Thu, 6 Feb 2025 at 23:09, Kamal Dasu <kamal.dasu@broadcom.com> wrote:
>
> This patch set adds support for Broadcom TZOS to read and write to RPMB
> partition using synchronized access to the controller hardware.
> To achieve this Linux OS and the secure TZOS make use of:
> - shared hardware semaphore register
> - a set of SDIO shared work registers and
> - IPI interrupt registers
> The sdio shared work registers indicates next in queue to access the controller
> and current agent in the queue. The currently running OS that needs access to
> the controller puts itself in its slot of work register and if its next in line
> it can try to grab the hardware semaphore and complete its mmc requests.
> Next agent queue state is changed under the hardware semaphore lock before it
> release it by looking at work slot register. send and receive IPI interrupts
> between linux and secure world are used to indicatecompletion of transaction to
> the waiting OS. TZOS has its own RPMB driver which accesses partition when it
> wants to read/write RPMB frames. Current implementation assumes Linux and TZOS
> as the two work agents.

We recently added an in-kernel interface/subsystem for RPMB
(drivers/misc/rpmb-core.c). The optee driver (drivers/tee/*) uses it
ro read/write frames and route them for the secure OS.

When the mmc subsystem probes the eMMC card, it registers it as an
RPMB device via the new RPMB subsystem. In this way, it allows
consumers (as the optee driver) to read/write to/from it.

>
> Change required adding two core mmc_host_ops request_start() and request_done()
> to let the host controller driver know when a mmc request starts and ends so
> that the access can be synchronized. This has been tested with both the sdhci
> and cqhci access. Currently these ops are implemented by the sdhci-brcmstb
> controller dirver to acquire and release the hardware semaphore before and
> after access. This change to the mmc/core driver does not have any impact to
> existing controller drivers.

It seems to me that this isn't needed at all, assuming we have an
in-kernel tee driver that can route the RPMB frames, but maybe I don't
fully understand the use case.

I have looped in Jens Wiklander, allowing him to comment on this too.

Kind regards
Uffe

>
> Posting this path to get comments on the initial implementation.
>
> Todo :
> - Provide  hardware smeaphore using the harware spinlock driver framework
> - Use IPI send receive interrupt controller driver
>
> Kamal Dasu (3):
>   mmc: add request_start() and request_done() mmc ops
>   dt-bindings: mmc: brcm,sdhci-brcmstb: Add sdio sharing support
>   mmc: sdhci-brcmstb: Add rpmb sharing support in host driver
>
>  .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |  16 +-
>  drivers/mmc/core/core.c                       |  14 +-
>  drivers/mmc/host/sdhci-brcmstb.c              | 275 +++++++++++++++++-
>  include/linux/mmc/host.h                      |   4 +
>  4 files changed, 303 insertions(+), 6 deletions(-)
>
> --
> 2.17.1
>

Kind regards
Uffe

