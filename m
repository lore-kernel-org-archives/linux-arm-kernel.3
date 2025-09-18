Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20933CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lvcQGE6zMqa3RPKmZjZH5zBkLah9vgbD3X7rCwM3Uvs=; b=LDlXnXy+zs/MHCkXkbPXjxOuHS
	ysVzwyszauIxdCPN5IgyT8VKRm3PeLdaIt85yqPxR0lOX/oGK46eLPnMbITVaqWoP5CPglCNdHhUq
	nEK7v79NG9/2iq3A2YTfrUo9kjxcfJ90j+u7MYXBgsE3ose+xYbyOio4lKXiNnRtYM0cyqROS5coP
	DSbSsyHqYqYRj+em5MIZN9HAL5qA22p6jmrvMNJhN/PkG7K8yrT1f7x0B9xsye5JLFqQgAFmXpdNb
	LaHgZAuFR6K/cruoQqCjAmO9OxDkJK0ifZ5tvJu6qFivjBaQnQoLLraGMDDU2509js1SqO9STHHqG
	83XwdyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEDq-0000000HTib-4295;
	Thu, 18 Sep 2025 12:58:50 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEDn-0000000HThU-3ZHS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:58:49 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-62f0702ef0dso3926816a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758200325; x=1758805125; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lvcQGE6zMqa3RPKmZjZH5zBkLah9vgbD3X7rCwM3Uvs=;
        b=G0P8h5kEOm2wIewAJx0ogEyL3BoVtz8/1xsEhUUdxjZbrDD9esVbqqg/Lmt6DCZRx2
         eqnN+NgB8WT34xHh1rCs4JbQDph7Hang1hW1ANpyONQ2eXgu2M1X8UUuiT9mRFVTqgyQ
         ttUj6yfB6GH5vFfHkZMOtop1QlTxzQ9OcVypTTpoQ2kE/2i3x0/Vnk8g4f4DDiUXUOtG
         oJMtluJIco6NF4NRC6TSCPwxHrJSejvRy7QZfkBM6nB5Ve59ZUmUklZslAi7kSGz6sJc
         AwOpTtnmjR9226XKJlB+ejhoRTEM1JVp8lMlAVMVHnzRFYAhnLw5CBUwQAD1dwYnWUGI
         De+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758200325; x=1758805125;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lvcQGE6zMqa3RPKmZjZH5zBkLah9vgbD3X7rCwM3Uvs=;
        b=EnLo3jfvjz/2/UqKiesp2L33qNdjLyFrcMcKtg0JWudO0UCQa+hvVProbeWo7wPntN
         Y/O/JdANH2K++U9pnI9/MIn7pb1J6zpT6CnmRgTVqW7uY9u/IlsiDqhKeJtRcja0jF6f
         GaU+TiuH3pZVnbbcnXp6xiKjG1f0xtYPSn5rFVL8XDYDlgxAbD3wb7ZfMFOA93AVOSWm
         e1R/qgSAA/3sdx9EUYt225jMcpczDRetRgx/VmmiLIrYuE26+Doamo9MwnOmTF+wzh8/
         tLnYa6AiB0JaXzm2PZ1+77RgvvJH0yqcPqeskoMGKbvTy04kb4SuML7ckeLKz4lmZcfb
         7dEA==
X-Forwarded-Encrypted: i=1; AJvYcCVSgdEBaJb/FMzQnTr2kYmttKwE0yvs/Cqpnyde9AH4b1KHlERu23Z0Vs0XQYQ+rqY/mg4x7FV+IGPu4pBvBubj@lists.infradead.org
X-Gm-Message-State: AOJu0YzLjkdm57n1Vo0/MXe5Bm/4EYu5ChNCqWg8Sl5EyUFm5LLDqRp3
	X6hkloO58a8hyyhg8KapE4pVxPBHOzKYQnb6Qoqb4U0a126wmdDp0CxgR8IepARzIXpTkM9twJ2
	tEfXGoAK1rp3hFFi9qBG4ZlCrjX0FM/wxKlzFRxNHIg==
X-Gm-Gg: ASbGncuiuOKKPkOIi6D3msRqUWcqyhtDE2NhOErh95QisEiOcO10xaurriT4sHjOPbT
	O+ISV09EJzyKI/g56OGaIHiqMjVwT7dFTubz5xjJQkZGjy+iP6Sn3IZQa5s9E/XbgXmwhzLAX0b
	Z/82xh/PUyuKa2QVkXYyiWZa4pqHrFwM8wSxPGjSwJ/Fip0Sav89R+mPPFC0ksrOHsdVJpE1Y15
	gdqfiPvVj3cKTEkPOENPeJaUw==
X-Google-Smtp-Source: AGHT+IHG8sk3bcUaHQwBrZoLncnJChfwaJcuvBt6nfYyVTZWygm5etjUbCmo0srSUZFjiTWBAdZCH1hJ4cgs9M5FLD4=
X-Received: by 2002:a17:907:6d06:b0:b0d:400:9182 with SMTP id
 a640c23a62f3a-b1fac4e0b80mr343825666b.22.1758200324771; Thu, 18 Sep 2025
 05:58:44 -0700 (PDT)
MIME-Version: 1.0
From: Andrea Daoud <andreadaoud6@gmail.com>
Date: Thu, 18 Sep 2025 20:58:33 +0800
X-Gm-Features: AS18NWCEXBGAyDTuAdYfLyOIr8P8xtqgcUaqAsI0KK0ysqpeO0oKN9Ycaxuqg4o
Message-ID: <CAOprWosSvBmORh9NKk-uxoWZpD6zdnF=dODS-uxVnTDjmofL6g@mail.gmail.com>
Subject: Possible race condition of the rockchip_canfd driver
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>, Elaine Zhang <zhangqing@rock-chips.com>, kernel@pengutronix.de, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_055847_884969_FABD27F8 
X-CRM114-Status: GOOD (  11.18  )
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

Hi Marc,

I'm using the rockchip_canfd driver on an RK3568. When under high bus
load, I get
the following logs [1] in rkcanfd_tx_tail_is_eff, and the CAN bus is unable to
communicate properly under this condition. The exact cause is currently not
entirely clear, and it's not reliably reproducible.

In the logs we can spot some strange points:

1. Line 24, tx_head == tx_tail. This should have been rejected by the if
(!rkcanfd_get_tx_pending) clause.

2. Line 26, the last bit of priv->tx_tail (0x0185dbb3) is 1. This means that the
tx_tail should be 1, because rkcanfd_get_tx_tail is essentially mod the
priv->tx_tail by two. But the printed tx_tail is 0.

I believe these problems could mean that the code is suffering from some race
condition. It seems that, in the whole IRQ processing chain of the driver,
there's no lock protection. Maybe some IRQ happens within the execution of
rkcanfd_tx_tail_is_eff, and touches the state of the tx_head and tx_tail?

Could you please have a look at the code, and check if some locking is needed?

[1]: https://pastebin.com/R7uuEKEz

