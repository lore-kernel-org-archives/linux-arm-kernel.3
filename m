Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A7EC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 11:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BW4uLn5drWL4uMiqxENZomGBK16riTSXmRDtWBO7MFg=; b=HHZ35fcoMJgZvkGu+baQJIIKdW
	2t5RR9CSDF8UWKx9RQkuP+X3mXW5oxdc8DjFwlpY4A7jrFupZMbn8YVoSOdARUC0mIf0jzcYasg/5
	+MRoum6uCGB9mFSTXwa0J7dBAs8LQ/eEyaLg8bOStrEhvkU2YHumL/ywVmolY5PrhFFqDEPiOFiEo
	V5sr8ahtVukLSf8VYEzgBFowGxj0BPxL/71FbObnEI4Gu53W1eyb4vcFZLCOWP95lJn+C1X5f4yh/
	fHPUmJWW+aOF3U6idl//ALebXcTo4GdPMnje+RsvcNYuiaydpDMXowdgcFmADKKsZtb9/Z+t0GyJg
	aVlTf4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toKrm-0000000DpTN-0P3T;
	Sat, 01 Mar 2025 11:18:46 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toKoU-0000000DpDI-0xhe;
	Sat, 01 Mar 2025 11:15:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-390eb7c1024so1453062f8f.0;
        Sat, 01 Mar 2025 03:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740827720; x=1741432520; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BW4uLn5drWL4uMiqxENZomGBK16riTSXmRDtWBO7MFg=;
        b=UQ+sRzS/W9axo4YzIvCnZ12/A+iYA42OEmDjubQX42RDncqlQMMcXqdrgnWkydx2Ja
         aXstCNZ8b0l8txgX0mUUGu5uL6TSKZAABTvdddlSd8TcFEjNfVgEwUp7scL5MkkfA7Cy
         roJrMz2mf5wqi1LkGYY9IEA1KwhNDr/PZXJ3XOWOtX4RgvMy+hiXkl6ui6KVl+ZdgFr/
         CVmdHSRjiIs6S+uBSdZZfYgj5Zqc/TSPWkAlfEQGfIZ5s/xR0YNnzORDo2MCK0NwYW+/
         tgL4Pb9Vz0W9kmY38NgrcWxUkAYl16YzuSv3yPynPLVWGpFqb8WV3PYa5vitVc8EiOOb
         0Wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740827720; x=1741432520;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BW4uLn5drWL4uMiqxENZomGBK16riTSXmRDtWBO7MFg=;
        b=pVGgj2jTr1fJlwsRwu2YV1e0vzuAAaUqJrGqxfBztTnCu3Gvgi+ARDI5Ik6d16pWSE
         6LKzk55g/ma0F6UQLmw5l9E0XX5TE2fUV3WtgJeX6LWYuI3r0+8R2k1dH4R0JrqyF5Nd
         ml7r0TkNqOsUbLtbWyqBQ4EJnRa3joJNlB3seFAaBbUN7VejCC3USWdZ01/pFzQcA11J
         p7+kLFuM40tPGuu3v4iIUwXnglfuy74cOrvJ5rVBdTljRw9P8SMXIFoB1dc4+m9MoCFR
         F9V3Wa7tMA+EcgVbvDuiHa7BdCJORGkmNjt+JUtfu1aMKqdfPnvCpuAe391lUzdlyfbz
         emcA==
X-Forwarded-Encrypted: i=1; AJvYcCUDQeO4UMri5eVdF51HPXH2PMynbMvzuRxsnAm2ZGAO9gxBBO565VLR7qsCBdNu9V4XHlKlHPzSTNaNnVxKzlYV@lists.infradead.org, AJvYcCVyVKxjiYb9iKbh6BpEXHcJrXN8RxZ2gc3Ld/5H7OXhKRz+wbtKUFvuB+ZMlXMMJqKxv2Cl4pdm3Fto99dz6NI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Hr3xSpeGO0NjGRlZ4dT7mAaPbLRewe9Jr89BJUkPhfYnZ4vy
	CkGmiYziiEwwBHcyh1J63T4yJkyB84xFVSZA1MChUaUqKz9VOYcX
