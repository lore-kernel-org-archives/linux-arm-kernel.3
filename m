Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2945C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pjb1vpRxRg6idVjUGQ6jYMC5oC/fHi4m7ISfSHpWDj4=; b=Es4qxVCpUCRGyCITidhAo6qfVd
	L7rXnl/SrQ13oF/WqRhIBDr70ipyJBF7e5yxn4x427nlsadBvNPDGRXA7Cr6qv/5xKADQY0kdSL9E
	cx5kof/J6kBVtyxI7YpwM7nvBxHd/r/uZZ43GWoInBRMpW+SjDgEM4kQ1UjrXy2dgky+u1an8fzaW
	m1w79HOi1qthHpXx9DyCxkOFqNYTUOnBIiiDoNzFPdMYHFHj4F2o1cpxzxWLIJbL+urMfpENB9kM/
	+OzrfvaFlV0pnV5ANmoytyTUumQNCPhduPE0fl8AmGu2Iilut/B2U4QbUm/mSCq7Gpp+gZwyWs1Cz
	RjqNN5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5zI-00000008Mfk-0aJN;
	Wed, 29 Jul 2026 15:14:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp5zG-00000008Mfe-2ryX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:14:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 440FB43A0E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 15:14:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2817C1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 15:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785338066;
	bh=Pjb1vpRxRg6idVjUGQ6jYMC5oC/fHi4m7ISfSHpWDj4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TiC4qDhGeGugJluJmFdqS2DloAvtqigdBJGEUTdS5+tPI2P37u1YLNqupYJKmMpCk
	 txfbV96Y1eY5OmlLq+hF/P0nl/lA5Luvle+eFzrBlRh7sbAxjsAottBZaRUFStPgOM
	 d6VlqHU4mi/DQe5QgFcZmgp6HPb20WMaCg7q1SY91BEapGLkA/04rPKsaaxYdHvV0V
	 bWwd619V+RGx3FTzyRgkIncQSD6A2ByOBiyAoZavqMgOiTefVD4KPvSPLTWA43N3r4
	 Ml3BrxHQpjLsnx9rBQncvGvXDI1ZoMf41hemERgivF6pcB82MqEoFzVtiYdHA2ErXF
	 vPSMwy2AYqRgw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b159850b16so988186e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 08:14:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq47ZppzC+GcHIFjZVpCQ/ImVG0LZPsYNi1LNsT+sk6ZoqfDVFsIcLerHHrVNWNVUAte9CnhPcjmYTyVc/N/yVw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl7axTXPLA1ngXBTDMo09GNPdR719fQVfy1nI5TrOsaBjhbqRe
	cpU1xTE6pOLtlLyRHSVjyDJTMrd8otMKe8cJQayf5B45VqFea+v8rLbCEyg0EeGyAmRrJMUV0da
	T21OQfVFPoMsap/oe+ShgoQiXXV2xl/GXJnt9Jpz7jQ==
X-Received: by 2002:a05:6512:6181:b0:5ad:55f6:1ec3 with SMTP id
 2adb3069b0e04-5b2d0213884mr1392852e87.5.1785338064921; Wed, 29 Jul 2026
 08:14:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Jul 2026 15:14:22 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Jul 2026 15:14:22 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
MIME-Version: 1.0
References: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
Date: Wed, 29 Jul 2026 15:14:22 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdFhcarvziP=jQwOKubJPe-v0W6Xck_S8mhm8327F7tsw@mail.gmail.com>
X-Gm-Features: AUfX_myblFT7OCuXOW4dHEmx6cmElNBqUeZuq2_eLJUx_Ak4F74FLfotacPCQ-k
Message-ID: <CAMRc=MdFhcarvziP=jQwOKubJPe-v0W6Xck_S8mhm8327F7tsw@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: properly scan GPIO nodes at startup
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Paul Louvel <paul.louvel@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 29 Jul 2026 16:10:36 +0200, "Christophe Leroy (CS GROUP)"
<chleroy@kernel.org> said:
> Before commit 156460811def ("soc: fsl: qe: Change GPIO driver to a
> proper platform driver") qe_add_gpiochips() was walking the device
> tree to find all nodes with compatible "fsl,mpc8323-qe-pario-bank".
>
> After that commit the discovery is handled by the platform core,
> therefore it is necessary to call of_platform_default_populate() on
> the par_io node.
>
> Fixes: 156460811def ("soc: fsl: qe: Change GPIO driver to a proper platform driver")
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

