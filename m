Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23254C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6PoA3nqPOfL5m3FPUgvFlM9WYiufmmjsQSygs6h2ec=; b=29SYeejgOgv//cW0GeVbvfD8RH
	NXklp43XueLjpzL7wxt6hlVJB+16X0VQkjZE55YE+3BOUFcSKGjh7AyVRXJP4tlQUYtAkRhRHsOwd
	hCKAsMkYVhdd5RKIBDMcJtXWnLm0wmAfqfPTesqG+k3zDDX/EIjkc3l/gHvjTJHkd/YmCKr5LxH7Y
	8oHC2uQ9MMGtfAlar+t3jTRmfstYdubPVktg8VcojqmzDN0FTBO95+T9I/mSHhjmNCBAY2fXDDRTm
	WZ/NDS3TEGlrMKawdoQNJ5MaDBNgdmPPGbzbI1qFgobGUc6CiqKy38rVcQvw/3ptA+7JI2HxZ8Z3P
	IbGslb8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVB2C-0000000F6s7-3wBO;
	Fri, 27 Jun 2025 15:30:36 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAOx-0000000Exom-2FKM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 14:50:04 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7d40874b399so212801585a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 07:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751035802; x=1751640602; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6PoA3nqPOfL5m3FPUgvFlM9WYiufmmjsQSygs6h2ec=;
        b=QmC6csAhBAMqvS/YSar29nb6CJmG3NPxSeo8ZV52og1ZlrMya64w5RbJX/jfAShgbj
         WLVn6IiM4m+w5rXKpasHvq/uirP2/PbR0eLaOoErAaQv7PGOLfKyqtTEAfq8JplXTzYo
         mhxZs2g4th9o+fx2hnxfL1UwBqPv+oCzeHPPWLOEwQXcaUmKlh+hyvQuCrmQ+4olEuwS
         Q8rGzGxtQov2awja5Nyhd/S2lZhKaZFD+Up3KOYVLdtpipD2SjndNFoAxlCbiYktROEY
         Y9s7TWilzCP7Y08rxAUxOc0TpaXgWe9i4EXTPPN5v891ofuNkmpLDMfscCfHFuLSisFj
         MOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035802; x=1751640602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6PoA3nqPOfL5m3FPUgvFlM9WYiufmmjsQSygs6h2ec=;
        b=gx1Whl2iau4IfewgQDauHOijSBvsmJiFHjkNMv76hHmfGGacEVifT7m/QuCQ3rtIZV
         qkqbB6UM9n9WlbSpTtayZerqrpl5e9+vE2OAcOYgt8QAB23iSanNjCsgwmZXplpyaWp0
         af5BukJ8rVa1xmnuNknROLYDPhTjWFMSaMnKmsfx7YlNzgAhEmFbf7lnmcKcaJbKL3b1
         Kr5nMfOJmBCymWwJrIyn3H7mQB9CeUSFQprzpLo4kLr98NNjTC5ud56/ubEcJU7sFjlN
         2v2p7wZ6k3HYVsKeBEgP4XwnTzG+TzCet0NUfBrpe3EKy2NgLdYH3R3GwqzEjekBEyzN
         Sljg==
X-Forwarded-Encrypted: i=1; AJvYcCXHsdBXlthQnTzNArFtKfkCX8qXcwkhWaExbNetjDPhd0/9br79YECxblAh3/UpeHe5VRRladkbE1A84kiEaDc5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2vB5zHvw/7+8XH+WP1aRsZEev0FMRqPdf4ArU7JcelnCzoX8O
	eFTSwNzVvXFpZSzyFhMfnk0lpT4b1xk8KjpUnZBOosFDBGVh+6uXAtPu
