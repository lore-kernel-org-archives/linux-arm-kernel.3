Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B86CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8/epIwjK6bK49ZWSDEUOL8uhBPyT7+iUssIctqWPwM=; b=e15gGxJAj8pvq5
	8i5trS/XHLrJIXdCpkq6N46Lto7YvPaz5g376sX433YFoDwFwbEE12E3KQdisYelt2viEN1wL2XoZ
	3ljN+RoFCuzeK/M/xpN8EHaguNjWQjBKxh55IgglZEVeCSmwg6YdoeI+Ge3XwhSS6IDpFJg5Y9rDv
	6SCk8QeJgUXdPcgtyd6OEpy728KxQu9ATa0v/Aprg+UIpxrii9PUdZ3qBFHKidG5zQy71nnXp72zO
	Enj1LZF2s5KqEeYAUbzsFFYzBIXFosDmcend1mULquMs/vDai6UBWSxFNaaEOHeLuOLSQP2zhyPAH
	7Gzu6VYRU3APQFqU0AhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFy08-0000000ANWL-0s2b;
	Mon, 03 Nov 2025 17:05:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFy05-0000000ANVq-2wJA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:05:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04AEE43C1B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EECC19425
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762189548;
	bh=R8/epIwjK6bK49ZWSDEUOL8uhBPyT7+iUssIctqWPwM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=EaY6Tv7cHr4o4Vfi3GSo8Tkg1iZPjIh2CtCdICyPQfWzhfho3O8ACsyEJNXCcU1f3
	 D0LWz0bttvecSDQLjs1boz1AEPsi98IlZT/T6MOs97sSv2Lf4zuv3p9LD7jpM/N89E
	 o4Xbilz+6y7+bCiNnviZq2GSlOI904Ai1Ea9/gOJgpw0Ht19WCfrD+i3pFUeZusmEJ
	 ZnjlKzoIjaezB8RYWF0m9qincwp49CKthFdx41zFzi3kR/Z7H9xhltClZkWSzYMv5C
	 D9zU0PTPDK21/3gwmirE7CXW9svxQo/d+TviHxm2ryicvJ0TWXZsdTCtpIa4jrRiYF
	 NF0ZcMjCfN/GQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37902f130e1so47318031fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 09:05:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXB8cMy9CiTcOgoAediXMMH5AZuCEubUS4VUPjahCCwSNGhhOu8uSnv9p24ZP0tAQGLxTy1TpOuN8BrZlHs4rrS@lists.infradead.org
X-Gm-Message-State: AOJu0YxGnI4hsZvD+P2Ql+h8c3KDHdDXqvGCsX3ntBB6hXhsE7T3d9ff
	dfmt/8fUZVrK+ORky032DWYoLkzyn/nisKlCgXrI5sXRxTvFP8ZHQaDknmLpoh0ycBgs2Gjn9rf
	f3Xq3Z8/XGPjgSNP4lt9YJn3HeJUNSiI=
X-Google-Smtp-Source: AGHT+IFFN6zMGk4DLXEheEbfJ2wV+RhlYINJykEwMAz/aoaR1rEWNKZw5HxZGXozvXgetNVLf4i7Wb4fjcgrBvfmKaU=
X-Received: by 2002:a2e:7c1a:0:b0:350:adaa:6b93 with SMTP id
 38308e7fff4ca-37a18da8ba6mr26603351fa.6.1762189547139; Mon, 03 Nov 2025
 09:05:47 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-26-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-26-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:05:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v67=Qd1G8JyR=5TABHf0uzoiJAw2-TkG_zMKyB0UEnOevw@mail.gmail.com>
X-Gm-Features: AWmQ_bn81nvhbH0jeJNTVxHpTlgEQh8OpKt7eJ5AA-3FjjmbBjHnZ0HpUXyPv1g
Message-ID: <CAGb2v67=Qd1G8JyR=5TABHf0uzoiJAw2-TkG_zMKyB0UEnOevw@mail.gmail.com>
Subject: Re: [PATCH 25/30] drm/sun4i: ui_scaler: drop sanity checks
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_090549_760063_0BCB69B9 
X-CRM114-Status: UNSURE (   9.03  )
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
> They can't be triggered if mixer configuration is properly specified in
> quirks. Additionally, number of VI channels won't be available in future
> due to rework for DE33 support.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

