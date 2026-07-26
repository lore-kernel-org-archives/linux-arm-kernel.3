Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC6AC531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=632RwbBBibm199GNX2dzWevYniUR/dq64yJK2ZdxiqY=; b=IsZheDl5s2nIrzDMbCPVsvylLl
	4Ng6EEcQVBxg9hv3j20gJ4hXsgvsnznmVIjZdjdsYAyT9aKvSgXv/eT5JXrSs/PfE+XvCDOLa6i44
	TdUnrZuMXTIqqGTea141xdDhDkohcnTYaJZn/ofPW4LUQG/mK4cpKFN0JIKKoM82EEVov8j+wzfkE
	o9V6NizALTkZY5oW/b0lvomcfXpd5VRsEiCRibdIYGqFUlNv0DjG+vVN2FX3lLXyfxYeY+yCNVOsQ
	/QllmWkJJOG+qrxhKnNmKYWll0ncWT/xv7r4Bblr8Gzp1mxyHXr04Yy3N46rbNYKzos7ePP+2qrUO
	xAdbi/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwse-0000000161R-01u7;
	Sun, 26 Jul 2026 11:18:52 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwsc-00000001616-0PVt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 11:18:51 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-44cb057311bso923732fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 04:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785064729; x=1785669529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=632RwbBBibm199GNX2dzWevYniUR/dq64yJK2ZdxiqY=;
        b=BH9ktosM3WySfot1Fie65Hd6+iO0VgcF3Cq1faQ+89JStR0g1eSqjfTg5A2GyP4vtG
         2uemQ/N0KTUttLRLO+iMIB2H9iBSNdbTl/F7SxgW/NUm2ShYw5fmgSiSG1rX4dtoS4v0
         aWiIkYuhNC+yIWfwwonpQ0JHaYiSqb7T+UaB8L7vgjAa6XOklpGo17CGbO8N0p7FNB3P
         sm6FYHzKOE47mzqOqKuouILHaoJlI4cwWy6TxPXLOF/DiAA/HmvwILpEGdKfdFDnrAgA
         aKimMm9YN/2iDKqM6PpXLj3YJcPv1YAyT1lXpey8f/fKa7r+0YNamAgleRS0RSUoDttN
         Kvuw==
X-Forwarded-Encrypted: i=1; AHgh+RrPEwNAyNNHTtzXuk7k798YNFPu2BdBOI6gpR/lkwqaQtDeE8WjUqZDzDUqpx1QwcGwExY5MOk17u0Vtho9N48r@lists.infradead.org
X-Gm-Message-State: AOJu0YxCPPQ/k05DsCHz9MIXWR532xJVU81wAJ+BKenbeKROwxR7Q1r+
	yXOcj7CMSr0XVZCsiIAGy0lfduRuL96EqRXYF4HubKNno1wecnWilxmsTJBwcLzeig==
X-Gm-Gg: AR+sD11L4SmILncUhlZNmAuf4v0X7xQWXJ9zql0dNwIg3Xv1V6Ms8fc1kBWYkV2ZHfl
	6Befda6WB4cR+OVAC1vaGfRMHq2SAMaOKGMea2ihsuI8CHg84WhS4kSMmeTsjN2GNIqwW/DzVq1
	MYQ3bDRVvmIx7yBO4PP/uoUPalv14MAebIP5GJF0rG7/cCI09wnzUkeYm902HKO4gBE5yUTqE1v
	fuoDSLin1SxXXM2P3H7KXyiBxiOUUkwpc5z6qJ5LgybnxV/9JMyfM6WVt63oYqo8LIeaiTRW0yt
	F8xaL38eL+AwD77D/VMA7fu+je/iXVClDj0bXshbQ73bKG2+VuVLrz2WoqW3qFf6ZxKifHRW0sD
	FHKFUR4UFMbQ3ubTu0txlvy8zrl0DoqvCV6DDOGcl3qnDm5JUG1MyfvAw2cGC1DNLmUNlwyyroH
	PC3Y9OEOTvPpKOgi26IIdDlLAGh1g34A5Ib0lzBmjIFGnIWjRff6UgHpH9T1kUpICv7cSidj04
