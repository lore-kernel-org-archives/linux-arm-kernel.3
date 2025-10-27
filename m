Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3C8CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upm4Fx4Zyity5YEegKY8XfpMcrJf2ls4KbygxA0gOhs=; b=DvKmGZE7zqizs7
	qO8IupiitMQxRHghoQP9W6R+IKTF7anVQNlaxCIc6cAkdwkPUllcYBv6atpa1PWjsIrZUSxv6cyn1
	VIMwbcNb+WQqaoVxFNgO+esAiyFXT/vJwkv9Ugn7z2bhaeG0MgKedC/bS62jDXSWNJh2EI8kmMASt
	YiqF7GeJChV3ltSQTMdawsouHU+sAqq9weI5M65Q2d3w8n0alJiM72c1ENq4Ojg9/Z58uXvmTjzCe
	OWmba9V867AXf/6z8OMd/NgwPE6IW7E2sDp6muEt41f/Z6L9VCjwbIAbgojUATmB/PggMd+m+cCrp
	31Rcz4FcxNurguRiF0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRHf-0000000ESdz-1tdd;
	Mon, 27 Oct 2025 17:45:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRHd-0000000ESdh-2O8e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 17:45:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D60640A5E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA90C4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761587129;
	bh=upm4Fx4Zyity5YEegKY8XfpMcrJf2ls4KbygxA0gOhs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Cj14kJH+FRFQaq800dK+D2JysmG7w5AjqVnjQRupPGzirc9wn/yrC5Rcfe1Hx+95T
	 8iu2ONvQEsgLyKRwOVIy65cPnLYM87isb/TqYx6dNp2YI5CFb7lGyM6HHqrPsp5fZu
	 2b7feUFVAi8CrHg+TlVk+BlhzGBH4hQDO+RpV6FmDilwGj+/wpIUbRhOcaIcKMcFpV
	 ayfn++vB+0q1DQxHh1Yasy9l4D+BMOzs5zMCMbQF/j9d5I4hsR3Zz/Wse260cUKvCO
	 U7I0mY2P44ao6p/8ZDTqX3bF2L7mwgtBxky0EyTZVZJr2jU/xeXuJ1sBzpvidAmMXO
	 JI3WWuk0m5LVQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37775ed97daso59930641fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 10:45:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUoJO3rzWVLxIuOysf6O9JKJvHiSjr+8UUHMkvg9RbFm1Mm+niJCieuw5UWwn/aTDCHct/cJrV6/RJ6UjkV0uCl@lists.infradead.org
X-Gm-Message-State: AOJu0YyQtlNSlmCIcSBzmOjDw1zejYVJBkNNVmXdhMdLiFD5ENT+EhML
	gRmJwhzEUBf4+JZE0wPhf4U7ztAf1lcydYrCr7x2hliPAtD1xgZ64otMkC1EnRGAvnwCYYvQaz2
	XPsbd0XmgM9bT015XiA22DFBvSTRJPSA=
X-Google-Smtp-Source: AGHT+IFjlWIjfh9UvXhgPZoLIWaWRXGD/zpbLYult3MgsNK73imA2OTtKPUOEvbbhsWdoXcemdcDtRY3/9kK67MPTXU=
X-Received: by 2002:a05:651c:1585:b0:378:cd2b:5040 with SMTP id
 38308e7fff4ca-37907cb3b9cmr967131fa.21.1761587127507; Mon, 27 Oct 2025
 10:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-18-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-18-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:45:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v66KBHkZZEkORAyFO5LPqSChBm8mUFS6bgiRZopze7JuKQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmRMHRbSFfLfGrgGggasJXji4AX31snSt1AiPTxbTOpwyHoYhtiWgiL24Q
Message-ID: <CAGb2v66KBHkZZEkORAyFO5LPqSChBm8mUFS6bgiRZopze7JuKQ@mail.gmail.com>
Subject: Re: [PATCH 17/30] drm/sun4i: vi_layer: use layer struct instead of
 multiple args
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_104529_624772_C6F06003 
X-CRM114-Status: UNSURE (   8.21  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> This change is equally a cleanup (less arguments) and preparation for
> DE33 separate plane driver. It will introduce additional register space.
>
> No functional changes.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

