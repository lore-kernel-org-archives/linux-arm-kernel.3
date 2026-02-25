Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE56FD3776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpUJEtvyUfbAfsM/AsYdfsmRudWk2usCr4zOgiJsVxI=; b=f1lRVzmR+F3ZLt7kIriLN5QZRz
	VMIQiM0aRQ0XTybF3e0xU9TQmYgur/ndcvPq/djYFGhxCLIYwvE6ithrgS47CSM4z0oLpEHX1bUwV
	EJ5fFGiuvnllrAMu65HEYpWqVKryhv4J6qad4JfvgPv0y4EO83e/abfBPb71fpQaJBD+ariZM33ct
	5gf2Pr5CQX0FqlNVZC7TkXC6rqimbQD9QSsKqs8NdrjmfaB/gGYLSPPoiGWfy/9Wa2lwNjq/M9lo6
	YaU8bwf5lsGBNP6pTtzB2phstqhZWIdSZUBtyjVe+ngGoZbuMBIAIuFhrl11xTjaIkdiZ4Wp5/hMZ
	yeJAm9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIRd-00000004cmt-0uOX;
	Wed, 25 Feb 2026 17:13:05 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIRa-00000004clo-0vGt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:13:03 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-12758ce1e8dso1064251c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772039581; x=1772644381; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jpUJEtvyUfbAfsM/AsYdfsmRudWk2usCr4zOgiJsVxI=;
        b=UK1cq3Cvi3maVM0MczpAmQQmC2OhCa+5ankVUDqsT5oPwAN/nIvJvhxgHEd8cGgOQH
         wYLs91wh0MX0OocgG5FjpvqJlVaONJQCdPm+4qNGav07zmQ1w4ZF2jYebNtUqM5TOdsw
         3dAqBQNuLakYEAnjpq78ZrFZU9xZqQQrWXRKLps8Gi3zWNNg/9g4iPzkq/qFIYyRJxIo
         +VOOcHJd+MfF2Pp6ofezuJMOrV+xiJbyzCKiKMLk79bpFI0gtahQdELgB4/yspAfDke6
         d1lEQO8VJRVzXgzDceMK27nvOZ+VbvryfyYz0e2DWbupa2shlchPIMqkByr3cLIrgdTw
         iRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039581; x=1772644381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpUJEtvyUfbAfsM/AsYdfsmRudWk2usCr4zOgiJsVxI=;
        b=CNdmqNHtiJjSRhZKhj5YFLNXNqlRQ+JEYWwHnyQ08UkqsUunGhz69j9iksbbGF8EHb
         yj41/8QlMMj20Vu1Sbkw0hZAFjYQvrr685N43YAElZjYPTP2nomWTrSxRLWNCEERlhUw
         uWNysvvHoI50IHbBny8QQMlQChn/4XWgnsn2IKQkpnfhc2CGDC84iT3jo1Qfmnf3jWnb
         8V27gK1cS0tOuSfp2Wzp/yMG1VQeKZsvEiwdT/zthStskvujSc5CZiNhEXKIY+oyDHyk
         TdLTUywOl+jv2qbkrhcQDI+p7zppceFKHT7ZUGrgkts2H+dKkE2Nyz4fSn0IYI6PaZsM
         cPLA==
X-Forwarded-Encrypted: i=1; AJvYcCUXDh+FXUN2eZAGz83vFZTLpGnaNjPkEXA1s8BGYS1jHgUBX4N7Ct3Oo2rSRnU5MUTTOgyee5Mm7MaSkoAfwete@lists.infradead.org
X-Gm-Message-State: AOJu0YwCAEAWh5omlgZ0YpAirrFK+2U6n3eAnE6G+3GzWZyrjLggalNK
	CIb+zmPVUQZsLZfGZv1eIMrTqH9FxRDlO1F2SA4D5sdEes+D3qzHT2Fe
X-Gm-Gg: ATEYQzzUZAiEhRXLbK0o25ej4CF4NarlHpDyBW4ZfpNzvUdckOtdgMJ4+QeyRz4CPyJ
	Gibiofeenxq42bRYRsMhF+pnghbbTqSNunGi16B7txPtTneHfANczYj0W31zXOZ4ioaCvhx2zyI
	cJwXE7v+GTkKuVmjSncNM6MQPcJFpId476RQuqIEQur7+kQ/fNEGPjQkU3JegNPFsDMxhnluMfZ
	gQqLJBEB78MnxhSyq8uQ9Rz4L2gOIRwGzdRUBM3R/W8CpoaJOFT2g2QYGHHmZ60VIyBFx5eTRah
	Gy3q5QV/e6qxL0vsTrhiA6KjqW3PMBqrHkCtnsKWTu5gfVMu7woZoOCr8op/Bx85TqHkN92MKgG
	+5o3C11kmODRz3OTUoA6kQT6JaO6MLXCVKiJ4GYUiOK1gP1lpfBqOrbSDS0HDbuTT9BuKIwNSWe
	WBK54xXvPD/TPySYl/B0QdGV2AQD6/+DgptEGITxv9bZlk+q5iKSKTDwahF36yJyGG
