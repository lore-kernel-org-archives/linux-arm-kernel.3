Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A6AC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=; b=xhRRfPD3AFgiseoDGHULRZDfZU
	wp19L6SdwSWA0JbRCp2UcDIwg+VXp8zux99IRtXliPL3asP6XAlyIn100jLpjvuPg+dESzEwTVe9o
	MUhxHBdHGJ4aeyebv/EmlOKz3g1AxV6et5pva+KpC2ZlrBwm1dkzhbO6nZFIPnob0Boc8vPe8AHsz
	xa8//5IAJjwA6ZMqs/USG+MnfdmE6w2BDf+knIuolrSUcWnq4hcSRcqw/sAxFXwtjhkNijJODH+LC
	j7Q7I6GGtzgB1D64y+Dns1KWX5GAKma+u8x2eNnfho2RNTE1GWjPwQWL/tK5NwvChUOHvcKIWTVDS
	k18awFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbSI-00000004CT2-2eVc;
	Thu, 27 Aug 2026 14:51:50 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbSF-00000004CRv-0mt6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 14:51:48 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c2530cabcf4so254072866b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 07:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842305; cv=none;
        d=google.com; s=arc-20260327;
        b=qxfXOl33YgKtA9fW3h5TpwyEPgmfE30biFwtFUC1M/4YoZuJSNPW7ADC8TTwrjO6My
         1UzWQh42kfstZZQk/Z6xBFeBMvNq2j6G7kkJbqoZt6B6+06KxG5XyeYZIDzwR8mnnKi3
         FZEVLyTS9sSRYRVfUXOXWJGn8RSqJfDfNuZh6z6LBafvdlceZMw5hFpc56efo1ZWlvLZ
         w6x0xONn+LL4qtXTOOAzY4RZizjChiPKW58r6/guBGQo/onrIuGhaoMA1OmSrTmbWfBy
         WPiEO+kkJ7W0D++m0dWcECuxGnQxv/BaegMG//jPnp+BwNKWBdxAGPLX5RIpGK3eTpyt
         EKow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=;
        fh=bptAQeeuHJEQtnHM997JGpDRXLkLXM8WSlexdEPVQdc=;
        b=OeXGK029WurgBEpmSDLZpsvIHVtHaeTTiZG+A0EHueu1i1Fo2m9CpCRR4NbxXp+fBJ
         7CN0FJhQDPE3KwUeGcgXXhkrHhZGHMLwK0ZxoOalgTlHerBIWkSJ6m1fexXw+ZdEBDcp
         k32BcdjR1YKBRGkNpImKltlwavVBNipuhbw4SkeKCiUgIfwAQpUpfbyye2QRczhDNtLF
         xNnnLgr8HEhWYnepuh+9wEmy2x1W8++b26xAT7CgdflOLClhpDyqzBi4EkDeHn7umJK+
         E35vzoECAJYNJGn63s55i3nw+pwIEF3vYfUkwq+pxQMctLTDyxDariYb0wH7CMS6cp+l
         u1pg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842305; x=1788447105; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=;
        b=ilBFR/qZrmFDotl/8/zOjgV2AHAYCIBpLYxEoD20h9vD+hL/m4oSYTvH9WhbVPMgFV
         KbAN2CK4FCoaKVJSQR1G0ttjRDTD8a1dqrKFo8evv6ywJFXi80mfFdK9jb2AAmGj8yM7
         OZIRMWKlMPncSx/mb1feT/r6lo5xEXYcYzqQNJLoW7s4iPbCIOrEGGlA8RPHYXvDkQhv
         Ofq1LFz1CcOcmWBK/exVKkx8+xJLVrkqK1FELSTQnxQ0fxe+9OFofrSoa+AkSTlPTK0F
         FxSXrKjERqHoQOCQ4e23vWlGzHUM/ZyA1FXke2d1GVe3WEPumE50FXSC62TPb0JnGc5i
         aBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842305; x=1788447105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=;
        b=mDb3k17hCM0KdMH+L5C9iXugQdbtfQfLpga4HjJ8LbpvIaiC5kKjYnERC/gGtBy2hh
         0eIZx82mN7Rw934mAZ/2pFA/6LCp9ZoiYA3tZ5XuiPFz7aGEm93V7X3USAuA4f2Isop9
         XhugUbpw0KjHP4lLZBZi7x4KFffCtVWpcFeop6pWcisH8Jc3DkJ6uXrb7RjRB9JTpSu2
         oh6dq508FzYMxASue75FDibwB2Z8UguCZzQF9uC1geq/yBPl8O6VpKk/h/rGxeBKT3oU
         2NwWl78j3eMR8yqbjMudvDuvu43G/xD3Eb8TsAsTUfa7XTOEf2KLg4WEBx137mzOJjE8
         0EMA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7w4RytztxXUO0As4zR5LTDJFIDa4fwzubefeos1X2aKYq9j1zXTtr/gl5ZIxup7qi++qcUjuzNrYJ7e0DbgXI@lists.infradead.org
