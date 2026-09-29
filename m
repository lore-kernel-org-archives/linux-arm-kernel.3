Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A25C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTJ7TuOM9LkPJunaWpeCcattfbluIgbJm2Adgvc46zA=; b=XQhGZA3fg1FcpkU4fTct2XEigQ
	d6WDu/tH11Ek/IX7NHT42a+uh+OFrxCwDeWFlyt5ofXSeypS+pnYO+ZxRcpITceyPQJWBZ0gfv6sR
	XKeIDG9is5jBWLRBprCCXCFkgw9oXkF9CzvqrZpnTUfb5H4OuLa1zFK8gEmWTLEbsLjk5cM3zUhiR
	ImWEBzRRRtMwZuDkT+TrP8CzlKlGNV4ZKlLTBDES7D3KWMeRpb1ONcG47/L8/XJcxW8kFNJhgl/6T
	sTIJ2ukMBRBOJyIuYAyVeIfxtNb62mDq6rAjWTsW6fNB2Nj2G7aBrra/tZucXBMfxG14yakIvFxzf
	+GzBHqxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSh1-00000002fY6-17X9;
	Tue, 29 Sep 2026 07:56:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBSgy-00000002fXL-1WjC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790668558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RTJ7TuOM9LkPJunaWpeCcattfbluIgbJm2Adgvc46zA=;
	b=QFe/6gBzFuc+XqWjyQ4UHHj5MNYd5nY1wwrGFbHxJsdZPswNvKMSawZxnvfzIYOYnf4KKS
	TzQhxl23NVbrGV9ykJyF8GDZW0ZZjlczmgNvB4jRDIGhIfnAvZ1QouwKXLbNpOVrcnQJxG
	j9SR8GGnpnIIWDxT5k8rjuBI794u7ZM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-wqfFHVS5MmmW85UDZr-7Ag-1; Tue, 29 Sep 2026 03:55:57 -0400
X-MC-Unique: wqfFHVS5MmmW85UDZr-7Ag-1
X-Mimecast-MFC-AGG-ID: wqfFHVS5MmmW85UDZr-7Ag_1790668556
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-486f9d150c3so2169672f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668556; x=1791273356;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RTJ7TuOM9LkPJunaWpeCcattfbluIgbJm2Adgvc46zA=;
        b=zcj0dNyyAzqaN3kvNpp5+Gy1u0dhOlkcu6Qzx1xCIQLV6uzRhpLdRM/29imWgfXfBZ
         5GSqsfW6v1tSRX3f1tdi8Ki81Z1zSiV4YBbWRtvuRtyM1GeT0QKQSmLk5kqt3PwUH/Mx
         6IzFiPsLpyYn+LUY3ue8pKxgul/WuxboEfPc6Ejf+hJ63W0YkwscE20GogDEPWMOZG+Y
         Olhok6+zb1pTxotFdpyeKRB8dLb/60+bvNbUhv/ag7/zc2ju3ndciWbSwFUS+q7LNt4z
         DuYma4G3eDXrPxiafK6i0dAi/8mUORJt1QLXdCUO/PwcUL1EeiYVlsmtBC7/nxLSHGl4
         /T0w==
X-Forwarded-Encrypted: i=1; AKwUvBwgbtSqYN/5MImJztNtGetODtT9XZbd8fuN5hKTHXGxXNrf/We1i76T/afegGzdm6WJJlsH6iFdTwbUprg3oEXT@lists.infradead.org
X-Gm-Message-State: AFq9FYIdS89XAbZS7DoFtZeAarrV7zJYBxQbZxt2qvqRklijPEgSwEVZ
	VEUtjzHB6f/7o2aVVGAbPpwyfmLBbR0ojiF2lzWZDSllJ6Tja56BiaHc1vXaltl3ncRHvoFL1SS
	55nqC+pAMOOqBFFc2WUCAvGYd+dd1UndYkIVbu0FhNfqKibeOZNtdERl95BlekIjbKu5xjXHvfo
	e5
