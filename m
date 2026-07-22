Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2BEC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNnBgtMvRWoIDKMpvV9eibQpg+sWb3zuYV0OsS+F7RY=; b=JUeedipTXKDpSt7u6GyQhSr0w0
	eHDr9TKZcbGEfviJ+mdYoH+VH7kE2ZUp4JWJ/PmTfFDoJyBlua8kcyFh76xbEGgYF3/kgI8+MyxSf
	jJWq0mS+B+/3yBzpGvX2yOnem5LA+bDZ3iN1c40ElcdkQhHdyJFR3X5YnQ00F7X83E0E92sp5UF+M
	67yvTppBx773+I7dh29lJsCsxmbwKrOPMiHamiJC++dzmjEhn5QT7sH+pZPknSs+MGfaA8+7vBYwZ
	uvwtoSwgtdKPdBckXpp5yXI1qqrv+a2okEjaDXSdQdfH6UOOOwrUq1vf7BZH39xtAaiOkROYeQfKP
	14QK2XWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRyZ-0000000BCb2-0dZ1;
	Wed, 22 Jul 2026 08:06:47 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRyW-0000000BCZs-1sSG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:06:45 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-69e8ea2783aso5801391a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 01:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784707602; cv=none;
        d=google.com; s=arc-20260327;
        b=VUkZg6Fp/Aq3lVOpGF/rCffNrp0aCxnxHJUZdxpo4V9YGNZ92llwHgPQesFuUoA+UI
         J1oGB3gUtDWKckkQNwDF90FCwBSKxzFo2hkvfOHhvTCEUqG5n4Fz0K1M5iz6ci0XwJru
         ntWfYGliT94tYBITh8oJV1ZMtHojItW5GS5IWGkw9JsPUOyLWaFDUTd2oBkiEYmCQV7M
         L39y2wzfYvYnSdLmpVx35OnvqWLTgE3+w9B1gq0D+Jh8IwVa30e5po5+sIikQceYp1AC
         IcysYsBGhRG7HL/A1Tcn1DZTiyhAVVFskDUV5etssdOzLcnoCHdNfLLxCMGU/XAsSQp/
         Oftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dNnBgtMvRWoIDKMpvV9eibQpg+sWb3zuYV0OsS+F7RY=;
        fh=uj47YBXA2Km+/l/vMcgF/quqMXnx7kcCgfWLzI1j0os=;
        b=eP+UYQrfTVU2PRsL7JKxralYTVQC646jWdzzRZq4PGFWpbU/vWoZSyiT6IYCzMVtz1
         +ZMSrhlxUtZ4wwy3EAqIcMCOJuq4mLmYPOj/RLx/3At1qlk7VJHFLL5pFHkC+ZsYPbJ1
         rmmmjz3UbYQ8mRqN3BRnRATu5/onY16MstjxN6PrZXo9a/yI4asCrC4YpSnkPwBNcy2n
         qkSG6JkZWcCbaXMc309Ep9FTjQlTRnVzhOHLo8RpKuIaYI8eKL44axr4vSCJXuVZ++g9
         +p1jERB3hwral8egrPUw1uXDYyMtV+QuvsMe9hCB/qOE8qdGZZX9Hiu9wnlDNemw9kcF
         V8JA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784707602; x=1785312402; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dNnBgtMvRWoIDKMpvV9eibQpg+sWb3zuYV0OsS+F7RY=;
        b=a5na9YPrODDR7svb0cxbD7Qn0nzK0EDISG6tFBSlnHZ0uC4awz0rex3taDbqqvY5Nv
         HMeyzIpH87dARIFG6m0Mdq5NNoKc7FrA+o/usjSzkMfJdSBgFaLWO7JRodQa2X7Y4Ush
         oYntSxuJi+/BIiz3JzongKVjhpl8KLCBQkHLAnq5IVPo401Duy5tXZhEOuw8ZpTqfacc
         4z05j6jOXs9dofjdJH4i/Azoq9Y4nLOIl/zy4lKSRZJIbwg6ZtCON5vBY6VZhC2DBp7/
         xMnq1hXnt7eKuexoapqI6wwXe25Q98G9kfDp8JL1Ck94nzIDvlwzodOwVqbmXy9Lup6C
         P5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784707602; x=1785312402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dNnBgtMvRWoIDKMpvV9eibQpg+sWb3zuYV0OsS+F7RY=;
        b=n1IakovkZnn0M2YVLKGlZj0PC1KGFFvuy5iVyZwYMwNiGj03xvWBh5XcF9gf3fEU6d
         je+3enQS425u88CVo8LLHeU7cwddLcRtMiTtYVGlpsIYng+greGzNJJMcm9Rz7rs7cd4
         riht1EYyFvw+F9cskkfZgqofi6XvyDuZ6WmvdMi4aehmWrVX6i8+dpTr8qEbag7RxPe8
         ID20mqQ4hLDT1VYfTjYT/9jxYZnEnvJx65aEnAPlngIjCgI60nRsoL49y9D2azvzkqoy
         TYXm/8INfe+bn3ZYKcbQA9VRRDD/9Zq0BHrGEs5hvpOcp05LRDKmVwEqt+CET+r/Vbd1
         DDLA==
