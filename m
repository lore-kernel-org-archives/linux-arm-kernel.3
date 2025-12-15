Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEECAD5B85B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 17:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrDNYX4hqSI6y4PGIj6+dxdIojaAEYXvHqNt+FhuuhY=; b=zbTHlnq7IYjv8zoT2Q2Y8S8Ye4
	cbuEcogVaaHvbzIERE97VD40jAao2aVY0o9aD+jC87HwMpV9l44wntGN8Prr0uRxtfBvcZ8DQQxaG
	2jxnbLuBS8xGCgy43NXyOW8wIvic4P+kBvjMKIhp/CL8uQQvFx5COdVZngF7lYyNMVv0owwIlgJ46
	ajze/5SLsQkcOKr4zugxDv1VN59U6Wwtj06/+q4aT3z8OBTb6T1wTuo5sHmHpCItQx73GoZIuFMUM
	9ZsPgiN6rJGUYVnuKhyRnq6p1F5sE+CMcm8/n6yGwAEyafsmvk8gnPvvsjcRAXrxGzpTTf7h4Zc2/
	KYgCd6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCp1-0000000466t-2dId;
	Mon, 15 Dec 2025 17:57:23 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVCoy-0000000465u-03cU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 17:57:21 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4ee1939e70bso37357551cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 09:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1765821439; x=1766426239; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JrDNYX4hqSI6y4PGIj6+dxdIojaAEYXvHqNt+FhuuhY=;
        b=iubR99S11MXFCXOneKzN1xeZq1cjGsUWI2aC1UqO5nwpZraufEG0uoOkstKeh5Mv88
         LuR3hL4suQ8b6/Ath8NAb1dphefM8PV45sbU04M6Lv7QJK3wtg5O54iiFA3H/mWr6mHx
         w0uiRFjuZZIHCumZ9oWjDjaASD66jclK2PGfCdF6ewBEGXlWBAA1wmTYp0x4fSh4zYlr
         3ZUfqlMkhJfqKyqfiH5di3gcnFcmrYzG+NusZ8hZEQ3ouWHTpByY7hjV7nvPhAUGlMlP
         3nJ4deEqmWERAMQFK5JIApntrqRNRFirVHwNAbYrrF3IkQWnzbeIUuYKnMxobSbU2IkN
         VVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765821439; x=1766426239;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrDNYX4hqSI6y4PGIj6+dxdIojaAEYXvHqNt+FhuuhY=;
        b=G/ZzRhpQneOMCLxYY5xC+4M89PttekHP3kPt0vsrnkRyzG/3A2CN/hjII9+jEeoEbP
         LSS8J1TPuj+T4hW01+8ojqD+FK0hbOytitjo7MO6elSgyjk0iKfBY+yh4nmztkgSdpcx
         cL79672SWuGPcCSVur2hOPvp3T3wv8k9ZrFvTH9h5u2DcCSMyGp74Fjd088UiURkLHdR
         jFwuQ/L8dCe0Bg/0NEpwvwa4pY9oG9NKcBL9J7TOOoN8ydeTft07OhCtRbuCODeSZL8i
         hm5q/CEkfgtci8Yc2EwoGNKEg/cle02N69VojplI/l/yePnKWMOgHkqnK66rCJcs601m
         7xAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+gMzJvpRq3jK7ejEbyRmDaRRt+46A6nxW7tA6zaRBvoZ6CRLRV6oQ8oiRQSNmf05Bc8s4lnPHfqaZwbIgy8Ss@lists.infradead.org
X-Gm-Message-State: AOJu0YyZIMy0h0gF+nt8ONdy0yHXGupIxaYm0d+xoDKBQ90bPf8agrrW
	mCdBZ759qyq4fIw1aYgIP9O9T2Ji9UR0sUEVDML6ZNKEuq3QXqhsRiVWlttpnKB1KBy/LuKi31Q
	3fZcG9icw6hAD3Kxrqr7I2koFDSY+VlNHjvvdfrXB+w==
