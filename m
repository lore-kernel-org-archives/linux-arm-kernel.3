Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3005ECD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 20:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TP2hUiA2w4UiubJG1d5nR2maW5WDwIWjpRzO+M+ax0=; b=QsqSkIJ5EJkRoH/fASHVHeK3Eh
	w2gMLOQwiqZkbJSSn7Dyiejvf8Y7baz2JW4InvW2x2s/UJFLw8Z54Y9vMDlEAXPIUkmgZQRSlbr8C
	ZcW932F96T6QsVMvIiVYPzPDfD8iYLxwnaFjCKyArZ+dUg88gA5t9inaXxHeRu2t1hZcwM3xSaZX+
	bj8GhPbpR7EOEhmQECgkElTSaq7ByIni7uep04mVLJ8rhMMfUkfOYdNBvoXAiq2K6DxHG9kBgggGi
	pIevM5VPv+5U0ZvkZHYTeTxHT0NM88OqOtWf6qdLnuvP1VtTL7eeR+EGkKfkHjQcNJGYDea96mcgp
	d9hQF0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2nt-00000006LWA-1zpy;
	Tue, 09 Jun 2026 20:12:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX2nq-00000006LUn-2j1h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 20:12:04 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36da8439078so5325030a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 13:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781035921; cv=none;
        d=google.com; s=arc-20240605;
        b=O0qprDsomwj9pZnZn/LiSEa7SDMw9NawPopeUg/ikJVsMzRWbnRMGoI8zpaXaqO0fE
         vRJt2zRpej1hkfcX1LaCM5FPQnU4nUDw2BfOSkBjUiX/fN5UHeCqIsOb+kv8E2CiP0xh
         LqfucsG/gpTV6/2RsAdpkYbmXQlsV1kIdiNaqCu4eiGJHijeBt4HB9pRJPg2KimmivU5
         P3y/CtRW5XReubkg0tntI9tAiO+lsRLxKOveiDru0okvMr4wD00zHi4B/MKhtym/Rlx1
         X2UWIAr4ZXKt92YKMMplNVeqbgWYIoAM/x59k3bpTOB6eigIWnjLifRPHGHpXKcolifa
         jduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1TP2hUiA2w4UiubJG1d5nR2maW5WDwIWjpRzO+M+ax0=;
        fh=OIpFkgzEageeV70VlpM91mZzY2ZAIr/DbURx3HfLjDk=;
        b=JnjuU3b/1YMEV/l+k1y/E+GJ5AdU8QgoZqsBqDJg9+uHQqiOOANApsy18YScB5Ap9S
         DzcI3mERl9V0Q6aSJyAUFLYyR7xInTw9PAgHYVhos6XlKiOY0rgUN3+gFm1F4Rbx+abA
         rSb6J2+r7nukVtLYrQKI293TOjJUeqwJpJUw+8PpKj2b0e6jBPO1mOcUbJHqoQ7hwAjK
         i8Z013AqDBxb3DBbZGbL9MNueNVALWkYK5G2dHOyC7QqVlhYruyPbzLv3Io4R9VsISZm
         pEud3FuI5/i4Otur+y/QrAb5IaP3NdQR2jeIn3Kpv+96IgjAN7k4r3LcHB79fwjILtaU
         LKlw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1781035921; x=1781640721; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1TP2hUiA2w4UiubJG1d5nR2maW5WDwIWjpRzO+M+ax0=;
        b=dG/z91W8UrZF3/72kxqwBBUVCJwxud95fvvuUOSjgApUjYYMuHLVDwyM3Fjq4yo8+7
         zDG/r6yxbueU0l8DZ7YvzgvqNdqpfu1gp0N4nv6Ncfasy7NmTMOicdBymXEQNL0L8wql
         qgN/ZNYAPYr2lLrXKFFWp5ltFnQhSX0rbYYzs6bZM68xq8c8NJYdTmnkmWyobOFfmN99
         vyUCWLQeXqEA43vU8B+LajzvvyJq05woKrB2ts7ORd5gqxYTvtW1XAslBi0r79Vu1OLf
         Rv7oT6EBtdySNoripitxw54hQ98nnPD+cqTjs7wUriwjwNRbZFKKPPSl/vM9t7592QSO
         vYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781035921; x=1781640721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TP2hUiA2w4UiubJG1d5nR2maW5WDwIWjpRzO+M+ax0=;
        b=UeX6VNzmPnV0TSD6MOARpzKx2Rxaf3C6hqttNm7rqbu5jRBY9Q7Yktxpe7kG9V4bVt
         BZhdQVAChLVDelG1mLXCsgN+nJGNcn7uvwsTr8RVUZQGQaStKYp3O7tcGXzQnk/vjgcp
         AtcbzLi9mLdiJxtXKRpYmiZ6lUbbKJTNcKqNyJG01fqKLZW1K9lrKyrkSSjc+CGMBE4y
         8PTi8CXgb/SGMwRg25xikulD191xUnBrV8WRktVY44wEJxBLBE7e+OKkHUVJcDEWV8T+
         4n7rZY1TlzsnvA3Gn5BU/EuVrr+8ExbvSXyYdK2ooSwpGd4Dc24F9lx1bivRWG9j91Ul
         6fBg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZZ6Nd2B0Md5InEuf8BIESvt6VHtq3M6kq81EhFt+Qhn718mGBxAIQJJvNf9lN7ITMbAQgCsr8CJYx3a5ahtFi@lists.infradead.org
