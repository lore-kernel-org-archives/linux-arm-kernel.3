Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ADDC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 01:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TW/78u/K4Tk/9Y6Jt2yXAKfWS6TVs/Gwl1yC2tUVx0I=; b=Cli+AYxoFkrp7xtLwRya4sUwSu
	GggYrkCuHJ7gM2ZbyTCxpdIk/bg9dAeGQ14E/NCB8RZn2hHlrd8XiCl715PuwVfjwyCIOzMyp32lj
	hTBZYpjk4dc6x01m453VJ5QBDHgEn96iAKOgQ5jiLI2B3daK7OAfeUTZpuO1m7Ycnee2VYAmHDo+n
	BleIcz3aPbF+Zb3uAoRfKznSjEkIlfxp61vAIAJHFgCwWaprmwczbsOsaZVKTe9RK5Q3Bqf5bGCKs
	eapHjh5SkO9ybFdacpCp6rGKoEpm2aN5+bN1b5V6Vh1Y+oYFM9vjWLcK7WrsHWc7JFzcHc5TUP89B
	8jUTxd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsDZ-0000000AIXR-46no;
	Wed, 15 Jan 2025 01:29:13 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXsB7-0000000AHni-3acL;
	Wed, 15 Jan 2025 01:26:42 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-467725245a2so56516591cf.3;
        Tue, 14 Jan 2025 17:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736904401; x=1737509201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TW/78u/K4Tk/9Y6Jt2yXAKfWS6TVs/Gwl1yC2tUVx0I=;
        b=hI6RscksAV+7XIQA3Yq+MHpMNLriUsRsG+K11UxDWnJEq9moP5MGKGg8G2JmAdv14J
         9HucTI9wpsK/c0mPOQDOQdJcxT9oVNazKErXp0zEJSFBtXpOEOKVQ+sNh5Su7DWPY50x
         jkcCEWs9LN9aoKYG3tTNKqXb86dcJTj84YuZKZwqsoE31OG9KS8M68RLwcDz/8b0O2vx
         kpIHNwBzuCG+pt++zranfapGgnuuviNLjk3BmWqQCarJRn+2p09w7R9LfNbaRf888Hif
         jrsOqqV5K+XvdQLivQA81TsGH6YzGPsLN8BGGyYdC+U7u5vlmX3BYKpBU56hAEHXzL/k
         5Weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736904401; x=1737509201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TW/78u/K4Tk/9Y6Jt2yXAKfWS6TVs/Gwl1yC2tUVx0I=;
        b=RNgUPLPrNg1yMddOvdCR2yrYwtPmCGeyW1aactQhXc7oSBjZEr4lJt0j2aWoeRYApW
         lFmuJapEfPwinTz3vBkjTYBIg/hgbGC9nFCAn0UsHB4KwABLQpC3zYBsDX6dv1Y7Hi+i
         AgdubTgZFeEx0sxrNXZfPTCO+psuLAl9FpRstJtVmbTvAQ3VJJSkdKOqqBDwd3igirbg
         Ow6+lVBIvUOU5y/FQAGMLBg/ZiZW3KzAH82vQf177rR7Bc9jz5mchUqh/DUq2fNnWZ5B
         /Yp95NBrnUOCSI4jZS7LkiFGOGzHWwKikYEMDNkOPAagWDP40RZI+f+fHcIUoW4B/G3S
         maww==
X-Forwarded-Encrypted: i=1; AJvYcCV8zI/S93b+bbGfbNXOPiYbMzSxm8qHzEkQ8GoGL6ENp0lWFBu4iQ+4/Q7rnrA5d8+GCo/LuuwBDIu8i4R3x44=@lists.infradead.org, AJvYcCXOnwiiv8835I9Vh5F5AKB06LDFC0hQWXcDHq0v3V5X5+JiFicPj+gC376Z1D3Erbwqnpm019BMdFRlKrJPB4Um@lists.infradead.org
X-Gm-Message-State: AOJu0YyhqUL2yQ91TZlmTrE0dySh+2S7fHZXFAMeRrSN8Adf0jz3LCqU
	6eg7Yr36VOxJIas5v6WTVdkYroPw+VIpwHEShJEVAUoVSD1/3y/q
X-Gm-Gg: ASbGncurJvd0YteF4SsZMAodXKJbhqtVatCM00rcfMSqBePUArcyUp6CuHMJ4dbhlS0
	LKqi6Xnx8E+JUcB0Utlut+HTrt8UA64p/Ksoqw6AkT4pYe0U/qpFX6LZ7CWQhsfpY1yTVO0Zssr
	bvGMOAyNn4nzJ/GIV2f04C7XXfutdFfPRjZUwI/Lwb5fQZ3QZT9xUEJTXVLZEUe6i+dhD/vV/cJ
	zhgJ8SI8pvgvVmDWHr7ALiw1KYvOenbH0PI2YBCk1AK1cGNtgpR+dYD5GF4c5Z46yD9
X-Google-Smtp-Source: AGHT+IGzpUTf+PdyMGFAlYG5FILFZ7yZKz+uleYeo3HfOkexgjV2nVfuoZLKrOOmDZVssLq3Z0Vfhw==
X-Received: by 2002:ac8:5746:0:b0:467:50d0:8869 with SMTP id d75a77b69052e-46c71004b3amr471379241cf.18.1736904400689;
        Tue, 14 Jan 2025 17:26:40 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.227.95])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46c8733130dsm59933881cf.25.2025.01.14.17.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 17:26:40 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: zyw@rock-chips.com,
	kever.yang@rock-chips.com,
	frank.wang@rock-chips.com,
	william.wu@rock-chips.com,
	wulf@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	Peter Geis <pgwipeout@gmail.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 1/6] clk: rockchip: fix wrong clk_ref_usb3otg parent for rk3328
Date: Wed, 15 Jan 2025 01:26:22 +0000
Message-Id: <20250115012628.1035928-2-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250115012628.1035928-1-pgwipeout@gmail.com>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_172641_893958_B026BD37 
X-CRM114-Status: GOOD (  11.26  )
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

Correct the clk_ref_usb3otg parent to fix clock control for the usb3
controller on rk3328. Verified against the rk3328 trm, the rk3228h trm,
and the rk3328 usb3 phy clock map.

Fixes: fe3511ad8a1c ("clk: rockchip: add clock controller for rk3328")
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---

 drivers/clk/rockchip/clk-rk3328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3328.c b/drivers/clk/rockchip/clk-rk3328.c
index 3bb87b27b662..cf60fcf2fa5c 100644
--- a/drivers/clk/rockchip/clk-rk3328.c
+++ b/drivers/clk/rockchip/clk-rk3328.c
@@ -201,7 +201,7 @@ PNAME(mux_aclk_peri_pre_p)	= { "cpll_peri",
 				    "gpll_peri",
 				    "hdmiphy_peri" };
 PNAME(mux_ref_usb3otg_src_p)	= { "xin24m",
-				    "clk_usb3otg_ref" };
+				    "clk_ref_usb3otg_src" };
 PNAME(mux_xin24m_32k_p)		= { "xin24m",
 				    "clk_rtc32k" };
 PNAME(mux_mac2io_src_p)		= { "clk_mac2io_src",
-- 
2.39.5


