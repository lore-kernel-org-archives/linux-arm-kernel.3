Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D230CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 03:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM5Kf2P2muqD9TDUqOMWCASBAGRx4JfmKuvQ3t+VEmc=; b=V+e8oZWdkhqh1SYW1p+P/QoW8P
	ZQJJ38LXsByIOKRNucB10KGXzM5mVdMO92e1f+62OJykX/aVxkhdnzpYHMiNno2pc+2s6X2qyMHGl
	FCZLNvsMPRc8YfB0NPngJO/hOKi01WJ0RSw8kBhonUrFaRF7VmGjLdsTgLdmZtbKY+8gOygn4y3+s
	MGQuDabrOlb1lFfHipDJ81yjAgvwV5gyNK0g2Wt9oWDsopxCkRzQ7fUc1B8IaiLOyCeI46hJcAZNK
	4/oPp3HM93LYT2ADFCyA0aXreGO3XoiK7OH9R8rcvOGUKCXm3s+IjOwpcYhMrkHD/2beHvmgrb0WA
	3x9jh+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSQf3-000000050v9-3AtC;
	Thu, 28 May 2026 02:39:53 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSQf1-000000050uH-07BA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 02:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779935979;
	bh=eM5Kf2P2muqD9TDUqOMWCASBAGRx4JfmKuvQ3t+VEmc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Z35J1pDkWScazd7mwG3uLPYiBbgI8AxeSF82eyetT7NzyYANr9E5hOepMlXVCJckG
	 KgVIdUD0+Gg3vqMgmAOU902wo59c1AzBwTAnP6koDdAKWspvlPE0Nn9RbnrNolWruK
	 LEq5FHltSck7rbMkXEgQPqNX5bo/tuXDQxggQOE6JRSFmSY31k2lLmZBHOQWSS4FCL
	 3ANQpOj+R49xpC6TBKkZE34Bzr2Zmv2lQtv7nn4DQy08I4iFSvLY9tJQPKsLjLJaYS
	 kekFyQCTWCAg1UW1SiRzE5LBv5JNYSm4QRlz2uqrrdwvEMyiJ41sJh9Mm8fq3hUzpt
	 3rSQDL7upkB3Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9171B6001B;
	Thu, 28 May 2026 10:39:35 +0800 (AWST)
Message-ID: <1e2b77c7916259e3e269d19f637c29427c175350.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3] soc: aspeed: lpc-snoop: Fix usercopy overflow in
 snoop_file_read
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Karthikeyan KS <karthiproffesional@gmail.com>
Cc: joel@jms.id.au, andrew@aj.id.au, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Date: Thu, 28 May 2026 12:09:34 +0930
In-Reply-To: <20260527175939.2939714-1-karthiproffesional@gmail.com>
References: <53952f011f2c57ad28d6f864317054a2a34922e5.camel@codeconstruct.com.au>
	 <20260527175939.2939714-1-karthiproffesional@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_193951_406712_7C9C5741 
X-CRM114-Status: GOOD (  10.36  )
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

Hi Karthikeyan,

On Wed, 2026-05-27 at 17:59 +0000, Karthikeyan KS wrote:
> diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/a=
speed-lpc-snoop.c
> index eceeaf8df..ef6697a42 100644
> --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -60,6 +60,7 @@ struct aspeed_lpc_snoop_model_data {
> =C2=A0
> =C2=A0struct aspeed_lpc_snoop_channel {
> =C2=A0	struct kfifo		fifo;
> +	spinlock_t		lock;
> =C2=A0	wait_queue_head_t	wq;
> =C2=A0	struct miscdevice	miscdev;
> =C2=A0};
> @@ -93,7 +94,11 @@ static ssize_t snoop_file_read(struct file *file, char=
 __user *buffer,
> =C2=A0		if (ret =3D=3D -ERESTARTSYS)
> =C2=A0			return -EINTR;
> =C2=A0	}
> +
> +	spin_lock_irq(&chan->lock);
> =C2=A0	ret =3D kfifo_to_user(&chan->fifo, buffer, count, &copied);
> +	spin_unlock_irq(&chan->lock);

This seems inappropriate and I expect is flagged if you compile with
CONFIG_PROVE_LOCKING=3Dy or CONFIG_DEBUG_ATOMIC_SLEEP=3Dy. I suggest both
if you're not already.

Further, I hit conflicts when applying your change on v7.1-rc5. Can you
please ensure you develop, build and test on recent releases.

Thanks,

Andrew

