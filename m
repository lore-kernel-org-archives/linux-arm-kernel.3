Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CC1D6D233
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 20:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JnlDLsmM5qv+EK/8poCXPvkvDh4sjlL4kNug7GuHXU=; b=etyfsgT1lx4smrSAgE2lG1+x+E
	afrBOQ/RMobsnRPLQE94UWMiTaEtkWy9UUiRuYktsk3gYXXB8bLROibOLqgR6+Wa8PkhOuvLVezu0
	dupvN8ywNb2b+KOdULGCr+b798jhYTe+IxHhSRBmKlwVaHX3zaiPEgiMAYobXxXdL89P8OBBTkSoX
	3+Fk5EaPFs1E8okPafp6Spumo7ArJq9xjEPRr4JDVtBZIkIPoaQ/9XPkjaiupYW+kubBuSgsKbwNt
	pzyqDbyt1fgOSVM9N8M3yrOelU53VsNCIAnWkyfhoqrYADuW412QYkm6agDVP3MfbJArWOH5DYPZR
	UGbwVoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGOEb-0000000E0Ii-1LlG;
	Wed, 27 Nov 2024 20:02:01 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGOCh-0000000DzkK-2TVg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 20:00:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-214f6ed9f17so698685ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 12:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732737602; x=1733342402; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7JnlDLsmM5qv+EK/8poCXPvkvDh4sjlL4kNug7GuHXU=;
        b=frwZtCqoimlPygWLChwrcRm/sdHmNDjVzW5mnAB5uGiqI688HKILHeelGwd4nmYF/Y
         SNA2vsO2I7sMcqB4flkEPbza5XuMXnGt+U3rIiURq2xEt2zAicCe+KuqO8PzbyD8Two6
         XXBP+S1wrV7boBqZJh8Sy1asnRX4MU5PCWXBayHzRTfmKX4McZroGida/WQXo3E757UQ
         agJ+pUJxXXQNEa757dq+935dWLrVo09je3qcqaO+0xjVEcqVF9mGwbrdqtLe0BN2VMty
         sYI7b7dQCjCYiuNMCPWYcAbDyHpuPh04TmWzH86uBFeEwL5yTF3G13FJbWZfsvnbI/Sc
         wPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732737602; x=1733342402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7JnlDLsmM5qv+EK/8poCXPvkvDh4sjlL4kNug7GuHXU=;
        b=pQwO8PhV4pgmZczOPIBbJAe1fzUudOtz2pjv1Bq/04aE2lBi51baQI/CynJKHhOJb+
         0zedK0Kge5ZS7vGfa19BwFxlB7eh+R8QESa/GG0xcxwAxkwOBzuEClwoIyTq+gjKLbqg
         +EnZQnBZDhtdezXArYOIBkXhB4gq76/P6BiXjdEw14u/tsIQ/YwXCYKi8Md3nLlzkPpG
         4xgX5Y8tWDKFbFIUmJN/W9+n1j1hZ75nZRi20BnwhkyJqNGGWPdw9hVxrrWLrQH+dnwH
         kr066q7D3+/T1qIQhUBOs9tSmjn9p743t368XFpN3Qt6Omiq2UoE5E9QLu/sHZ1Mm7pt
         4+BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIMC+tE4LWYbPpFlX60GMw4LdABiVejYddGsGUwIkyujPUYyKKMOqaVqDdWNnvVO1Gb9z6d4E2xt12ltFFTH1l@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7TbBTZi16X/nbvBrdb9wrthlC5QuaiJYQV+bpgfdfXGKzjQY/
	tV6TIc+CXlMyPrhSY1M567YIi5ggPA+0eLkSSCUGle6pZJ3QevTs9GpWQQ==
X-Gm-Gg: ASbGnctMf+XUv7XwY/HQ1sQfPZk3wsVZq2hYET9oBoA+ePhYCnmF1aWl1NWZmVFUcW4
	oeJNZqzA2p0zl3v+XIgEULVg6ZvduauCT3dnmE+qrltl9abYjkc0+OAIl7zptFxHDTGPv9bHNOo
	8Yk/9U2M6jTV6FY8qp/gUPopDwkMQNck6V0fRcPNxlJHnoHAWU33D5vaDRPg2lP278fAebk2s3W
	GrPPOtGokPk5aeYor7cUsryHLH4vFA+YT0esWz/0x8TxwnwJuw=
