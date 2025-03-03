Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5D2C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 20:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uWxfPZ9Q9PKdspux27aAUMfhltwVPuv3Rq9ADQuniAM=; b=hxRaWFy1JFeWM9vb25oqkq9/sU
	vSQKbcYxpaAUm1DjmiAc0/6qwK9motu9x9CJBCgtC97girz+Kl3gwczFiPiI1kNqSUeD7Su8cMHsC
	1pzebxBYhoUfoql3hcOSGQ6gl+2dj27h6BrpyJ+447Ty65++x2xvvdn8tVGPfiSOzHqaO+pi8QFfF
	UDbJiOWhearo+WMGXGfFbo8tXvgXVqQw6POPO1LalU5ldiVHzYZ6n7KZ+7glxqMLlhQRQNlRyA9uB
	Z3V5THyOOBaejnh4YR4JltX9MQQ0YJzSnILKPs33008ZLMTLQFfEtiEhEjWslhHjmf0sf78819r9l
	vSU58kwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpCAU-00000002AUp-2phA;
	Mon, 03 Mar 2025 20:13:38 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpC8u-000000029oq-2d1w;
	Mon, 03 Mar 2025 20:12:01 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so31227075e9.3;
        Mon, 03 Mar 2025 12:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032719; x=1741637519; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uWxfPZ9Q9PKdspux27aAUMfhltwVPuv3Rq9ADQuniAM=;
        b=YwonZOfM3zXqRNmvZlSQjPTJ1wRe8BZhd7aNV3RtilZFtrUXdQJF4D1bGa6ch4dG1O
         j3zL/8cFrTZnmM4OrsIfch1tn/bAd0WQOsE5h9tOtVPvbRzY1okyTF2Abe2p28r/0if3
         b4d/T4LND9Z2womdP0g78DjfWqNNBl2+qsoHjDnlPNIyhLVEqK2lRWOx87ZdKBq6J6vQ
         g6uwuTIgk9iZY0hJ6/HBY4VKyqt+e8M2IdbO4vI4ROsS4wY8Wy5GepYpCcC6anNt31UB
         PIB5kBihPJEpwubsk/QTTFQEQuNbwJwyI1Qrvs55ZK6l5MYdkNJHx/oddsQu/l7LezTU
         K+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032719; x=1741637519;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uWxfPZ9Q9PKdspux27aAUMfhltwVPuv3Rq9ADQuniAM=;
        b=UF4ThNY/TbmdT39R8jG0HOjRyWrqNS2VCXuDZ14UGBFSJDx//y7cV+TEqElHs2RvjK
         xwNFlDy5X9Mb6t+1tTnZz4mL5uIDxb/I4kGueJPmUMJ2d9rNm3bGxrSHFkV5rv2wkdc9
         wuAuwHPc2h+Xq5tARBxjwNHjo3/qc3OF+V0/ea0lfFWmBLa6ehrh0mVMUoVo91ktsSDX
         NXACl1+g/vZoxOrfLwIbSwJfwJQuGOy/46dZMY1ZU7UWCOnKH+q9LZhGYIGugiRGyJiz
         RFst8qFE2ueBKpm3ybmneq+eP2KE3YYMeDANacDuhpxChcTlqyXudg/uAUyHQ3DU8bcv
         QyKg==
X-Forwarded-Encrypted: i=1; AJvYcCX8RqSmGRRuE0h4WWJFt7k0/53bmXgEcQ3/xFdVp8vaxBrLb6YOmsb3+YntxTrnfdXN8VReVlEtdLRKgolPQBUq@lists.infradead.org, AJvYcCXnuxFXuzpY/wgn0OnAk91Dcp0Vpz0ggI2KWLnz8PFaY4QwsmhKbnE3vGv1Kf+0gvyoSBAdfISEsUfoQdencuk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyK6O1fpBwqrWCQaiEGiGRPAsexJp7wJUdvTtI3OrHoCMLHcmT6
	fpYXven4gphYZgjb/GHXCdW3pw+499jLuvg2xaQ2aDYOpGY+I/Ou
X-Gm-Gg: ASbGncszX+wwGz8jHo4RbAXyA8DND0ESAPZ2s1BFkOT6g75Nt/ppfInbKN3/peYrTwH
	AWDQOcaRdc4darkeBtMDTJFTwbQWF+shjVpvUP1wD/WCU+IOBOptz9rliO4VAoP/aToOegBLHmq
	1B+Bmohj0LeY7fV0n8GtsWDdK++lHZlXJYkyFTaJjN33cvCQ457GUvKc9bZdDkFFuzpmMQHZiUt
	BrlLDGdWLGtB4e5ElEuDjMKVTIZ8SKA+Ruby0ASqd2ZDPWifSTeEHKKmx8i3R+4Flt7nsFqShYl
	7svQrKcDvX7BAJRJiVt2dDYwQKICl7Y4DrMpcHYl/9DNAny7OzshJ4A+Y7//GMHX4DFVH0Slign
	s6CohqJBtqdd9kXUFMsLKNCOwBPmbjJmPclTFSTHgS3y6LknTgGpBRxi9SwJh9y3q6WjofP/cSC
	AvYsr1ohAo9j0txZkOEJDXxYwUUD4V1/uRZHVs
X-Google-Smtp-Source: AGHT+IGrliRmZWsiNQ1SKtuhzNkpQ2g/Wj6wuMuWur5bf49+A4+rdLUGngy6KWs9s/OHdhPuU7bzng==
X-Received: by 2002:a05:6000:18ac:b0:391:454:5eb8 with SMTP id ffacd0b85a97d-3910454634cmr6485950f8f.48.1741032718374;
        Mon, 03 Mar 2025 12:11:58 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43b736f75c6sm169721715e9.1.2025.03.03.12.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:11:57 -0800 (PST)
Message-ID: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Date: Mon, 3 Mar 2025 21:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next v3 0/8] net: phy: move PHY package code to its own
 source file
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Rosen Penev <rosenp@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_121200_673368_F83DC26C 
X-CRM114-Status: GOOD (  11.58  )
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
v3:
- include phylib.h in bcm54140.c

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
 drivers/net/phy/bcm54140.c            |   1 +
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
 13 files changed, 410 insertions(+), 384 deletions(-)
 create mode 100644 drivers/net/phy/phy_package.c
 create mode 100644 drivers/net/phy/phylib.h

-- 
2.48.1