X-Gm-Gg: ASbGncsRoI9dMWEgmyinZVxLx/4uLOpuqKiq3wMZdFVTvVGyhDIrjHnq7hfjX95U8pW
	lfoXG5u3vkpJkBOg/gQrmtzHKMxri7QuvuR6DgEg9tmmBpYLweBwHlYNQpvmo9t99gov+IpzSZ5
	bCygxytPOZhq/SPU8LdHIjl6VOaaAAAFRX6ooWVph2cqxinTl6ljFkiblBkl7ANsmEWFvxapaM7
	aOffrjrppi16ymPh1BlgqHxEDvM8coIJ0do56tbp0lzM2nkdULcHILccPVFyOXhB8/xfwELvbo8
	HKwO69xVdtPRlnt8/z+CptuzNsYGV8fqZjf1XrxZSSb1WVmceHjiIEFfJstHC1lORuzDlTH/cb6
	R+wUjRsfwdT2JCC1TtxQyHhfawhsO4KVXu4n6VTTOkMiIf63x4ho7r1pZfE1p4tBsiuCfKB0u6v
	LXeCOVVH/LezLnYuh43NOpT+9NAL9JGss=
X-Google-Smtp-Source: AGHT+IGpmQtc55e2rC0oDiMpjZuvVLvExfxez2ECnJVlr1ZHQqc8FlYuHJBAHPH2pgPyr2wvBEnbSQ==
X-Received: by 2002:a5d:6d0f:0:b0:390:e158:a1b8 with SMTP id ffacd0b85a97d-390eca34b3bmr7538068f8f.43.1740827720123;
        Sat, 01 Mar 2025 03:15:20 -0800 (PST)
Received: from ?IPV6:2a02:3100:a9db:600:159b:603:111e:5ffd? (dynamic-2a02-3100-a9db-0600-159b-0603-111e-5ffd.310.pool.telefonica.de. [2a02:3100:a9db:600:159b:603:111e:5ffd])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-390e4795962sm8309523f8f.13.2025.03.01.03.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Mar 2025 03:15:19 -0800 (PST)
Message-ID: <6cb88f4b-15c9-4b6c-8226-63442b79492c@gmail.com>
Date: Sat, 1 Mar 2025 12:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/8] net: phy: move PHY package code to its
 own source file
From: Heiner Kallweit <hkallweit1@gmail.com>
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
References: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_031522_282860_FD5CDA79 
X-CRM114-Status: GOOD (  14.63  )
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

On 28.02.2025 22:44, Heiner Kallweit wrote:
> This series contributes to cleaning up phylib by moving PHY package
> related code to its own source file.
> 
> v2:
> - rename the getters
> - add a new header file phylib.h, which is used by PHY drivers only
> 
> Heiner Kallweit (8):
>   net: phy: move PHY package code from phy_device.c to own source file
>   net: phy: add getters for public members in struct phy_package_shared
>   net: phy: qca807x: use new phy_package_shared getters
>   net: phy: micrel: use new phy_package_shared getters
>   net: phy: mediatek: use new phy_package_shared getters
>   net: phy: mscc: use new phy_package_shared getters
>   net: phy: move PHY package related code from phy.h to phy_package.c
>   net: phy: remove remaining PHY package related definitions from phy.h
> 
>  drivers/net/phy/Makefile              |   3 +-
>  drivers/net/phy/mediatek/mtk-ge-soc.c |   7 +-
>  drivers/net/phy/micrel.c              |   9 +-
>  drivers/net/phy/mscc/mscc_main.c      |   2 +
>  drivers/net/phy/mscc/mscc_ptp.c       |  14 +-
>  drivers/net/phy/phy-core.c            |   1 +
>  drivers/net/phy/phy_device.c          | 237 -----------------
>  drivers/net/phy/phy_package.c         | 350 ++++++++++++++++++++++++++
>  drivers/net/phy/phylib-internal.h     |   2 +
>  drivers/net/phy/phylib.h              |  28 +++
>  drivers/net/phy/qcom/qca807x.c        |  16 +-
>  include/linux/phy.h                   | 124 ---------
>  12 files changed, 409 insertions(+), 384 deletions(-)
>  create mode 100644 drivers/net/phy/phy_package.c
>  create mode 100644 drivers/net/phy/phylib.h
> 

CI is complaining about one issue in patch 7 which I have to correct.
Will wait for other feedback before resubmitting.
--
pw-bot: cr


