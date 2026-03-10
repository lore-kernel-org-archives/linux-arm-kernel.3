Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EDEFCC9DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FL+FczOsbLKB+9XWOe2DA16luFi7YXbAYaW6H6wjZvE=; b=bW5nWGaTuc4GkcBr+a7d51r/DE
	cOh0PLG/UqDSr4wJCYYYg+9NRUJ2NvXDF0cPoozboqm9T1QIuETeqLQvDF8uHjyf2pjqpuIK3UB/2
	GRIdQusIER9KVNK6jOH3ZXr88ngqeT7kORpX028sPbUyCGvOUc5FqCzgtrYnLOP2ofNu87Dz9pvBU
	3B9mBbIDYsonHNjpC/4nfhHuwqXWLaU/sqAWflD/4lnN3qeznFsbW9VWVPcALJGVbk1+yISl2Re/1
	vOyk9WwGIiywE9DaG3tnwVZ9rTG4d49jrsSVxezp/S1SuKnxd8lml34Jr/LZae+gTs0msnYoHWEgZ
	6+aNvRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzthX-0000000981h-1dth;
	Tue, 10 Mar 2026 09:48:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzthV-0000000980z-3CVE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:48:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F72C442CC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C38C2BCB7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773136109;
	bh=Roe9unAo8hOJOYXIhe8DUoLAPPzE+T4k5irAoUIjGx0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hKKpp7AJqAo7Koe0cv080aODLoHhDy+zToDtu2e+kTaKN3IVVgmW/OhYSVBStJKfZ
	 95uyyPPQ8K279PtJg7y5ewvus0X5vtchWf8suUmQQpklTcyWKcranCRzKHl1f0ylxh
	 Mr30ablAAsL1neO4S5UYPcqDjqD0hIyqEALJX/FAWBnqoTTGNv+rkNUvPmgIIYsPXA
	 AeE3kUOmYYHrfbFYF4yXh2CX7yN7BTvygBJ/FqaJNO3V/jc3eIpqE6m4F6BaxrgSJk
	 QvJUj8ToiO+O2Nu+1mEbob7juhQVsbraSL3zFm8sFkQoE0awtVTBqYAl71gScz8b2v
	 mI0ZcsJIQdgdg==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso15712021d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHvqzp1QrOyD7qTUVEOp5cMY13Wko6jzn5zKzyyTBFCUQ/Nn1zEm/DSlwsAobndskSwuHe2KdGGq8afjWV1xV3@lists.infradead.org
X-Gm-Message-State: AOJu0YyXhBkSDsdpegDmgl/MgWqKpJIYOMVIq3R1w6bRqPY4B96n54Bd
	OKadFX4DnAiGEOoo+7BxcLnw7SSkAk7dUmtpsS9pSMthDvsabtc+RWxqVz1Fm280Zs3kxyYcyDl
	C8iPiQqFIDp0IBoACGl04sFcAJFxE69E=
X-Received: by 2002:a53:b1d4:0:b0:64c:ec13:e57c with SMTP id
 956f58d0204a3-64d5a235c7cmr1854690d50.39.1773136108443; Tue, 10 Mar 2026
 02:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260306075244.1170399-1-eleanor.lin@realtek.com> <20260306075244.1170399-14-eleanor.lin@realtek.com>
In-Reply-To: <20260306075244.1170399-14-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:48:17 +0100
X-Gmail-Original-Message-ID: <CAD++jLkWXGpphaO6my9ovge4e+1pD-ij9c+A1bH24mUa54mujw@mail.gmail.com>
X-Gm-Features: AaiRm52V87Yakq-T4nHCULwmCLhHG_reQHf2OvwkK_dAKKmOkDgws3_XIZX46TI
Message-ID: <CAD++jLkWXGpphaO6my9ovge4e+1pD-ij9c+A1bH24mUa54mujw@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] pinctrl: realtek: Add rtd1625 pinctrl driver
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, afaerber@suse.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_024829_847970_92E1D390 
X-CRM114-Status: GOOD (  14.73  )
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

Hi Yu-Chun,

On Fri, Mar 6, 2026 at 8:53=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.com=
> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add support for Realtek RTD1625 SoC using the realtek common pinctrl driv=
er.
>
> This patch introduces the RTK_PIN_CONFIG_V2 and RTK_PIN_CONFIG_I2C macros=
,
> which are required to describe the specific register layout and electrica=
l
> features (such as slew rate and high VIL) of the RTD1625 pins.
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
(...)
> +static int __init rtd1625_pinctrl_init(void)
> +{
> +       return platform_driver_register(&rtd1625_pinctrl_driver);
> +}
> +arch_initcall(rtd1625_pinctrl_init);

Do you really need the driver to be initialized at arch_initcall()
level? Can't it just be an ordinary module?

Yours,
Linus Walleij

