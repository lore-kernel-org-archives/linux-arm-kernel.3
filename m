Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205A8D26D7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pN9eq3+cVhnAIKFHkpVejmwpQ88kILrVS2yMNx1w90=; b=c3iqTpSkvFB03y
	/6WsBgM+DffN3SyrhXbvg2vMWOUVVkZ3vwh36LIsNPla2tHbcu8KpmTR3N8o6osQ7TqnnsvppDwDf
	Vs0C4BaQiV8FPgDN3gCMevr9/od1n+cJkh7cEKpwnjXbhJszWJvMt4XWLZYDZhblcxx9nVekOLi0n
	//GsnfwWKcW18F93KZlDl4yKaqZxI6qwvckgkTpA6puJCBPTPavfJk1uvoS2z+Az9IF0NvuXK5TmA
	Yw76EXowH3xTZhQAO4argA/HYQEIoIMl4k0kxvTBgJtoLJ42Eo07CPhTMnAHlLputtlo9mNn108fQ
	Y6yf1fohKtsX/dLcHeNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGGo-00000002otF-3DWh;
	Fri, 09 Jan 2026 17:27:30 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGGm-00000002orZ-3IlS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:27:30 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-64b921d9e67so7592772a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 09:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767979646; x=1768584446; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+pN9eq3+cVhnAIKFHkpVejmwpQ88kILrVS2yMNx1w90=;
        b=PMvPsmyyB+1dIpTolgiYAfnsaWc0XpArVvJLtZ20kvw7AFt7/3dqdoEG8XXGJEF4f+
         iwVTga1VRoDStyPAUUqBnj9hiQ7nuGuhn4FIXC2hHOWwa0TnqXZyGtd48wzgc5JqiQ4U
         gVOCjGNIZOYlOenl6B7ccj3YnA7wZZaYQmFX6RQNMItLlU5nCAQcVhKNk49FgmFGSuct
         gGhvEZikZC/YanPTv0po7WXLi05kHwIKbuZHLBDter6aHHWtidj4iKem9EDvTj8ayC+5
         eLULDu2PemvA/kE5PQ7Qmdn0aYI6xxrTGGi1Cp3AI2zWcF49QZlAzgLm+hiq5b3Byg5T
         6Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979646; x=1768584446;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pN9eq3+cVhnAIKFHkpVejmwpQ88kILrVS2yMNx1w90=;
        b=qqvtiiIZxoHCFFh4cIK1qs0+/HlOmtfnz/3Orlg7oaBzxjX9lyBOFpboNC6pcBKGoY
         b33zHtTWbS7aJuoattcNKDX5HT26fvqYgIHfZ9jtoq4oFVnxq2fgG2VHc8u/yk0WM9jc
         dHxUNZsy8kFfXSNenKi+IkjhVlFkvExgzAnVq1G1aHYajrLs2345TIddUWaOEwFGJMBP
         LMQy3fNIZKIdD6Ia6y8nabQhSOcdEq0inOQw7qskSHHOy4QVpzfH99NrfOSNKnLmsxCD
         gq6kqsCNIx4yBErRqq5/WRryI1YhiBCUmHOE/kZSDEZ9VzdDBt9/11XCpNf0nz+tunLg
         1SNw==
X-Forwarded-Encrypted: i=1; AJvYcCVpHuF9HOH4REzSAedutCoHqKwr4DXGcoqiEiAnu5UOewOsFhZ+czAJQDfm7AFVJqvCOJD3/DcgwYRmbSTsvj0A@lists.infradead.org
X-Gm-Message-State: AOJu0YxkYtd6CKNOcNMK3pluqz4qaoCtvkI2kcNTFyyPRVP74P1b4Z0L
	rDl8z5IiEor9XRqZ8p0rtFaeBm6QCfn1htKp96nr6ZoCl+RJcW2AVcyUQarARI4xMSA=
