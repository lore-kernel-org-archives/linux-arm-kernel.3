Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1427C103E2F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 01:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=; b=ei340sc8lOGy1+ssesRPpyG52Q
	j5f64WHwvBxIGtEKAjftlmv+VcmxlAOckhnjgTJ5Mt0Tpkryut6U2GG1k1uclkwSwTKckN/7QMUJc
	EaYS0I9uRgFmDqTvP+GJM5KVaXVd2Kzj6lZQMKweqFKyCTL74KUqAHVicZFQMIziz1jl2Nl8Ah+73
	JBrQxKm2CsvIY2kRL8Kc+S6dJfOd0gnwiiDnSu7P7Ko8GqXkFNYaUGI8BnW39k93WlUIG5a/1q4uT
	04w3oppQGq8Px1T1bGp0eXQh9vSVL12iHH5nb/H2UE9o6b6NO8eSCklBBDrKqcZSSFdwjv4sDHr2Q
	36cO5mhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Um1-0000000Czy2-1qkb;
	Thu, 12 Mar 2026 01:23:37 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ulz-0000000CzvG-11w7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 01:23:36 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-899ee87355dso6780886d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 18:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773278614; x=1773883414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
        b=mqwCybnOQDdrfyQp8pBbHFoAQXK8aEEDx5MXR2W2BCb7R1K0/6Pv6XUAqBYXsgcs8z
         Okel74IvadmaNG364Lc2wujbFbUQv2QRMEWHcpLcvwl4/PAR+yeGPXV0hGmq6dFRUcqW
         iXx5DAJ82Bu/X+uYUkXGHw0tQ0lCwKsDhGbQ1Ca6xSmWqClTokq/v/psGBv1WmtTcJOW
         G9MPD9eeELBO216UMTBSCWs47L78Ib/O2wcfTwAF/Cq97bBDLjxNJ5LdUUQMs/hRpJcV
         R3pfO/jRsBQsHsOaLlvnAKSzcZu1LL1urNBGdlYfVBa8sEBc5pnJpvs84GCQPmSZIDPV
         IFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773278614; x=1773883414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
        b=RWxGaIFc3uTz26bUo41sKTYAHsT7k0kLfqq4uj/Gvldcv9KpQauX79j4rW7atVzMZG
         GKDygWNCv6atzEIFf63FPcTzL1qO7MHLlFsLhR7N+bUDmMwhjFjTCaHNmHIqpW+dDu7S
         fPtf2ZjN2LCUWZnCW8IEOwngfthUkqPvNl+n10kI7i0NbfYnBfmSJO31bVGuujT1pStO
         bvSaw4mCaJ1A3EhK/syphaGgY1PUp5NaBE+3b8Iqnoo+9y6MM3T+S+9ZwxsYPZ9hjMG9
         0OnQoHYLQurVhFvN9PuR3xOWxCiBA6OMbmx8SarD0hhINHnrFNSWCi67E6gf+/CB7xfo
         bP1w==
X-Forwarded-Encrypted: i=1; AJvYcCUP/R7okQerzCEsNq9JQzptzk1fr8bAKF9MuH7qVVC/l0iqCohMl0Bi/FPrtPRi8DXGaubBwYVo0yRo+6+Sb6Bp@lists.infradead.org
X-Gm-Message-State: AOJu0YxWm8IZKwLt6cyXVSU3pLrGc+IH6lsubrKpD/XaSPcCkVKidKgq
	mc4NlqD1W+WUYdLcjGEELPAQehQ1f6vn0QlcY+k+IbJJqkgQhXyO8694
X-Gm-Gg: ATEYQzxU9AZPanq1Gp4bHc6275CIfX4kFVCdl7+YTbDZtinVS8z8Kbjnjxp5ntX7gnZ
	8PcWpJayIyZjHLGkpYHtt579esn1nrDVnqVDMGKiKlTVWoynWDPxSUBAx0Yzs5pTRpZqKh2+Sjj
	SMPaw+oyySCANEupGMbmlWrUV9GthLwLFRQvaNKmlLlkLpho24F1+vsTsm2GMTaKHg827insYN3
	6aFBcuP4sIIUmnnjcb9RwcQmcqJgoO7pv6lqqjGPmp2zKAaIXWUTNJDRXahIP8OZfKu1RT/YlGL
	yv5GW3TldCKogsUtbBQwmYPlT0ohG8LznLIIWkdyrG/pIlSqGMhVo/obGou0cCSq2fUJeD7EEkC
	h2cSMqsUXN6xCPjN73XinXgOyGZzdj+TTzkcZDeDaT0U2sPvbdd4vO5WnjznPP2ZXF/C4PL9d1y
	PJGsiI5mjfRpZaXWVU0zvP33PGLTVyVjCGlQ==
X-Received: by 2002:a05:6214:2305:b0:89a:717:1e48 with SMTP id 6a1803df08f44-89a66ae1ce8mr61425926d6.58.1773278613817;
        Wed, 11 Mar 2026 18:23:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb4b3sm25165286d6.14.2026.03.11.18.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:23:33 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v9 4/4] MAINTAINERS: add entry for SpacemiT DWMAC glue layer
Date: Thu, 12 Mar 2026 09:22:26 +0800
Message-ID: <20260312012232.373713-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312012232.373713-1-inochiama@gmail.com>
References: <20260312012232.373713-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_182335_315613_6ADA5B38 
X-CRM114-Status: GOOD (  10.42  )
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

Add a MAINTAINERS entry for the SpacemiT DWMAC glue layer driver and
its DT binding.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2265e2c9bfbe..dd72d26ac837 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24834,6 +24834,12 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/sp2*
 
+SPACEMIT DWMAC GLUE LAYER
+M:	Inochi Amaoto <inochiama@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+
 SPACEMIT K1 I2C DRIVER
 M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
 S:	Maintained
-- 
2.53.0


