Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882DBC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2SQBN2LqLgnFTTK1bF/iTPkYmGpLMu0WNvqsbmaEDQ=; b=K+l64ME0V4BLTWAHIqhNYUEk/c
	6cN7H4YmEACLk53L8sINneeRnLbHF00eqPs6DVr0T43D+own3iLJPKC0Z0nP0Uh203oUWXrM6WNUS
	yi5veJi+S5Vh7AIfu8XvB0AFeBBlhugtDBcqIVZtP/7HKAnKds8xpC4TNHxzGeIM4x8n2bH3FXffU
	oHXygnlzZi8KROVHMHSQqZtwdupN8t5PfvyMcFMMHFHurrbqa2JkajRtZaL26U7KwXzOl6g2wxbBj
	K/x4zWAf4vkFTrWTeWyhW+fV//jBjvwXDFXKShhIX55rYUQJpnfyhWJM0r0l48KuIdvolRNzO04Bp
	D5fyGQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixjq-0000000AxUV-2Pwz;
	Mon, 04 Aug 2025 16:08:38 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixWt-0000000AtfH-1FQV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:55:16 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6156463fae9so9118653a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322914; x=1754927714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2SQBN2LqLgnFTTK1bF/iTPkYmGpLMu0WNvqsbmaEDQ=;
        b=arLbOlBvvkrgGcF147Jo44J65/+Chq2bpHCDwl1y7u9LsrgdEYCxrbM061d3N9pGIE
         isD+at0mSwJgt9E+8mKoCmMj8e7DyNHNbT7zIGqEHLkSMYol3bGKLwf/0aj5NGTWeFwD
         EtXWz9N/ME8ABpak9RauyxYT8D0xbxyBOMyNHXBGGEU/ZKTfqW7Ck02yUni4+2k7V93b
         CEedJT/ATsVIROXL+i1WsxqHOhUk5Iq1792NgN8M+5olCkX3OZY7OB7u1f1jsK0wcLyc
         uLlGagsluANOF0OVzHhocH7TZHtmzog1cgdYfyGl2eqRC1FibPaC5jRw1xhmNm5GV5Ba
         bxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322914; x=1754927714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2SQBN2LqLgnFTTK1bF/iTPkYmGpLMu0WNvqsbmaEDQ=;
        b=Ok5UPFGZ0D7lZkQb65IWl5G+SCm/w/cI0L/og+fhiFWi9NZGeKYhVkl3Aw1eYHLmRv
         BsLiNUZJiaNDR63dLdboO8v9d9haVW2170h21oLMbl3NW1TAtw7B8rlLJ/Ai9eb38Ska
         IuJAiHk/24PQzeu5rmAwQcqKk6hN9sSwdKrbd/aFUo1+SWb5Lch7rBi9hInCKLLQpHiw
         XtV+JYDdVRsMTJdOWwMR6u3JftCig9cJ7e2Ol4TLalKxtyMvsEVWKEOMzpYcELC4e0Ja
         fPn2oD34SW/e/1Imsih9ni8cE9K6bbwt/n8eALNY8yN1Ci0s1+t2CCNpGuoncPHBXY5c
         ZO6A==
X-Forwarded-Encrypted: i=1; AJvYcCU4kTlMcInAC6sI3A/m0tghREKBk2QO6La49YEeQDrpQzeCTMo77vttblb2yv0f1QBHPp0QPn+GSNorCoQMwr8w@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx5qbZdOKeO79SJnJuBkY9rJ9GMjfSu7enyccGtH9zIjJy3I4I
	yrLwHHEb4I/FM9Vx36RI8rODuFZF7QBtEXJJ/XmZmDfNcXzt55+t55AK
X-Gm-Gg: ASbGncsWElKO66FZRc9PaUWPmWmYpGGOIK3eDNRCWNuqOBMTHDUl5jrkMI77n8qQW0M
	WVhCikJMI7M79dEZOHz72F1dM5wWmxRHM8nG/gFYhAU3UHkScgrvsCrZkhOClnAJ6nh3HA2VE44
	upKnx/a11Gz33jyCWx88yNsCPTzF3AnzRiH5lTT3hCg9uj4f2irUlA8ZMu9rEbiyC4f/YsnpTxR
	rXetmWP2nCi2O587LZIIY7QXTrTmMLww2mQBtWzvjhS28xGr33RpTQYQ9+G7hbCgCRylTvy1JX1
	N805SWLpnw+mawwTTdvMU/SHOqpIhiunw8PsC4fdmDu3OiMhDKD4EF4TR7jSoMg7QA/mIDhh7ja
	Xz1ImDtfET4+iYXjbWdWvB6oGFhSI7pnSlbELQzfK1LtU121WC4imkD5oIeA=
X-Google-Smtp-Source: AGHT+IEWkAzWDKPbEqjRuqq3sF8A9XVVyaZnj3ChlC5hZyh9wED/CGb0dzmMEblht1brVSC3lOJCEQ==
X-Received: by 2002:a17:907:9722:b0:ae6:c334:af3a with SMTP id a640c23a62f3a-af97d21fc73mr11381866b.6.1754322913598;
        Mon, 04 Aug 2025 08:55:13 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:13 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 2/7] dt-bindings: clock: imx8ulp: add SIM LPAV clock gate ID definitions
Date: Mon,  4 Aug 2025 11:54:02 -0400
Message-Id: <20250804155407.285353-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_085515_352170_BA3E020A 
X-CRM114-Status: UNSURE (   9.92  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add ID definitions for the clock gates managed by the SIM LPAV module.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 include/dt-bindings/clock/imx8ulp-clock.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
index 827404fadf5c..ebebb4831761 100644
--- a/include/dt-bindings/clock/imx8ulp-clock.h
+++ b/include/dt-bindings/clock/imx8ulp-clock.h
@@ -255,4 +255,11 @@
 
 #define IMX8ULP_CLK_PCC5_END		56
 
+/* LPAV SIM */
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_CORE		0
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK		1
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT		2
+
+#define IMX8ULP_CLK_SIM_LPAV_END		3
+
 #endif
-- 
2.34.1


