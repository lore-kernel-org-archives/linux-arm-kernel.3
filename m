Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AC0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 17:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohhHy5uM0BVFQV/nNssiB/d3H/GEb9yqQS/GAiFhZUQ=; b=iDPGEu6bhrBigf8IWTu+NauiBG
	5ipfjEcXybm6JQnyyTC5cNb+V2fW23xzqR58irzYJi+rkGhgqk3ZMVLhv1M7MwaTjgUhsjWONlznO
	NF+94NXlr5j59XMhphPIOHmyP5vSyPM2yC1h1lA6/8FRMnh0SpcqN9ZdTKBlUxDWtoe1nogm0fE6w
	f6wWZweLCxN3aJalGYIvpcY1L3+YDn78lrmzG2s8fji0ahie5mFnFIJ9fvH4Tf3iSJBf/gf6+mUyk
	Wiv/GCDdyLUXPjNZ8FL9a8xJ4oTkCYhCWJtJTGvnumDHRA55D1qeCgHrr8rwbmtx0i7khGzspBGMM
	1UiYJxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFSx-00000005TIw-2HTU;
	Fri, 10 Jul 2026 17:56:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiFSv-00000005TIm-3bUd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 17:56:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9DE3C43925
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 17:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823211F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 17:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706205;
	bh=ohhHy5uM0BVFQV/nNssiB/d3H/GEb9yqQS/GAiFhZUQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eWHz92+hhvETH9yEvLYkZ/h20XBEDr7hqkPjOxm8+Dsi2IUem97d4KrmYAwYEPZhw
	 DrJ9QcScNP7OiZN742U/aUoWExu0FPXh0dA70aI4AKnSPTUcxuVhUky8DNzFl0tD+U
	 otEMP8Tp37C0Z5vZsuzzz2x6FMjpREw3z/eyZQ2yF0SbEbh2EAOJqxWvJ1vITYXw13
	 mHyPqdEGpFYKY5vCj4nKtNiMVqsC/wX/iMoLiLVs1HhxhKXd0DR0eR0khMu+2JLgMF
	 2jTv/6uDj8TFdb4J0CvmiE72mHg53nXP3ZRP78zQ0VF4uIY19QjqDRey0omF4gkVll
	 qiGQs2AEKqrrw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso1086126e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 10:56:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrkJweVtym5tYgm7VsrBD+lNafdDqZUF6p208ZW8E1CcLlGDNY+1msyjaeoPPsbN8HC3HrYJnnF1PNWlEDFvT46@lists.infradead.org
X-Gm-Message-State: AOJu0YyT1tStAxyddYg5l15rMOlgdXAS8LsIVYMYHTS8YrsGu0FrEhMQ
	KPCNb+3pRMvnHQUn5zXsvWAgppSGynbRF2+bH+1EigvvBFeNxt0SLV+emUeF+BLImBi9coUOXs7
	POVieCwZFITUz+207BMxXDQSWIacyuXo=
X-Received: by 2002:a05:6512:40c4:20b0:5ae:c454:3740 with SMTP id
 2adb3069b0e04-5b0236ec2f0mr21748e87.60.1783706204298; Fri, 10 Jul 2026
 10:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260704121524.42229-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260704121524.42229-1-pengpeng@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 19:56:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLkddRr5WwLGmf1XnO+hS16ss3ePVedC0GXcPWs+Hq6A5Q@mail.gmail.com>
X-Gm-Features: AUfX_myjzJ7OaZTkgOU1pIQclIKeQe3hhnCAquIhA8MZ1Ke5dbwipiXG6jzcPLA
Message-ID: <CAD++jLkddRr5WwLGmf1XnO+hS16ss3ePVedC0GXcPWs+Hq6A5Q@mail.gmail.com>
Subject: Re: [PATCH] crypto: ixp4xx: add missing MODULE_DEVICE_TABLE()
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Imre Kaloz <kaloz@openwrt.org>, Corentin Labbe <clabbe@baylibre.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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

On Sat, Jul 4, 2026 at 2:15=E2=80=AFPM Pengpeng Hou <pengpeng@iscas.ac.cn> =
wrote:

> The driver has an OF match table wired to .of_match_table, but does
> not export the table with MODULE_DEVICE_TABLE().
>
> Add the missing MODULE_DEVICE_TABLE(of, ...) entry so module alias
> information is generated for OF based module autoloading.
>
> This is a source-level fix.  It does not claim dynamic hardware
> reproduction; the evidence is the driver-owned match table, its use by
> the platform driver, and the missing module alias publication.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

