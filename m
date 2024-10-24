Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAFFD10380
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 21:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MylHOwKXaTo3xQDXg/sSZOBifyCTeLdawXaFYKq87vU=; b=mZsWTPbigR/HAo2THmB/MtdewR
	k4R2D+HOO9OzYZTH0rZwaT4TEQOdCIrSt8pxqSDM8Rm3kyi2wXQhtNMuFvMA6AQlFp1uZG5/tr8r2
	AOgJ+MqHIDmjO/IEhXurw66CJQElJp9aL737Nrpq0AkobMdHcd5ybAWZT1UL33XRVYxQnAVU84hpe
	guFbF8AW1AFQAFA/fjaH7bssQ3hXXRStKHroThhNuLUZF4h9fniuzxzFtjsI8SCKIRlyM/+JvGT5z
	s5dLNBZHw/SdFRgHXLRfle7i4FyXGLrJB7sxq+0AXiIpxwaHJv9fa+lmG07jxflLpoOPiAU+hjWM5
	+Calxswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t453K-00000001p19-1ktm;
	Thu, 24 Oct 2024 21:07:30 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44ka-00000001mcj-0OJK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 20:48:09 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53b1fbb8be5so1605524e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 13:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729802884; x=1730407684; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MylHOwKXaTo3xQDXg/sSZOBifyCTeLdawXaFYKq87vU=;
        b=mREphOFZL2/d/bw7MGpUoVimLoGMGt7mU6XsHDCJ3pdyvbzzkkht/+EX2OJQUGvPDH
         JCH4LSW2t6jV+YoD7+Z1h0LUu2SHUFLDN7YsvLpUE7amY450oqAPyQIhwRf4S1bjREzn
         f8qs7SqmIQTAJfr2IYMc2C6aCv5oI5Y327ZCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729802884; x=1730407684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MylHOwKXaTo3xQDXg/sSZOBifyCTeLdawXaFYKq87vU=;
        b=hq+59hRorfcAEsB8gW6rnfhL7jtqrWk1udvSW7CyXGJbCCg9c/P9epbjpHgitouepK
         hnxMU6mw8ZpuTEbui3QvG0RgXeXsyTUPtuZCHYBjGgh28xYuYkWw2iFhu2ryJZLFaD0w
         +10m7fVqjdHrCiChEQsoh3ofn5G8nLetx8wxVk7URX7PCHYWaGJLV78okAKC9zdjNhpD
         WqmCE4D7TaCjXNgYuXB2hK8Ak9aNCr9BBBXfKliLFsRcpxLMc+jbOgJb9n5ZyYz2080N
         Wg5d7qUvXweHsA/iiWsAmQrw0HSLUVGwRFyLRWHx0zKtB5ARN9VMyU7D9xF70lSFcsqf
         0JxA==
X-Forwarded-Encrypted: i=1; AJvYcCW6P20Ec+QL9RPZvq9JomVZ//ilpCXewavSDqgl1Ccw4O9q+Ibf0ZbuFhf0yvvYejThOO+UCC9mkS0nyS9QFFsO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6rwusvqpzs+6eNoPlQjvSDiWYy9dOpIejbKmides4aHbpOQ1j
	Lo9RRc/Ybavlg9FZuiDXplT0oBZe/al1/4hyvSLW4cW5oZ8y37eoMVMiziBBOXs7jDtmoRXb7b/
	8Vw==
X-Google-Smtp-Source: AGHT+IGaCNLLIr/Hh7MW9JQH8yEyFTEZ+I6J+7pv2Ky9AsD7/3n+MMlIwtczWN9kR2ujeIhZrE69FQ==
X-Received: by 2002:a05:6512:ea8:b0:53a:1d:e3bc with SMTP id 2adb3069b0e04-53b2375d07bmr1230316e87.26.1729802883729;
        Thu, 24 Oct 2024 13:48:03 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223e5514sm1496910e87.46.2024.10.24.13.48.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 13:48:03 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53b1fbb8be5so1605458e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 13:48:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWb4oNcauXul5jOsSNpPftZnvZl1/crXJJoK/8ghO7owiLFXkU35/Dw4O+1j7v7vKvpn3AG9sD40Q3ldXp7ONu@lists.infradead.org
X-Received: by 2002:a05:6512:3b8e:b0:53b:205c:e9ac with SMTP id
 2adb3069b0e04-53b2374a94fmr1177376e87.20.1729802881828; Thu, 24 Oct 2024
 13:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240620-igt-v3-0-a9d62d2e2c7e@mediatek.com> <20240620-igt-v3-8-a9d62d2e2c7e@mediatek.com>
In-Reply-To: <20240620-igt-v3-8-a9d62d2e2c7e@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 24 Oct 2024 13:47:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTsPBQ7Qp_oQmBXkNY==KQWZdN7VYbuVPoBTHhMvzjUQ@mail.gmail.com>
Message-ID: <CAD=FV=XTsPBQ7Qp_oQmBXkNY==KQWZdN7VYbuVPoBTHhMvzjUQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
To: shawn.sung@mediatek.com
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, 
	Bibby Hsieh <bibby.hsieh@mediatek.com>, Daniel Kurtz <djkurtz@chromium.org>, 
	Mao Huang <littlecvr@chromium.org>, "Nancy.Lin" <nancy.lin@mediatek.com>, 
	YT Shen <yt.shen@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_134808_179514_6966E8D4 
X-CRM114-Status: GOOD (  12.90  )
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

On Wed, Jun 19, 2024 at 9:39=E2=80=AFAM Hsiao Chien Sung via B4 Relay
<devnull+shawn.sung.mediatek.com@kernel.org> wrote:
>
> From: Hsiao Chien Sung <shawn.sung@mediatek.com>
>
> Always add DRM_MODE_ROTATE_0 to rotation property to meet
> IGT's (Intel GPU Tools) requirement.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT817=
3.")
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.h |  6 +++++-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 17 +++++------------
>  drivers/gpu/drm/mediatek/mtk_plane.c    |  2 +-
>  3 files changed, 11 insertions(+), 14 deletions(-)

FWIW, this patch got into ChromeOS's 5.15 branch via stable merge and
apparently broke things. As a short term fix we've reverted it there:

https://crrev.com/c/5960799

...apparently the patch is fine on newer kernels so maybe there is a
missing dependency? Hopefully someone on this list can dig into this
and either post the revert to stable 5.15 kernels or suggest
additional backports.


-Doug

