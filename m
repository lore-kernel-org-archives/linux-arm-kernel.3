Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C41D73EB4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 02:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=; b=FWJRRe5JginW+BkNoIJAnGpozU
	dveQmspMa7B/3oYAu4o94r66Kmwfo+1daDrsQXcZBA13S7ByyDq79gDuj0qUcDa0zdSrrwQ0uYsay
	BZYCzwhA0WLilgGJg9G/Arpg0rxzBHAie0qADuz4CdlxG/1ONIWxiCdDW2hcWnbAVv8Pt0TGFpb+u
	ZrNAiY+PIzQiM1nh2tyaKRvZ56MAQ4nylENTvHWDxe9MSLBA0vLy7SQuEhSEYD6LHRcxNjYE4cimy
	DXIaUYcbEvZFoLhK8RSZaMh4xAI1hoCIOLLnoanA6cwc0jrQKyqALnKi8n+0fTEmFH8vI+2F1OANl
	4L9tqb+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleES-00000000tex-31Us;
	Fri, 30 Jan 2026 02:27:36 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vleEQ-00000000teH-2Wh0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 02:27:35 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2b720e4dcb4so2073591eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 18:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769740053; x=1770344853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=LhT+KhlZ7jjSvIZE02ljlg3+qVbSiihHV92wSS+7YZ2Ji3uIkqXIeGtzMGRjqRT6Ee
         c8viBs5iEsxcyQS7mjy5L+4/b4Qqn5V4kzMF+J87hm696/9a0TxNhgJ89jbzK0bTn895
         as0I2oc0QjrrIkW2f7O5b3RBVVoTy1doqeHUDPf7XfS1DJ4mZvQzdQW7McY1ICxVhfLe
         bbNzJNIDNNtMqT02DlZjRiKGlfPzaxNMFU/cdYkyZQYlr43WvAYIVTQnssgF2cmjjLmf
         PAOHrEmlBrEKDLhbNjBw0ZUrxM0NX6h7jeCD7cSGz9YZrHCs0UJgZofm6hEGCLxg4/4L
         XGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769740053; x=1770344853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
        b=gGrJCYzYHSYX9GmSSv+8+TL0AazRw5Ub8/mx1cUivNidpq3W10hCHrkq949qqeuj1s
         Oj8p8yUJK7AQz1rdJCx/IyJskBVJeOXSQ9JWTntxLX0naW+iIxl0sRa0GBvFWzP76xtd
         1qNkjkT7i48UWc1DSMhWt+1wy/2bTs0byEstGT7J+9hXTm8N85ahqX2d1RAH3YFRcZu+
         YxIdyrrEvM5rzmQAi0kYs5KtI2I1Ck5bwDeFQBHO8+HhhTo78h4iwZ6yzyDyLsoSvXAG
         kIyOc8mBhfo+g+Kd4YAJteD01vkRiBSMU1lUl1jO9IoCtS1MbVhfTjh5NUTC1w+aETx9
         TarQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4/w5lrLutfa9x7oOjATS63LMcCBXaBHIkm/WWvbH3Gc62FT5KWm8MRQkOuYZ4DzzE1ghx3qjKdC3yJdx9PScD@lists.infradead.org
X-Gm-Message-State: AOJu0YyhocR3skhGvuzR5ngO/DYXqk78l+iR5jHJO6DAcqrADd4FxKOw
	vdUuzAk/bgHBgWNqCYA15B0EZI6euaIjoK4k2wpNROzlq/lSfi396fWH
X-Gm-Gg: AZuq6aI72KcfIrctKdEeT0d6yLcgalRIwCoOmeQ7d1KXtmkB6yJhKdOPauUEBE9hE3D
	V8yORr8jM0fnuDiFAs7FmEJkCLUYAyhZ+bOCUz3MrkjZU2V+rsg8Eey2eHBLQtpWGNJLcKlArg8
	RQE/qHoyQdjHL1EI8F4VzFs2nOgGGCJRZFPztK3fFTCfFcirvoA4n6Oxsp7iA4FkaJOTBorLSVA
	Gcx+swkgbzKHZJqLSepv4oTr2ouR6M2KLJovzQW7CuMjCFgKY20mU9+Uap/vhknsu1pGu8JGykw
	7PQigqCsJnODV3bl8G7Otq+5VSKPoskn/sjpFx7aqnU7qd0b6phkbigIOuq/tjbABpMNglHWhO/
	jkIc/d7ScppsvwojbL60HvYFd4RPU5MISodzV+0kxP4rrDZLka4Iu8rYCj7RIptneVyA1382ung
	In4PjJWZrGKw==
X-Received: by 2002:a05:7301:3e18:b0:2b7:4118:88aa with SMTP id 5a478bee46e88-2b7c890c90emr706190eec.35.1769740053090;
        Thu, 29 Jan 2026 18:27:33 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfc73sm9365628eec.6.2026.01.29.18.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:27:32 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v4 2/3] net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
Date: Fri, 30 Jan 2026 10:27:03 +0800
Message-ID: <20260130022705.1059214-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130022705.1059214-1-inochiama@gmail.com>
References: <20260130022705.1059214-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_182734_666208_F46A4AD5 
X-CRM114-Status: GOOD (  10.64  )
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

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 8979a50b5507..54c7b1537ab9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -396,6 +396,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
+	"snps,dwmac-5.40a",
 	NULL
 };
 
-- 
2.52.0


