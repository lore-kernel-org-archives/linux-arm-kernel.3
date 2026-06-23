Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF27CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=; b=h23LyUL9Eq6mWZCbQBVz8qa5ry
	CBoK8ELYojFPEXLtNuYTC6FLgIsOidBcKQaIns8BPd82j86xGO3n1GeKWJI36M8T6KXoW6aMkhC6K
	95oyUjRV0SXNczoTJO3nVnEC8XnzMd3cv8qAezxaLBYUi2lRfZqAPbv98ZhZDcv2tAnRxqlSJJvzU
	WsxQVHdxs9Xzq7Je+9ro4YhtqGM94xFBCjmuhketwWvl/U8V1DR2f5ZTdg2A3aHwJ9hBS53oH/0sR
	WCOZaxBLnKPUu36hqvfX8XFNnk2E2n3IKPZFt6Q/dpgYGzYRRDuZsEemAjf7PeFxsp4iNx04nUn48
	yifQ0oAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7TJ-00000006pH1-0JNu;
	Tue, 23 Jun 2026 20:11:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7TG-00000006pGK-30gs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:11:47 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-37dd266c32eso268036a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 13:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782245505; cv=none;
        d=google.com; s=arc-20240605;
        b=N0IONWH5Ge9ufaQjM4F3uUiSuEOF2F0c/NTYNFoVR7EWzef5hb08uoUaohkHdwYeNr
         fy4jFx/dHrSnYgBwd1A3nJmOJgFK21GIZI/P0cg+PeSYQS92O6XJmIYeLvI2vSCOy+t9
         4ZKMpHC80G9RWRYbImvF7l9UuWMLT84wNhdsmnsR06IaeqTaoyXs910oUQbMf+85cegM
         QbfSDJYiwD46LWjELMmioae0Qk4gXkSRI5TbmJg1cOfREETwiEXkVEHFGMvF/7lHR6Yb
         /w8tkPLxtdRPW4TqsFeLVS2fN+YCLioyX4QEm8+2NeL0K15tCdnUmQFc6QlsGiWJC4PD
         z5MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        fh=RrpL1geK9Om08Z0rqIFNJPExaf1iZyWuD86IvX5N9GM=;
        b=fAFK0XBZSekOXrF3PnSN/Q1kR1HqsmZ7nfrOfczAJo7KSHXGoOOiHU+upg4I7vMU40
         aDeENCScUq+Y0monLtRJo1MTt0HAHfPmSqnQeN3F3W0DtsG7EnXzJdPqGbmfcXQURaYY
         SrhXMGzrbolMcY+CKBM+1B4QV8MOnL+5bVbriV0prQbikKDOj0gWH9Y0wXLMIDvCzvcD
         n9Nhma1oK8yAygDRuRRDvYHHsc9oFNe9EEzDwcvgpM7RoohpeID/1ZDV9nrzqW7G0tLa
         A5Ro77PkGQuLBpXUGK1nQg/fJf8Pro8Tejr2mRL8KqrUPdEmfpcbOhUiijjzO+tGdN65
         I+GA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1782245505; x=1782850305; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        b=YEfSuNbwoUevmjLyt7Vr2+Sh6MhrQ/5vN9urd4FUcXBiRG8pAJINKSySAibmmHPWCT
         /F1izNBQqKyV1PWiz/dejlrs5yZzH6DJpjiB6WZexZpZ9tc9GLpTpDW4phf12HsotrLf
         8PYUrDZReeaDA3S7Uy/POOUvomcX2BDqkDAoacol8fbjIPb1oIDPTFck5klD6aGiL9BX
         JzaXpnxMGeV9KjWX1j31AH+1cwq2JmM8m45i46R1op/2GMqWOrDIc/v8rQNHUP1TZKyK
         c2da10JaoC4h7X/G60AUF6RbilXWWJL1JAPMDt4XvtYyCch/bXWJX6lkJOY0DTUZZDA9
         Hkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782245505; x=1782850305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9AA00HARo6TTOGKX0Hmf8exd0jNlIDDEh7Vt3olSGA=;
        b=ibq/qb6CPzpfU2p1bLsdle7Ytp/eMFSM5OUCChmcMMprGU2kHPysvhUoZCZbPts0Qx
         czNdzXqH+O5mil44AFAM03ICeDQPMTvv6IFsWCIh790cYcSMCRBRQpqBTNLQYiE1b8uF
         V1/AqfuG1/NFw8ZGrIWwhLjTSGN8/0UbiwIrVNW7NwUH1t20W0NY6v4AMJYivxlNtl+R
         BWBZCrNVADNqY/kWrad/KuSW4ec7BsrUN8PWQg33Yza9U6FGL5LLu438F840am+akdfb
         f2B4Fn6RftrQ62Izf9blnAoop450fyHW7zK28lIeOD5dcKb9y7mpHerEafTOBQYQW9vM
         8zRw==
X-Forwarded-Encrypted: i=1; AHgh+RrbYoy4VB4CCYQ0pxA7+q5OsyXsMuhXKDFQt6SP2+35AXm5mpZXt/n+tHYme/EtwpWAT4Rjmi2tqyJ7zqEMvoBa@lists.infradead.org
X-Gm-Message-State: AOJu0YzqcrsWXM1yzxkVaCIAExp7lwdmgjt4zY0xNpf8IC+UQlgODohf
	YYsArlltEMACqy3YikX0ork2IsZvwO4TP6PMYtandYhBay8R5L1YNFBfp1MaQZIgK506IXBErpD
	zkjaWH7bYhagLznKJBbkx7uwRghowjYs=
X-Gm-Gg: AfdE7clr1un7kZK/AnW5gNlqKsTjKPhl6+7nnQv2OfEbeA6uh+lN7jNFRcOAZs8b4EX
	42d4S4edSQh2ZrtVt7fjjXz0dSD8/hIk1LVGW0nv2v1oJovM329x7ZOQj6EDfDh9Ihw0LAL/4tC
	U+aKr2dxhnskZLN6uKmo6fd0Mi+HBQF4kq5tJJksyhanNDB+C7J0RI7xQQ6sDKGxJ7+HPxHastj
	a6TghWQI2RK0LqPshIuQVb5p7WUaqkdqjwKXifwyzARnJRSWw3ahYYBhT7q4PLh7ulvdEbQDre5
	Qe7WJDy5pOXEqO+JF22vGJ+5YPMGJg==
X-Received: by 2002:a17:902:ebd1:b0:2c0:e2ea:6b0c with SMTP id
 d9443c01a7336-2c7e14bda22mr4283265ad.21.1782245505106; Tue, 23 Jun 2026
 13:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org> <20260619-drm-no-more-bridge-reset-v3-54-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-54-ff399263111b@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 23 Jun 2026 22:11:33 +0200
X-Gm-Features: AVVi8Cfq-bHIbRBMSxAeraOZBrOtibTj2Lvi8RI8pWYRXkS8hq20ZIX0g5AznWw
Message-ID: <CAFBinCDJNGCsyRWS7KeXyHh4Fo0K6NX6sUuwdYRoCRoLn=Cx5Q@mail.gmail.com>
Subject: Re: [PATCH v3 54/78] drm/meson: encoder_cvbs: Switch to atomic_create_state
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
	dri-devel@lists.freedesktop.org, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_131146_794832_C5801F74 
X-CRM114-Status: GOOD (  10.07  )
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

On Fri, Jun 19, 2026 at 2:27=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
>
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

