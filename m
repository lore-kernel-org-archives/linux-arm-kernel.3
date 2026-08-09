Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654C2C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OHSD7QJMUDNSHM5CDmApr0cnz6TMTD5FOelv/tOIfYk=; b=atvJmoFFtccqSAVywPGoxWci3l
	d7alpx3UIiDVX/AxTBMpTCnixv1W0CZr8gSGjdxW/X/Cva2sr66ntje2jMaGKjKezPynsmXFe3Ug0
	YSv0n9Z8q9MdSlgCEl+YjaQuZv6gBNAK1Y4CQoORkLQBMduTHzDe5DC42HbOa9AaTH3ZiPGl1l2J/
	nNn8lW5Enb1KlMM2Nw49bWxdlIPJXGntjc59bWUATrES2AnjBUo13Il3LrHZuARfisWXADBP9xnuG
	1v/7CZxaZ6CrAi+kVJtsxHxswmOqZWc0b8FhyUAITkJPRm/Xy2atVyQ8aJO+mUODHPHiiS1ZEyLNs
	DXr9chIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0M0-0000000AAHn-3M0w;
	Sun, 09 Aug 2026 10:02:04 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt0Lw-0000000AAGv-3pZE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 10:02:02 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ce7d2adef4so12754195ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 03:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786269718; cv=none;
        d=google.com; s=arc-20260327;
        b=gPMoI59wai1zg203RoN9nvdH52dkfcOuCsdJtTeMLkBZVimRaoUZJ2jCPSNlAfTts2
         Jef1FxG7eFj8zxMULlJZ7BIF6cFTcCafcfXnHZ/LgrNShWH+/jdvoBl9GMOsIzbdXx+X
         cihjP0FXHW/79jahC+9+7RcstgAwfxOvfxwonxzz1paWi+1Da8HCITS456rISE/74emi
         eOrpc0h6JuV43vP0bM0s+jYD+MF3nG+H/A1/krtg0wTuapjy0fPE5sQmsRA5pdebeYta
         zDjmMotZgm/y33XOuRNI532N+sBVRwoQwA2B7e7C1Fh31BfviYiAcrBXRS/Nl9erDAcA
         +JwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OHSD7QJMUDNSHM5CDmApr0cnz6TMTD5FOelv/tOIfYk=;
        fh=bkMlml0sH3v1m67BWJFaEZmyDWmPlU7m5RBtOqOs5ko=;
        b=KmnNQRrYjrtkHsiWdq2OKd+L9zZFPTEvbca5yvKoRnSnCLY89RQyhbYHa47gYjjWCv
         TDrDp9MsM8wQY4f95yXk0CFR4oPFXqyaB3ohTo4H3DVoprsXOV8EY0nzbwpMipywhLvJ
         ZvjMUrsEJiPJ17f22GEmor6NR+0dVO9mZH0o1GsSeRYtxO291Vq1X4Ol2te+PwWnmG5E
         Dj/mVVoAQEkCUm3x50gwKAQR77MgZncX4pxJ+FQB81gzVt7iic5lhNiltkHNBTvSRZJI
         +XjPrW9WFXrE0IS4YoLwSWF/gjbaYanJgW/pDewdwvS/5Q3D7zan6fakNBbpHiuAEBwx
         HXpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786269718; x=1786874518; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHSD7QJMUDNSHM5CDmApr0cnz6TMTD5FOelv/tOIfYk=;
        b=USW8CBqvJtRCzFwbVNLpJDqHbfzlyT2SMx4Aof/sg7Qnc+1RaCWlBiJHL6u3e7WCid
         xCPtIe4pV274ydR1Uu4qRWi5eUpnTx0pIh54Xx98m6Dz1IsWMWfafXf+3sc+ATxF7vvn
         xoDZi72msi4kesK5Yqjn4bFnsBsDfoMRL2EHEgIqgemglCRhIa0xh+v2wk09m6aY+A6o
         zsPWMsv/Lg5Yeh0KlYpacfwa/ulUBNCnzFpQUYp65oDCiEtyllD2/jCzbLbyqvEVkt8L
         zxp2V8zkhyoXhopsRgQ/Vq8oVbx98mzdfXMln22y+oZ3+MKm4QSqyFufRtvaxPQHl9C0
         GSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786269718; x=1786874518;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OHSD7QJMUDNSHM5CDmApr0cnz6TMTD5FOelv/tOIfYk=;
        b=EXJrFKcpUL8yg7BHzVaCyJIPsP8AM8cK/uiOJCWBp2C+UoF5zed0hdgnrOCnWOnAQg
         Jb/HGk59Ejnsyy+DpLpjEsZ0WNuMhmbCL3FfkzEeRGliI0Iw6BLRWWVMHl8kUWbSla6W
         2xA+75HEu2+8OzBUVK82/c6WEtxKSABvl1b8mLZuF5awmqExCP3pywVtDURTs01C89ql
         Q+TMbtd+eWMBVCfjkymuaQ/vgAIkl2B5zNLNIWqQjbwItcWq7G2xBjPuGkaX2Pc+qqSt
         mqfqjUmpUY1vbIsEH2UQYF0xKS4Ea9X1UCqGChMZpUT9hGWYhhmReUUxCH7cKY1GqRxn
         uC3w==
