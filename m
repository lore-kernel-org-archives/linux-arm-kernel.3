Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CFCFCD0C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 13:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ns2P3ggM46Yr88OF2vB1ZSaRsJzPAmjjEjQot/+oNY0=; b=qe1K8gE2k78qSHE5S1KgLs6de5
	5lVeLfNsRflCNoNn7mk4AnmsZS+5HyVs9EgUOA4sCplZa9k1nUbMzcMMzKVvHjo9PHsIeHzVDM8po
	cYmKKwGsh+bXlxV+hzSmvrmD8AfKyp/bKaIX8nQ+hfzwqhzbFqo7pGReIjYlFyOXdeDYK7p4gHOs8
	9jqKnbLkwcaY17MLv3zJ8nlGWwkLy+sOx4jTcoI6yFxqLrNlIXTxWf4zrCxJdQuRztGJ9Z/JwQFlc
	bPlqKlJca3NVoiE44PmYXGsbYJPqJMoh8MJMZnjcHdqZjwtFx51x5gxAzKfit2zudSAwY11GLlWJY
	P8v09+iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qcL-00000008Rqw-1W6z;
	Wed, 18 Mar 2026 13:07:21 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qcG-00000008Rpg-0eVw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 13:07:20 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-38a41026318so59213811fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 06:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773839233; cv=none;
        d=google.com; s=arc-20240605;
        b=XG1YlCy74BIg2CgjDFhBhixib0FXN59h5MSqGOjhrxgvUS00AfKRjmHFjMwWF2ETot
         U2HDkog0qMLUINXzu44UIGu4x0TphslurpCP25EFd0vVDykn8Tbp/LWFYcpEdK+TjYwp
         kuleZ3KqQAZxFVY+djjqgd6UeiJ8o3Xf+VU318mVlKU2BP3psyW9XO/IH/zXiVNe4E/I
         9DyXbR3+FmyQf+BgdaoButW796/64rAuVUGXyt6KQrBqCUXG385iuKDdWREQ+RfLkNkK
         UaiSki+2Cod6p5XVqgEMcmpS+fmqJPiZeVKmRz2G6eeECZmm3RRjls1Fl5z5VAGQdXsD
         WZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ns2P3ggM46Yr88OF2vB1ZSaRsJzPAmjjEjQot/+oNY0=;
        fh=WcIZaAaULLqpLKHjg5F+Ep77slacPRzUcr4fWJD6DvY=;
        b=gopgSERIg1+H1kfD7JcGC6mmIwQN6dfdXCiHgIo8n+FIGv/H980pCY4wJhQ5rbWLPG
         0I+3IAT/T31ciPtP50YLd1S1v48gPIrDsjsNDZQHLtWfVcZbum4uzjcMBFUEyqHjaM2I
         JP+hbO/rbA0PiNOPSwpYRJwUh1cqzNlpvY68ZuMo6WMWc8JowObZN4WJnrJDKM6tXuFJ
         5uaSZrONOjwLREKfoXaSDGD8CYTRFN9C3kJn9McG0y5IzXOx6Ei77bPQBpRcuk6feEbD
         L2wF0sW7h2X8AtjmuIIarWE80SuF/Kq/lRVLldf6MKAOGKF5PbgQXUwzCKcbefl89+J1
         CsGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773839233; x=1774444033; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ns2P3ggM46Yr88OF2vB1ZSaRsJzPAmjjEjQot/+oNY0=;
        b=W+KXZsFjEuuVHAxdFofGDxq32cYYOKx6qMnbCZK3QHuFtzhm8nMi+xrbyPXxnneoIb
         0hTef74K266JWEGCZtBOMrm6+HGM519Eo91Pixpa4OP+4V+N4/17SVLAOjh0Cf31ARGU
         YSUipeqmnnMZiw/1bH3e1cdrd8qCwvqAAfF21U7OZ2PLPVF3oIwQnfVlfUj6gMIw2Mz3
         kuAUQ+CozpgZ9IUvBkxcbiv6TbKEAxKB0xXu3W81rsyKKYknC0gTD+lB7W482pSam11G
         +osEQqyq2EhjFFOJhglEBvEuIyNCPFoToemquZSuuJ8kF0XkgXM8gimUTAME5ceIJ2Hy
         PdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839233; x=1774444033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ns2P3ggM46Yr88OF2vB1ZSaRsJzPAmjjEjQot/+oNY0=;
        b=iNCbZIQV8n9VMVJ0y2cds6MjvZf8Ao7HeFg/R8BkATgnqorXa/cdl5D1vxaAlWwEdy
         JT2dpNqVUbeJhV2bYJ9ZhFm3oPcpCnVAvieoeYR9VutRnVyI/R21u2F14//oIamRa89F
         f2xk+ibCB6Hs5ihVnHkeuaEYnHlX0t6b9c2vlGdZmmXYbynHsUbDg483+m5MCmIEWtV3
         favMAHsC0pveKMT13iKkNGclAH8+f+Z5lG5TRWUj6Kp8aMxZPAUpbiJVbQqdl48MOBBx
         mNsn6K33J63VePiVUlcYHqDgRWWj7/63j54hcSN9SqP2WktOtTOmtmoSaZIfSmoT429X
         1NmA==