X-Gm-Gg: AYBFou3+82xniepTJOqXgFPJ2neTD0EbWsR3mF+kZ0aJR2woH7d1uWBbi9y6P4g876L
	gsxE9NlZ/5/2hkw4Rf+fUl0ErCLbaByKbSVadoftr01wb9uyFOsPG4BJNRqSnOfi5QeUTTyS0Hy
	80aK5fmDn/4ubtXq3tKldNPm37XfXlMzDOQniP/2vu+h3bseCs8v1tb1Me+jOA5/tPGViBOBPlo
	rW/M/IitFftAGc2/kGy5dFHqU4GfdnNJzBKhuavzavicrNTn2eHLNiL7N8pVi+U1EVgvJnykk2f
	C0fAY0LslvseLDcKLQgzcFGP6XDqEoF/M4/nE0JofcOU3Ra62v5o3V4TyUdnVFW8yxPr7GpNgx/
	SV174lS/3CeKr96I7yakYhggb119LzQP1DF88rPotpKuTjBHFP8XQ/b2gpR+wYFQ8hg==
X-Received: by 2002:a05:6000:614:b0:487:22c6:a623 with SMTP id ffacd0b85a97d-4887166d7eemr27549827f8f.8.1790668555884;
        Tue, 29 Sep 2026 00:55:55 -0700 (PDT)
X-Received: by 2002:a05:6000:614:b0:487:22c6:a623 with SMTP id ffacd0b85a97d-4887166d7eemr27549769f8f.8.1790668555384;
        Tue, 29 Sep 2026 00:55:55 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4f88352sm2268962f8f.4.2026.09.29.00.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:55:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve <aesteve@redhat.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
In-Reply-To: <artpBMeM13Dd0lLy@houat>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org>
 <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
 <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat>
Date: Tue, 29 Sep 2026 09:55:53 +0200
Message-ID: <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wEC-aIuNNr59Ajd8S0aPaSiASfHqxc2SWbKy53ek8Co_1790668556
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_005600_477718_CEC16A58 
X-CRM114-Status: GOOD (  28.16  )
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

Maxime Ripard <mripard@kernel.org> writes:

> On Mon, Sep 28, 2026 at 10:36:18PM +0200, Neil Armstrong wrote:
>> On 9/28/26 21:48, Benjamin Tissoires wrote:
>> > On Sep 28 2026, Neil Armstrong wrote:
>> > > On 9/28/26 19:24, Benjamin Tissoires wrote:
>> > > > On Sep 28 2026, Neil Armstrong wrote:
>> > > > > Hi,
>> > > > > 
>> > > > > On 9/28/26 18:22, Maxime Ripard wrote:
>> > > > > > Hi,
>> > > > > > 
>> > > > > > Panels in general, and MIPI-DSI panels in particular, are pretty
>> > > > > > difficult to support and require pretty much a panel driver for each
>> > > > > > panel produced. Most of them are pretty simple, and require an opaque
>> > > > > > initialization sequence that is usually poorly documented.
>> > > > > > 
>> > > > > > This creates a tension between OEMs and distros because OEMs will
>> > > > > > typically get a new panel to react to a sourcing issue during
>> > > > > > production, and thus need some swift turnaround between getting their
>> > > > > > new panel and it being operational in the OS. Distributions on the other
>> > > > > > hand can take years to ship a kernel with that new panel driver.
>> > > > > > 
>> > > > > > To solve this, I followed the example of HID-BPF and wrote a panel
>> > > > > > driver that will rely on BPF programs to perform the panel
>> > > > > > initialization. That way, we can ship the programs separately from the
>> > > > > > kernel, and with a different lifecycle. If this driver is accepted, the
>> > > > > > plan is to have a userspace component started by udev to identify and
>> > > > > > load the right BPF program for the panels found on the device.
>> > > > > 
>> > > > > This is kind of late for serious applications except if we manage to
>> > > > > solve the bootloader to Linux display engine transition.
>> > > > > 

Besides what Maxime already mentioned (that most general purpose Linux distributions
built the drivers as modules anyways), it doesn't have to be mutually exclusive.

A simple panel could be supported using this BPF-based driver and then a panel driver
added to the kernel, if is found that some applications need to have it built-in and
earlier in the boot path.

I don't see why this would be any different than HDI-BPF or other BPF-based infra,
such as sched_ext.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


