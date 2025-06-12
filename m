Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC3DC71153
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 21:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nCdRQGm7H/a7r2fssPG4pEF+V61SawrKuUSAco8WEoo=; b=ul/zPUMR5vgAp/H+Z2rd1XIUmb
	xEOe9h2FBvWy/lxqPFyAiLcGp5McgAtjng/u0KOaP4iQZ/kd5JHa7S6bfJ86DcuWUDU8XQCd2uYKf
	gB/8lhIYCifKQw8VHijbEPLv/O19RjuWtUUU7gHZCq0OpECTOb2vvQSux7ot2ZRvOOFLJxHbxXr/E
	jB9jakLSMCx0i5IE0wNbs0tp4DqCngffFa7GxWnElBNKdnye+NnYJ7c6q0ISznG087eYQXv6PnVch
	SudGiBzj7Z67lLtXfaBQ9j+kreNNQr/x8MlysaHUVTeHPlCn80qJ7VkA91e4iiwMjIPM78iEJfBqY
	Dd5/fv4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPphX-0000000EfWb-0fFU;
	Thu, 12 Jun 2025 21:43:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPpPs-0000000EeDC-1McK;
	Thu, 12 Jun 2025 21:24:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so1209644f8f.1;
        Thu, 12 Jun 2025 14:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749763494; x=1750368294; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nCdRQGm7H/a7r2fssPG4pEF+V61SawrKuUSAco8WEoo=;
        b=Pp57LXY9GUVquuyEunprLXn0UQHrkgJpXlyBsToW3/0BYSdsKiIPOTOXumylTXgQ6U
         zSq6GjZpSMzEVHrhP54dQqq5YdN/8DvAPAG8yK35hEYHadSWQ5nDS8yqNHGkf+7KeMBI
         1YRVzVDghrIXLNqmj0lDXhmQ1KqT9ZxSFtZldT0mc7U1sHrRkhC6g9OG/t0N4uiycAQs
         pYL84Plxnsuqj3APGBmOD+MLUhKHNam+Ru3VdQsF13yKviC7sKaeyfkP9PMvt+uR+I+n
         SN4nd8TBOKqnGzg66WzhNSob1/YgSw+LJ9HyIytZxFjA11SVIdrrmcadxEUsQsNb7fb9
         vIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749763494; x=1750368294;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nCdRQGm7H/a7r2fssPG4pEF+V61SawrKuUSAco8WEoo=;
        b=ZSRTLvYEsmjPz3qcVIthQHOyb8feoDGwFl5ODiNac7yw1+kEKXmBZLMLmBdDQbbFK0
         hSGasUAOncl4Kjdzhj3lByACpUUwMZtuZ2zLoOIFm3lvhizc9kkpqLGn7QTiEvsyBO1f
         sTj9L7FJG5fawJkC7gxANJicrBUDu+yVBF4rhE6cqPlanFqc3ZgIV7eFAE1A2sfU8U0h
         t4u4OVeWc+lRqGZe4+WEqt6rEdG0bRFUu2GP25CdbDMaoy7oXOtZNhR52f8BQTHeVGSr
         CgnK/Mn5KD4vf3ozrH5paMWoXD0VEui9IrlNSM7kDJSyJF3ffBgx0RqTkpEqYT70UCFX
         tMpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/Uh7KctsyZ+6wjZVEjiDDhYWx4HzuJqLFWHHnB2XSM9StSno+GG6q+wkrZ6U/3mbMTpQF7kaWHDeseN7FJIKy@lists.infradead.org, AJvYcCWIZmYjL1ivRu0cWk8kIWptqNgnecG+l1yKD8Mch1tOUNQWPuF08ooqKO+euKIoxVwzqgRNdGHJgmTrsuvP5gQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZj12iuCdcZ5VYNzg/JvSZX+R7lw3hWvqxdtkqrDm6XONFhmo7
	pxum8fyQ8JmUUvzc7MrUj34BLa9myt6HAJkIz7heHvq+D4pEjhOcXiU1
X-Gm-Gg: ASbGnctvowSrD03m1TXLF+MagF+zIDi1FaFODDpjhxqCMwyO0+DTPx3l2hGLQ/stNx1
	iczpTD76cf42XAj05ejLndhOS1N2sZe/JiteoB0Sm1CSBKoJ4qLb7B1bcdE+d1+3/+5LBYtlqQn
	2flVzDr2KktBKohJKITnDsQ+ZgzuiBG6esgF4F0Hal5e38jyLzBjSrIV6uJ0GBkchBQQth7ewfZ
	GGuGeg9lySf6k1Ao1RhA0gg6A1EnIUiDKetQsvBi9HJaYiK7UUoaEBzFvCx4UGeJIXCYAZH/9vg
	Qvkr8Koc4kBDCCX2LKWfslqWoqwx5dcvOC9md/UQlg7DFMY9xGv+JVgvDEl4xy16L7co3dcDjI5
	y0aLBdFWAtfRBTDNM77jBo0zQrqxWC6H7Yeem3CyNxyIsRJmh4BGOG1IxJdHrdIFxuETd639539
	4ri2GYNy8oCCBrU8qRJ4xh3qdV5w==
X-Google-Smtp-Source: AGHT+IEDyjt+W1tVeHRtL0gQRYPwvvU0pqeB3cicRl1P7ymc3YBPCaOz2r95S5pJzpgpTXILBSi7mg==
X-Received: by 2002:a5d:64ee:0:b0:3a4:f50a:bd5f with SMTP id ffacd0b85a97d-3a56871b319mr609716f8f.31.1749763494281;
        Thu, 12 Jun 2025 14:24:54 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5? (p200300ea8f223f007533d8b1ff146fe5.dip0.t-ipconnect.de. [2003:ea:8f22:3f00:7533:d8b1:ff14:6fe5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532de8f2e0sm32004255e9.8.2025.06.12.14.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 14:24:53 -0700 (PDT)
Message-ID: <eec346a4-e903-48af-8150-0191932a7a0b@gmail.com>
Date: Thu, 12 Jun 2025 23:25:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/3] net: phy: make phy_package a separate module
To: Andrew Lunn <andrew+netdev@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_142456_423920_E441091C 
X-CRM114-Status: UNSURE (   8.62  )
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

Only a handful of PHY drivers needs the PHY package functionality,
therefore make it a separate module which is built only if needed.

Heiner Kallweit (3):
  net: phy: move __phy_package_[read|write]_mmd to phy_package.c
  net: phy: make phy_package a separate module
  net: phy: add Kconfig symbol PHY_PACKAGE

 drivers/net/phy/Kconfig           |  6 +++
 drivers/net/phy/Makefile          |  3 +-
 drivers/net/phy/mediatek/Kconfig  |  1 +
 drivers/net/phy/phy-core.c        | 75 +++----------------------------
 drivers/net/phy/phy_package.c     | 71 ++++++++++++++++++++++++++++-
 drivers/net/phy/phylib-internal.h |  6 ++-
 drivers/net/phy/qcom/Kconfig      |  1 +
 7 files changed, 91 insertions(+), 72 deletions(-)

-- 
2.49.0




