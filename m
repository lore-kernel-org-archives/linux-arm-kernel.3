Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A29BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 21:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qb4Wu82O8H4woRuNaXSp6qi7XmoH0H5VI5tHbH7Spug=; b=Z8kLVP4yYo3THwkkGl4C0+oE+k
	tlf/ULwD3Kg+JtJjjPSeWs3O1+qPdnKRLIoDUgHFkwScy5I6rWrbpXMRDF2SSe7Pbd3myO3d8g8HX
	SYfyXrP2jwZnno7+kM0D2DkpMAwGFRurnm8qkD3cqE9ZsBkXUd/pioUrnAEz/VU2V+dkskrMuwBdC
	ourDclQ/c0EL99EXiQEb1cClFFrrQq8lygQ33+4wrS0ag1A9PYvzDWn7rMYcdNA14oXunMBGUszhv
	wCNGAW21qthJ4h++j4cMTr+KxFokE0RLwNAF+Mj76cdUMyYeWEygK3+QcmuYVPg25AXBoTeNeyhdK
	psfgpARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4nXv-0000000DAu3-3NJr;
	Fri, 03 Oct 2025 21:42:35 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4nXt-0000000DAt3-2iPQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 21:42:34 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-71d60504788so28770797b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 14:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759527752; x=1760132552; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qb4Wu82O8H4woRuNaXSp6qi7XmoH0H5VI5tHbH7Spug=;
        b=P2Rf2Us1HAk46D5duaSaF+5TMTeocxFpKQoTs2k/2JWUYhzxg5VDiOBz+0m0AthJfv
         qUJNFO3ec4smn6Thk26Q8K1KmUwJpkFquhHr+4UD6cMEs80FilXWtsdtKrp2sL/1Ajzf
         vsWUk3feoqRAdkVQwq1zHl3VMpo3vZlDkyyRTIUhypP8eDwfklQq9CKYx21tPwzthlt6
         Yrs1iysQ8EHBRqLcE3MiikgL/SoxFZTrG3S/AwR+29ik4NE46AjcisRHY1u2qNWOYI2d
         IHDlDM+BO/d2OKxl+RbneBpYVg7kc4j2cUusTtj0oi56TNGWh2hmfKrKrHb7xHQjpjmC
         3oZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527752; x=1760132552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qb4Wu82O8H4woRuNaXSp6qi7XmoH0H5VI5tHbH7Spug=;
        b=fS/Q4L90wgs5u3+W+kDwwjkR6KYQfhqW3NRKGMx5cRzszpVHHK8SaetvJMzuSQi+64
         gHD89705PaCJxZejjC9rM2E64Yyu9l49McVHwQpqrDZU/3tyOcuyq7j00CTHHZ0WvxBn
         XAuasiSNMZAh/rpV1pJmr4ne38SX7cJoV44W4najoQ8KdDunTR9QUKx3mHBoRKXLy5E1
         1iVFspK4Ys7/7b/+hwwPlqDR7EOrR6KXPejBqpvr5js2hwM23hN0j0/CBMClT0CeZP4Q
         n96YyYT9F/HbNVzCtkrl+5sPMWw562bOyhii8d5VJBiURnOlj06RJvwX6Q8B8fJMCjZQ
         GueQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1cUL1lPS63WoPzyiiFkWi0dxCXI4UZxVLgaZigYsvpMm6fW+wDE1ZDLQl4Aj4Dn1QyowAdfRdjxHbcyR/KoiX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7OlUZ75hgpt8OSjyJKnGWkGVTP4kyQEBR1eaTXVbb38C9koWN
	xjtPOTo3Hs8ZFg5SbNsO+mEN0o0L5pmEIjohEffwghizgpqgyHiai60TcHmbdW+bzQF6kcahP3z
	bC9+9cbYDjQq3qGQE1NSYpCBTw/1Or0k=
X-Gm-Gg: ASbGncukRYGHsUWrWyPVR928X0126wEGUABaDiwEjxl3nWtaXCNkJ5ggShIf4LdlXp/
	pOPqKuD5TdHSjqT6HHnHf3CsUN/Cxmh+YiVPvFrvbqOrTnV/7U/n4YC0sXEXp/MMHTa1KjHXs6o
	B0PciFb4WJMV75f5Xc+D9GSI27xR2v1Wlr33dnFIVc6sESxQmmlpUPm3i0Px7amatKRswfdiH2P
	dK9wMDL90e2lBMvk0oDf5HYBix4SCq/ew9mSaFEjecQT61jv+H7y50xqgejgnbxfTLlbZkVeIMC
	xQkpx+fNb6bzQZpmO3gukQ==
X-Google-Smtp-Source: AGHT+IFpa62J3F001fD6gEmxASZM+7hprfmJdW+U2IPWM14bwbGqXpUXslnfVMopKEr/h/JVkCYbZZaxq7ZVg2GVzCI=
X-Received: by 2002:a05:690c:6085:b0:726:37ae:95a0 with SMTP id
 00721157ae682-77f947377dbmr63264647b3.47.1759527752486; Fri, 03 Oct 2025
 14:42:32 -0700 (PDT)
MIME-Version: 1.0
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <20251003-mt8196-gpufreq-v6-7-76498ad61d9e@collabora.com> <CAPaKu7QWBShwr+YhFi+nUFo0kJ06k4PK3zggcCefWGjqUmTx5w@mail.gmail.com>
In-Reply-To: <CAPaKu7QWBShwr+YhFi+nUFo0kJ06k4PK3zggcCefWGjqUmTx5w@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 Oct 2025 14:42:21 -0700
X-Gm-Features: AS18NWBXV7Dg7kjMsva2cG1ZX6ySiRudcCipxqw2a3pxKBvNUjFKzkOnT-TXcr4
Message-ID: <CAPaKu7SK=st9FkU+i25MOwBnBPQYpiBxS7-1nnerdBCiPnHy3A@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_144233_690630_8BA114F9 
X-CRM114-Status: GOOD (  17.76  )
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

On Fri, Oct 3, 2025 at 2:41=E2=80=AFPM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> On Fri, Oct 3, 2025 at 1:16=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > Various MediaTek SoCs use GPU integration silicon named "MFlexGraphics"
> > by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
> > integration silicon is required to power on the GPU.
> >
> > This glue silicon is in the form of an embedded microcontroller running
> > special-purpose firmware, which autonomously adjusts clocks and
> > regulators.
> >
> > Implement a driver, modelled as a pmdomain driver with a
> > set_performance_state operation, to support these SoCs.
> I like this model a lot. Thanks!
>
> panthor might potentially need to interact with this driver beyond
> what pmdomain provides. I am thinking about querying
> GF_REG_SHADER_PRESENT. Not sure if we've heard back from the vendor.
> Have you considered moving this to drivers/soc/mediatek such that we
> can provide include/linux/mtk-mfg.h to panthor?
I meant to say include/linux/soc/mediatek/mtk-mfg.h.

