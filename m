Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB7EE7FDF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 00:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vm/kv9zRIpvGnIGccp1SO6U/rqiZ7lbmB29xc3r2O4=; b=Uj+xHWEKdHKKWcM2pLxnFok3/2
	vvvpKkgx04l2sIwK6Tw930pDXGFhHW9kvuoVp2UIWObslJ5LJz7rEP/RTxV0duliwAvM3KfTok7pE
	YfcvZuPb5r8MfEIWNYbPIY8ZcK/FPXkTWyL0k7oWzYAnrqaWJVAXVSGi02TuSm+pvs0oD51HaFDwC
	b6SkL/EforvvtjYNeghVUkMC/QlIlMqF26tEy8+pT138VF1V6hxhw+SfBTayypZ0/r+lTQTrx8HZe
	I1HucYVTR3np9+6te4dBvin0rnYywoEcPipND5LFNYYn3OByLVizXBgFrgvC3wdEmOd0oAwWkWUdj
	wa9PC2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4IR-00000005nxv-3huk;
	Tue, 03 Feb 2026 00:29:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4IP-00000005nxb-3hdZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 00:29:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C67B660010
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Feb 2026 00:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81607C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Feb 2026 00:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078572;
	bh=3vm/kv9zRIpvGnIGccp1SO6U/rqiZ7lbmB29xc3r2O4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XaBK/mOzkTYhQZqO6JQWlHL58yajICAJIZdpNOopAfmbFcGDwrpEXkaLY7hGkwgpu
	 98KmUDhA3PGE30WGhYR/m5Nj05a2nOAQparfCW1gB1QHr067PweZRjQdd5DVEARIYy
	 hVIPQzyqLmDDgY4FpE0JQbyaQJfWE1wnEgw6UBXwJcx4jtP07Z8eQCNmNJSwjghdFW
	 tYyZ+pfLtTkcKIJs6o21BRPBEThMXpSy29xuJ4DwQnjwsLYnLCW7Q9P9pJpjSvZj13
	 ffS+I+PvSQnhlZsqXSBvLQs03ZEaR+6g0t4RVrH941qOhS/SMkDX+9QcaJnTYem8ah
	 KJ0EbO3mfNYWA==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64942ebf1a3so4627863d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 16:29:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXObGKGFrVsPLse9JnsvWfOTIgWS47q5NiD+4H2WEfxIaqXIY0codneSOTNg/lT5uvVoIcnygVIdYxiRPoVGJdn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3zLuIf8NyFs4YHUugqiXyUOX32qMiptKKoQbSwwpE602AYkFG
	XJeTTTMT+PlEwCzyOEgrkOs6hRkHfwurv+wXB0E495XfJgKTf8/Et3DQqPGf6IqPXwbxfyaAWUA
	CHIP0vxmwRrIy7VjU41xDN2CG9z42/rU=
X-Received: by 2002:a05:690e:118d:b0:649:d19d:3b08 with SMTP id
 956f58d0204a3-649d19d3e01mr1760131d50.89.1770078571815; Mon, 02 Feb 2026
 16:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20260128-amlogic-v1-1-c8aeb2953dcf@gmail.com>
In-Reply-To: <20260128-amlogic-v1-1-c8aeb2953dcf@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:29:20 +0100
X-Gmail-Original-Message-ID: <CAD++jLnM+_ot6CyDKYDUKcy5EcEFYbDZD1_0FxHoxF=S8yFyPA@mail.gmail.com>
X-Gm-Features: AZwV_QjBQY1gX2gsq14TbI1JTob3bjmO9B641FWFogw9-JRL8gq-V-nd0dVYpsQ
Message-ID: <CAD++jLnM+_ot6CyDKYDUKcy5EcEFYbDZD1_0FxHoxF=S8yFyPA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference
 leak in bank helpers
To: Felix Gu <ustc.gu@gmail.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
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

On Tue, Jan 27, 2026 at 7:23=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:

> of_parse_phandle_with_fixed_args() increments the reference count of the
> returned device node, so it must be explicitly released using
> of_node_put() after use.
>
> Fix the reference leak in aml_bank_pins() and aml_bank_number() by
> adding the missing of_node_put() calls.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied!

Yours,
Linus Walleij

