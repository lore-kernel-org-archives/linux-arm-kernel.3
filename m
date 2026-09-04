Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D99C79F90
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nkJa0DEiZl3J7FyRvj4qHDW8diym9PfM40Ci/vpZoM=; b=3bQGxV8w/m2uG4pfrti1Hx0JxC
	y6Wh0sqn+L2QnV1ztCY8yupq72UNnug66y24yx7SGnEwrpMYjAZ4rvg7epfOuSIObowUlvrHLipmA
	Xyt/QBsRXwrfgGL5fyYm5J0nfx5787f6/j1VG4ess/mIKYvOQ/1vmq2Z0/UUZRo89GfiHhf+/FZtM
	2C2RdruUzDsy9nZivCcAFg5cvZU9uFJdgW6s+L89Pw95JBTR35s8ux8lu4j4BABpOY1sOToqei8zT
	zOFgWZyRH5tRTpS4EZkRu4PDreBbuxra70nlsrM2ecLUtWStmF75/XXAEIAd2hMHze+Hkqin9HD3o
	9BguycaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wxq-00000002ksQ-0Oag;
	Fri, 04 Sep 2026 16:40:30 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Wxl-00000002kqI-3PTb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:40:28 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-9390dd46b45so72621085a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 09:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788540023; x=1789144823; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1nkJa0DEiZl3J7FyRvj4qHDW8diym9PfM40Ci/vpZoM=;
        b=lFQzTKY2HzpwXrfP1OuqT3/XLyz8QxJa6+j18jZYAQEdsvnMlmrPZTNkCqkQLpx+H/
         ORpbLd2AFtsC/G93iAe3gyAD6Yas2NzkZRRCMxHAqk20CENAOEDat7wNyjWfGDh85dI1
         oIseyHnDdJIGAd3CfJliPa2Ju7SJkvKQtUfxeY9E54t/aKOrP6nmniKrkPuL4JQ7aydX
         1DSKFXZJ4FB74qhY02OVpF5t6Es76H3+jwplnnkt28w5peTV2kTCu31kY8NgkuTfiiNb
         xD52kKhqbQOlHiM41ZZqB0azvHbXr6u22noT6LPqzlj68joSofcrmXYZfIPqKvbce7Rh
         GnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540023; x=1789144823;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nkJa0DEiZl3J7FyRvj4qHDW8diym9PfM40Ci/vpZoM=;
        b=sF1m0fH0cm+M7VLSN58TB1ixM/jAwf3et+Go/Fn3KRWevTz7AKhW2zKsxyy6Y8H9Di
         2hw5L/W4RhnErog29jlTQWrVPbkC3McB334CafpcKATVTCW8pBKULakKrFulwUmH/Vlp
         yDJIrZ6NbDPCk7J3sdpmMTxurEw1Eod5Wb59SbnR5ZH7wEZhpEa015g/OTgNP1c0GFzN
         Us0napDlmxcyYdvhrJJkrRnKkXMyinzOxmumKad/5We7zZBn2Q/ORWZKXp0yLtX2nF3s
         NfZCVqWSycgVshWbEnuwTee2ULglZd9kbDqcL00Q5Tlqk02i5KWwdMJ7oo+Kr74jY0pn
         vDIw==
X-Forwarded-Encrypted: i=1; AKwUvBzDmGCjdQz6N+tCVMhRgGT58CyvZh1bXCAfxypvAsMSA/2xrIR+9LzWcTVNUB8xncRlkI0GMPhHxIzs/tDzjbbH@lists.infradead.org
X-Gm-Message-State: AFuF++kOr8+W7XrPsOYv+tIi/+ZBVBwltzvyencDXqH8Z70TZYRIT53H
	LFdgnwoR9umCaGKm6DnGM+GI/b+4b6nLpk9XrFQ7lJdHijXHuG9kwFcGuwkdKmK0Fw==
X-Gm-Gg: AYBFou0LQcmlQhcCWi/Nxx+9bA02fQkcprhAmunqUb1lYSr1ffr3NX74rMuMRa/iMij
	aE8fUYNXGEb5VAKdz6jGlL37n3Eeu4G4IMrJY1WDYzY0k5M32dkJuPVDSJL4F1Zqq09f0ZQLQac
	8y96rPM1COgenx6ZXN7shdcG7AP4swlZ4SEc9KvHmXeuj1NNaBkKm+qXzEtbGkKPeIlWozz4kHy
	x6174vcR8fSLpkyi0RuqbrDzJkzqJoCZYVDQcCG6FUFC2emnFn3FQeLlMPIJ2CHKvDLvfUkcNkL
	yc/3d/ZyZe+jL0Xc7NhuufxDuw+tQgm/Zgl0B3SnzVuQdTGT3ZlMwqb6CMLyBEpo7EjP7tMZWKG
	GPQGy8bK+1Uvw5HFqfCJuNoyw5yWQ0z5bAvroKWhRg4QOvOBWsJM3TZ0bvdz5iQPAtGBzLeuZlp
	xx9PMa+C1QFELcCZ0tbpjB9CNJtHdfved6FvjnuyXOx4hxqBsvusWZfKUHmxI1rA==
X-Received: by 2002:a05:620a:8017:b0:939:6ec8:6928 with SMTP id af79cd13be357-9398037ac44mr706361285a.16.1788540023360;
        Fri, 04 Sep 2026 09:40:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fafc3a7sm246420885a.14.2026.09.04.09.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:40:22 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:40:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 07/16] usb: core: Move struct usb_port and related
 APIs to port.h
Message-ID: <6bc3c29d-aa38-4e59-a4f5-2c480ef9c748@rowland.harvard.edu>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-8-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-8-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_094026_201092_B4C8E049 
X-CRM114-Status: GOOD (  20.32  )
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

On Fri, Sep 04, 2026 at 04:41:46PM +0800, Chen-Yu Tsai wrote:
> |struct usb_port| and its matching container_of() macro should live in
> its own port.h, matching the split we have for .c files.
> 
> Move them as described. Also move usb_port_is_power_on(), since in the
> next change its |struct usb_hub *| parameter will be changed to
> |struct usb_port *|, and becomes a non-static function that only
> references |struct usb_port|.
> 
> port.h is only included from hub.h, as a subsequent patch will directly
> use fields from |struct usb_port| in a static inline helper in hub.h.
> The USB internal headers don't have header guards to help with this.
> 
> Also drop 'extern' from the header declaration of usb_port_is_power_on().
> This is not needed in modern C.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

> diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
> new file mode 100644
> index 000000000000..00f7500af336
> --- /dev/null
> +++ b/drivers/usb/core/port.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * usb hub driver head file
> + *
> + * Copyright (C) 1999 Linus Torvalds
> + * Copyright (C) 1999 Johannes Erdfelt
> + * Copyright (C) 1999 Gregory P. Smith
> + * Copyright (C) 2001 Brad Hards (bhards@bigpond.net.au)
> + * Copyright (C) 2012 Intel Corp (tianyu.lan@intel.com)

These copyright notices are entirely inappropriate for this file.  As 
far as I know, none of these people wrote any of the code you moved 
here.

Alan Stern

