Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193B1CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HkYm+o5ZrKQsoVDIa7Xk6T9MOu2JC8WhA3qTTbVvthE=; b=GzC5g8iMDj9ESS56AYEfFNiDnW
	CcIZ2dhl83T2HlQxZiAFUtkpjhKJxp+KSK+M9wkSI0h0nFlw+WWao5tLUSuRCm9h80MZ39MjkFdNa
	CviI5b0lytuK8nUU6axbG72/FKBvgi/T302e1SAWnJtBcVJZzQdJhrjBclaFgU4MIKuS634kzzy3X
	tqshjHR0iZZEn1zbeId03fL7ItlXCENlagN2zQj8cPeyQ9X+F8WhUpQ2nsr900InpANPogk9QeXss
	MK6qfoK6vh5V6nHr1qR2cHvDp/eXy6548i3X01HCK/ymA5cH5AynN2SydAx1Or+EG/L2quEcAYiEw
	9seCBl8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFCk4-00000007qSN-3DqS;
	Sat, 01 Nov 2025 14:38:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFCk1-00000007qRH-2obx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 14:38:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0611644269
	for <linux-arm-kernel@lists.infradead.org>; Sat,  1 Nov 2025 14:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D103BC113D0
	for <linux-arm-kernel@lists.infradead.org>; Sat,  1 Nov 2025 14:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762007883;
	bh=HkYm+o5ZrKQsoVDIa7Xk6T9MOu2JC8WhA3qTTbVvthE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=URjaxQwj38MV9iQGYaolqDOCkpTUlKnSVuIzesiOnQhIW/2s3vUvTor5VZ2NOXl3r
	 2cOYuzMs8TvXSCJ8GkZqcH1oQUmWVTrWNSWXi5IhOXmiLHJe3uxdq0rLgVBfTJ8bJG
	 6LeOHDmU0rtBOaVQaj1TNa2WXeEM3ho0pa/OQLjuZfsNHTCHabjju0Kyu31tPVK2+R
	 upnREDJ2Wk7qeLcnJwWXYXB5vxHv5n6TDRSW9lWW4rBw1dSZrsjB5LHmnGCe46CWu3
	 iOtj3nJ7kghS2LWUPH5bO8f84VUPwjXtNBOiXUg+y1giOhYJ1aa0x3sJiuPs8K9+ra
	 C2SbXRfQTUa+Q==
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2955623e6faso5401505ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 07:38:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWiVEmewTImiC6ZGUExzcwG6XYGgXc8hX3fV5UBebDGPb7Ow5Q4q5h2Z/4Nx0cL7JVukbwTScoQ5vH0D4EP+Wyp@lists.infradead.org
X-Gm-Message-State: AOJu0YxJZc4y3MqPB8xpza1on4Z76A/eyK/xWZ52knYiEOxlzzCfDTtM
	wFzvF2IltwadPI/bJg7XZjLIwbnaOGZHIQ8l0mjnTJMHinARGFFhB68Y9qvbdwIYiKmsrhoK5l3
	ycz+shpFcoE4ftQpvHR7qLwT3XJqyTg==
X-Google-Smtp-Source: AGHT+IGVMak7HVgm2Kw7YYyD00KFk0fyKjURT+jhVGcUMpmtFlXzH6MEO5oeGDTKYtxCg8XT42xXcp+sjl4UzEP3ki0=
X-Received: by 2002:a17:903:1ce:b0:27e:ec72:f62 with SMTP id
 d9443c01a7336-2951a35eb36mr108901805ad.6.1762007883402; Sat, 01 Nov 2025
 07:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091727.3745415-1-jason-jh.lin@mediatek.com> <20250829091727.3745415-3-jason-jh.lin@mediatek.com>
In-Reply-To: <20250829091727.3745415-3-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 1 Nov 2025 14:37:51 +0000
X-Gmail-Original-Message-ID: <CAAOTY_8inC0s+md84zyjqyrfvsd4Aruy=oVCVsZfhqkv6WPk4g@mail.gmail.com>
X-Gm-Features: AWmQ_bnMutOthr5nfHuj9QF2tM6tPBJ9JUU0hnLlgQDkMeGZ7OwmHz0IXIzXIxk
Message-ID: <CAAOTY_8inC0s+md84zyjqyrfvsd4Aruy=oVCVsZfhqkv6WPk4g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/mediatek: Add pm_runtime support for GCE power control
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nancy Lin <nancy.lin@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
	Yongqiang Niu <yongqiang.niu@mediatek.com>, Zhenxing Qin <zhenxing.qin@mediatek.com>, 
	Xiandong Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, 
	Xavier Chang <xavier.chang@mediatek.com>, Jarried Lin <jarried.lin@mediatek.com>, 
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_073805_777192_2E8DA022 
X-CRM114-Status: UNSURE (   9.13  )
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

Jason-JH Lin <jason-jh.lin@mediatek.com> =E6=96=BC 2025=E5=B9=B48=E6=9C=882=
9=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:17=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Call pm_runtime_resume_and_get() before accessing GCE hardware in
> mbox_send_message(), and invoke pm_runtime_put_autosuspend() in the
> cmdq callback to release the PM reference and start autosuspend for
> GCE. This ensures correct power management for the GCE device.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 8afe816b0c99 ("mailbox: mtk-cmdq-mailbox: Implement Runtime PM wit=
h autosuspend")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---