X-Gm-Message-State: AOJu0Yx46cpl6mB2j31w0C70FU34/8AGBNxU2Swi2auwP6Ki3kSq31Nt
	qUJaUiPnHRJL+Q+Vr10pudduqQ/c+eL0wpoYf7CbN7v5LbjjI+1jQdtjHlNoXs5xAQCEUvi86lA
	vWav/Y3uTuqG9OJgmhnMrC2d6BsM/8Q5vVYXNzPzPKA==
X-Gm-Gg: Acq92OGNxwFc/AshRYxpah4/7umkpuVyMhaF+7eVCQnC8TNS89hUWBsT6FSLLXYHe4l
	BIzGFY1/VidrV7s5qoshHkHLAc5ZE+4fa3aKDzhQ3CnbsnHPJYVv1DihOjrmAevZ3UWUFZA1/jV
	oBHZ0bGT3hKg24XlEH8LrtKdoFCh+XVi+ucLkmfeC1u8Ct1to87ylt3yErQP00I2nJtSJnLW1tk
	whH+RRt/AJMz1eFm9zduudahIjUqhcEWN+0Y8AUxnpJ2osbeSKbzw824UHLx1t642ZMxFsP15Ji
	IsoVSf0Xa0jMIp5nSw==
X-Received: by 2002:a17:90b:3bcb:b0:367:cb53:7435 with SMTP id
 98e67ed59e1d1-370f1525ed1mr21923499a91.24.1781035921449; Tue, 09 Jun 2026
 13:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
In-Reply-To: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 9 Jun 2026 21:11:46 +0100
X-Gm-Features: AVVi8Cf7R-IrVdYhsGfa6ARvQUl6VjYbn-pxlLXZ6UvxdCSIBKSlKWHfn1zLb40
Message-ID: <CAPj87rNhTViuff5qWeoGkPgyRvP0uOAcUGpcJJPTkPR2b8fJcw@mail.gmail.com>
Subject: Re: [PATCH v17 00/28] Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>, 
	Andri Yngvason <andri@yngvason.is>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Marius Vlad <marius.vlad@collabora.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_131202_860049_041EF8F3 
X-CRM114-Status: GOOD (  14.16  )
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

Hi Nicolas,

On Tue, 9 Jun 2026 at 13:44, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> this is a follow-up to
> https://lore.kernel.org/all/20250911130739.4936-1-marius.vlad@collabora.com/
> which in of itself is a follow-up to
> https://lore.kernel.org/dri-devel/20240115160554.720247-1-andri@yngvason.is/ where
> a new DRM connector property has been added allowing users to
> force a particular color format.
>
> That in turn was actually also a follow-up from Werner Sembach's posted at
> https://lore.kernel.org/dri-devel/20210630151018.330354-1-wse@tuxedocomputers.com/
>
> As the number of cooks have reached critical mass, I'm hoping I'll be
> the last person to touch this particular series.

Thanks for seeing this through!

I've pushed this now, minus the Intel patches which they can merge
through their own tree. The AMD tree required a pretty trivial
conflict resolution which seems to work OK here.

Cheers,
Daniel

