Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993C9CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 19:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKVIGNn1cEq2YWpF5MnDqFEUCjnk9rekqsdebgbty2M=; b=fnIgN+2l3briimFKDPDMAEM9S+
	Au+ee61X7Qjk3KOLUPmLkC6275rqNHajEQnYEelEoNyTk/JEDMKIZNstdZzRPg24yfWz7ScYZCJkT
	I6Q3v6FknHpdAm0XLDGBw4c9SUOE/6KpwmyEEtso+jlAdsIyj4y/BGOuVOlhGbehlGrOGakZEPwIY
	MeL9RbRKF4O1D330zh83debDJwcklYRWIsoy6ongVAQqkhjO4YZKnduq1e8JonIQqYCkjApDVpWxE
	/vY2bPFbQpJgGmTCnlrNeho1d6K/lMeFFGCVnGGB9YFhvXaMV+UlQgyT1ygfbDHo3hF8p41Q6DHfg
	Fm3uHYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us5Ao-00000006oN2-0ZjX;
	Fri, 29 Aug 2025 19:54:10 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0lF-000000069kZ-0OLU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 15:11:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-24884d9e54bso21338685ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756480288; x=1757085088; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MKVIGNn1cEq2YWpF5MnDqFEUCjnk9rekqsdebgbty2M=;
        b=Xe36mc8rUF0XSY+C7sJA7SsdtKXfiIZmj2eXV7cVtxrGJN8DDIVuvaG8wyPP6nhFwi
         pFjktLtSE9p62L85KHnJV2aCbjoh9v4XEpEFaeHQCKmD9tg40kUGeMuYHs2g/xg50nWS
         jSUhlRfdnZPVpXgrEx8eq/hrgLrmSgCAuSRCbJBoh9qVbffncIgPuN0bKO0e9Sp6uF3p
         IDnqYeljF6fKRwRZOzF5ngry9/qQ+MAZB1fpS0H2Gtt1tKmKM0B0eYWDpu28mUdaezCU
         lxJsIIa1pXrcoputW5CjMmfhpm9uzNzrwTRnmC8imyKdAPg9HFSZfrMSZsY8qE1Kv+7x
         U1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756480288; x=1757085088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKVIGNn1cEq2YWpF5MnDqFEUCjnk9rekqsdebgbty2M=;
        b=OuOAtD9CtClPpo0gTNeBNIzuTp3TADmYqolVlMUtLbny8Xpvxk9KB7+S9JRWJSs0e9
         mPwhWaUkTDIDjdjH6JvCE1ny0W7M04cmRpEUgHjiDMGYFyua02T4oc/91gnhrajzHu2y
         2CyHbp844HdrEstzs2z44G8T2RAyLNLR2FWTyg/cZOq9DLa94KTEi5jymRbcQ0MOkpt5
         z8pAxd/G+45OP/cdOmCAja+YZ7cV3gh0iYg0HB9pp7poWnLpBxHF9YaIF/wnkga4/9jp
         Yv2uSIRtnWZJLFZXMFdzK3GX86WVFclcgQLlPIDMhypkJd17MpZQFqX6K36SveYau/RV
         GxQg==
X-Forwarded-Encrypted: i=1; AJvYcCXxeH6oDl2V2d12dYe255/YNIryMJeODBrEpgMHvTGIae+/DvXgJn5pfQ/AWitpuo0U3KV5KUldnrePWoNnTuYR@lists.infradead.org
X-Gm-Message-State: AOJu0YwngKaE4/G+mNWfvNV+yHhf4VQ/P5XJQM9EMnKHUDhZogHzAj8a
	r+zXEKfDWOq+iyRkHvNSqlzIirrghyeICingzfQyk66mIkOaF4XckbfxqmeOewEpP//Qrli9P3J
	iWqh7hchHlSo3Q1Wpufwxr4JdzGlzyDckOjxep2v8Fw==
X-Gm-Gg: ASbGnctBV1yv2/BP58IPdsuu00+/TqAzDBl4nq43z8RiePxJbwt1NLxlwDyz5emieeI
	M6GqzuQajN2tUFzzEHFtJLMY3FzYWJHLkjGTq48Vw0H/rfAHbjN3af1wClCqCMeIeXtakEMCMJl
	mtyw6t7zIu3TvQUrHUnRHda5E5WDGmtP8/HcfvPLPZCHJGISwRFCyd1VWyOkBblT4TmN9wHWgun
	TdCg2rwOEhsQvzf
X-Google-Smtp-Source: AGHT+IHGuK+XPEJZnoxSJC5I7lDP0ZoQ+n66AiaBsrF0OgVB4dkv+81+YUciDWeRwKYQ7j4CfvTN3OcksYb1HiKXD3Q=
X-Received: by 2002:a17:903:b0d:b0:246:d70e:ea82 with SMTP id
 d9443c01a7336-246d70eee46mr278790365ad.5.1756480288279; Fri, 29 Aug 2025
 08:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com> <20250825-rk3588-hdmi-cec-v3-4-95324fb22592@collabora.com>
In-Reply-To: <20250825-rk3588-hdmi-cec-v3-4-95324fb22592@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 29 Aug 2025 17:11:16 +0200
X-Gm-Features: Ac12FXw0jSvkKD9n-NKvt8cWwlJ3T6SlQZFX3ax5d_8FYdRiZJRd202BjgA0Vpg
Message-ID: <CAPj87rNf3JHveEbtBB-DpmpobDG-kE5nOeNPUaVW-xn70V1jTQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_081129_131397_5A0156CE 
X-CRM114-Status: UNSURE (   7.87  )
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

On Mon, 25 Aug 2025 at 10:57, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> In order to support the CEC interface of the DesignWare HDMI QP IP
> block, setup platform data to include the required IRQ number.

Reviewed-by: Daniel Stone <daniels@collabora.com>