X-Gm-Message-State: AFuF++kL80IHL8yoXg/EHRJQUrWS9vcXZYJaAmEhHav7liCL8Hnn1p1b
	i6QjFGbrgINBip6TdZN7KJAFS5qPSYRnOhbHXs+sqbYLUrnpHJQW179ndjlRdUh32BF3FMdOKV4
	ffW8eLsb6m2MyUWmcfScqJzXAEr+p5E8=
X-Gm-Gg: AR+sD12aGcjvTQx6yzlIL+pzbP4G7YOHQZzw/wU1QlkbDLmPWVKCoBDPkBV/+mzTxHB
	1fMCVoBT7pab0uCDV9v43GGxPEIj6D5Mp+PPqRPZ5dNLJeqBngMO4UtdlE9VqOm9NeyosoaB/2p
	r5vv1w6b9F6wGagA8m0b5zY3t9B1xfg9rgnUYtS6CAOGIYUZX0uor1a2y6xKBSViQvVENBoZZBN
	h5f7fmYddp6dX1q7MxHDX7wWNrHC2yxFfeWFE0sW7hjxie7pWoa2U6YXeXXj/Ea942VZyDGaXhZ
	Yt10eMW62Rfl5gmfN6fficKbkHVbrgnA/9yCvhH9vr8=
X-Received: by 2002:a17:907:b050:10b0:c25:2688:8212 with SMTP id
 a640c23a62f3a-c252688970emr595367466b.0.1787842304808; Thu, 27 Aug 2026
 07:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-2-l.scorcia@gmail.com>
 <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll> <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
 <20260812-smooth-artichoke-kittiwake-f6e85e@quoll> <409e398b-eb8f-48eb-a0d3-ed8fa811328f@kernel.org>
 <CAORyz2JbOsiDYzCw--Y-tiRXEaZ69B8S9Hjvs-j5WZmtck-ynQ@mail.gmail.com> <ca373f33-fa20-40cf-ab7b-33dd9c25bc49@kernel.org>
In-Reply-To: <ca373f33-fa20-40cf-ab7b-33dd9c25bc49@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 27 Aug 2026 16:51:31 +0200
X-Gm-Features: AcwNN1UfydGY6AWpAopJHGYjoXoxQXXnBv3_HR2BQl9Llz3VNnES3KHGvzZYgY4
Message-ID: <CAORyz2Jq-Q5CbFU5=vCffVyMmyS2KodFhomfUqyGwa1w8Q8RTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_075147_247911_2590836A 
X-CRM114-Status: GOOD (  12.72  )
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

> The IDs do not describe hardware capabilities, but ABI between hardware
> (DTS) and software (Linux). If you do not have them in the software,
> then the ABI is not used. I looked at your driver patch and did not find
> usage of these.

Thank you for the clarification.
Since I'm not adding resets to any mt6589 DTS node here I can
completely omit this patch in the next revision. If anyone in the
future wants to specify a toprgu reset for a mt6589 DTS node, they may
submit the binding header together with the actual DTS reference.

Thank you,
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

