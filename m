Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69814CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwt0jedyUiNOzFlobqK/cAcMQOp8Zb3j6L3DOCL3MJ8=; b=tNmFd8DE+B06b9
	+10Pks9lhzMP9k8QVfRrGJ4p0oorop/3SMuT5c8Xj5tVFwPDnTZrRCOHBVRxTQQd4bFOKPLG/hHvM
	KMDpySVboBXkZa6DVCr31hhJV/o9eMAWFedVnehVIsvz8OCFnae1ljbb6ISdJdR1NTuKK3ptOWZWn
	rMwKlXVH1+uwsuOAQxKZzPplY6uLErqXQMj5tm4WOt2judtl8alipgs9AW8JFJoA3XBBCx5PHyGdn
	fuRyNx/iFQpF2qquX8MIIqlglEcecOsH2Eqh8qkf36ddq4xy/ROzlX1FxJH1cN98/Ix+Tt6yL79mh
	+/7/HfY5KVozMTwbUVHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQPS-0000000EMkw-3aCw;
	Mon, 27 Oct 2025 16:49:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQPR-0000000EMkZ-3ByL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E42DC60546
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 16:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B3BC4CEFD
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583768;
	bh=iwt0jedyUiNOzFlobqK/cAcMQOp8Zb3j6L3DOCL3MJ8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=spnCglXjZvgKfzL4Yh67/LPtpXbNsmmsvIcdUaJEmXTVIRDxkkjn3AcLZF99Rkgam
	 MZYOPgkn69POki8jL61AtdMxSHXSM5xee+poAVTOfHf7uZ511JYHDwHdRUOeXMrU6J
	 +MjQ1Uwx/xShff8Ug9Zs/gYeLi4bvVK3enujeE1aAMdNQahL+sVavlb3ln0Itqwilo
	 vMgAviDAsUmWDvn3TewOKtFgiAJcFx18ojQacW3Q3QmhWsadDK7CowbcS4/3DjxARg
	 navc+Z46aTu0M918PiHTPlfTsMSGoYeisIs2Hw7lz3hGuuP0b/kbmtRnNg2fs8Zkas
	 OUBM9tuP0oTsw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso5779303e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:49:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXr+bXehrQzmUdxoh8XKEvLeJQyackuazdrlveRzwqgQ232jmnUTHTFT7WjdmhQ4Jxk/H8nPoACQ7TNEVQ5XRPy@lists.infradead.org
X-Gm-Message-State: AOJu0YyPC6l6Yo8w42gU1PTePs8t3D9ysMQq8YW5g+BDbc/pObD+3n/S
	8q6NyoaHJHqS7on5ilZSbq7s7bO6Sx2VMZKvPXDRVYo3LEd3BwQQIfaICzjVjsqkgiyGUmLA3ar
	LRHmzGin8uTQe4QyIUGwn7IOcXeLzhEA=
X-Google-Smtp-Source: AGHT+IGjZBPVCroqeihNgSQn8QEjwNnQ2fNEMf1WNTWh/VQEvPpTrq85cH+GmAxeA1rjsw+++pJ4KpH26mh31O7ZNf0=
X-Received: by 2002:a2e:a902:0:b0:364:f830:230b with SMTP id
 38308e7fff4ca-379076f696bmr1122261fa.22.1761583766949; Mon, 27 Oct 2025
 09:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-12-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-12-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:49:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v66f0s0n4cv7M6_DXF6cxnzjd=9jRuCk-o-=rVV+6OZLqw@mail.gmail.com>
X-Gm-Features: AWmQ_bm0ycd464KA4-SLL89Dthjko7sDvbYHRomqDxy1qMNmkmTwAyRYJbT_EzA
Message-ID: <CAGb2v66f0s0n4cv7M6_DXF6cxnzjd=9jRuCk-o-=rVV+6OZLqw@mail.gmail.com>
Subject: Re: [PATCH 11/30] drm/sun4i: de2/de3: Simplify CSC config interface
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
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

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Merging both function into one lets this one decide on it's own if CSC
> should be enabled or not. Currently heuristics for that is pretty simple
> - enable it for YUV formats and disable for RGB. DE3 and newer allows
> YUV pipeline, which will be easier to implement these way.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

