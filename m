Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9741CC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emwhs/R12V88FksqW/fCHLiEZt+g/eeVJZV7F/tinJU=; b=zCC76mU9ULqfFP8iWL9GT97McH
	oMfM53Ya0SfhdffUXOgv5Za/4qxA+gYJuhBKUAp1yegxekIQnNMlqj0LgVla9482UnEmHTi8v/atY
	GhwR9ACUF1mY7q6PHJB9y7t/Vuh/X6Od+J02CT1t/choBrDJAluTmJ4XErV/CM3qdkT08AoDZOVue
	5cFSrop/J6rkz9u22Qz9sgtakH7JqG6RS4zRlgln5m91RrwOyQ6QXdGvIaGYsJNhE0uidRl/Oc4By
	OJ08JNHuBv3giovieqgRaaOq0G8zHDTmHmm7nl12yVLLhkHprJS1iA/2sLYksy5Ng30Nhkx/jXeLm
	hNhc3EDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5qP-00000006kGU-0BxV;
	Thu, 06 Aug 2026 21:41:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5qN-00000006kFy-3NzR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:41:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 40A9B437ED
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 21:41:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1603E1F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Thu,  6 Aug 2026 21:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786052499;
	bh=emwhs/R12V88FksqW/fCHLiEZt+g/eeVJZV7F/tinJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hFjhKrHPrnTV9AX10vJFnzua6fH29RdjhXZxDjVAXlDA9J+sh6DZabN9flRgi4shl
	 d0JOIBkGrW2l6GrRxVp20xoUJoyE9KzvkvlUAUrMAp0t4sendDUS2MqPbZ7QNxq2AD
	 BvuCcqRkuRKjq6vS+/UFihOeOZJdMx92IC1CAwn/jyMZc/2BGDmDXHx7mtpFjDI7xg
	 IjpfTNW90JyxD6PFRbamS+r3NIbqIw5+It7nwLeSFzEouuWhtM4Y85eBAiw9DQD/t3
	 1ph+Qpgb/QOrp74+XR5M+nXH9kZ5F9x9pCsszMCDtQUJ5VlSCX8KkPGlIWH2G8Iq+b
	 eFhfsMc9TZjbg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so2819066e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 14:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrUMA7XkFnrzJZ/R6UpY+wLRHcUrlBwMPCGUSBkE904v9uIqNcbTT+hFmN4suJH223k4LUU9JfiKimXTUHSY06R@lists.infradead.org
X-Gm-Message-State: AOJu0Yw94dwNeSy/g11HoSU4vGMKc07vjrXm4LnPIrU2St4n2V6wsAGL
	csGJGyq1Rgym2rwZ0CcISRUVrx19r0sGAx1LxV/RwxyBaZI/ccw5nkiG3lGBjB1YdL8KhwJutt8
	UnEcKhHnoT7Ogv72ddwI1ed+CmKrctog=
X-Received: by 2002:a05:6512:10cf:b0:5b1:da61:a13f with SMTP id
 2adb3069b0e04-5b2f4cd3e1emr2391855e87.43.1786052497832; Thu, 06 Aug 2026
 14:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
In-Reply-To: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 6 Aug 2026 23:41:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLm+sfo2pB=cM3v2-ewwdkaomRvTdKh9VVKNU8mJS3wPyA@mail.gmail.com>
X-Gm-Features: AUfX_mxUELB5EjLZQ8CDlb5p0mqmJmh3sKO6rvUX7_wSkyifvS8Bgv83X4i36kE
Message-ID: <CAD++jLm+sfo2pB=cM3v2-ewwdkaomRvTdKh9VVKNU8mJS3wPyA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Use IRQ trigger mask helpers
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, soc@lists.linux.dev
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

On Sun, Aug 2, 2026 at 4:06=E2=80=AFPM Maulik Shah <maulik.shah@oss.qualcom=
m.com> wrote:

> Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
> trigger type combinations in irqchip callbacks.
>
> No functional change intended.
>
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Nice cleanup, patch applied!

Yours,
Linus Walleij

