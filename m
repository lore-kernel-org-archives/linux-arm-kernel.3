Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695A4FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvsqEGiRr2aMUPxm2PwD7DIcDzBPYJDFXn2qMdcwOC0=; b=OlJ/H6y9RUWKQdUJJuic56sd2f
	iscCMzcV/H6q/o5dgWLXRTgq9y992Iaf3R13WWZTNakz7JyAzKn6dXSVvhi9zTu2XJ8vaM833Dthl
	FcJ3oNDebpRnODKDlb+EAERvcdEqHNx3sthXW5iDSFYHcjHNv2824TMfGj/qlsAO/lKb/JNg6i36W
	qA63l0T8QrbgqkuUEmcg3eYwKqK/7dVxh1FvM7bCaL1VsmW3Sq0shpzH68raiUVjmiX3843CICSE+
	VHcAdJfvgPPTB4bPCT2+60iwHAGoHmY6FGUGqqTOsCN8fVlNh3omKAfr4kfBwcHA/aUy/E5yql5Gd
	7fYnNYCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIjH0-00000006Vxn-3bKe;
	Fri, 01 May 2026 08:30:58 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIjGy-00000006Vx3-3Mad
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 08:30:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43cf7683a28so1123705f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 01:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777624254; x=1778229054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvsqEGiRr2aMUPxm2PwD7DIcDzBPYJDFXn2qMdcwOC0=;
        b=To0qe3l0vAu0P3HelDCJoh3V9ir3NtQBqsW6gCduW4BKD92WCdqOt+kgJ1iP6d+vf7
         Ee4xvGHv9kOcRR0efovOlD1NbV/Ju3Us8C2nWTXPNX7lG6XXuPjAilHQTJsu1J4tTSGg
         PeM6kUJcwujzNMtoZiK4thvrgzLX3dDDrWlYVS8/GUnHqLuzjJSLoCliT0/iaiNhsmwe
         0efOBii1Vm/+DXu3OTVcXpAjNhXCIBEON9L9xl4MMMrun3Ubp8qdEPMjizlGAZ+IeyS4
         DcpJUekqb+4O4nzteFb2NoBS0N9OsP8paL55102lyvjxqxePgqKLrKZuHhPr/omHn+My
         CiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777624254; x=1778229054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xvsqEGiRr2aMUPxm2PwD7DIcDzBPYJDFXn2qMdcwOC0=;
        b=tF3RTuhE6hANzWeDkUC8fX142+cO5reV3GrRqRkimPmZoqXPKhWN3hKg30zhadFgSA
         3Ia5REBmfmoKKVl7TbSW1ZOqeBaMtj6MVxF65CKb0No5N8AJHOgYXjsowFvMeIBfJasX
         Pi8iTz2uNx+0w1vFY4H7WRDG1rK0q43uEbXMthup/RHDWubp0A6+xW4fHJzKDXs/0brM
         invfd/lMJsFNKcVA+L2VKvyCmVbxtymNyX5CS0cKZ88cUPzyBYdksamlu+F6+jC8CoiA
         u6LG3rW2H03tubvHTAIifVdnMIDv1LSNXt5YuqQ53bbXRkJM1gOIHdLMM5X2g7ZeXZC9
         t2Wg==
X-Forwarded-Encrypted: i=1; AFNElJ/f9hOVhatu7SQztuMZ/20DvywwAuV2fXiiFiqA0cN1SiOxdfNtuT2ob7FHYuptcCbKVz5l8VfjkppZ23StfK5Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxE/n5X3ifXx90MfgHpHyY4CfVxSoe0cv6Cs1bm+binVcfEKF2Q
	7oZpZaSBvKRWMmpwreX2AsKEKdE9k3DV9iZL6m+KfN8nITx6JI3MN8Hf
