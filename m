Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98163CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 13:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mD6lZo1DYlhz45rUzy85fH782HipOjBn1uPVn9HDDvM=; b=ow9XUbGMy7Wk1bbfrQZaUmHCs3
	eYqT/74PnVZ73LDPFVaN03PRxxQNUgjj7HyHUNuFdqKO6lEfcww8GznNd1ZBbDH+VH6PJhWX/5rKs
	W7QX8k5e/JNCAeCCUjdHifqC4bx/5yV3EwXFrOr5T9Gp343bmREJP7Xgz3OXSxBfuTJdszPdL2XEf
	BvOmAelmDPOtECinOND4OjmWj4IH0uP40mOcHGHEprgjq1QwcJbUcPpa2ZOma8FsrAaFyYdIDIf3f
	2ZFFuoal4z6RzuCJmb1LcnUZdg9CaqWcP2jkbYav2aul78PQSZaEbMWgSH+NMMeE9jmUy1RAJrQKs
	IqxsXqUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usiBq-0000000AEXS-1FT4;
	Sun, 31 Aug 2025 13:33:50 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usi6R-0000000AE5l-09nB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 13:28:16 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3cbb5e7f5aaso499387f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646893; x=1757251693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD6lZo1DYlhz45rUzy85fH782HipOjBn1uPVn9HDDvM=;
        b=jenwx3MvaqTKdGEAcIdHgFIMhofvgY2DgQ4IiI8/dzEF/MVzX2QU4m1DEch36heuyZ
         MJmT41NCO037o7vEThW4Ns4ePTlhb9mp0EGhP7DEq53l7449Y0Ju6uGizup8u/ZvaJnh
         zkJG5LoznF+IzbCQrj2XdJU3dgDDB8bSo+2iKWifpX410Tj0lIXXmjjk5iK/CI7YGYgn
         6025W58XSfMoQBisZzK1cg/qsR7csNg3O9Ri6EmMjHwJWtcpl0JK4TkzNuDVYPP/V53X
         kBlvxtoD3MRTk37Y7VaIesQG6D/xZ82yUBpoCH6eztOFmA5xEhKA4gDpLOiRlVOL7E4r
         J0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646893; x=1757251693;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mD6lZo1DYlhz45rUzy85fH782HipOjBn1uPVn9HDDvM=;
        b=gmQCHcgrnvCwSBPamfB1teGmr6Sc4Eo3W1aPizASCOPt9TXCQekxWY9HYPXarvXe5a
         EY6UPJV4Q30mkQbQs6NCdIUocCxIhPQOZsZpZf/rZJ75Wp6UEncP1dxnOl3TLYslf9Aa
         I+YH2VDT31giwRe3M44UsM8a/WG0DWGaKpfijuhtgkU1Zn8tMwuqRImqvfDmVd8prauW
         LwrtR01x54O+fQNXXRqy56pHGpWtSLDDMUWc03On0fPVrToJEZBANHVkk5QNZBjgaaMe
         C7PRZS5bBhQyFtzFPAGSPkudjchc7LvYWK0w3ZyzMhibCz6RTucViG7ConNH6MfFxrK7
         /SUw==
X-Forwarded-Encrypted: i=1; AJvYcCU3ZEmCR99eSE/40jAa+GaDyCk9coNXKXYEeOfYyStD+VdHusrz45A6yEfWQ/spknrZKP3qDeO6Re81et+iOG1e@lists.infradead.org
X-Gm-Message-State: AOJu0YwokmQGvC/m3dILMkQgUbKENZ9b4/72uO7J1Nzrv1s4JhzFlC+P
	qJkzkNMTmhfDmeDE2kmdHzU6wklsjHPawWNujSvPhmltxKelwDhWrTZjNRSail0p8EM=
X-Gm-Gg: ASbGncv654ysXvzoV0zm9T/xAK3+PUDsLqq5kCW+8jzJ6nHjVIUyMyURPh24nsWRK3j
	Sy9UiF53L6aEicNOaZHbJSX2rAGGhXbKYjnz8mh0JcjHGyQ9z0mrP11SQf9pr2Exf8Jn5RhhboE
	vg5idRkh7wcN9TsRKqtjqm7Y3xjmhhoE58XVV6NdBfDSKkwRpdbseFbjQJTmMPIBTJiPQIQRYf3
	NpV0qk+iXOqXE0EVk99Ne4BfqndiGRKG/iZSLe30XHFAhmfcz2kMyolgGWwEllUvDN+4jKsu1U1
	miGFA9q/fKHmQh7KCU/5VKH1qXWnJsdBkK18rUorzr10YTKiSI6lQt3gXd1ANzO/9ZXfG7AF2NG
	43/OSMqniEGhm3H4aW6sYR/+agIBc0SidbvZSeYBAbVvfoJ7Mxw==
X-Google-Smtp-Source: AGHT+IENOgSWDvrR5me5DMoY53wRwsPVCOq3Mq4OdX9AjWmXw0wgs5GSbqe1NiXMSDlX3rSsquKhHQ==
X-Received: by 2002:a05:600c:4e0f:b0:458:b6b9:6df5 with SMTP id 5b1f17b1804b1-45b81eb0a80mr30834275e9.1.1756646893387;
        Sun, 31 Aug 2025 06:28:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250825114436.46882-3-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120704epcas5p37385c913027d74d221012c4ae1550c73@epcas5p3.samsung.com>
 <20250825114436.46882-3-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 02/10] clk: samsung: Add clock PLL support
 for ARTPEC-8 SoC
Message-Id: <175664689125.195158.15680456692339310248.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_062815_080662_C5C2BC26 
X-CRM114-Status: UNSURE (   7.01  )
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


On Mon, 25 Aug 2025 17:14:28 +0530, Ravi Patel wrote:
> Add below clock PLL support for Axis ARTPEC-8 SoC platform:
> - pll_1017x: Integer PLL with mid frequency FVCO (950 to 2400 MHz)
>              This is used in ARTPEC-8 SoC for shared PLL
> 
> - pll_1031x: Integer/Fractional PLL with mid frequency FVCO
>              (600 to 1200 MHz)
>              This is used in ARTPEC-8 SoC for Audio PLL
> 
> [...]

Applied, thanks!

[02/10] clk: samsung: Add clock PLL support for ARTPEC-8 SoC
        https://git.kernel.org/krzk/linux/c/80770fccb7f60b0bc795852c154273e511f296a0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


