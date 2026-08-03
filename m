Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45796C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P04brJjayLVgRWu73sAc2E+ndFKcA5q+VMy6bVRNWQ4=; b=40m6rPzia9wBKe
	LgzPo13hZwO4PzJU4c/FD8Li8bFiWyS21VNLYFUOzQQTc6vyJDmVmTvqJGIgLmAQ/SARHLRv4QhgY
	QTzFiIhdPnMzNRUVEW8zvP9Robvs7pdYb/PY2r1W4j4IitJICKvy33X35usLo+9gkRiqNeCCwCLub
	+PX47GzwjwqDt2nRP81GWflukWdl4FDRDNQVO6IHgl7fbi90pReI9Ya6CE1qC9TtSu+RPPxMEK9VL
	JzhISUXwZAPv8UBEddObLlxCHd38MkIQ6qh/lT1BZ/CG6arBHilxcU4hiiQnMrHPjpjRAolmFxYfB
	R0+tnTTNfh+CjYu+4GPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvIO-000000003Il-0tOd;
	Mon, 03 Aug 2026 16:13:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvIN-000000003IE-0iBP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:13:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE7DB40955
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 16:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E0B1F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785773622;
	bh=P04brJjayLVgRWu73sAc2E+ndFKcA5q+VMy6bVRNWQ4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=dJgI7mtPbMPLeWz5FC9RBdYVdLa9rfjw9KDXGCxB2qdjP7VSh14u19OoWN+qVawfD
	 H25A+8QXl/Y3R4pLEJmc7ZiU39ggUpZD3T4M1DBvZn1woNJ7D5z8QyDBuQCQb6DKXT
	 tW+BgqngYmG2HI/Qrg97uzWgapsbY/XT188Ccq3M99+uVkqBLUt9Zu8fXNQSV+gde7
	 HISE0dGbqJbthdZgY7J0WyJ6O7BHg0uYNcuZ/lR3NkWL2aw4Y5KN9YRdsctf5iBz+X
	 YI7QaA9JSlF4VtTle2MbAELwaOiz7bObT5SrWigdg5UI3Q4waz88YfjdyH2Y8jt9JF
	 mKPMHfPlMoKxA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c953950dfso29858501fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:13:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrjtm0TkhKNSLcmBAfPeVA89X5Y39MTZA+ghDIENS0PdWtNiNkYy+4DS6XEDm46ASFZ/+aeprKbHSnbxgNMJIAe@lists.infradead.org
X-Gm-Message-State: AOJu0YyfAb6rzNz71HZlM59vq4Y6Fa7Vwm82GlVLGkKD9D3ELeOIT9Y5
	qd2qGE+PrKfvc9b3uQE1iQtYmLqN3cuhbDpqWb0yrTXN13BC2Z2Ef0Ht8ttKlHLXBBOHUO5hQV3
	8kke+nkLc/ZiVMt99Q1JW46kRQOcIdYU=
X-Received: by 2002:a05:651c:150c:b0:39f:63d3:f1e2 with SMTP id
 38308e7fff4ca-39f864562f8mr20984431fa.40.1785773620744; Mon, 03 Aug 2026
 09:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <75ad4947981f2dc33fd42c05ae0b0cedda7647bd.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <75ad4947981f2dc33fd42c05ae0b0cedda7647bd.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 00:13:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v66AJ1Oucec-gZue_SU_q2s4K8oB5=8rvOgcGPaXKuk0gA@mail.gmail.com>
X-Gm-Features: AUfX_mz064VR1oGAUu4p4Wa4jv5ZeE5jPGOfMsUAPA8tv8awon34YrfM6Q_FSEI
Message-ID: <CAGb2v66AJ1Oucec-gZue_SU_q2s4K8oB5=8rvOgcGPaXKuk0gA@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/sun4i: Fix V3s YUV scanline size
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> The VI scaler line buffer on V3s can hold 1024 pixels for subsampled
> formats, not 2048 as currently claimed. Since coarse horizontal scaling
> is engaged only once the source width exceeds that limit, YUV layers
> wider than 1024 pixels are passed to the scaler unchanged and the
> output is corrupted.
>
> Use the value from the vendor driver.
>
> Fixes: 2586de70c15c ("drm/sun4i: Add VI scaler line size quirk for DE2/DE=
3")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