X-Forwarded-Encrypted: i=1; AJvYcCV2SrLXmRxVlvQc6+c0+veCWAjktuovRr+tirkI6KNEgv/S8fI6+ifkZhHynEfA31rOwLmw6wzZbtrldqoAbFkX@lists.infradead.org
X-Gm-Message-State: AOJu0YwIMbYdb2GzDqv/K6jAx38CDmeFe38APMmpjHbgHoYzUH+24IeO
	g+YHznoQcVjPTATRn8+dzqRrEFlJUutn6qXml/PAHxakEG590yR1vJIVHMT5T+HXVOwpqxT0b6m
	1QIoJjBW9CnbMKGW8CF1/9zEs3qpsp/oR1XF/oqikNw==
X-Gm-Gg: ATEYQzzzQH3tKS0dWAqMb4c/U8d1QB3SFHEicDdzZnCPCCU+2jaIPUUYqaPuHCIYWzR
	Q6CyHkql1TDfOHcVL0DZz9bK527zuuYIkz4h9vtcB51Ny7ZoUklRvqhqd/NVtiRao/TOOaPVabz
	nw8m5zngfQJjXVQ87EBmIljJdax3yzvFMI/cgAHr6TkWYIvZeWU97zDAMaJ5dfXtOsdjkAtDyzt
	fEtaZQfXeYkEvORz5oHsuxk7+CcRjy7oMaGUG/24bAKk6+57eJRi72d81Bpo3kPbnTiHN7wkCMR
	lw+lMa2V
X-Received: by 2002:a2e:720e:0:b0:38a:4de2:85f1 with SMTP id
 38308e7fff4ca-38bd58b92e0mr10200901fa.32.1773839232816; Wed, 18 Mar 2026
 06:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-bcm2835-power-timeout-v1-0-19db323c51f9@igalia.com>
 <20260317-bcm2835-power-timeout-v1-1-19db323c51f9@igalia.com>
 <c803299f-709b-4b57-b7fc-46ef3bb4c9ee@gmx.net> <5fe9332f-fbce-469e-8f19-dd3d7ef54c5f@igalia.com>
In-Reply-To: <5fe9332f-fbce-469e-8f19-dd3d7ef54c5f@igalia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Mar 2026 14:06:36 +0100
X-Gm-Features: AaiRm52m5cJvt4QR4VS4vXBV8Ahr79JL09AakQc1EBgijJMRaGkvQqTnXJFDsT8
Message-ID: <CAPDyKFoooZbU9W_Y1aSx+HuCfjHZGn9XR4_CB8YgDmCBWTB-Tg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: bcm: bcm2835-power: Increase ASB control timeout
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	kernel-dev@igalia.com, linux-pm@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_060716_225363_112ED21E 
X-CRM114-Status: GOOD (  29.02  )
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

