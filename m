Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6CD8D44D54
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCxSEzKgL1zH2eyIUhadinz5mEtbswOhMWKsLzQ9Pjw=; b=JngnbmLYZGCdkt48/1L8YHzPSD
	zIxjyO7aFcVu7Z3i6L/RnyfPFMUlm9tHCd2VAZV5oD/XQJr9CQdHBcABbZhRmfAXO3qMUDN6c4b3b
	ou3v4w9FlCiA0B9FYdC1UXJG6cL67tWRUpdYLykUWgxNU2qZ7Gmts3+99/hRSaKUQtkASpLkQ8gCh
	tjQgAJEo/zgaakfxDWo79lDGRw/a0QPRZ69onG4Sac/mAYIXtIHZIeu00dPjsagIR2Idp+JkqUZaY
	C29z3VL2a24oN8wghMO0vak/1gl+7eyYXEudrYCh6QJFJgDpFcpQJGlrm9kePUoKIbCb8FiqbmWvf
	HVoyC5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8eWV-00000002yw8-04ch;
	Wed, 06 Nov 2024 11:48:31 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ddx-00000002pHQ-2Nxg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 10:52:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so57622395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 02:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730890327; x=1731495127; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UCxSEzKgL1zH2eyIUhadinz5mEtbswOhMWKsLzQ9Pjw=;
        b=Zrd42nYF5QwfXKjyDNaqY91YvfjvMTMxumTsYUQJjsmj+iv0dL07Iq9MUIPvx3oRTR
         l7K92KM9koxS5BEbdnW8WC+cdudpp8Xi0IynR9Zgxhah54nY6ozx9lEjPIka6UhNs0eX
         LPfGaC4ls4NEkD+FfFNEZf2YUs19+SXYOYBMEvnLEZxEZmGLtcI8KNPvfVT3J1w3tokI
         8+X7ypDKmwY0BqW6b2xRhACTl3AnocCDzha/JfeKbk8bvXwXs4y9KSKtR9udSXN9Gg6z
         qv3iv6XKXXJ9L35AJF5ox5IM8mU6S4NsSJm7ydPTcfRtjzC1c5yq7/Y2xP38KfBb2xYD
         fZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730890327; x=1731495127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCxSEzKgL1zH2eyIUhadinz5mEtbswOhMWKsLzQ9Pjw=;
        b=vDSf9pkHQu7mqsUAQOJr5k239LLjUjVvikiOk8YIochy7UaEkmwzyfPjhGtw273Wyi
         yxDkt/ZSEkaCIoDa+WWO9EWbjaGKr2fu1odjxL1SDZwpLnEoZjMU5u6YNzzmXdTui2pM
         AmzfbjynO3w7cgxGAMKp8FHAEPFXiMRqp3Cgk83V8Z0k9cIRpFeXoiAKTpoLNyPphV/r
         Rm5qou36gleARJ29yzy9kvKzjHF92uUAF1cxbCq6FCJIaDegGHHk0dk97RiHM7xHXqXS
         UP6SHlovF1FrxxRgDl/yNVucU/1/6wwjLmiV3q8E2uEgn7A1ZZnKNBZ/K7oXPghM1ZmQ
         a8Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWp7WUMnb8MGiPbCzZraHzYXi7aio8xpiAEjnkf4fM6KawMnGoJq8Y6HQnlaTDqnjlzKFAqctqXNMQC1fAFSA1q@lists.infradead.org
X-Gm-Message-State: AOJu0YzPB6rQGKpYiWiLNk89iyB6DSaVneOYeI2YMfNyHYi7evme81Ej
	e/BLFq4K6HgHhuPtAyFf/KsDHg9TqrdWbzI3TzR0MYYVhG0jKqCQ
X-Google-Smtp-Source: AGHT+IHg4XTEew3l0kqPf+Gkb9KGrdyLxo/QnI5GgVlIsaFloaF/eSsiXGJtzKZ1/slEJ0FlL44QOw==
X-Received: by 2002:a05:600c:5493:b0:431:5533:8f0c with SMTP id 5b1f17b1804b1-43285649fe6mr151529565e9.29.1730890326572;
        Wed, 06 Nov 2024 02:52:06 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:e6de:f900:d54a:ec1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e073sm18676391f8f.66.2024.11.06.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 02:52:06 -0800 (PST)
Date: Wed, 6 Nov 2024 11:52:04 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Shawn Guo <shawnguo2@yeah.net>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	imx <imx@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1] ARM: imx_v6_v7_defconfig: enable SND_SOC_SPDIF
Message-ID: <ZytKVAQzaMKd3w1o@eichest-laptop>
References: <20241030122128.115000-1-eichest@gmail.com>
 <ZyXTFhEm9UCBii2c@dragon>
 <ZyY41nJY9ghwe-Y4@eichest-laptop>
 <065268d6-84eb-4247-b834-40a9ff32c1f4@gmx.net>
 <ZyiAMpjmXuVMi5FX@eichest-laptop>
 <787b45a1-9f8d-493d-8930-e1c8d396c818@gmx.net>
 <Zyj0VsTJ2qDHiss2@eichest-laptop>
 <1044800423.57572.1730815098440.JavaMail.zimbra@savoirfairelinux.com>
 <283bbd2c-0997-43d6-bc24-08bf2cb2412b@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <283bbd2c-0997-43d6-bc24-08bf2cb2412b@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_025209_696801_CEBD96CC 
X-CRM114-Status: GOOD (  57.85  )
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

