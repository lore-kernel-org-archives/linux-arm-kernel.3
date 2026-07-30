Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBC5C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NdSKHD8tzJ9JeGjNeD/cemvIL5cN9rQR/KTJiq4Qf/g=; b=skZwvFLphUALMEUbXzdXHdNuV3
	0uogh1ZyrKML73MbRUmgX1OL/93dswpxhEFiwHdMv/SX7g+O5sgy+Dw6V1OoDIhDcD2bH3exTTEcr
	ieZqiMIcVleOLDfqIkW5fgr4A3GBt1BbrfUB++YBKteavckElGFk0Wr+v9YytOcp7SBLjfAq9NenX
	bzLC9K1dALVol3UxfrcwG7lS+o7gz0X64flGNYigg/vN26DBPdl7CIVytY4z75EotrcPippBtm8YG
	Qb/3ZZM/DaBfJqJUADoVaht8PY2kBZSC/kxv+DZidBJ8/PUf79SnKfIE2cZzlI9xDcOW0VHUoVl7T
	VHzblBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSAf-0000000AnfG-2iYI;
	Thu, 30 Jul 2026 14:55:41 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpSAc-0000000Aneg-2Yej
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 14:55:40 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6ab05b2f9daso849507eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 07:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423337; x=1786028137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NdSKHD8tzJ9JeGjNeD/cemvIL5cN9rQR/KTJiq4Qf/g=;
        b=iSwDIFHzsAChRp0cDLSBC1JNR7I5yp4eu85ZE+OzsCMnCG3NgKEF7MEoQvpjLDrFWd
         ZUX13Ax85S8fSlSv8vIZ3vJtkef3L3RfBLof+vRj38smZoyd2ltTt4JufdjyPmsYMXfS
         ydn6Xrf+EBebR0rRQ7x0lqtQq1jxFwuV0n/2BZS722zKfibTVlO7AcEgEC9W9sHw24Qq
         BWXd0lCmcI+M+cxKh2fGEAnY28jahU4BRhQO7MDO/PJG5lYAO1ELp0OYzuFra0SWGd/w
         R+YCC3wgvK8zaqNTsQswpDPVI5q8fCSzXo/m05OrCuPdJwflHYe7FjIYepKGjI9inOsy
         X7Dw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5hCnRIhCo6nDOb/vTGIY73mQWMeG0UB07/oQ1hZggwhOFOciFbnxQAEFCwtg9M+T5eUAgiExj6R11M0SlM/hK@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/a6reV/70orLQDjVPtg6Cko9ZLVs4j/AwNHmvEmD8jT3V8g0x
	L+qV1qvzb5vj8N25HBjqxuZBbWoXWroXHWc/TMUCqCXbs9qY0jUqy2xLTeUdsTM3
X-Gm-Gg: AR+sD10r9rDReVhow2/6jLvvnzsQWwd3d71wDOsadY5jrRU8HSDTXJ1tZlHzTGX63VL
	/59BkjBR5X8EGcGHM85xAw30QOZsZfhDdID5qZKoVdSOxFrarqs+e5YDtgJXiImsvi84fC3Whsv
	DDmZ+N6AYF8LF22SlVDYg4cHcDV7ecuPp0fK93f/xYhj0MwuLY+nYF2dC2ReTs4FtGLZuz8+pfL
	7qlJbVyJbqni/8CLKM+9OFcN/XOVwaohcF2VH24USRz9pARL7rY60FrUl29xiDWyn2bR6rXzPCa
	wu86WGI8YeDrpu9N94NNODDIKr5pTgxPQp5POhxzNKel09d/YoMWrdePHIUIYYA0hKTn1/WbPO/
	XxXGMhYb5hUF61tuAdKRofvp+5NPaw3lfgxjCV1yFIh94pCHBK+pkNPofXf2k+7OrXhAYYWL/T8
	LOGuw+5jwtuZta/xM0jXLDr7E7KXFcvxZ1HrDruAKI753GURGW98XCxyxmJ34kLjyeT5SfTphKo
	mNHqfyS+1iMzezXgmkYAZEKhPc48DjdHNWsa3MxxYj6eoi29aq+ridFoxhNoXZYQp95SjT+uqkR
	4lgSM2LkjlysalEYKVYVZ5eZR5xKtlbqbe7mKCrrBrbNRw==
X-Received: by 2002:a05:6820:55cb:10b0:6ab:10b:1a97 with SMTP id 006d021491bc7-6acbc1429cemr1456759eaf.43.1785423337225;
        Thu, 30 Jul 2026 07:55:37 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458c2604facsm2239633fac.6.2026.07.30.07.55.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 07:55:37 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7eb64085c45so1654947a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 07:55:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrOHiY+tlqKyjmXJuLL+YzSVdTTsjqhk3Y08rEqA+D+b5UCtJkpBIhNEG2fytI1PEz0qxmUg9ihFRp89C0MizZ3@lists.infradead.org
X-Received: by 2002:a05:6830:4181:b0:7e9:ea18:d1ef with SMTP id
 46e09a7af769-7f02c1c499dmr1923471a34.26.1785423336851; Thu, 30 Jul 2026
 07:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260730004759.3089449-1-neal@gompa.dev> <2026073019-emoticon-decidable-200e@gregkh>
In-Reply-To: <2026073019-emoticon-decidable-200e@gregkh>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 30 Jul 2026 10:55:00 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9X8ho7LyiRBL+z9aWf-EdwmgDdrzgfB3KaOaVGiEx_xQ@mail.gmail.com>
X-Gm-Features: AUfX_mwjt69Y4UONttNjpaGx_OmQhWJKzuOHScfgxTx8mxHBAZO42ivbKWNG3y0
Message-ID: <CAEg-Je9X8ho7LyiRBL+z9aWf-EdwmgDdrzgfB3KaOaVGiEx_xQ@mail.gmail.com>
Subject: Re: [PATCH] firmware_loader: Add /lib/firmware/vendor paths for Apple
 ARM platforms
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Luis Chamberlain <mcgrof@kernel.org>, asahi@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_075538_790357_D46D8BAA 
X-CRM114-Status: GOOD (  22.81  )
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

On Thu, Jul 30, 2026 at 2:01=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 29, 2026 at 08:42:58PM -0400, Neal Gompa wrote:
> > On Apple ARM machines (branded Apple Silicon Macs), there is
> > non-redistributable firmware provided in macOS that is required
> > for Linux to leverage the hardware to run properly.
> >
> > The firmware covers Wi-Fi+BT support, USB, hardware ISP, the touchbar
> > touchscreen, and the trackpad.
> >
> > In order to ensure this firmware can be installed without messing
> > with firmware provided by linux-firmware and other packages that
> > put things in the tree, the empty "vendor" subdirectory was created
> > to serve this purpose. This directory is used by the asahi dracut
> > module as part of the Asahi Linux installation process to transfer
> > firmware from macOS to the newly installed Linux system.
>
> Why is this needed when there is the ability for userspace to add their
> own firmware search path to the list today?
>
> We aren't going to keep adding random paths here, please use the option
> that is designed specifically for this:
>
> >  * fw_path_para - module parameter - default is empty so this is ignore=
d
>
> Right there.

I was not familiar with this feature, and I had inherited the patch as
part of our cleanup effort to upstream the Asahi work. Sorry about
that!

Based on the documentation, this is the patch I've created for our
dracut module: https://github.com/AsahiLinux/asahi-scripts/pull/72

Is this how it is supposed to be used?


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

