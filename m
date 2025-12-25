Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D8EE7AD4B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 20:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKwve/VNJLUOgZQnnXVzQFr17A6qQtPic/JNhO+JtlA=; b=niLBPBbhPvKnYarE/OTDkGT9B+
	CVked5KSpGu4h5WtidCo0RnVqxsrB7fW0n7mqa/Omoep/gzcFW56uA6BSMReFOXq+9sv+VZ94lq5+
	/0xpX0IB1rsa2wIR7klz8ySuw1v8YUecO3Q0BXHikMhg1+CCH+bEtAN7JqwETcJBFRjap6rX0y0Qu
	NRybwSBo5DDKi0U7kmGhE6Ccwc5SkXIxaVl0aVahG5xr/4+3zNY61mrBVFvFYqXrxhrqGaRkjeZWf
	gf6pBuJA/Mi+4mLS368iB4d+Gzz+iilYO9Z8FZeBgmFifbCyQt6qhvYVDoqsVavOtwl98TNTwofvH
	jhNsfzlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYs0R-00000000fmd-1pBZ;
	Thu, 25 Dec 2025 20:32:19 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYs0H-00000000fkU-1NDe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 20:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766694726; bh=LmSVp390ROAY+bj2u5T0v58zEz53LnbaV4erMrJLs0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hQhyvcolNHRieWFsT21yvp8Yx7adPu4Bhgs78K7YY/PKptIyNOgAIbrDmWuiZT4pj
	 zfCUKVcJt8wQtEgQMBWJBT3UZp8J4iqBNw0Totg6J1uLcNP8Zeauc8YBowfBjb2b3y
	 iInX7pAbIpzU4P4OR8FnaMSQyELuckp6FpTimcDLVgkR64ZC9cksYoP40ChmhdbTrQ
	 fp+KvOw2gT5j4SL1nbf/SVHbDpo83JBrKA+zjQdJcbjHIzCwxZrwx7WqFJUJ29Gwpa
	 v5+UoBqmgY3Ic1QS2CVDdnUt0i+iA9NpxFvzFHXW2rn2qqZlPWmPbEZyK70Sun49z6
	 VrvtagvVABvXg==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id A1D0F3E8CBA;
	Thu, 25 Dec 2025 20:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1766694726; bh=LmSVp390ROAY+bj2u5T0v58zEz53LnbaV4erMrJLs0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hQhyvcolNHRieWFsT21yvp8Yx7adPu4Bhgs78K7YY/PKptIyNOgAIbrDmWuiZT4pj
	 zfCUKVcJt8wQtEgQMBWJBT3UZp8J4iqBNw0Totg6J1uLcNP8Zeauc8YBowfBjb2b3y
	 iInX7pAbIpzU4P4OR8FnaMSQyELuckp6FpTimcDLVgkR64ZC9cksYoP40ChmhdbTrQ
	 fp+KvOw2gT5j4SL1nbf/SVHbDpo83JBrKA+zjQdJcbjHIzCwxZrwx7WqFJUJ29Gwpa
	 v5+UoBqmgY3Ic1QS2CVDdnUt0i+iA9NpxFvzFHXW2rn2qqZlPWmPbEZyK70Sun49z6
	 VrvtagvVABvXg==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id 2AFC33E8B7A;
	Thu, 25 Dec 2025 20:32:06 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND 1/2] ARM: dts: lpc32xx: add DMA properties to the device tree node
Date: Thu, 25 Dec 2025 22:31:56 +0200
Message-ID: <20251225203157.1414349-2-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251225203157.1414349-1-vz@mleia.com>
References: <20251225203157.1414349-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20251225_203206_677779_7B000988 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access 'reaver_cache/texts/20251225_203206_677779_7B000988': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_203206_677779_7B000988 
X-CRM114-Status: GOOD (  10.61  )
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

Define the supported by ARM PrimeCell PL080 controller properties,
the selected values are tested with dmatest.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index 5ddaea8c481a..a49b8e794126 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -84,6 +84,14 @@ dma: dma-controller@31000000 {
 			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk LPC32XX_CLK_DMA>;
 			clock-names = "apb_pclk";
+			dma-channels = <8>;
+			dma-requests = <16>;
+			lli-bus-interface-ahb1;
+			lli-bus-interface-ahb2;
+			mem-bus-interface-ahb1;
+			mem-bus-interface-ahb2;
+			memcpy-burst-size = <256>;
+			memcpy-bus-width = <32>;
 			#dma-cells = <2>;
 		};
 
-- 
2.43.0


