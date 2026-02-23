Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B3EE98E15
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WvKjjDt11mfP3TCN9/c30KzME2fLxT6QYWf6QQlcsEU=; b=JLIKoIflCXXKfJcxDWm+RDY1TP
	iSQ8mI/OUEBEyqDwy88z0l+ZDNu0s3irjmPTMrmjRF8TVHSIompEEGqHd0hTLLvKTNr4PXYX0lbEj
	+4HVee+6nxIiUbmv8l0u+/9sRKZvaNEAFADagoqou8thWZQIz9KQuRnNx/QD+JyZzKX1ldahENXcC
	IrPzk4dA3TDQHHGdcSTJzTc0DaKhKMg8zstAIF9fpjDU7yApeZtmi3yajBxUHuD8WZs6p4oGUOii/
	/b7UG6YJMfsin70NeLn46MMnRdh96Kuw4Ib0VBit8n9T89aCtNz7rQ9ElsvVr5vLigyQ3YfGfQLl9
	qhnJhNsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT8V-000000003df-0imM;
	Mon, 23 Feb 2026 10:25:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuT8T-000000003d9-2Xu7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4980443BA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 10:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2FCC2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 10:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771842352;
	bh=WvKjjDt11mfP3TCN9/c30KzME2fLxT6QYWf6QQlcsEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RZrdzrMBOhr3R2Yy5aY1ky/SrDtic0JBnj/ltzb0nFARyo2i2/1ded2OfKcmPVLw5
	 0SHMc7soMJIGsY2m/2G4IBR2ceRyj6GM2w+erYDqgRHpGq7LL5LlHP919SaBtHe7cW
	 8L89SDOfiliVmHT9tzvkKHm6HgIQfs+jO03uLBV0tOVsOfJlbp5ZI2TWhvVyUqbkzG
	 cboTT6ESE/9YqHUgARbjBBBiC197Le+ZeYGttrEDJ0UKnP3AN1XRWQeSGbm7uSX3UN
	 9Ik0vMReS5Bf9iGzaPtv0W6eMpbUmVV9jvdEjCzkR4C4/nZxlz21uCXclVqWS9hUpn
	 7AfYtr0Cuhdig==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ad019bbd4so3637348d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 02:25:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9+/TyoBUuqKVWZnYfKdBAw2/lWwTXl+FWItInZ8Rd6jGT41UmJ4ubbUNjSxt7sHrzTQ2k58NmqUAdTMZo8qSX@lists.infradead.org
X-Gm-Message-State: AOJu0YwN34LTP68QLuMDY9/fSODLMDzMqg7wvZrkG1K3yulzMC53DF7C
	uciL2ITCp6XuSn79nGAywH+XSbNylEAd5d1px2iZaPwh7q3PN09HftvG93yEwPcWvY0YwW+dShZ
	IhpMCRsMdC5vhx81ojGWab1OoLDRq7A8=
X-Received: by 2002:a53:5a10:0:b0:646:7c25:5f86 with SMTP id
 956f58d0204a3-64c789d438bmr5835753d50.27.1771842351841; Mon, 23 Feb 2026
 02:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20260211033249.2770281-1-james.hilliard1@gmail.com> <c78bd0c3-6889-46f8-8b5a-e3490ce7b9c5@arm.com>
In-Reply-To: <c78bd0c3-6889-46f8-8b5a-e3490ce7b9c5@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Feb 2026 11:25:41 +0100
X-Gmail-Original-Message-ID: <CAD++jLmPN2ET6osyKw10aCNNLkjOm-fY9nAa4j-1DnSJiLw1FQ@mail.gmail.com>
X-Gm-Features: AaiRm53AE_h4ho1A7D5Kwiz-Y8WMceSw39JTy0fcYJsANc6fRKkBxrYq1NwI-94
Message-ID: <CAD++jLmPN2ET6osyKw10aCNNLkjOm-fY9nAa4j-1DnSJiLw1FQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: sunxi: add GPIO get_direction callback
To: Andre Przywara <andre.przywara@arm.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-sunxi@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_022553_701100_411B7E32 
X-CRM114-Status: GOOD (  14.79  )
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

On Wed, Feb 11, 2026 at 10:08=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:

> thanks for taking care and sending a patch! I am still scratching my
> head what this warning is about exactly and why we only see this now? I
> never saw this, so what caused that? libgpiod accesses from userland?

I don't understand that either.

> Regardless, can we hold back this patch, please? As part of the A733
> pinctrl support (and as LinusW asked kindly about that) I was reworking
> our driver to use the generic gpio interface, and I have a feeling this
> would solve this problem automatically?
> The actual pinctrl conversion is done, I just need to plug in the IRQ
> support. I ideally would have something in the next days to post, would
> that be worth waiting for?

We are early in the v7.1 development cycle, so we certainly have
time for this to materialize and figure out how to consolidate all
of the new development.

Yours,
Linus Walleij

