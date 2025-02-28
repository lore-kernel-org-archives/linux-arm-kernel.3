Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E2FC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YQ9naudC/on4WzCtDGdTRGdiQOMULgcsLU3+45gGqVc=; b=Gc0stIYycNVriANE8/e+mSq+NU
	rdUZyzZPBAFUEU4aa0l5k2j+uNybWm3v5U47PtiYs2JNQtJ61woOz/vNnD+mmuVT0bF3GW/T1me0M
	g6g6ufYM9WLmBlXsZ1EHweQsLEDVeRhEg+MEDZuQorwutn15ZrU7rBDL1jH83RM/T5bO4bxY+wZPc
	lYPBiCEIm5aMbGfBft6s97sZU9q6JTlnOhW8A3sSIRP17T9yTAtd4OcSUtGa9eAfZD0AXuUQ3hXaG
	HV0tZNPfJkdZuvcvvKTGHUoXWW2nAjPs2EAI2E0uWiLQID4B24MTQdO273rQbHfNec2gCVUdFXmy8
	cfdXV+wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8Ai-0000000Cl2S-0rGd;
	Fri, 28 Feb 2025 21:45:28 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to899-0000000CkkQ-3E9K;
	Fri, 28 Feb 2025 21:43:52 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5dedae49c63so4690494a12.0;
        Fri, 28 Feb 2025 13:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779028; x=1741383828; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQ9naudC/on4WzCtDGdTRGdiQOMULgcsLU3+45gGqVc=;
        b=ELdmR64p4xwDhyg1ZY+iYkev5x9WVOFdpfE0nMs0YRxHe8CW0ynE0PsoGajg7Nu1NR
         4Umf48Vf6xuKCb6RMzqdNt3fVlQn/IaDz6bIiEzJ1fJwz49fiwfsH0mdI8jwZB10Easp
         CIW4FbjWIRD0yiikqPqn3hH9noNqpPkMaHMQbU8KUREGFey44r8MgwEC9GWTJT/QJX4k
         Op2K74BebPWrR5VOaNz+fATyDdl0CAdREksqLX4XVcM2hdLq++MwT79Psr2UtLdn+2+x
         Do3Rn1lLn24m8dPN1b+i/caJTDVuLuBj9PbuD8cTrs8Kr2oRjB2efaQ6OjDwQDxA7d8n
         QJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779028; x=1741383828;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQ9naudC/on4WzCtDGdTRGdiQOMULgcsLU3+45gGqVc=;
        b=kZPUNidEi/u5c937oY3Fkq9/gwmINiyVDkFtdvYQl9XJkxbeDdMehPgaoVFdABMf3X
         TR2oI7Jm6wj79YgYqybU7Pmc/542adMASA9+Os08chxXSo0vRWxQ7990Dz/wKqGESfi6
         7RG8ILkDilsY4mt5iwVXbfUSNGVCQq1PBoGV0nmgTTkRnFmqXgKAp7uHNrhcJ/zTE2rl
         GUB+mE88BwRqxvS81D5hEuJNl156M0Z61PndtHmNhnxSBX6NVPL+OhB3MExMIRTF1ES7
         lRSc52ad+/7IpMp9mFx41fGYaeg8aUfKhVmDDONZiig+hkccXMZ6I1sA+/54HeyY/3Bl
         rA1A==
X-Forwarded-Encrypted: i=1; AJvYcCV/wr1slpTmeJMyr2QvA1/kAMMUwDa7C7AXrjpfsMj0y8R81BcY7beaDQi/ULsC7tfgqkMdKK5fC7dusGLnSvA=@lists.infradead.org, AJvYcCVkYmGdEyItJpDKivmRxNaHEVF7XkaW0gwUZmBMQSNWyxdw3OIWv5p0SsPZe/Mwcto3ROBuv1bk8ynriV7Bq/b8@lists.infradead.org
X-Gm-Message-State: AOJu0YzdEf5z1tx5cWpcevR7Q4XNH6OdWt5IyggoLe0NRmmTblmuuiPw
	tZk5SK8cWdY7lDLJcKGZTc2kCSBI8DKHfQF+lAm7+X85aA8dAoTB
