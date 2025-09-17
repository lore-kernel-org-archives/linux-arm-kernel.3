Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E41CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 02:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cCN+5ugSUUmsFCI4Zftan76OLCmZ9PZ1nq+BR7QKqUQ=; b=AkJM0kIz2BphRHZ/FJA+KMWkaN
	nc5rJY1kUtUlo/qHNvk2bxc2dWiL8x059zfxFfUnuuCGzP3OzP4J+5GjVKEUErHlwL//2lrDKIwUT
	vap0EPWdgYDdDmocuPXbqyDU4lVK91653PECXjiiWM2dzLyt2GEl1N8OX+Ad3yX8nVyX9yair+Qln
	VqUty49T/oQNahc6Dw2VCmHINjXcOsbmCWM4CyTrYswG9UnREv8v5nHHLyckXhRN7/GWTXjf2GA/L
	neGWz6uyKU3NU3eziGOUv/4kOhXpmALSrGSAh2KxF8MFyU49EaFpdCW+MtHiuh3+JvoM/+zDok74I
	MGYw8ZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyiKm-0000000A1IS-2f95;
	Wed, 17 Sep 2025 02:55:52 +0000
Received: from mail-yb1-xb62.google.com ([2607:f8b0:4864:20::b62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyiKk-0000000A1I7-0t6f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 02:55:51 +0000
Received: by mail-yb1-xb62.google.com with SMTP id 3f1490d57ef6-ea5c1a18acfso102721276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 19:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758077748; x=1758682548;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCN+5ugSUUmsFCI4Zftan76OLCmZ9PZ1nq+BR7QKqUQ=;
        b=fLpgert59tU+5VlL4nuOE7dvhCpmwWKdUduIHSaz3HEMMUClpTPhbhRU7amRa2Chwm
         WynCq+2cVbxAPTzZ8dzyAybfdrNyAGHCLneytGSTPR36fwn1y1qqa+Keaeu2nDFDR6eN
         uDVJA9qI6Gz+hjZ6cCPrqnPUxWcK7z4rao14elDD/3OaZ0IhFTJX4FNugiHNvHtySW+6
         K0y4voZaMGIslpEDJgvGRd4my8qKIA5DIG9pQfU0CddoneokcxmDVK41kiBsoxwEYO7H
         p8HOgNI8PHp1H8cJdGd0Up2IrxOoIchFmYZ7p4SIyXaweWyiIxE8KwxnGXT1PzoBjiPJ
         g9HQ==
X-Gm-Message-State: AOJu0YwSLZ5P0Alr7hUkpMUmqUzAHQLg4JZm4Y2RcOCyh8ETXhRV6pyA
	qcw5H+7N8sYYjgLDYxG8bhJvfBP3UvM/htANV/vOKOAqt/FohV0TuEgt8zNiuVDeGGmmwpi0cVY
	b/mKjVQrP/CCQV0mdG5AffEgSRAmLZTHiqPkcb5z3wY2oBESM9QZVWKl0gJgjUTQJLXc849S8Ej
	NLG5PRBbzJz5UqFOVI1fo/f29pzjQR6h+qFBp2aN+4d/NyjjSGcAX4oqvkwRyyq0et7CTgJk07l
	a+hyt81xXd+mO9hvIkz006DSuQQzlM=
X-Gm-Gg: ASbGncvkJhGmj/m2I4qVOO/nadPzpveXEVc3JWb5Ig7Bqyt7HXQGBvNK1UJhtBX0S2h
	77JGTdjymn24il2oLZBZGliZF3AsuRjWkDZzTFrg3bnt4qBi8mipMtB7QYs13PNDnbQrLSLEJTN
	VNJs1BB9Kx1Amnxc0Ncu+NHlKgRe3dfAh9RLD12IAcOgdy9o0ZBYTn5EEDtKbfbnEhWRvgwLyFv
	w505blza857aI+iog2JL0n0Wy/kig+UslGgpdK1viAOYD5Jgwc+voKpl1r9wFkX0e+WoIT9+FEM
	oyrQJAn4O1Bj4wcUqJsAg8S1WuBU9nbZbcxZT6T9HeNQ1xfz2o2ubV5ohlicnEr/YRrsruJw0ut
	rEw70w3pTfmwPmEj1SrJMJFO3Gb5+2le29QoBNq2Izc7q7hjwFxe7VyKPXtaIM0rCzAkRXhpaMt
	sc
X-Google-Smtp-Source: AGHT+IEWHeJaloYIabTyDUsYhPmeXOw0a2C1kGDyZkPD5WrQ/1bvzbEaVAgcG+/uNqh34R3pFQtLSiGqVoXe
X-Received: by 2002:a05:6902:4a8e:b0:e97:55f4:3ed3 with SMTP id 3f1490d57ef6-ea5c044dd1emr621131276.28.1758077747944;
        Tue, 16 Sep 2025 19:55:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 3f1490d57ef6-ea5abe92179sm192166276.14.2025.09.16.19.55.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Sep 2025 19:55:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-72e98443055so72739107b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 19:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758077747; x=1758682547; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cCN+5ugSUUmsFCI4Zftan76OLCmZ9PZ1nq+BR7QKqUQ=;
        b=aAj4b+6NI6Gsrdz2i3E35C6JCCk9gLAA+XbC9mh+8QPkLSWoTUOBWfaP3PPEpdovtL
         zWQVPDVBbD6GP2nTviOM/f0infGm67Ab4VQiRX7flpgpDCVT3zOEOGGaN/hxKqVPPq7X
         We84JmPSvK85AQkCvni9HfGyxE+EnYXNPtTR8=
X-Received: by 2002:a05:690c:6a89:b0:71f:f24f:ccd9 with SMTP id 00721157ae682-738921618b8mr5384307b3.36.1758077747010;
        Tue, 16 Sep 2025 19:55:47 -0700 (PDT)
X-Received: by 2002:a05:690c:6a89:b0:71f:f24f:ccd9 with SMTP id
 00721157ae682-738921618b8mr5384217b3.36.1758077746673; Tue, 16 Sep 2025
 19:55:46 -0700 (PDT)
MIME-Version: 1.0
From: William Zhang <william.zhang@broadcom.com>
Date: Tue, 16 Sep 2025 19:55:36 -0700
X-Gm-Features: AS18NWC3d5fWVf088qWrOXptiwPeO1_wn4aNeZprGPgcE-ncwRtq9P9I5px9iH8
Message-ID: <CAHi4H7FKjYf0c90qoN9bSORboru+S718-k1eJYh4pVoDcJPGHw@mail.gmail.com>
Subject: armv7 R_ARM_PREL31 relocation out of range error when loading module
To: Linux ARM List <linux-arm-kernel@lists.infradead.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Kursad Oney <kursad.oney@broadcom.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wenchung Su <wenchung.su@broadcom.com>, "song@kernel.org" <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_195550_287467_D6073023 
X-CRM114-Status: GOOD (  16.09  )
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

Hi,

We recently ran into the driver loading error resulting from
apply_relocate function when it handle the R_ARM_PREL31 case in
arch/arm/kernel/module.c:
section 29 reloc 0 sym '': relocation 42 out of range (0xc2ab9be8 ->
0x7fad5998)

After some dig, it seems this issue is caused by this change:
ac3b43283923 ("module: replace module_layout with module_memory")

I can see the necessity of this change but it seems it can cause this
kind of error under certain configurations. In our particular case, we
use the 2G/2G split and our armv7 board has 1GB ddr memory. This means
the kernel lower memory is from 0x8000-0000 to 0xc000-0000 and vmalloc
range is from 0xc000-0000 and above.

Before this module layout change, the module is loaded through two
layout sections: core and init. The driver in the test is fairly big
and core module layout(text, data, rodata, sections) can not fit into
the 16MB MODULE memory so both text, data and rodata fallback to
vmalloc range. But with this change, it will text, data and rodata one
by one. So it ends up text in the MODULES memory but rodata is
allocated in VMALLOC and the distance is more than 1GB hence we
believe it causes the above error when R_ARM_PREL31 relocation can not
support more than 1GB offset.

Since the default split is 1G/3G model, the distance between vmalloc
and module memory is always below 1G so we won't see this issue. But
it seems to us the problem is real when use 2G/2G split.

It appears the sections containing R_ARM_PREL31 in our driver are
mostly in .ARM.exidx section. Some search shows this is used by ARM
C++ exception handling but our driver does not use C++. Is there a way
to disable such section for R_ARM_PREL31? If not, is there any
workaround or fix to handle this run-time R_ARM_PREL31 relocation
issue? The same apply_relocate function can handle R_ARM_JUMP24 out of
range using PLTS. Can this apply to R_ARM_PREL31?

Thanks in advance for any suggestions/comments/fixes.

Regards,
William