X-Gm-Gg: AeBDies3bPPIy9qhwZkSeMtBLoBXnUQBp1/BI9FPQkC9Ie+g++iKRN7UZUKQGDHiTA4
	WWTo+2iMtfaw03Bqof5Z5lN7X2gXRDq+cG2XL7hnesquRMqW83MafqopMzZTj7WFeenDOQBXBXF
	NQImu5//oEtxYaD507gwwllxpvPWQ9Uh6BalArl4pfinr+GSV17fezO3t5sCituHKk1K3G6X9vU
	oYdLQHrF3A3mthWa+0uJaJxPc5cBztPyg/ouDTvBhlaBjfHrF/ozXzqvxFWyzWYf3XdlAxVs0tl
	TFD9jEYdHOXwi/WakUzh8vBfo8BG3xzjw6n2As8ENGDBhGRwcSeQFubvFsvyvp4jz0yHq+fKxz3
	V57m/qzMCJY4yh1AFR32DPby8CDsrtduwOvfs3e/1O9keGI1tB05z5iMr3NWgOgt2Tkk3Cnb4XC
	VLdSSQZeaPyni4l8Te0tMo9cs/vTDu1dUcHOfV0/PdieoEamn9UfkaaN/NGTbgOginxa44qpsI1
	JKG3PVVWSWVOg==
X-Received: by 2002:a05:6000:2582:b0:44a:2cb3:b633 with SMTP id ffacd0b85a97d-44a2cb3b668mr6019597f8f.12.1777624252671;
        Fri, 01 May 2026 01:30:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a981defbfsm3336950f8f.17.2026.05.01.01.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 01:30:52 -0700 (PDT)
Date: Fri, 1 May 2026 09:30:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Hans Zhang <18255117159@163.com>
Cc: broonie@kernel.org, sunny.luo@amlogic.com, xianwei.zhao@amlogic.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, han.xu@nxp.com,
 haibo.chen@nxp.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, lhjeff911@gmail.com,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/10] spi: Use FIELD_MODIFY() for bitfield operations
Message-ID: <20260501093050.3f97cd3e@pumpkin>
In-Reply-To: <20260430155456.36998-1-18255117159@163.com>
References: <20260430155456.36998-1-18255117159@163.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_013056_871235_15BF539C 
X-CRM114-Status: GOOD (  12.21  )
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

On Thu, 30 Apr 2026 23:54:46 +0800
Hans Zhang <18255117159@163.com> wrote:

> Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
> macro across multiple SPI controller drivers. This improves readability and
> adds compile-time checking without functional changes.

I don't think these changes are worth the effort.
The readability doesn't change much - you need to know what a slightly
more obscure 'helper' does.
The extra compile-time checks are pretty unlikely to ever find a problem
and mostly just slow down the compile.
The generated code is likely be slightly worse.
And, with the best will in the world, it is easy to make silly mistakes.

	David

> 
> Each patch modifies a single driver, allowing independent review and
> application.
> 
> Hans Zhang (10):
>   spi: amlogic-spifc-a1: Use FIELD_MODIFY()
>   spi: amlogic-spisg: Use FIELD_MODIFY()
>   spi: cadence-xspi: Use FIELD_MODIFY()
>   spi: meson-spicc: Use FIELD_MODIFY()
>   spi: nxp-xspi: Use FIELD_MODIFY()
>   spi: sn-f-ospi: Use FIELD_MODIFY()
>   spi: stm32-ospi: Use FIELD_MODIFY()
>   spi: stm32-qspi: Use FIELD_MODIFY()
>   spi: sunplus-sp7021: Use FIELD_MODIFY()
>   spi: uniphier: Use FIELD_MODIFY()
> 
>  drivers/spi/spi-amlogic-spifc-a1.c |  5 ++---
>  drivers/spi/spi-amlogic-spisg.c    | 13 +++++--------
>  drivers/spi/spi-cadence-xspi.c     |  3 +--
>  drivers/spi/spi-meson-spicc.c      |  5 ++---
>  drivers/spi/spi-nxp-xspi.c         | 12 ++++--------
>  drivers/spi/spi-sn-f-ospi.c        |  5 ++---
>  drivers/spi/spi-stm32-ospi.c       |  7 +++----
>  drivers/spi/spi-stm32-qspi.c       |  5 ++---
>  drivers/spi/spi-sunplus-sp7021.c   |  3 +--
>  drivers/spi/spi-uniphier.c         | 13 +++++--------
>  10 files changed, 27 insertions(+), 44 deletions(-)
> 
> 
> base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b


