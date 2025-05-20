Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBFDC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybC/xEWalGJ0RhCZjvyrvjbHro7QE2FQq7vzTeEzDcM=; b=nUnj940IbVSGxbku8fODV0H1of
	3Es/Qt7OGBMpCmx4f9s1x0XZ7eN45f+gCzCHyaOiIBcc599aZq39RHEuTl9E3oXEaAe+nCAOe9iPg
	VEhHyUG8gIvFcgNN69YE0NR1TpfC10Z7C593vtgmXgUv4M/VOttTxOPoAkbdRr5yoRIhzEJc7lyxZ
	K00+9Hdqw+I8ySpNnqrgtQbC76hjB4yRteMRIcbMTlCZsgvHO1VyX5hSg8z3iSprMS4BGXfcpvGXa
	z+fwMPt5tIp1PAy+Hc7ZLXa+bOX+zUQLODyu+uzbNiQ1c8WyIrSWIPbU2H7qx2Z3rXgPDyh+i305y
	HYOEkvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPkg-0000000DWkI-2lE3;
	Tue, 20 May 2025 16:23:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPUh-0000000DSG1-1VE6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 16:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747757224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ybC/xEWalGJ0RhCZjvyrvjbHro7QE2FQq7vzTeEzDcM=;
	b=UQbBYW2u/4yIQco5/AwfaZxL/4BGmOJlklfWyS2ORduuCa63/Zr0t3pvlDiCQl4vITwHUW
	+tdYVpRpioygrcrEwv0GsHTX5lP/I7XnlOEiUC8kK5vkPrZDv1Qa1BCHeAfKgA9594vL/C
	uYmqn/jxvcWorHmbCiuvqarLBG7gXNE=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-ZviBykU5Mg-5AlxVLE7wlw-1; Tue, 20 May 2025 12:07:03 -0400
X-MC-Unique: ZviBykU5Mg-5AlxVLE7wlw-1
X-Mimecast-MFC-AGG-ID: ZviBykU5Mg-5AlxVLE7wlw_1747757222
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-72b87bd96a9so2818914a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 09:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757222; x=1748362022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybC/xEWalGJ0RhCZjvyrvjbHro7QE2FQq7vzTeEzDcM=;
        b=ckpBcfGVfvPJeHqYJaMWIyj+6FP7hzPCuuwlXHMr3BkmmQXD01nfJM7Ps1rC1LGwzI
         JTm8M6BvYFtT4cJeivhf34553Ec+E8mQ1JAUWtuwWFrIoxVSVnbPsiQMn7aPo9iTTReC
         ZxBczSKhAQFbBiPmTSPjcWPgrU5GZ8sjRW+zmL3mw8iZ79evFr8v++JC6w0jYqzK3Sez
         SLMt7HfW3qADx0yKjLe7l9KUTyulytAGmxvIbAvnXXwDYmKWjFpa3mo2Fvd5X5rvv7sz
         rtH8/7up2tirZExylA18TQ/KSY99Cvn2B+Bsgg21Gwf4HJZiIabn7vee56tpeLAEG7rp
         x+qg==
X-Forwarded-Encrypted: i=1; AJvYcCWG4FuNNGkuEfVxKuH+NNpucbQcNq4kJOaQjwup52h4csHZkxxHPdKLrpAMdYZQDP2a5U72F7WjtRjaGPVLGD13@lists.infradead.org
X-Gm-Message-State: AOJu0YzbiBTjjtQwcIIHlHo4XxIfwxDPdzBcxeiSUIaTx4PZ+zf3LZvX
	yF/DNYZOlMpjC6wfVfeQtS1TQ4Bzc0TK80kLeEKpxskPEtX1CtWJJCYAsppN3OSe2ZESHkZDTMh
	AGLVmjMv4Ys4C8NuSXuZNwvT2gV7k2VA50AQ6ke5r1KmU9vjWP36of5hn5SBcRwFVn+vGuwsMbS
	UUN4Vtj8FHThOxsW+DN/TKqoETt+UtW9NIfdCB43P1OIg/6yxCbfw=
X-Gm-Gg: ASbGncta6Sm5ZYyJBloaLxj/Z+Y1QrbJBx0AD2umwSZBf1sx3RzTP5wGt0p+6rrFvwx
	H8c9lQxrrP2fsFkU2FjvWdFWIP8cVUSZ7obUrKTNRs0ILAMik9drnw7D+oYBs92ScqDs=
