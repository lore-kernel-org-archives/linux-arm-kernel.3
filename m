Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984531093180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 07:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/i+XiMvo4RBkCmrsB/NhsQRMMdemw4kFlJaRryPfTs=; b=ocvJuIcS38N+bE4ZaXXjWM8L/G
	oqoZMV6sNrVEcFG9sgRZgkzB51LbwabVWosKch9OgMBanQ2xzqUFPJWJr9GiE2hlMVFkLLh0Ilmo2
	CQ2Ydn8LbE99JEg9mqVo/IbS/E+51g33LFuobTqotIBr/09fWrO1nnxubL7mqL8q0Ya0UXxmioouo
	mu4UXhsJTrpRk1VBrtVeFib4S1HMm8h4vk+us2pEUbaM4HpMVxG2DLPcdx6w+XSJc0B1Q8mskNkIS
	hLtOCPx4NfPhDZBJXgzlHQTKK2xvf7cU/6cpt9uDCT8PrL/PuEFewSWxw+i5DTFmqxQ/2peBvsTad
	JL1jzhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UCR-0000000CExo-0jrk;
	Fri, 20 Mar 2026 07:23:15 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UCP-0000000CEx8-15jp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 07:23:14 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso130047a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 00:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991392; x=1774596192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/i+XiMvo4RBkCmrsB/NhsQRMMdemw4kFlJaRryPfTs=;
        b=byqEfylhCZ9l767keTfgKGWCIx0pX/pkCfm/Iue7KyBFbx0BjiWDmw8FQo4TWvqjdw
         /sDpiHs85lUtmThelIrkyNO7DpqivKG0R36TnYJFwk1u47nHXKwdycfJjqTxO9GJv5Hl
         rQjIePEjZcAzwkQtjGhA0RLAWoxSPq/02zyz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991392; x=1774596192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/i+XiMvo4RBkCmrsB/NhsQRMMdemw4kFlJaRryPfTs=;
        b=Jchy0lHOzLDL5rYeAgQugCpitxXmrEXxOeRb4XC9wnBYCm+VWmFrfovKnFzXPuFqr5
         23YxhCCphxloErbVVwqrPtVR8D4bPQo+cWjC1M9VPBCBu+3FD9Gzv9Dvz+kmdG45OuHO
         uqArYliDf4NtYw9WhroSQ7XUxS89fnqdw4NupRDBJx2R9BZQh+xynkOxPc8ZqdkkRK3M
         /XFaZVatFBBLLqrLd24hj3qOdevSCJTeW2eVgDbEvVe7jjY0InGdVj83IW8R5BgIL/uR
         S3b/We8cgWJPYMHrBz1Es+uUz0ELaR2ZCxSAuofqDaj6nNDq+N4XHuJRmvFqo70pTA5t
         nkAA==
X-Forwarded-Encrypted: i=1; AJvYcCUuatuDzVa7tiuAo9WXgqcyaRTcLoxGbzNR3iCIzDRowBXAtQJZdkKbPvFUj2poZfxQvx/H4zaY5B+wwlJHQEag@lists.infradead.org
X-Gm-Message-State: AOJu0YzH0/edodbmmAJ5imvJjm0xTi8GU7nHfeCRc7tt06S3nvBtwuZz
	1bYVuYdkzUiyCo1gNG1n3meRMTEQCS1BpfQRoL20IOtSTdNnJ7VqTIi7oagUqpQgsC88goz2XsR
	kO20=
X-Gm-Gg: ATEYQzxT5+vHbS841DINBFdeHrf4qbGus7/XA4LlsgcQfYSh26uFDBsB2XyoYAcSg8G
	/0gu8NUvSsYIkw+MhuDpIZCrEv7+h1yacy/3oDZIQ2+Xl9ZG2k7szQhFOispfjBxZDzfrhPQ+CC
	//TrAD0H207Df4nRtAaSUSQGKHt1aqpE4YNhuO+i46FQPnXJSizPZQbsvjPUsiQOaGgSA+lfH8F
	zS9+BkV4TSzRK1lbobaO9RpTrs85NtSgHny2AO7TSc0Z/g83T3PqkllNZH1ozSWPjCwDr1zd/Tk
	wKthYfoS6wvXbTAeJJLTZoRMoGEv1V3xm2Kl7ZwEXgqQwsmBl1OYOtHhVrAleQwO+MRAV34qBo7
	HZbwATl418KpzqNX2RcVFr4KZpG8shH+SaJGA9BLKg4vuHqPDrRwjlJcNXwpBuJvsFtbRhHyQDp
	e7hu4f/eZgt5gllsaPJLtEePnB9JxUZNKOdKqP5UFAjJH97u8pa/wUtmZtd6t8MZrTQFSWyuKY5
	Zam0/NO8OyavHfEY3w=
X-Received: by 2002:a17:902:dac7:b0:2b0:7224:a4f3 with SMTP id d9443c01a7336-2b0827eefc7mr19316025ad.48.1773991392395;
        Fri, 20 Mar 2026 00:23:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516b96sm16728365ad.7.2026.03.20.00.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:23:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] regulator: mt6359: cleanup and add supplies
Date: Fri, 20 Mar 2026 15:22:59 +0800
Message-ID: <20260320072302.2402489-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002313_387483_3C18EBE6 
X-CRM114-Status: GOOD (  13.14  )
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

Hi,

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6315 PMIC.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 adds the supply names from the DT binding change in patch 1
to the regulator descriptions in the driver. This patch has a
checkpatch.pl warnings, but I wonder if it's because the context size
for checking complex macros is not large enough.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (2):
  regulator: dt-bindings: mt6315: Add regulator supplies
  regulator: mt6315: Add regulator supplies

 .../bindings/regulator/mt6315-regulator.yaml        | 13 +++++++++++++
 drivers/regulator/mt6315-regulator.c                | 11 ++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.53.0.959.g497ff81fa9-goog