X-Forwarded-Encrypted: i=1; AHgh+RrnEYgnAhu/JPtcR8x4bJiiFXYKctQObNFBpTipC6nccGZzUJcYEXmKaumUWx/2kcoB2MrOdvwgltHZOX/tAPj6@lists.infradead.org
X-Gm-Message-State: AOJu0YxY7J1yY8s6KtFKnQsQ8YEDIWS7XZt25tCymzXgytNUAapBINQW
	1HkiFjQZCsT9Sg/RwKBzcyI2PrQutpzGYjS+0dOHuCqy/3WNhdp6Ci37KWqVPPuUSsOSz8LxHCj
	trUexTx1k6qxSlG4kdGoaltm5Nao4yZnpj3uduCv5gA==
X-Gm-Gg: AR+sD13oQ1iUEUj9SLxl79tRBfK5kKDrW1lbxbA32wxPlaYZH3Skkz4JUbxA3FltTNI
	l8Gi8CqCrmZmPg6RMaOtLjpz+vjYHs/vVDLNwd+Di9+LxSrSCo38seNoie4PmxB4ykyIhxmG7hG
	pLNoZ4nyFHPlgnR15vT/+80G/+qpiSzwTi6LMpgGVMsUnK1GsW4skf6ItR8ZgWxdIZMKC1KHEO7
	XlKZOUlO2kQSwO0rXjaxAm9h2rNEeMtA1g0r+QCpvipoeok0fLxNDSgi+ZCjDu6/mPGuPzxBVaY
	FRohuil3CLePHtAF/WSlS2D8GA01
X-Received: by 2002:a17:907:72cd:b0:c16:3187:997e with SMTP id
 a640c23a62f3a-c16b46ade61mr848716466b.7.1784707602465; Wed, 22 Jul 2026
 01:06:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
 <20260721-synopsys-dw-dp-improvements-v4-10-f0f4a4ede712@collabora.com>
In-Reply-To: <20260721-synopsys-dw-dp-improvements-v4-10-f0f4a4ede712@collabora.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 22 Jul 2026 12:06:33 +0400
X-Gm-Features: AUfX_mzBw-mJbEQ5WnpY1t4r4yErUbUBJRWK9UICtFzIcvZnEWvrXDi7mlfnRTM
Message-ID: <CAKTNdwE6OOPHYpMQXYfWPtdA26AiPJjSi6N_J-yGSU0mSL7HSg@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] drm/bridge: synopsys: dw-dp: Add audio support
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Damon Ding <damon.ding@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_010644_497963_630235EE 
X-CRM114-Status: GOOD (  14.54  )
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

Hi Sebastian,

On Tue, Jul 21, 2026 at 9:52=E2=80=AFPM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Implement audio support for the Synopsys DesignWare DisplayPort
> controller.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-dp.c | 230 ++++++++++++++++++++++++++=
+++++-
>  1 file changed, 229 insertions(+), 1 deletion(-)

Thanks for your work on this!

Quick question. It looks like the audio-related change along with the
DT binding update is independent of the hotplug/PM part, and shouldn't
really depend on the (large!) USBDP PHY changes. Would it be possible
to split it out as a separate mini-series, so that the whole thing
doesn't have to wait for the fate of the USBDP PHY series?

Best regards,
Alexey

