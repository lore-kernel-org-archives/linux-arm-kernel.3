Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8131BCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 07:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1JKGCDIkSDMV2O6Pn5OGiCTad+ltyhYyD3CS3WAtyS8=; b=sM0Ku0+mk59u12bubNxbyI3uBU
	2Axbs+EfmAe3KpmowZMx2btt1iVpEJ68E8PFBIGtEFXEMWIJAWTWHBMDjl+2iwCfeRcu6tEX0GA2D
	hfviC7QeAV9dIASxc5N3woLFit7X+1yKueMS3EdYDvFZThVJXHQvMRETQpt686qHqKUxdUTaI+Pqi
	BUb7+kHxAczBMcvmjJNhKUJ8YHXr3ml73d0sUGoDKmBWXdSpJp18pTgaFdhcTp17DWBAD9kNGJsUn
	hHP5GaiKM7KRYdHKfh6fU6kG9Qx5fu9fDdinHRu0j93OVRZazUsQLnUtDsKYjNfm1tGYTLQebsRTp
	c28I5JnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymto-0000000AWRf-0oP3;
	Wed, 17 Sep 2025 07:48:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uymtm-0000000AWR5-0jF3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 07:48:19 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-25e5e1cd552so31637495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 00:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758095297; x=1758700097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1JKGCDIkSDMV2O6Pn5OGiCTad+ltyhYyD3CS3WAtyS8=;
        b=QlqPLkTswi3Q3xuVqdaHntOb4I0twLb2ZJoDnKY2UU8uExvbQ6toBHChp76ld8eXA8
         UMXR3LQa2i5U9juFTFxm8JzNooVW0k6Zkif4P5ZtVuC8/gbMADDqKbhZzbwiFg7176Eb
         Icjt71xnyIUgExnQcdJZUivID+voUz673qRD509cZW51UDE81C80cj9MmQfFpaG53Vap
         Pne6lay1YL7QUgwrKdfS/0qbFZxAAv/EXduBcVD/ZpMGoYm0mohbekH9CQrH9TsphE4k
         hihxch0ICLfn5YBqZFceAQTFjD4aBRHZjs3rLIZrCwXYDNqZktABcn9cHxmONuWF5aRN
         oVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758095297; x=1758700097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JKGCDIkSDMV2O6Pn5OGiCTad+ltyhYyD3CS3WAtyS8=;
        b=aj0Oda2Xh6kS9XF+Hd1YIayK1smcqmVJ6rNe2E5N2vYj9o1t6sN7tSTpbToB/OT0UN
         WwRLcHcsZlJ4CJeKQpxuNyW9wmH3DSVcwwfDXCD7fMEbw5VdanTPuxI6XFCXoRfOYADA
         +RI34Tq2ikla+W/3cY0RC/WybpBEtRz25CecPDNYddYyXkbWxM7f/PJQ3nV4ZHASZP8L
         s/mSfzjey2cs3ZcQF6+DvvyNk9aCXVpmQcDYTFbQ+5uZ0hvwCD4Z9JpDqXPbpIyoTDvB
         lFocjQJbAbGMbCWpN8uiU7sUuTAKN4BAuZSFTu6LeRCBEC72HNlAMikFsrWzT8raRqNO
         wX8g==
X-Forwarded-Encrypted: i=1; AJvYcCWgoUYHVzUZuxz8cw7LCLICYByb9CF2xt1a7RMGNl4hOfWii5M74JAdFcbUN29RxNgNP5YSC1Yqt7ltSBs0wdXB@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6hstOwljYccJngh1EqZo++7QK19+o5Y3/XFQPdLKYuUNvb28N
	0ZawB0vC2nWoWwe6XWJfVGwXvCstQ5l6wpPsSlk1FRPk/eemHKC0voRk
X-Gm-Gg: ASbGncs/KSjwHkugbLbfX4xJ6C9fP1WcWmHji6D2ux338z8MFgaLsYqvCqVCBVCpRVK
	GDFPFnUl/2n1lWmGiAhHOVubZMJsfbGDE9jyRGLRC7c7oqUWSY4YlsSYg1N6FEYXHkcXBK9EfYF
	+qnfHqsmL7eAqo4lZnnecPRzLIxJN3HYWha6qg6vCrS8PLiyCjnvu4CXQSER8UuzoNT+oypLzWn
	a3WMSmy7pj9gn8NP3ZTIh/KN/nRCXrWj91TrVkifMtKNe3Nr4onYIM5o8ejHkaO4ON1zahP1kxO
	rCATD6/qzqJURVmWhmIRgRKDHoF+NEeQhQDdxYudyIdkRK4Ex9VtzKeJnYdgPqJKAWSEUukIPcW
	KWAxRQkuBiL9Os/eW5SPKHvzhdKJueER8NhsiiuB5CJ5JHA2LQCw77fpQFRgzHhQsSrzjLGd/zQ
	JNyRA8G1AAtuVaWKSBPMOjFTy1n5XPsAe0uGKMx1KKhw==
X-Google-Smtp-Source: AGHT+IF3iFCqidqJcvK/xXuEBMbUNqvYtrcapIiOCibgP1M/29Qz0m2dsrVVMS/TbfoPK18iCzQjMg==
X-Received: by 2002:a17:903:19d0:b0:25c:25f1:542d with SMTP id d9443c01a7336-268137f2336mr13981925ad.36.1758095297176;
        Wed, 17 Sep 2025 00:48:17 -0700 (PDT)
Received: from meta-device (2001-b400-e359-6d3b-3881-d7b4-5e6b-c23a.emome-ip6.hinet.net. [2001:b400:e359:6d3b:3881:d7b4:5e6b:c23a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267df817ef5sm34796585ad.0.2025.09.17.00.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 00:48:16 -0700 (PDT)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
Date: Wed, 17 Sep 2025 15:48:08 +0800
Message-ID: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_004818_213211_039653EF 
X-CRM114-Status: UNSURE (   9.30  )
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

Summary:
Add device tree for the Meta (Facebook) Yosemite5 compute node,
based on the AST2600 BMC.

The Yosemite5 platform provides monitoring of voltages, power,
temperatures, and other critical parameters across the motherboard,
CXL board, E1.S expansion board, and NIC components. The BMC also
logs relevant events and performs appropriate system actions in
response to abnormal conditions.

Kevin Tung (2):
  dt-bindings: arm: aspeed: add Meta Yosemite5 board
  ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 .../aspeed/aspeed-bmc-facebook-yosemite5.dts  | 1063 +++++++++++++++++
 2 files changed, 1064 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts

-- 
2.47.1


