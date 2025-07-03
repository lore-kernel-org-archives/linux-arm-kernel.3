Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2941C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBhYZEvvr6wT0rA3y1ifWP+OcQau5rDJJM6LpP/dVA0=; b=fgJ9QVbdpvZgi9twL98onpgiTI
	bKQp3k9Iu3h+03JidqXGVRq5oFryTnWMu/3gbh38jPiTYi/6eHbwQlW/ZhuV6awYYmPyuDdK3u8QG
	0XEq6/Sd+qBSmguOtyvU3p+FXByxPYCSe+RLkuQdkqWO04N3pA8GPGuCyywIjsA82wZR3byLpnFDN
	crgM/8mZIvzGijebQER7VtYuplB1ERTzR4RonRlgeWfJSHkXQYX9wpgb/hb3z7yNrIUDA0eW8ZCcX
	uz/Oa3KU7uTgOPh6zKnS4z4Tz4Gbjbv+2o7ZZDF2qtt7PtrFyU6ts89YCs2wkoIstEQCCziXtliVK
	y4ePzMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzV-0000000CTFA-0Tka;
	Thu, 03 Jul 2025 20:57:09 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLaB-0000000Bm23-3n76
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:10:40 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so13417390a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555438; x=1752160238; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gBhYZEvvr6wT0rA3y1ifWP+OcQau5rDJJM6LpP/dVA0=;
        b=ZLTXZ1HxfRya85tRYLytixLiKRllEeOxhqT40/BLKDx8fv1K/vNdAAyzi9nPlCtIlF
         nlM9P0OlqrsDSvovBKPGJkt8Iwh/S6nT5dl+wSRITTWzQA9bOB+1uCCgdvCOU+Nti8un
         uo9Ne/cdNIGWlkOQO9rW+skmvEDgX4Cw/+JS8f6neiiGx14A6X0MEtufauca5oMHD7vb
         aULJVkhu24DK2MjXRX7C5jwtVGHqjrxU8KiYn42xpt+aGnUbKmo0zuJR4B78vdjGxVLl
         8/nUsEh9x4H7NSzgGQl7bKB66Zi9eQpkwLuixVFZ4nAVtXYqrKG+Zx/eJ7EWtlKN3aA7
         QJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555438; x=1752160238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBhYZEvvr6wT0rA3y1ifWP+OcQau5rDJJM6LpP/dVA0=;
        b=mRBa/5lzNOhNokVWynr21a3XWW851RYhtlEfPRsh7x9MCDPKX4vycdBEheRPNTRUzS
         OvOxJ0tAJIt/Ix8hJCdqxHfqoFLjxLrDmZtAMQ8wTJQzaSQWjuqAf3oGf2H88Lg5A7Gn
         uzchDQj2++6b+ubx012GxslCBd4tfcFr1VNrzpqos1VLs1fYzu4PtNg8tHgPmq6VIjqd
         U59rK3WKZLH9DpIZPPmmS/SgmYaiAmv5ySktkzqhc1RLqzw8cvHuSxJ0n2vIMxCOndLA
         Gh7FopNZJcoLgQcOyM/eJO+9R7HOmNBtwGWZ8SSfQc4qBqnrt26KhsFgPffMcSF7BRPk
         muqg==
X-Forwarded-Encrypted: i=1; AJvYcCVQnJfJFIAX4/uiWR/0ZItxIrO1l4mi5aOl1PrWg7x/I0NavI1AHFaVW+VDgCqbAsr+NhqtVx+EwbHXu1Yd838d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6p93OdMx7r6FFMggNyr53WTeFI/+Hol052bfgClRi7tr6nBlv
	OoUOIqqEUjdpuIGK068XY0sWwVUkkgn2fZfhvy1LaFH3ApDuMVSEQ0S1UTmhodHeEMc=
X-Gm-Gg: ASbGncue1J/FtDyCjP6pXT2zIzMvHndGvYepAw1RbtV9hY2Q0P4/dzc6PqMGnpRMB8J
	GU6Bwk6PidnBXD5oxDOYytAvotnV5EZCLl5R8xd4w4KdnAE+2sp5TTEsNq7kNjJ5mI3M8bLecZu
	NGDLsyfhae7LBvJ+LSEs1o8wqKa247b/LAWkT9v+wsEpX1o617hT6R6+V8PuNSJJnlEcGVS7uT9
	2nBz1Edu/PMjsnR5SLCaf+Hdu6V5wZJlw5kZQfQ+KHhlqTW1iS2iXvTpR/KcjVdSN9DveMIRfpy
	PgrYp1H/qMTVBnhLYExP+ZppSK4LeVBEkLnZxm1G9SzFFFoNvDAEsov3EnTQUEemPumDWA==
X-Google-Smtp-Source: AGHT+IHFWA0SjfKo8Q9HvR8gkZ0iZby8sEu/tE1InGy6IA+SPlppSiNPUeimMeEYtk+3MIxhso8xqw==
X-Received: by 2002:a17:907:3e0b:b0:ae3:bb0a:1cc2 with SMTP id a640c23a62f3a-ae3c2aaedd7mr750188166b.19.1751555438164;
        Thu, 03 Jul 2025 08:10:38 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b369sm1274968066b.3.2025.07.03.08.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:10:37 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:10:35 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: imx95-blk-ctl: Add clock for i.MX94
 LVDS/Display CSR
Message-ID: <aGadazB4LbRvk1BM@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-4-b378ad796330@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-4-b378ad796330@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_081039_940549_1899DFAA 
X-CRM114-Status: UNSURE (   9.94  )
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

On 25-07-03 11:40:23, Peng Fan wrote:
> i.MX94 BLK CTL LVDS CSR's LVDS_PHY_CLOCK_CONTRL register controls the clock
> gating logic of LVDS units. Display CSR's DISPLAY_ENGINES_CLOCK_CONTROL
> register controls the selection of the clock feeding the display engine.
> 
> Add clock gate support for the two CSRs.
> 
> While at here, reorder imx95_bc_of_match.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

