Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA5CCF9C72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71+jWtBg7d1iYRAZRUfunCs8pFBPFzAnVW06bSqsOgk=; b=SPPsqGW1MLVdii7M040gmlEfXY
	7c+S9HXBsLsTHwOTkHZuFNBSLNJ87SVs6VOamXDdfy0PrZpTJ1UVQk+SIWHLh5teFyPLTo8v0nPUb
	jjW+2pJROV/423X6+lXVq2rrOUwzo/f0+K+e5cQNhQDlNNaxjtaopJP1zTRBvkpoA+Q9dQVWUxsXZ
	DI+XIWMyPEYSjlg9sOH3sa7MZrLMG37I3JXYge5sk460IZd5o75aS4OwPHPIsBWAn7YPhgxhkQ0py
	4ttWdkOCutEaD4eHE0el6shxtpHQP1gUqxC1YMckxNPgW0PzVDt/wHuFGDVLyOrYFmoEhBDXEHAhM
	DPdRfYzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Dp-000000074hj-2AYR;
	Thu, 20 Nov 2025 17:13:29 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Dn-000000074gn-22Ha
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:13:28 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso1853228a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 09:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763658801; x=1764263601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71+jWtBg7d1iYRAZRUfunCs8pFBPFzAnVW06bSqsOgk=;
        b=jWt6JP3IR3j1dmDI9vQZgyS4r0VG/aNhqQ37OwXmTl7uPlfWvb5y7a8VsD5q/0djK5
         L6UpraDLoSjHnuYTUiTBQbytYmVntALXLIQVozIxxbabcHCUs6VZFFeEf5Dt3Hly4hjP
         9It/8h5jwrVDaJJTPQd7/PY06vaqLwkKfYKC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763658801; x=1764263601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=71+jWtBg7d1iYRAZRUfunCs8pFBPFzAnVW06bSqsOgk=;
        b=UVAOVZv9mT5tfmF0DnlUXE0kWy6EdE06+QRmOMK0iLzq100BW7ww1BR3KG7tSrI2ws
         T/Z6S+o2lgWkZ90EBEBWnWqSz85sEVR3M0OKt/q2//KJnigehiFKGASFqYQ61Xp5alel
         JVvE/xdXJWeg1O7ZlaUCrLaeW63ljhbLymoura+ytM6P9UzAy0v9IMzIedHKv5O5zQ2T
         jfj6NWFay6W6fV9oZmDhpmBxvlz6TIi84uj0c1NAvMM+bJRnRmwFgGtj61v70bph9AZa
         KvRMWgkqg7vhLFASO2RVAnfEdF51VJhL6L/NlpuV735rFVtqtKNIfRhAYmeIPTLmQAGd
         3hhw==
X-Forwarded-Encrypted: i=1; AJvYcCUSg1i3TMOdD1pS3JvGW0eEEB+9yc1agS0CbSCK1lGBeGVLevaMwJnC0ePcXiTO/U8Fr9qRzMRIxxiinZLiizdC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9lGz/LJOSpJCHLxQVjqHUcCHiNuRHpZAUHDd4CLrkZoALT4m3
	g3LHZDxxL1sbVhIFwbkY3QWvmFScyXv1Xzy5LqZpjtU6pRVzwegfvLXM0ZUfLOzRPLDYdTtHeYz
	2LSQvzIyX
X-Gm-Gg: ASbGncv6iBe44v90A5K6fmF8N+aZgt3nHTHQcmbIWZznFaBrgFWGLWVgyyJ2xMRfMHn
	3vul3sRy03fhrTar6YmiwynRX/ACE7oDi+McJYayCHFCD+1DR0+mCCKxwcKSN3Oxzh8LgBletxz
	rGV7Ad23FVCcrH2fjljp73H2Dm4XHmMd9hjU0lDC/gHXodc/7uQQP6eRsmIIO8xooqakQfu2HKo
	+WxHChHlkQw7E4H2dW5FSXD1uFkjiSJDcdqiTHtURHEy/0+X+Joi6kyym2zn0fmKl9+kIM+Ykv6
	ovobC7mC7r57XQbswRmveoFohh9SZ+xHONRzkixnh8XdYLEcPV3GYlxcUA2Bm73pV6rmmok/Vla
	1F8UgYa+lbsqoiNAj42O1/vgTHW55NosalXKER4sNXSx5tVX5eJwJ9U/MiFZCMXNUKUak7zF3FF
	YKPCPX+7JEt90hN1yztXJJDJcJUwSUZlQvVlDsrbjPzTeShcSx5g==
