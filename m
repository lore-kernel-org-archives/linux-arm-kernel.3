Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A1FC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 04:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DL9zt+iaIT8X/6aHcZfiY4XxFYWf6572yFG/+Vl4euI=; b=s1PzhE26M2AOk5OWTTyH8kmWDd
	9MKktfLcnIoaBZux21mtQx4nM01VXc6AIbPyD8n2btUfXZ2kVbirW4gdtc5dmVDO1R1P0mlcBp1jY
	k5HosOWCjG4e7cQmPxDbNvFgAw/kjTNNR1PEItUmcaLU/zuu9zLGUVipGsSXXJt5Tax8RZT7RItu7
	oC/36+sLCHpVaPeNkaxOdG5ySVESJbiWSL/CP60DPln9NMmTZ/RrBMrRzpXpoEPngwyDLCVo8VN0f
	BZht0AjlKsnJPUkiW0VIVEiE5OroAkJadzWjdOl5miljMQXNK4aoKviLD6jBbNsB1gjOqwG27Srwp
	BQXIQjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsCeC-000000076VU-0fnu;
	Fri, 07 Aug 2026 04:57:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsCe9-000000076V3-2GQQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 04:57:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ceb096e675so36265525ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 21:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786078648; cv=none;
        d=google.com; s=arc-20260327;
        b=merYbwk6tS2nbaZYl8VyyArLJRdtZoHi33xJ+sOCXW9HJ/hNW3c0cQxrNiWeVYit2C
         q6JIY5FWO0XjBL1eu6Ox6RcLtYbLF3LaC0pXeBijTfeTGPlUY457JQj7UciJISa/fe9X
         HlLcaOQUvpVdVVrMd69P1MAKMHqXKqzdGr8UDFVtXEF6UAHvbnp1JtpuUq59Mj3D+PgC
         OH3+lTU5LDXzgzGrnkL36oeD67szAqYKM7ChuJJxpc3n6x1SPXEQB8g8E7ezMCM950rP
         KeqZcW864Tq6CG1NRxnlYmGfrUbgmS4Bce75pXv352EmtO6KrKc8AwNsoKl22H4QWpjz
         MOfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DL9zt+iaIT8X/6aHcZfiY4XxFYWf6572yFG/+Vl4euI=;
        fh=tasclxlsWTkSqoR2iclDTYZDAAWLrg6GSm68UPC25Zc=;
        b=ftF9nVDkX8zfJ9Z69e1oFn6GRGFtcYEvGSkUnjaTlP/3+OwhCS/wDIj63QIf+o8nFG
         BqenbYsLoj5NFOsw0XQgvbUOeZNNhMZcQm/42SWjv2NEhG1RSjgMgeahMNFhauwU1fjw
         PoawAlX5zne8xB9LUpEyVrasYuzSJJduVUdHzKHisZXshYLKeU/T+GJ5gN2tSX8syQrI
         SKPaHBg4g7Z6SYKiEQ/eDs2Z/uhjdEPe8lR1WouiBg8aFE3f/n8z/rvG5xfwXx8w1/bX
         1vpjgW1OjcVn6cKAypg98Aun9xhyF9dcl4Mzj61tFHfw/nr9Db12I4oIwOpA5W7C0ikm
         cMow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786078648; x=1786683448; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DL9zt+iaIT8X/6aHcZfiY4XxFYWf6572yFG/+Vl4euI=;
        b=ACbnP36U394FfMMGEJLc8syDpklC+PIteXuNvT1T2o+LmA3WjMzgSpqEdWraHnrHm0
         zVg4G69eor6zkTuF10C06Rjou0D6FcUUW2MejrxxIbRzrCZ1pBkLHCu8WQaZMQIAqJ3y
         sxgPEQ7p7jpsgFYHH6/9ne/sGKTW4uRDzQmmNB0YK2kGUxOeVIjzeupFCuPlXKMXIuau
         /xZyiPrBzB6thVolCZ7vja0Bh3GC/aNcC8DAu84FhdBuQin3/a/8phvoRrIS5BdPtFx+
         nxdfb8ksVH1MMsGaq2dghozfvOaGPJsGCFfzBaV8i7AmXWiDKezpVy3YvrpPAShMr/yn
         l1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786078648; x=1786683448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DL9zt+iaIT8X/6aHcZfiY4XxFYWf6572yFG/+Vl4euI=;
        b=QduBMzl7g276c0e1VDms9T3ptRIpWTmQ35p0EaHas+k+FJSlZwogcRyCyEqNjwgF+K
         MLHwfprA/Iz5DTU0+mAm6K5CFhVX4qPp5b7GjjMdg2Xj3nUtduMxmAkvJPMSFXeDAqhD
         abqHZCCrd02JVUYEnznAZ2vCGCs2OiVOMOogncX1lM/bYPbzBOpbzAsDym8IhDszEw9F
         lbpk3v5+GNR1I0GRRq+oFF4snu3Th8RFjKinAxno/nlPp1o5UmpADGCoqJIJVp/iHaoS
         aDk2aH54cXKPMB8w5LA6m8V59NKSIsw8bYzStg7sALIyHx1LHQ3hlV0XRePP9PS0jG1Q
         KtFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7ThXa0WjmhxPt0QFy3zyBDWS/AK6K/u+/kVhnP+Cp4UO4Q2qqPVvOOablNVTrHs4rN7prw4fbf9v1YrSWRLjd@lists.infradead.org
