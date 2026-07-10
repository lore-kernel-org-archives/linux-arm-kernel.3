Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3DCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Xm+71vhVvB2sUAuzgpV4v4ZXbW+TKZaCwA7h4T8wfQ=; b=B5J84lizRPBKx3lh+3GBqmRwd5
	PE7Z0MXJzEIH9LAYp+SAEmKxG1N9qa1AelKCSQqrrVQxI8ZE00iXZnD345ukDp0K9YvbyOm62VCrd
	jnMKGVP4HIcKV83gfNTU4EoVRNoZNBvdJkp7bWJJGmhuIibcUOdSW43MbbMR9+VrW3jdVrDhDoiQd
	V3abIDwkKwZwP5TVZxJPoqDxKw6IngR7WeoEHLO1FlfdjziTlQEmV2BUKeKzc/fRjB6kJu4KsmS3i
	OpMtvr5zLNmLKfbh+opD4l1ZIKLW4hMyIHbCbpA5+fDt268ToNB08FNw5CXFizCAib83yISaonD5Q
	94C6mi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6R3-00000004RYo-0AIT;
	Fri, 10 Jul 2026 08:18:13 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6R0-00000004RXX-13ds
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:18:11 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-382ef647e20so798727a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 01:18:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783671489; cv=none;
        d=google.com; s=arc-20260327;
        b=dzWj5FTaoqWnbU3ur3cDtVlwuQFt9t28cCxmy4RnbnEqKMzZwMXsBm94Q5/LPXLY8s
         yGLc6f9HIsJ7kAxJAH6lwEUIibhPEmF5BBohUwE7RodSHesNbZoGFoX7MEnj0yrOK3SF
         nB+dlzEunzzv/ApvLxoyrFZ1ipZS2pEidaZ50Ip8FK3uQM6kwV0c3O01D2GxWbvh0cng
         kGlG2k7XbLHgn4DAzOFWsiihh14Tf4z7b50og1kbtWIz466YGscQtoBbHLhBlT5rV6qI
         Tov7zsg0fSexCWOpvSzGZtiRiV+k0QeA5TweIAY+0W4bCG6U2lXQ3H5gLUYngwp2+gFb
         717A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Xm+71vhVvB2sUAuzgpV4v4ZXbW+TKZaCwA7h4T8wfQ=;
        fh=XaxOnbCznotuvWTUwJQBPNpAAYDiCDTKeYRX5Lm3wwE=;
        b=JcW4piIMP6V4Q0R7ALzqbnKy7eTO3BAK7CB3MiLvvsNoISKvRYm3pw626cAGboOTny
         MgXbXQkumZZqM370HkEDI2bLIPxhvRxnlszaPF4my7WtbsBTXn517gDbI9iWUE2Bafab
         P7AzV+sbkmie8/xkDxh1zD5V8WED4xHhR9SlZ/QA5KdjJDn5DYWPLlyLK5YWpACcYx49
         aNz120R38b9QL8MSQG8J6Ofar65Wx6wwSGlAiiXTtd8I8rpyKdtukiuOJaYohzCjPJEh
         oemrbnvsyfY5P7qsurM9zTRzMZ8SgwfnYJObNLoLtDcyOQ+P0g5iynS0jskXusvb6njb
         h9Tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783671489; x=1784276289; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Xm+71vhVvB2sUAuzgpV4v4ZXbW+TKZaCwA7h4T8wfQ=;
        b=TQvW+1klqTfTnLH2+dtS0jXq2a5Eby4Dya8IjpiwMW86vNK+rUoZujgUhJikWnbFBj
         eByaIr38eC1IoNSn9vO7gvnwExzaKS9yFrGb6EWcAv9zy3s8ABHFMlo8otzYuSJ32bpX
         S4XCW9gkNkFBhN5aztcYguS87P9RhcOUvn/+CfidPFvIGkniAc6BMUrvLpZ/a9G6ry/l
         HtxY2CXVG8/tMqmmf8wYuDv12Av8isDa0g6r9O5BSM44rC+mDoS47Hu/I/juy1b9rlnr
         7+14FicahWA2NAmjRJP/WCwknL9qui4eG6XJ4WTUAnx4865u7nnQDLefjMIvUL50XDKh
         weRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783671489; x=1784276289;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Xm+71vhVvB2sUAuzgpV4v4ZXbW+TKZaCwA7h4T8wfQ=;
        b=YIH66mLNqVyDkpsypymI6Kub8uvCZXVzU22+2m95IZmLrNdOFURuSYc3MDZFp1MtG0
         CYUpfNkPof/zFXrZxlV3cUEUctSYlv8raHCPYO4TjYaQV6BDxjgjXwMImV6+DaaNNjQH
         SLH9D51Pw1Njo7BKcaLKbimPbLWsHZHk2RZcxf64Wu3/BYjYKVEm8eJQS4KjzqEHN+Ro
         UqcwTBN1vAnARztRbqHagWHJjkUHZGA1H5o8GPgl+oRnJHAnLuwWPwhG9K3bE5tl8BOC
         Q+678nVUsYQLqrFHMyEjQzWrdy6IIE7btIfmw2dy1nCB5AhkSkpSw1PthVUO7Vi5j1/L
         Xq3w==
