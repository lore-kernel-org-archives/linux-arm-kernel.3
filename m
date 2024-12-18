Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE53AE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyZoW9fvDykJjh+t7cBP6j9yz1yzBTIkPLx63WQaNAw=; b=XUjvkDS8n+N/2MZ2QP7YMmfYIg
	WxVQOsAQOHRPvwUL5kZe7YjAM8duaUrkOjGEgTD1uhF/jnmUdLJOTCuBE5sUyzBG6XCY1dn/ezVkJ
	9J3lmz96GkA2FiXzKiFFr7IoJoLb0ZZqbYxiDoTQdnUGPiuRU5o9xQHLtT9DYlYIKDKSrX8pG0W//
	hX6IrgygfYPlFmDj6Yh06nYvuj8Ixet4nhg/cHRNVHWQw0tWeYLMjlhGUcGd8dqqglgSe26ichopP
	ChJ7fYgT624LXCLWq0Tb/AbzBLKxvmZ2qbLIUBL13Xo18Bsa1QIYHjkg3mF7IlBlVXHyqE2QVwqKw
	Bzfou32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvlk-0000000Gysi-0tPw;
	Wed, 18 Dec 2024 15:15:24 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvkd-0000000GyaZ-3p3f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:14:16 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-725ed193c9eso5773506b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734534855; x=1735139655; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyZoW9fvDykJjh+t7cBP6j9yz1yzBTIkPLx63WQaNAw=;
        b=ZyjAb4MWcNaj1Gn0JJzqo5i5J6OFF4wkk1nhxVhYkb8UBEPwgL9RrBvYxS9fjbSg1Y
         6kyl8v2Mr52QYt5//HYoZtEGMxWBxjZqqmXWJYdcLq3cMXyUDSpvGB8aHVQMDK8EnYxh
         FDGnesHtlNfJAB9foxgvjeD5leySJHXM1NIwMsEMuqJCH+59dVnau0YewXoygnpqn/pr
         1X1cxhrMuS5wiMV18tC+dJZJfWvUVw+VAtBRSZum+R17PvcQsPksV8RqK2DP+X09S33J
         oSVYVipqXhC1cyGbIaUiRwIfXa726vujCxEwk/xBJYtZ9VOKl4om5Q8Jk3ix2MydssEe
         KTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534855; x=1735139655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyZoW9fvDykJjh+t7cBP6j9yz1yzBTIkPLx63WQaNAw=;
        b=OI03q9TBooyPLfH7uVqh9rOsToowPcsfwGmbiCXwuF7i/PBzHS1s/oZQi7XQV9WyIH
         OdIYyzq+84h4ooSlgBwaLMAYsyfVPNGGoZNUdHXwJNy1pvqQFihZm1tPy2E5YuLHn+pc
         Qst91wHKsDA2iXaHbCMv1d/pWXPWpliYc1RmcQT2nMg1gu/A1LsvmgA8ZTOLQkb7b0vV
         99Qdzn+1U6RTkjRhh0voS6Kvp9w4zFaCo4r6q4Eg4mRT87kdcMTObqrpZE7E0yAUU2IJ
         D5/a+JJzcYCbZ+6vrLDOPiBJLTNVg6UcFCRvW+mVM9TTmFjo8XUDf/kvSBb0NcPKR77A
         u94w==
X-Forwarded-Encrypted: i=1; AJvYcCVTPGIV3qBy4qfFlB4HUkxqM1ZRiC6Jgh5p4E9c0Y0YqnHdoaede62TvquWM+AEOwBjkwkRCUeQF5kxggR2+wht@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhi/CpiqvsuyjF+xLU90aCsyBMcQGPEzv1uJMFkn84iPtbCjYT
	20TtO/Gkr6GLfMrp+MC/0mZsEVptmpG3WPUxsZvuxoRI75ckDdvF
X-Gm-Gg: ASbGnctyICeaKm/gkPrFMrbkerN/y0QTBCiLUiCEVACbr32W2P2iGEdxWSgohCO2wog
	J1KzGVKibnFfU4tl3zqfHhcSq+7cELlUxM9bfQqRX3oP717+iQsXc3byx7SpL8NIIHI4CrR1d4g
	tGk+AblK6JAgTJ/0tsG+lwPuWIE3TdVrRGxE1T7R0jmeX3jvrcxMegXCnwlcbaBxVmWwICTHCfZ
	CoSYtDOVvy9YtoU/SGZwChU+1R6TKQat33uTa42k0R8uFZzj2VCfbWSu690v5sO5BkHCA==
X-Google-Smtp-Source: AGHT+IHEL03aH+5l/Jz7FYfrcitsFgP9ffzprpgrgzAbhB/MKzdMCk++VqGl84RAs4ABj585pIWjAA==
X-Received: by 2002:a05:6a00:ad3:b0:71d:f2e3:a878 with SMTP id d2e1a72fcca58-72a8d01e3b4mr4778325b3a.5.1734534854909;
        Wed, 18 Dec 2024 07:14:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918b7c7c1sm8640241b3a.112.2024.12.18.07.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:14:14 -0800 (PST)
Date: Wed, 18 Dec 2024 07:14:13 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	eajames@linux.ibm.com, jdelvare@suse.com, corbet@lwn.net,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	Delphine_CC_Chiu@wiwynn.com, broonie@kernel.org,
	peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
	naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
	patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
	peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/4] dt-bindings: hwmon: intel,crps185: Add to trivial
Message-ID: <4f8c8445-0d98-4905-8cc3-752dba3ec11b@roeck-us.net>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
 <20241217173537.192331-4-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217173537.192331-4-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_071415_947655_3E4C618E 
X-CRM114-Status: GOOD (  10.75  )
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

On Tue, Dec 17, 2024 at 11:35:34AM -0600, Ninad Palsule wrote:
> Add INTEL Common Redundant Power Supply Versions crps185 bindings as
> trivial. The hardware does not have any resources like clocks which are
> required to be included in the device tree.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

Applied.

In the future, please base your patches on a well known baseline.
I had to apply it manually since "git am -3" didn't work.

Thanks,
Guenter

