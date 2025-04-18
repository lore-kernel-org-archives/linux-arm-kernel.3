Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C29C369CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 09:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFpo5oEBW5stbppkFOY++LlhDbuxsd6jJIOfBbyrv08=; b=wVYmy/2crGhoIoye+UUY7uoUy2
	E1EJoF0HKG4tUWzMcjpnIX7Gm4yh/0DFvegEawKJfA8A+Blv+ohLa3Z4hgLdRNmugY5omU9OKPjOM
	iZhiQm0ZTbNMZXS/9dWPskrxBQTgBpJ7jrHwLlP3U+w4ok1to25SMmX46pAXh7600M/aJz4SVmmAO
	h2vPv6IFA0gwcEdM3sJkj/3gQCTP2JgTKGttyXFHwVXPlh8YLBrd/4vYCXRk7/vLqFg9jGIpLmP34
	cYyNgZjbHeWJga2SvTtC5wlxQDSX5g2z9SbvBVOcuyezulixSMkI32HcTmqsSu5ySp346l6GeyKjf
	FgCoa1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iHo-0000000FmYC-43Fc;
	Fri, 18 Apr 2025 09:45:28 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5iFw-0000000FmNi-1Jnw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 09:43:33 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-47686580529so18680291cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 02:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1744969410; x=1745574210; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kFpo5oEBW5stbppkFOY++LlhDbuxsd6jJIOfBbyrv08=;
        b=XLl6E963cOHxUsh0/urNbRilqU0UosY1P18ujE/ZDq9MXVGyw3wKtgT7fBDi2NRrUT
         Vqs/MNO7u5/bRTNZBeOwEuJ0cjAvOUpS6jC/rot6dcPyOL8riG2EXie+We55n/htY8Jw
         8bFiEnRI8YAcf00uOybDeLlkW22KPoGTgAdLvNxvOXzHEWKgdy8pukRmKpKad1Y7Ql4V
         a2xFJgu8dpMIxPV3zZiVj8wxtbgfRjB3UEP7S1XpB/wUZmLoiS4HssO+VxC/M7xDut0G
         1ta96akGH8NYF1baFMXCxaHxFlvPfQ/tKFpioGoygI3rihyvT0Yu1qw78WHYc+0qeNMh
         ed1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969410; x=1745574210;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFpo5oEBW5stbppkFOY++LlhDbuxsd6jJIOfBbyrv08=;
        b=bd+IqJpw+nfLyosa5faWXoFgK1m0wYqtCGOhogTkowsh9OcrpoUMEajbrPLo0aU2cX
         0ZPCNfbQo0E0IlxlpqkbR6n3/GNjjND8iq/D9XXa6iXO2clRaGKkmjPGyoqsiTKwUr2y
         7IWRMxfNDvaiebSiR3Lb1FrId1O6IxOb9mBtctQYGlo+dnJXZoSLEwl+3GDRnmKDU8kI
         FwOyx/8HpNHW4XtldowT2rk2QkisE417P60oKvN63mszdUmCQkEKUTS/+tj2GHlL5DMV
         o0rVmUh5FX8yyaIxYFZwAckVXTd0lMG9qBtX7KcwHZ/Ljkks7sb1BgFEtLriI+tzUDuS
         nljw==
X-Forwarded-Encrypted: i=1; AJvYcCU2T3z09VrVMF20l8H7YRBi+XIoCsop3ZaZYC2fc7PLWuV/Le94Max7q/oYOVvwPNZm2GtCBDy+9h+5GO8kdPvD@lists.infradead.org
X-Gm-Message-State: AOJu0YxjlORhny/Y1FWnSj1lvMXqRjV5OePJI07rAQFaKADDvziRMs6L
	n7kK8H5sGbkVGIMXimsTkfOTDQbN3y13gMu6Kf1kIgyk/DmEwHmFrBcN3AgoqfyshBuPnQy8m3T
	ir3Ygi+DMKwm3EBPzRzgH6QjFj0QoXF3K4rdC7g==
X-Gm-Gg: ASbGnct7QEUTtI2ii3FHvEAMb6XQk8tweRWduPqq5Nlnak2m/gsFGfW4JBzpKX6EYz8
	iHVETSzYltK5L0/k7XOZ5zPpxT07UxccPMdQ316Xfe9y0LLFych94O2c3vmwAdi3zHmxI1YJb/C
	8a92Tp0+SkH4M201ZIbpCV3/jIn0rj2A==
X-Google-Smtp-Source: AGHT+IELNPez3z5hE7XPdAn+/JmuPm4/LRceRqb1tqN8GldH7aTJ6b0D5paprWRXm4NnYwwtrill8wPC4uiDxVjoiEM=
X-Received: by 2002:a05:622a:1a95:b0:47a:e53a:5762 with SMTP id
 d75a77b69052e-47aec394ccdmr27568231cf.22.1744969410714; Fri, 18 Apr 2025
 02:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250414095332.9674-1-mail@etehtsea.me> <20250417065759.5948-1-mail@etehtsea.me>
 <17402f2e.360.1964640c3d3.Coremail.andyshrk@163.com>
In-Reply-To: <17402f2e.360.1964640c3d3.Coremail.andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 18 Apr 2025 10:43:19 +0100
X-Gm-Features: ATxdqUGMyPtODmDTih2v_sR4LqFZ8n_GN4IoaxZBEb6HaOtqp6Dx3gQ7MviTVqg
Message-ID: <CAPj87rNDsyBfy=P=0SzTm7u6Na6BpeZSpEt1mRPhLCd6rHXzTA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/rockchip: Disable AFBC for res >2560 on rk3399
To: Andy Yan <andyshrk@163.com>
Cc: Konstantin Shabanov <mail@etehtsea.me>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dan Callaghan <djc@djc.id.au>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_024332_456972_20F094D5 
X-CRM114-Status: GOOD (  10.16  )
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

Hi Andy,

On Fri, 18 Apr 2025 at 01:16, Andy Yan <andyshrk@163.com> wrote:
> I prefer the V1 version PATCH[0]. This is because we do not deal with hardware-related
> differences at this level.  It involves a VOP-related restriction and we always  handle
> limitiation like this  within the VOP driver .

As said in the review for v1, this is not enough for generic userspace.

If drmModeAddFB2WithModifiers() fails, userspace knows that the buffer
can never work in that configuration, and it should fall back. If
drmModeAtomicCommit(DRM_MODE_ATOMIC_TEST_ONLY) fails, userspace does
not know that the buffer can _never_ work, because the failure may be
transient or due to a combination of things.

Returning the more localised error saves userspace a lot of work and
enables a more optimal system.

Cheers,
Daniel