X-Google-Smtp-Source: AGHT+IEGL7M9GjZwTDz8gnOB4Fc/ReaRn8//tUsUDCeh7CYPkfHbRbhoJ/aTMpOuF0TfqhinENoEIA==
X-Received: by 2002:a17:902:e752:b0:212:4739:27b2 with SMTP id d9443c01a7336-215010861afmr48871945ad.5.1732737602170;
        Wed, 27 Nov 2024 12:00:02 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:d991:bacb:df39:9ecd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc23a35sm107317255ad.250.2024.11.27.12.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 12:00:01 -0800 (PST)
Date: Wed, 27 Nov 2024 11:59:58 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <Z0d6Psrk5f8-hXe6@google.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
 <Z0aCSBNEAJlgNIAI@google.com>
 <CAMT+MTT0oiODONgEipLuAaZyzD-YyM8mbAcRsZKn8N4E326kMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTT0oiODONgEipLuAaZyzD-YyM8mbAcRsZKn8N4E326kMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_120003_632192_35C5653E 
X-CRM114-Status: GOOD (  30.94  )
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

On Wed, Nov 27, 2024 at 09:24:16AM +0100, Sasha Finkelstein wrote:
> On Wed, 27 Nov 2024 at 03:22, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > > +     u16 checksum;
> >
> > Does this need endianness annotation? It is being sent to the device...
> 
> Both host and device are always little endian, and this whole thing is
> using a bespoke Apple protocol, so is unlikely to ever be seen on a BE
> machine. But i am not opposed to adding endianness handling.

In this case the endianness handling will be "free", but will still show
good code hygiene.

> 
> > > +             slot_valid = fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
> > > +                          fingers[i].state == APPLE_Z2_TOUCH_MOVED;
> > > +             input_mt_slot(z2->input_dev, slot);
> > > +             input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER, slot_valid);
> > > +             if (!slot_valid)
> > > +                     continue;
> >
> > Shorter form:
> >
> >                 if (!input_mt_report_slot_state(...))
> >                         continue;
> 
> Sorry, but i fail to see how that is shorter, i am setting the slot state to
> slot_valid, which is being computed above, so, why not just reuse
> that instead of fetching it from input's slot state?

You are not fetching anything, input_mt_report_slot_state() simply
returns "true" for active slots. You are saving a line. You can also do

		if (!input_mt_report_slot_state(z2->input_dev, MT_TOOL_FINGER,
					fingers[i].state == APPLE_Z2_TOUCH_STARTED ||
					fingers[i].state == APPLE_Z2_TOUCH_MOVED))
			continue;

> 
> > > +     ack_xfer.tx_buf = int_ack;
> > > +     ack_xfer.rx_buf = ack_rsp;
> >
> > I think these buffers need to be DMA-safe.
> 
> Do they? Our spi controller is not capable of doing DMA (yet?)
> and instead copies everything into a fifo. But even if it was capable,
> wouldn't that be the controller driver's responsibility to dma-map them?

Yes, they do. From include/linux/spi/spi.h:

/**
 * struct spi_transfer - a read/write buffer pair
 * @tx_buf: data to be written (DMA-safe memory), or NULL
 * @rx_buf: data to be read (DMA-safe memory), or NULL

> 
> > > +             if (fw->size - fw_idx < 8) {
> > > +                     dev_err(&z2->spidev->dev, "firmware malformed");
> >
> > Maybe check this before uploading half of it?
> 
> That would be an extra pass though the firmware file, and the device
> is okay with getting reset after a partial firmware upload, there is no
> onboard storage that can be corrupted, and we fully reset it on each
> boot (or even more often) anyway.

OK, please add a comment to that effect.

> 
> > > +     error = apple_z2_boot(z2);
> >
> > Why can't we wait for the boot in probe()? We can mark the driver as
> > preferring asynchronous probe to not delay the overall boot process.
> 
> A comment on previous version of this submission asked not to load
> firmware in probe callback, since the fs may be unavailable at that point.

But why do you assume that the fs will be available at open time? There
is a number of input handlers that serve internal kernel purposes and we
could have more in the future. They will open the device as soon as it
is registered with the input core.

It is up to the system distributor to configure the kernel properly,
including adding needed firmware to the kernel image if they want the
driver to be built-in.

Thanks.

-- 
Dmitry