On Tue, Nov 05, 2024 at 04:52:04PM +0100, Stefan Wahren wrote:
> Am 05.11.24 um 14:58 schrieb Elinor Montmasson:
> > Hi Stefan,
> > 
> > On Monday, 4 November, 2024 17:20:38, Stefan Eichenberger wrote:
> > > Hi Stefan,
> > > 
> > > On Mon, Nov 04, 2024 at 12:39:40PM +0100, Stefan Wahren wrote:
> > > > Hi Stefan,
> > > > 
> > > > Am 04.11.24 um 09:05 schrieb Stefan Eichenberger:
> > > > > Hi Stefan,
> > > > > 
> > > > > On Sat, Nov 02, 2024 at 04:35:19PM +0100, Stefan Wahren wrote:
> > > > > > Hi Stefan,
> > > > > > 
> > > > > > Am 02.11.24 um 15:36 schrieb Stefan Eichenberger:
> > > > > > > Hi Shawn,
> > > > > > > 
> > > > > > > On Sat, Nov 02, 2024 at 03:21:58PM +0800, Shawn Guo wrote:
> > > > > > > > On Wed, Oct 30, 2024 at 01:21:12PM +0100, Stefan Eichenberger wrote:
> > > > > > > > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > > > > > > > 
> > > > > > > > > Enable SND_SOC_SPDIF in imx_v6_v7_defconfig to support SPDIF audio. This
> > > > > > > > > change will fix commit d469b771afe1 ("ARM: dts: imx6: update spdif sound
> > > > > > > > > card node properties") which moves away from the old "spdif-controller"
> > > > > > > > > property to the new "audio-codec" property.
> > > > > > > > > 
> > > > > > > > > Fixes: d469b771afe1 ("ARM: dts: imx6: update spdif sound card node properties")
> > > > > > > > It doesn't look a fix to me.
> > > > > > > I agree somehow, it was just that before the referenced commit our test
> > > > > > > succeeds with the imx_v6_v7_defconfig and after that we get the
> > > > > > > following error:
> > > > > > > [   24.165534] platform sound-spdif: deferred probe pending: fsl-asoc-card:
> > > > > > > snd_soc_register_card failed
> > > > > > this error should have been in the commit message including the
> > > > > > information which platform/board is affected.
> > > > > Okay, I will add this information to the next version. We see this error
> > > > > on an Apalis iMX6 which has in my variant an NXP i.MX6Q SoC.
> > > > > 
> > > > > > > So maybe it is not a fix in the sense of a bug, but it fixes the error
> > > > > > > message. However, I'm also fine with removing the Fixes tag.
> > > > > > But this patch doesn't look like the real approach.
> > > > > > 
> > > > > > Could you please clarify the impact of the regression?
> > > > > So the problem is that before commit d469b771afe1 ("ARM: dts: imx6:
> > > > > update spdif sound card node properties") the audio driver was
> > > > > using an implementation of linux,spdif-dit and linux,spdif-dir which was
> > > > > directly inside the fsl,imx-audio-spdif compatible driver. Now with the
> > > > > referenced commit the idea is to use the more generic linux,spdif-dir
> > > > > and linux,spdif-dit compatible drivers. That's why this driver must be
> > > > > enabled in the kernel configuration.
> > > > > 
> > > > > > Is it just this error message and audio works fine or is audio also broken?
> > > > > It is not just the error message, audio is not working because the
> > > > > driver deferes and because it is not enabled it will never succeed to
> > > > > load. I don't know if this is called a regression, because the driver is
> > > > > there it is just not enabled in the imx6_v7_defconfig. I thought because
> > > > > a lot of the i.MX6 based board use the generic driver, it makes sense to
> > > > > enable it in the imx_v6_v7_defconfig.
> > > > okay, thanks for the clarification. From my understanding
> > > > imx6_v7_defconfig is just an example config for testing. All possible
> > > > users of these boards might have their own configs and stumble across
> > > > the same issue. So I thought it would be better to add the dependency in
> > > > the Kconfig of the FSL audio driver.
> > > > 
> > > > I'm not that audio driver expert and don't know how the dependency
> > > > handling between the FSL audio driver and the required codecs like
> > > > SND_SOC_SPDIF. So it's possible that I'm completely wrong here and your
> > > > approach is the best we can do.
> > > That might be a good point. I don't know how this is usually handled.
> > > @Shawn and @Elinor, do you think this could be an approach to make
> > > SND_SOC_FSL_ASOC_CARD select SND_SOC_SPDIF? It already seems to do this
> > > for SND_SOC_WM8994 and SND_SOC_FSL_SPDIF.
> > SND_SOC_FSL_ASOC_CARD will compile the machine driver fsl-asoc-card,
> > SND_SOC_FSL_SPDIF the CPU DAI driver fsl_spdif for the SPDIF
> > and SND_SOC_SPDIF the codec drivers spdif-rx and spdif-tx.
> > 
> > In my commit series I made SND_SOC_FSL_ASOC_CARD select SND_SOC_FSL_SPDIF
> > because the old machine driver previously compiled with SND_SOC_IMX_SPDIF
> > selected SND_SOC_FSL_SPDIF.
> > But because fsl-asoc-card is a generic driver, it could be used on a system
> > that doesn't have an SPDIF device, and therefore should not require
> > SND_SOC_SPDIF nor SND_SOC_FSL_SPDIF.
> > So maybe it is not a good idea to automatically select SND_SOC_FSL_SPDIF or SND_SOC_SPDIF.
> > 
> > On the other hand, if every imx6 or imx7 boards have an SPDIF device, then
> > I suppose SND_SOC_SPDIF can be put in imx_v6_v7_defconfig.
> Okay, I'm fine with the original approach.

Perfect thanks, then I will improve the commit message and send a v2.

Regards,
Stefan

