Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA48D609AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 08:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOqsn9U9UwR9ECKJB886+Y24JEgcO/1OMJG6KFsH084=; b=I2ZSXSSdAKJhx1wJFiM7aQhw8t
	6F1hPrgVYGuaGS2MVXHYS4BoXZ7Tf7PQv8hBwN0a2+v+DgHPX4sCYHjjzZo+rxThuZxQiZ7M+3tW5
	LorXN1Dwg8niOCf3sBZbpFejWkkwynW1qcaIQIXIaS23n9WNSCmWxV7EyCdYeE3jLhBCFD1WT+Rct
	qF3IgAL7sfk0c6htRr9pVe/rUNDxAuiI3rtseVK07JI2wWRjFra+3d7+Y6Z4H3uV0sLmUwU8PZK8X
	zSIyWzDopA0/MRD2z5G2mxvns8Mn3CT5jZWrmClYPmvvKo/4z9lrt45+ueApzxHSn4cZOOpy/miAP
	//3h3B4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDNB-0000000CZGN-47iD;
	Wed, 27 Nov 2024 08:26:09 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDLY-0000000CZ1P-2umK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 08:24:29 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e38c1ac8e3cso504403276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 00:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732695867; x=1733300667; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lOqsn9U9UwR9ECKJB886+Y24JEgcO/1OMJG6KFsH084=;
        b=hCylf+Hbta2YP4AF33QLSpbLJ2KOWMJ05W0sqlHsS3vGREG5gtKmN2hKA3rn0CuTuu
         EPx3GShtzWF5kS2lDdbvtgVEWt/2tgwqQ6c+sm3+MqXrDqdMTmJrwsAHZ+LYT17QjAyj
         IJ7alJ+FLBNRB6XfvJO2hGy3IftgcIN5du9tLZiSTv2uuZ5uzPwn7f0KHWsRaqVpjTJr
         MbnS+nCnU8pMWyT+SsKeaYvmJtwmIvW7bTGm67rc/IVneJV598L7OG9T5a3Oljma5fXo
         cTibaMr6qL2Pe5PQSR9WWIe1a1SN97eeqztfKnTZmSZ3ld1J5yrisFIjj3nMVzouSpea
         1mmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732695867; x=1733300667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOqsn9U9UwR9ECKJB886+Y24JEgcO/1OMJG6KFsH084=;
        b=IBcXEnF0qC8h0Tjw6RYx/v6Vk47w0kyKMnB7fKyN3WFeacq3NfnvdPf0lBI+RRW8M3
         Kp5S7XXBQICJPIcmiGjDo6YpICfLNhddY+y84ziHdYvgQ+1QLqasUKgjcTY6Y/50HfyF
         Pc6NNIfDCP2K2Oytr946CBR/DDykaqapkO1N41X7uS8N7Rrm8w3RBwhdCH79P4/1Wl7b
         NfZKvxcrRa5vuWW+fWTuddAGFvjXfnwlSGwQEo22RwCLdm5IIsfjwdtpV9jgHGCj0eTX
         3/gH0g9bMAf4JdEhFQJyTPCw09By1GOnk+JG0fjRURf9Sz4cuXy8CjaSXGbKgsXDrlxy
         srxw==
X-Forwarded-Encrypted: i=1; AJvYcCUzP0KhbFnlzcfQ1jfKux2mfbUURPSgFHmyYJYGwqnxIAo2gmNJvGGPXJq6beOm7PKCMr/5G2Bfie9a0k9UJ1eC@lists.infradead.org
X-Gm-Message-State: AOJu0YyfQGoqFy1KQz+AqPAd7tXl9vCZpcKBfnfA1QQL6ISnTV0l2rSK
	vunmXr0Kw+r4GCIMrSFM4GMREpiHsRyC7GOTPxlCVdMVgKqTZN6Lq2/JdJfqiGsMxjGzL+mGOFG
	H4yPkznTqEygVtIPQ/sXUjYnbVjU=
X-Gm-Gg: ASbGncvJT/LbIt9N26d0Q3UZXX5qRowreghB8N/Eb+mN0JYa6QoPKASWCII2bfhheAG
	4thZkpx7r9j1YSOMbDRVtHJ6TGW5GPAxa
X-Google-Smtp-Source: AGHT+IE7WQ4zcWjkTsHj3YU6P5a3zfrxQl6S9zfO+CZjireFyD7ogJ24uCCbFBJtrFm5m1j/xcyE0rDoDRhRHJhalAM=
X-Received: by 2002:a05:6902:91e:b0:e35:ddad:5ab0 with SMTP id
 3f1490d57ef6-e395af12b3dmr1823834276.18.1732695867370; Wed, 27 Nov 2024
 00:24:27 -0800 (PST)
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
 <Z0aCSBNEAJlgNIAI@google.com>
In-Reply-To: <Z0aCSBNEAJlgNIAI@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 09:24:16 +0100
Message-ID: <CAMT+MTT0oiODONgEipLuAaZyzD-YyM8mbAcRsZKn8N4E326kMw@mail.gmail.com>
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_002428_736724_69AE17E4 
X-CRM114-Status: GOOD (  19.35  )
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

On Wed, 27 Nov 2024 at 03:22, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > +     u16 checksum;
>
> Does this need endianness annotation? It is being sent to the device...

Both host and device are always little endian, and this whole thing is
using a bespoke Apple protocol, so is unlikely to ever be seen on a BE
machine. But i am not opposed to adding endianness handling.

> > +             slot_valid = fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
> > +                          fingers[i].state == APPLE_Z2_TOUCH_MOVED;
> > +             input_mt_slot(z2->input_dev, slot);
> > +             input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid);
> > +             if (!slot_valid)
> > +                     continue;
>
> Shorter form:
>
>                 if (!input_mt_report_slot_state(...))
>                         continue;

Sorry, but i fail to see how that is shorter, i am setting the slot state to
slot_valid, which is being computed above, so, why not just reuse
that instead of fetching it from input's slot state?

> > +     ack_xfer.tx_buf = int_ack;
> > +     ack_xfer.rx_buf = ack_rsp;
>
> I think these buffers need to be DMA-safe.

Do they? Our spi controller is not capable of doing DMA (yet?)
and instead copies everything into a fifo. But even if it was capable,
wouldn't that be the controller driver's responsibility to dma-map them?

> > +             if (fw->size - fw_idx < 8) {
> > +                     dev_err(&z2->spidev->dev, "firmware malformed");
>
> Maybe check this before uploading half of it?

That would be an extra pass though the firmware file, and the device
is okay with getting reset after a partial firmware upload, there is no
onboard storage that can be corrupted, and we fully reset it on each
boot (or even more often) anyway.

> > +     error = apple_z2_boot(z2);
>
> Why can't we wait for the boot in probe()? We can mark the driver as
> preferring asynchronous probe to not delay the overall boot process.

A comment on previous version of this submission asked not to load
firmware in probe callback, since the fs may be unavailable at that point.

Ack on all other comments, will be fixed for v2.

