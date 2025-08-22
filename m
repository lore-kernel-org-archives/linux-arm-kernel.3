Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDDBCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjR01mpTA/FgRQAryH3FQjQHwAPO0VaBjRlehQsaKyc=; b=Lgyhv+SUfxO7GF4HKeQkLoNxbx
	yrFPamqcgbtPYQTeqSrr56aDrvzTUwc/6Z7g3tmXOX3kmSn4ySQ7y1L/Q8AvIT+BtJKZeJhnIWAnl
	SkAkQzj0pDqF8AM+7HsfzkKhgbh5FeQosPFZeAnusp7P0Yhxz4BX9VBw9ztmeHStzfwk2VSUCeIXT
	D4VxKWBGWfXEb9Hkv/mCzDvA2gHk9nMD1ikLVoCnAYdRUp9Gx2VRHWsDpOyv5j+0EIHDYsjJ7o44d
	LthoPe6ON8WMFlJLfzi14h74Znr5QEthVr/5HOxt2XBc+NrE3woJdbP91E6uyr4NgUYEMddazSWpL
	kKvamt+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphqQ-000000045JD-08Sr;
	Sat, 23 Aug 2025 06:35:18 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRuZ-00000002dqE-11OK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:34:32 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-afdf393978eso31607666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869670; x=1756474470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjR01mpTA/FgRQAryH3FQjQHwAPO0VaBjRlehQsaKyc=;
        b=Gfp+RntWwuaHDHMRwCDj3YMtkjtzQiGSc4kApYocsmMkrpJQKZJqrEqRgCui6BSVwL
         mGHItndo91okisO7r6kLibyTdlRzuB5Aja/hYkxsKFuZ4b5S3NrNdSNnVC8Br6sgTto6
         8gD8fXNgcwv+eFSwfuXVhSZriEhR30XLyTkoIv436jlpWenNqVyHGtwyojHD7kFmAT2H
         Bk5VkoBgIRETgYqVhWiewXy5PKfNXz/f410mqPXDsjO9Va3g74xmMNhwt4qVQUM6ZVJM
         S78nNNzHbU/BIHlct15QZDfV5aR/fg9a/K0GdxAy2MqrHM/mnkhUN0oZDAmajTS/7UlY
         PLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869670; x=1756474470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjR01mpTA/FgRQAryH3FQjQHwAPO0VaBjRlehQsaKyc=;
        b=tXI0zLRGbVxwKQyxbplWF3Utw1mId+2ZezE9Y28lSfD2ujG+lo0IGhSnV2XZ/tweKy
         c4BGDGKTQeOlJpwqePo7yl8O7KVgf4ilk5AneWMZy2GkXyBtTiOt1anJqs4hUfK+bpqm
         ruu9DeldEboFS3K9Odyo7gf4mjepFOQ5kKmDezigB4svqwbW0cy96iiA+epmmI/FOYWS
         fzwaJEKDjcnXNu9K9UkSbtWEqrZ8hRfKfEV9dRNBt5KiFDxcRZ1C5EdTZS0ND78+I3c5
         4s04nJTpfqYk4j9duTxoa8mQqpoBmpk+9tAZqgn72+JrJnwBSZva1ILEfoJb/zxTRjtS
         pSsA==
X-Forwarded-Encrypted: i=1; AJvYcCVWDZaVUJcmVzI4k38pdQMCZThXW5+VU7AbW2MUvVNWypdfGX60Da6XifmU82lpDuwmcYZHOsDC0W9SuzrZs522@lists.infradead.org
X-Gm-Message-State: AOJu0YxjZnk6nY7y8Aa7Luwy4iOjsySdPhJhxYCkYt+ODZ/hqiWdmJYW
	xCcoUXNYJv8peek36ZfUJe7NrCJnR+wWrf18P73qsbFgFJKzsllJskzVY16eD4R3gIM=
