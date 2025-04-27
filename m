Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD42C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 18:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Db7dKW4Cx+uRktVwN8aLRPA9B0QTBvPsIKNKFVlWpEY=; b=rbJCBkyN+uL1ps8rQ8ALus6HO8
	9FCUvY9ToLre2vG1yHqGumxFbDy0AHCyU3UiQCWOhX7dH8fdm6NJktK6caRJSNsFNfCdG4IJx1svs
	K7zBoh8mh3kBPIMYpuaxWFrNloDB5CM1Qw225BCt5DpqxaXrqcSrpco7ztnJ39H/CxJ4hOzozQX+z
	SXFG8vjEYOnWbkJGFW7VI/C3+xHiZ2eBiD6UWPpyQarJq9jaHyj664zZ3XCUFYvLi7rtsQJTJ20AN
	UGPrW3DyC9Bk63Afo1BpQOpiLCQE4Oy6UKXTMLPn5e1GsJK7YZ0laBeWPMJcSpzT9sPB5243Gwy/c
	QXkJ3YAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u96mz-00000003sMo-1xzB;
	Sun, 27 Apr 2025 18:31:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u96l3-00000003sHE-3FuP;
	Sun, 27 Apr 2025 18:29:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso47677275e9.3;
        Sun, 27 Apr 2025 11:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745778579; x=1746383379; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Db7dKW4Cx+uRktVwN8aLRPA9B0QTBvPsIKNKFVlWpEY=;
        b=g6jazRTIbEzgLLH66GZC/chaKIxyfljO47n5ukCFuXAeJdM+c51+n13wz/yYqdZv6U
         z4OnxsxzKtYxNS2+juWbkxcn3M1sBLN0xUqPHWr6rSt+JYJidhWbRytvaTOLpRx1ujx+
         MAxsi6yREBWGRHsJkFH+OCqI8aW0T5dCPcY4zeKGZJuPew9ZSrN1wIWi4hyniF8J4qOH
         ZbOQ5TO/3B8dC6uadYVaLcle7Idsr9VU3yF+YFhEPYI5l0O2VEacnE5BJ9v6ao50vS5W
         lAP4yOwIbiZK+GcG2zooHspZ4RNxvkkMx7oeChNqW/yisptL9R91VfuqikD1BQ924l3i
         TwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745778579; x=1746383379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Db7dKW4Cx+uRktVwN8aLRPA9B0QTBvPsIKNKFVlWpEY=;
        b=lz6yuIt0HoNcrV0Z4P5imT0rIFqnHl3JxDOZvuVp5AtjHTat69a0OR5/C7ejhbLHD8
         YuzKRZXlKm45UaGLNrlXlVTBmJfyJ1bf7sUnL4iRlObyqt1fSp7jPJ8GViAbJuWspwOI
         9Tb6k+aRzKYg22jkEHv4zqnu2xUQRKj+FL7LIy83/EKLnBpnbPJ+dIufz4Te8xwmr+IL
         irSW4cKKPWIX1x16t+vkIXU16UjpElRvU2itDPSG+pMYeW9eLWIk/tXTJdHk1XvYRE95
         vDYfj3qsLeGQKvx9HUepGVW3wlyaqlCgWhUog3fVgKymvHRHcakEy+ZeehgGWg+jmKwm
         kvgA==
X-Forwarded-Encrypted: i=1; AJvYcCUmInSngUuWcRyUnYf7EsXEJiWKVLc29ddYGbsSLDqBNP4ryb4qGzqnnrrJVkFDC9XmYRpZjVWRGBOxirfavQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWO2j/EtHfWCeMQbaNVQ0KpzgdOchyam9sn1pUtI4sXUVnhVbe
	/Tu90uatRmrXgQ+hPY5un0iaGRFEl43RpVsugNxB/UtEFbBv2Zq9qakUW8SA5aIi42HBQhPVIPq
	ORizLskz4+1SoNIl8UlJw7hgDVVI=
X-Gm-Gg: ASbGncuvIJtohxP8Xk713BF6Y/suxerbcBX6AwWG/cOy2FzTWvrSEDIer9tqhJeIG2F
	DF5EUvaD7XL5bu5HA2o8kFEAjEluZn81R7gwTq3lfJM7QjbRyqi6+g7CppsupBt6ldt2jdiPvkC
	TTPyOW4z9pN0V7qPXSP/Y5v+8MiiRrsbt4Uveg16qxC7SZjXM2PK2K
X-Google-Smtp-Source: AGHT+IFqrFws0QVcZch7R7mk+jva3sblgRsU3tES/5WovG5m7MbacaQeIlDtnn+B1ktxPs6SVNmjJDHYcJrqLcVPzKI=
X-Received: by 2002:a05:600c:4ecc:b0:43c:ec97:75db with SMTP id
 5b1f17b1804b1-440a65d8b2bmr65417565e9.11.1745778578813; Sun, 27 Apr 2025
 11:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250427182019.1862-1-honyuenkwun@gmail.com>
In-Reply-To: <20250427182019.1862-1-honyuenkwun@gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Sun, 27 Apr 2025 13:29:28 -0500
X-Gm-Features: ATxdqUEQ34-lUcxcs-dQajJC9wL2Ufn3R-u44jDDXPogYCc3C7A5tUlz6hfsmYY
Message-ID: <CALWfF7LNADVFOz-=mYG=+-h1jWiMBYfoVyMJbEiT7O2tzKGxSQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Enable bluetooth of AP6611s on OPI5 Max/Ultra
To: Johannes Erdfelt <johannes@erdfelt.com>, Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_112941_814088_08785BD7 
X-CRM114-Status: UNSURE (   8.01  )
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

On Sun, Apr 27, 2025 at 1:21=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com> w=
rote:
>
> Orange Pi 5 Max and Ultra has onboard AP6611s with Bluetooth 5.3
> connected via UART7.
>
> The chip reports as:
> [    3.747864] Bluetooth: hci0: BCM: chip id 3
> [    3.750021] Bluetooth: hci0: BCM: features 0x0f
> [    3.775923] Bluetooth: hci0: SYN43711A0
> [    3.775930] Bluetooth: hci0: BCM (001.001.030) build 0000

For testing, I installed the bluetooth hcd firmware from Orange Pi
using the board name.

e.g.
https://github.com/jimmyhon/alarm/commit/68240d0ed13a3a92e95b6e25e9d84020dc=
11fea4

Jimmy