X-Received: by 2002:a05:6830:658c:b0:727:372e:600e with SMTP id 46e09a7af769-734f6b1a0cdmr10030124a34.14.1747757222613;
        Tue, 20 May 2025 09:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1ly9i72+pYbDKe5Sks+06FCcNtf9xBC0iJ/paWfH1AFYyUe0Qn2IrAf+QY1o3hDZlmKZQmCGNGBhAxWj1dLY=
X-Received: by 2002:a05:6830:658c:b0:727:372e:600e with SMTP id
 46e09a7af769-734f6b1a0cdmr10030067a34.14.1747757222132; Tue, 20 May 2025
 09:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250514134630.137621-1-sgarzare@redhat.com> <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org>
In-Reply-To: <aCVHQ-LRqHeEVEAW@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 20 May 2025 18:06:50 +0200
X-Gm-Features: AX0GCFsTmlbq93tR0wE4C3RUpx9Z1D4kjkNOv4wLeycQRtYZ5zeOxDpm0iB8eVA
Message-ID: <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jens Wiklander <jens.wiklander@linaro.org>, linux-integrity@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Sumit Garg <sumit.garg@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dNwspijT-CBCfRIJZ-xzF0TRoKtZEU2Ghxv0C4e79Mc_1747757222
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_090707_470679_B3AE8E94 
X-CRM114-Status: GOOD (  34.84  )
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

On Thu, 15 May 2025 at 03:45, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Wed, May 14, 2025 at 03:46:30PM +0200, Stefano Garzarella wrote:
> > From: Stefano Garzarella <sgarzare@redhat.com>
> >
> > This driver does not support interrupts, and receiving the response is
> > synchronous with sending the command.
> >
> > Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
> > ->send() already fills the provided buffer with a response, and ->recv()
> > is not implemented.
> >
> > Keep using the same pre-allocated buffer to avoid having to allocate
> > it for each command. We need the buffer to have the header required by
> > the SVSM protocol and the command contiguous in memory.
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> > v5:
> > - changed order and parameter names to match tpm_try_transmit() [Jarkko]
> > v4:
> > - reworked commit description [Jarkko]
> > ---
> >  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
> >  1 file changed, 11 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
> > index 0847cbf450b4..f5ba0f64850b 100644
> > --- a/drivers/char/tpm/tpm_svsm.c
> > +++ b/drivers/char/tpm/tpm_svsm.c
> > @@ -26,37 +26,31 @@ struct tpm_svsm_priv {
> >  };
> >
> >  static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
> > -                      size_t len)
> > +                      size_t cmd_len)
> >  {
> >       struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> >       int ret;
> >
> > -     ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
> > +     ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
> >       if (ret)
> >               return ret;
> >
> >       /*
> >        * The SVSM call uses the same buffer for the command and for the
> > -      * response, so after this call, the buffer will contain the response
> > -      * that can be used by .recv() op.
> > +      * response, so after this call, the buffer will contain the response.
> > +      *
> > +      * Note: we have to use an internal buffer because the device in SVSM
> > +      * expects the svsm_vtpm header + data to be physically contiguous.
> >        */
> > -     return snp_svsm_vtpm_send_command(priv->buffer);
> > -}
> > -
> > -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
> > -{
> > -     struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
> > +     ret = snp_svsm_vtpm_send_command(priv->buffer);
> > +     if (ret)
> > +             return ret;
> >
> > -     /*
> > -      * The internal buffer contains the response after we send the command
> > -      * to SVSM.
> > -      */
> > -     return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
> > +     return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
> >  }
> >
> >  static struct tpm_class_ops tpm_chip_ops = {
> >       .flags = TPM_OPS_AUTO_STARTUP,
> > -     .recv = tpm_svsm_recv,
> >       .send = tpm_svsm_send,
> >  };
> >
> > @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
> >
> >       dev_set_drvdata(&chip->dev, priv);
> >
> > +     chip->flags |= TPM_CHIP_FLAG_SYNC;
> >       err = tpm2_probe(chip);
> >       if (err)
> >               return err;
> > --
> > 2.49.0
> >
> >
>
> I can pick this for 6.16.

Great, thanks!

Stefano


