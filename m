Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A18EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCkV6gDGOoOMF8igB/5H1As4Qg7c4viJIZ8RBw36e10=; b=wFlE5X7uN4oNJBMD+IpQs3JKPY
	Po/YH6jmTBGwcPINOkQZnXhfchmjfzTYWlmUAyIxBvnOo2ig/VXB7qoJXJQoy4tHaZ7k59LzETXcu
	Jri0rUzeV7q+UUezRaGKk707+sa3Pa2mkuI8hBnKHvmEepTDCtOxC+TfNRGgp7+SOGMneQZokbAn2
	1/N2x5Ypckir5dkFvlpuANHi3ypnXhIC+Et5kne9JhnsWP5NAMBPA5cSUkaBvm1W+eEx42kMYV9Db
	t4EdN1903r8UJ6LpvSwsgY6tnG0Zjyv3xUtqTh97dpRa4Ku5SpPadRYrmLoLkm3uwFtZAEM3e8DC/
	sL7Txm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYj8T-00000002ANF-0TuH;
	Mon, 07 Jul 2025 10:31:45 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiYK-000000023rM-2pAs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:54:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso24049785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 02:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751882063; x=1752486863; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WCkV6gDGOoOMF8igB/5H1As4Qg7c4viJIZ8RBw36e10=;
        b=cEkKWzfWI0z6kM1kOX02T2sCZ6z0h2TrcKVtJYmh+4PKjcx3umErpMHbxbOtVMIrZY
         iyBmp73qi7Hg/vxkhe8jl0/yYwj/Q7HREq5VK4nlAbACpipMb3XTMPwRvbb+b6Tp0Gin
         mTI+FK6h51XG+kBu35Bpvto5vrm81aXV4evICWKInr/vLBjz1nYpNEA9SZDtGpFvi6dp
         E4OlEmiBsKE1DTcK/GXkJy1nUgZZe8WpkWkfAQ7WlG0aD+iXUBJ8e/X2HPqNKuVcuH2d
         itvKu+7oMctzJB8uKjztGH8IPUyfCPCQKhfQ51cXYLQTK9ZoUu7Iq+GuB/lBjtWqadMK
         neyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882063; x=1752486863;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WCkV6gDGOoOMF8igB/5H1As4Qg7c4viJIZ8RBw36e10=;
        b=SDuuDy6Dq38EVlM9L6fCEB9DWy0bda7EqWoSh0g0NX2nadU0Gwr5A5yUAtiCA4Psu+
         0etn799LIUEoRTdP7LqpLwblBd6kI7Q9QlPXYGJa2b+e1jbJdmwdT7OZBUi4SVHAarqy
         39Ah7lhOkg1LLqD+EdAOVKExEMxOXOoYrjWUjILj4GKpAk1oig29Q5XCNvw5gRjr85dV
         SQW/o6KZd9/OPyNPBuZ+eCUJWbqwqXNOW6sDHIDULhMuXob/1BuWpKw11wASD1fSFVoj
         idL4B/2EU5KQ0YlzCY0P6ar+brxnLMIzRsPnRbcd044HM9PXdtq/YN2mvsJRMPIesEh0
         C+TA==
X-Forwarded-Encrypted: i=1; AJvYcCUHsU6c55naFIvHCVsHXG/LVQ+ttrZAkTyD7VA60ZZzmB0e561hy/isA/6ZbkFlbjck36PBIQ983b+ZDPs/0826@lists.infradead.org
X-Gm-Message-State: AOJu0Yz423urFYT7agehGd/Y26snwjqe5k60to4lofBPplba1HT2Y9et
	IAjPiLmoVZIYGacrtUB/Ctc44os8VJnx9LPTb1plcDcl5fld17qXfMcvPHL1dQrhfUg=
X-Gm-Gg: ASbGncuvXOLF6OI+CZzu0zV3OQXZ6P6g3S5PpqXVDRIuG2qx+YBJ52+APuVt8/a5w/h
	f68qd1YdjufcalFxv/jZhMO3Pr9qwddsSnJSlRmomX5ane5EXINhqvFFaOF2TsNnA6vWgyxliGE
	3iKKA8zmrUCqmkErSwVKEtUOiaZbCGwXbD+cv5b6P5rzUuaZqHZZXNbqPVOmktFGPK8cjW0TMMy
	q7WzAb1FBIBF8p7h1gvynwBBBL/mOEt4YzhayVUF4eFnohho5sha+6twxmKlxyQTVw7GSx39XeP
	RQPcVq8fx5iP/lwf4EeH64zGZGOKIvAtHErTmW/Yk3nwolG4m9hP2FVOJ6sCZ5RAAuFY34d7NWi
	hZC3YNRhsIdYcLgxVDq3qFM4R
X-Google-Smtp-Source: AGHT+IGNA0zQonP2czf5X1Jge+pwADtgl7Io7cV8JOwQeqN86Oye2fUbW6LvrQW+jILiqb5VBqE7Pg==
X-Received: by 2002:a05:600c:45cf:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-454b4eb7f3bmr96048435e9.25.1751882062707;
        Mon, 07 Jul 2025 02:54:22 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a1705ed5sm89436555e9.2.2025.07.07.02.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:54:22 -0700 (PDT)
Date: Mon, 7 Jul 2025 11:54:20 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: wctrl@proton.me
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sean Wang <sean.wang@mediatek.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 03/11] dt-bindings: timer: mediatek: add MT6572
Message-ID: <aGuZTIP3vo9q7MMV@mai.linaro.org>
References: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
 <20250702-mt6572-v4-3-bde75b7ed445@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702-mt6572-v4-3-bde75b7ed445@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_025424_709902_0D2B08B9 
X-CRM114-Status: GOOD (  11.30  )
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

On Wed, Jul 02, 2025 at 01:50:40PM +0300, Max Shevchenko via B4 Relay wrote:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for timer on the MT6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

