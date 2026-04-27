Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D96CFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaSxrvp/mwC13Q7utahNJ1rzVTRO2S3htqAsC9VGCkg=; b=lnm19IC15Ig4841nvABkVQeeqp
	gcEAutNFCxxmwZ2uhAOhjV8ZIkXvb2Nmq/d5Qs7Ag2R+DxpR8Q8qdhYD5QTCgFZu50DxHKTPq9Hes
	dg1lMqJban+6nMDj5De+wVNa+dsKIpb7O2m/IRNNmoUoNmAWEByHY87+GNQRB2d77oezizMlwNRqV
	Y8nPKtYXyDdtx2b7W1RYYNx6Z0Yn6RcSa2L71Tr8Z2NVyMcG9hU349+eWhMLcwxp7vsDPgdBzVEUL
	5G2KOdDfByEkCBWhC/k911BW37Ekw3lzbN5Me/H6UGBaoTN6LYUfftH/9n84BP4yL6Qb/qsVquyeg
	VsTozDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHzg-0000000GXdV-0sQj;
	Mon, 27 Apr 2026 09:11:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHHze-0000000GXch-35ow
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:11:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB03261420
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73496C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777281065;
	bh=qaSxrvp/mwC13Q7utahNJ1rzVTRO2S3htqAsC9VGCkg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=KqQVpv2klHN4COV6/FkHtGLvqgVFkUMT4XFJC65IOX6sG8xMXlBbILxqhy0DGLHWT
	 vRkBVrRrDhpzCvGLu4x32fB8S1yW0vfAc9KlRyvTuVA++qzvvZEGgFHssDxbhTY4ti
	 YnDMuXH7ZAKlVt9ROPxf+WG47KUlD6NKy82YEtUa897rWPOPFsAEtVEzvdP7ZBnypv
	 JbS6iOftOzhUtF19JtppvA8EkIF5VcT64Q9HY2QYf7Gakp6+pYjsfsZFQ/kGnFVaKQ
	 OSAeMrjCj7B4Ho9+Bq9FPX/4VanruG3fMzWDo++g8MHRY+pS5xHcs48rAbcymojK/l
	 n+6JnUbG3655g==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e800deae4so85137141fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:11:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/f9R8h9wMkbhrGwApsbXLJJOJGnG8SEBUm4T2wfZKyseFMNZl6iD/zdJPgITPrFCuPdIiyv5Ib8gmC11fPhdkC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsa849d4u6UaR5TMVALQoBw91FtBzyf6oOCQOUL5vVDK3dD/zF
	Jcw1dc+RYMi4h1ZDZZpXV+4hxHv5u3nXsd03KDfX8TS+SAeft2IGlsfvOlhK541Uf3UCMs3t64P
	gYL7w7bq8zChEhRhiLUZ6ggZrUdqicmZw2lwDmhtZpw==
X-Received: by 2002:a05:651c:1594:b0:385:dde5:1bf3 with SMTP id
 38308e7fff4ca-38ec77fafbbmr120389861fa.6.1777281064121; Mon, 27 Apr 2026
 02:11:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Apr 2026 05:11:03 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Apr 2026 05:11:03 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260426232705.422938-1-rdunlap@infradead.org>
MIME-Version: 1.0
References: <20260426232705.422938-1-rdunlap@infradead.org>
Date: Mon, 27 Apr 2026 05:11:03 -0400
X-Gmail-Original-Message-ID: <CAMRc=McUr8Tuv9+LNQ0=ufj1z4Tstp_ujmL=r7bXrLaBXg4E5g@mail.gmail.com>
X-Gm-Features: AVHnY4J-trfR2TwyypS6Hanf_46Aygty1UjX_AoYiPK6iXgvv9gAsNjcaBTj1Gw
Message-ID: <CAMRc=McUr8Tuv9+LNQ0=ufj1z4Tstp_ujmL=r7bXrLaBXg4E5g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: ABI: sysfs-class-reboot-mode-reboot_modes:
 fix doc warnings
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 27 Apr 2026 01:27:05 +0200, Randy Dunlap <rdunlap@infradead.org> said:
> Repair the docs build warnings in this file by unindenting the description,
> adding blank lines, and using `` to quote *arg.
>
> WARNING: Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:36: abi_sys_class_reboot_mode_driver_reboot_modes doesn't have a description
> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: WARNING: Inline emphasis start-string without end-string. [docutils]
> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
>
> Fixes: d3da03025e6d ("Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

