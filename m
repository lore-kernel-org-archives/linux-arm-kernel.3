Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8594CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1lQDIOUYsjBlo4ocs57kAT3XVTll6xW8NP/rqlaXgw=; b=RXq1YC4vL7hImr
	N3CkXwWTz810RvTSzfYWtT4rNW8NGGFwiyvjyg+y3P5+6MC1WgbscqsrOxsIaecdbgLtz/bRWCqW3
	/g/7bDJCEl/65j3GpyABa8lQtsxl9OwQlP/AJij2HKjF/gf+P5uyFkvgMaJK6KFTcHDAPEOYpvOQd
	6bnbW+LmSNRMopYYeiyxiyBC0bPwLu5cmNNnn8AKUReiqh9nhz+tHlqXm+YcEE4PQxreAFDvklbOy
	YiZoWgx6OFxo1iOlcB8o/m6nhX5L44Xk5R4Kx7JtpUFfYNydFdQnq44n+AkQfmREMHugjjV584VxF
	9M40p6GZKVqrRuEM/t6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwGn-0000000A6ry-3SUA;
	Mon, 03 Nov 2025 15:14:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwGk-0000000A6qc-3weV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:14:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F38943BF5
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 15:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA4EC19423
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Nov 2025 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762182894;
	bh=X1lQDIOUYsjBlo4ocs57kAT3XVTll6xW8NP/rqlaXgw=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=d9DZanYu1Du0MYDLUS/92X+Uwvd7DmItGjVLn7l92ZW9DEUb8dEouTlqUwbuYBZIG
	 pH1gQX7ZxOuFzhDCHe1s9G1KSvbw67fwVhKmCxVsahiM4x5/rVqHu+u0zq2W8ODsoz
	 WJKUcHd5pr5oqkT/iQb5R4T4g6WV2iAa1ZTE1eSPGtr4DTB6shuHq5kXqIQZd1KCoy
	 Ncb+AIiWy6F51l7Sq/I7eO7jQ7OQXP2ga3CqRE2OYEinAFBBmjD7g9EP+9O7cTMeDs
	 JLxEmg5g4qWSllg5lno1JojlPBPckXZm0wq2CI5DsZSfACxyfyaUpu5nVc7Vg9Fqyq
	 bGk2N7GSrgBCw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-378cffe5e1aso16215961fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 07:14:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUytF/NvaE89MIZE+qX/BN+fYhzMGv7QNk8WxOHVF3WrCKBuWp6utT/L3UPnF05DlU7Ssg+yptnfjtAgvW4t/4J@lists.infradead.org
X-Gm-Message-State: AOJu0YxBuYh2RuHFkdyp5wlMfduQK5zbUzNmkeNAhSvPeRbCV36h3nYF
	fI4Gg2fTerSy0urayqbIJP1OKwlfexhGwBtSo/QUNlUPqf1Rop0V5NLZsKwHYiGIFP81sBXuvf6
	yPdIucAII7+XZSikybczjPre6qAp9POk=
X-Google-Smtp-Source: AGHT+IHZDkoXxNdhZHooF7In6ZS/umouiKh+BmptD052LhPp+RR7HY7bCHqMPN8dvQ1n5W4zzJk3EOAaNxVFM3Xu/nE=
X-Received: by 2002:a05:651c:b11:b0:37a:2c50:c437 with SMTP id
 38308e7fff4ca-37a2c50c5c6mr22032461fa.14.1762182892512; Mon, 03 Nov 2025
 07:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-21-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-21-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 3 Nov 2025 23:14:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v65ubpB5sKnfQVej3AOtNSX=xAfh+RDL+=qZ3oz0j8-rDQ@mail.gmail.com>
X-Gm-Features: AWmQ_bk5XxIurfQd85eS3oxbla8XyM5TbCCjYCsGGsUnTgr3dnC2wC7GmAAQMwA
Message-ID: <CAGb2v65ubpB5sKnfQVej3AOtNSX=xAfh+RDL+=qZ3oz0j8-rDQ@mail.gmail.com>
Subject: Re: [PATCH 20/30] drm/sun4i: layers: Make regmap for layers configurable
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_071455_008749_6C71EB4C 
X-CRM114-Status: UNSURE (   8.81  )
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
> Till DE33, there were no reason to decouple registers from mixer.
> However, with future new plane driver, this will be necessary.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

