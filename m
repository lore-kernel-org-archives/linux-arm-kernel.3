Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2AED0D16D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 20:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bw1dDqtzxhWwWEi8xX5ZmaE/Mztn8IdFjmib1q0cdJY=; b=WQRFwbQF4ZJXZm8bQyzMqppTlX
	lxfIZS0Y8tMdnJVG8APSYL2IpTfzBC42oqfyUQKaRzHuHuj99ILwFmzgo2yFBh9MtSivFAVuWc9E3
	tjaSPlqkjaAJW03P7tn9GYtFwtd2yw+leDKCdg22Fpjri5dA843CW6Gy4tFvs/i0t4tIN/+RNmJma
	eU3O5fOgclWV9CLVnVEG3sWFta2xq7yOLo4w4eAxOjdZkJbz3XHJOt+jQeI7pyZVJW086TfOpbMxL
	NEdXt8SNfP/FICe9D4t50z8ZzyyHyT1U2UF9qnQePiyYfsGfl9WrCZvtDNqrF5ez0Wh+FYp7qIg4w
	Stpzo45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZiq-0000000FaR4-1NWE;
	Wed, 07 Jan 2026 20:01:36 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZin-0000000FaQ8-2IeB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 20:01:34 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-78fcb465733so27729247b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 12:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767816092; x=1768420892; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw1dDqtzxhWwWEi8xX5ZmaE/Mztn8IdFjmib1q0cdJY=;
        b=haXHu8AiVpaPFnU9FY5Gg+tK8N3zGxmq5V0XQzQKvoxQTjs2gfcN7JKHzMMgqbrb63
         4GKLrEWoTiAiSs47OrrU5BZi2tEbNa7Fozant+E6mzMCwkoxVe2kJYOc21gC88pGMEQk
         2VaiBVxWtP8rWBiAZVnCA4jSIadFpY+gQMPeVUh3b6L9HB62YnBRnmEx42uATJxgHUlM
         BHJIl9aGC3BKHpJamMNg2EN9lqPopHT3MRlvVEKEujo8l2pEgCGWl/NdNgDxEmXKx3HN
         xKfM4+5x7UwwHJWvRMo+i0YEcFbBKHLHOuu6vW/x0Xd5mOrQe7ljBG5PKdQemfnspkPq
         fXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767816092; x=1768420892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw1dDqtzxhWwWEi8xX5ZmaE/Mztn8IdFjmib1q0cdJY=;
        b=PQlWR9VQ/Nv4NmkPQw7kRIRk5BCFtVFwex0VWf8ODgia22sJlDftxmOqdAlWmIOG9L
         BtaN/DpP4xsI78PqgkQe6WcT7KNB65YmtTX9JQXz+YEvB3Ex29i0WRNz4+hT4R+oH05P
         bX9njF/Anl1rlDZgBu2PsPoofdaspw9OyIi1uhnM9VS0CaxPz7RJ8cjt8nuG3nn10f/h
         ebvFNEl8UPj+MmvXhuQWdBSJntlY17bwT7NETKdbuF/BV0kFP2MiHRnLsa9y+DS3MldV
         1WJ53yroqe/5c4H2PWq92I0mOK1HFyd86bU7Q9D6sPVKgmR66Dw+5XnY1vE/O3R+qcQ8
         aw1A==
X-Forwarded-Encrypted: i=1; AJvYcCUOigOGv6ijVeK/mB+2Uhld/8T3wlOa0tu7Z0UiZmJQR9MFBrtdqx4FP/ZL6eEkRnY4tc4DrsoCVsbjQKQo0jLS@lists.infradead.org
X-Gm-Message-State: AOJu0YxIBBNiSmtJp1mzwMaU+viY18v5JxICco4l40nXHNXtPyI+0y6F
	xqE0SYX+AK7kCeohUNis7z5KBOoVmTkTewBPlJdmzbgp79FdFjcMbXWnQvYgpBy15AnOj+bldYb
	kKGHdD+97e41rutsIbVxHm9d0rkF6dX0=
X-Gm-Gg: AY/fxX6GzS0D8UD7RZPMAI5DLItLQ4koAneAeClfPdtEVnWjedfGhoDbVf5Z8y2xhti
	xqoMk60zrp9vy8mE7Cz6GVGfyuivQXXCQW49KnaOxn5w5DgFEs804Kk5mWBsTHcdr7Sl7rl32nU
	ww8rolgnKhiudYbVyMNAvclin7aFUs42TsQoecrH9GRYzXOzdjub8IooJIayRqayECE/SVibQjq
	ZsP4FBFsrIScUvUHp6kW4wnSrlJ9ZtBW8o/UNGRsfn7c/SZ1E3Hra8dLecYlPFqy2v1NrxNXAo0
	p+/GXgzgw6HHo/uhmZHNWGIpShlDWA==
X-Google-Smtp-Source: AGHT+IGvHXnVPwLtk2AfaYjIl3ufVpWEoMzjf05Wlyvun5/WGBAyf6b3AZpMO0jrqG+zCakLOjQyoYGCFgMnaCLej7U=
X-Received: by 2002:a53:eac7:0:b0:63f:b5a5:37c with SMTP id
 956f58d0204a3-64716bbb65dmr2504318d50.2.1767816091690; Wed, 07 Jan 2026
 12:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
In-Reply-To: <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Wed, 7 Jan 2026 21:01:20 +0100
X-Gm-Features: AQt7F2o4QulUaJZZRb2rNrPuwYD0wKGX8_-w5ECTaHV1w_JbEvoPR6OEd3x_uPI
Message-ID: <CAFZQkGxdizG15chbehb-TGfBy4yL4NRy7GVD1b51mASmRG+0sA@mail.gmail.com>
Subject: Re: [PATCH 00/11] Plane Color Pipeline support for MediaTek
To: Shengyu Qu <wiagn233@outlook.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, daniels@collabora.com, 
	ariel.dalessandro@collabora.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_120133_591245_9E4B16EE 
X-CRM114-Status: GOOD (  13.91  )
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

Am Mo., 29. Dez. 2025 um 19:53 Uhr schrieb Shengyu Qu <wiagn233@outlook.com>:
> > The curves supported by Gamma are:
> > * scRGB
> > * BT.709
> > * BT.2020
> > * HLG
> >
> > Given the lack of support for writeback connectors on the MediaTek KMS
> > driver, combined with limited hardware documentation, I haven't been
> > able to verify the correctness of each curve, only that they were
> > visually sane (gamma curves made the image on the display brighter,
> > while inverse gamma made it darker).
>
> Hmmm I don't think this is acceptable. sRGB/scRGB has two transfer
> functions mentioned in original specification[1]. To keep color
> accuracy, we need someone from mediatek confirm whether this is
> piece-wise or pure power 2.2 transfer function, this is already done in
> original amdgpu color pipeline series, sRGB means piece-wise while also
> dedicated power 2.2 function exists.
scRGB is a different specification from sRGB and has only piece-wise
and linear, not power 2.2. I seems unlikely that there's really a
problem here.

- Xaver

