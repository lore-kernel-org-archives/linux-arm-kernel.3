Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7635CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Sep 2025 21:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EV+MWhbWq2Q6vqymybluCls4t1NNkCevTKd69KW1i7o=; b=C0ApUgxcm7018K/e6xuhWxwYOh
	JtuP/DnrXSklcgfBWY5dl1DE2OTPlyrUYNxdCNydtQrxeijBkN/rzMr3NCNMjQjmZrJ9+RbucS9Xk
	MGTzTQqRoC8blr4vu2G3hs7ODThS0qnr39mgDV5z65cRwZJjTxmhwClS1+ckwPkJnL0WARBw/zITV
	KaCBnJWVbDME5UfVOGOuFmK/iH7DCPkI9rufEZoXWIqa5xIeccIkSEdllOJ0WO/NCjoqaRsyG1asm
	ZAaXABKT5Bkm0lC5zSZ+xhsfXVFSdFKE8JUHk6MdIIoIeK3mmcHju5fxrqGEXirmIwnU2NkU2qbpI
	SGdxjNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RH3-00000008E29-05En;
	Sun, 21 Sep 2025 21:07:09 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RGz-00000008Dzl-0ZUb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Sep 2025 21:07:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-267facf9b58so27015575ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Sep 2025 14:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758488824; x=1759093624; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EV+MWhbWq2Q6vqymybluCls4t1NNkCevTKd69KW1i7o=;
        b=CJ/4UGOeBOStd4qSfj3MVXT+ZhaffWFWQnkfhz5wDo8y9NraVbYm523N96jFh+ckbD
         gSVF93sKsN20b7R3Qjkj80yPP08igahBwoWRk/A5xRL40s76RBJmrKxcJx+nNz+bdoAD
         AXLTqLFFIqM12CiJsH/+77bSOhvSaAtWfiOLwQk3fn+b5ZgOnpwTgpQ871isDdgpHABv
         +TC+zovUdbfvwZmVaH5M5X6KCGG9Jn5jEejFtuOBTrwt4ZEPg6jVqidVc79YkzrJ4UvM
         hCd0PnjJAeTqDfg0Ck4JRmOYit3zHKjEsgtVOsbXQXDA/TR30M5f2FDQoRFY7cCZxy9x
         hDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758488824; x=1759093624;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EV+MWhbWq2Q6vqymybluCls4t1NNkCevTKd69KW1i7o=;
        b=Ks9r1lJxWY5qeVQMhGYHLtfLwJ/DvKVR0D+8WJzX9Zz3St+QnOGOphxI4AlQdYdE2W
         v6557Owr+KSPul9KolUL41CrGaU54xzeAkx3PEKm8mrQSwDLKAlzYCf1VN/zlqIt+vMu
         wmNjuhm1fjF4MpmA3FpoihTE5BB8lLffwgxaJMZBnOwz5ZJWNbAoHvjBbu3J0FMMQ4p2
         nR8KojpT3vjESesQWC1soxNByDGBXeDo+0JlAQwU0/L0H3/3q2GSl823qxWyOJMyJLzP
         IgCX+wb+Y0/OkcU+3LeEhFiMeJ/p179vVYLO+xBcNJ8OAhZKKYV/bwPvDi9c1Hfpc4aS
         NrgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb1GCMysYAxG4l2Nb6mrEXYNvZfRZr89Z2h1YPsLuYejda0f4/N/bzVDFGRBtUerD6qWVTOzu1yB6c68aGDby9@lists.infradead.org
X-Gm-Message-State: AOJu0YxJy+VqrNFAn1LwXHBgIJvuQ0Y7M1jtkY3bVyVNLR5Li3/BWnDS
	gcY5Ik4YjRbBGgZ17ekRlK610Ef4JHetdzBbkJHFprVPRR1Zvtr81ua6
