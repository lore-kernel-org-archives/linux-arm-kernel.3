Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4D8106F315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+Wld1uE8fci93f3ikEjkfEzNS+Sq5hrw02mrCqry00=; b=sw/kOtKJus3+Tue6awAeGmpKiQ
	VSWWtNdtnDQw3YE3fAAKoMhV1VgoZMktaGbx8gXEWFZB86HFoH+KkkAzGSpvbKOUCl0Iwm0o2buQH
	mSkRz8KuPP66BlYfKK+no7MHn84dtWgCWZvI3H7DLt6P0Nyaboj+nZEAV/T7Oor7pR/3J9GbmC1VY
	Wb+Kfc2wfh2AI2useMN4zG2F7cz3HbtjOQjcXUZj5eQ1/AHJOIqSRMg0yBUjqGTCzvmwbtT3gMqNC
	HnEohis0WWqVXiN8lC2iGBpGdBx1LHrGgSOt+cdhj92YoyXSsFIlICM9JqQVFivMFGeQ6DDoT6BjW
	ezayS7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hlu-00000005Fmi-1chE;
	Thu, 26 Mar 2026 10:17:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hls-00000005Fkt-1ok3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 10:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8374F60053
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 10:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38A9CC2BC87
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774520219;
	bh=5+Wld1uE8fci93f3ikEjkfEzNS+Sq5hrw02mrCqry00=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=GtcKVLp8KviwFnE4f/4ieWPFVpket/9v8WL4S6ryt8BK61pTs4CSjSyNQfLnt9Q+g
	 hrvjFZQoeUIM/vgv4edFr1PzV671hAAuEVLC3vIe7IKASQSYgyE/3IKFA0n7KOYl8a
	 Ay2a99ZP/LpSSFOqjT5FgolskE/ZrVD3oGJp/1IBdCdS1XTF4/31qULqblYaB78z0L
	 tJvJh6hxp+ksMnawT/4up6nq1grNxtTbSZgd4hiticgaBRFXWJDgsAxZdNsYxwur9j
	 55czNvNzUttqopdxce1putKnJLOOudceW3Xntr1SEr8Wu3F3cAXiVWqYb1DR2Dsjck
	 1kDl/kBuyZX1A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso961823e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 03:16:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0aSca19Zqk+WMzRibfbDLG0oZskxkn9q2lORn44lBCJy0gmJAdz6D8YeDL7Pnp0Cl1hrr2HfZLxfOzFPV6XEq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+NgezXeI0NBv2HmuOWu616OzqqFwhTlXRSHFIoQZfzLxtpZh/
	Wy9zXPwPXWV9jPjAHvW+yzytGNfIgtYP2ZKIeD1qhq3jqKK5jpPtfQqAVlBUBfFqLwHSEXZfhTZ
	U0aYQwo+8+Wc11uQbsJ1/OiwSlUwBJXAqYn4MsFsrkA==
X-Received: by 2002:a05:6512:6c4:b0:5a2:8433:af35 with SMTP id
 2adb3069b0e04-5a29b980c78mr3508946e87.13.1774520217879; Thu, 26 Mar 2026
 03:16:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Mar 2026 03:16:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 26 Mar 2026 03:16:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <acRtWZohqfDLbMKE@google.com>
MIME-Version: 1.0
References: <acRtWZohqfDLbMKE@google.com>
Date: Thu, 26 Mar 2026 03:16:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me+jrJJ34K3TfA46VL76Egi-MAcPj=X9jQGdCtc8-KENw@mail.gmail.com>
X-Gm-Features: AQROBzAeJMUKoW15_JABBsm5WMBNoQbs7v0FFIuKi5a_KzgY0RVFileLg4A4584
Message-ID: <CAMRc=Me+jrJJ34K3TfA46VL76Egi-MAcPj=X9jQGdCtc8-KENw@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: tegra: paz00: configure WiFi rfkill switch
 through device tree
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Marc Dietrich <marvin24@gmx.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Thierry Reding <thierry.reding@gmail.com>
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

On Thu, 26 Mar 2026 00:29:54 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> As of d64c732dfc9e ("net: rfkill: gpio: add DT support") rfkill-gpio
> device can be instantiated via device tree.
>
> Add the declaration there and drop board-paz00.c file and relevant
> Makefile fragments.
>
> Tested-by: Marc Dietrich <marvin24@gmx.de>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

But now I need to find another victim of my auto secondary fwnode experiments
for OF systems. :)

