Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF80CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 11:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZ0p4RGMaKkdg82zu0ufNV13vLNgFLb6uCYyjivzVoc=; b=JtM3vyoR9QgjeookusvwJ3SCug
	sr3jFZPPCheuNaaL1sv8ps9CMHK9uQlfaIxV881CNGarceBnuAi88Zrsj+a1m6xBdf2Ujg2C8tfiL
	xoEUaCiF4h2eK4MHsKcDuCKGU94Z5jl20QIMK5UA9L4WEXVq0W/1u4Jpt8In6DsWPhuBJ1U7Th4PR
	kgRk4cCg/L1t8LknAxgQekXGvmRa7m6T7adooV870bknKbLBYwr+IsiZSBTyABMSQpd7hCcati5fp
	AoRNlZ+rVLCS+AuXKsLHOvROOPVpIG/bnZlbybJKd0YxZ1ks0mIJk0gfmcxDOV1W0/NxjxrZuFyne
	diDgILdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GQM-0000000Cz7r-3T9g;
	Mon, 13 Oct 2025 11:09:06 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GQJ-0000000Cz5o-1Aaz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 11:09:04 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-63d0692136bso826737d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760353742; x=1760958542; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KZ0p4RGMaKkdg82zu0ufNV13vLNgFLb6uCYyjivzVoc=;
        b=zNGzt2J8GnAVVzaOOkQJajIl0BcKh4RDm+EhI4Qcnhqd/lICO+aNyvl2vecb76ylHb
         nr7xrTfpRdofxLP1RLSkdiVZnZipLu5nIq6EYfmGXDFbUCjgVyF+28gqw8nsbQh/hh1N
         GIDOqEurmlGWnttYbt2mL9OC0qBrUsuaMqJbk60VN3TnFOf4w6vEDMY1QSee/LkEWvUN
         GOVsUZnm+ZlZW5AhyA6DssSnKJ3se9UGQVtDhNJ+HLQMYjRcSbH2mdCsr/ewPXBDD27p
         25b2D1lztk2VnGeBuwHRzq9PtSYYtXycrxwI1eRGcWf1wD+jISjojOnooFVrOgPwE048
         mpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760353742; x=1760958542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZ0p4RGMaKkdg82zu0ufNV13vLNgFLb6uCYyjivzVoc=;
        b=Ldskiw+0LtWzjZQfg+iCaSOyxirHu5psugLVlaTsbas03YdUuaaoqmPpUNVdQ6wgd2
         0x/9FqWAJvVHU958+0KGAipPTyUjIlzfRN3BsEbKwtimhaOQXMUuRNSgIxtc8sdMJLvm
         +00zEbqAZbZzeHLp86rZ9PDEmMoT4u9cjJjV+txgYTaAjUA6uE5WI0l6XA3QdkZ0CJ41
         zi5tRlcqz4r7LeM1nEVXhtgwDJx3jwETMc8uYxPNn1MKtfdJVf69x2g+xrA1Zm5xKMxn
         MMEotbqxVDsf+QF6JzCrLElKae2bJqmoid5pTCR6Z21NqUXdjiucAUubPPeekJTXG6HW
         Kpmw==
X-Forwarded-Encrypted: i=1; AJvYcCXdYkNHVxsilTv/rpkqi+s3mN/qZNhhEWl3ByCURDiWMb1PnP7CgT0c2FdoNgI0Jc82/id4fqLJTkbiIt/XbfFC@lists.infradead.org
X-Gm-Message-State: AOJu0YzegK4oRUfEQE6CZyH37rCP8i5mwMKT3SE6x6Fas45mbLPTgKJd
	bW5hpeFqM08PuS6cpPEz0egsY3mGYJRCYN0txNrl+8o5vxu+3cjbreSbb+OQVRyWHfTPezFjDTF
	rIac7qV20hfd9ikEQC6pobrKURal3JcFIjlEC9EFF+g==
X-Gm-Gg: ASbGncukq5XYe6EtRZcny+bCAbVOR/y4dXCw01FDyRRJVOApmdODT18KMa/X/+LASgA
	avo4ASGg+iIoot8hu5/jS6HrHz13WA1/NKEPzI0DmMIWstxxHqa4oKZ0E8Cl+Y7ca26MXtVeKnA
	CgpA5LZNsWBo92mE7QhkMgJwJjhaMbvrKUONPADX6k9fBFLYocU3f4BCGgsTe5IKgjz3axkLTFy
	KyRGafg50+vsyat2JE5Fo6iWviEqEo5aQXgusO/Yw==
X-Google-Smtp-Source: AGHT+IHrxYQ9lAwrAdQaAqwn1O+JAjRD1WZ/bFkPUNTQEmfnnv60+IjtPt4OC2P/C+wu47H7hgloLf7dCT2IP6oTbGM=
X-Received: by 2002:a53:5009:0:b0:636:2420:d3ce with SMTP id
 956f58d0204a3-63ccb93456dmr13963269d50.51.1760353741929; Mon, 13 Oct 2025
 04:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250917063233.1270-1-svarbanov@suse.de>
In-Reply-To: <20250917063233.1270-1-svarbanov@suse.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 13 Oct 2025 13:08:26 +0200
X-Gm-Features: AS18NWDL9Q6dk2HPqdUsVDURwgZHNk0vQNVjiF3dETSyBPsHFLwf7APcaD_mqAU
Message-ID: <CAPDyKFpus05RAkYAoG7zjyvgAJiuXwRt3=z-JB5Kb7mo0AK4vw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add watchdog support for bcm2712
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-pm@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Lee Jones <lee@kernel.org>, 
	Willow Cunningham <willow.e.cunningham@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Saenz Julienne <nsaenz@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, 
	Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_040903_360621_39BE80C0 
X-CRM114-Status: GOOD (  18.04  )
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

On Wed, 17 Sept 2025 at 08:33, Stanimir Varbanov <svarbanov@suse.de> wrote:
>
> Hello,
>
> The following patch-set aims to:
>
>  * allow probe of bcm2835-wdt watchdog driver for bcm2712.
>  * prepare bcm2835-power driver for enabling of v3d for bcm2712.
>
>  - patch 1/4 is preparing bcm2835-power driver to be able to
> control GRAFX_V3D pm-domain. This is a prerequisite for the follow-up
> patch-set which will add a v3d DT node for bcm2712 (RPi5).
>
>  - patches 2/4 and 3/4 are adding bcm2712-pm compatible in MFD driver
> and update the dt-bindings accordingly.
>
>  - patch 4/4 is adding a watchdog DT node for bcm2712.
>
> Comments are welcome!

This looks good to me!

Kind regards
Uffe

>
> regards,
> ~Stan
>
> Stanimir Varbanov (4):
>   pmdomain: bcm: bcm2835-power: Prepare to support BCM2712
>   dt-bindings: soc: bcm: Add bcm2712 compatible
>   mfd: bcm2835-pm: Add support for BCM2712
>   arm64: dts: broadcom: bcm2712: Add watchdog DT node
>
>  .../bindings/soc/bcm/brcm,bcm2835-pm.yaml     | 28 +++++++++++++++----
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi     |  9 ++++++
>  drivers/mfd/bcm2835-pm.c                      |  1 +
>  drivers/pmdomain/bcm/bcm2835-power.c          | 17 ++++++++---
>  4 files changed, 46 insertions(+), 9 deletions(-)
>
> --
> 2.47.0
>

