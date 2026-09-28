Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73C4C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuqpoHduVduL/y0wnBWdGHkHHicM70MFPxT5bKmE1Us=; b=lvi+mUHMlc/rE2l+0Hji6+GxA8
	FcLMGvE5k0F5KmxrvriLFNM0R2kG/B08Qkjb75QmNPVQZ5ujV+qB1uLQxF4gxd41QdH5mq4j3dUTe
	6QiaeOk+U3CV2CQ1bFvLID4erKTU+tn2b87L54QgPuOqjHtElfg4IC8oVrdw1T7eBuoX4RIe/F6+j
	ptrOvJ8mIPCe8Qwmgqjj6vyl9L4LkSOhzjxxqIrtTwGd2TXfpr1ftlDOn56+HVCwq8DPGfh7vRpEY
	sZ2YdTmFOrt71Eg8t6ALpWPLlQdsywSKHBmuEqxqW/nxuA8gp5uNXMjl+LN/fQKBtBeHqDKgWHpmT
	iGff+BjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6lp-000000005m8-3IX0;
	Mon, 28 Sep 2026 08:31:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6ln-000000005ls-35Dh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:31:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 25FC243CCB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095421F008A1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790584291;
	bh=MuqpoHduVduL/y0wnBWdGHkHHicM70MFPxT5bKmE1Us=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WdOItFxAVAnzGluXvaDDPCqN97XLfPMl6A4YDyzTSNHzz1xZ0O9nipQg6bqWldVC/
	 bL5P14/A+KpZRX6/6d7cfBu+8IQFHbklBnqpXAhUhYWlJ4eIq3TLtRtOeuTktBrmdN
	 aFOKcRw4xro1MwdgAj8WWPyzfjwtc6k87zPYO3UJOKiEYK4kNkcaiBMTIitBS5Fut1
	 NebZzxCskzK8/PUepB1K4qmKLNbteeJzIedfndeLsC2nKSc7m9PkIj0IMaCwAs9yVU
	 Ta2Pu0+eLOSVAFCdkb180/qey6U3G3M3sTybDecgX7XFbT4p0f3+BSR5cvMZ1Lr4Vq
	 z8fkqXxbr90Lw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b8eddcef9eso1593245e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 01:31:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzyJux4tFblwLdaUCkuKoMdPrTXMq7nEY8USAmZnj1G7l83SS32c4d+YNtCpnpeA0AqEcV09piarjV+Xu7u4sXo@lists.infradead.org
X-Gm-Message-State: AFq9FYLex0BspVvmYHVolAk+huWjw4JHUYX0jg99neJ3vff/feShzBAy
	n9oApJgBSVoDZwNwCLtb1m8ihRDrhjgbxC+AvuhxmwJ0i4WtsfjwyDz/8rmaJdBQ00ehMjrrL5g
	r95U9Nv/6aEACssPeiwMFMpbD19Ej9oucl+rGYBTLuw==
X-Received: by 2002:a05:6512:3046:b0:5b8:c311:88e8 with SMTP id
 2adb3069b0e04-5b8df1e6cf2mr3720055e87.26.1790584289662; Mon, 28 Sep 2026
 01:31:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 01:31:28 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 01:31:28 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260925193008.127314-1-2000.costalucas@gmail.com>
MIME-Version: 1.0
References: <20260923184450.135601-1-2000.costalucas@gmail.com> <20260925193008.127314-1-2000.costalucas@gmail.com>
Date: Mon, 28 Sep 2026 01:31:28 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me3iGe9bxAM2Ph=kBU8PAvRZxq16NHk3FSKsp3EafhbdQ@mail.gmail.com>
X-Gm-Features: AclHuK80sCVvVAPH0hKzq8SMRPB_tS6-QZBjVGjDspI-Uie2oIgZKXJbO_KiA9A
Message-ID: <CAMRc=Me3iGe9bxAM2Ph=kBU8PAvRZxq16NHk3FSKsp3EafhbdQ@mail.gmail.com>
Subject: Re: [PATCH v2] spi: bcm2835: fix device_node reference leak in bcm2835_spi_setup()
To: Lucas Costa <2000.costalucas@gmail.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-spi@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 25 Sep 2026 21:30:08 +0200, Lucas Costa
<2000.costalucas@gmail.com> said:
> of_find_compatible_node() returns a device_node with its reference count
> incremented, but bcm2835_spi_setup() only uses the return value to test
> for a matching node in the loop and never releases it.
>
> Declare the node with a scope-based __free(device_node) cleanup so the
> reference is dropped automatically when leaving the loop body, matching
> the existing __free(kfree) usage in the same function.
>
> Fixes: e19c1272c80a ("spi: bcm2835: Restore native CS probing when pinctrl-bcm2835 is absent")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
> ---

As Mark said: don't send new versions in response to older versions.

In any case:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

