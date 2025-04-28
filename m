Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC7E4C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 19:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfzpR+XCt8jA2E6ve9YtKygB0tbO6iFuLJbvzZ6DwIk=; b=AAy/taRDMdv6cdB1NetMjUD17g
	/GRoEhEE1tu99ncNKoVxOTZr3H8ZQPELCe8SD2kOeyd33OVY59aJhZiFMGi/FKlUwK/nvjcw18L42
	f3JH9MR9I07ztfBU0YDRwgFnRx3rPh+Ltxtl0beO+p7TLEpSrxYBPd7mLegfTfFpyIyiDquOWNUeg
	oB6tNy4cwAUpISt0RrXxTOZWnDEBthH7WvdEXFz0yZA5Hp5fOOlJMUHZ2cUHVhOqT8faVT9F2RP4T
	vXMupdXYAZ6Qim57h+UWOKlolF8aPmvIblo44vkxs9/Cmqqf6uORkAn63D+VCse2D+21WuxVWbIlT
	5BxjB1lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UFi-00000007M3S-43zb;
	Mon, 28 Apr 2025 19:34:54 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UDk-00000007Loe-2rth
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 19:32:53 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736a7e126c7so4805168b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 12:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745868771; x=1746473571; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfzpR+XCt8jA2E6ve9YtKygB0tbO6iFuLJbvzZ6DwIk=;
        b=YG3pQW6aMH8dUtnuoq9pMf4LCQSYKKZBlSsnc4QXqEBVBiDbPe1D1L6lr1lRiNQaAD
         kPYCF2BM2akvd7bcOkph2Qyt49R3PYINxX4GU3P+JnJQ88B6jo1NGXPR9FlPFitxMWAg
         RnOwoSE0WZxyg232Ge0AogF1XXzs8tPnvvOyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745868771; x=1746473571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfzpR+XCt8jA2E6ve9YtKygB0tbO6iFuLJbvzZ6DwIk=;
        b=HfQVRN2Lmu+MRZ1wU/6KWCXuuedkbte/NXIzNjM/PFcfKtbzL8lbio0Leyjoi9QILz
         N7ALrPzaPS6QjI1xuagtNM8RWUbH0zcrZEVxS8UB93d5A6gtpx5qx2k0PuM5yCnQI0OB
         yCK7IQphn+WgLgvc9IV3tJcimuo6JHvx22PuaXRIlMml8wDMPIDZ5YznF+Nt0gZaSoIR
         1VYh+x6Es/H8JBKYWU1NAXA29zkxmq7MUWdvOfc1QkoTewHWeB012sDt8oqze4YqfhLm
         V70mtthk9o1xo9BEHoEBaAHUrLVFTSqMgpbFUUDdOwe/nuSmrwhrUgqibzbI1iy6MlFX
         gfaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgtsSgGIygt8J+AVn6BR/+q98W9b0dvVr8/9mHtT8JGrNHWVEPhb9f1xNooHBI7nbQRcAvLroH+okVnemUGm69@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/YBUEswn3Nm6gTGm3U+ozz/Ch1V0yhH73oaiWqUrMiLiQmLcY
	TVrScyyJPJs5hHXmkvr26cYSp4UfbURbNDobOmzwfCp5IoWwZkAiSlvpgDeiKlw4WsVITaYaBtc
	=
X-Gm-Gg: ASbGncsWtaruVfprWp1ztD8mkLX7YRJtnlWPvLNzcgCSxlvhij/9Arrl0IauFe/Lue3
	0ljZxvSHn/PS6zJer45ayMIatBjb/cP8quX53Ko6hXTDCXrVv3OyzWNXNSgU3OXefuWXcljfeaY
	OkDM7/CPD6lnGla141Wyom6G7DBPeGbR0lfRznMbhaFV52v2kbLkvlAJxs1gVRDUZSQqeHjefXW
	bbqq56is5GMaeCxVqZ5ycGux68z/+62X2xS1t3uR55ILITsUF0/JnROwbGC09rWKnXcjV6AQoW1
	qaInPloRrd4QBxkYcPjrJxXy9VGk1qZvvor7SjnCF2Twujc0Z6lhfZAEF3xHe/wRkrgu3sXRzP8
	a+wsfBjBa
X-Google-Smtp-Source: AGHT+IFrMAOLXvaaS0iybB3Fv2XAyBokaB6hMj+h/qVbShOv2aNOoBRIgbDuiN4jHPLHY+mb0SOIyA==
X-Received: by 2002:a05:6a00:4b09:b0:73e:2359:4115 with SMTP id d2e1a72fcca58-73ff7397c0fmr13786685b3a.23.1745868771690;
        Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a033sm8652534b3a.105.2025.04.28.12.32.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af50f56b862so3587487a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyKeoyyfTCmXDnxHwZOR7UByHEf7DcC2bIOJ2OnmXt9WfbioGPasbr9ymg6jpGzWNwXXlFQUJ1Inw+dAuVLSnK@lists.infradead.org
X-Received: by 2002:a17:90b:5490:b0:309:f5c6:4c5c with SMTP id
 98e67ed59e1d1-30a01398884mr14674637a91.25.1745868770606; Mon, 28 Apr 2025
 12:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250421101248.426929-1-wenst@chromium.org> <20250421101248.426929-2-wenst@chromium.org>
In-Reply-To: <20250421101248.426929-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 12:32:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
X-Gm-Features: ATxdqUEnTKoRxhC-TaBEXil7UFoCr2GvfRCzsqwspS2g_INzWAwlvG_Di1SAl68
Message-ID: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_123252_742723_18F77C0B 
X-CRM114-Status: GOOD (  19.01  )
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

On Mon, Apr 21, 2025 at 3:13=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration, both shorter than what the eKTH6A12NAY requires.
> Enumeration and subsequent operation follows the I2C HID standard.
>
> Add a compatible string for it with the ekth6a12nay one as a fallback.
> No enum was used as it is rare to actually add new entries. These
> chips are commonly completely backward compatible, and unless the
> power sequencing delays change, there is no real effort being made to
> keep track of new parts, which come out constantly.
>
> Also drop the constraints on the I2C address since it's not really
> part of the binding.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Reworded commit message
> - Dropped the enum for the new compatible string entry
> - Dropped constraint on I2C address completely
> ---
>  .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

