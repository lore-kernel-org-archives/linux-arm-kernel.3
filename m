Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5821ECA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxyrFbIDAO99GJasIdJ7Sp1XctD4pjs7yD0DQzyO4ww=; b=BDEBSZSknlxFfkkqXdexU1Y9eJ
	SOyqfabbqT4MKiJMsx/24NktVP3JmvoW8moEEW7D0EUlw6F26ut4/U0ADEnMkCzbVrRFEOIgXb1o6
	C0db/Br+mUkkz5GN5rvzbEKGRKXxzGc2sZO8KcFRAavV83UuhHDvL82EEt6Ibnf/Q2y42LF+ngdVz
	Nkdjs6PemSH0ShBBmQTqWxxQfh5OBVsHY4lKn8UCL4YnZA3CGQDAuR3BSNGu38RpB0p73rZx497pb
	KzI7eGT6aY64/TuvM92fhH62W0CTYDgaKrOCJiR3usSBpbvaNsOzKvo7XOK18tDVKIE1yah2zPV0o
	kBHff1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuC1-000000066yC-0HoF;
	Wed, 30 Sep 2026 13:17:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuBz-000000066xf-3LWl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:17:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 409D3602C2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0291F0089D
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774271;
	bh=FxyrFbIDAO99GJasIdJ7Sp1XctD4pjs7yD0DQzyO4ww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eV7MA2nQFaDZ+nUKTDYhD6UrNycTMuA+dAh369a44Y7VyM3dizHWQfndOzDbfz6Yy
	 W7GrUVTlnaoIimzd4T2tf+6zVAcgJ4PCBBDYFNyeTjqvvVskjVAp2BR4t29Oi4fKYm
	 FI6wAMqcCZWSwdPbdj/Ee8klej9AU62Bx4XWR0r6+dWgZVcHXH95VwPUfR5P7dlQsK
	 csVjWM8xsdSGwYcL7SbY3DWnTa5Xk9a1d7wP9F3ZZMO8aM/lHUhkBK7Y+lrV5nvXoH
	 gbsuLw1TU1rAWGOM1XOEBoa2PDcCEQWs35LSysqmPU7+jo7AE08hNcOnI6CYo4pkvS
	 IWqXsee/f9rCw==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6c8f6a53fabso1453865eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:17:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrGL4OSTCuKIVH+ZRKIxNpU64cuu4p4X5Je2Poot3J3EXd+1ZktdWtUEUEtOHzO/4y4Cg9v0ym8DiMlsjqKogx@lists.infradead.org
X-Gm-Message-State: AFuF++lw7jvOo0bzDllgXNsc3BRD+Vr6yu0JV0sJHOhnkIKJi9Rwslqm
	nQGRd5p8/h+sURmf3fO2tvuoO90z5rAXyquWNNFrWb7obfdyFxZRyvz+qzd1zw/bYEFT6lLOq4z
	+xz59jTjOlMKZpr21QUkwqgJwTtBXKh4=
X-Received: by 2002:a05:6820:4c11:b0:6d3:abd1:9b97 with SMTP id
 006d021491bc7-6dcf6525a6emr1100268eaf.61.1790774270280; Wed, 30 Sep 2026
 06:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260917135056.2153959-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917135056.2153959-1-vulab@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:17:33 +0200
X-Gmail-Original-Message-ID: <CAD++jL=6bofu+5U8FG-PPqdjL_VYYh5oNRJtY-ZT3Zp8B282Eg@mail.gmail.com>
X-Gm-Features: AclHuK-roK4N3HZhE9WekVRJ8H5Cio2_Fu_cQePi4YQjQ0SNOogyINHDJvz-3Yg
Message-ID: <CAD++jL=6bofu+5U8FG-PPqdjL_VYYh5oNRJtY-ZT3Zp8B282Eg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: Fix clock reference leak in stm32_pctl_probe()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: alexandre.torgue@foss.st.com, antonio.borneo@foss.st.com, 
	jiashengjiangcool@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com, 
	zmw12306@gmail.com, stable@vger.kernel.org
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

On Thu, Sep 17, 2026 at 3:50=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> stm32_pctl_probe() obtains one clock per bank with
> of_clk_get_by_name(), but none of the error paths drop those
> references: the loop returns directly when a later clock lookup fails,
> and both the clk_bulk_prepare_enable() failure and the err_register
> path return without calling clk_bulk_put().  clk_bulk_disable_unprepare()
> only disables the clocks, it does not release them.
>
> Release the references on these paths; the success path keeps them as
> the driver needs them for suspend/resume.
>
> Fixes: 451bc9aea9a1 ("pinctrl: stm32: Add check for clk_enable()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Patch applied w/o stale tag.

Yours,
Linus Walleij

