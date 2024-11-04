Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1746CD132DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vteU5ewralNN6plRa3U2y/lnGpPjYiCg4kQzNe8iJvk=; b=2mzmx8LbDnjSuOwCMjOfiQnNXo
	Fn59N7NU6/iPoE4RJFgUqrfXU6jz/jnZaYP0sHUT9mh9HRdzs1v+JNii0eQp7dh9z5j6+/bUPvNQN
	XKeGOXMGPWO4pYZrB7bBY6o0eeiWDsjRQKndU0bMtygArvz1Z4B/TmtxUKYtt2CXpCIRAaYm3oEh4
	OInLicTx+0JXjVnV5V/S+JNrpp/AYCrXl4CJeTLmrAZLo3AJ0hoK6XXjqV8Tu5X0FQavbU2wAXO+t
	UcuMzD/XpU9H7UScEuCxuAM3Sfur4Ubl3xLVAsDXeHQDmj1s8laQVnYHRP52G2wxKD2oHb1Of+1wY
	3Y1l66kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ysi-0000000EBO8-3s1Q;
	Mon, 04 Nov 2024 15:20:40 +0000
Received: from mail-pf1-f178.google.com ([209.85.210.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yr1-0000000EB7M-2eUm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 15:18:56 +0000
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-723db2798caso897475b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 07:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730733534; x=1731338334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vteU5ewralNN6plRa3U2y/lnGpPjYiCg4kQzNe8iJvk=;
        b=SqQJ+e+JKomDLxrM4TNCU81f0lS4W3FyfEP+igVNoR0NZ6xXTKdny9QQV/Ls7TI+wz
         OwXv+dVKweR+rIWU1F3wtoUDA09HwmuTHjM9VHubYSewO+OxsmJFg9d0feCGQnJu1N3P
         8iO01sryhBs4CC/eMg4sOono6oKhDM70fZffNIhRFU/oFobXhZCm8LErYZEXp3NZ8/vB
         LLddUPRj+ZdnESJETlTTarJeNXXjNkLYm0Js9lJFsU0PprJsEcGaYK0Y/WClR4jP57eQ
         suugFWyBJBZwJme0cnShiRxAkAAuQLZW3OoGcexvRVTPBM5eQ1O764PPBI4qfJeMh0of
         pFCA==
X-Forwarded-Encrypted: i=1; AJvYcCVH2pvwA3nwj+ruENCmOzIA3jsoSZyMiygWIf5cC3yw4IPquheHM+OO+NwH5i+1QN16X+Aiga7HB+WPcyJ7erB5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/XYzEQHOUzHWlmRet2iZhpalRuGSWhZnqeQ1f9eELhwo4xiTp
	JzO78QF21tUVOBqNADD2L0yWasfjzsQefU0Tc/bXgEelFJfAvO4Y
X-Google-Smtp-Source: AGHT+IHdB2N8KaOSgq4Vj//H/vT+ujkhoSXOnjrxtoiNLljOwRnCUpgEJW7ULiCejD+/6PEWsk3VNQ==
X-Received: by 2002:aa7:88c6:0:b0:71d:feb7:37f4 with SMTP id d2e1a72fcca58-720ab39eca2mr27194183b3a.6.1730733534172;
        Mon, 04 Nov 2024 07:18:54 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8992sm7612222b3a.44.2024.11.04.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:18:53 -0800 (PST)
Date: Tue, 5 Nov 2024 00:18:51 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Stefan Eichenberger <eichest@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, Frank.li@nxp.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4] PCI: imx6: Add suspend/resume support for i.MX6QDL
Message-ID: <20241104151851.GA3388469@rocinante>
References: <20241030103250.83640-1-eichest@gmail.com>
 <20241101193412.GA1317741@bhelgaas>
 <20241102120403.GF2260768@rocinante>
 <20241104151230.bxsdu4fcf6fssx4e@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104151230.bxsdu4fcf6fssx4e@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_071855_692319_AFCF2147 
X-CRM114-Status: GOOD (  16.21  )
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

Hello,

> > [...]
> > > > Without this patch, suspend/resume will fail on i.MX6QDL devices if a
> > > > PCIe device is connected. Upon resuming, the kernel will hang and
> > > > display an error. Here's an example of the error encountered with the
> > > > ath10k driver:
> > > > ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
> > > > Unhandled fault: imprecise external abort (0x1406) at 0x0106f944
> > > [...]
> > > 
> > > Richard and Lucas, does this look OK to you?  Since you're listed as
> > > maintainers of pci-imx6.c, I'd like to have your ack before merging
> > > this.
> > 
> > If things look fine here, then I would like to pick it up.
> > 
> 
> LGTM, feel free to pick it up.

Sounds good!  Thank you!

	Krzysztof

