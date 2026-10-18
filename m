Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D16CCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 21:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmuebTtapyafAqg/MZz1PoSj/pPTFJ0VaRJlQ3t8Yhg=; b=IF0poFotK61I3Eh2blcMcIt/Qj
	d5ZpNzcooTTguNJglULbgbSa4WI2OhpVT6Xywe5Dy77JluPTMO7xoe9ZWLeZhxSNGnhZd7gaEGFj3
	HANG6bJAlRhzQW/cezPCeyMqaawkoSg10oCkmB/x+Ce/nZPSTPpZKNwUA47kwvIkiNBW1iCToHHg5
	FGe+hpFr4cfjJU2UDWdLTVlhy4QNNrGTP3TOmSplwdp8+7+fStMPG/pjYwHS6sf3+4lAH7xzX6JoI
	8r3M9EUF+yKAJHN3vvN3gejg8HKuKwVYJ6laBSkxqZcyASNcJUthv+qMVRfyFYP17ffoTQEv84SHC
	YgmXm6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIXzh-00000006E5d-0Ogs;
	Sun, 18 Oct 2026 21:00:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIXzf-00000006E5X-0ROi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 21:00:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC8C043C33
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 21:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B80A61F000C7
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 21:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792357232;
	bh=lmuebTtapyafAqg/MZz1PoSj/pPTFJ0VaRJlQ3t8Yhg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YtMp+ymRPWyQ7hmja30jNOBaDQwwuI1782ArVM54H4yDKQ6vMlbBrHJh9/j6vMCQQ
	 kkco7+IJ6KuhBq32eHqDCuhf/pnUgjT5WjSoyw2mx1CvBY8c/O1pd7fbbu+pz8Gbpo
	 fsemPDeRIRM9iAV7f6WJTkBihbhI2yTu6UL/ipU4htWwMjc5qYWa9kme+ZCZxjvncS
	 hVbikVC+fQn1oX/BSOxrsTtOLfupRHkKOezACijZhgQ9BZ5on7HtqMMFVCLL0ENf62
	 5BSBjb3zwB53tvC7eFeQgKKS4ExHk+UfqDwodHlxgTa7+A16pPA2DcE6hO+Rince/1
	 uGyNY5Cyi87Sg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1682321e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 14:00:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwMyc72LSdg+huXRGnaHOLY4iUXC3Br+hoBy+YigYLYFkMKrgVxd8+10YMqnSzGVsv26Nx02F+6ym6Gy+uOyo3T@lists.infradead.org
X-Gm-Message-State: AFq9FYIjhGOqDxO+6RnvIu7fwL6Q7JH/0OmgW7sCa827mVBLsksC54GH
	oCTI6Zq2K5l1Tk4xToTaI4pgS3fVKI7h9Yh5JV/INolDq4J+xQZefX9p5RgfqCKMgJmoQMJZ0yn
	eMiAvP6fvZwM307KkY/b8U9syhIkjDZk=
X-Received: by 2002:a05:6512:3d8c:b0:5b6:4ae:d87 with SMTP id
 2adb3069b0e04-5be50a655e4mr2028129e87.27.1792357231440; Sun, 18 Oct 2026
 14:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20261018040724.534641-1-yaojiale02@163.com> <20261018040724.534641-8-yaojiale02@163.com>
In-Reply-To: <20261018040724.534641-8-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 18 Oct 2026 23:00:17 +0200
X-Gmail-Original-Message-ID: <CAD++jL=DqXggfdAq6yU8=OBm5atks77CcQ4AnuR9RcAS6QQsrg@mail.gmail.com>
X-Gm-Features: AclHuK-3fui0U03t7CAaiKHddUwpmQ1nyZ2GG7y4wk-UNeVfMtV2nvH5lucn1Ag
Message-ID: <CAD++jL=DqXggfdAq6yU8=OBm5atks77CcQ4AnuR9RcAS6QQsrg@mail.gmail.com>
Subject: Re: [PATCH 7/7] dmaengine: ste_dma40: synchronize tasklet when
 releasing a channel
To: Jiale Yao <yaojiale02@163.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Dan Williams <djbw@kernel.org>, Srinidh Kasagar <srinidhi.kasagar@stericsson.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Sun, Oct 18, 2026 at 6:07=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:

> DMA completion handling schedules a per-channel tasklet that processes
> completed descriptors and invokes client callbacks. Channel release
> terminates and frees the descriptor state without draining a tasklet
> that was already queued.
>
> After d40_free_dma() removes the channel from the interrupt lookup
> tables, kill the tasklet before returning the channel to the DMAengine
> core.
>
> Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3"=
)
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

This makes sense.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

