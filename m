Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A9CCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HgmsivMcka0FxO5n28WPRUyS7SBIOMsz34g/tl81a4=; b=1efT6pE+lUhEloymu76lzQJFtd
	lJUqSly01eKlakLjVrt908LR6rFNyWY1yr8G2b33DiX2uMZguxKljKcRmu6WDClreO3AHa+ecRHCE
	E44uPI05Nmr18t1vFchsUI7WecuVHCr+sOB6YAzTTsfMJKfx2p4Owm6jG1qbHuHZ5uIgSeakLQTFD
	QM7FWlVUq+zBzVFFV7zDDVpFRH48xBLSrOnBqod7Kb4fvsXWC/dOa/JZhA28UcS4sUvK5CMBAwizn
	oIuOWt38W6RnYX6XFH4A+mLayha2+utzSGY2rht8ZdlR0Bc/MUS3FLidHAyvy7WQTcrg1yAAPLU9B
	uLhh6NvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1Iz-00000006Co0-0iiw;
	Tue, 09 Jun 2026 18:36:05 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1Iw-00000006CnJ-1xV2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:36:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so31274925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 11:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781030160; x=1781634960; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+HgmsivMcka0FxO5n28WPRUyS7SBIOMsz34g/tl81a4=;
        b=BTVMIWk1dv0R7a/1aUr6Ze8hyFsA+0BfO2hL7lMQd+5nfpiQo/RbG12kqrH88VjP/C
         HPOlLQMdMto4fllXoBP8E+BIsMCYEl5bXVfMKuw+LlPuxnOVmvvY8FkEoXns508YTx8+
         DXR6LDzQ79HAn2rPDufvnitgKvvP/BngHKgTcE0CYmzYqN3bKDw3H48xIM6/4zKjQncj
         EsCopzbixjx4qdxvZ4PlMe+m+VIs9Q5fqG1uAICu3EVOBkKsFsHTVjM7ULhKAfDBFWF+
         vuwpyaNXjbMse4t2FRQsh9CsVO8JspJnYKPIEKj0EJbZU6chWxzDCJqVtkiqExdhCY2X
         YcBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781030160; x=1781634960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HgmsivMcka0FxO5n28WPRUyS7SBIOMsz34g/tl81a4=;
        b=TDkn1AS/AETZm0pL0S8ZAs9FasspF4lyKdvl7UG8Jz1wtQaNwRDxGEczR12ww+pwd+
         SYL2/1abagB/2ag4Vjq4T2Kb2GjXJyGTe2/OCNF3b4eyl7MQsSXQKaR6ai8nyS+O07qO
         eCWjmgHlWQikjLbj0btHyJKRYV3mFxaQg+ZZX0sI+fJJpx/i/jrSs+Olqc2Y28bkwMs3
         57VYb0H5urTH00Ond6ZcIhIH0Mb8eimRCmJuUtUdmxaKP5LCcYXK2hy72wMrnE0Bf9lz
         3HIdwwr8yLUoi2HUcwC1496YTtR+TgRn/f7cv+NqoXLYbeLDRm+VDgG+SetqUytBpzSF
         yaTw==
X-Forwarded-Encrypted: i=1; AFNElJ+HwkNBsxY577uH0H6Vmsi9VilJgV4t9SVK3hmGW8jcXVvyqivNMMEchkr2mSD3tDNgsokKyWUhzG+Wwv+I8zAh@lists.infradead.org
X-Gm-Message-State: AOJu0YycaioYSyHQDKd+BM3p3HFVFyI7t3rTKqGOq41gfBfC62giOgv7
	VwWLEAJypICC/uCi/B/aok5z08k2Yofiv7e9LMfNeG0Zo0C2mnc8FbWf
X-Gm-Gg: Acq92OEdiUFvEnm9x3B+qGXVNqcj2Q9gPneKy8qtSNp/NMRKq0jxa3wEcTES+MdKutk
	EPul1dhoSM4sHRmZ/W2lkFuFlJ7ipa4PgA9Nf6TEs/n3Y48XgrHkH1wbPuMGaAq+Jvl3lgJAgK1
	UWB8Wo+G8rsLzEogt5SZt6nf9cKsP1EhI7Eh/isLMlXEAleRmRDo3SSjf5zTVNlZAdCdQYC5ssW
	xrSqqaXyourdCzoHCes3ShF7acAzUJeYEXaQawcBXrKwtFBxKyf/7h2bvKB6tlAk+6DCM7AqHsb
	xJPRWCjIpaaeyt2XyjzjjXftXQp177jC9LbL0O9Cl6uM74ofa4e7zZjRlsT6AAFgQnbyMp+lnNi
	WNMuQfLdMOobukpqgLEiAaw/vVqN83DkxjhNfwKDOW+Irwe3G5/meYXR4t/FA9kCfnp9keFJZ0/
	De8gN4Y2l2k75slG9fos+WJKlHPkTRByPpL0XEBZUWBGLupvoos+QpE0dOP2urpPfwG9M1/5/v6
	EggnCwqfRePz5fsiFOV93t7bTYyp8hcHqdwIuNmeIvYql+szEzAgXc=
X-Received: by 2002:a05:600c:6389:b0:490:33b3:4be0 with SMTP id 5b1f17b1804b1-490c26233abmr364661655e9.20.1781030160046;
        Tue, 09 Jun 2026 11:36:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3cbfe4sm512912365e9.7.2026.06.09.11.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:35:59 -0700 (PDT)
Date: Tue, 9 Jun 2026 20:35:56 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M
 PLUS Boards
Message-ID: <aihdDCS7LDcUELLt@Lord-Beerus.station>
References: <cover.1780998600.git.stefano.r@variscite.com>
 <c65129896fc6ce80044ee1d89e12dcdff34945be.1780998600.git.stefano.r@variscite.com>
 <20260609-clumsy-material-b74a9b6bc7b7@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609-clumsy-material-b74a9b6bc7b7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_113602_544615_56B8CCC8 
X-CRM114-Status: GOOD (  14.93  )
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

Hi Conor,

On Tue, Jun 09, 2026 at 05:15:43PM +0100, Conor Dooley wrote:
> On Tue, Jun 09, 2026 at 11:51:18AM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> > 
> > Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
> > development carrier Board.
> > 
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> 
> My mailbox looking like
> | 169 ND  Jun 09 Stefano Radaell ( 27K) ┌─>[PATCH v5 3/3] arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board
> | 170 ND  Jun 09 sashiko-bot@ker (7.2K) │ ┌─>
> is a pretty clear indication that you're iterating too quickly.
> Try to slow down and leave people time to respond before sending new
> versions, not just respin for every automated response you get.
> 

Sorry about that. I was making small fixes and re-sending the series
immediately, without realizing that this could create unnecessary noise
in the review process.

I'll make sure to leave enough time between revisions from now on,
so reviewers have a chance to look at the current version before I send
an updated one.

Thanks for the feedback, and sorry for the inconvenience.

Best Regards,
Stefano

