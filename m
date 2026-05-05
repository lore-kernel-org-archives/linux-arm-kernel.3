Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF73FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16crbpE+fo9e6NqCvKQRKG+iiqH3XIXLq7L/8lqbgiU=; b=NbkoqnVy2FY+Nw
	mCD8I6zaXU5xk8ktQq16femnp58QwThgGONBVT9K+WBm224X6fsCyFbCMB3bJP8SH/Xi8WOD8t8Sd
	QgSgW+qi0XYGEeTlt5CC6NavQU6uH2BvmvmEAEHrZH5nsRQlBPtXfAeWinY6JkAfpUmlacg0yDGSi
	8qFAVoSRnKd/9tdfJn/WAIro2bkRkMy0Xn7NzkB0cfxud9wFWGMJkkah0pEyTIs2jjfrGqK5dPpz3
	9O7jwBQKTitHBMQjvr9UvEgJBc/q12aKuC7nCrRC+/RQ90NbdAaS/YJ186h07eF0BWy/DNOulwS8b
	7djsAdfSsGSksFuDmtew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGCl-0000000GOlp-1d2Y;
	Tue, 05 May 2026 13:52:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGCi-0000000GOl5-2qnJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 65FF040AB4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 13:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496AAC2BCB9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 13:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777989172;
	bh=16crbpE+fo9e6NqCvKQRKG+iiqH3XIXLq7L/8lqbgiU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=hzd+lenkIMEVcvFwN6XXY/tuY5oA+9X322v8bFhDINbThAWerGAdEQW+ldLKDn3FP
	 D1e7cP/NwtJw+pjK3hpjKGo96j3HK4eOJTZ9GFbgfsgjXhjkuLQ10PRq4cxnBuxSR8
	 rEfBJT4nidKWMISjVu875veccvSMvxbXz2inBZCc0TnqQFYmAV88ahSLMhrO/kX/am
	 FSTXsArL6p58mCna/BtGv3YDGYOrDHUeUoVWx37rIfvxAS6KGyXdTk+psiPRzqZQ+u
	 pbU9o38l/axINVOX8TOA13UDEgYIqJjGsEVJw8L+TAVtJS2p9sYA6ANaavdlzA+lYF
	 F5spwNTB2ADjA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e7d984096so59562801fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:52:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+xP+zvk1RcYki/ClotpuGSJ6+V9ryI9IZ7CJxXj11LDKdXUSdO2ZGDtXHim19U76cH/YAEskl6Q9vS4ejXC3nP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7y/RIoz4grUKmw6VFbMtbN7O1ls4nkl2l2GxZRd8TW5+x3Ym0
	rODs+eyGxnXMUbDvFOsm6lR1XgmLZkMzqoCn/L2cYa5+DpT2IqpFkblj2/L28dZkoHOac7aKk2g
	sA/rrILY0Q6uoeasWkY8PY5pq7FfHino=
X-Received: by 2002:a2e:b0f9:0:b0:393:975b:5634 with SMTP id
 38308e7fff4ca-393975b5741mr29824471fa.11.1777989170742; Tue, 05 May 2026
 06:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260504050245.646078-1-iuncuim@gmail.com> <20260504050245.646078-3-iuncuim@gmail.com>
In-Reply-To: <20260504050245.646078-3-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 5 May 2026 21:52:38 +0800
X-Gmail-Original-Message-ID: <CAGb2v675Pw3a=8VkNc_ztYtQcCdezG9PrntXLHO8YgGx5bJjxQ@mail.gmail.com>
X-Gm-Features: AVHnY4KSBoJLk7nvV-NLPC9NRZBgg446WsQhRQL5baEYgZM1ln_FGyUdU8wzQSg
Message-ID: <CAGb2v675Pw3a=8VkNc_ztYtQcCdezG9PrntXLHO8YgGx5bJjxQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] thermal/drivers/sun8i: replace devm_reset_control_get
 to devm_reset_control_get_shared_deasserted
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_065252_735050_CEEA08E2 
X-CRM114-Status: GOOD (  10.82  )
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

On Mon, May 4, 2026 at 1:03=E2=80=AFPM Mikhail Kalashnikov <iuncuim@gmail.c=
om> wrote:
>
> The A523 processor has two temperature controllers, but they share a
> common reset line. Make it shared with the shared variant of
> devm_reset_control_get(), and also simplify the driver by switching to
> devm_reset_control_get_shared_deasserted().
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Update to:

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

