Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356BCCA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpSmVL4hqTjWvE1WR/oUH8A/JGaoOj3L6zfCJwDU9FQ=; b=F+yXkH+RIgcBGLAfKCQ6PS0LVE
	/W6GmisldE+MKV7gPzIhJKTpSFRlDlbKGGF4f5/60zEuPcte+GeAOXYNr0hdPITTGVU44cuVY2gct
	qbjnt0hksFjT4glh3qtuCtCDEJrquu5P1exaWSIZ1GsJusqIhm+Xd50tEfNNzyhliqn1+oaOSSEaY
	izpTwHYZkj1DHrmETEuflz4agdRWkuBxqWi2snlKplrfA2+U5YAL5jJDjeldpSWxAan8Hh4D0PtgE
	AVWyVvdUcp7Qs2j/GbnYivupw5eE2eQ+RqiPiIr5tpWKFnzmWZqHX2gjBANqqY/v3zIl4an0FwP2H
	30ekrwEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuKv-000000067qe-0bRu;
	Wed, 30 Sep 2026 13:27:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuKt-000000067qB-204R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:27:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E40C943F57
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53EE1F008A2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774822;
	bh=OpSmVL4hqTjWvE1WR/oUH8A/JGaoOj3L6zfCJwDU9FQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=He0p0C2GEmvWcs3QascPblvBjga4iuGgh4pATvGNfHJPBwXoZSz5+rXqm1bNcaurk
	 jcIjD1SyLBjDKGPKdNFupFTAyobxtJ1EAWb2GHBrWexPkB56ZymrVpu1cd4m1O99Eq
	 zpK2vVJRlrhk9QKePv7sYZ5pWg1Wsd/MjD5VUryPztPWjE1xViUCmtDFViUhcBKI4d
	 JGPCyhndt1THNfsOJh4a/rteMDVrCWaWlaauLWUBKhSQacYHaRuG9cxGUxBwA61//a
	 t9nJk4bTk+OlpGxp4AykifQhcHs3nEtC6HDj+poWtdfMuPtgDvB2RDpheI0SLu/jKq
	 2w01hRV4BvDag==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8eacb7c8fso4678567e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:27:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxaY4L6Fww/c5qBKD1JgJxihKXoMn/doNT7Mv9J9eV7xgJdxlf9WTspgcVDhYSBbEd9mS5dLKrmuYJYp+DMqrOe@lists.infradead.org
X-Gm-Message-State: AFq9FYI2thRLJAFPzLfqiiqpgwCiYh0UAZvaTsB96VnuyyS6g0ytALTl
	3gKg9m6pFmF0sv2eI7QnmdYvwncBhDkZJ9WaUc5szk12qj7xv14nEn6cJQEB771OWYYR0rBqqHM
	GmAletJ6jxHTFDcDF2xNJNy51iSVPT34=
X-Received: by 2002:a05:6512:3a8a:b0:5ba:36c4:c953 with SMTP id
 2adb3069b0e04-5ba402b8597mr589624e87.8.1790774821501; Wed, 30 Sep 2026
 06:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260918072852.501420-1-wei.fang@oss.nxp.com> <20260918072852.501420-2-wei.fang@oss.nxp.com>
In-Reply-To: <20260918072852.501420-2-wei.fang@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:26:48 +0200
X-Gmail-Original-Message-ID: <CAD++jLnFo1yd2AXyu8XdZ5VV4RooXGP1xEXS9vtAsoSfwPKY=Q@mail.gmail.com>
X-Gm-Features: AclHuK-Cq3rn8OBffcZs3OkTTOIAYyYq7qYSn2XcIAzlvfiwp3W9Cp7NWkyTaAU
Message-ID: <CAD++jLnFo1yd2AXyu8XdZ5VV4RooXGP1xEXS9vtAsoSfwPKY=Q@mail.gmail.com>
Subject: Re: [PATCH v4 net-next 1/8] ptp: netc: use ioread64_lo_hi/iowrite64_lo_hi
 for 64-bit register access
To: wei.fang@oss.nxp.com
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	richardcochran@gmail.com, linux@armlinux.org.uk, wei.fang@nxp.com, 
	imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

On Fri, Sep 18, 2026 at 9:24=E2=80=AFAM <wei.fang@oss.nxp.com> wrote:

> From: Wei Fang <wei.fang@nxp.com>
>
> Replace the open-coded 64-bit register read/write sequences with
> ioread64_lo_hi() and iowrite64_lo_hi() helpers. Introduce two new macros
> netc_timer_rd64() and netc_timer_wr64() that wrap these helpers and use
> them throughout the driver. This reduces boilerplate and makes the intent
> of each operation clearer.
>
> The high-half register defines (NETC_TMR_*_H) are kept to document the
> register map; they are not used directly since netc_timer_rd/wr64()
> address the 64-bit register pair via the low-half offset, relying on the
> hardware layout where H is always at L + 4.
>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

That's neat.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