X-Gm-Gg: AY/fxX52eHrH+tMSwGKG/PMkHZKf1c50YewuolBlKDs37BkY8BDWyHQb51S+Plts8DC
	1Z9vgLRAWI24OxIOORuhJzgFrHrW6oUhk6+Xm1FRW9NNyom4uL2Z6Q6xa+yBXO/lMPbj/5pWxs7
	YuKYELzcY3opbuIndj/sXUamj+txTieRkTRQ3AGnjEuUQ5JApFAMdo8G6fliUArB8vZ6y80Y1tj
	3TZKdnWggKCk0+u57vxbNhiE1mkAzBIgOuzk7MqSsavwSrW/aDWKNDhMbl7V85KKGCjH10=
X-Google-Smtp-Source: AGHT+IGFC2JQ4V1SECaV//h1EmhEsxokdnKGAqKcXjQqd+tP6HAhA9hYS9lkjNvisVQC+6Z2K5Vl/WM78Ka8I+v/P7A=
X-Received: by 2002:a05:622a:481a:b0:4ee:213b:3391 with SMTP id
 d75a77b69052e-4f1d049ff6dmr180679491cf.20.1765821438771; Mon, 15 Dec 2025
 09:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
 <20251211-vop2-atomic-fixups-v4-2-5d50eda26bf8@collabora.com> <20251211224102.5e079d70@pumpkin>
In-Reply-To: <20251211224102.5e079d70@pumpkin>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 15 Dec 2025 17:57:07 +0000
X-Gm-Features: AQt7F2oFXSBO4SC0UxvNyq3w7s43LPnK4r_t9yQh-dyuuj24u5z5H133-vHKl9M
Message-ID: <CAPj87rO45oAihxRhshwvP=9N6oDtd+yRN-R4M3=TsFYmwjr1cA@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] drm/rockchip: vop2: Switch impossible pos
 conditional to WARN_ON
To: David Laight <david.laight.linux@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_095720_054782_78601CDD 
X-CRM114-Status: GOOD (  13.09  )
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

Hi,

On Thu, 11 Dec 2025 at 22:41, David Laight <david.laight.linux@gmail.com> wrote:
> On Thu, 11 Dec 2025 21:40:32 +0100
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:
> > -     if (dest->y1 + dsp_h > adjusted_mode->vdisplay) {
> > -             drm_dbg_kms(vop2->drm,
> > -                         "vp%d %s dest->y1[%d] + dsp_h[%d] exceed mode vdisplay[%d]\n",
> > -                         vp->id, win->data->name, dest->y1, dsp_h, adjusted_mode->vdisplay);
> > -             dsp_h = adjusted_mode->vdisplay - dest->y1;
> > -             if (dsp_h < 4)
> > -                     dsp_h = 4;
> > -             src_h = dsp_h * src_h / drm_rect_height(dest);
> > -     }
> > +     /* drm_atomic_helper_check_plane_state calls drm_rect_clip_scaled for
> > +      * us, which keeps our planes bounded within the CRTC active area
> > +      */
> > +     WARN_ON(dest->x1 + dsp_w > adjusted_mode->hdisplay);
> > +     WARN_ON(dest->y1 + dsp_h > adjusted_mode->vdisplay);
> > +     WARN_ON(dsp_w < 4);
> > +     WARN_ON(dsp_h < 4);
> > +     WARN_ON(src_w < 4);
> > +     WARN_ON(src_h < 4);
>
> You need to do something when the tests fail.
> Carrying on regardless is never right.

When we arrive at this point, because the load-bearing assumption in
the comment has not been met, our options would be:
* display random incorrect content, and hope that we aren't reading
out of bounds from a buffer that's too small
* turn the display off
* there is no third option

Which are you suggesting?

Cheers,
Daniel

