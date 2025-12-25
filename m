Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BEAE7AD42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 09:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9Ke6j9W8Ei5tvHkuB7C0vpGJIBB5IXcJ3gpc/DH0fE=; b=PJIggro7MP5/n3
	sOwS4Jhq/GqrGPxnbYplbViUzYbs0Y/GcVv1R/fORVH3YZ5+cpaomvp89cX3maSZQltqFwufs5D5r
	nAJz5QKAfKg2Us2xFDBpAlPglHrp1lv16D8xEdCsxQogQmIPqI6elPzhK5I0fAKU0I1/1trSaCK7j
	eZpP/moMkyYm9fbzPaa6IFdagXmBiVd9yCvAdxIl90tw6lzi20YmHvWe4YjUY/2hLTQ75rHKjlxr0
	rbjI0PwLh1Ac0rU0q+hzngF48y8Lsa445e4ir8HC8GbkYIE9l2aMF1EJM2cTud4kexYUsUfsSMb+D
	D1meHGAFlTct3u8rGxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYi3m-00000000Ih9-38TQ;
	Thu, 25 Dec 2025 09:55:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYi3l-00000000Ih0-1igN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 09:55:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 892FE60145
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 09:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CC6C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 09:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766656504;
	bh=GilIDlHwNmX2DvdXTed0gVD0Xc+JrJf6zdMnLyNlqeI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=jk5cbEvgYqzVwBWFCxmEF3jdg+Lh0ZwqE/XWjx0qq4BHivz1PU+vhK4zZwLPJ9Qi+
	 7pb/KvqKMvPlt+xHJXj0jTyxSYTLQg2T+2xfqBj+KdTeS4TEg2CabmfzsmUy5xzH8X
	 4MzvkMv50/D0q0cC9A07TiY2ykSxkmV7C71pRcwgbjOSuOx7Jyt75+NSrciVzy6Jky
	 DApt18hwp6jgJq/Hn0YD6DBYH1gzSgtTL7ghG8wXiw0wQ7cQJA0DbjvIEPxjlp5mGw
	 JAjpzD1to3mBmsM/5wJjfAC9TAlmTbL8H9X93f5mS0d9teXmZjASYD3rV4wa93e/cF
	 fwMYGyxBxX+7w==
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-65b6b69baf8so1276262eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 01:55:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfaD7nY1zUb4Uu5kzqswvuJSBs9CqZX7IhvaGFJczwDaCOEH1GaSHpWJBbyLSGKI10rE6eQ+k4kd6ek0VRTVgq@lists.infradead.org
X-Gm-Message-State: AOJu0YwxKeQfdnab69afW6cUZ8o0cHNXbvsQJdnZfTm7tzJbDpVMGyCv
	kxlFfUd6NE8kb0bbIVf9DLik2z5mTq+iUPfXk/QuDnPUEq3KAMtV4N9xV2Hf4LnDGBCCDmmjYfF
	zYZeS7Qed+9rQBQG0GAu0HQ2YV8DxtXU=
X-Google-Smtp-Source: AGHT+IFnkfQaJeM9o52pGeAsmGmsmCQF0mX9H8Ff5URtY5avsALv+90AlwsZ5jqSLRXCn8JBK6tiXl/piSwLMk1Yfvs=
X-Received: by 2002:a05:6820:6fd7:b0:659:9a49:8e5f with SMTP id
 006d021491bc7-65d0eaa75efmr6243347eaf.47.1766656503387; Thu, 25 Dec 2025
 01:55:03 -0800 (PST)
MIME-Version: 1.0
References: <20251124033301.2987159-1-rdunlap@infradead.org>
In-Reply-To: <20251124033301.2987159-1-rdunlap@infradead.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 25 Dec 2025 17:54:45 +0800
X-Gmail-Original-Message-ID: <CAGb2v64d5wfHHQZd7D64RH0YukqewbGyPmwABoF0SNrf-yEn3A@mail.gmail.com>
X-Gm-Features: AQt7F2r2EWPiUxRZoKWZgkAX6QaCio9hsu-zhnxn_qnEeaMgGQZAl08REyABcws
Message-ID: <CAGb2v64d5wfHHQZd7D64RH0YukqewbGyPmwABoF0SNrf-yEn3A@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: fix kernel-doc warnings in sunxi_engine.h
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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

On Mon, Nov 24, 2025 at 11:33=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Correct the kernel-doc notation, add a missing struct member comment,
> and add a missing "Returns:" function comment to eliminate kernel-doc
> warnings:
>
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:116 Incorrect use of
>  kernel-doc format: * @mode_set
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:125 struct member 'mode_set=
'
>  not described in 'sunxi_engine_ops'
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:144 struct member 'list'
>  not described in 'sunxi_engine'
> Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:168 No description found
>  for return value of 'sunxi_engine_layers_init'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

