Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FD3CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 10:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2fDzd4x1FsLocXBH5HRzatZTdsSBovOyPm3nwD2R3U=; b=cyuB9lzqna3y073apmzar2+Kfy
	x2GPk0Z625X+2j3tld2hq4XpK3Lj5ZbyLeyNQYkozUaVExaOe0H/XRQMTAnYIKgO6TsFxWoO5U/es
	PrPOF5fwAx6dpknM6lg+3DQltgfJ65EuOMROzKbxiD7/JMvbmyLRjldjSgSJEjNcPYwhgBKl3Eg66
	Y02sKzbcF8qaVC3pGzm04rUBzN35AaoAY0t9V7F+2bBSrM7AFzgtVLga7WgODihyHNyyUHmnJRQ+M
	1Wt7bRCbV599ev/F6kKDrUYAz6CyDeC5EC6WvAixPbvG3C7kaTbXC5eewDHSZkf33RPUurU/OYyYt
	zTmLKpRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMk0T-0000000GNRr-3vDC;
	Tue, 12 May 2026 10:06:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMk0S-0000000GNR1-093O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 10:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D32BE4400E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 10:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C0CC2BCFB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778580386;
	bh=c2fDzd4x1FsLocXBH5HRzatZTdsSBovOyPm3nwD2R3U=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=r2KJ/QwZZ93C7cnXZ9aXEdlIu73dxnvZ0dnrR5vy0frJtRCjaWTVYUtxugnJq/U1Z
	 NVpVkemMglRlGeb6JfQSIDguI7nd3BkIb0sZfmI/YAf18/xBbPUMOqgRBhWu0L2GX7
	 gIK9aj/AXOWyXBVeoCGqvTaxDeR/t7SMkOdL+6qZZNiIi0U1qkXJ2tvsTf4qO1cuOo
	 iQ+61EdVMYIzEfzoVOwuiJ11aHkIGcCR0v76iEUwNSSIM1El6HiJjixktHOmvj4WdO
	 Tf+9rzTya9/+FbIbY1x57nVgbcRGtgGBKtm0R577fkJTtafJ0+4aOZ0yvHwnRXXE8Y
	 yjcUIZXAVWCZg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-393d07e8938so49308701fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 03:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9V6LlwudpxCSEV056savfJLT8nCwcbtk74ViqgK/fLuq/0Dx2kCXoxdAgIVCjtzElYqrzOtmxXwMPh69Z+m5I7@lists.infradead.org
X-Gm-Message-State: AOJu0YwBOsgsvrGo/aZySx44R52Is/js09AeWQxZaYgwbp25Q84ruQO4
	aeY1hTpYb8GetL6BrRLenoeNiHfwqh4kboLlWx7VSS86eYCeHfvKqchZXKoRfCyGpXY5tCXPKZ5
	4E5qOb+/4HsDJBfRMkNN8tDA9/prV+xMshv3FqPqJJQ==
X-Received: by 2002:a05:6512:3a83:b0:5a8:6e64:e88b with SMTP id
 2adb3069b0e04-5a887add6d3mr8570434e87.4.1778580385278; Tue, 12 May 2026
 03:06:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 May 2026 03:06:23 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 May 2026 03:06:23 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260512030032.5006-1-chaitanya.msabnis@gmail.com>
MIME-Version: 1.0
References: <20260512030032.5006-1-chaitanya.msabnis@gmail.com>
Date: Tue, 12 May 2026 03:06:23 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me+27Eouotw18Ayw9GbkqPLN5g25gaBc_DyR3rrDOP-rw@mail.gmail.com>
X-Gm-Features: AVHnY4IRViCLTV3_BvCH2BmXcl3_2W-sA61609ccNXge5bvIhYXSsMAvuuHcZWE
Message-ID: <CAMRc=Me+27Eouotw18Ayw9GbkqPLN5g25gaBc_DyR3rrDOP-rw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: i2c: convert davinci i2c to dt-schema
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel test robot <lkp@intel.com>, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_030628_100318_3D7C815B 
X-CRM114-Status: UNSURE (   9.48  )
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

On Tue, 12 May 2026 05:00:32 +0200, Chaitanya Sabnis
<chaitanya.msabnis@gmail.com> said:
> Convert the Texas Instruments DaVinci and Keystone I2C controller
> bindings from legacy text format to modern dt-schema (YAML).
>
> During the conversion, the `interrupts` property was made required
> to match the strict requirement in the driver probe function. The
> custom `ti,has-pfunc` and `power-domains` properties were also
> properly defined to match SoC-specific hardware features.
>
> Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202605120133.lQ1F3qlY-lkp@intel.com/

The report was on an earlier version. This patch is not a solution to a problem
spotted by the build bot itself. I'd just drop this line.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks,
Bartosz