X-Forwarded-Encrypted: i=1; AHgh+RrASbChbI13Vrx16Ry8JkcdA0sE3+Xvu8hKgZKiVCqB6pf0Ls+imznIHk4Rl1sUl+PUAALAfu5+sgNiTpuZPmYs@lists.infradead.org
X-Gm-Message-State: AOJu0YyVVB4nKJO2P3xdy/AcGIfq+3SVZISoH/ofVW+1CkxzLhdENSkz
	K7qdvKXRJ2QpK3PwG6jkoJCrK7bzBWULwjOYWN4YFIW56azNa/Y48NOeMkdudQlOR7QE6WkEyes
	fvvUEDfJJkdnxqypO7USDIWS97ud9ZVc=
X-Gm-Gg: AfdE7cllHju0KvpnsfNgwH48ylGF/718p7xUvhyWWCyjENZ8QP1B32pD9UesXIj7a8I
	j46DeozZxpoMuIlKxosYxM5HPTcB4CrIp8fhjpJ/X1LRplZFqh8ovzTxml918KGPW8gxi8LoR3n
	lC15rZoLzXUfFLZ8PWIr12gMhWiAJRp4holQ6c9TuD1rnU+xxdWC0mzpWXvTfA1G+ZUAsX0vTJC
	hzjB0AKjguSBUveShtiDZHNhEgAVaQFty5Toh5NQzOIAl6HFEbz0RPBqPqhQ1lJBsDGu4GqyMXc
	xQsoDLpANIU2Z3ZiO6H4dGhE0O0=
X-Received: by 2002:a17:90b:2f06:b0:37f:bfa2:1887 with SMTP id
 98e67ed59e1d1-38941101e2emr10680019a91.8.1783671489057; Fri, 10 Jul 2026
 01:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260710050223.14266-1-phucduc.bui@gmail.com> <20260710050223.14266-3-phucduc.bui@gmail.com>
 <a84c3eb1-7ac5-44a8-95cb-e33175e78ee9@amd.com>
In-Reply-To: <a84c3eb1-7ac5-44a8-95cb-e33175e78ee9@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 10 Jul 2026 15:17:57 +0700
X-Gm-Features: AVVi8Cexjb8IlpQOnKY8Iz8sH6znwFCqGvvu16EY1ysnfcqVV4Wi_i8aRfmJTkA
Message-ID: <CAABR9nFFMMk6i_sjKGjt4t-_QZF_hu2gBPRNK8c-GfhyKdVP8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and
 drop redundant error handling
To: Michal Simek <michal.simek@amd.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_011810_292788_54FFB4D3 
X-CRM114-Status: GOOD (  24.33  )
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

Hi Michal,

Thank you for your review !

> > +     if (IS_ERR(ctx->axi_clk))
> > +             return dev_err_probe(dev, PTR_ERR(ctx->axi_clk), "failed to get s_axi_aclk\n");
>
> This is pretty long line. Message should go on the next line.
>

The line is still within the 100-character limit.
I'll split the message onto the next line in the next version.

> > @@ -274,29 +270,23 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
> >               ret = devm_request_irq(dev, ret,
> >                                      xlnx_spdifrx_irq_handler,
> >                                      0, "XLNX_SPDIF_RX", ctx);
> > -             if (ret) {
> > -                     dev_err(dev, "spdif rx irq request failed\n");
> > -                     return -ENODEV;
> > -             }
> > +             if (ret)
> > +                     return ret;
>
> Here you are changing error value and commit message is not saying anything
> about it.
>

Oh, sorry. I should have explained this in the commit message.
devm_request_irq() can return various error codes, such as -EINVAL, -ENOTCONN,
-ENOMEM, -ENOSYS, and -EBUSY. The existing code overwrites all of them with
-ENODEV, which does not reflect the actual failure.
I'll update the commit message to explain this change, and add a
Fixes: tag if appropriate.

> >       ret = devm_snd_soc_register_component(dev, &xlnx_spdif_component,
> >                                             dai_drv, 1);
> > -     if (ret) {
> > -             dev_err(dev, "SPDIF component registration failed\n");
> > +     if (ret)
> >               return ret;
> > -     }
>
> And this is another case. Where origin code didn't return any error which was
> wrong. That's also not described in commit message and likely this should have
> Fixed tag.
>

Sorry, I don't think I fully understand your point.
The original code already returns the error from
devm_snd_soc_register_component():

ret = devm_snd_soc_register_component(dev, &xlnx_spdif_component,
                                                                    dai_drv, 1);
if (ret) {
dev_err(dev, "SPDIF component registration failed\n");
return ret;
}

writel(XSPDIF_SOFT_RESET_VALUE, ctx->base + XSPDIF_SOFT_RESET_REG);
dev_info(dev, "%s DAI registered\n", dai_drv->name);

return 0;

As I understand it, this patch only removes the redundant dev_err()
call and still returns
the same error code.
Could you please clarify what you mean by "the original code didn't
return any error"?

Best regards,
Phuc

