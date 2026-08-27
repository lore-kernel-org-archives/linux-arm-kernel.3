Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95C7C61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=; b=vcBeu9hiD9D7TsasrQ3ts0ahrg
	5Cr2/4eQfC9MfdlxZXozeVxMe82WWSJcY5nyJabZByKTooCFbvFRzx0e2Vd0IxHvzWRkOHdJH13GA
	QoxPcJUYliNvdXEA+5s8fnTuPl/VImTRmpeIjE1LW1EK4ATJAeRa6aX7LV0hyqTQ+aWHpr4ZPGThu
	7nlMYP9zWkIcwciwGcgN5HJ7PTvhwurquJx1oENgfU2J1RO3vuL4h27mQRBBnvE5aDsUuP/KBSRUR
	QbP0zawbyTtPFuEekpczVSpz8/NRpAIR9VkOJe4b8PTouhG39TT8ATzGC4Q5GvXsyNG1gmJ+208D1
	RBSPW54Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzb65-00000004ASR-0gH4;
	Thu, 27 Aug 2026 14:28:53 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzb62-00000004ARD-1g1x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 14:28:51 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so3422146a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 07:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787840929; cv=none;
        d=google.com; s=arc-20260327;
        b=HiYUDp3DYNn0Z0Y/Xgj7t83Gfx2v1AQXismq5nR130/aThqAAv5xkDd8ZI+q7lmPRs
         okLzXbH1n5AiOhGCIgiLwbsiQP2MFF+jnW1pIiz51Iuk2EJMnYTtEJTwGwo9Sjfp0fMv
         zwFmxk5ibZAVyoV16Pk+2J4kiPsH9/WgHvtF6+lsk1ezWm331WMFPDS3Rh0Tpz7kAiHy
         Lcct8tMUhe9Xssilen1Jy2k9MyUz4fOt7dMl7vNLHx+aIRpBw0bcd+g0MqUa0IDfzqm6
         PRM4SmaCSk0T8eeFrNQdTNRTc+NtqQQxB1KLZ+8geu9nfgbnCGgleQX8bbXKry/ovDuP
         ywEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=;
        fh=Kah575AFtoWS3idLj0IMhxHrzt/SwVtCW3kHXFScujE=;
        b=Vqpwsn0kzhTDrworDZlQDGe1FPnE2fsFLvEUaVKuN81+EQiNLiUlQ8tFj2Qs1xeqK1
         r6em4TCnpnnkaq2boCJ/nFzo1hoH8X5U1kqBOHb9eNDkQIeIsfI8zut/taaLIEzKylKx
         I7NDzGoAwSeitbOsTwg4rbVj3o48IlIQHKICla1qEP/T/Y+xRkdEghpj1cDbGk/tgLlM
         F0jvtttI1xmQdLyMCEsuK8+/YHl72KypTq75He0veDBLcASCZK5zAzdQ87UdLob/wP+l
         eMvoDMCzerhvbTy08/pOv0tpMJGqzADmAuNiaFNx1ALgWGFyd8O+qSRcmozg3S2lPfBg
         E67w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787840929; x=1788445729; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=;
        b=nQUmy+NUlB1zjUIFl7niiNr6lOMcga9QJY47CYQqOrkKFDSxc+sPpeBjE0gHS+Hrhw
         7s296KIdV3+XcAG2WbBe/kkUZOZIQmSXkQMSz5t0Q4UjYuFlur3WhvYCagh4pkes4XAV
         JyJ+ke9FyXT+GM1PHziYodfQZy3r/LA1ChcHjPak+3lzaiQTi3sv/Ykqh/deple+fhCr
         ajzyUz1iPSavMBVIM3FLz6lVKl2iGJIYoSSCv+wFkbTN2VMpMkG9GwZlUpzrSczmhGU+
         Z1zRdTQNbl8w+67eDhs6PVMiaRefW8DIo86nyYg27Qmb/PFUkCz7qPHeCi+2tlh9ke8y
         KUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787840929; x=1788445729;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=;
        b=of7XQgPxDne9QwJN+gwBbFltzZqENAwi4oEGayOzawMKtZc4cO/v0uPKLa3WvfGhDp
         kgXO0w2CIBs49r+Z76NMdPH7KZot+h/WRwmDwXHWt2Xm399USgJE+uAbP7TX81lL8Xf/
         OAGL+feISykaPbVorkmuLXI/OIltIazlwwOdT0XKWMv9YuaINCSAG3iZct+2iRRYfPwL
         ZH/V6V5TfDBdbPhD4nViQQJO+4jf/xUgzPzEQ83BeR5LUO0LNEB9YgOe7eSffDB2Sx0K
         qAORSAPPDNyg6DXCbuZ67/Kj28DpNObnVYTlND5Xu0Qu+kJBYMMiydO6y/SUTro93hVH
         Z2yw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+BTSHq+FbbfmmsUCywwOerwJ4BhFyTVGbCroPNIrgT9uBj29qtTAArDsUQUQLeMj0e+49p+A7wr0gZLzYAYC2@lists.infradead.org
