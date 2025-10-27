Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9CECCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 17:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jc/356FpIO5fq3wbVBLhYJF7QyfRlww33yCqXERm6yM=; b=13/p4O6Lv2fHVn
	cGl8kTTuD/yLxsO9/VzuRYqHL3i0Lluf8dKkfc63lBLjwtzdjL/MZmgCxdsVV+3NCQWDE4+UiQfxD
	6SIt9wh0WW27ZZkFsSrHVtH2YWoryuCgsmaloASQ0K2lq9nRfRKhwfq5DjKoreB4n+PexbLaX+7yi
	frGqBkGW/5kiQblmiAyyemOAfJbM6eVaWRamtuFYmI/nqTvUKQKVgVtO3MAxPQEFyWpG9D8OKlcaT
	ePoqVwvXsicv7fi7ItlwotQeae3HVHeeYqMWjE3dOqGlrB7C9FsXI9owT2mE1wc555KqLG4Fnc2c+
	DwJ1ZALZz79ociQOA1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRLZ-0000000ETpE-1JFY;
	Mon, 27 Oct 2025 17:49:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDRLY-0000000EToA-1qwg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 17:49:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C98B61474
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDE2C116C6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761587370;
	bh=jc/356FpIO5fq3wbVBLhYJF7QyfRlww33yCqXERm6yM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=nmDs5Ea2BJ0QWZz2Fnj6YnJCwAGH9ivTFSEKB7hbsxg40ESYbuLp5lADWA+AVBpAI
	 yt3wp0PEAGmkqI0b9jM1OEM115cLxrFqjqAADUnRlb4lCnM4qxEOhBG50l4Ht6QJoH
	 dPGJjWkTO+ZdnKTxP4Kr542JJT2c0n6l/hXpRMNsrK1UhiHuAYpCx/n+DNSh7fneiQ
	 Xz71EBZIifFB8BGItaAtKMD982nX1dWQP7diMxUr8JpHi/7iL9EtY6An6BUSDDg6uw
	 pPF1l5md43z77yxjTWXZLF6zRcHg0m25WL5tXIR2qgz3nf8MDh3xga2Jx7QEOhWMtc
	 kLpCppO/X+xlQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-378d50e1cccso52200231fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 10:49:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmADDqQvgHHwVPRK0K/SEP82EMBLhnx5ifG4XAYNWupZ/GpdMvdr2GW9TJwJo2J4cE/8zzvH+z4IGj9J0e9Ma7@lists.infradead.org
X-Gm-Message-State: AOJu0YzFQB7oF0vN4Quxwyto5sfRWc9xvdCDIE6Clmz/RQiz9Aqs4Y8R
	6E4vlkcJH77D6uVhu12NJ7K6RIbB4P5sAyvkL2Uv9dwSgc2yJrFWltnIDtoJV8sxj4TQ/F17lNv
	JVP8CpQzxYMWDnSfnQFW6nnuL1aN8Am4=
X-Google-Smtp-Source: AGHT+IGvL3+rmUcT/vmlGB6JqgMLiakuW0wtgocLdITSs5J6YhIhu+bJ3QUjjP/Dh4NLN0bmdcv0CpnIkj1evrKbsNk=
X-Received: by 2002:a05:651c:234c:10b0:378:e097:e16e with SMTP id
 38308e7fff4ca-3790777de3cmr1218271fa.36.1761587369224; Mon, 27 Oct 2025
 10:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-19-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-19-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 01:49:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v65aY11Hi5JN1PEMyFCoYK9Z11V=xYXLcSLqQizwdVOarA@mail.gmail.com>
X-Gm-Features: AWmQ_bkqzQW934j8vgxNIiz1K6pixo4CW7R1IQZPgknoWpc_MwhACwyMTj6ZI0U
Message-ID: <CAGb2v65aY11Hi5JN1PEMyFCoYK9Z11V=xYXLcSLqQizwdVOarA@mail.gmail.com>
Subject: Re: [PATCH 18/30] drm/sun4i: ui_scaler: use layer instead of mixer
 for args
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

On Mon, Oct 13, 2025 at 3:24=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Layer related peripherals should take layer struct as a input. This
> looks cleaner and also necessary for proper DE33 support later.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

