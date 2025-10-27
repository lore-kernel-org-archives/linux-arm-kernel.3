Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B281ACCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qXSUYkzcaxBwT7PR3VqEg24D+wripCaqvcwPYVLA5qI=; b=NcwcJ5dep1OHcn
	8gloWU4RscS+lUExW4s80fcIicRMPXEVEBD8kHsYolWxu521Y1Xw9F9ASIq6Wm6NkUsO/Dtxoewev
	dwIhVkPCmZ1aVkzthzLlMUvFQF3COmMHuIHl0ahY+DtU8gPQvMS+Dtg/tQBuQGz0HEdQHjSXjPAUI
	Eu6clpCMZ2hIf8C8xFbiCp3/WJMPKauTHzZofcp/QD/k2z0zZrItWlOWrIQwwCN6kQxQdaEAfpMDP
	t6JyonRbIl5s1uGF2aiW0pbP5dkIBSsKlu7LxE40atHwkI8J55iB5occbGimOo01pXJlrOsCguoOf
	zpyowz4DaU8Am/iVszXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQS3-0000000ENKq-3ROn;
	Mon, 27 Oct 2025 16:52:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQS2-0000000ENKM-0iwE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90B06603F5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 16:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA67C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583929;
	bh=qXSUYkzcaxBwT7PR3VqEg24D+wripCaqvcwPYVLA5qI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Iwct5VBPLz0VkdkDSWA+HrPfq9WSIDgOiBU1SFjAF1AcNrlIMqb/K6BJEIAGdqnDo
	 nSYm5SFwJ0O3gfuFSQuRtXlC8uvgpY9QZVV/RqPJlFRUdoiTZ0OKMcG76JmTNCyhtL
	 WbbrviiIdewI9HQpiX1ojEqgxxlwT3YuG1d1NxPvTzKPrix72aQsZI6VhdLrmi6S6V
	 FaOb6ftKOOF809X6BKto2rZEPE5roKhFJmZ0V3/pOEkikBV+jYcTxfhbXqLmYjhBzV
	 09iymB7lCmWV2jWUt2Oiacanu77v+Gm2HVuxvqIRJc/VbiYEJ3g63piplTXo9niAXS
	 PDsb9hJOVP+ng==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-378ccb8f84aso52453451fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFC/IuDo3HPEivJFoz4hWwQzmn/wUdoMQ7ccO48B9jcBbMaA3VfHYSskhesp8FtqmyoRHIPkDDXxhEhMyRvxa2@lists.infradead.org
X-Gm-Message-State: AOJu0YySLXOkqxaXRqUjmtfswQHuLOvvQdqJlUeMs/DqJUF3JLveNWYS
	TxOGdrh9U2/asX2SfxhsplGsOGFK0PmM9ejmFr4P0IvcSdtTo3KvSRjHP5R7Tl6IHAoZfyHYuPK
	IFtdBVAmGvcaInuaHPaii/EMSg/n1BF4=
X-Google-Smtp-Source: AGHT+IFBPJYi1S4vop7Gb683MwdHCr7hm0ZlNxSJGBcGt42mr3LXF0sb06/EOe6oCAtgC1Lcmldr3eesncU595uaptE=
X-Received: by 2002:a2e:320b:0:b0:36d:1f0e:1c02 with SMTP id
 38308e7fff4ca-3790778cbc4mr742181fa.39.1761583927610; Mon, 27 Oct 2025
 09:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-13-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-13-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:51:53 +0800
X-Gmail-Original-Message-ID: <CAGb2v66hnO5ZQHR8US=TdCY=o2TJRgntCDFonKY4=aQi69oSBg@mail.gmail.com>
X-Gm-Features: AWmQ_bkqru6Db363dehTH0eyDlHZatRKL_5iBGTqBIvG6dXZWDY255VHS1_NOZM
Message-ID: <CAGb2v66hnO5ZQHR8US=TdCY=o2TJRgntCDFonKY4=aQi69oSBg@mail.gmail.com>
Subject: Re: [PATCH 12/30] drm/sun4i: csc: Simplify arguments with taking
 plane state
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
> Taking plane state directly reduces number of arguments, avoids copying
> values and allows making additional decisions. For example, when plane
> is disabled, CSC should be turned off.
>
> This is also cleanup for later patches which will move call to another
> place.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

