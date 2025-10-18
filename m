Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E786ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 09:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6z6CG4Bzykdg3VlQO62kpKPKIN5Ed0HvWERMlLp9z1M=; b=JElnYkzliO8ODBxyBAytQo2fIM
	lWhsCGw2tuqbIMhJiAXdfw6EJPL/E/H1l0jypmMNBfBZ+nr6R7o/ueUaJrWoQBUkMSs3hbtGcfWKs
	t2zcH6YvgH2wz2e+38mredHvlH4sZmdXZAAJkRfA0/rw3pvINTto9nIlswDD/K8Mi2fxIuUHXbruJ
	K90efvgL1zhP1jrkuAbQbY35Wd8iYXXktf6wn3BpA8j9aiOf4QMOpYATZPbbeqqrubXpfIG2g/Go2
	nmsP2Z9qbqrdijS0gFsd9Ukoz8BooJxT0rhbluJoZnE02lXsqnS8LmgO3qj+cuBxSFXl2dOz8y+Fj
	zlcdQ9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA2ss-00000009iO3-0yES;
	Sat, 18 Oct 2025 09:05:54 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA2so-00000009iNE-0Xkd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 09:05:51 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-63c1413dbeeso3861119a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760778348; x=1761383148; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6z6CG4Bzykdg3VlQO62kpKPKIN5Ed0HvWERMlLp9z1M=;
        b=BLdlWlbRVVbAolHfjABaPI+zbDmjZ6xUg+rX8ubBE9porNObFv8oiojSQY5M+7y/EJ
         bbtgy0qyyjS1B2Q7EpDueNpFicTynmlyVi34hzHWhkF6mbIUVaCs6621Fd413t51OSHw
         2vwbnoneidbeHRpq7OuYBK0MiS81c6HHcVzeYLLeiK9uuHOQmtnm8EudikEaB9ByyV00
         wCNMp2K+XXheNVUoQrdKePSsboWRTltEQ4/tvTZrwkTkaR69/UGWLWyP5bIi+YPNofUo
         viPuk5i4/815b68zVYPXECT7eyRskflSIOXjzgXQNCwnGFbO+SJQ6Fq1/41HlONsSQNc
         7/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760778348; x=1761383148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6z6CG4Bzykdg3VlQO62kpKPKIN5Ed0HvWERMlLp9z1M=;
        b=pFnbAtMiVCy4JhQmdwefr2FVF+DPcfpwe9oIOojn37mkg9+/lDVzhAWQtjXJZYGEL2
         Pp9WIEKI8zWnxWFtpJVwA/YhFzNeC4DVkL08UtPPohRjVQX4e1Cz1CGXgBLTJRvhrTOa
         GX1flQgcL5ZAcg+0+rqv2dPzPsDJZ6Zh0kd/O0zqTnr1Bue0i5euoxtXNS3Bvg/WvPQp
         egjHzdtd9yLC70DaxMCnuPT1uf9DqLxyi3L4zL8I0gZ8K/pFD+oJA3TN6VpsXx4USdyS
         V1GUhtHol4192mdqdJbFq7jF1l4XDxkpWzNA3WdRY1+mRxcVtTEZyK/PLpGqwyugU/UE
         5FTg==
X-Forwarded-Encrypted: i=1; AJvYcCXmPm9GR41Cy2JAtzugrGC26+udW5rxQBOQGwZg5jaPJ5zNrFB8XW6SI9H1CtNBexT69xCSRrftxJ61EOzc/T2d@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6/oRUuyLeGwWCqONa5QgGXgCmjqs5VfLtyUGOt+dQpzG7AD/n
	Pe1xRSuZ7Kxn32tUknLBX9GVbf4DSSzz5WuGZKTn6gcJS4PJljYGgTtW14Rb4xuu9EQOW0jPzCH
	dsvx7V0B4sBZBuy73JnZ70zxUD3pGJ1o=
X-Gm-Gg: ASbGncsxx5wLpMFZdYAMTkM/E15MEeMeAhmwYdWj/0G6PtUB+G2IsZFDIpoMC7NFfIM
	uvT6fHxWpK02UhGwJo4wby0tcmW9obB9MPzFwJxhmdUolfg4WOzjbkRmk3eZshJjJfeBh2ag07V
	D19n75m0jmBg7O21Ewsmw/eXWbxl39zsSkGiC+G+IfJbaAHHJVUEDFniqdH6gCflb1q1apDBxoM
	aAI+HJZnzIoHek6MNdvtkukYek+/312jSjmZjf+wlbDbK7t3p8LS3oZvSQ=
X-Google-Smtp-Source: AGHT+IEhR89+OlZnqrJ1xToJ35S4hHteVi05MGdBYp0FB9E+H5DwaPu0w+LV/8y6BXwE5xnOmNRU6JE04b6xtGtpRL0=
X-Received: by 2002:a05:6402:4504:b0:63b:f48d:cf4a with SMTP id
 4fb4d7f45d1cf-63c1f578eaamr5362961a12.0.1760778348106; Sat, 18 Oct 2025
 02:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251018061127.7352-1-linux.amoon@gmail.com> <071f563c-6d09-46ea-870b-a51e0522bfad@web.de>
In-Reply-To: <071f563c-6d09-46ea-870b-a51e0522bfad@web.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 18 Oct 2025 14:35:31 +0530
X-Gm-Features: AS18NWDj5t4J8Su9s5gXUOjbXZcv8D1D0shD_oUkWVHtMigAOGJ_VaoJUxZoA-o
Message-ID: <CANAwSgQEqv2a1MGkGtj8CpXSKOXv=_wV3afOgn=iri7uqnj1bw@mail.gmail.com>
Subject: Re: [PATCH] PCI: rockchip: Propagate dev_err_probe return value
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_020550_180389_C8750C2A 
X-CRM114-Status: GOOD (  16.92  )
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

Hi Markus,

On Sat, 18 Oct 2025 at 13:09, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > Ensure that the return value from dev_err_probe() is consistently assigned
> > back to return in all error paths within rockchip_pcie_init_port()
> > function. This ensures the original error code are propagation for
> > debugging.
>
> I find the change description improvable.
>
Ok, is this ok?

When using the dev_err_probe() helper function in rockchip_pcie_init_port(),
ensure its return value is consistently assigned to the return variable. This
guarantees that the original error code, whether it's a specific error
or -EPROBE_DEFER,
is correctly propagated up the call stack for proper error handling
and debugging.

>
> Would an other source code variant become more desirable?
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/base/core.c#L5031-L5075
>
>         err = dev_err_probe(dev,
>                             reset_control_bulk_assert(ROCKCHIP_NUM_CORE_RSTS, rockchip->core_rsts),
>                             "Couldn't assert Core resets\n");
>         if (err)
>                 goto err_exit_phy;
No, the correct code ensures that dev_err_probe() is only called when
an actual error has
occurred, providing a clear and accurate log entry. For deferred probe
(-EPROBE_DEFER),
it will correctly log at a debug level, as intended for that scenario.
For other errors, it will provide
a standard error message.
>
>
> Regards,
> Markus

Thanks
-Anand

