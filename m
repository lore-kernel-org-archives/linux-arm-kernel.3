Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EDACCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7CyzY1gi2utCnEO0mIJFk4I0teKsCJNbeXckClXmjAw=; b=B8p0xdRLwwc8It
	8lcNu5jl+IWFQH3dCvi+eG1BTImbKlwIS2G4EB3Ek0oNfo4LuLI2dOjKBdAiMaX3Lccq1Kh0n1Hs+
	MK8xEUwSNn3dTqnO68rP3dKN5lAX7rq+uzxuD9qJ/SL55fwISOkDKY4wbgof+Baz43lnU8FWaOaM0
	KRW4uYM0ggiIITTARtBtjCAJlkdFSmdVfFhS/2olj60rDXR8WRcoK4MUrD8kedb5LW7c5W2GB4QVa
	f+29LCs2CUUL3ZCOyjvuQZC1Gpa+iFd5izD/oJTPlz1R3xdclQz8YUN+m9tOm3A6aeCSFo5lgiYA+
	imE8nk5Hatp/HYtz5arQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxv0-0000000AN2Q-32Ax;
	Mon, 03 Nov 2025 17:00:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxuy-0000000AN21-0U89
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:00:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 844FA43B15
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6555EC19423
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762189231;
	bh=7CyzY1gi2utCnEO0mIJFk4I0teKsCJNbeXckClXmjAw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=JP30ELTUudyhVsNf8Z28HixNPHuIblFoxzdt+6GKSZNVKcm68JNvQJpbCm5SoD3Li
	 kPxz8aWYeBVNE/ybrjfVw8WChw3rExRtt0RqqRSX1f+YILweTNONW4VyLITZhAesmr
	 0XHx5b0Tqh3VHviyGrZQLx+GK2gMq5LGyTNxvp2cymGy7ex7+LggtONVv8SoC8saRF
	 ixOV6B3iUvawEuT2FJpdS2T+ecjF/RANMvXFrf+FWtPAGYqiJhA4ND+zS/Tlu4rCTG
	 awXxUZuzNKA+t0tiQbE3IJAH12nHGyqht1iGtxLFt6HAN4CG1GjGT42F5yiox5+U82
	 j+khydXWxwLVg==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-36295d53a10so39830041fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 09:00:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgc19w2x8yl+TNPJTD64KFbdjYfHOkTjzOZaZs5/FI8oE6lIGFsQiBbe+gtkj8ZL3VWkYHoDN9zlhmLPFQ+8YQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyXIDBYOMY60aiYdOQCypQxM4DZfecsNMaUKvnOy+mdoMCe4By1
	+ao3WwgJ0eMRUFDKFeh+ATclDArrvdqG64f/ZmWYWVKLXM5HCsR0wy8RijsYBrrHQRWAXR1mV7s
	3vVeSi9z6mMccNBEd48PYiawY00iKGt0=
X-Google-Smtp-Source: AGHT+IHVjRCJBpIQ0AkwGUkv1Oc/Iw1YpvgPMizZQAfItAe7f0KiKtYYqyVs+d6rQlc0MN+lNmy1tI7ZB9JGHs18oQ8=
X-Received: by 2002:a2e:7c18:0:b0:376:39eb:21d8 with SMTP id
 38308e7fff4ca-37a18db1eeemr34990161fa.15.1762189229761; Mon, 03 Nov 2025
 09:00:29 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-24-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-24-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:00:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v64sMNZQEjZdofw_=pWYZ7VPa5zjFjrRBZu4tH+HrusZdA@mail.gmail.com>
X-Gm-Features: AWmQ_bnJun-VQPYKNpyT8f9hlvvkp9be9LX1bH3OeeZGxyWdWrG0bvZZDFNJw7w
Message-ID: <CAGb2v64sMNZQEjZdofw_=pWYZ7VPa5zjFjrRBZu4tH+HrusZdA@mail.gmail.com>
Subject: Re: [PATCH 23/30] drm/sun4i: vi_scaler: Update DE33 base calculation
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_090032_200556_6C25CF23 
X-CRM114-Status: GOOD (  10.65  )
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
> Now that channel base calculation is straightforward, let's update VI
> scaler base calculation to be simpler. At the same time, also introduce
> macro to avoid magic numbers.
>
> Note, reason why current magic value and new macro value isn't the same
> is because sun8i_channel_base() already introduces offset to channel
> registers. Previous value is just the difference to VI scaler registers.
> However, new code calculates scaler base from channel base. This is also
> easier to understand when looking into BSP driver. Macro value can be
> easily found whereas old diff value was not.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

