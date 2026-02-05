Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1E3E9129A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 15:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Z2JM3rR4cPCO2FOOdwxN1xqlEFiU78ZSmQj8D7T2YE=; b=dsZ9Yj3JbAbwqw3wRirAY0lvwJ
	igp+DatAOuIY9bALl6Ymtj4WDAH10axtK4Bg+EKSJ24idRwtd2eKRBKyut/O1w7Z1nTZnkcANwIz4
	1jDaXe1jxiactO8wENz7IKYyQGe3n8YDyIutwZW4CHTw/fheE5eS0VvRG+uqmDYykJ/4x+BJ/BHTB
	nI6TC9ZUAPhdTv1Um+H6K3OFy0d4Qr35uCvQnKjiY8Q9ykk1LNNvoyBPutCTsUfYWXeARVBXtjsXl
	vyTsgactGvlrQ2VKo2Bm9Kt9V1H0FwyUHca7WV3mhjZLoPJwq24zcY0JAbLLjzzUcOjPGzz9yfnh/
	gr8Tt0aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo17Z-0000000A7uJ-0RCG;
	Thu, 05 Feb 2026 15:18:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo17U-0000000A7t9-3FCo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 15:18:15 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48068127f00so10195205e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 07:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770304691; x=1770909491; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z2JM3rR4cPCO2FOOdwxN1xqlEFiU78ZSmQj8D7T2YE=;
        b=Q1ouaAWVWIUTrGtnjsIE2ia3X0anpn9+nBZLKj8vqom72bpyz6mHhLhmu0i9DmfH3n
         9e2A4BZmDQTg+lnqMgqcW8Eermnva53bykGIuxK8UmLous8vNZHRvQgbULSinOfi9bFw
         ImyZ94HlHloFQ7NFzUOesjD2+zEhRVwyulySRMIOTHZxoG/80bKaex7qwIT/e3lKpifq
         kSLJYF94Ej4iV8glWX1OIBRO3v4wvSVlAsYSFqcqFhML3ZNH/3SR3jWIeGaEJTw0OYTM
         o0ltDw76IkLgAYnhiWfCNGaH7iYlKXCYMyyHBcx5tbHxAh3iF6NQYmKct50zxOSmRyA4
         BeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770304691; x=1770909491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Z2JM3rR4cPCO2FOOdwxN1xqlEFiU78ZSmQj8D7T2YE=;
        b=iwmDfstTb/aR5GdOVOX0xWitN4aKJzwBjdyaMKVKzGXKfCeX+jd0qBeo5IpWWJoDYH
         u5i6uDlVCmFJOP/QyafrTwThDTyaQl7qzhXLK0K1byaNEopQOrkfq4d3sLbqKhu0nUz8
         QyQWTYOLSD6HFimF6RB477feZCJhiruXaatAPzHXxK6XrjnvTUf3YOOvU5fGFk2rShsn
         t5XQ2QSPBPq9rk4RSAlIQpGexq+2WU8KjP1J8RklUGsdejO6QzgTyczgorGVFDnz/+o6
         8gEUNOEyi/YvduYpzd/sjZiOOUJlnFlUzzhnHN2E5yx34vkAT3hZe4X2UlNxF27imTA8
         EVig==
X-Forwarded-Encrypted: i=1; AJvYcCWDb/q9h3CaskXiOv7sIY1A17HC8OV4ATSdHpPkHTKxn4kZV//2tvHe4eFVyGWay643N7c+ZMigvsVfwdz1LWTx@lists.infradead.org
X-Gm-Message-State: AOJu0YyXqzfqWm1lj6jDRKyVseYN+hnEM+9jow/4NCAXtQQK8nCMAR/u
	W+ZmSDZpwQlStLx0WnQNKu03yqNoWUJUPQT2SY58lTQI4tnw/ppQqn5y
X-Gm-Gg: AZuq6aId9JUt85xDjqaUzN3Zb4mq0UTGK/9rQmpardhIXE6DyFfs/oG9AUW/voXLaUA
	KtfJieqM5ImE0RCZpeU481syNW4itcbRkZTNjlUXdZDaJxtqCqUZfgc+JbtT08CugkPeYqRW9LX
	19ZvYGF5gypZu0BzmSGqa0+lrSZdvbSX94ZEPBSBI1KAoxhk/rGzmEzpr+Gu+0dcYxpZrdoBox/
	TVz+TVVXZWeiN4hAnxWIDK1CnDQvD3VMCPkuCOsyi2bFfz3x1PSNxEOKTM+Cbfw6rQjVkbuRew4
	L1dxQaI2OtKyU4ZuF4ktSqvR0x1SCiIfpJpEasSnJUoI4F03k1oN8wdA722Sk/Byd4nhdeOT3M9
	Oj4gDjQixkoa6BwLY7Tjb7zNcBt1Xiy/lphNU8btVzdemUtolwWtJVtIeSj40tbdfIr1SefvxFW
	dotvgauot3nmT00vLk7MRryoiV4zMafEPjo6vUcQFlv7rlLoOlR50AbvlkVixYLJx91u3NwrFP6
	f6jLRwFf3uG6EkHfY1jCYy9CB9mEuMJdzw=
X-Received: by 2002:a05:600c:6290:b0:47e:e91d:73c0 with SMTP id 5b1f17b1804b1-4830e9669b9mr94695125e9.19.1770304690503;
        Thu, 05 Feb 2026 07:18:10 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe6a99esm60711595e9.7.2026.02.05.07.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:18:10 -0800 (PST)
Date: Thu, 5 Feb 2026 16:18:07 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 0/3] Add support for Variscite DART-MX91 and Sonata
 board
Message-ID: <aYS0r9jxzyh1567Z@Lord-Beerus.station>
References: <20260205100125.9095-1-stefano.r@variscite.com>
 <aYSykvmfuYrJhsR5@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYSykvmfuYrJhsR5@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_071812_841232_55158C33 
X-CRM114-Status: GOOD (  10.32  )
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

On Thu, Feb 05, 2026 at 10:09:06AM -0500, Frank Li wrote:
> 
> where your v2 change log?
> 
> Frank
> >

Hi,

thanks for pointing that out, my mistake.

Would you prefer me to resend the same v2 series with an updated
v2 changelog in the cover letter, or handle it differently?

Best regards,
Stefano

