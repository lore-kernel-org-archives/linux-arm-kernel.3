Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9AFC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n/HcLc1vBRDNLkVs/ylW8/ztC8KcpMW5l5ZyrlNLue4=; b=uNkXL+2gICQtdJDxo3T3OMB/rl
	ZG5w0WvP+cz5BWKPauQ1cQOkO0DiLn3Sq53FMDX1Ak81/KMbINFExFEqz0OQTj5uEORF4ErSIeLVx
	ZAg788dXduBinAyZxu3cnlz6YaRvnEkYEPtw9XB/TLhdxd8+amxXBOI/nkEX0knvR0GvC9sQHGrHN
	FVXwrxhBi9U5/P3/PxYtMNzuV70UbvgJIcGqLt+o9sQgel5FVjZ7PykgpT6J1jhqOu3AYnKFx+au+
	oB27U9SjQxvPo6NXaaPYR6LdJWFE4S0aRvCJbT/wU59gm/pZLMOHhbQypQ//iYV0HXcmm/yLPF/cd
	9Vi6DsbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrEu-0000000F4BQ-1vs6;
	Wed, 19 Feb 2025 21:04:16 +0000
Received: from mail-ed1-f52.google.com ([209.85.208.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrBu-0000000F3IA-3v4Z;
	Wed, 19 Feb 2025 21:01:12 +0000
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so505791a12.1;
        Wed, 19 Feb 2025 13:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739998868; x=1740603668; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n/HcLc1vBRDNLkVs/ylW8/ztC8KcpMW5l5ZyrlNLue4=;
        b=BXfhcCLlpNMEpLSZbA47J2EzfTRFhDYurSSTInsroTWCnQEXnReRxgw3Mc6UBHhrqc
         vKVO0IHpCQ/FGl0oBd49hCmzLThXmjqA/QkFnSmq0Ib0BHzOn8T52QG9Orl8KoRPGTEH
         iNm4HMtwpsL0fyzLyOiEMVbYMVrnOhJOdVX4Gy6bk+Nkb1BfKzdYuA6nDNa3PtT4kL92
         aFmlvxmllwKNSoPilFyr3sM7TzozQvL8CTA8U9Vzw0to2M4O8c4rN8UICnbsyUpJWHDQ
         10pkoAqmZ9kIQYh+2pFGb1PIXmLjcIeDEHnxlL5io4WabnkyzAD3VJotDr6dntIKPqbg
         jOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739998868; x=1740603668;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/HcLc1vBRDNLkVs/ylW8/ztC8KcpMW5l5ZyrlNLue4=;
        b=RkGW037Wf8gJI76gN+oAm0IcW3ZwU/De6JCYJvVmD1TsiCGJpWdBG+rsrk6wD+yrI9
         fvE3hLEDrhXHH85wtNjQsNvK+/BD2KtmN6MZgLlpKajt6UpgiwcNGSfmQAhCX67idhMW
         LSIhxMtZXerR90rmgTrAGGrSzTfgR1upFql4DfpvnyXAFSXmsH7QdrrcA24CAq3+eHKO
         QgpuK9MEdfKL1iGS3YfPFVkA/mkoY+Wp+YML8+X6ByOsVwyI7L0J8O3GYbR5ExRRRCUn
         xuEIJwJEBxAX1I/n74zHZ33Suj2apoFEIVs9Na+CZdZULq/zPwjdOeHMZWCGPBQEoeO0
         8ECw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2Obo+zrKtL6mabxwluQ/N5Dl9Pp6izAi0cvC8UdTAgI5IC7Id3VsvQ3qt6JeO96VW/uX3teg8a27S/gNwoc=@lists.infradead.org, AJvYcCXCwJXquMNsyml/cuDwwFSLqweX8K9bgjJsehOJJsiNfIHjjhn41VPDHxcUx8SgsnhWNHLhG+breBH/wNugtjTR@lists.infradead.org
X-Gm-Message-State: AOJu0YzSKhP9zp2I7fWspbkml/uuEgcgFnQT0tZd9gVwnFB+dciUE43P
	Dsc/kZ79axeAZN3mOUUE32HNCrr7ektjSLmYi+XOHsjB3tXimF9T
X-Gm-Gg: ASbGncv4f/HzVJDUVlPrCbLnBWXPja/Juu8X6IFyPJc/cUf7HtlEijj5k57IxfGb6C/
	qr8o66FyXhN0K4bkT20z3Qi55kL5qYQ1Iu63CDupN6lTgA+sbcpWUY/fvoReJnmxlkWfTZlZS4q
	rAkejXw1Hy/xvQQ6R0/bHVV45J3yARu+n/NcoOEBG9rn15DMNZpzMChvzGFbyGYc4A6W8U1gB0i
	WDWCcArhVusmbi0cZ/zn1mcZjPBw2ofViH6JjEoPG4cIxxl7rIB0Eh7J7ejVqLy0F3JocaPaOQD
	6M2A+ZyE3/0ks9wAEeuFD6VcH5LVOMfBDAQMYRMgFFB6mdBWHR7inylSzS6GwrIsqtuURrCGa+B
	TGz9SWejzrsB1tmSocLgBVj2DHNHIm9ni1yAJgnllVM3rX+v+ssL0FzvnuoeEdyDMMcx2iLPHOi
	hukfyunzY=
X-Google-Smtp-Source: AGHT+IH9ZMq8ky2erXIOhsHzCfqhRS36ZUg26/HaCIV4syGcJuFX40SQztd94cUQWV3y4A8uHd5E5g==
X-Received: by 2002:a05:6402:1d4f:b0:5de:d932:a54c with SMTP id 4fb4d7f45d1cf-5e0a1200077mr873058a12.2.1739998868275;
        Wed, 19 Feb 2025 13:01:08 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece28808fsm10877033a12.75.2025.02.19.13.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:01:07 -0800 (PST)
Message-ID: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Date: Wed, 19 Feb 2025 22:01:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/8] net: phy: move PHY package code to its own
 source file
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_130110_996353_4BA8C2E6 
X-CRM114-Status: UNSURE (   9.78  )
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

This series contributes to cleaning up phylib by moving PHY package
related code to its own source file.

Heiner Kallweit (8):
  net: phy: move PHY package code from phy_device.c to own source file
  net: phy: move PHY package related code from phy.h to phy_package.c
  net: phy: add getters for public members in struct phy_package_shared
  net: phy: qca807x: use new phy_package_shared getters
  net: phy: micrel: use new phy_package_shared getters
  net: phy: mtk-ge-soc: use new phy_package_shared getters
  net: phy: mscc: use new phy_package_shared getters
  net: phy: make struct phy_package_shared private to phylib

 drivers/net/phy/Makefile              |   3 +-
 drivers/net/phy/mediatek/mtk-ge-soc.c |  10 +-
 drivers/net/phy/micrel.c              |  12 +-
 drivers/net/phy/mscc/mscc_ptp.c       |  15 +-
 drivers/net/phy/phy_device.c          | 237 ------------------
 drivers/net/phy/phy_package.c         | 348 ++++++++++++++++++++++++++
 drivers/net/phy/qcom/qca807x.c        |  20 +-
 include/linux/phy.h                   | 125 +--------
 8 files changed, 396 insertions(+), 374 deletions(-)
 create mode 100644 drivers/net/phy/phy_package.c

-- 
2.48.1


