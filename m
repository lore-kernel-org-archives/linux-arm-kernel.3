Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F02ECD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 13:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0IlYPZDTmu58pp41/fakyyKvhFw5X89LEw/REFRZ2s=; b=d43zoS7BdrKagC5VXRRpgTGlvF
	3J0RRGajYsk+izNFgryNCsMqKKGO8XvPFBKIKY5K0eFAJNi1vGufSor7g9u+XzgzoU/266bwBBmaJ
	ofVa+oMUs/2fveA0ml/RvEglsHmkBZ9nQIRnL1MtpkoQU0iZT0R5jvZCY7+h8IpvNIgN26Q61cW42
	J3EQ+y0Zqy/mhOse+GP1xVdottFwN1ByLnVOboto/gRwPZOW7ahFZ/CBXkVze7MaYmC4d7vpmagOa
	gpoOf2TBY6wzkWSc/CKY/TRBMfRQWM8UcQNupN29ihQ8ziP+gabdcPkcqZCrPlSpdGENQ2pGwxq+Z
	EOTcw3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKBg-00000008mHk-1GUT;
	Sat, 30 May 2026 13:57:16 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTKBa-00000008mGk-2yIL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 13:57:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45efa80e0afso212810f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 06:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780149429; x=1780754229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0IlYPZDTmu58pp41/fakyyKvhFw5X89LEw/REFRZ2s=;
        b=NuF3zRB7Xtm6gpYvkwPuw1foToVmBeHB1gNdBokZ++7pYj+T7Onu2mNnmBY6VbIcwF
         4BqvkbL/0ZVijuxDSeuD4D9Gan4tj0VwBGA5jT8tlLu4SgVfDRkFqeQQS05vEs2TfQIa
         jzssdi1gc/usb4YisGI20IaoeOgOCUTKdSzmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780149429; x=1780754229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B0IlYPZDTmu58pp41/fakyyKvhFw5X89LEw/REFRZ2s=;
        b=NW5NUxytagQD2M249jgQxp6PJKSIlZpC7Rvinm390VFYjoqVQCSj7ZNOknEKPjHrFR
         I48SoXYjq8Oo/iwbA/Jp4E/mOZYTBVAgAqaEjJAemxOHij3dE6TKd+w6j6ARBiNu2P36
         AdYzmTrrRZU9IsDhz2XqOyFrVnjWXDHWG++JttSIsZd4z/rsgiUQKEkvMLNEJtK1y2B/
         ysTBIH05NqWQEZw38gBPhhVIDm3yOVfLDwvYWhkEUSYoE/U5+VeW85glFE88NT/zF/rn
         CVKuwEuul+WXwi+VfU6Nb2wHrz9QLK4B5+1oACXMqtDPLWWr5GMbvKMvwi0mj7hLw6zj
         iwew==
X-Forwarded-Encrypted: i=1; AFNElJ+RZWiMVaan3FItArOo4VXEc9ZFEidp7+oV82y0D3N4Db0BvlrwRSbB8l/uoiNyQqXaGSU5h8DLd3D+YufjC3U9@lists.infradead.org
X-Gm-Message-State: AOJu0YyYxaTS3u3QSwImfcvzAoknynCjBtvIvgIRihDSQzYHvW8w4P2X
	ZrHxftoXd6BCFileKxqPcy1dMLmn9OMkwInHU7N1JseNC9YBtasu4v77ANL+Ysp66oo=
X-Gm-Gg: Acq92OE+47VmKBoYSDLSaeKOtQBe5PjjuA6rFOlFLVKCuIZH5F1wH2GsEQu1s5GKW83
	wb+EGMm7NlBkdOdVUicObc/otX2x4Ht6cQDb7cu3pIrBHMCKwXiETzasQbnwPNzcPjpS8rBRA1t
	btY3CxAWO6UiuJX4tLZ68dkku4f1w1zFIY0+rDgOA7td1Ro9hbGGI5HSd/96HnoTsAFhDc1ce4x
	0DGGgFrgnUS2Nj+WsPEyGHf2Z4TCtKnUDrLKc1BTsmhY7Csp5P6Y1+UVASi2hAfIqKSCyRyhoBc
	b5WlphiFvtjxT/5iFTw3lF17RxKMw8GzM0posV36VPEDbvKLu0ib99R+F2/jamiA0M+DlbSSdr4
	SdaBe9SrsJdLQui+q9ql+8rHCuehzkCAvJux/ckAQvu50pBPFXLxHcHaSqAJ8fBpBRLRoLeya8H
	8SYtlPglstuhlyT6etSp9i8SikR2Id98hVNAo0SnQfTMuCaYNzkH79bFFaOXYEdrm4wZ8ROGqOV
	KF1vPmOHUvwcIyruD15VChXmLRTy/p6WpiC0TPDFs1jnh4Ej6c+4yB6o6AhhY8jOpfoqS6E7YNF
	LaECDghvYlBZTIOfFkjP+QTUgYQmvbLV
X-Received: by 2002:a05:6000:60a:b0:45e:7997:8b82 with SMTP id ffacd0b85a97d-45ef6b397b5mr6861406f8f.16.1780149428765;
        Sat, 30 May 2026 06:57:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-0-96-182.retail.telecomitalia.it. [87.0.96.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34b47eesm12101711f8f.9.2026.05.30.06.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 06:57:08 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 2/2] arm64: dts: st: add power-domains to sdmmc1 on stm32mp231
Date: Sat, 30 May 2026 15:56:55 +0200
Message-ID: <20260530135701.3961023-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530135701.3961023-1-dario.binacchi@amarulasolutions.com>
References: <20260530135701.3961023-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_065710_752663_677B4393 
X-CRM114-Status: GOOD (  10.31  )
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

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Add patch. Suggested by Sashiko

 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff..0feb8943efae 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -727,6 +727,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 
-- 
2.43.0

base-commit: f5e5d3509bffb95c6648eb9795f7f236852ae62d
branch: stm32mp251-sdmmc1-power-domains

