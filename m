Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2C3C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 21:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwwVBqU1xH3J/i7cD3gzKhhoW2NAKEVI5RSNlNZdiig=; b=PDUHeqNzKge5pPKtdGh59w+GAT
	Vx7an4kpX+4GSlUG0dEi0tCWvy/rLbW0s19gSTZEfVz9Z/VYbGWj8EW6CtJl14dUI5iQOzhdGlWS5
	VmcEuF080AK1qWni3m5+6xlUNfhDkHY/ItDj9bsvC/9P2GIf1NmlXVVpogmwwPkyM5hrAtj9+7b9w
	pluj1Jyl1GbYTfVjO0Z8ra/Yh+ghkkRjHWHhUXVkesn1XaJtYrd9f25j7F3bykbYPHLvKKIJdVe7l
	juDPeJiUcpQWe6t1ZKWJSFSTit/jRktdG2Nu8X75pbkEPRtHuNqWOL7KxY4hk4tCOSWOkXxHVeBhE
	d9hF1NBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oDX-00000007FSx-2O6u;
	Tue, 15 Apr 2025 21:53:19 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oBh-00000007F4z-0KcT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 21:51:26 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30c091b54aaso54433971fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 14:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744753883; x=1745358683; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwwVBqU1xH3J/i7cD3gzKhhoW2NAKEVI5RSNlNZdiig=;
        b=Dr9tfKOrOSBygmplpJbGvRm17R9UXTmmhw1GEsMGv/420JiPutyrBXbttzLK4Uhyr9
         NqxKD368DrwUx3vE1QK6Vjc4YTSj/yCCCg5pc8ygZaifv++wI/j4OLJpSRK9iKWwHhX3
         ugvwWC5GgcJDvBYNXRQq1H6NI2OjC3W77otphdSQxrH68w+jc+MS3WMtr/O8THuwmHci
         y1nedSQkGfs5eIz985Qjdme2fuX1gOgxiDWs+PBFjphe5ulSjMusAvdYnacRXCbla4Kf
         Mlcinlw92LGXn2Ww7v8QMmJIZ6L3nZjobK3pl2xryA7huO84My3B80vlYSiXvQZNw9/v
         mXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744753883; x=1745358683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwwVBqU1xH3J/i7cD3gzKhhoW2NAKEVI5RSNlNZdiig=;
        b=aApgDuA+jvn/Jii5MJU1XkPJaEfKyQGtB3+X3eNGfkDhLDkmPoGW4Ogclhv2wLpJ3c
         RobwLnxzEpnN8uGSNRiabnKlxHL6PgWc/PMX6ks6czZLuVawMs0dtfcCw+oqhxw1lbpG
         rI+GF1axnoXe0akNyIP0m3zor7TNuC65iwqSByDVsmZMxlxDUag6doQRlLcanrjpf3XF
         PHn7+cnFm22ZsxA8zhNbaUXPJc4+udlO27SjyJHMWzoSMK2ZlHF3ZTANv4TKcYVoNNzF
         Zpk0w6qVyEGUpUnyGSxBzTkmMV+XzHUTjLuFcxUKILrY1TqPwKAhOgjbxYq8YoChGPTX
         lvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh+92zM+8tPrOQYC3hCBVZNX5G3A0LU6+RIaGQxCPBS0yFGh+Kbc8zhRPGZNNrTvUG1QatL3h/RVu5W/LgxG8n@lists.infradead.org
X-Gm-Message-State: AOJu0YwMPgq8LCG/rFflfJfGeqiOlxQorF+KytIMl7O7uvgB2gtPBtKY
	ben+KTi/TwCxtnVEsIVKTG3iWVW3MGNe1eMypzKyShdaBUKsGJR8LkHOFghljuQh08mmnuohBIW
	on/nqv/XuY18/ZoMrdXhfC2dsebd37NPBbkbD+w==
X-Gm-Gg: ASbGncvyzb6xd3Thn+nKTcyzJID1Sv5m9Bs9UtUGS42YqshvCmut1prD7cVBdQ4Q3MB
	1l9h6g7tJ248MyEzCZxeo1sUNRU9Jxjtmd+FMDESAFL/evaf+i+zxjQ/vGBsTqksw5BqJDkb6or
	kNG1w8+WIq6boqpcXW/covaA==
X-Google-Smtp-Source: AGHT+IE+SjMha/CZz83kfgX1i08yjyxNG7eptNKiSQYYkbVSYeq+ymUtDU3Y1AnfUH+BRzKuxxYHdlUfXnhngPqHcSw=
X-Received: by 2002:a05:651c:312c:b0:30b:d656:1485 with SMTP id
 38308e7fff4ca-3107c317096mr2201201fa.32.1744753882880; Tue, 15 Apr 2025
 14:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 23:51:11 +0200
X-Gm-Features: ATxdqUEmiDJHa2dZ5KaNyPxwhMUIOlqcAcBjWah7Z2DVmgltPvawf3gtS-j978M
Message-ID: <CACRpkdZ9Qiw0f=BVpCjOj_28=eHcMEO+UXcXaqb_o_2-YSYMrQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: convert board-file GPIO chips to using new value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_145125_116828_1D9F07FF 
X-CRM114-Status: GOOD (  11.54  )
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

On Mon, Apr 7, 2025 at 9:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all ARM board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

