Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD677C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 04:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYfZznB0Bwd01EwuH/VCVY8bkI+jlyZ0D2t//XUPrtU=; b=0EtqReeTkFgrEbyPT9kjwvoGIy
	NdvbmOqfKFJCde5ZZl6vy0vqNN0YacfdqK+4phq8e2lkCnJGbn08EzRUFhhUVFEYI1E2fxszEoHKM
	ULme4/91USgA01GqDxcspF51O7fo8bbLJmQc1Gb0oqgys19Zzfz8P69i4d95/K2em6giyx8wyX3EA
	Jr/zwgTK7nO45ZNM58P3HL3E9ftTdiXZv6MQ0GU1vSQVRPPL5Z5cHDhsuN0oV0fPiFUBllmnzrnl7
	kqdMg0/Vdiroerg+9sW6bPyICozxAt8RltMGGOERvzWl35Daynnti0j1wPkDY2KnSywdL4uKO+ylq
	F18jfMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKby-00000002raY-1BHf;
	Thu, 31 Jul 2025 04:09:46 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKZT-00000002rS7-3mVa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 04:07:12 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-886c8de5d90so136590241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 21:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753934830; x=1754539630; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYfZznB0Bwd01EwuH/VCVY8bkI+jlyZ0D2t//XUPrtU=;
        b=aBQRDa2Kaja3UWtUq/pfUr/Na4JTZpPQ/FZNZSyddWLl/KfBdqjxB1cfsbu6FhH4fv
         cD6E4bepqwGMLJO13XC5rFV3PhVoKpfrpW+Uy1XIqGEj3RAujkKFtoFwB1XEgyyiv+Oe
         bjKSVVCAJ8fZPuDi7gl2X4u9RbP+ixhHfyvD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753934830; x=1754539630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYfZznB0Bwd01EwuH/VCVY8bkI+jlyZ0D2t//XUPrtU=;
        b=oiOqzbJ11pJsQ/p9/W2n8VlT0/OhCtoxb2/D1oIaiOuhPyTDt76licq0lo2SQAriyp
         jQIqqVUtmPhEMefoqawbv7ofWhKZpSmYhQvvBYCD/xN+KmMVCZIOKxigewEzMwFjyNyw
         mdFBjReRpgjiAmaUS6ruYbl2bgHNZFsxLser3lb+2SAPfbY7iDSLnPW54fd2hew0bnRo
         ZLlv0vOknxuB9wlTQZVFeKnEzdPi/udL2/e8u0eohHaQc/yj/ji2AlBcrjN/20280pkD
         IPkjf+k+A0b0YxaDDOwYyjqw9jlT1fm66qyKWCHf3P8s5K35k9MEHiR2puQssVDu3RsO
         M42g==
X-Forwarded-Encrypted: i=1; AJvYcCV8X2Dd3beUNZLVM834KjCilxozZuzPEIhhjV/s2nn6yd03DV2xKVjBbvuW2BBjN796tLGbTVEl+puqconIOoee@lists.infradead.org
X-Gm-Message-State: AOJu0YxXBf0DWQuUZ1yB4YeBHDnAjcd8pizyc6wA1w1o4tP9+Q28SxAj
	VcfqwXH8x82gnFnGtprUwhbnbvJKEOHZtBpBGe58tQF07pKiztuJtWKXhtInpe++3t5Z5xdK5oD
	j8kI=
X-Gm-Gg: ASbGncsbNeI1VFwq3P8mnbkFf85wVnsI2K6Vw9/d/rt2N8wDjU9h0ul32Wyrq35XKvd
	qIraM4mD1ZEJnUj9g8xS3DKbDsk0EzzorXegXX/acoolLZfl1uxeiARVRiJGMET9bcEBtIVftbO
	13QmOO5atpnBqpCRI+Hvk0PrNN4e/znywMvr6/L4ixmGxaH2TFqz5Haxz/kv+c57dfT7zLI0AAw
	+HWIdIWhfYmn3gp5suChdg3Z3CL/ykESKh8aaCZTGzYHZuqmQY0V0oxojE9AD+VbFozaWlcsWAW
	ZodWa9TgmOaajffdooR80qHGQUimdOIqIIy8V/brPLn4v6OzH7keMEzwjxeZuQPOAdUeU3Yb0rx
	Wicbt/jxAmHN5TcKJQkTfJJg/Emfb/yOMN8e0XWIUK5WDlkhaVh8CB29DTQ==
X-Google-Smtp-Source: AGHT+IH+uUU0ER0RYWhXB9lSDiryNEMo9bLVD6ktQFeO/ibYUTQhVygihjjz6vT927HzwgUjNlnD3g==
X-Received: by 2002:a05:6102:512b:b0:4e7:db33:5980 with SMTP id ada2fe7eead31-4fbe7f8171cmr3609878137.11.1753934830456;
        Wed, 30 Jul 2025 21:07:10 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88d8f3f0c5dsm199286241.13.2025.07.30.21.07.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 21:07:10 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4fc070be397so187072137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 21:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWpulCq7aojKmVj3lfnHlYGXxkYQpVHcFrZqQA3t9IYCYEPjohZ4/SOynMo1Lv7qe6HbzMkUz6lEmetabSt13I@lists.infradead.org
X-Received: by 2002:a05:6102:fa0:b0:4e5:abd3:626e with SMTP id
 ada2fe7eead31-4fbe87eaa8cmr4099520137.24.1753934828784; Wed, 30 Jul 2025
 21:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250730152128.311109-1-laura.nao@collabora.com> <20250730152128.311109-6-laura.nao@collabora.com>
In-Reply-To: <20250730152128.311109-6-laura.nao@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Jul 2025 12:06:32 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj0F-k37-v-gp5A4p3B_R9Q8exM+STb6vLhJ46=oQV6Eg@mail.gmail.com>
X-Gm-Features: Ac12FXzu20jT5Yk4GmMtSAZzZKsOMgulvP8pOesv2GOi_pI-RDe1qMoPgLQDq0Q
Message-ID: <CAC=S1nj0F-k37-v-gp5A4p3B_R9Q8exM+STb6vLhJ46=oQV6Eg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] thermal/drivers/mediatek/lvts: Add
 lvts_temp_to_raw variant
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
	linux-mediatek@lists.infradead.org, bchihi@baylibre.com, 
	colin.i.king@gmail.com, lala.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_210711_933245_FFBD3F10 
X-CRM114-Status: GOOD (  10.39  )
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

On Wed, Jul 30, 2025 at 11:37=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> MT8196/MT6991 require a different version of lvts_temp_to_raw(),
> specifically the multiplicative inverse of the existing implementation.
> Introduce a variant of the function with inverted calculation logic to
> match this requirement.
>
> This ensures accurate raw value generation for temperature
> thresholds, avoiding spurious thermal interrupts or unintended hardware
> resets on MT8196/MT6991.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