X-Forwarded-Encrypted: i=1; AHgh+RrSNRd2n6ANr2/Y1ygBPTRRNawOX0Y/QKKu9TVyzf7lLzdF41N8gKycdLocUm7GCbnbnTmrdfJGvE00mRCn6bGd@lists.infradead.org
X-Gm-Message-State: AOJu0YyguOuY+0HWYF0QlUbDidse/kYkH69EwtJf9nWvoobZo1mq8hBR
	8KjMuRdou6E5s+R0+EfKTBtvtr8r0v5GjA372rfvB0YEjjpRTZe+pIsA4bLeBdAGZlN3rFzhOMd
	lqKRwW1ioV6d+izwPscaP+aXtve8ywXM=
X-Gm-Gg: AR+sD12kcKqcrbruPXNjIGBM67vvAXfQ0mnTeLe6j5P4jK2BZ/Ero5il4GMVIrYizQn
	Y1dGh4UaWH204C3LIcKyBCb+GzFKCrh3yYBN8k5fA5HfZtfoxFiadu1vK2SMJMDW4Q987RGB+ro
	ntYwVQL9JE+jEjAEr1zsYyzGCamtlNu3Is6fRjhbYPSvw+CeLYYl0cdEAGtB1VF96gwcr8tOjZu
	880GAK90kTHcpwpCgU+aX7THFdn0fPnvUytHkaTwDJY9OWL0qDyue4kzuIzfNMnxsAfHtezd2Jb
	NV8rRiCOVIwV/0Eh2VCCDF5zMfUcmeM/iTv3bbD2ifgwHs3sPYT0xOd1jtX19W+M1U0aol1V1UX
	h2IzBHwb/co4bU9yb/KbdVmLMZrjgyXZWzOQuxoxBzzxSJdyCB+/ntWDF8pVakBWkM2LCOcHLQr
	4vhuM1ydYoc7K4u9Lg
X-Received: by 2002:a17:903:388d:b0:2cf:84bb:1ebc with SMTP id
 d9443c01a7336-2d294c223bdmr207346785ad.15.1786269718053; Sun, 09 Aug 2026
 03:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <2eb8b31e-a3c6-4310-b9cc-7acd135b6c99@roeck-us.net>
 <CAABR9nHqKKbxkzBNkENadhFJgC_HuetV+ab7SVsGH+cwbF+OFw@mail.gmail.com> <9971b3aa-cb1f-44a9-9d58-4f75f0c6ccea@roeck-us.net>
In-Reply-To: <9971b3aa-cb1f-44a9-9d58-4f75f0c6ccea@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 9 Aug 2026 17:01:46 +0700
X-Gm-Features: AUfX_mw1KVezTWqN2z4u9TeLCw86vjeGY2Ka_ePvHYwoFPbvJwdHv2HuwDWFspk
Message-ID: <CAABR9nHu4pt-Rg8Aq0B6KfKFHX+C1xQmMk6=j8jq1Zn-MQ0p6Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] watchdog: qcom: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_030200_965492_8DC0E600 
X-CRM114-Status: GOOD (  13.53  )
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

Hi Guenter

Thank you for your review .

> >   irq = platform_get_irq_optional(pdev, 0);
> > +if (irq < 0 && irq != -ENXIO)
> > +        return irq;
>
> This is still wrong. If there is no pretimeout, it does not matter if there is an error.
>

If checking data->pretimeout is required here, I'd propose one of the
following approaches
let me know which one you'd prefer:

Option A (minimal diff, keep existing structure):
---------------
irq = platform_get_irq_optional(pdev, 0);
if (data->pretimeout && irq > 0) {
        ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
                                               "wdt_bark", &wdt->wdd);
        if (ret)
                return ret;

        wdt->wdd.info = &qcom_wdt_pt_info;
        wdt->wdd.pretimeout = 1;
} else {
        if (data->pretimeout && irq < 0 && irq != -ENXIO)
                return irq;

        wdt->wdd.info = &qcom_wdt_info;
}
------------------

Option B (check moved out, before the if/else):

------------------
irq = platform_get_irq_optional(pdev, 0);
if (data->pretimeout && irq < 0 && irq != -ENXIO)
        return irq;

if (data->pretimeout && irq > 0) {
        ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
                                               "wdt_bark", &wdt->wdd);
        if (ret)
                return ret;

        wdt->wdd.info = &qcom_wdt_pt_info;
        wdt->wdd.pretimeout = 1;
} else {
        wdt->wdd.info = &qcom_wdt_info;
}
----------------------

Option C (default-then-override, only look up the IRQ when pretimeout
is supported):

----------------------
wdt->wdd.info = &qcom_wdt_info;

if (data->pretimeout) {
        irq = platform_get_irq_optional(pdev, 0);
        if(irq < 0 && irq != -ENXIO)
                return irq;

        if (irq > 0){
                ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
                                                       "wdt_bark", &wdt->wdd);
                if(ret)
                        return ret;

                wdt->wdd.info= &qcom_wdt_pt_info;
                wdt->wdd.pretimeout = 1;
        }
}
-----------------------

Let me know which one you think fits best, or if you'd prefer something else.

Best regards,
Phuc

