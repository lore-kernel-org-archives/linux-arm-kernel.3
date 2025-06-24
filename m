Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9897DC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=; b=3reuC6deRXKPO3hyKtjQONDIrY
	VX8JB56cnSSoNfe7A6CWbMuRlqWg14w71P8LE3zMByc3O5tH2UeX/w1cG9gs3E7HGDvlUtbMveRCn
	239cwNa1HLvYiCejMsqIIKMYjHOIfFBm18EVYy53p2f4g8h83+Z8s4iwqkMcyfnZK8Veudx9KizNy
	kjtrAbd6gZUmTF2cB0T5Frkwyr7oX/dtvsQ6rBIccGCb144r8g6iNZILVDjBZ8DAe3fSm86oYnbjJ
	kfGky4tQ/OHjQiPuM5qzfpTROo846wuqhsS5M8DtA4NwbZC1sE85tLE36LZzsh/xQshaQVA1eEGEJ
	RBraXhaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBFH-00000006slw-2dj7;
	Tue, 24 Jun 2025 21:31:59 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU94p-00000006aMG-3lUU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 19:13:05 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54998f865b8so675168e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792382; x=1751397182; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
        b=oJRurW6bIjQ8xqhRolzd+EZcPRQH14CuulKJccSZl9cDJ5mBzXefXENCyfsHshNId4
         5Dr/utAh28OqzkMlJWW/1RqRjw3tmUsPzqeAWRGzWySro1rNN7BmmtxhZj/Ctnz6a/5r
         M62j5pelv3jhCXYHUUFL0TLe4EMYb+4MmaRYMBeJZyvcoPhZd3pr2oz3X4pAB0TYWT3j
         SblgILZQKjYM3Y9uEGJH78e2rezc51qkZbdzDg4RTDBT53CWMn8TNC9TaRu4KGrARGLp
         w25n09BTk9CFbIYLGVdsnvAVh+df/9nXl1WQTtJ7TQSm4Y1SHkB7NMoYZOLAC9D6sEYK
         QX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792382; x=1751397182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
        b=LI6YuqDAcrAaSf3CVnk/sdXXEC+atTSwMlixdu+6jwplGYgdDgOI6TJWtMgzytUqQD
         dv60eybw2LJPFLvdxlYD125kckOAF2RUmX76kMpvy6qW78A4vXLIOMX1vCRvLUYWOj/t
         9gnErmIYkM05+Rfv5oKtd2QsgQ2xEHtOm3UzaFgDJavSGubV3o5jOHfJPa5j8bD30mo9
         je+aFuy9CRIkTE3WNmob5gN8kVAwf/sHP0NOAg+iZWovGrWD6pX7C3BqgyXGSiXJrRD0
         ZRscDOiUmcO3hDL6ttfOvye0t4E/+rBGiC6jP+KL3LarbBBuAthvMGWR2rVTeLn2OGOv
         EfOg==
X-Forwarded-Encrypted: i=1; AJvYcCWosJoep0DsDx7xHjWoB4oVPUVe/ho0s0gFi161wDaTAjcxxWC0obUUPioaUQA/3YGdSR1KFN++08Y4Wr8Bz5jh@lists.infradead.org
X-Gm-Message-State: AOJu0YwXImQ15bsmus7IOxwTYNnL6wA31kMqWJZGYPTtp9opzx8PkKdk
	SeVkA7ngfmmJ4xkIHC5Iyyp2vnnx94OkH/QzIqNI8nOAwO6FnBY8+lzWomr3C78B9h/mzoOjOzK
	WcRcgZ/QcbC2GS+Gu9s66JMeNDB+kBSV+Ub9IEAwMBA==
X-Gm-Gg: ASbGnct5mMKDW0wG6ncbdEbsKlidhdIAY0Jl59VLRCNTbcKN7Q4gSOTDeT984Xaibhv
	wkoUL2S3OZkd7UnVoibCIiiaj9PdmLrrDpeHuD/jwZ/Han9JPOCxz5ubjk8e10qCZruUuxD7c7q
	VJwVd32kAPBghmkZvUnPlvkKcEfkHDYVDpS0/AG/q/b0M=
X-Google-Smtp-Source: AGHT+IFcvsv4Jx0wPVU5q9HdOKD/NjVsRLZ8GzOGiSq6bCzhKJUr6IeEsytMxz0Nq3UnxW9fjOmi1xt9+Qqg6x/9RLE=
X-Received: by 2002:a05:6512:1247:b0:553:35ad:2f45 with SMTP id
 2adb3069b0e04-554fdf7c090mr5733e87.50.1750792382134; Tue, 24 Jun 2025
 12:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com> <20250619-b4-of_drm_find_panel_part1-v2-14-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-14-0df94aecc43d@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:12:50 +0200
X-Gm-Features: AX0GCFsyGEH8PEzLkMow539_Cj69jbmDRSN9FsVHKoXlbloZW-99abb_OrCBGA0
Message-ID: <CACRpkdZM75HEZ0DACqC3iY7S1gLurw29Z--C7TJxUVxPUTuNqA@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] drm/mcde: Keep up with refcounting
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_121303_943889_C4CBE27B 
X-CRM114-Status: UNSURE (   9.86  )
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

On Thu, Jun 19, 2025 at 9:19=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Put the panel reference returned by of_drm_find_panel()
> back when driver is no longer using it.
>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