X-Gm-Gg: ASbGnctobTebPD+AFd3atH4SwgjD0nz6SnFRS1O+27djUoQh86m/9bObzVijRmzLxv+
	/bVcqoI9ofmzU4sg1tD8QRwBhFU3UJG15XT9vCXUy3l0PJx6vLnUi7rfG/Z+YqJ+nEvE2tXPV2I
	aKIIcB7DGU3a1BQl06DxECyUc934xMXK2DnzrYTC+XcZF5OKTNhyNKD9+Ja/FqJNB3BQZpx4qCz
	d/pCVzNfFhcfQny8hd0hYmdj+fnSbgG8ZoBPFaw6J1p1Mv6GikGn1zIAMYHmcpd/R3QwWQcTllI
	EMYQvN0FKea+n9KCPA8vzqwk/qIaxOvWdYnMDdRL/ajWQnEvfXuJXLMLsKqJoaiG+UzWx9goneN
	s9qU5tUgtc33/oFJGgHfz7VH/QjZhKbMFRw==
X-Google-Smtp-Source: AGHT+IG0djM5vkVjKtqATY40fY9Wb5Wze8zQ3BsMcnoG3CML2bPTf6Fv8g4ybdgbJ1uJrtAz/o2ZYw==
X-Received: by 2002:a17:907:1c93:b0:ad8:a2b3:66fb with SMTP id a640c23a62f3a-afe28f161f2mr132736766b.3.1755869669676;
        Fri, 22 Aug 2025 06:34:29 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded3020cbsm610986766b.31.2025.08.22.06.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:34:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Antoine Tenart <atenart@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: amazon: alpine-v3: Add default GIC address cells
Date: Fri, 22 Aug 2025 15:34:25 +0200
Message-ID: <20250822133423.312621-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822133423.312621-3-krzysztof.kozlowski@linaro.org>
References: <20250822133423.312621-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1253; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=v1bJFiG/bpHsP4g5W6ttFLd4QJEoxXuP2+XZUgVkyQQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHHgGKZ+Ix5QJ6gJkTziu8RPr7oyQVWB2E64z
 wW5UavOMQeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhx4AAKCRDBN2bmhouD
 16ZJD/4/WN+jrviLsHrxWXubONriHMkPn+HTcOFuFRtswg+4eqZNV2aHR93NOJD8iMFMn1gbcQK
 duJmeipd4VOA/F6M24dmH/M9dBl0GUV3z/A1PbU0Ygwl7ovS16Zwt6F4ZPXWZyMB+iV3bKv2fxN
 meNpcpfd09yImgz+UV9u21zMbjz4SwlIaiTMjD3uELWFIImm76yC0xRhDNzs0LgTsY6L72Hv3e3
 HDeLCOsUm0qsfwbH8QgQlql+nreApeUufEswqCta67GjthzEFTUAip/EvwlIp29gHBXkdtNFw/B
 C4ivodonyUp1Fg7/Hry3ZKZ0tIk3QbkEgz7YD7DkojTmt3RrKdHZDiSSfQ9OyK2K+5MbZcfcXnG
 hrLBOKBFyWXj2dU40DTEa/e6EassyjnelvxaHgoAy2wDuHtwwEYEPc0xIHJUs50DykPCfcG5q1k
 od1yntMuKO5ysccRijUW8l6txazNX8+ZkSdZdlCYdJnjl191TSYRGWc6kuGMSUEqrytcVpIGx5C
 EURZYxb5JxZ59f+0pu6PAhp7qJi5qS8NHl+02bSou/SuRS7kmhrnQ+grHor95h3JW22Ga2YAeIF
 qsoHzePOJauHfI36gW7r/rMhCmDgoXxWXT2Q43wDs+IdEdpZIKw7//ij4wJ9PO/uvL9OL9OS086 CnYoQ3bI1vQLsYg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063431_280304_E58CB446 
X-CRM114-Status: GOOD (  11.54  )
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

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  alpine-v3.dtsi:342.4-349.33: Warning (interrupt_map): /soc/pcie@fbd00000:interrupt-map:
    Missing property '#address-cells' in node /soc/interrupt-controller@f0800000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amazon/alpine-v3.dtsi b/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
index dea60d136c2e..bd35e0e9d0ab 100644
--- a/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
+++ b/arch/arm64/boot/dts/amazon/alpine-v3.dtsi
@@ -320,6 +320,7 @@ soc {
 
 		gic: interrupt-controller@f0800000 {
 			compatible = "arm,gic-v3";
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			reg = <0x0 0xf0800000 0 0x10000>,	/* GICD */
-- 
2.48.1


