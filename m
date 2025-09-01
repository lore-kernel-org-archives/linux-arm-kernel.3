Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFBECA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yr1dug9uoqsjy9Ng7VRdaYQdcsKDOrIf9XRnIh5aotY=; b=XKIKM4ojO+38SGWMU0/cjrXU0D
	3E1AeE01kVQbikiWu/4d0fW9hCTEb6uP9B43Gpjh0mAD1NEJuqLsZLqiRG16ycBgrdiOPF/1ywauN
	1ZfneNiempgjhuqjtgpDBeB+Q+KIRRa6HxeKzpzZOoXcH08g+hT7aGyt+obW0T6EvQPccXTE4Ys1s
	GGxa+sC4bJOGs+YbeE7DOS+lONRUnkCgkH8+5SQsAYtU0U+DgjltTvduFVkeFmal2Z4NCqsvKaW2q
	srzPIx8kibV7AHBed9jIK+oVq1JBkImIfsEUrj3EUg0MDyhaMxDHfiVMzWqJgshLR6nqh8fUMbAID
	QtxiUx0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0OK-0000000BfU8-2HpV;
	Mon, 01 Sep 2025 08:59:56 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut02H-0000000BbQE-2ImW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:37:10 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-b043a33b060so42487966b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756715827; x=1757320627; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yr1dug9uoqsjy9Ng7VRdaYQdcsKDOrIf9XRnIh5aotY=;
        b=H11vCr44oOQs5z6WUR8f36umXNAZ2ud86rtzbi1NfjoJeJI/xGESdT0Po4nHYGKC3l
         hvHqdHvDN1V88M8U0ATbwDBNbfeiZ0SKGCV6uN8DYogthbH6qFl9PLSO0Qdhjn528PDG
         /4G96CgUpeJjRO4/BwU6x/xIiT74RohDFbb7ndUXe9EBM0s9PNbBTY+iNGMNx+muCOL5
         Uq2rfvuVHAEta779nMd1lFsXnxmerqBQyAMib8VjIkPuY5hVZE3DV5OkXwAWu68XVrel
         E4bTMGKEwcp1yPJTPMpopHIgDHUDfjt1DUMIbWQy0torO7NMHValYgCPj0fttQPPtvUB
         n7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715827; x=1757320627;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yr1dug9uoqsjy9Ng7VRdaYQdcsKDOrIf9XRnIh5aotY=;
        b=orkw20xQztN+AvOSZbUHdhaJOUW+gGE71V9ImTO2ZsTeurF7/i2ZCNUQVh5kjIk80q
         K87UviZEaquneC8q42Lnbx+5u9bkUY6iiFaR4No8v7pqSM0I+LVxwTqTOx2a9TX/8TTJ
         gakwBISaq4/6dp4WTiWDJfZLcC1JWNfpH4/mz1S4gnvX9XY+AXcoa8XIcHGFHIHjrDqx
         kvoTTNqtVxpuy8PF7X99/njdbLqZaYlPj/hNhk6CrTziunusuSarlDp3BQFfUrX+v79Z
         lZ6c3AfrF6oz9Q/60FfMCM6CYLFad/ZdgqWCzInkV5tS9ZMNwth7Cjwrk5FMnoewZNDr
         N0mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn/oHZFnQ3eEqXvdmiKHQUGOt8zrp8QUpVhxq2YbfWx02TYcBqp9E6keTMi1oCiM2aOTSQqvIoMvpPGaQKjjjt@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx8vU5zgv/UioZqk7QiOC3IK3RKUEnI551JfXzvBHLg2xZyVIm
	zMHV1Qmz18HgkFu3DQAZ+MwhGHlwjLagU1F8WucDxs9XQzcFg9XWW7LnTeSZTPVgfMI=
X-Gm-Gg: ASbGnctuPN35dcnuADVIuJudmCa/c04mg/45NVbGuaN711axcvLY3Xartel/Jm3laNo
	K6362w2BI/VlPyO33rl8Sd6miaazg+bUUYMAICWOoP4K659dsbXa0PjWP9+J8N2FTK7NTf3TZrq
	5l1NVn5dCJqGpVG33Buq6coPjewqOC9S2Uv2hqdVOQxGOu78wrUnOBcf2kYk06Txtv0dOVOjLys
	G08CRyWHjO19miA/T6HQBQih0i0cDOMI3aSMv+7ANd/7TrNfpNL7HcJ0c6NVZ/oh9/awdsaNdDf
	Sbh2jPSBMgvK4cIGVNZ7jkdtHdCb4fv6co0gZ0bZdY4WrCxFE718yz5s2k3bizUL4xtIs+LBAlF
	Ne53aFQ7egA9Mc10TBMQt01gKKa5adDldfwIRGWhbzxAKZyY2khB1UAwicMIe2EeZHbLUb8+x/D
	503crQT/ttkSZSxlDt
X-Google-Smtp-Source: AGHT+IG4idgtXWk4yyXo4GDjPHKwPNprzgZph1e8/RSYaT9SzIcOKN/gOowhBxj+9vbOLZt6n+qv7w==
X-Received: by 2002:a17:907:1c0f:b0:afe:b7c3:df29 with SMTP id a640c23a62f3a-b01d8a3274bmr655257566b.8.1756715827391;
        Mon, 01 Sep 2025 01:37:07 -0700 (PDT)
Received: from localhost (host-79-36-0-44.retail.telecomitalia.it. [79.36.0.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b018fe7c638sm550465666b.6.2025.09.01.01.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 01:37:07 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 1 Sep 2025 10:39:02 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
Message-ID: <aLVbpq99bDHWPjV4@apocalypse>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
 <CACRpkdac9K7mc5DAUnb82bR-eyzdsurRX_qFu8qoCFARDmTe4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdac9K7mc5DAUnb82bR-eyzdsurRX_qFu8qoCFARDmTe4Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_013709_589077_DE09B49D 
X-CRM114-Status: GOOD (  18.32  )
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

Hi Linus,

On 10:21 Mon 01 Sep     , Linus Walleij wrote:
> On Thu, Aug 28, 2025 at 2:45 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> >
> > This driver provide pin muxing and configuration functionality
> > for BCM2712 SoC used by RPi5. According to [1] this chip is an
> > instance of the one used in Broadcom STB  product line.
> >
> > [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
> >
> > Cc: Jonathan Bell <jonathan@raspberrypi.com>
> > Cc: Phil Elwell <phil@raspberrypi.com>
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > Reviewed-by: Phil Elwell <phil@raspberrypi.com>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> Overall this feels merge class, I am looking over the requirement
> series from Bartosz to see if we can merge it all today.

This would be great! Thanks!

Andrea

> 
> I also looked in a vendor tree for the (by now 6 years old...)
> BCMBCA driver, but it appears to be a completely different
> beast, requiring some magic 0x21 to be written into a register
> to "commit" a pin control change.
> 
> Yours,
> Linus Walleij

