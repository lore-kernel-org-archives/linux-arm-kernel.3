Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499D0CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 17:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+o5dV5iJcb6acg+vuRYXWjvoxYCIxuxArBBgYrKL5qg=; b=wCOmsb9+P2nfMZ
	alicwQJwXBXwt6q1vw5IZT8syfXlbewSIUWV2N7cHqNBOG1m3H4Gpjhr75ymXhfNjkifaGkRJ+xcV
	UBdaNizt9MkHGZ5oAKzWkucHTDiv2jYgbT4R9YBlFNZE6WM3ASYkK/kYXqcGsjUkdQ37bOC/WiPmi
	f0lkhsTayxSWhzEw5s5QgEhmBOo3z9WJvPQ/8k77q+YQ9SiAL9fCP74r1L2chTa3BtMstEQLxMskd
	E/tKXQgZc41Dw918qyJRzkqzS4oJ4zEwY+qpbV0Knf2TB4Y9cV5hiMTJEuTOOyTFSkWfUCIustxiG
	TDcmvtJ3CHHdSgcU1KkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyQx-0000000AQYN-0KpJ;
	Mon, 03 Nov 2025 17:33:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyQv-0000000AQXt-0mkB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 17:33:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95EF443C6B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7354AC4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 17:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762191212;
	bh=+o5dV5iJcb6acg+vuRYXWjvoxYCIxuxArBBgYrKL5qg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=l64bn1uhzi4UXNLPwabx0bXjOyAkO9VVfL0LTdtFR/2gX7cNFuxjdk8tlJHEMHpyM
	 owLu67ClCwCfmon160zMBZN1i+AStX68zSifyc49ftP6AKQnREwma9qBU5iB1lNU9V
	 16vZhgTAVAA/uuZRiWm6J8hR8zpZEqyVMOUJfKLNMe+KK9VNvR+MyORJ3OnJrCl9QS
	 P6P4/MfQvzG7x0E0bAAoNX5iHdEHDxx3wQiGF2s/bnV19PgVmeuSMHc5as3RajIj/l
	 THOP74aC6hSLmKPl0TVEtuuJZN+Nyu95idQzisimIplPIKvPC/3rQoOMfciCDKHKzW
	 Z8VQYd2IIwA2Q==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so4695004e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 09:33:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVotFEk9csPNGT2ALXLrVMR4pnSKL1KJa18lPwoa245TA6FOxDxtiDVQoiPTjqh8O8tznj7gCRgwQkC5R6QijUW@lists.infradead.org
X-Gm-Message-State: AOJu0YzyjAaqgNeI2OkPl4NVm2dImU2J/zarA2grC1jvrjvpuRMHznD0
	MPdBQMCMxSWd/572qVDVf01AaT2E5Y2pjsZAs/GsMccdmzxJMblgpPgbXb3VY3X5x1h8A7bC6K2
	jlYNp/b28RgSJpjrmwIcZ9tMpXPgauFA=
X-Google-Smtp-Source: AGHT+IHeAV6gvUZakhroG+cdQ4cS//FtPIAPmnBlEfHgFaH6azoAUjYMPV9zLQGb7u1TcrlPCM1uYxkpaGVsOmKJEms=
X-Received: by 2002:a05:6512:63cb:b0:594:253c:209a with SMTP id
 2adb3069b0e04-594253c245fmr1658107e87.14.1762191210885; Mon, 03 Nov 2025
 09:33:30 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-30-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-30-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Nov 2025 01:33:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v66+oGwTnu_wtLwjcR4R6Owpb3PY5YTAoN0VUReB5+JePQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkzN1dsVffW7_6vHF-fIc5cl498aftDpvEUp2fdEJedEOeYbOYD0a_NxwI
Message-ID: <CAGb2v66+oGwTnu_wtLwjcR4R6Owpb3PY5YTAoN0VUReB5+JePQ@mail.gmail.com>
Subject: Re: [PATCH 29/30] drm/sun4i: vi_scaler: Find mixer from crtc
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_093333_246754_7CDB11BC 
X-CRM114-Status: UNSURE (   7.48  )
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
> With "floating" planes in DE33, mixer can't be stored in layer structure
> anymore. Find mixer using currently bound crtc.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

