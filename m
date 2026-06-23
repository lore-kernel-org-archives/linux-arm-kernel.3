Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B26CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7ygF1/JVCediAjvQA9d7z/Koai/OFw+MbowQK5OiLM=; b=E5gqdPhbi1VJmkDsZpVR8wjeZd
	oUDZqz1TNef1Rb7geCWYrFg1+pc/MkriepHzj0Nbd3MKkjsBcxs9ejkzv4E0e7IAlbpeaBXNNFGNd
	cJw2wxoD6XzqJ2nFu3m7uGIkNHm3VaLH0pB1syQc03UtsEWtT7UHZP+zTwnYQDoGXm7n3hkxtWQr+
	nPSKAPOtLWrk8v/CEbQjAyrZQEK+CqFKIaVr3LT1IQptHVvN3Gm5cAqck7+ez+0X5KcpA6JZKLNDk
	DgtG4bvPhKR3PMaBda2bNb59HIMH7kgHssWaOnVszmPZMfjwbDi9x/tIJFNfFmde4ajkriRwGY9Bh
	Nw5Y6KGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28n-00000006ReN-2l76;
	Tue, 23 Jun 2026 14:30:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc28a-00000006RZX-0NdL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:30:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4924e6fda5dso13566255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782225002; x=1782829802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7ygF1/JVCediAjvQA9d7z/Koai/OFw+MbowQK5OiLM=;
        b=enV1xEn0E1z1tZonHaqUGbLa7eialgnuEi5Kd06I5Lg4juHmFJ3FXmD8QrzMo9Qkg0
         gywj5rU9wTzbj4jX2E1wyxWdEi3xcXEkxus1yvKtJT/4PKK3bPfOSMkYEltGMYOZP9pS
         Dj1Zdtr1yQZhU/YyUbThznDGXqGgHtiSu6j00w19Agss1lcWa7qqHz0vkcE/OnwPkJUp
         zLsT3Ch0zKYgMMPXAH59nrNjre3y+/YB/oTHGtvWQxaQbri7XM6CxSqZ6n+nUwSKgeNj
         BGmJJq3dMBB6i+KHW4I9X4v/gs+lPzSn0F059EtSeDMWkFIP4CALApb+GItAdO94HQZR
         cDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225002; x=1782829802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E7ygF1/JVCediAjvQA9d7z/Koai/OFw+MbowQK5OiLM=;
        b=c+ka0YRxIrlhUBsA8Zz5yj4qQZxcZwphru76t5/NZvCO6SuR9ZV/RDHUk59jK0aQWS
         HV0JQcNzmMwdHNmfdYp44euJRmAHKaaBmqhF8sQZvDSGIDPYRV5+IttyK6tMcqQhur8r
         1a/aINUU/jvWCfSsQ7JL9mrAoiWi+wqx2GJhpwzIBE+3can5m78mHzyBaRP5MtmcOFr/
         S8rBs0NzjXfT83iaDKWiUgBVUWtPfY9TlDLs2KsxJ/XHmjLIt/08UHFuNjAEGemwnGQI
         W2760EshOztHmCq7rNytmYNcVKDU9jwjBM9KU+emeXeHNJkTT8RcGfIzACInWKzfIpPI
         ibHg==
X-Forwarded-Encrypted: i=1; AFNElJ/pnemO6tght9l7KE6Xq2g01M3UpqalRLdTUA7qyyJ1SAPm/0nHVjrzAiyB4+HmhYYKHb9GPE/5ubgpAsiuSSQ/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/7V5Ilb7jS+N5ZbOeMcBsuV/eBTet5BbAVNgsjvRWmlbsCvWz
	yE9ZzRAkAqoa4WF+5Qtb/e53+ioPoj5t3LNJ3WbXz5ZPKyGuafIqe4VhkoZTLAupmLw=
X-Gm-Gg: AfdE7clrAafx9kgSYyj8NzTYzmKxpG8x6Yq4A+PBDu6ISblbgYv/cNeRHsh/A76Fa4x
	izlti54VH/I/HVIDovmLmrszUgbcmSNlX8InFvZPgh+vOjJivGK7joJ9544oN22aGg87JSsUhia
	2iHRdgLQrNHivlGZyr6cMM76JStaSQoFg3uOg4ViHtnS7vmEMtmL4701rVTBAL3Dzb+GwgOlxC3
	ByQbt6LU204XikPf3vm/T389W489CsBp+RQfi1AoxxjEudT1nT9qCE9UxwUIOED8Hso19SdVdBQ
	Fh2CRq6MDw+CcU+7FOaqb3I11ExKFJcPVd8KbCd5GMub7nd5UYZUaDdYqkrPvRq2LuzUacMh1zX
	YbHFUQP4bzFJlEsSu/dhTi+cdkjiqOTrj1oxqvrTFMTBCWRc4CERLESA3KJP00NlDzQ87i4vMmt
	d0BUGbUJiE4L2Tgd2iKfRjZJ7Erk4+Ux+CluJwP0bLLtkUHqhbPacy6EuHAt0HvnAm/guVCza35
	R+7hCyXgVA0j6CwaWD2z/faqkRa
X-Received: by 2002:a05:600c:4691:b0:490:b9c3:6c48 with SMTP id 5b1f17b1804b1-492490af5cdmr215448425e9.29.1782225001894;
        Tue, 23 Jun 2026 07:30:01 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm362507805e9.2.2026.06.23.07.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:30:01 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 7/7] ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4
Date: Tue, 23 Jun 2026 14:25:45 +0000
Message-ID: <86fc0b2a105a16ceb301ba53fadd096877455bb8.1782224060.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_073004_146271_01E8E658 
X-CRM114-Status: UNSURE (   9.67  )
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

The VUART 3 and 4 are VUART over PCI.
This flag indicates this information.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 7c02633f2bd6..2a19463b4c21 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -723,6 +723,7 @@ vuart3: serial@1e787800 {
 				interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
@@ -743,6 +744,7 @@ vuart4: serial@1e788800 {
 				interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&syscon ASPEED_CLK_APB2>;
 				no-loopback-test;
+				aspeed,vuart-over-pci;
 				status = "disabled";
 			};
 
-- 
2.54.0


