Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37035CF6C1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvvOv0vv9H8q++Ltdf0WVIDOuGmNQfGsyInkVBB65VM=; b=Sohrhzz6xy+htpxbtKRqmqXDf8
	PmiVu7ho94noonSy7OEJXXCsro1KR9jON5fJvGacfybNV+/nFbaNnF4v+S7prdZFqlRxJzWe/EL+J
	NPJ3HTgqPgJx9dt9/ZfsTTx3gS0hSIlDm6hXnRvFA3KR4nKsLKXOOloeV2baXMwPPDYOQ/LbQLnJY
	dHD1eyFBpx+DIPS+/bMXqZtUU24RdbQXiVc0nNI62bLvPTNUC+Zk6VYNgkp1oLl5jPNQTQyta84pG
	kkhVucOFSMPz9W9S7r9c/RET4WMtdjRE5PZpyY0YPgb1+83hUmVAPpXatowV7037lvPga1CA4xJOq
	RFArawuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQDn-0000000EbQW-124O;
	Wed, 07 Jan 2026 09:52:55 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQDj-0000000EbPU-40sB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:52:53 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2abf5900cd5so1342892eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 01:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767779570; x=1768384370; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rvvOv0vv9H8q++Ltdf0WVIDOuGmNQfGsyInkVBB65VM=;
        b=ByGGAnsWnuwXvW6RRVq3ULgNXs2covScYGxDjLpRXp+RhbIRoTWp5r1RmCt2r60A4q
         2Dk8QpymF13AmZ4UWOcq8j9zJk/zw81PAjbWJAPCNNeXz9f0ZgtSQJFuTB7fOirTo/lz
         nVyHI4tRNM2Cwb4AlVN8pNzPyismhcTlKKqV8vCW+8ByJV3zOL6Wd36gwVCikq1BBYF6
         JI8RNwrHGYXuY7efU3FdlanMrQitkjDdwMIYTUjQxz8Irquuk8SwSAdl42jwbpcdZNYY
         Fpb69HWKp0iV5xwBAqB0JWxD34TarHpaXttF+MgVH1PxvaNanR7LdSnB0xbTc+1Kk9wr
         XWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779570; x=1768384370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rvvOv0vv9H8q++Ltdf0WVIDOuGmNQfGsyInkVBB65VM=;
        b=oPeK/f/L3BM7YYocghqZWZZ20G394rYM/8o6v/ifm0GOPJVnvfDCGkAkGuCGD3JLm8
         x8Azdog3wDMYVi14fK2ZlYYXl6Myd4StLDnznxPyPbd1mvMs8/4XWrSCHS3JBbSsMzgC
         hhZ7TRJYAR6MCu44z0DNjtjZEfN5t1AJcGsW4H9bQgs4OkXx1W1MwJADv66gZYpue7fN
         Sj0eZOh0t2Gphfn+lUw8IMbx6UnoibgogrG1XWwc2iW4kRkbXV9m2R2obScRzr3/wpG0
         I9M3QQDXm3ETI2avAjKw0eNW6FMMmfHerPcsYGKlJZFk15S5x6I6OUExdT0VgWFqSIpb
         LvtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlQgPK7x3ZNdBBd/tOptVDCxSpO9TjWSFa+IePi+ntupknCR0YYcFn3h1LGtqlp1MMKZbnCHWqlCe7JDwcUvgE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk+ht/J3xlLBgwrujTMFSIKPAW7JH4/S/mSzYnxu4Sx0QLXLZR
	+mLC6cK+H9NzuEwH6ec3y2gmu7iVJaZXg6AFRh3fzHXHIKlNhS3/bfUygKZomJ/QHICX8lEP7yN
	c/uTlm4D2YKBOv96Np7jr1wRFGsrRoBo=
X-Gm-Gg: AY/fxX6UD8Pl8Uab3xA+oCVBtNbwLUEmNCR/+FZsnAFIipMXyeYZSzGwmchqsTxZowN
	m2FiOYGYKCoZcfueiynP2fkp9RZmjRPsg6H+A8puPQbFLAmZAxLeitfMZ1Z9kwBnyljpkEcQxmz
	QQEI3OUWRD+YdsTanKCZAllJIrbhd5caJfXQ3dbB1jhkKieIxM5K4hCvZ4ezawe7grJNZHoAj06
	hy4b2TgRh8rH3PGIGI3slChuhL4lr4U43gY8cq7rRjjOZUUIX1u88N5btaLJEGQRwR9G3s=
X-Google-Smtp-Source: AGHT+IEsT6AYnql0T7zlCNvOahx8BTYyJ+IW0sH1UvnJzbYCCmPWp7Cct2vMxCYT86QC+/C8HxYvBejoGMBDAF+WblE=
X-Received: by 2002:a05:7300:5781:b0:2ae:5e6b:dc41 with SMTP id
 5a478bee46e88-2b17d21b748mr1497359eec.14.1767779570503; Wed, 07 Jan 2026
 01:52:50 -0800 (PST)
MIME-Version: 1.0
References: <20260103083232.9510-1-linux.amoon@gmail.com> <20260103083232.9510-4-linux.amoon@gmail.com>
 <6f30a01c-8fc4-4368-88ef-7c513c505515@kernel.org>
In-Reply-To: <6f30a01c-8fc4-4368-88ef-7c513c505515@kernel.org>
From: =?UTF-8?B?5byg5rC45rOi?= <giraffesnn123@gmail.com>
Date: Wed, 7 Jan 2026 17:52:38 +0800
X-Gm-Features: AQt7F2p0-kEhpv052gHNNvlDi9s6r7fu21_si4nAOG3q3nXtXMATV47Jwa2xpS8
Message-ID: <CACpCAL0GLMV-2p1tKAXe6R+N2c4YadH9vpEG3GdPoHTNTQSuow@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] usb: typec: fusb302: Switch to threaded interrupt handler
To: Hans de Goede <hansg@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, FUKAUMI Naoki <naoki@radxa.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_015252_001047_7F802A66 
X-CRM114-Status: GOOD (  13.74  )
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

> Still ideally we would solve this in another way then
> switching to a threaded IRQ handler.
>
> As the commit message of the mei-vsc fix mentions
> the root cause of these errors is typically an interrupt
> chip driver which uses IRQF_NO_THREAD disabling the auto
> threading of all interrupt handlers in RT mode.
>
> So the first question here would be to see if that flag is
> used in the interrupt chip and if yes, is that flag really
> necessary ?
This is very similar to the issue addressed in commit 24b176d8827d
("drm/msm/dsi: Remove spurious IRQF_ONESHOT flag").
The IRQF_ONESHOT flag is preventing forced threading here.

In irq_setup_forced_threading(), the conversion to threaded interrupts
is explicitly skipped if any of the IRQF_NO_THREAD, IRQF_PERCPU,
or IRQF_ONESHOT flags are present. In this case, IRQF_ONESHOT
appears to be the reason.

Regards,
giraffesnn

