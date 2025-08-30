Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC59CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 10:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2bEwm3goWEKjvfNy6RAUrtv/iztXuHjnaHOxeoayWGo=; b=0CUNfoJa4B789iz9KHZo7YeHez
	PyuyTQZhXyTWpBCPR8g16+wImg2BK82Ib2yOEz3P9yywTOuClTs+YtPgO4D5qsgGVss2DqiuFg6rG
	A/FHGn1iVojYAsqo2dfT6wFNFDjmED9oY0CTXWf+A1qL3dpml/9l+vNhHBWLjxMbG7hypHSQA0QK7
	gi/dv9hy2o2sdLz2KPjdu+kKxXgyEUjdwjCN423S2ZAOoUeP4Uw4P0mVJs2FvkcGUGwNlA2V83oCQ
	2eeTbnfuV0tERG1rl8l5796hu2u4yxatgHfBUHqoEPgcTqFBiq8ZyQ1Y96sYYnyee6T8fGvVLyMNb
	Zv/dd7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJ1a-00000007l0C-3nUj;
	Sat, 30 Aug 2025 10:41:34 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usImo-00000007jpF-143h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:26:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3d1bf79d7acso259047f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 03:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756549576; x=1757154376; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bEwm3goWEKjvfNy6RAUrtv/iztXuHjnaHOxeoayWGo=;
        b=Mw4J0KQy/gqBpurCTfgiJKpG1FVUZHI5vbvT3mUsRkvu9+DeKwB4uDlDtKQzocdkFN
         TZb25By4spNMwGXmG8sdfNp5ORvMg2gEGbNObwackRazgchqdE4XniSPvfQsnQ36lC6f
         HXu78yJO1EXh433Bgngkm0tgMzQBAfjogJrtRaQ34xvYAm68sOLHGr/1K2mYvsq6NZbB
         cjPRJREL+soO5fqVOSuNBhl+1lpekAIwjfRzY5MCU3EqhHBcAppLtf6Chn19JxbKDL1H
         DWeZgOM0/DP0RuPl0f8j9K3Z+vlWSl6LJEqiKZV6YaKimsw+zr5H7GryOaVTqqSH9G50
         7WOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549576; x=1757154376;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bEwm3goWEKjvfNy6RAUrtv/iztXuHjnaHOxeoayWGo=;
        b=gXlSvDXv+96NM8v28oNr/B8SKlbMwHaFqeTLj2u4xMx5wspeyx37wc/Sw6sHzZIh6A
         T7EGCJ2Ths3HmbAg/CLpZJ1y4JzxJffawP81ciXzWCdMR4CxDjUB6HtvNkh5mY8GkOVy
         VcHvT8QmszofQfXlXjkNWfL8zDtnk8hBJ7f1WYyyrLB2ZedcfKW0rClW9eb4bcP0SJGA
         HhZ7NZfxG7kC0BZjumu8Qh5AP6hwdjyxx0BboPzzluHTc2tqVtkAto+ASeWPLmgcfS/t
         B00yiMKPEqI5tSFoJ5Tl0ANqmWHmYbOBwRM4kjl6/bHTeCKsS4e3V1k8oiIXNVREGobn
         2rvg==
X-Gm-Message-State: AOJu0YwZYXelTnnlqKmE3jbk8Se2neOSNYaVRBMJXp7qmYIXTFa61C5K
	vXBdcDWf1YrXeuWa/02yxQRAi+Yafea14p0LaBjEwQNrgtdYkc2U8nvx
X-Gm-Gg: ASbGncuK94RZo9EjDcGi4TMM05Pz9aXgOivNZDaaCUIR+w9QgoFr+Xygz1b3crUK24z
	ixV8OyOGXKW9iirloAvzdMQQV3NPlbUjVTwytjar+soAovtP0ABD9S5xwB9hCACs+FAOar/uRGM
	/jc8ls0UMsBj0Mc4llweKDBVFkyRc26uBmT4SwII4Nxc/xiHQ2/IEM9NHW53WKqoSxDBxcp1v6+
	pukPvSurRqElqebAYsxtX2XzFhm8/ljJZpPpJMJG3Z50660qVGi0Gi21xsjiPpnGjZ0a3OMYfnP
	vYbxo1ggmXWb/W+LRI1mdfT+NtK3twnGB/9PLPwjgyQSMjW/RsJtgO9EoHLfNTGAc28dGC+5MNY
	mSywmscY7asmnevT3DQk0qODF/yXX+Dw+cxSjpVIT1RRCLUs9/3aZdnOY09XH1veWs+zze3y/Ii
	lJUa+YLZ5YOSFLeB6arfpHu6FfhDmpMhNRO9iJ3u9gDwe/K8FvDL1cqvgfhxcnzAdkJXA=
X-Google-Smtp-Source: AGHT+IESiXAPYaondigOOaobHYodOgUU55bDiY3IYU0ShHDYf19GplKbo7wficGsorW+hMbiIFY+kQ==
X-Received: by 2002:a05:6000:4605:b0:3d2:3408:3b70 with SMTP id ffacd0b85a97d-3d234083c72mr932252f8f.13.1756549575580;
        Sat, 30 Aug 2025 03:26:15 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:9b00:80c:a2fc:7bcf:3a2? (p200300ea8f2f9b00080ca2fc7bcf03a2.dip0.t-ipconnect.de. [2003:ea:8f2f:9b00:80c:a2fc:7bcf:3a2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3cf270fc34esm6767166f8f.10.2025.08.30.03.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 03:26:15 -0700 (PDT)
Message-ID: <a3c2f8d3-36e6-4411-9526-78abbc60e1da@gmail.com>
Date: Sat, 30 Aug 2025 12:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/5] net: phy: remove support for deprecated
 array-style fixed-link binding
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_032618_299638_5F295926 
X-CRM114-Status: UNSURE (   8.61  )
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

The array-style fixed-link binding has been marked deprecated for more
than 10 yrs. See e.g. 91c1d980d601 ("Documentation: devicetree: add old
and deprecated 'fixed-link'") from 2014.

So migrate the remaining few in-kernel users of the old binding,
and remove for it.

Heiner Kallweit (5):
  arm64: dts: ls1043a-qds: switch to new fixed-link binding
  ARM: dts: ls1021a: switch to new fixed-link binding
  ARM: dts: st: switch to new fixed-link binding
  net: mdio: remove support for old fixed-link binding
  net: phy: phylink: remove support for deprecated fixed-link-binding

 arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts      |  5 +++-
 arch/arm/boot/dts/st/stih418-b2199.dts        |  5 +++-
 arch/arm/boot/dts/st/stihxxx-b2120.dtsi       |  5 +++-
 .../boot/dts/freescale/fsl-ls1043a-qds.dts    |  5 +++-
 drivers/net/mdio/of_mdio.c                    | 26 -------------------
 drivers/net/phy/phylink.c                     | 25 +-----------------
 6 files changed, 17 insertions(+), 54 deletions(-)

-- 
2.51.0


