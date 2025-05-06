Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145D9C3ABC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 03:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6RYs86PJokxxvprMkqJYSIOrLFEEYltj79aVKHMFEM=; b=uJm/Iu14qMXj8R6Bemkz0wg+xs
	GHRT00lh9f/VIsO1RTy3sO2U0+Z5pvGQgfLUUGCVV9fIBHmNw1KlkHS03Gu1S/9L3VcMvIltxakPe
	5qJQCjdasQxh28EJIAtJ9stzCXU18OxtK+Bcw/u8e9lNffIMhoFQr6CX7Cj6ajNt0UxCLfs5Xpu7L
	twyEfeDCgOz9EBOqD2KLwUTyRmNVncfmvgBYgQXP772KP57zR2bADn8Jw1JXjoQdOWaUzjwcqe5ru
	jaqqiq/dyd4c9n92f0g6lCenZ6Vv10b1bs62356QNB5pu1NpC6xedPBxi5T98RA9Msd3FAOd/GknG
	/jF1fzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCVjt-0000000E73O-2lL1;
	Wed, 07 May 2025 03:46:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQ3N-0000000DSOC-2iVh;
	Tue, 06 May 2025 21:42:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C29D961136;
	Tue,  6 May 2025 21:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4442DC4CEE4;
	Tue,  6 May 2025 21:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746567736;
	bh=l6RYs86PJokxxvprMkqJYSIOrLFEEYltj79aVKHMFEM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JPbQV2TE9JMYlynQW3LOl2v8DFHIk++D8qK85nKqdbjKkrAwZlGLXd1xA5HD9t6Uz
	 f8Z8dszsKIzo/VFoHAHM8orxJT2AkLjDXsQGpV3sGHp8LusAJx8SePLf7LwEAqovsY
	 Sczjp2MC3lK7Yect2AAjyaQqJ06QgXLJ1+YQvKdJGpB2egQSW8VBTbVlCBcH+xdcaX
	 vR/0Ch6TOEKRgu3UhcJ3FhEYUWVBSmXsXrk2ujxKh0kFlafyNTaJt8sZbkLik9IeOk
	 i9ZdvAdwRqgXVL4LeOJAJ186P9DivLu4cgJ5gfAlmfGw1FU4cEP9HlvaHpuVjgE0rd
	 ms5vg8nHsq+3A==
Message-ID: <59c3c160b99f2cfce17d644534591952@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250402020513.42628-1-bsdhenrymartin@gmail.com>
References: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com> <20250402020513.42628-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v2] clk: bcm: rpi: Add NULL check in raspberrypi_clk_register()
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, popcornmix@gmail.com, mripard@kernel.org, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, nathan@kernel.org, Henry Martin <bsdhenrymartin@gmail.com>
To: Henry Martin <bsdhenrymartin@gmail.com>, dave.stevenson@raspberrypi.com
Date: Tue, 06 May 2025 14:42:14 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
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

Quoting Henry Martin (2025-04-01 19:05:13)
> devm_kasprintf() returns NULL when memory allocation fails. Currently,
> raspberrypi_clk_register() does not check for this case, which results
> in a NULL pointer dereference.
>=20
> Add NULL check after devm_kasprintf() to prevent this issue.
>=20
> Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to clk-next

