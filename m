Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FB6C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 22:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hO14LWvT6RF71LJw1vwVk3fu7V5c53lrYh2ZZrrSiK0=; b=B3ChzVKGG934V8xp8B4gUw9LxQ
	U50plVOYzwb3XbqUk1ctWGSUaOdMOUVFC1WG+GkopVbmKizVeMu1339SPgHhYBkaZKpcrmzTKuFts
	ZmEMxuxTTARhLSIP6jnRGK4+1dVS9vfXfhZIdIczlfSW2Z99mkPkLw6nvcB1MoFILv4vjTWuhQbiy
	AHIRgwTn8itBkq/I5d8RGRwh7EbqbwxntEtn13IEtz2Eurt9hVNiGVbi0IQpAxxUV1giF2KyMCVnH
	OqRrE6MFL8M2L1OL8H2SXRS6WnZpRWvBTY/0oNsV8QpeW7JapEFRGx/nuMoY3Oh3m0MOd/7ZdHvOK
	AmolZxBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts7ge-000000074FG-06FJ;
	Tue, 11 Mar 2025 22:02:56 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts7ey-0000000741Q-2jeh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 22:01:13 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3fa6c54cdb2so881778b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 15:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741730470; x=1742335270; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hO14LWvT6RF71LJw1vwVk3fu7V5c53lrYh2ZZrrSiK0=;
        b=cNQAXc1F0NomZYxtJjIUeLhGshmYAEhs+46iftcmzVBU3iF89/Od9IXSY7xrrDYKG/
         VqVw/OefY0EDtWfcCLcrkrLnP4V3PfwbQW+LchN+JSHxV8re0Hhv/2EFNSyjl5D9uN3c
         Ncswkp58z0g+BZ98hmj1xUcgk3FZO1lJFbZkrYTLhdEkvKjymjwbaUa0QyiaaAhOyRPA
         /N2JnAGlH4DPV4ERugzhyVXv6nF/Y3Fby7zl0UWIB6vwrXM13trgU+hXyrfQgS7Y2MCL
         eWh6z/r9qPrmpgdFqkKBC/tJehFf+3FslhQPWKndWJ8JuF9jrev7lnsN8n4Z+R0mXvYo
         b/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741730470; x=1742335270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO14LWvT6RF71LJw1vwVk3fu7V5c53lrYh2ZZrrSiK0=;
        b=biFJzWjSEHC1VeSVLawPI91JRXmz/7nfsj82HsyYSUEMWhic190yULx22DVfJvjnJg
         5yrMLGyd/VZSZ/OJT4lygLMLgHQ5k3JbE54RtmWK4v9LGdRdzydAEUjmfDmAEpQc2F27
         702vOLUrzuGT9Oh2sHWUxmA8sG3rd6L+pbZaVRQyLNgtNi/yLS5h5MU0Qh1CPttua7dO
         1/hiE1+lNMRIGsGGix4DPafgU5fXDfS15X1QIMRgEetrY6bk3MQD3CdOdo4t4mZAcL6u
         4z1AJtSKFjVS1HfEZMVoDmLeX2Yg1gCuksHsLx3WR3hI6+mzNhaXQ54GnPcTKbPGj+pb
         e/1A==
X-Forwarded-Encrypted: i=1; AJvYcCWTrBK6Q9eKDVqXb50U1LF5rv0ZRQOHbvlIOaRKD7YXIMoAHhvZOt3g6znlTHPyshiBSFCmLbpYgZbgwbHuhHbK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8Vl61M66W9cukoypj7dcGA1SUuT3uF5fc/qddizpLRNmsmGFa
	vHwTq1gEI0kpn+lykJHJVswojem13DEjz82Z2TlUmlBfrL/ESbg5Qwf8Bmrq6hL3W3uGF1ba0Ap
	uWOjqR9uSGTbwHRwGWNsD31eGWJ8=
X-Gm-Gg: ASbGncuLufDNwIEydfNHD97u+XCrbOVTTBLWdzkNwxNxQw3aqtLwGF4T7Yf6qJNj3oG
	cB7pdpHKTtfEoD7mDFUHequJlw/ckFG13zRFy5BN0ZnEyGo2Ben22x+yn2GVLVLbN9vmfcdP1W+
	bPMczV5O5TcDQauflFBqi7PmeLCeBBoJs7aHAIUbHJS+5j1wqd78dioqHw9Us=
X-Google-Smtp-Source: AGHT+IEtQtK1Iedlr6fWywHHm6YLJ5pw3KzGPuOa1tPA+iCb0feQo7gMOWkm93j2OOJceBrScIcjgWGvXoXqmEz7oyA=
X-Received: by 2002:a05:6808:148f:b0:3f8:b73b:684a with SMTP id
 5614622812f47-3f8b74ac847mr5214463b6e.33.1741730470244; Tue, 11 Mar 2025
 15:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241220120038.3137248-1-pbrobinson@gmail.com>
In-Reply-To: <20241220120038.3137248-1-pbrobinson@gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 11 Mar 2025 15:00:44 -0700
X-Gm-Features: AQ5f1JoZh-NGU3L8eIpxDuwcRiYOWZhV0d89f1f2dzKHdizOfdf7E-JnqzsgH1M
Message-ID: <CA+E=qVdbbRbR+57WRPTJ-WPJ2jZz0V=mD56Ts2oQmo-rjxvO_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add support for WiFi/BT header on Pine64 A64
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_150112_686929_3710A69A 
X-CRM114-Status: GOOD (  14.66  )
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

On Fri, Dec 20, 2024 at 4:00=E2=80=AFAM Peter Robinson <pbrobinson@gmail.co=
m> wrote:
>
> Add the BT and WiFi pins on the WiFi/BT header on the Pine64/Sopine
> boards.
>
> Changes in v2:
> - drop patch that enables the WiFi module, it'll move to a overlay later

Any plans to send v3 with comments from Chen-Yu addressed?


> Peter Robinson (2):
>   arm64: dts: allwinner: a64: Add WiFi/BT header on Pine64
>   arm64: dts: allwinner: a64: Add WiFi/BT header on SoPine
>
>  .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 17 +++++++++++++
>  .../allwinner/sun50i-a64-sopine-baseboard.dts | 24 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
>
> --
> 2.47.1
>
>

