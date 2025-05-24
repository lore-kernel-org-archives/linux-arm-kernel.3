Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82924C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 12:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijUDYdDsiCYuyjQz6cOVB4vV8ZrUp3UUkJZE5ynxgOI=; b=tn4HK9uDSz1lUY14jvZe05xcan
	+9KrJQEV/2h/cyw9Rwts3cW4ZHb4UqR7fvwwOsGVBoZ5B/GLxX0NZdsUgU69tgzSY/dyX4pcCZF5j
	DmG66YYbRBeA7xDd46dB1j/zdj5nR4ACkK5fOdY6dEFVzHQUZnLjvgBmxJBq+u24MBkgGA41Oqovc
	BU/thBd2XMOFreWEHIiycijcnCXHV5RuBexhqOcoOx8g1duDmlPjLRPvl6l4f6BrkAg+IYPfwlmlp
	JSdEgvcHNnzsr9VKczeqJLxubS3ow1FstK5YM6JQIy/LPiufALqEL/bOr1syFbFFUZwnPV0Cx1xli
	hKNGOqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIoJq-00000005rnp-2iA1;
	Sat, 24 May 2025 12:49:42 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIoHe-00000005rgR-1wFB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 12:47:27 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6f8b2682d61so18003806d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 May 2025 05:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1748090845; x=1748695645; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ijUDYdDsiCYuyjQz6cOVB4vV8ZrUp3UUkJZE5ynxgOI=;
        b=E8hO9rPhMyyi2pDVFNxq3y9cjtnJ9dziB8frgcD+pv9Heu6LPs88x7MNVJ+0314s2K
         ZqsDIKeIHCTNNKgXg3jjpcXtzsuLmSjzqJsVZEZZRWxnJsGgliCAj5HarMHI7I0mjfu+
         yenaDc3zXXP3rptNztdk24fXtLYdlWMGSbjefAAx3w4xY26/zBZVDO5kU1d3LZMGWpMQ
         InvMRCKnK4GFse2VRwbVHGhXaIaSiv8mnR5Bcrfb5Y/wnEc9Y0jScqRPXbzezMYHH7NS
         qrIExyq/DQt9XtNlBcLw/jIZs+aVQRy7Nv2YL/b1vR0xPeLNCuiibPUjqevIljwLTkjx
         I6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748090845; x=1748695645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ijUDYdDsiCYuyjQz6cOVB4vV8ZrUp3UUkJZE5ynxgOI=;
        b=KNbUm6JusRAB2phHdNDBBpALCrGFnUFSQwPqGeFBe66gHEsCaK3tGrENiNEBYOGafh
         EkCC1hDMV4hzzQZFwMvb23dliSK4oKRstuEbmN/OZEHBF1lOjYymjt0KKO3trJBO3Uny
         t2Q7hxsiOx/phnpMYJzX5GxtKf1hpmqDAcvZpw3MGqzASgbI8oEglSMFzOg4n9mPGlMd
         1VKnldcZTWR6TRhiBGpkKT3dq5mNj6TVxiLQLvRcgF7fkEkQAn4BrxeV9VOWmiOnP1gS
         p56w8QA9YoD5YF3MdgAf5rqAZ/Gazo9iBaK835QG1oLJYC4OC5m7hHBth/Ig4rRO5+p0
         tWpg==
X-Forwarded-Encrypted: i=1; AJvYcCUu3lCsFCjB81AF+wQiqlpFa0PQfM7DcUTYr6+fKQ4Ey7+PzOGuucmCyyeQRq5iYJwGw52q6bUEI9ijGkfvqgVG@lists.infradead.org
X-Gm-Message-State: AOJu0YxJrmP/dks2yyvXHb45piMl6HSmpBXd5+E2nQH3VRvbWrkOa5l8
	Dxt3x9n/PxZIVsDWHVkqN1tGjQIAAcCXH0SpMh276bz9ABhWUTaRsAjvTbdbJz+eZhfEa9DrM52
	djejuEIE166bo2kA/b8s64AnzrOl3mMaJ+Vy/Qg4viA==
X-Gm-Gg: ASbGncsVS1GxDYXtGY6PV/JXm1fS9AGQ6ECpKZLF07JMxdJDpjPjWt0kkCzukIxWXBu
	XqHP9uzOWD7yz8gGrmzbUNWE89xfZ+3mtEP2EiZJ8PGgWF/ypBx5XSwZbptk0fkRjeoJrHaZzAI
	aJwB+P8POkPiTWWhzR+7WX6NKjW8F0HiE=
X-Google-Smtp-Source: AGHT+IGJrpaXggbO0XyLY6WU6SWTgZC9F8s7Hf3WwPDR/lbtMX7FQqhOd0dkVj8JEzPGo+APzIftTHlFkeC/LSVLiBg=
X-Received: by 2002:a05:622a:53cb:b0:494:9e0e:2129 with SMTP id
 d75a77b69052e-49f3505f1femr51220641cf.22.1748090844750; Sat, 24 May 2025
 05:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20250522085149.3361598-1-jason-jh.lin@mediatek.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 24 May 2025 13:47:13 +0100
X-Gm-Features: AX0GCFvBeLD8sRxyqEm85OLAoQZjo4C2fe9icGhm_Cxkm7__yWuuXUFz1KdCsJ8
Message-ID: <CAPj87rNV_48pQF+gv3HEx+-n1WvKOoX2u_HRW5w8DrgEAigk9w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add wait_event_timeout when disabling plane
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
	Paul-PL Chen <paul-pl.chen@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
	Zhenxing Qin <zhenxing.qin@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>, 
	Chen-yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_054726_622075_F006369D 
X-CRM114-Status: GOOD (  13.29  )
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

Hi Jason,

On Thu, 22 May 2025 at 09:52, Jason-JH Lin <jason-jh.lin@mediatek.com> wrote:
> Our hardware registers are set through GCE, not by the CPU.
> DRM might assume the hardware is disabled immediately after calling
> atomic_disable() of drm_plane, but it is only truly disabled after the
> GCE IRQ is triggered.
>
> Additionally, the cursor plane in DRM uses async_commit, so DRM will
> not wait for vblank and will free the buffer immediately after calling
> atomic_disable().
>
> To prevent the framebuffer from being freed before the layer disable
> settings are configured into the hardware, which can cause an IOMMU
> fault error, a wait_event_timeout has been added to wait for the
> ddp_cmdq_cb() callback,indicating that the GCE IRQ has been triggered.

Waiting up to 500ms for each plane to be disabled is ... not ideal.
Especially as multiple planes can be disabled at once. This may happen
dynamically during runtime, e.g. when a video is playing and a user
moves their cursor over the plane to make the UI controls visible.

I think this should be handled through the atomic_commit() handler,
with asynchronous tracking of the state, instead of the hard block
here.

Cheers,
Daniel

