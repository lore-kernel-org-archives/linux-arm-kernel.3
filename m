Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7BEFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5UUQSZu/wPr4836GSLJWIXuKTCHCzhzEVsH9sTY0wzU=; b=trJlP9aGvmzw3L
	dXi/rdtDzVZGHhBbRb24YWSPtcdBpv4wn6DeMzdJZEp7Gj03oB4g/qjjiQuvA//WzL81ks6mJCSHS
	eCQqbULNAfy+oOO42+876WOxUwqlOfg/gBO5Yhi56rG9o9c6CFA6os6NUU3VUhLcKDmFY593Fu8sX
	RTIfgXHiU7djLvBlOJHCJNw2SxzBo3xzjHUPeWL3belRU6GOd8fcG565iV4zJnaTidXUqgOj7Wiaf
	i6aezMV33lUbcjsvXDAb1Ldz8WnV5h/+dmBfirnnJHCDurTbDBA1Of/9Qd4sP83ftNCR8n6S86ihN
	F3rpy7qM1I/39V4CdKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGpI-0000000GWEE-44Xt;
	Tue, 05 May 2026 14:32:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGpG-0000000GWDf-1iF3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:32:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4B9344281
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 14:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E39C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777991561;
	bh=5UUQSZu/wPr4836GSLJWIXuKTCHCzhzEVsH9sTY0wzU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=Irx1wel2eHCp42ENSZoSM1DE2pXk7V5WailF1o8pMVh+1eQJfjd8G962rvEJbiSRc
	 Mx1qJBRpSH6RSlcu9PifweOvHPm5PPmMHWtaw4aZoq9/w2fS12nXYF0HPjTPu5vdRT
	 v3YIIYb3CbYeBHuFQ1eSH+/mjSpHqC1LJxRP2DEzZVteafJZaVbaLn0gRbWFQ+LqO+
	 jJJpywoyxreKMy9VCU9+u3/bjgE0fr8F73DHVBtPgYh9ez6siUxtozqb+oT+Dqg2uP
	 BrIlnYQ0Hzu2hsRXoVCaKR01rQgYION3FtIqbWLukHh3Sn3njKMrOr1bknVWLmR/OA
	 YK0CaD77tdzLA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a8738c178dso1602535e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 07:32:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9WHjafHEqh8gx+45PwO7raMOCQSiaCmGPgSodHtzKgAMn/IIaCERi33mNeNebStQPRC5LIQBb8LCMkqnCxv5Mv@lists.infradead.org
X-Gm-Message-State: AOJu0YxTnouKWgsKd4ootCPIlT7OXsUUQ0/ZDvBg5NdKXZEWekM+rlCG
	awJqjVQvKNcxSla2Y1nF1riUOHUOolpz+ohyB/ZlIy4bBO4wrrw3VkUSlrU8pKYktq+XcJguf39
	NYxF1X7VO2ajC+ym3xHQCAQoV2qzrfTM=
X-Received: by 2002:a05:6512:10d6:b0:5a4:175d:1278 with SMTP id
 2adb3069b0e04-5a87f1a0551mr1565407e87.1.1777991559950; Tue, 05 May 2026
 07:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl> <20260428-h616-t113s-hstimer-v3-2-7e02178a93ee@mmpsystems.pl>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-2-7e02178a93ee@mmpsystems.pl>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 22:32:26 +0800
X-Gmail-Original-Message-ID: <CAGb2v679HMu4EsJVWXxrTFsemFvKyjfFbJWxQ=eNvAACZbYFpQ@mail.gmail.com>
X-Gm-Features: AVHnY4IaVX6DpQmwoUpBlMFQuD9nalA1_rpExzg-De62sn6g73dQjm9IIJe2UMs
Message-ID: <CAGb2v679HMu4EsJVWXxrTFsemFvKyjfFbJWxQ=eNvAACZbYFpQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clocksource/drivers/sun5i: add D1 hstimer support
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_073242_482491_606137B4 
X-CRM114-Status: UNSURE (   9.01  )
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

On Wed, Apr 29, 2026 at 12:29=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> D1 high speed timer differs from existing timer-sun5i by register base
> offset.
>
> Add sunxi quirks to handle D1 specific offset.
> Add D1 compatible string to OF match table.
>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