X-Gm-Gg: ASbGnctPsBeKZoKNbjeysfKIBPjYfyvXjK6ZHjrt6uKxtLYflcqT9RiEteMCJG7QbO0
	8Ir7iO4qJ/KdsMc9sHcGEkAjjvQqBRUXlDkCY/ppAzOZKrpxMI22oVn7qoxcfygr/Abpunvj9On
	/61Ia6Zx3+XvehV4bXUgm40m9NgRTcYxSqWmOgvv6j5ienPB9DNDvUp8VAeGsF4O2NBnoY/rgwh
	QzQHsztqjT7JIMTrMuBJAT+xP7iyUwnidrgVGn1wT4gK62kq8SlEylamXkQUZ2dk8HYG4cwaHE1
	prwD9NDwYlVrgRJYs3JGI+FrX2zy6vP/RqmQUHp6glWRbIdSyTnOBNNfbtpv
X-Google-Smtp-Source: AGHT+IFbou1xMk6JMnADPBUd4fd5n/7zRvglAq2fEyrggZQzPKVtz6a6tLxCnjDbX4s4r2fLBp1xBA==
X-Received: by 2002:a05:620a:38e:b0:7d3:b5ff:fb22 with SMTP id af79cd13be357-7d443994d26mr429693385a.32.1751035802120;
        Fri, 27 Jun 2025 07:50:02 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c3:c88d:6da3:af6d:a237:3289])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44321a706sm139134585a.81.2025.06.27.07.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:50:01 -0700 (PDT)
Date: Fri, 27 Jun 2025 11:49:55 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
Message-ID: <20250627144955.tbmk6ako3rgv3djo@hiagonb>
References: <20250626215911.5992-1-hiagofranco@gmail.com>
 <CANLsYkzo32BHkxRzSLY1U_PcidMPOaz7xZjDs8HKtTCQ0ZpF=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANLsYkzo32BHkxRzSLY1U_PcidMPOaz7xZjDs8HKtTCQ0ZpF=g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_075003_575034_9504C69D 
X-CRM114-Status: GOOD (  30.56  )
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

On Fri, Jun 27, 2025 at 08:31:20AM -0600, Mathieu Poirier wrote:
> On Thu, 26 Jun 2025 at 15:59, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > This patch series depends on Ulf's patches that are currently under
> > review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> > Without them, this series is not going to work.
> >
> 
> I thought we agreed to repost when the feature referred to above and
> the work in drivers/pmdomain/core.c will be merge.  I'm not sure what
> to do with this patchset.

Sorry Mathieu, my goal was to update the whole patch series with your
reviews from v5 so you could take a look and then I would resend
everything again once the others have been merged.

If you prefer I can wait for the other patches to be merged and then
send the next v7 corrected.

Best regards,
Hiago.

> 
> > For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> > started by the bootloader and the M core and A core are in the same
> > partition, the driver is not capable to detect the remote core and
> > report the correct state of it.
> >
> > This patch series implement a new function, dev_pm_genpd_is_on(), which
> > returns the power status of a given power domain (M core power domains
> > IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> > already powered on, the driver will attach to it.
> >
> > Finally, the imx_rproc_clk_enable() function was also changed to make it
> > return before dev_clk_get() is called, as it currently generates an SCU
> > fault reset if the remote core is already running and the kernel tries
> > to enable the clock again. These changes are a follow up from a v1 sent
> > to imx_rproc [2] and from a reported regression [3].
> >
> > [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> > [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> > [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
> >
> > v6:
> > - Added "reviewed by" from Ulf and Bjorn.
> > - Fixed and improved commit descriptions of patches 2 and 3.
> > - Improved the comment inside imx_rproc.c file.
> > v5:
> > - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> > v4:
> > - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> > v3:
> > - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> > v2:
> > - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> > v1:
> > - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
> >
> > Hiago De Franco (3):
> >   pmdomain: core: introduce dev_pm_genpd_is_on()
> >   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
> >     SCU
> >   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
> >
> >  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
> >  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
> >  include/linux/pm_domain.h      |  6 +++++
> >  3 files changed, 73 insertions(+), 7 deletions(-)
> >
> > --
> > 2.39.5
> >

