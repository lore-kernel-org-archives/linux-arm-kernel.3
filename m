Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A1FC83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 05:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EG55DPXz8+xtKpQRKekjwgyGLv4dODZAuNPTQZ9Shzg=; b=VjCGJ8B7Ixx7KXbRai+sfSz+UQ
	DeiMzD76Hv56bU/sDf1MovPBExa1QWvvDrj6rheU/cqclQjD+023NBMGSPKaDWwQPB3ktrD4bKAF0
	WZ5SxDvPsZ/3yqt2R/KGRavB7qeG1gNJ9Fb4FyuIr8GabSFHxoAUNT70mkHtkapKB3ztO4HImCqcE
	u5B7xp8QeVAk4cM8WugtKXapz96hJLYK4I5yGPMFLTt6NWHMFeUoqsVf1lbB1jn4Qbtqtzd6D5tAx
	8b4Wrem4LWHWfdcZIOQOe5yy7XwYD6ZgaJGGIOUHmQNjRAhYEMh1kdUv69CvQKigW4OnlsvFBh6nr
	4zmC4wuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpgJ-00000007Eys-20fm;
	Wed, 02 Jul 2025 05:06:51 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWpdy-00000007EQ9-2oMc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 05:04:27 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso2453052a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 22:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751432665; x=1752037465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EG55DPXz8+xtKpQRKekjwgyGLv4dODZAuNPTQZ9Shzg=;
        b=mbQ+CvQ4yb+fVu45A9AEu3QjeRShIUqSaNt7u4VIk3g9qOMt3unl8Ul+IGoqzQ7g8Z
         4x9omavlosDYRPZNjafjlgb2/+g/Dg6b/eNP3yKE4rFZqzA3EiezMtWxnz76jtaCe0F4
         EEgVFwXE91PoeFXwIBAI/UsYNt4kZICxLRJHENe69XbqifP4WFxLlye7JSyAQfD3bCRP
         9Dhf8ZO6mMDyL6pES4Pkpm+5s3Y+ykGOB3tiMDSawAaaZArU04JFKwgtzBNSSsOwb9Es
         dSfrQeMcfsQnC5oHmUIv5gsTSARj/gtpNCJ6oZFnp9Eo57uvLz0Vnch0UV/rVv7q3wz5
         XR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751432665; x=1752037465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EG55DPXz8+xtKpQRKekjwgyGLv4dODZAuNPTQZ9Shzg=;
        b=HOTMkTeIS/7aZNVcQkZaV/8yBuJkOhX1PZCMOGAC2tvcdDcoXpYMkriMh7x8ghVai8
         oAz9ilbq/b4+dQ+ZQscs2zOtvZSbGK8PYTBDx2eD15PyiHLiGWQo/eNldHodSZhzRo00
         9AnBNyMs/ZmwnnTg1Hj6W50N9KOP3/2nj325VpN8LadVTFK4k1d5IBFPaByXQKJBh/4u
         hWezNGddMzY8/MGVwxB5kwPOVyrMMxmjmM5yjDaAIff6cx/6IB8ELorAiyFi83m6j1V4
         5ccdgjjPbhLcWKhHj/bbpD3vbmQLh36TCymDXDNuTkSztp7t5Buni4VyDwcmGJQQFTHn
         vfEg==
X-Forwarded-Encrypted: i=1; AJvYcCUcA2mikQfIRy38xfHtwcYhymFKq/WTOXkQ1MQGg5rQzjX48/l5O0gcaZOrgDQb5d5UpLScYl/e+s0XIWVyBTsl@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj/QtRG6shsKOQVQ4fuLVPC1hEG5Q8VUeio1f5vvrJYD3aFzhH
	UOgHNab00l9v4FjdXr2ahpbZKtXSCSGZy2DKC7DC4kk71/MVU5neiCap
X-Gm-Gg: ASbGncuS+fJijWo/vbA3nO2wvQUfvHTXvADEGRL37Ya/V6tYgIMV+kgtO5kLezJ4vBI
	Wg04Wlq9ki6kqQcArq3lcrQVgtVOwTCoG7ZqiMw+x/H/nNPtnASpfyzHFIMqpGIdzuAyGd363wT
	Bcv6SMFNvK0PF8zFaml9wttpZQSjrwD5UWGn+qXZSVCy5FWm8WPnw9XWikNzv/L67J7yKFsGLNd
	Y5u/qZMFS2KEjWUQm+oPslB+EKMDQ+ju+AUVK81WLzHtvcRkNZw4n3RYF07A3XLIKbmcdcvGr70
	ahfuMoKhBjzgx1FBQB/Fx+/naGxuZh5SLdaRjtHMtAyTb/pa0tZ/mXQ2Ru0ZIO+44oY7yfDq03r
	vfTKs1+ieg4d58mSqr16hHkX6HYVFS0xjw7ygG97sJ2RyA59R3A==
X-Google-Smtp-Source: AGHT+IFAFsQgFBXHekzpj5+jLpvS19bLZNwjrzNUfqbzyt7jsiYooA3Z/RS1UmpTIK1dgo3CN2kBvA==
X-Received: by 2002:a17:90b:3d8c:b0:312:db8:dbdd with SMTP id 98e67ed59e1d1-31a90bef8a1mr2126382a91.28.1751432665347;
        Tue, 01 Jul 2025 22:04:25 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54270a5sm18168323a91.25.2025.07.01.22.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:04:24 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH 0/5] ARM: dts: aspeed: Add Meta Darwin dts
Date: Tue,  1 Jul 2025 22:04:11 -0700
Message-ID: <20250702050421.13729-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_220426_710534_EE99B03D 
X-CRM114-Status: GOOD (  12.07  )
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

From: Tao Ren <rentao.bupt@gmail.com>

The patch series introduces the initial device tree for Meta/Facebook
Darwin AST2600 BMC.

Patch #1 extends data0 partition in facebook-bmc-flash-layout-128.dtsi.

Patch #2, #3 and #4 move eMMC out of ast2600-facebook-netbmc-common.dtsi
because eMMC is removed from future Meta Network BMC platforms.

Patch #5 adds the initial dts for Meta Darwin BMC.

Tao Ren (5):
  ARM: dts: aspeed: Expand data0 partition in
    facebook-bmc-flash-layout-128.dtsi
  ARM: dts: aspeed: Remove eMMC from ast2600-facebook-netbmc-common.dtsi
  ARM: dts: aspeed: elbert: Enable eMMC device
  ARM: dts: aspeed: fuji: Enable eMMC device
  ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC

 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-facebook-darwin.dts | 92 +++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-facebook-elbert.dts | 12 +++
 .../dts/aspeed/aspeed-bmc-facebook-fuji.dts   | 12 +++
 .../ast2600-facebook-netbmc-common.dtsi       | 12 ---
 .../aspeed/facebook-bmc-flash-layout-128.dtsi | 10 +-
 6 files changed, 122 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts

-- 
2.47.1


