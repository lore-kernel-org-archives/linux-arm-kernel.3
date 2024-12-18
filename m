Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E766E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 12:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbZOpRsiSXZYAgcFjG90jFYx1m4NfzP1gX00iKnIzaM=; b=STN91RP2vmqf45XVRPVIggTzO7
	lxLDTjk3K9FEYKl0YEWIzTu6bSOEh2xpW+VzgHUWNDCiAFV4Ljm10HbpqhxE7Lo6Vzs6fNLypXcQf
	j5CMbMrIEn8B3Yb3CB7PL5ASfEdtObxbSp7NdPyGVs63HeDnoIrIGYgeKckWd1UjZjT3ynyBoYwEU
	qIBD/Ll3sW8e3GHHD28AHgy5iK8rex7+Hk0ooA3OmMTd8i4RRce4ZvpC4ns0PX5xMr53z6VTWp+Xr
	5Tb0xgGv47NCvlxCuogyhARzcnwkasoGg11E0Sa9Z//rFYBtrBt53vPczOqwXxMNvIviUZjnsYIWG
	SgAL0N8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNszH-0000000GZW5-1FJn;
	Wed, 18 Dec 2024 12:17:11 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsy7-0000000GZIT-3yZP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 12:16:01 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-71e1597e3b4so1477577a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 04:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734524158; x=1735128958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbZOpRsiSXZYAgcFjG90jFYx1m4NfzP1gX00iKnIzaM=;
        b=fWGw4heCtVfE1SKQkZB62JR5sPGLwn17C5qNsxL9W13DbRP28I44V6GOQ/K+/C8Dw8
         ztvz9sZl6gMBmdLrOpdyGD9nEU/plkw7ZNswcPu1bmZoFNsgtt4qdrhn7ccWgY6AbA+v
         /bU+/vmcuEdIwobHHCOb3Ds2DbTdvCkDaS2C5PSsM/joYJcr//dhWvxPbstsvvPVnRgz
         y2iCFISKku1FSG9YicMYrx6rB+m0KXUUdi7u8QWypC3Tf/yUVzbU4MAMMsouSo0fSL0g
         Z7w2su4gavEbckSNMIUtkn1TcBz2ZH6tibBP1li/XWmarGQvEr4fbaHMrRMvP37R4NJC
         7Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734524158; x=1735128958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbZOpRsiSXZYAgcFjG90jFYx1m4NfzP1gX00iKnIzaM=;
        b=lCWaUZ+7yiZWMRFIfcrbPkhnIb/SLKdc2Cco0wG4CW5xi/kLPiQl4fyI2mSekntULO
         ozDtucnfMSdKV9XgmIguBBkmsPZadE/usX9qhovfCVosUTBS6lByVxWOp9WkHV2szzmi
         iJpmLpuu+B0rzc2AIw7xLzGAVAkSX48ZsR/lzOwGvFR8H1jvmsBohJopFniGkpekjAua
         LHwdhD9+nHxAt5iorUBCAnBtT1/n/eV/7gxnwOmhwvNMTKtaCZlKBIDnSHhDSukGtVMs
         drOKtOK0qRV+Ho2vQUKHrdvaR7aXIXqQjDsKJM7BOfehaGHENsh5NOWMC1cwK6gqrF6y
         ekXw==
X-Forwarded-Encrypted: i=1; AJvYcCUgCVonpk6MRSN5R0bxJ9ybi7ZzOCi2Z/S0cZMM2ekzUwMJRBmWZzzRqp9OOlEV4Uw8XO3UNf9QDMYEMxX4Wi97@lists.infradead.org
X-Gm-Message-State: AOJu0YxEtJe7RyzgTzWmkN5sdMp9C2T3eR6dVllzgIk2QwKL3E6wETH3
	Fx/Je1weua6HMvICAjh26ZjqA8cfqYc576FXecx8LgWuM8zwvjhF19BNcjiMyc3FsYAYo0q/Dmz
	947hSXAkNWBWHuxPa3+tNjCpMwhKzWqhlNj3cSw==
X-Gm-Gg: ASbGncvyN7kgNz2feGKX0JeMmjDWLoh/5kBUKZttVWuMl2g5u3hkA5zv76kfAvGjLTn
	HXUYCvqT1rY4DTurdVxgONAe0VPAst8ashMV5JvU=
X-Google-Smtp-Source: AGHT+IEB63i2cYMG7WdX1Xsg9eBVP077FZ/6FN587/r1UUMaJDNgIjEtYPcAmsRGqIbdLwv5jK6fcF1IQNO+tAEOYAE=
X-Received: by 2002:a05:6830:71a3:b0:71d:fe25:1a88 with SMTP id
 46e09a7af769-71fb75d5818mr1307448a34.17.1734524158647; Wed, 18 Dec 2024
 04:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org> <20241216-gs101-simplefb-v1-1-8ccad1830281@linaro.org>
In-Reply-To: <20241216-gs101-simplefb-v1-1-8ccad1830281@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 18 Dec 2024 12:15:47 +0000
Message-ID: <CADrjBPptsP1XeY1Z9ZsPrVKMPn-pgFwaq71e-+2Rjb+4rsnWQg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: arm: google: add gs101-raven
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_041559_986866_3C5A0F94 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

Hi Andr=C3=A9,

On Mon, 16 Dec 2024 at 13:06, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> Raven is Google's code name for Pixel 6 Pro. Since there are
> differences compared to Pixel 6 (Oriole), we need to add a separate
> compatible for it.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