X-Gm-Gg: AY/fxX5BpnKDVOfumvhi8vi3yhg9QuF/5bxv0YEGnAOnjCyPrc+JEOHUp5gAhF9fjfz
	gneuPpW85LiE5KfRNNgjYZ80RgX8HMZsbaziwPrcJBs1kP5Pc6ZCJX5sHjvg9IbkIjnVamYU3am
	S31O7RlesC8o6Qois+j2ClXLliBOAURb7L6HZcpuDPUmomKaqYWlYN/eylkWpyQRBvjVirmOdYY
	KVMdrkctXNW85jTJ8rJJo/0YrlfM115hfRssQX8WvxqMBYVArR37i2vj4KEvtC3AkMMHnPzYTo3
	I2ki4gT3EPq5GOpe5842/km6C1OaK2cG9JYbVdqDEf+DlzPU7cr95ixKyxW5KbKlt5DH6bkQADE
	HhdL5oay1hQCmVwOPtkFsgNd8kmewNm9OBp4Q1o2BuBZiMKeFBHC6fjyQLcWGtbPl7D23xijUEY
	MvxHlgHVmTJQDyavahXQsX1A3n/J4CWVtu+nSQ6D/V0W0lWIP3mjHBM1JNOgU3klru3b6kwNJa5
	H54Ag==
X-Google-Smtp-Source: AGHT+IH9konNgysfE6y4zUj4SQTFh9V4mtJh+h2X4vh4dTJ6V9ARUJBq5ibv6tNKqQwIVp/z5cofXQ==
X-Received: by 2002:a05:6402:1ed6:b0:649:230e:ec52 with SMTP id 4fb4d7f45d1cf-65097dceb1amr8909108a12.1.1767979646034;
        Fri, 09 Jan 2026 09:27:26 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be651a4sm10642182a12.16.2026.01.09.09.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:27:25 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] clk: samsung: auto clock gating fixes for PM
Date: Fri, 09 Jan 2026 17:27:22 +0000
Message-Id: <20260109-clk-samsung-autoclk-updates-v1-0-2394dcf242a9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHo6YWkC/x3MwQqDMAwA0F+RnA1U3Yr6K+Ih2syFaZXGiiD++
 7od3+VdoByEFdrsgsCHqKw+ocgzGN/kJ0ZxyVCa0prCNDjOH1RaNPoJKe7rz3FztLMi12Srwdn
 6YZ6Qhi3wS87/3vX3/QXF8JL1bQAAAA==
X-Change-ID: 20260109-clk-samsung-autoclk-updates-e8a63bd68405
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_092728_864262_7905CA0F 
X-CRM114-Status: GOOD (  11.19  )
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

The attached patches fix issues when CMUs have PM enabled and also a
needless warning message on older Exynos platforms relating to
automatic clock gating as reported by Marek.

Without these it's impossible to enable PM for a CMU when automatic
clock gating is also enabled. While currently no platform uses both,
patches to enable PM on gs101 are in the works but things stopped
working after the auto clock gating changes. I've verified that with
the patches here PM and runtime PM work again.

I've opted to add Fixes: tags to the PM-related patches even though no
current platform uses both, auto clock gating and PM, to ensure the
code is correct nevertheless. Please let me know if that's not desired.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      clk: samsung: avoid warning message on legacy Exynos (auto clock gating)
      clk: samsung: fix sysreg save/restore when PM is enabled for CMU
      clk: samsung: allow runtime PM with auto clock gating

 drivers/clk/samsung/clk-exynos-arm64.c | 32 ++++++++++---
 drivers/clk/samsung/clk.c              | 83 ++++++++++++++++++++++++++++------
 drivers/clk/samsung/clk.h              |  5 +-
 3 files changed, 98 insertions(+), 22 deletions(-)
---
base-commit: f8f97927abf7c12382dddc93a144fc9df7919b77
change-id: 20260109-clk-samsung-autoclk-updates-e8a63bd68405

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


