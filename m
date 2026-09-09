Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F1CC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2je63BbknUokaDi3WpiVqNteUMA8vRZHwmgqRUZSpI=; b=D3pxhRiqD9KLamz+MPKWWXczmF
	pH5E81gvENV88ETTkI6Ag1GKfOi1hAfKeIqmJVgxhMk4SVy9OhjPyLb9InJtxk4+F0i6YUuyuZCnB
	W4SF8he05NCXVTEqnoCqQ+df8opLYcSHHS7dzrWuKgqpXFs4vcBQ8UadOdxZvrmRa+jIXllYVM62B
	9O8g8cJBziVi3chRZkKDhBbonytysxpqj/QPflWB1pu/OvdXNfkweZhmv1BxE8FeSwADOsn3S0fxo
	QY6Ppy2j663RhsOeWiDWgVpzPDBd9vLffCT+IAwYfNpiCwz21miQNS3NY20hvIzkz5Ne0Ufn1kVd5
	PNPyRu8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DMK-0000000B42M-2cZj;
	Wed, 09 Sep 2026 08:08:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DMI-0000000B41r-1YxT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:08:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so65460915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 01:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941321; x=1789546121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2je63BbknUokaDi3WpiVqNteUMA8vRZHwmgqRUZSpI=;
        b=m1LTsFMqb9ZTGhHmh8OFO0ayEMAAvjequSjvrhB6plqLkIcRXHoJraPDaN7OOxFLyb
         YKsODYjJ9QBVVGwGGHDU51J3xUY3z4ZNkyppjVjMdGaEYiFzVxZk+Rc9ZWqenlH3HCrR
         YIcykNIS4NSbOLBDmGE4Hw1FgBrbgn6gVzjoFvbSA+Z4x8qM1gANacREm26TpxqfcJBT
         jJIiBaNbNoj6WGyph4HrZYcqeMZ5gaCXEkFGfdqyXVHshjWtgUXO7tRB+tLnGh2tWVpM
         1RQaRRR37+wkSfnC5/k9rtXKkGLiv+mq7nzIZ9jZZaBO3qodBNnHuu9VjPBfdPfv8Mjx
         Xybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941321; x=1789546121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2je63BbknUokaDi3WpiVqNteUMA8vRZHwmgqRUZSpI=;
        b=RG9FNMZvnB4wDVUuWz/azeSXsOESOOj4noGsWNeFuWQF5hHe1wqnRSgEK9U3fw8Ehm
         95bCDmIq9i6HHG+wFZh/O4lvSR1ZOI56z8OQSTPxAJeD/aOWHVj9rRySu917D8zzpERF
         nTKZOerDTEgRwEwCiR8WxwvDhZEyfDoMPHAFcCP2O+YBQVXGNpt5flX9YBlZKIykMAVQ
         XZkx3bQNAYl2/5OJAsIn4agNb2I0xopcHtqzWUwr6wTSQHcpYIZih5+2fYX4xEywXCMs
         QbKMN9eb/+O0J1/6ONx6bLF6nwiwaE6aU7NjKfY4RwLCO0wpSnmNdeWq+LYy1LBV1/Os
         l5tg==
X-Forwarded-Encrypted: i=1; AKwUvByyYh+MgVKQ8WAMCMJnY/AcEvVwgZEDL/va0zrjNc79bZzqrFWPfGeIEZveQc2+5bRa3psGRhDbmus7X7k9KYp7@lists.infradead.org
X-Gm-Message-State: AFuF++nG/If7pJ2gXvvjbOk5RUJRikEYgR3mcml+jBXFYpKggH+AYcVB
	VdZ44gvuPGx0102jjmj0Kplh8w3oM9j5b2ABZl4ffnRPCBKSIoFms+J+
X-Gm-Gg: AYBFou3ISKyGxyr+LTd85aGyLHfLpm6ZcBy44q46VDn+KynXpqJ29jEAzU0Zm2jCRNd
	M2aOF8UVcW+NnwUb4FgB4pLUKLXItkLma9jT6ctMT/bzblsQ21UNMGxgF8ikpkVGUuA6efbQP8x
	BNYqmF6DN9xlcBKQDPHWXr+eY9k6KsCvwk7GE7x9GlIjjF6JmMFiLfXwqG3ukyU5ZvDHeSRq759
	oInjXjkQ6wO/ZyNFjm5Jzlm1m/ko/vCk4VPMKEypmvrHsgxjB8Ca1tknwPVCRU1tPEGrUbmIzWu
	QpqX8afCHSuMChvBd8uyVhJGrvFhrBoJ3u4ccEMT7fbmbI/XZI4i3bkKtGBvD3Z7YMNZxi45O4/
	y7UtME1BHP3Yg6FuP1GpxyHeg5zYdI9zIORxiRhHhAeTiPbsjAkzLIKjwCvKZ37CBJQd29mc1lw
	SzYUKtrXPaGiT1iiOnkJXZ+XXhAWMSZl9hXvCzy/FdH3UbMjWqmTOiVShDwqfP75h8A9EXyMXxx
	9nl
X-Received: by 2002:a05:600c:4684:b0:49c:fc6c:be14 with SMTP id 5b1f17b1804b1-49cfc6cc10bmr303543295e9.26.1788941320634;
        Wed, 09 Sep 2026 01:08:40 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm607453595e9.5.2026.09.09.01.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:08:40 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: haibo.chen@nxp.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Wed,  9 Sep 2026 10:08:39 +0200
Message-ID: <20260909080839.2297374-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909064415.pel5dilh7nrkxz6u@shlinux89>
References: <20260903075940.2089367-4-mehmet.fide@gmail.com> <20260909064415.pel5dilh7nrkxz6u@shlinux89>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_010842_427276_64928D88 
X-CRM114-Status: UNSURE (   9.65  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Haibo,

On Wed, Sep 09, 2026 at 02:44:15PM +0800, Bough Chen wrote:
> dir_unreadable is now set from a second source (PINCTRL_BACKEND with no
> direction register, in addition to GPIO_GENERIC_UNREADABLE_REG_DIR);
> worth a line in the commit message.

Will do in v6, together with your Reviewed-by on 1/3 and 3/3. Thanks
for checking the i.MX7ULP/i.MX8ULP side as well.

Mehmet