X-Gm-Gg: ASbGncvhuLdazHwFNTpqj4uwTGqbaVCVUoHEjDE2lcWhnC4xOPXIfrk4pOO0fTHKydJ
	vkbU8DzI9LLoKXTFrhRoNu9jTxQV001BJqdOyYYwV6TtGCVX83qZ78ELpN9jDG1PumMNGh1eXeo
	fx/0vURmFrUTxRugD11pQCTkyh1zI5XgGHi2YqOHsyWMTLFlb+07OeCxcncamhKo6Ev87DKM/v/
	k7pwc04VmmmaWm3prUas0foLkqrPgONl+d49QPBGaySWoFJI4okNG2UbVcBMvQfn0o/qqLn0jqA
	Hj3HlnpnvWJNTQlFliDylQfzFokEiNwYKm4NwunXg569/udJc2HMNYg7NUdz5Vs7ykGGZyYMbMr
	pNt4LivcNsmRkvzkgqi6eTgSFhBDigZotRx9KBcUtbzaI00btmEk14/qZab7yoECz+lQ614Tl3N
	TX6d8wRRwYmh/UlX3ClA==
X-Google-Smtp-Source: AGHT+IG5iFke5XB4ntF031uTNe8NcrPeox+FQU6eea3I3LTL1bU5Lup/jLn3XOE5UjC7zZR2cc4mkQ==
X-Received: by 2002:a17:907:3d88:b0:abb:a88d:ddaf with SMTP id a640c23a62f3a-abf2682f907mr539780266b.55.1740779028317;
        Fri, 28 Feb 2025 13:43:48 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abf0c0b98d5sm356092666b.11.2025.02.28.13.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:43:47 -0800 (PST)
Message-ID: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Date: Fri, 28 Feb 2025 22:44:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v2 0/8] net: phy: move PHY package code to its own
 source file
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_134351_839919_4857A638 
X-CRM114-Status: GOOD (  11.51  )
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

This series contributes to cleaning up phylib by moving PHY package
related code to its own source file.

v2:
- rename the getters
- add a new header file phylib.h, which is used by PHY drivers only

Heiner Kallweit (8):
  net: phy: move PHY package code from phy_device.c to own source file
  net: phy: add getters for public members in struct phy_package_shared
  net: phy: qca807x: use new phy_package_shared getters
  net: phy: micrel: use new phy_package_shared getters
  net: phy: mediatek: use new phy_package_shared getters
  net: phy: mscc: use new phy_package_shared getters
  net: phy: move PHY package related code from phy.h to phy_package.c
  net: phy: remove remaining PHY package related definitions from phy.h

 drivers/net/phy/Makefile              |   3 +-
 drivers/net/phy/mediatek/mtk-ge-soc.c |   7 +-
 drivers/net/phy/micrel.c              |   9 +-
 drivers/net/phy/mscc/mscc_main.c      |   2 +
 drivers/net/phy/mscc/mscc_ptp.c       |  14 +-
 drivers/net/phy/phy-core.c            |   1 +
 drivers/net/phy/phy_device.c          | 237 -----------------
 drivers/net/phy/phy_package.c         | 350 ++++++++++++++++++++++++++
 drivers/net/phy/phylib-internal.h     |   2 +
 drivers/net/phy/phylib.h              |  28 +++
 drivers/net/phy/qcom/qca807x.c        |  16 +-
 include/linux/phy.h                   | 124 ---------
 12 files changed, 409 insertions(+), 384 deletions(-)
 create mode 100644 drivers/net/phy/phy_package.c
 create mode 100644 drivers/net/phy/phylib.h

-- 
2.48.1


