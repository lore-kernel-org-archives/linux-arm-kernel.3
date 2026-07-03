Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28865C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaGUI/SLnb4lR4rEHTJXqwMoSRpEpE9qSC0P8Yi76ME=; b=fC4jaOHoEa8QKa+i1HqLjyEWg5
	tYn5P+Uy0E/uaCK0IE860MO+oHANTJsHPYh3o12XNBsVJGU15elevN+mZCe6R6vWV8k0kt6VyCtMe
	898jNMIZYWbeYWkoPowIqpFfIYCs/TH8+qfKprRqFp9d7tR6s+/uxEbf0VTAYWBktwaTG0SiSfIED
	d+NBzojZ+qJeOgdd3E9zhdcCbG1vnR2QkUXxyNCjOL1APniSlBqc7oBGNsmGZV7aPhJ8fK9YW1oFH
	aAjRU+eDeGony7RVVemuuHys3kePM1Eairky230s3bzn8ViwFqo3rsJFaBS7QN5vuDIc3QjaM65Lb
	81okmjVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdo4-000000074aI-0RHp;
	Fri, 03 Jul 2026 13:19:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdo2-000000074ZQ-2Beg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:19:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6139600B0
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 13:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA8A1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 13:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783084785;
	bh=TaGUI/SLnb4lR4rEHTJXqwMoSRpEpE9qSC0P8Yi76ME=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=FSBoNF2/o5ytoQNn1kGC3kmu5EcpXfFu8XwUITt159437vm7u0N13rxnf51iw/Zlm
	 vPZXwYABGauyUr71UEYBAL8uaExvvH22CewRulV5qhUZLzQ0ls34tZ86tinZyXPD4x
	 84E+q2fibmc6PkNiiXAP84aD4wFQ2c0FRJrVDknyHjV+r6g+ZU/xfsgx51yuRUpXxu
	 XdVsLHPmxJGjrH4U8WjAtCYcJHGvEtfpd0w623rBFRnt0HD2LBsmxSUiNwO4GG+66z
	 vS5K/7jd9CRckjw8fbwdtrlKKCKMxe2HqnOZlJFOGKAeHlYDJ4p2RWnuamNkS7ik1G
	 35+Pi1iLdQcyA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39b38198496so4929621fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 06:19:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr0/93YOan6/x1rnfZnFjcsXdtlIR9J60DQtJsmR5oBf9KBmEYugswMu4VjFbCVnC/XEz0yn4NIZvcqzYYpeMGw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5FK7hjeJ58btHwSLRgscT5rNjjZvA49r3DPJVeSZdbxbKZvh3
	MonDEMoraSD1IXLulW4Co2pfAXsJyVv01f1RM3wHZYCXz9N7SXVdH7olOQCOiE/I2NrsSH9cCKC
	k93dqBmMhhEXihF0uGE3GR0XI5VEa/81kJBeitftByQ==
X-Received: by 2002:a2e:a9a6:0:b0:39b:d76:5cb1 with SMTP id
 38308e7fff4ca-39b3407b828mr19081981fa.29.1783084784410; Fri, 03 Jul 2026
 06:19:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 08:19:43 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 08:19:43 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org>
Date: Fri, 3 Jul 2026 08:19:43 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mdmwye6Eh6OOeP7ABXXvBfAx_aJp-m5ubSEFO1zUY3KYQ@mail.gmail.com>
X-Gm-Features: AVVi8CcQfJT1mV-O2rK8aFdmsZga0WCCNIFvY6gVso6IzL778C3Bs5vxWgVilsQ
Message-ID: <CAMRc=Mdmwye6Eh6OOeP7ABXXvBfAx_aJp-m5ubSEFO1zUY3KYQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 3 Jul 2026 13:03:01 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
>
> This series unfortunately spans multiple trees. The way I see it:
>
>   - Patch 1 and 2 go through the driver core, and an immutable tag is
>     provided to be merged together with the USB patches.
>
>   - Patch 3 gets an ack from Bartosz, and goes through the USB tree.
>

I gave my ack but I would prefer to have this in my tree as well, so an
immutable branch would be appreciated.

Bartosz

>   - Patch 4 through 9 (all the USB related ones) go through the USB
>     tree, along with the dependencies above.
>
>   - Patch 10 and 11 go through the power sequencing tree.
>
>   - Patch 12 and 13 (device tree only) go through the soc tree via the
>     mediatek tree.
>

