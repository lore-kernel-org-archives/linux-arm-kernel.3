Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5555C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjYdTZtX7lK06ob/wWBa1ApljcuOIaY/cFe1TQGyGz4=; b=hm/Y5f+5PQlMi6LefnxeWvCvU4
	YlWad45iLvo9+wOVo8omN+dZtmSf0RLL45nVWLOmO1RSX0Trr5UmqlMwqjwqXmUpW+BKSfqkcbzEK
	iIavNFYycEjGiiGHRn0XeOrXOZlgM927UVHaGUxQClsaISQRUVu/DHJB55eFlr4uTu8K9UDL/cQAx
	cEdx/IXKcD5OVrzRMXrgeblReYte9UDLRvSI+71LYrvbpk4QvX2WFqzfu6O5CnoHLz42NUH+GS8aY
	9TA+pawINNApx+uflO+MqVccwkG+aC55DWId3Gjs7fCl+u7i7Qe2U/yQ0ohl2B29+j4+8QHiNlQTw
	smyipDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcgZ-00000006tu8-23lV;
	Fri, 03 Jul 2026 12:07:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcgZ-00000006ttx-03g9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:07:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 51A5842A39
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 12:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CB51F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 12:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783080477;
	bh=PjYdTZtX7lK06ob/wWBa1ApljcuOIaY/cFe1TQGyGz4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WTWi0jR7xVCoxYKYqgxGq2fcoz5SNKI3/szg5jvDubWkKDZOL52ioyEKLmIcyAcpx
	 sSmaP4ca9BOE32xZQ9v/sp22wjWqCBoK8xAAhOFCFxIPV/lSpuXiy5uBIeZd4Ka8au
	 mupp6ItSo4dd4lZOsZRKtj7kZ2PFM46nBtvA66Y04MEHJfDZgsbpHqeoMvYwyYitw5
	 ifd1bhmOq1HXeR+tLGHkv/exz8r4DCMSObfom4g2+N9u3PhrdGMmBkOB+MTMuDfCC0
	 JDSpo4w5XSF9yHQ+6OG+Vmmz0dYmxDGap8vxmfspH2EKlva+vLm8tcfIyjsjzg5K2w
	 ZqPvtvwNRyAHw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aebf9a509eso535060e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 05:07:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqKBZzBvsfzC3cJJ8Epg8BFSD6y/C6evmjH7I1cTYJ3TAP4h/ts5Dg9timdo2V8/1krqXhHZKAhWma6cdjKnCG6@lists.infradead.org
X-Gm-Message-State: AOJu0YwLHoOwC26RmTNwC6C0peFfCSvBaXLy9KL/mjgGi+i+FP1BlpW4
	LdNvWEzDw/gmw3+OvHIZeCkVwlEQjWhVnGqKaKj8Sr7m3AHPtp2U4DnJUjn2B7czI5hCbTRUVZj
	l9kHJwaNxnWObmKjBkscV77RClH5FChhc0WYxzqTiNg==
X-Received: by 2002:a05:6512:4cd:b0:5ae:a9ec:9fc4 with SMTP id
 2adb3069b0e04-5aec807d281mr1746358e87.63.1783080475763; Fri, 03 Jul 2026
 05:07:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:07:53 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:07:53 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703110317.1283411-4-wenst@chromium.org>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-4-wenst@chromium.org>
Date: Fri, 3 Jul 2026 07:07:53 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfPC=Jm6RFkCYG6vsYQiWHxBeNq0L59rwahF_6Fu2Ledw@mail.gmail.com>
X-Gm-Features: AVVi8CfXtDf2gFZfiLD1uTcC0ptlbG8CkVr7knkjsqBhpkA4tCpa69WB2eeLrDU
Message-ID: <CAMRc=MfPC=Jm6RFkCYG6vsYQiWHxBeNq0L59rwahF_6Fu2Ledw@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] power: sequencing: Add pwrseq_power_is_on()
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

On Fri, 3 Jul 2026 13:03:04 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> The power sequencing consumer API already does power on state tracking
> internally. Expose the state to consumers through pwrseq_power_is_on()
> so that they don't have to reimplement it locally.
>

They wouldn't be able to do it as the field is private to pwrseq core anyway.

In what situation would consumers need this? Typically you know what state the
handle is in if you control it.

Bart