X-Gm-Gg: ASbGncuh8soqQgC4AGpLnqiMv801OL1hkN3Gg6RquPePwv/xX7ydBEU1dDKfkKSqt4z
	ymmO8Ak92ytDpU/spuGZDbPTecRL6KkdXSg0YAHfhw6lagAoI0DSqKbdoiLDKafVqo2HAEWVREz
	N9nJymCJ7v/MqgO46DuzMsBx8J67tCsDoo9F8+DZaLaFYLS0Zcte7EBG/49RgonOHkGFiJaENHN
	otzovSLDWIMkqTInID75HMBJndoHPOWYEJHgE9cEIfXkiNM3iwwxR7V7ILB0AQuasKTNeGv6/o/
	Bq4deaJWyIj637yUnptcaWgc7dnYVpx830mcMq4s+Rh8Se0PYTX95CI34ScNDkMc5RHlmCgbPHV
	lU/ZvzW3w+NPNnQHTOEb3zXM7f4bB6864bdE+JGFmdYwfAyvBs+qjTvNG6+C7ePs7bW579In+Oq
	s9
X-Google-Smtp-Source: AGHT+IEBhz4Vgcda0CmzO3ZZWUM5pIo4myqFp0/op8mgrMOJGUmsHkIt9o5tgVJoYdz7yYLG2MoAFg==
X-Received: by 2002:a17:902:fcc7:b0:24c:cc2c:9da9 with SMTP id d9443c01a7336-269ba43410dmr99531245ad.14.1758488824280;
        Sun, 21 Sep 2025 14:07:04 -0700 (PDT)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802e14f1sm110134725ad.71.2025.09.21.14.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 14:07:03 -0700 (PDT)
Message-ID: <649ca4a6-3158-4c52-bad3-6c266edd177d@gmail.com>
Date: Sun, 21 Sep 2025 14:07:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: rk3399-pinephone-pro: Add
 accelerometer sensor support
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250921-ppp_light_accel_mag_vol-down-v2-0-e6bcc6ca74ae@gmail.com>
 <20250921-ppp_light_accel_mag_vol-down-v2-2-e6bcc6ca74ae@gmail.com>
 <5b6ijumsm6bgqymsfc25frqzjlpiryq7iupuk2pokcb6d4bz56@yqrz6j3oj5ga>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <5b6ijumsm6bgqymsfc25frqzjlpiryq7iupuk2pokcb6d4bz56@yqrz6j3oj5ga>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_140705_199416_9B2AA0B4 
X-CRM114-Status: GOOD (  11.60  )
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

Hello,

 > I'm not sure where you got this patch, but it's not from me (I know 
for sure
 > I never did any mount-matrix testing/DT patches) and should not have my
 > Signed-of-by.

This is where I sourced each of the commits:

- Add light/proximity sensor support
   - 
https://codeberg.org/megi/linux/commit/f171bc7013bc7ad3de9af817bfbcbfa548ebe01c
- Add accelerometer sensor support
   - 
https://codeberg.org/megi/linux/commit/b0bb7633e073a6760fa213b8c4a78ea2e73c7bf1
- Add magnetometer sensor support
   - 
https://codeberg.org/megi/linux/commit/2f7e67f451f16eaf15b81aa1dbdf126d54927d35
- Add mount-matrix for magnetometer
   - 
https://codeberg.org/megi/linux/commit/d7cd2eab931e32fa94408a96d73b4e6c0616107a
- Fix voltage threshold for volume down key
   - 
https://codeberg.org/megi/linux/commit/7c496a5cc27ed4e38b740f36c2d8b2c62f80ae54

I will add my sources to the cover letter moving forward.



 > Looking at where the magnetometer is mounted, it's mounted on the 
bottom side of
 > the PCB (U29 chip):
 > ...
 > So based on that mount-matrix should be:
 >
 >         mount-matrix =
 >             "0", "1", "0",
 >             "1", "0", "0",
 >             "0", "0", "-1";

Thanks, addressed in v3!


Thanks,
Rudraksha


