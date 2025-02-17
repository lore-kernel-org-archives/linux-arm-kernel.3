Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3198CC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 20:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eM01ELy6RFiGkjcxOpb1cojVzPpVE9t9t3LF3deNmc=; b=zR0deoz6CQaIpjuuw27pLaHHPO
	WNf25ARFchNCmDM3KpDdjPZ31cA2X3uFGFbSVI7sJFsJFWE80DfUiIDqPOWTRVXCd80cNvOr7JkW1
	4rY0VR6BRSbfUyFZNPBfDQBfrr6rdOp8tkGJEQzTr8a9ciVDRlnHMcyjVwaqhENOrVwzW/l9fC8vk
	ixAaXcQDlhI3Ex4p/7FyEizYU3BbdQn8OgG04iGK2bujp1hyCgO4mjzkGV3ggfGGTNVtXKbPfjA1s
	P+lrAdpdGFcTI7WXs9pXI8Vasb+YjXrhQFItjnbEuPcLuBokb648a5BDwOflbKJrIk88e2Y7wFY64
	dw1Amaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7Ha-00000005p0j-32Cm;
	Mon, 17 Feb 2025 19:59:58 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk7G7-00000005oZe-19sQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 19:58:28 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5452c2805bcso3504547e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 11:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739822305; x=1740427105; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+eM01ELy6RFiGkjcxOpb1cojVzPpVE9t9t3LF3deNmc=;
        b=taII7sGrPRuyVBHuqamikgRAGikwfAlsZTRqzgc4pSY9IZtuG6x5ncGA1JPKUxT2N8
         tuN9kBMSGlr9UzvOPIDvXGOa2kmnuat9R6vDhZxiVOEyd64AIxpe3OL91cY5H4hY3h9X
         7du5Le3y0A9VIxaKg/exCgMTH3BeL2STNz3oZQaAtwS2iOQHyVwurJL5r3VtZ9lIo+Oo
         f5EUoi0ZS6yCwrgzMn7DxmSZfcaJQcbh1cbSjE1wxWeSkMrTye4cdhJB+Y48V6k5C9Z6
         v6flEpeXhUcrTQeUAfE+wcRgNxO3oO/PtWlItiXHEspEEGgiOmt9tYjHAtudMwKMnt4A
         nmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739822305; x=1740427105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eM01ELy6RFiGkjcxOpb1cojVzPpVE9t9t3LF3deNmc=;
        b=ivz0mZZrUP9l5OlGFrLqfMUiwsvR+ru7yyTernUl05gFDaN0/1xCZZPBVhNcdp4TbW
         36YW6eRLP/Zza731m6NEiaUAnTSXfpc9aJ5amnUBQvDHRpnZLaNgKZaypLfp6061qUK0
         Gu5mXJOEh4OrNfnpk1Er9GzjnGnWGr7RqHvFXuqdIGJ76iDG6AUxYoLlq+b10/b+VZ+v
         HJ3L4PQlJ5R8zdKaY+rNnkPLHjJeBrcPTQRtw8TIx6VR/Rk0IkPW0YfWovViZgQv7q1+
         YvzPiI5D8xoxLNUSmJuUg5GFYVSJ47VcSIVnGULuqMl+bFAF5pe6pBENCeHQToFbQqhR
         YlyA==
X-Forwarded-Encrypted: i=1; AJvYcCUzPEZ97b1ZIHEYXeiZuEuX1OCmnD7UM4whGylMuNZVoKFwjsyQEqcFqrlHS3x+gmAffH37B1RtLjE6fjUhVKpm@lists.infradead.org
X-Gm-Message-State: AOJu0YzcPdrBGfkGlnh9JPN0xFo0jsMEyTu2wRdcG3r8hLWWiUXRkRf0
	k2I9OrQn5z5DkvyZ5OZ2ROqXE92gIFsoLQhArra5hgguAhShArQKlfl0GjH3DHE=
X-Gm-Gg: ASbGncuwvBwN3dwtdTWmxgD7qTqR3NTnf7zwNzppkK0cnCm254cgNdf2SZ648gpDLS5
	kjJvxmXFLP23uwSKaLrv+teAbyX6lspbZUMPY1GIhAysFoEjBokJ2RsPWbu3dJs6+Q5dq1FeSAp
	Zo90moEQsfxzOwOy/gjgGPLvFWR83eI6IGGrVhafVdZ/B217O8dWHwUroLhu/vWPmoOoEbtW7mF
	M/ZUp6rn+KhsJAmvkN2+1hpRiIELSd3PvEfZuNQvvCcgPrItxlwjKJeJCXV7DVua+f9lhGXd7kb
	Udw6d3yDnpZGvyRI+T0jPy6dxzhBTo7b14DkZ5OFYUi+PPKPL05W4daY3LBVCg1KbxwIZeI=
X-Google-Smtp-Source: AGHT+IEbKDaSdPLHIMQ9eXv6L5J9v69avK8N05Xy7KhfzTpN1ljeSBVhl0WhGYyS/jPkWJgZWNtb/A==
X-Received: by 2002:a05:6512:2823:b0:545:4cb:b25d with SMTP id 2adb3069b0e04-5452fe37326mr3210895e87.13.1739822302051;
        Mon, 17 Feb 2025 11:58:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452b496aafsm1288648e87.29.2025.02.17.11.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 11:58:20 -0800 (PST)
Date: Mon, 17 Feb 2025 21:58:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>, 
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <lzzp5cgsh3qegxtctttys3tvtr2j2ciurm2jnmmm3d6cgjei5z@rzu4p5afxf6f>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-3-90d0fe106995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-xilinx-formats-v3-3-90d0fe106995@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_115827_305388_1C9F894C 
X-CRM114-Status: GOOD (  10.76  )
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

On Wed, Feb 12, 2025 at 04:56:07PM +0200, Tomi Valkeinen wrote:
> Add greyscale Y8 format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 1 +
>  include/uapi/drm/drm_fourcc.h | 3 +++
>  2 files changed, 4 insertions(+)

My 2c is that it's useful to have YUV (well, Y-only) grayscale formats.


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

