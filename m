Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95589C53216
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQ+KH6/Owg7d0XhCktRva+QCZoo/0HA00/3GV4nmC8s=; b=wOBRswJYugcBP55G6fbj+18oyg
	g574OfAL+lTHXTczslbbMJJuIjS0xfoKzVksJpy+2R17xpxNzAgNGMjC4RKC2Mk6OCJekYF1gTKyg
	GAXgXeSNI3WOG2tWjYwJjn0cPt2FvHHwtNBf0dRC7mlzE/jwFWg+DJ/bP+kVIYYlWb49jdL9oUImP
	eq4XyX3rUiWplwQQjXilWF2pNobO+25GxDmqH0fq84IwImC8JATt4ZPc077mX+9fhWbyuT14cdhLs
	oh/iv+9KrJu/kkCaT/AH7hszUGphgWVu3ZKy+d+Uit452zG1N30FpMrtxmrTbpf/i/0/RFkg5LLWS
	/8XYzoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDuY-0000000GGxH-3lDX;
	Fri, 24 Jul 2026 11:17:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDuX-0000000GGwL-1skY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 11:17:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EB5160A84
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 11:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA701F04283
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 11:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784891397;
	bh=GQ+KH6/Owg7d0XhCktRva+QCZoo/0HA00/3GV4nmC8s=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=OK4VjEOEjWaFl6QyeCRrAWRB/E2uSmQXs0d/YZuPmaPkAHEQjL4a71DGIy9siCthN
	 iJ3KRck3bnKt3HKVj3Rc+dVQ4eFqEPeL2OC54YQyG97pUX82RqvdSEq1HtecPH89MV
	 OuvofpKBDiAv5jG5vrSiwkydGRe3dCtuC4Hx4RJlyqaImj7GA48Kg1BX86/JLQJ9Rg
	 dY+YPXTahfqcenyJQL09jeiVfkGtJLThWpkQzSsPW1QpBt3luLaTZPnVYWd59AP5ag
	 9Qh/4+5bso5yqWdT8wYI1cEdcBgUVct87o5i1vvXrXP7CnA4Jd1hvuggoqXHSFScB0
	 x6UV91RdUmm3Q==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b0117dda13so315906e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 04:09:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrP4hpWwk9porStuYZUdgZvbHAp09UmktbShCey16qJKCCAvv6cd8Pnpv74mlBE7w7/PXauFcB7RlHbAett78H9@lists.infradead.org
X-Gm-Message-State: AOJu0YzHQrJ7Z+8RMWsmR9+w4klrqKYuC9hwnnH5nzpGUsaQ/+AOG/WA
	AV1A9zHHVE4hGzZRpByuss2fEenUdB9OLm6S8qK5N5HSm9oroRwn/56K122PaWY8v1eOoKiVAfR
	S4n6a7BEFlAhGLYQxGgwg1MMsX8pj7I47UqEJ4qkU2g==
X-Received: by 2002:a05:6512:128a:b0:5b0:e14:777c with SMTP id
 2adb3069b0e04-5b2b2f667a1mr1625122e87.22.1784891391963; Fri, 24 Jul 2026
 04:09:51 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 04:09:50 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 04:09:50 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260724084328.3943997-4-wenst@chromium.org>
MIME-Version: 1.0
References: <20260724084328.3943997-1-wenst@chromium.org> <20260724084328.3943997-4-wenst@chromium.org>
Date: Fri, 24 Jul 2026 04:09:50 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfV7SeG-jJ8YdS=aRabCUvP0PV5=8QL=AdCCsnzyKq1QA@mail.gmail.com>
X-Gm-Features: AUfX_mwiB4kLYEiWsY_exPz74ryChUmU7NeF3R9wpx0QdX4G4TNw4501T3DhVLY
Message-ID: <CAMRc=MfV7SeG-jJ8YdS=aRabCUvP0PV5=8QL=AdCCsnzyKq1QA@mail.gmail.com>
Subject: Re: [PATCH v7 03/16] power: sequencing: Add pwrseq_get_state()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
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

On Fri, 24 Jul 2026 10:43:12 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> The power sequencing consumer API already does power on state tracking
> internally. Expose the state to consumers through pwrseq_get_state()
> so that they don't have to reimplement it locally.
>
> Instead of just on/off and error codes, the function can also return
> "unknown" state. This is in anticipation for "uncontrollable" power
> sequencers (such as GPIOs left unconnected).
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

I'd have dropped my Ack with a change that significant but it looks good now
so:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

