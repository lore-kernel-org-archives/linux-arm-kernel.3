Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE89C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nyJdBZNGQXRfrLLWrFULNmrJUzDZd+q5i06LyK0ZHY=; b=NPYKbS1jnAT8XX4PZqndS04F43
	KuwdagT4tNFVezyZthG4dzJWXeBKMS1VvpMs7ZQZ+gN7cDLUmnh1QpfDibcHXpJe9pnZr71+j62VP
	1HfkNTRv7RkiNIyl4mNGeFit+pKsoFg+QIlBebAWFokSIHeycftu4Dtj/dBOtpQMkXoMUYOZOxQnp
	zUAyfEl8SSzBwD+O06fHqHus1TGaG6qFrY5BKia57ouAkBKagyDZ4is0cFQm2bX8q0SA2RSwc/6St
	6KIyts4vnkaP3WCuJ3XT9c/2/eNNnzq9T9m5l2ujrD1zU4v+M+SNShTxlBqpesRszD/Q8Fn7Piy8X
	U1PqVQig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoID-00000002xLK-1BmA;
	Mon, 07 Jul 2025 16:02:09 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoDr-00000002wa0-05Aa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:57:40 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-70f94fe1e40so45921717b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751903857; x=1752508657; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5nyJdBZNGQXRfrLLWrFULNmrJUzDZd+q5i06LyK0ZHY=;
        b=gupNBZSLpdRlyfUSsd7oQ92guvr0Dl3+zxmuV3R3CAYDqg0BkByXXNooBx76TGg6ym
         lxtIo52+So5UsbXdvS0Ae0gll5n3NjCciWvvQswRfrL4qQLiwZgjsxfO6VsPGmvQVIiF
         Ik+E6fs63GOAgYgAZtpxnfQRxtUZdPLOnjGOxic0e3zvhrcso8vwLi6RFP6mwsPKgu2B
         ctLgjrBAEZLpyg2Vkw9sN6PuSTW3Bezdm7+Onf9uuRF+gZzFFAhvac4Jcwoy+okYP9MA
         WMJFErLtUmYJ8ZCTy9S9O0JoV4+g1SBUMeu5JQLNFTXD9x2q7RTDd5yGsjg30wxfxdTr
         PNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751903857; x=1752508657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nyJdBZNGQXRfrLLWrFULNmrJUzDZd+q5i06LyK0ZHY=;
        b=ly/hUZrgv3WPvnxJdNzR5yDp1TQbz0bvlmphbyMiSvg6N1BAGIBuy1+gh/fttSlhle
         YfE3vBj26q+aPzYF3XfOTeFWUcOOpedVFdVQNR7TwpO5Rflpa8lY95KdpggkWK6X2uR6
         iRpsA6nxt4CTbDra9ItyoaQ+Z/KYMHr1dNopsAd7Llte7b3vBNXVL2PAfwgER54XZlmF
         Tt6Oi09tBAZia6R8TEZkNHIKP11kVaom0YdPWOdRnCQoGyBupG2ZjaI7+8myAEvWbS6a
         uCq0B6H9pyP2IeU52Ggz92eZ02ROOSq3klETPYDeamIPpgzFmArmKdi19PHEvf4QQeWi
         xAiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBreD2SQlAysUuHK/ZTSdAzayuDy02j5uij+Suar9uGp3hTKOqAgJQwu67OK+Rpbe89RncsOublqXGf+TqcycB@lists.infradead.org
X-Gm-Message-State: AOJu0YxOKyDIA8bk/cu79Semhc+A72QHVqc0YHE4BZtCmbMbyPx6m9e5
	ybsPyYo+Z7Wk5SWj5I/KeJr2U31OhiYiqiO/rB9bEhg+WrauvXi+d14KUpkUl9huJjkU8GWok+j
	LzvYZhfNG+5HKLc0aGpT2uCZy88/0S7epsxfdeI8Hwg==
X-Gm-Gg: ASbGncv6z7YtAAI2+2X5lc+pRcgmWPE8id/Tj15Z9GzlQbHfrH39gdLR2V8wO5hJLyR
	8h/+kUAKKfkwgNFFxM3AJTldgTJgd+3bdgqRhbM5H24YxTZOZ2qzlTEsF1Z9mM7YTShamvbbfp7
	Yh9ECqCDeItlMATXg4pLGB4kGOSjdQ7cKOyvgsvapnrlBQsNdHSlMv8nKm66nnqLmpbqXfv48MG
	Y8=
X-Google-Smtp-Source: AGHT+IGXkinsClHw9T6S8vqJyiAKqsR81bmWFSB3E1wGxVpBShaqy93Jxk6vBcBEnqP8XUAGbCaobGyW++qJmVzyqGk=
X-Received: by 2002:a05:690c:c9d:b0:712:c5f7:1eed with SMTP id
 00721157ae682-71667ecfed7mr187732797b3.16.1751903857530; Mon, 07 Jul 2025
 08:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075431.3220262-1-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 7 Jul 2025 16:57:20 +0100
X-Gm-Features: Ac12FXzisPQw3Zak1z4PISdT8JVI6i-l6yfwQpDlf8066YfTihFWEfCR_f0QlqY
Message-ID: <CAPY8ntCgEb9fd_rMGeWSeR=Hbzf1GNQeSh-gRcubtwzoahqnxQ@mail.gmail.com>
Subject: Re: [PATCH 41/80] media: Remove redundant pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, Martin Hecht <mhecht73@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Alain Volmat <alain.volmat@foss.st.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Umang Jain <umang.jain@ideasonboard.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Nicholas Roth <nicholas@rothemail.net>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	Matt Ranostay <matt@ranostay.sg>, Nas Chung <nas.chung@chipsnmedia.com>, 
	Jackson Lee <jackson.lee@chipsnmedia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sean Young <sean@mess.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Matthias Fend <matthias.fend@emfend.at>, Marco Felsch <m.felsch@pengutronix.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_085739_151383_2A8DAF48 
X-CRM114-Status: UNSURE (   9.86  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Sakari

On Fri, 4 Jul 2025 at 08:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
[...]
>  drivers/media/i2c/imx219.c                               | 2 --

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