On Wed, 18 Mar 2026 at 13:54, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> Hi Stefan,
>
> On 18/03/26 08:51, Stefan Wahren wrote:
> > Hi Ma=C3=ADra,
> >
> > Am 17.03.26 um 23:41 schrieb Ma=C3=ADra Canal:
> >> The bcm2835_asb_control() function uses a tight polling loop to wait
> >> for the ASB bridge to acknowledge a request. During intensive workload=
s,
> >> this handshake intermittently fails for V3D's master ASB on BCM2711,
> >> resulting in "Failed to disable ASB master for v3d" errors during
> >> runtime PM suspend. As a consequence, the failed power-off leaves V3D =
in
> >> a broken state, leading to bus faults or system hangs on later accesse=
s.
> >>
> >> As the timeout is insufficient in some scenarios, increase the polling
> >> timeout from 1us to 5us, which is still negligible in the context of a
> >> power domain transition. Also, replace the open-coded ktime_get_ns()/
> >> cpu_relax() polling loop with readl_poll_timeout_atomic().
> > personally I would have moved all readl_poll_timeout_atomic changes in
> > the second patch, to avoid possible conflicts in stable. But no strong
> > opinion about this.
> >
>
> TBH personally, I also agree. But, as I don't have a strong opinion
> about it, I prioritized addressing Ulf's feedback in the last version
> [1].

The first version of the patch moved the call to ktime_get_ns(), so I
thought we might as well use readl_poll_timeout_atomic() directly,
instead of fixing up the open-coded loop.

Kind regards
Uffe

>
> [1]
> https://lore.kernel.org/dri-devel/20260312-v3d-power-management-v7-0-9f00=
6a1d4c55@igalia.com/T/#mf96146960ec7ffeea32e732c95ccf9548af21748
>
> Best regards,
> - Ma=C3=ADra
>
> > Best regards
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power
> >> domains under a new binding.")
> >> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >> ---
> >>   drivers/pmdomain/bcm/bcm2835-power.c | 12 ++++--------
> >>   1 file changed, 4 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/
> >> bcm/bcm2835-power.c
> >> index
> >> 0450202bbee2513c9116a36abaa839b460550935..eee87a3005325848547ce1f5fd72=
9b168a641460 100644
> >> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> >> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> >> @@ -9,6 +9,7 @@
> >>   #include <linux/clk.h>
> >>   #include <linux/delay.h>
> >>   #include <linux/io.h>
> >> +#include <linux/iopoll.h>
> >>   #include <linux/mfd/bcm2835-pm.h>
> >>   #include <linux/module.h>
> >>   #include <linux/platform_device.h>
> >> @@ -153,7 +154,6 @@ struct bcm2835_power {
> >>   static int bcm2835_asb_control(struct bcm2835_power *power, u32 reg,
> >> bool enable)
> >>   {
> >>       void __iomem *base =3D power->asb;
> >> -    u64 start;
> >>       u32 val;
> >>       switch (reg) {
> >> @@ -166,8 +166,6 @@ static int bcm2835_asb_control(struct
> >> bcm2835_power *power, u32 reg, bool enable
> >>           break;
> >>       }
> >> -    start =3D ktime_get_ns();
> >> -
> >>       /* Enable the module's async AXI bridges. */
> >>       if (enable) {
> >>           val =3D readl(base + reg) & ~ASB_REQ_STOP;
> >> @@ -176,11 +174,9 @@ static int bcm2835_asb_control(struct
> >> bcm2835_power *power, u32 reg, bool enable
> >>       }
> >>       writel(PM_PASSWORD | val, base + reg);
> >> -    while (!!(readl(base + reg) & ASB_ACK) =3D=3D enable) {
> >> -        cpu_relax();
> >> -        if (ktime_get_ns() - start >=3D 1000)
> >> -            return -ETIMEDOUT;
> >> -    }
> >> +    if (readl_poll_timeout_atomic(base + reg, val,
> >> +                      !!(val & ASB_ACK) !=3D enable, 0, 5))
> >> +        return -ETIMEDOUT;
> >>       return 0;
> >>   }
> >>
> >
>

