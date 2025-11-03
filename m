Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DB5CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GaNNFCtknV83Jv0cqtYzHzLamBzWC1xpyIlAkgm43A=; b=VimiEIMF8l2lnm
	Ej0SFDPxvoHuv7xpYyw9dHwEFby8Nz19Ybjk4MKYrhcUKxthJgSji45pvTOV0I5zQA0shRdUBlTvL
	FMXfK9VV/9u/7h4QayreIQ7xC/oWCUP1UOI8O6z3gxaExS5m2bF6vEImFSQxfLAxtzScGQczzjkYA
	0ZebVjXIWvUVLTehebzLCHFhPEU3GnDsZ/olemGUpJbGVMT2b7IRCW9wYU74E5ikCSUyJWWGwjG32
	5yV1929OlK9xB0PcQOSv1n26PqkAfNImeUz+SzjbtYBVgzKwkmYOl9QNXGkBKb6yeAu57TeoqJkk5
	nJEJ7/ZsiZ5zCmBpOuGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwDo-0000000A66s-3XIh;
	Mon, 03 Nov 2025 15:11:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwDk-0000000A63n-0eZi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:11:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A134443B92
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 15:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80522C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762182705;
	bh=1GaNNFCtknV83Jv0cqtYzHzLamBzWC1xpyIlAkgm43A=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=I/+PRojJO4YN8h2bvBzoZeo7h6nDwnL4uefQQ0bkGpg0hgJyjWPTgYEx6AdTd5QJp
	 AzTwDamL3PBHLQjiuApsSqieDLII7glvyihzMk4QqVa8TnIkan+uP6eIyG93znND1+
	 JKnVe9R3de9Eop1zv8OZPMzRuOwAY+0r03H93pkuKe5ENGc7xZJRuuWxc1srof2LwV
	 IsH/gLKF8vbbaDS5nBuB/cQ4B+Vg0S9sh5SX7jr5o2T8L59JcNXvBB/PSXOov+iJbn
	 ian9DlT39jN7IPbmsG2kDWdTkVBFssO0Od9kxeNeZWuUZ+onjLjiYNBZoN9FmlT/9s
	 jEz2SSuoi4pkA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-378de7d3057so42805441fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 07:11:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+uTzq/9A34RW56YOnlB6dQoGgnUZUBYMWZx4jNE3cDYNRQrULTo5jwDK9KpVJwiyek3Ouyo9Gec38voJGTQmX@lists.infradead.org
X-Gm-Message-State: AOJu0YzB91hUKEZ3l0u1EkKXjOLI8Sc8ff2pLKRrIlIHZ/wk8oa/3XrD
	mRh+toFXdc6Xt1KHLgqXQXFhBe7aRhLN5Z4jHuwaUcHa3rrkogwYYVECh4ES6x74agcMQmaOCO2
	/Tul7295j3ZuX10oik1rgsF/kD+Sf7z4=
X-Google-Smtp-Source: AGHT+IGWElttgB4rVGH++HgAV2+aJjHaHeGIca+Uf5ByxP1uF8tUjDilXB/buasyrsMUHZXVPNFUTSxNQSiSwWns+Qo=
X-Received: by 2002:a2e:8848:0:b0:36e:21a0:f212 with SMTP id
 38308e7fff4ca-37a18dc65b7mr29472661fa.29.1762182703902; Mon, 03 Nov 2025
 07:11:43 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-23-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-23-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 3 Nov 2025 23:11:30 +0800
X-Gmail-Original-Message-ID: <CAGb2v663GuEnxxVK0v+zOJ=p_HbqmJjFhP45_9FFvhAtenABPw@mail.gmail.com>
X-Gm-Features: AWmQ_bm-fOqGieMMsHUhvs-YpT1nnfXeuYJQ_6Z3gI_-gHcMItjN5vkHcjHc7cg
Message-ID: <CAGb2v663GuEnxxVK0v+zOJ=p_HbqmJjFhP45_9FFvhAtenABPw@mail.gmail.com>
Subject: Re: [PATCH 22/30] drm/sun4i: layers: add physical index arg
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_071148_231596_713CDE1C 
X-CRM114-Status: UNSURE (   7.74  )
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
> This avoids plane mapping in layers code, which allows future
> refactoring, when layer code will move away from accessing mixer
> structure.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