X-Gm-Message-State: AFuF++lqHbIvcY85mZ92U8mHaUoufeWZsSQYmi0hnan0lGTEZ2qwf28y
	KM6jzO7jpl2rtnrG8hFeMN9yJtnu/1hMNgJfE5HGf6m1KXQG09mErFI27xneUjpHfDs+Ul8pzxU
	f7MOtv3IMTIoypyto9+OEFq9Dznk0m5k=
X-Gm-Gg: AR+sD12FNdVLk+jQ2EsSZ0M2KV1sek8lnBOs38aA5cw2lgvWPKvtlp20s5ymjS/8jI6
	svpkz4SPCAL52JJlFng0umnQRy/om7q4er557yuq5w0r60IItLkAFi+/YLg6qBWoe3cjfZGpoCR
	6ARjDxzqx45MIWKk/bE/mMVe3zKSWa/K/yJmpCRWLEleyWohbFA5lj3DkuSm6s+zroDBCRSyhgV
	XcP17f96L3k2qxFU3sxb6+qPe1PV0oj26wp2cDekLmKhRKXj1+5uHxASrmYbiAywV+1CsBh8CZ+
	kUUgq17AEJKKxsI/Lj+oh+TZrQqe0vwimGL31EZG5rQ=
X-Received: by 2002:a17:907:e98b:b0:c15:ee0d:9a32 with SMTP id
 a640c23a62f3a-c250c2e545amr1440724266b.21.1787840928409; Thu, 27 Aug 2026
 07:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260819101853.44681-1-l.scorcia@gmail.com> <20260819101853.44681-3-l.scorcia@gmail.com>
 <20260827-clever-cherry-zebu-6a98f1@quoll>
In-Reply-To: <20260827-clever-cherry-zebu-6a98f1@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 27 Aug 2026 16:28:36 +0200
X-Gm-Features: AcwNN1WwMj244ofyHxGC6S8z0K_T3xrDTw62tkx0k_I8FGnpAKJxs0-SepEND74
Message-ID: <CAORyz2KCAzEEsCifDF4+_wKmi=M6t4EKVVqys-H5wOQqzBeVzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] watchdog: mediatek: Add wdt/toprgu resets for mt6589
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
X-CRM114-CacheID: sfid-20260827_072850_457417_898A8BAF 
X-CRM114-Status: GOOD (  17.50  )
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

> >  drivers/watchdog/mtk_wdt.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> > index 91d110646e16..f8208fb0f723 100644
> > --- a/drivers/watchdog/mtk_wdt.c
> > +++ b/drivers/watchdog/mtk_wdt.c
> > @@ -10,6 +10,7 @@
> >   */
> >
> >  #include <dt-bindings/reset/mt2712-resets.h>
> > +#include <dt-bindings/reset/mediatek,mt6589-wdt.h>
>
> I do not see how you use the bindings here, so my previous comments
> stay. You just ignored it and never replied. In such case:
>
> NAK

The mtk_wdt driver requires the total number of available resets to
register the reset controller. This was defined as
MT6589_TOPRGU_SW_RST_NUM in the binding header, therefore the need for
including it.
In your review for patch v4 1/7 [1] you mentioned that that define
should be dropped as it's not really a binding, so for the next
revision I'll drop that define from the binding header and move it
directly inside the driver. The include won't then be necessary.

Thank you for your help!

[1] https://lists.infradead.org/pipermail/linux-mediatek/2026-August/112272.html
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