X-Received: by 2002:a05:6870:391f:b0:441:a287:137d with SMTP id 586e51a60fabf-457f27493d6mr4505474fac.29.1785064728629;
        Sun, 26 Jul 2026 04:18:48 -0700 (PDT)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com. [209.85.160.43])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-457674879f7sm12969825fac.13.2026.07.26.04.18.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 04:18:47 -0700 (PDT)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-44cb057311bso923726fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 04:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrpgv6RNq3Z6Tk9UiQyvljEEgL45wsVhFRnz0SxgVc0/kKWahkF+qoBGwLNYovom6jGMuOJZFHKhbimIFaQfOWp@lists.infradead.org
X-Received: by 2002:a05:6871:1c7:b0:417:3441:6c54 with SMTP id
 586e51a60fabf-457f26b3ab8mr4168574fac.27.1785064727020; Sun, 26 Jul 2026
 04:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-5-fourdollars@debian.org> <al59LnVJQhiZq9yR@ashevche-desk.local>
In-Reply-To: <al59LnVJQhiZq9yR@ashevche-desk.local>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Sun, 26 Jul 2026 19:18:35 +0800
X-Gmail-Original-Message-ID: <CAAT15mNtGTyHHdYooj=Swe1hZ1K3Jo4TkO1groi1LnVih4M+ig@mail.gmail.com>
X-Gm-Features: AUfX_mzTCh_05ojLUq8ZB-hAiaGj-Auwe5dWIigJ-AodVsVlW5LsP53qKDqeICk
Message-ID: <CAAT15mNtGTyHHdYooj=Swe1hZ1K3Jo4TkO1groi1LnVih4M+ig@mail.gmail.com>
Subject: Re: [PATCH v16 4/7] spi: pxa2xx: lock out runtime autosuspend for
 Intel LPSS SPI in PIO mode
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Mark Brown <broonie@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Lukas Wunner <lukas@wunner.de>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_041850_145185_5915C6B2 
X-CRM114-Status: GOOD (  20.10  )
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

On Tue, Jul 21, 2026 at 3:55=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 12:21:13AM +0800, Shih-Yuan Lee wrote:
> > When operating in PIO mode on Intel LPSS SPI controllers, runtime PM
> > autosuspend clock-gates the hardware block when idle. On subsequent
> > transfers, MMIO accesses to trigger resume are performed before the run=
time
> > PM state machine can wake the controller, causing PCIe Completion Timeo=
uts.
> > This issue does not affect DMA mode, where the DMA engine holds the req=
uired
> > resources, nor does it affect non-LPSS controllers.
> >
> > Lock out runtime PM autosuspend for LPSS SPI controllers specifically
> > when operating in PIO mode.
> >
> > Acquire a runtime PM reference via pm_runtime_get_noresume() in
> > pxa2xx_spi_probe() after registration, and release it via
> > pm_runtime_put_noidle() in pxa2xx_spi_remove() before hardware teardown=
 to
> > ensure the runtime PM reference held in probe is released without invok=
ing
> > runtime_suspend on already-unclocked hardware.
Hi Andy,

Thanks for the feedback.
>
> .runtime_suspend()
>
> // this is how we refer to the callbacks.
Updated the commit message to format PM callbacks as .runtime_suspend().
>
>
> ...
>
> > +     /* Release the PM reference held in probe for LPSS PIO mode befor=
e
> > +      * hardware teardown so the PM core does not invoke runtime_suspe=
nd
> > +      * on already-unclocked hardware.
> > +      */
>
> /*
>  * Keep the comment style as per SPI and many other subsystems
>  * and as in this example.
>  */
Updated the multi-line comment in pxa2xx_spi_remove() to adhere to the
standard Linux kernel multi-line comment style with an empty starting
line.

Thanks,
Shih-Yuan

