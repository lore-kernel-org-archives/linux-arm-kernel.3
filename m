Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902BAC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 20:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsTvGlAO2PQ4d2384bE8SL5TPdN0LR6pjGuyQRT05vk=; b=D0pDXzumGXBPFHeJRs0PPrn4KI
	lU5WxlYEE760SdPIvNmiIHIyxjIMaBwPq1knV0n9CBxXdHOl6QljpWL+qMKxPd0Iz6Jjex0KbIBls
	Bvg5pmLa7eDfZM3F6MYvB5wf8rf0M3fS8d+OOnbv21oxgN8sCsgSxkOQlCi9W+5t2y4VWOxf7oJ4N
	Vio1KSMpkFZkRHyEdrwBSjmTaIt6+7X9fouE/mdZsiFOth6JT9znZb/kaxpdwkZeX1asi7Lkw1uLN
	Xv1r2Wsl+RE6c37ySuFhaXogLeFHRkv5ardVaSNvqnmnwPVwPdYfltbUIAySvGm0Rixb61eoS41Vq
	/2YMqvlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7m8-00000005tzb-4A1W;
	Mon, 17 Feb 2025 20:31:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7XO-00000005raB-2d4I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 20:16:19 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5462a2b9dedso65576e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 12:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739823377; x=1740428177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tsTvGlAO2PQ4d2384bE8SL5TPdN0LR6pjGuyQRT05vk=;
        b=fKNgguCHC+7TP5Y5cBO9axpLNWiCItMSK2RFJpRPMhdYF3gwvLvXaHd3Mdfz2RGcqq
         g5YvyhtItrZl7B3PNFEkJkiIIPCs8C9HzyofsPWOr2tBz0tVm+e+TGKo9BDmu9sW8TPG
         ZhOMYNGv8Ld5F2UFxjsoJrD0Ek0cWVWqiKdjnArOQrxJFttx1Ydpqv8SHBqYT1TMa5nF
         mTsqBNxW9FkzHh3GhXwpsTVlky3FBVsObt0kpV4EkjoleYH8xe6qT8QWyyTSt7kvvX61
         Oo3e0GILo/VVkT2sDCGJ6jxFcxQaJyw5QPAu90bFfPbxLLbVYHnK93i7kqPgr9acYWMt
         qCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739823377; x=1740428177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsTvGlAO2PQ4d2384bE8SL5TPdN0LR6pjGuyQRT05vk=;
        b=Pe+kzexGWXYhMyirJuIVB9fhWL0uAR7n2sVsy0QkDT2k8UfMw+fjJXdPv3quTP0Nfm
         elYyGIGRwjVTh0wr2V0WM+tQIRiY1N4Kb42g+/mwK4+J1imjLeK1hn7/h0htqR8nzU2E
         wfNYqpidVYUqv2NLttsMXbh3+om3qAjjrdmOfh8ZEKzE9M2VFirgB1xFqMUuHcH3nB/l
         K0Roqm4Ohy3UfowuKbfuc44wqDpEH94fnAgWshpv8o7fvlOZs+HCPALW34WiNQaG3aOH
         paZM5lqX/eRwvIhiOS48i/kzVNzncbMdZ2L0/H0xeAkHBOGReyZYl8f/nipZjcGf5VrB
         80ZA==
X-Forwarded-Encrypted: i=1; AJvYcCX+gtbn4SPNi2qRwhZEM7+h/yBM5pxZE1X3oKcp7cpO7RBvNL+CSCylOyiRdivN0onC9LiIbdy+eJijXI3X090i@lists.infradead.org
X-Gm-Message-State: AOJu0YzmaV+Y/WPCeQUYyjkpn3FUI5ThvEAFLYApQ7eibkDGoeSD9PRo
	M22oAKXJt40tDwgGCozr+QwzYS/IMOmZOLbYK1s+EY1isig2qY1CIhr4mpRaP/I=
X-Gm-Gg: ASbGncth1XtgqwqFS5dZqUz5GxcDZh5EhjYpOIWG7Ib7KiNMh0k87zB0KdqPkckJyNb
	NyinlEGsl4Lwb2HQZe3Yyp2AISeN62HZLIFlCr/GyEj+KvLeaEKjwpXgkwFGRfMU9+/XPGb3iW4
	OxlELSceZOe3iQ16abtydCbMGhwFyCxC1VJMg4NZpOzDoAg2r43cWn5sRgnToZdd5sLydGhxEqd
	p7mUd3NNZgAIpd81lMWr5t7My1hHFxEfcwUB4tba87FacYQQV+J7+/NlAz4Chm65/jwxZjbPxIo
	YEuuKKuekbw8HOrQ06isRPc24i8Mic5pk0YEVVb57gWONcydYoAxQXpmt5JBVwrtrU6X0uI=
X-Google-Smtp-Source: AGHT+IHTW2hidZoQgaJh6i18vKP0XNh1dEQr0uYfuvR6oJE5egXcYJYKmvUHeCYrFDjACBLMSRu1eg==
X-Received: by 2002:ac2:44d8:0:b0:545:3032:bc50 with SMTP id 2adb3069b0e04-5453032bc53mr2778480e87.19.1739823376711;
        Mon, 17 Feb 2025 12:16:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545d1b9c30fsm876364e87.15.2025.02.17.12.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 12:16:16 -0800 (PST)
Date: Mon, 17 Feb 2025 22:16:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, 
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 05/11] drm/fourcc: Add DRM_FORMAT_X403
Message-ID: <njhratp6oy27walyo7qfvp6oucppqjj4ubr5xsofrz6chx5c4r@c7wrehjfvykn>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-5-90d0fe106995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-xilinx-formats-v3-5-90d0fe106995@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_121618_661441_EF984A53 
X-CRM114-Status: GOOD (  11.46  )
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

On Wed, Feb 12, 2025 at 04:56:09PM +0200, Tomi Valkeinen wrote:
> Add X403, a 3 plane non-subsampled YCbCr format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 4 ++++
>  include/uapi/drm/drm_fourcc.h | 8 ++++++++
>  2 files changed, 12 insertions(+)
> 

Same comment: is there any other name for the format?

-- 
With best wishes
Dmitry