X-Google-Smtp-Source: AGHT+IFCsUkNVv7tlnSoBYR38Y+XakTEGVginFXnVV6A6Sg7DfxjECDjlYv4KlZdKvW6YBiLWVwiNw==
X-Received: by 2002:a17:907:9722:b0:b73:3f7d:3df with SMTP id a640c23a62f3a-b76588ec16cmr348212366b.41.1763658801395;
        Thu, 20 Nov 2025 09:13:21 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd4e51sm248993766b.42.2025.11.20.09.13.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 09:13:19 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b736cd741c1so208815066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 09:13:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVwGBxB1BVJA7gOvYzwg2PnA/i0Fxb3I8vNHqAbiqg3s0xv6tbThSP1RtML6XRz4gX/TZ2mneddsw0TZUvNAKAp@lists.infradead.org
X-Received: by 2002:a17:907:84a:b0:b72:5e29:5084 with SMTP id
 a640c23a62f3a-b765869343emr280912466b.4.1763658799257; Thu, 20 Nov 2025
 09:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20251120081227.v3.1.I1ae7aebc967e52c7c4be7aa65fbd81736649568a@changeid>
 <be1cbae6-f868-4939-a1c1-fd66e2c6b23e@molgen.mpg.de>
In-Reply-To: <be1cbae6-f868-4939-a1c1-fd66e2c6b23e@molgen.mpg.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Nov 2025 09:13:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W1D7ksbS-q1c6cHQSxx3=Z5yfC8duiBGh8S01NhLPLUg@mail.gmail.com>
X-Gm-Features: AWmQ_bk3aT3ZuUmLknvARxMmblGOEsNctHWpwZyyDwMRW7H291WIp2zvCdFNcjo
Message-ID: <CAD=FV=W1D7ksbS-q1c6cHQSxx3=Z5yfC8duiBGh8S01NhLPLUg@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf()
 NULL deref
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev, 
	incogcyberpunk@proton.me, johan.hedberg@gmail.com, sean.wang@mediatek.com, 
	stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_091327_541795_282756E8 
X-CRM114-Status: GOOD (  20.74  )
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

On Thu, Nov 20, 2025 at 9:04=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de>=
 wrote:
>
> > diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> > index fcc62e2fb641..683ac02e964b 100644
> > --- a/drivers/bluetooth/btusb.c
> > +++ b/drivers/bluetooth/btusb.c
> > @@ -2751,6 +2751,11 @@ static void btusb_mtk_claim_iso_intf(struct btus=
b_data *data)
> >       if (!btmtk_data)
> >               return;
> >
> > +     if (!btmtk_data->isopkt_intf) {
> > +             bt_dev_err(data->hdev, "Can't claim NULL iso interface");
>
> As an error is printed now,

An error was also printed before commit e9087e828827 ("Bluetooth:
btusb: mediatek: Add locks for usb_driver_claim_interface()") too, it
was just a different error message. Previously the NULL would have
been noticed by usb_driver_claim_interface(), which would have
returned -ENODEV. That error would have been noticed and the message
printed would have been:

Failed to claim iso interface: -19

So that error is merely changed into:

Can't claim NULL iso interface

> what should be done about? Do drivers need
> fixing? Is it broken hardware?

Personally, I have no idea. I was mostly trying to get the regression
fixed and, after looking at the code, I was convinced that this would
get us back to working at least as well as we did before commit
e9087e828827 ("Bluetooth: btusb: mediatek: Add locks for
usb_driver_claim_interface()"), plus we'd still have the device_lock()
in place to avoid the problems I noticed earlier. It sounds as if,
even with the error printed, things were working well enough for
IncogCyberpunk.

If someone wants to analyze how / why `btmtk_data->isopkt_intf` would
be NULL in this case and if we should do something better to handle
it, I'd certainly support it!


> > +             return;
> > +     }
> > +
> >       /*
> >        * The function usb_driver_claim_interface() is documented to nee=
d
> >        * locks held if it's not called from a probe routine. The code h=
ere
>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

Thanks!

-Doug

