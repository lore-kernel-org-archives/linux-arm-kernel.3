Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340AFC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=STF4EnqDyXKLMLeHRmPBDx0M84uZz7Y9ipuUY9uInvk=; b=yNTIbb5AjNQlNfemROl+RV3F6X
	fYBCrg12UVyVAiTksbe1/pqUizbe1jb+LN6JZrUcy4ooNw33m+4QIn3h0iqe3AcBHGAuWRcLLOlP1
	XRSyhtjoS6zLTYc9f+kVtSfKoMQticcXGzlIL0rEPODhgC3B9V7Cy6gJo025Mcs4r64R+5yDVf7CT
	E4eoDCbmIxGzJM0QcZvu9p2JYRYnFh/Mf2PVGHsteZ31kMnEIqXS8VrkAyvvUuxjs4llz1lHgib4T
	lo18rxJmNwf6d5XuTvKYvFzE9mvHIKIrTuexgzzfa6bKFvbsf88lA9wWuFirEpm31a2NW5i3PC6FS
	zopxwhmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZuH-0000000Fffd-0tdQ;
	Sun, 20 Jul 2025 19:41:09 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZrr-0000000FfHb-1SPA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 19:38:40 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-73e82d2ec21so1492717a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 12:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040318; x=1753645118; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=STF4EnqDyXKLMLeHRmPBDx0M84uZz7Y9ipuUY9uInvk=;
        b=rXP/u6B0QuvTozELOuv3lmn4JmFgInb3caMPjEzOfbEnpr37rqVwy2/WFGHFNP3apl
         S1lRVGesJn0r+JMyhYyOxHQaPhn3BziHzX0W6A4hUgQQ9djVhTPNvOiv7j7thqigGPXu
         n3CuMGx++wDjA5tSL3JIRmNuquoL121c1HDJazNWDX/ldSEQFbMYUvdIUsx4Cl4Vb+1Z
         aOLZ2Nnwh2g1FuM/lrAniTDRxUIXmoYbCt/wZxCUUgmYsiVXpzNH8lzrzcQnOt5aSOjC
         NeV9Qmjti8iYZ5UjRzG/MRZF2f5Gp+5gYLN6ngkkpvo+X4SL0nF9MobM3pnfeITRKhdl
         YoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040318; x=1753645118;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=STF4EnqDyXKLMLeHRmPBDx0M84uZz7Y9ipuUY9uInvk=;
        b=C+m48fh9goDDVU519aovawR7REYIUmmAoouuSvADJasj363Ru6zS0MKuOxvFuode/D
         FCJeaQlaFWl1DFZ3CJAfybRtlxp+bum4Yemuz9E6NihuXHg7GZyC0WkqG/LxiWj6Ddo8
         eFUjZj6ZcFPSkduqYRxxbP7+AwEFjcNIPa4eC+0rQbpdYNsu3VnEi1i8B1bjegud6H02
         DhxCvzCvmjTO1CqvbyD5fqJxNc+1FwfoDGmHxoUrSs05pF3NmHL9wEfmWoHB8i8O/ffP
         wTFDRlaosDK7t87LrRBVoQ26XyYV+ZlWOmWYrbdyH8lqCLqIpGTuci0v4oN5w2xtV3ZP
         S1zg==
X-Forwarded-Encrypted: i=1; AJvYcCXa0iRd1KOtXH6Ema+98xVCocFTYvpMpgcxVssLmR8fSCW5bq3l3iiEmr/u2coxzD5Lo3dJFj711PUg3XtpYKHx@lists.infradead.org
X-Gm-Message-State: AOJu0YxNjCaCaCB75bmclHTht/GrpG8Nx0KjOseM+kAXC6pfrTwN76s1
	4nS4sRwawHVTb1XdFmUMM6O3B9uNDA2wpNDiJ9DOaHUg4HL0gh4hIZ0AmyZWzjfFQJE=
X-Gm-Gg: ASbGncthL3gNK1CaUrakd+UAW2phFp4v8Rrlr2VHZS+AY2JqnUJ2SKyiaUbz85VLIDE
	HexZ5LAZCJcXpgL1BKFcft2V3F1vobHZSRpPPznIJ0Qczv3W7Mb5niBpmoYM4jrcFWjYR/BY/Ty
	Tqcb43YxZtUuLPW5APM+c4SSLiP0W8f3bP+qWqC3yfudJYngXV0s+H4rQxPj0ULRPtcW8calaNs
	FMWtCivurAuVwv8pNjQZGRCEtJzKy7MwWqYwIbZrUBFkWX82w7i/aGKqfzpjlvgbWVwBhbGHO00
	qkksheWyS0Ce5rCx/yc9Zo85zM/s+Xy60TgaVakaOxmWDp8ezagfRkCDmHCoN9BrZROQH7T2q5a
	iWmfWLgL2mykJzitJt7MLsw==
X-Google-Smtp-Source: AGHT+IFkKgtB3ObGVLZWp4E0IcFIPQvja+e9izOMOGhmXfiPr6edCos/deJ042mUxYWb2yIkng7kUw==
X-Received: by 2002:a05:6830:8313:b0:72b:9316:d596 with SMTP id 46e09a7af769-73e751b5161mr8602757a34.3.1753040317899;
        Sun, 20 Jul 2025 12:38:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-615bcc8c2dbsm1341831eaf.20.2025.07.20.12.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:38:36 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:38:28 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH RFC v2 0/7] pinctrl-scmi: Add GPIO support
Message-ID: <cover.1753039612.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_123839_393298_E2ACB70C 
X-CRM114-Status: GOOD (  12.75  )
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

This is version 2 of the RFC.  The main reason I'm sending this is because
there was a bug in the first version where it didn't calculate the offset
correctly so pins and groups weren't linked correctly.

I've also fixed a few style issues that people pointed out.

These patches are basically as ready as they can be.  The remaining thing
is to figure out the format to describe it in the device tree.  Actually
that's probably already done, somewhat because people are already using
SCMI pinctrl?

AKASHI Takahiro (1):
  pinctrl: introduce pinctrl_gpio_get_config()

Dan Carpenter (6):
  firmware: arm_scmi: move boiler plate code into the get info functions
  firmware: arm_scmi: add is_gpio() function
  pinctrl-scmi: add PIN_CONFIG_INPUT_VALUE
  pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl-scmi: Add GPIO support
  pinctrl-scmi: remove unused struct member

 drivers/firmware/arm_scmi/pinctrl.c     | 142 +++++++++-------
 drivers/pinctrl/core.c                  |  31 ++++
 drivers/pinctrl/pinctrl-scmi.c          | 213 +++++++++++++++++++++++-
 include/linux/pinctrl/consumer.h        |   9 +
 include/linux/pinctrl/pinconf-generic.h |   3 +
 include/linux/scmi_protocol.h           |   2 +
 6 files changed, 331 insertions(+), 69 deletions(-)

-- 
2.47.2


