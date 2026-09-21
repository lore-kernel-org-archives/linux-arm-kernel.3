Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD94DC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eyf5HB7rWUuykO/B4yjrMsebEOm1V7kPMebLHZRCWQY=; b=mE0vn+XFMEQcP5
	EYiIb4QJdifXhLw578FZ6eGIM3BYyXcHwjTVsh+mn4sI7z6Me/aVa+nIhmIHddKhg6wW5rRISWqrx
	JHPJrhZuQSSr/qjLXAD2YLTRgXcVZNDiWHYYBOZeptqA/oe1Cgtl78LjqY4tn40ZOIXXjy+6do34z
	/LVkwG+vMZCGqQAu5FEj1r/MSAevNbBDG2KZOXiRDVAxiaILk1RZpQLX2jBH3tsnmvX0ABzXAf4Zr
	gVjYCxWdWZfcc2yokvYO2e7WShvLE88bLdjNenIgLqxTpcEAYwHDn6GHuE0ZV8x8glGYLRvxEaTrN
	h7ulfmUb2VPGqAkHvyQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gT0-00000002lKX-25bo;
	Mon, 21 Sep 2026 16:02:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gSz-00000002lK3-0bEd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 16:02:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84CDB43F44
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 16:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546DA1F000FF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790006524;
	bh=Eyf5HB7rWUuykO/B4yjrMsebEOm1V7kPMebLHZRCWQY=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=MHVHrTUhgy8RLJSB9PCb96C+TwYoxk9OPxsY3WYUd2k1pUPyfhn1jxqcnLx12ZXbI
	 C0zH7D0SYWucL6sTXnsFxG2XnRXG505wid63EKjGDRqyp94l78SpU5yfs9I3E9s5nE
	 WXbF+pUOvv4AWZMdfjgwUSRby/OgOgpSqHRAX4SKAvSMpyq/zbOFoLZ/kYDzgMjRgz
	 ugE5ZMnEKTcPpmROkZHM0DRhibmf7XlTswHDYXcMj4LvmRsBFPTpqMURa/KDisRLaW
	 zz4Rlsh2QivIdiY/m5H9SAaOTlKAURKON3hAb7WOVVqnwGQhoDyprV4XVucAJ/LMi/
	 Hwii7b6VQc6sw==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5b2864f1cso27530051fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 09:02:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfYFYcH4UKAZhx0WBHwHvjcr5kKWHF5CeKh1NjZrsCUNM7b3j/djrD62oOU+QHxJy0DoBO5nBuyw5cwqMZqzv4@lists.infradead.org
X-Gm-Message-State: AFuF++n/0WuOTFCeSNyyniXGXgq6tLbJlcRm6LrFLgfwoBmXBuGhaVR8
	/L+zCHSbvZf+sMx0qlHVvqo/MqKVfoZVBYKYctKhD3840+jXjU4jrrjTn7eeuDmwVIYTKU0qjpt
	drSASacOW6U9gwezPC6XQHW2d1SrXxO8=
X-Received: by 2002:a05:651c:1443:b0:3a5:afec:9cf9 with SMTP id
 38308e7fff4ca-3a5fbf36939mr24677701fa.7.1790006522575; Mon, 21 Sep 2026
 09:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech> <20260921-a733-clk-v4-2-9c184ebe9ac1@pigmoral.tech>
In-Reply-To: <20260921-a733-clk-v4-2-9c184ebe9ac1@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 22 Sep 2026 00:01:48 +0800
X-Gmail-Original-Message-ID: <CAGb2v66wbv2W1mcZ_WzKnkgiSYYm89LGR67gYAgsNgSFYw5mfg@mail.gmail.com>
X-Gm-Features: AcwNN1WJSlHI-NjxkeeWhPwtNL0p2-F5vEq-B0J5BRudScG0IjIZ4ZswOa7ekVg
Message-ID: <CAGb2v66wbv2W1mcZ_WzKnkgiSYYm89LGR67gYAgsNgSFYw5mfg@mail.gmail.com>
Subject: Re: [PATCH v4 2/8] clk: sunxi-ng: sdm: Add dual patterns support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
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

On Mon, Sep 21, 2026 at 11:39=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.te=
ch> wrote:
>
> On newer Allwinner platforms like the A733, the Sigma-Delta Modulation
> (SDM) control logic is more complex. The SDM enable bit, which was
> previously located in the PLL register, is now moved to a second
> pattern register (PATTERN1).
>
> To support this, rename the existing "tuning" members to "pattern0" to
> align with the datasheet, and introduce the _SUNXI_CCU_SDM_DUAL_PAT
> macro to provide pattern1 register support. Related operations are also
> updated.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

