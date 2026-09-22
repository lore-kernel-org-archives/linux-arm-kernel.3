Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869CDC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DQEnJFVllHwbW40pTjtz3mCOVWOR/ZxQR6GILf0wtA=; b=Hf1g5IBq3IjjpTSdGEsFsKTG/0
	Il4Mp/N4ubgmLbG8abk6nUJyRhHcLFUKfuekN1fPj33pcr1SauWZguLXx6QGv/qjpLfuj50ONvfc8
	if0dFDMZ8g8tHHMR3oNDRXDs88wBI/aaRepVlxqtdgthsvkBonkIQmiSYfTCtOsEDZfRI3xrLkTim
	P4zJE0wUFqlO3s6kVYq6wuvJ8zPAC0FCfFPMkBtlRHy8L3roRLGEWHz4uQD53kQtftHtZLbw02VQH
	VreGo1/MxRcKShZ5rA8ZK1ljK3ayIlQX+scTs2mzyK0kFWidj0KkpuW8c5yvdyVEEB6hfpFkjd5H+
	ldq8LScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uf9-00000004THl-2GVd;
	Tue, 22 Sep 2026 07:11:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uf7-00000004TGp-2wkY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:11:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2879F600CB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4EAD1F0089B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790061092;
	bh=1DQEnJFVllHwbW40pTjtz3mCOVWOR/ZxQR6GILf0wtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OTsr5Lb5UHx/VDj8Clip1MTlSxBYM87CBUMbskz7I7Oiw7CDR1llqetobjCTmA15c
	 3+Sq7hijVT+wX9xDkfISYHvTXD9BHzYQ4/yrGGg/0H3oU1PJ5h5qw3naLK7dmrXObm
	 sFYpyhm97n6JE7iNGr9Lbu77EoCVs21anHVLRMfvA3mJ413vV+ih8/y8aEy1pbsJ9w
	 KTcp7ISZnV8RmwxbAKZPlx42z3g2Wjmtt2FT3InlqxFceDkdZ2alxWRW/ZVUQzcnL2
	 7C5JRr8VPsadZrq7cQmkrCXgvn5Rabm/EDEolTrEKykL3lZ5YU5TkPDst25KpptWlg
	 2/ISdcKTGqmZQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so1451023e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 00:11:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWdTGTHHQKYAojuEo1sYjN4tg3uTxRVtOOfL6nlCTPC6m8tGVbqo2MQAkGNoeBEltB1015usyUvZ5USXxzcxVX@lists.infradead.org
X-Gm-Message-State: AFuF++kk1rrZ5GfY9xBNUtj0mXlRMbu4Seor0AWFFwxVFPlhEAG4H5sg
	nFMdnZ8rkPslO6hN0b59/vdBqZJHTZLkjp1EE8H6oewlC/afdTyrTf8FILGZQcW8lZ7M1Q6qCca
	zr/scABPIquHA+eyU8UPhMzaU5DDppvQ=
X-Received: by 2002:a05:6512:669a:20b0:5b7:5cbb:661a with SMTP id
 2adb3069b0e04-5b8d28a2bd4mr380020e87.0.1790061091499; Tue, 22 Sep 2026
 00:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260921-cv75-v5-v8-0-282ff5d98dda@ambarella.com> <20260921-cv75-v5-v8-4-282ff5d98dda@ambarella.com>
In-Reply-To: <20260921-cv75-v5-v8-4-282ff5d98dda@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 22 Sep 2026 09:11:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLnUVOAtq-h_qDdWpEhZFZehFKo4qqgcTHD9zDQTdF4yhg@mail.gmail.com>
X-Gm-Features: AclHuK8Ptv8BXFdyCOuHHolcneppaQqVWDApnFcw2pV5vhsl1672OQ5Dk_LeJfk
Message-ID: <CAD++jLnUVOAtq-h_qDdWpEhZFZehFKo4qqgcTHD9zDQTdF4yhg@mail.gmail.com>
Subject: Re: [PATCH v8 04/18] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
To: longzhao@ambarella.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Long Zhao <zl020895@163.com>, 
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

Hi Long,

On Mon, Sep 21, 2026 at 6:23=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Document the CV75 pin controller binding using generic function and
> groups properties for pinmux configuration.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Is this something I should just apply to the pinctrl tree?

Same question about the driver.

I'm not sure you'll get all of the Ambarella in for v7.4 anyway
so what about putting some pieces in place to begin with?

Yours,
Linus Walleij

