Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7D8C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 19:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXI6gFkjQYZ+NYsO8AhtQ4GmNWfEVEfMDOECqmQ48FI=; b=llYIGEeo4g3G2N8lgHzv2bRRHJ
	njW4txIsRab1Q38oocYDo1ybOvHIlQEuuF450V9RUDFWJuMvQigkbXET/oIHqVDsUrhdzQB0qeGCw
	PKx8TeuAzfJTtDmtPskf8LoDX4+W/DsyQdzYhECfMe7YXpVuHCM7nMQD9a8ZxsLDLiAzvPm/scXKB
	ktr7VlZSSifF21mSuX9bqhrho5A6tvDSKct30HbLGb1/1+U30I6/iTYc1D51QmALK+11ERwBDNv8p
	cedtjl07nbO748a7q0Q4wT/pK6aFE/MyIls68Jyhq82Q3dVJzH4Zdz7NXY8iDczNPxvbAnhznDAsY
	EmVO2vhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonYV-00000006Afp-3UfC;
	Tue, 28 Jul 2026 19:33:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonYV-00000006Aff-03UP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 19:33:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D90560A5E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 19:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9ADD1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 19:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785267213;
	bh=SXI6gFkjQYZ+NYsO8AhtQ4GmNWfEVEfMDOECqmQ48FI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UhQoP4fwQT/U04THSEbnxCTgBCvNja8g73PmWS1fh0hFnFNgwTtWxfvgJPBJHgft9
	 5YV13qSMLGOBqBgGsiMAbDp9vjYRhjehqIroPzfUb/2S8pf0Jbu/o9Dez8UX4l5QBg
	 4PAzQJ7TbgxUyho1mmX/fblyz2DNUzjfz4DRxVMpO59+J0FnK0RdIHzVJfADqMYy9j
	 ozZswU9+IXmj7XNXUwdh1F4XA14kb6C6g8U6Nmep9PLDPVgpml88uvBPRHgzFrs30N
	 YE5scn29I9L6fS3eJqdxazdb8etVGy0iz/L5GLzLcgr48cpJjaODFpvFN1iqcFmzH4
	 dtUBam0By19QA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b021916bd3so113600e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 12:33:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpA63ZPqA90lqRW5M+fS6Q1aLrzS8564q9IfO/0S0ycnwfppWcobRn96kNTI/5PMSNzz6xpo4QvKdStqDaKXcV9@lists.infradead.org
X-Gm-Message-State: AOJu0YzOt/2sninN27tSIaxypI0oQ5GHQPNRZhq347RPSaOn/ZKnDaYu
	Y/GfLPk9md6QVKiXxHSeEtSgW7f2GFtOcgjRGoeUJrGamV1s9cRpNr4y3e8Dz/bXHsxY30KcYnA
	AIbfcUkFZoTGK5uU1YgJv+nzzP42fJmE=
X-Received: by 2002:a05:6512:32c8:b0:5b0:1c19:2cf4 with SMTP id
 2adb3069b0e04-5b2d024a79amr690589e87.35.1785267212617; Tue, 28 Jul 2026
 12:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260108080332.2341725-1-allen.lkml@gmail.com>
 <cover.1785183549.git.allen.lkml@gmail.com> <119d257968c0a337b7e439fe71b59636e7fb37c3.1785183549.git.allen.lkml@gmail.com>
In-Reply-To: <119d257968c0a337b7e439fe71b59636e7fb37c3.1785183549.git.allen.lkml@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Jul 2026 21:33:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmAxMVzV=5zhk9=qAnKW=dH=kyaMh2ZxHXkC_DjUag5Sg@mail.gmail.com>
X-Gm-Features: AUfX_mxp81_Wlqgv-Ug3odEUUq02BXPt84M_OSF4GyANip7gyAC3QepxqZfR9-I
Message-ID: <CAD++jLmAxMVzV=5zhk9=qAnKW=dH=kyaMh2ZxHXkC_DjUag5Sg@mail.gmail.com>
Subject: Re: [PATCH v2 17/64] dmaengine: ste_dma40: convert per-channel
 tasklet to dma_chan BH
To: Allen Pais <allen.lkml@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jul 27, 2026 at 10:32=E2=80=AFPM Allen Pais <allen.lkml@gmail.com> =
wrote:

> Replace the per-channel tasklet with the shared dma_chan BH helper.
> The handler continues to run in softirq context while dmaengine owns
> the common scheduling and teardown mechanism.
>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

I like it.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

