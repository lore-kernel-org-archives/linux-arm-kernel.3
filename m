Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259EACCF2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiKDA+pCxvcmNuKm7oMIMiLNyrcd5EU9PaDKDAFb1ZA=; b=AzitbQcPqXCqiJ2aGrDunCyH9I
	Nn6eW+fAD60mhRW2zoxorjlllKPvVtOyWOOp2GJBxNgWbJLwLUTtbW2YmtKQc9kaIEk5ietQQ8/3h
	ce3IPlfRaN6k/dSg91LU2NCcqX55wWGMrfK7LahfTP1GAlrcnOZKCq4KtobwmlQ8zHLz/87j0SAHn
	mvaNsxkAy2Q1KJLswKj7rrZxw/nIV1OoTeHq4DkWiGXV1q00PPlqZgv8gPTjheOTFPqAzwaxC4OCz
	8KGLQ3DaPT8xkq+fYNogEZ2kKs/zyhxBAm4kcQ2fcGAbyPvBmKaYZQ5CZxsjR4Ps9baHQsKYSsVAh
	F96B9XbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5nS-00000004rNL-3aQK;
	Sat, 17 Oct 2026 14:54:06 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5nK-00000004rLe-36Ir
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 14:54:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso578590f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 07:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792248837; x=1792853637; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hiKDA+pCxvcmNuKm7oMIMiLNyrcd5EU9PaDKDAFb1ZA=;
        b=HNIBhZnrEyF97ur60BfoVUPvSGjFljIfREj4F8iwOHsYWhW02oXM5wxo4DIQURHkYC
         nZFWDpHeGIxeRpMCnmNULzdoP6AmmFutb6IdmmNFzn0Lf2w2GqS7b40jFEmvULrutpat
         eTHLsXL8HfzWsq7zOhCPH+Stp9Ee0qrRQ3i9PeDx+yAfNXtKNueD9EKNtJ44ArOAMfP2
         ll5agIlA3tUYHHwfwC7u20jgV3deiYWlRFKM3xMDvIc0BXHHVXxferylU43aIWzmSw1a
         5pwvZ0vbrkuAbY4zwX1Hi7edQ8BHaVzdQA9VyIHxzI5BAkVNdAqpXBgZprhkaabUhXjm
         dUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792248837; x=1792853637;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hiKDA+pCxvcmNuKm7oMIMiLNyrcd5EU9PaDKDAFb1ZA=;
        b=DEf6oOBQTxv4jrjkYCl3dqBLYP1xn41EoLohRd9YNwjVgSSFheHxLnkl5Hr3mVcwEX
         xauJLoUFXlD3VS52DVYzJdHDDed9jiyJy+/74+GoBAQKFFsAUyeLqYovqRNkgmmChE7X
         zpOxGthjwYU/CrvSqo2R2F7S5YrGWfSMeu9LN8ldjc4ET1C15/A/ThkowbHF48ez/e1Y
         n2yBdqhxeITNW7Dp0KdFHJAakcqbworX0vkjWbrwv8/4B9U+rVZTGROMT0Sn82Ow992M
         c3QFo2CHs3BZz92IeMGnwUpUcmZFdFAoTwwjOVf4bLEeAnUfmPYT4ikOE8CXs8g3Xlfk
         8CKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPmomSMSkf0RgG/IbgQ5uVbCzvRCiJYkQjoacsDwGBXdT0LPH4X0674v3VLr1SetzJ762RMXZMcXDOIEQ1aXJk@lists.infradead.org
X-Gm-Message-State: AFq9FYJklk51Zkm+JX0JNtS2/p859msE+Hh1dxAoon8MHxyxyNdm27b/
	zE1IpRkkooSbZeHdJwRWFtdlmPlyci91K3vfPw6xYB3V/h4dMBCAVR31uFcI9MBz8pk=
X-Gm-Gg: AYBFou2q8M//jyVNye8KeXf/pU9J2kDvlQqazzTpcrpYyldjJnp1b1WCtW2t0bjyTcS
	JoZBq/7+rgy9Bq9dqhyP9gib/dh0UeBTZivnydpWoh7gJPNncrXEZo4vk+R3tuf2yLTB6GkocVa
	gKhH2++Fs5SkXlq8ms+2n0gAYcX4SLgfLtcrpZ5QSb8dP9BfcHyfLJZlbmWANGte2F/JygyoTu/
	3uMcHmbqruQ6/f9MFBauhrNlVk0ETwzf8We/MMRg9R1tFvR54WO2EaEEPNDuKkNjelvMOu7dxxL
	2faMevPntWwXbeZd1FYDJ/YPXddef368MG9rx0ZfW0P96wM+zeyGSFuTEvAHawENJl2McjT6Yfd
	bfEkL+G1NIAazQ3TGLhpsDRH1HlFRsacqRrl9JtJGEh+VpmsLvsPK8rg07sdoPjBzp1nD867pyN
	c6N93p3+KdrOb1rRTWVKahYmdzPtYHfSFyH+z6xCFYa+2GFT77mZdwm27r/Dk84zEEnETYwSBDs
	AqRPUwBdcsH4ddBPw==
X-Received: by 2002:a5d:69c3:0:b0:48d:f831:2681 with SMTP id ffacd0b85a97d-48e07f9c04emr3912331f8f.38.1792248836373;
        Sat, 17 Oct 2026 07:53:56 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5035bbsm11683485f8f.44.2026.10.17.07.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:53:55 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 06/10] clk: Create
 devm_clk_hw_register_fixed_rate_parent_hw()
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v10-6-47c97b54a809@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
 <20261015-perso-ma35d1-upstream-clk-v10-6-47c97b54a809@bootlin.com>
Date: Sat, 17 Oct 2026 16:53:42 +0200
Message-Id: <179224882241.859276.3068400770588177354.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=543; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=QGkkL2Br9nOFTntWsohnZUbwzb7F2vn9vpbJDAOpngU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmXexj3VFp7rN9ucmVlQYXo+uJV97vPuik3FKzN0dvAc
 yEnL0i5o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABOR1WBkODlR7IHFf528iI1X
 /i/aHic+02uHx8LYcm8Lg3WbjXaKuDP89z+wrdmo2azRkSO5eCNfZH+wZRH7Vc+bs3Z7m0kEvd7
 HAAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_075358_802398_489C783C 
X-CRM114-Status: UNSURE (   9.31  )
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

On Thu, 15 Oct 2026 18:01:19 +0200, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> clk-provider.h exposes many different helpers to help registering
> clocks. Most of them expose both a 'basic' variant and their 'devm_'
> extension (with just the last parameter of the inner function call
> becoming true instead of false). Do the same with:
> 
>      clk_hw_register_fixed_rate_parent_hw() by creating
> devm_clk_hw_register_fixed_rate_parent_hw().
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


