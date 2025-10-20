Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C180CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0tsx4KSP77ESIlhthvIKVZRSnX72ewIM/q8+bWb71E=; b=aY6SoQDA1dYIbh6y4Rnct1MchG
	Z5xurDumk6rnBsPUSjFoud+dYTcy+9RK0jFGqgJ7epM+8zRk+DNqp8/530VLPfYJgXYG3fxl+NAbF
	ZK5u6M9/JNEUfkf8KTMhuBfcc/U8glhzBy4eS9wYCuyJTe//Ja1fGwOhx29c/+/wVWyg1M1o0gNpx
	BJ9DUu3Xd3ee9TYRd2xROct84I/hmKQvpUOXpKBkNqC3anNwQaoOQxbMM2a2CeSLuYnszRL3x1D4r
	dP03bD9rb4vgGNwsJ/gvUEUn8gznI6iBX9beYAiLvjQcGX0P8xUHXiEYsol5kn7iLNLzBIOon2LnQ
	7hhFjXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvOW-0000000Elcp-0iPu;
	Mon, 20 Oct 2025 19:18:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvOT-0000000ElbC-167l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 19:18:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46b303f7469so37441115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987887; x=1761592687; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0tsx4KSP77ESIlhthvIKVZRSnX72ewIM/q8+bWb71E=;
        b=gUhfZRn5gEfryfnhEnCV8N1xnxoUxbkQLPJL7EGTo9HhPE1o+Hl73D61tMXMirx5cI
         2+hU/Xlc3dpBArIFIIOPMhIiCo6FXOkLs7iZZhJJutS6NAkrq+TWUwph1QVWR9Uut8YY
         55Bb2LtZl+9ZAD08y+m1z0pDSLFpXempFW6QaZxLwtDpOdlp+F4OeP7AmoXVWvt3B/aC
         bIBM4iGrxBNeRgKvAje6qfIA9eXzAslE/gEAo5/MGYw9dFkI0XA63ii2tL7D75MAbKKB
         L9ROrZLuYnjxOB/muyyYa/IlobtSYc6HWhL3c7nw/PaS71Q8zxHBiYUXUp//nMjMaeGS
         y8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987887; x=1761592687;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0tsx4KSP77ESIlhthvIKVZRSnX72ewIM/q8+bWb71E=;
        b=adRivUjfSpaz2GXlxRSe2t5zlLNJ87JoAquYa1Wjwh8yJhEXwcYyILW8t40u8qi1mv
         Yo/sQgqU93XWQK7VwT/pTLgy/HwvlsMFMdRrHwWOiUpYbFDQR2Dm8lcI/yhUq+JWeXi0
         JQqwDePpj2TdKbTaP3LEHxHUdUdlXrY55yFTHGafSk0Icv3Nb4Drv3vqgocBOrbZIzV+
         Yca3l9cQZWtouwJcmrmv1mY9Mn8EJnEwBED5P98x7LMk5dlOTZf7+W7VoKpjM2dh6Jmb
         jwsFs7+v4v/7SQ00zPX9ZAhKSvg9tlEgN/XcglQl3sS7F2Sxq/PjdOjyERhdbE9Pnm2Z
         er2g==
X-Forwarded-Encrypted: i=1; AJvYcCUSsWGV3mIcy9cRMwqlbXFJCzev3QDRLqP9KO9Tu/yc2Uux+CaVBF6BhXY0kMq2NKdJgHVzSolvduvWIjC95DWp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+9EtF7Z/qCbieE7iTamfKG3ti0WoM0hf43IwgxZzR7PoCkZNv
	nbb9fv7L6qBNrYal5Qml+BYmdPJ8u37kymi0ittwioq8vknXqYPRtM8AqqFnEgp4DAM=
X-Gm-Gg: ASbGncv2N3PnFLDBg4KOdDcC5Q58dzu0nOG10e+RQZOuflc70d7rmnmVAzrEBw+a+Tc
	Rer2cLe+kz7SXJWR7z8Z0Atmql19Po1bEJHFHt7wG/XzL800NGmigihKI/gSFutb4QF5zhgaGb7
	eLbFibqjoNYDHJVEhC5a360DIhIQcdDqkQQFDzfO/7kfSglwZ8UBJG8xaCLIoT52UVJTXfzEmxz
	++dh4FdhE8SI2fHnAEIaDDKKK4IIF3Ib+vN71/yYnglj+/RX3umMjGmQOVDMm7PNQH3fCI9Y908
	H8qhWKDS/Hn0i4SjttnF8wlJloyart07Rt7//TVLS5y1yYGbCGjLcle05j4W6FIP0nAXmtIlQC1
	jK4Aob8gUeiCXqSj73/PN2EIFoWbDymt5pw3q3wj0lKHKBXSAINJUku2FYbeUVndNuFqRRtItSt
	3KHGq+Rz+KVM006Vkc/BI=
X-Google-Smtp-Source: AGHT+IFcgqnPdm4nc9BDRoT2IcMx9OPGQN7Qu5Edx1CiNPuj1x/M7ZsidNWYx587c0BBZFL+lcxA7A==
X-Received: by 2002:a05:6000:702:b0:427:51d:1177 with SMTP id ffacd0b85a97d-427051d1222mr8232140f8f.8.1760987887446;
        Mon, 20 Oct 2025 12:18:07 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm16913232f8f.32.2025.10.20.12.18.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:18:06 -0700 (PDT)
Message-ID: <e9358bd4-c972-4fb0-a11b-fd562e885ac8@tuxon.dev>
Date: Mon, 20 Oct 2025 22:18:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/32] clk: at91: clk-audio-pll: add support for
 parent_hw
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <bb2fe895daeeb0815452213a437bf2c9e3f6ebcf.1752176711.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <bb2fe895daeeb0815452213a437bf2c9e3f6ebcf.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_121809_307998_73EAC343 
X-CRM114-Status: GOOD (  10.94  )
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

Hi, Ryan,

On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in audio pll clock drivers.

s/parent_hw/parent_data. Same for the patch title

> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-audio-pll were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---