X-Gm-Message-State: AOJu0YyeJIxEqocN8RRDqUbK7Gh97bq/ACi/1LrjhuMxERLT7XMdKkcj
	rH3LwmFl7agroUObY14OCR4ZZFMeB4OfRqREEe6hn0RwhqxDr8PAFw2AbNzhducDVRBynl/VMVb
	p/6oVpN/PafHyLon/Or0z2WPHS5Owa94=
X-Gm-Gg: AR+sD11/PvFOIRoJWvs8zT6/a7B7OJ6wwR0NOzWjcTIlcL0k7TMQZbspkJ5DXidN3Yf
	me8b5qZz/00vHldbGo6eGWVTCjLCVov82Prr0CXGPHtDuNn7aaoXkhyfIc7FRQm/FFO04pwR2ya
	cp0LdxNmzytEYUa6fE4ZzN9cqiKje8ValtijrsyLqv/TpcK9UArK/k0SQLcLgZtJGJUfRxITNl4
	B8JmUOhP7PbAH6TZdXhryg9U2kHjgRpkjj6PPs8zJvaMIqKmZwDxGLtrNG+pTRJd62ZSzpcItRH
	HegAat5VkGosEGvXNCJfCyPO7ht7Cg68gcj6OYs0BQkPIM0Co3YZTF+JTH/WJz0NQRxRi9+Lffx
	WKoqKv1xynLH5hsRd9jcPcACsuXRJE+DW501zMhAGQISRyH0arV7QxYAj
X-Received: by 2002:a17:903:1b70:b0:2d0:cc92:f7c2 with SMTP id
 d9443c01a7336-2d0cc930325mr247857335ad.1.1786078648456; Thu, 06 Aug 2026
 21:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260806065254.28204-1-phucduc.bui@gmail.com> <2026080623-repressed-griminess-e3fe@gregkh>
In-Reply-To: <2026080623-repressed-griminess-e3fe@gregkh>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 7 Aug 2026 11:57:17 +0700
X-Gm-Features: AUfX_mwRnOY7VUq-ck_xwOmg8y-ARldqTcX5XmuIOCDKQs-VxTrkOjINteaUTxY
Message-ID: <CAABR9nEfPqXAt8wDo597qDS3b3KMaHeF6-swAFg9RLanapDnBQ@mail.gmail.com>
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: Propagate -EPROBE_DEFER from
 IRQ lookup
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_215729_585173_52C6E493 
X-CRM114-Status: GOOD (  16.08  )
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

Hi Greg,

Thank you for your feedback.

> > From: bui duc phuc <phucduc.bui@gmail.com>
>
> All lower case?
>

Yes, I=E2=80=99ll keep it lowercase.

> > Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
> > re-probed when the interrupt resource becomes available instead of
> > continuing probe without an IRQ.
>
> How was this found and tested?
>

I found this during code inspection while cleaning up probe functions in
the Rockchip ASoC drivers.

https://lore.kernel.org/all/20260806052136.21034-1-phucduc.bui@gmail.com/

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure, including -EPROBE_DEFER. The driver
handled positive IRQ numbers but ignored -EPROBE_DEFER, continuing
probe without an IRQ instead of deferring.

I only compile-tested the change. I don't have the hardware to test this
path at runtime.

While reviewing this,I noticed that -EINVAL also deserves to be returned,
not just -EPROBE_DEFER only -ENXIO really means "no IRQ".
I=E2=80=99ll update this to:

if (data->wakeup_irq < 0 && data->wakeup_irq !=3D -ENXIO) {
        ret =3D data->wakeup_irq;
        goto err_clk;
}

I also found another issue in the same area:

        if (data->wakeup_irq > 0) {
                irq_name =3D devm_kasprintf(dev, GFP_KERNEL,
"%s:wakeup", pdata.name);
                if (!irq_name) {
-                       dev_err_probe(dev, -ENOMEM, "failed to create
irq_name\n");
+                       ret =3D dev_err_probe(dev, -ENOMEM, "failed to
create irq_name\n");
                        goto err_clk;
                }


the error return from dev_err_probe() was not assigned to ret,  so the
error path could still return 0.
I=E2=80=99ll send v2 soon.

Best regards,
Phuc