X-Received: by 2002:a05:701a:ca03:b0:127:3440:e5d5 with SMTP id a92af1059eb24-1276ad627ecmr6367928c88.21.1772039581204;
        Wed, 25 Feb 2026 09:13:01 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:64dd:9670:711a:678e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af10481sm14411000c88.3.2026.02.25.09.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:13:00 -0800 (PST)
Date: Wed, 25 Feb 2026 09:12:57 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, robin@protonic.nl, 
	andy@kernel.org, geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, hvilleneuve@dimonoff.com, mkorpershoek@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, lee@kernel.org, 
	alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-ID: <aZ8sjwaKk5MCSDlg@google.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
 <20260225155409.612478-5-hugo@hugovil.com>
 <aZ8fXXGMx3fk7gKs@smile.fi.intel.com>
 <20260225114155.3ee2efb002aa0f52a905f535@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225114155.3ee2efb002aa0f52a905f535@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_091302_257091_25BBD440 
X-CRM114-Status: GOOD (  29.18  )
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

Hi Hugo,

On Wed, Feb 25, 2026 at 11:41:55AM -0500, Hugo Villeneuve wrote:
> Hi Andy,
> thank you for the review.
> 
> On Wed, 25 Feb 2026 18:12:13 +0200
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> > On Wed, Feb 25, 2026 at 10:54:01AM -0500, Hugo Villeneuve wrote:
> > 
> > > Add support for GPIO-based charlieplex keypad, allowing to control
> > > N^2-N keys using N GPIO lines.
> > > 
> > > Reuse matrix keypad keymap to simplify, even if there is no concept
> > > of rows and columns in this type of keyboard.
> > 
> > ...
> > 
> > > +/*
> > > + *  GPIO driven charlieplex keypad driver
> > > + *
> > > + *  Copyright (c) 2025 Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > + *
> > > + *  Based on matrix_keyboard.c
> > 
> > A single space after asterisk is enough.
> 
> Ok, leftover from copy/paste from matrix_keyboard.c :)
> 
> > 
> > > + */
> > 
> > ...
> > 
> > + bitops.h
> > 
> > > +#include <linux/delay.h>
> > 
> > + dev_printk.h
> > + device/devres.h
> > + err.h
> > 
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/input.h>
> > > +#include <linux/input/matrix_keypad.h>
> > 
> > + math.h
> 
> Ok.
> 
> 
> > 
> > > +#include <linux/module.h>
> > 
> > > +#include <linux/of.h>
> > 
> > Is this in use? Or you wanted mod_devicetable.h for OF ID table?
> 
> I need only OF ID table, so will replace with mod_devicetable.h.
> 
> 
> > 
> > > +#include <linux/platform_device.h>
> > > +#include <linux/property.h>
> > > +#include <linux/types.h>
> > 
> > ...
> > 
> > > +	for (code = 0, oline = 0; oline < keypad->nlines; oline++) {
> > > +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> > > +		int iline;
> > 
> > > +		int rc;
> > 
> > I think Dmitry prefers 'error' name for this kind of variables.
> 
> I hate using "error", can be so misleading :)
> 
> I would prefer to use "rc" everywhere, but if Dmitry chimes in and
> specifies "error" or "err", then so it will be.

Yes, I prefer err or error for variables that carry error code or 0.
This allows to write

	error = action(...);
	if (error) {
		// handle it
	}

which is very clear IMO.


> > > +
> > > +	err = input_register_device(keypad->input_dev);
> > > +	if (err)
> > > +		return err;
> > 
> > > +	platform_set_drvdata(pdev, keypad);
> > 
> > Is this needed?
> 
> No, will remove it, and replace last lines with:
> 
>    return input_register_device(keypad->input_dev);

Please use

	err = input_register_device(...);
	if (err)
		return err;

	return 0;

It clearly differentiates error an normal paths, shows that function
returns 0 and not anything else on success, and allows to reorder
or add additional actions easily.

Thanks.

-- 
Dmitry

