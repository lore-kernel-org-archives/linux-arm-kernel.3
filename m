Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CC9C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghfIMyhHNTv4pVd6MkPzn/cUBxofhg4t0WQr6qoTSzk=; b=ch8Zm637xFJIn3gTg9HA4Z4BxK
	lew4hT/13kQ2HB1nQiVX5kKYVtdy28etTkVbdaNoturvCvSEvIAUv7zoxPzMMQH14YemPyEJI6hZE
	V7e37CXTt5VBq8HVqS/iKasjPkQ5iE63BXGZZW+guujYekxUpxyZ7For6aKTE7gKAStuYGfeyEx9M
	PC5KJdFIgrvqepaNDs704VONCA/UHJAK2EJrIYD7CtHjHrg/n2sncJG8H2viDzZ9hzcopR9l/ZYmP
	H6FyVRWDz0MWsarHUiWoFuz+7LEp//XNRJldx0shLqPiRHJAfLqsXWEpDjLawLTL2n/V9CWyfS2fH
	Pj2kxgCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwye-0000000FNXz-2sF0;
	Fri, 13 Jun 2025 05:29:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwr0-0000000FMlZ-3UGN;
	Fri, 13 Jun 2025 05:21:27 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-23508d30142so20691725ad.0;
        Thu, 12 Jun 2025 22:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792086; x=1750396886; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ghfIMyhHNTv4pVd6MkPzn/cUBxofhg4t0WQr6qoTSzk=;
        b=MmfFvdUXXAaTctf9jG5F+tO5qZYAol0tlhEjDgz13hKbqkiLGkM3nBpRoJlbGzqewJ
         6IeAQVf4EdXeRSTbZeok2a7LJx4g0WgRfebw901QmIHlOc9Nm7udbU0A/47OJ3kbCTSs
         owEf1R8O6o0zJ8SX6Ubtot7U8IVBr9oTxQwUKYCBDKRBDmrQnYYzZZtRDDTQwaH4HYI+
         UAfiptu7NzQwk8/bYgmG9YQIxza5NXB9P8AWaDZgSJSt1tJJdV/DPEfTuZsywZk1Cdno
         FlCXJ/RvYiy59EaX+h5ll7siRkwI4w7PfQXBp7G7C42M99eXPf7/7Pl1QtENX+OIWNQX
         skIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792086; x=1750396886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghfIMyhHNTv4pVd6MkPzn/cUBxofhg4t0WQr6qoTSzk=;
        b=VAEX9A8zh2mgW28NC03ZzMOb6Kdt1o/xEOLBZavlmn/nOSeVlt1/kW5YXnz2F3Ub2V
         mcOHP9VOZl/8WE7WSFjbqfpRKet2lPdwjoZ/RZdaiUgYBELyYa6lgw4tKUBjizGJUKgu
         FeIq4MSMEa1gD93DdtsDv0pmEPJn+MJwVPLF5mdBBz7oHoHOMDHDG9x7A5MrJiF+HC+G
         MBOzcO1CuXUL54HgR+ENA/1zbfI/CBXx5IMpw/2cAbL3YPm0mBdkwX1YFtHRLXskvxGj
         wliW+2yF9lb+oU29ag1zfAW1YdI66CjADj6dlKZb9E65lEfgN3Ijzj9npSjE8nqsouYk
         VRZw==
X-Forwarded-Encrypted: i=1; AJvYcCUIYGuBYylIxKUhb8GHi/TKGy9P2qld6hwKaA6roP9tcxjttkm/iktv6B0c4r3TOEa62DGo90YJd5NLfJElG010@lists.infradead.org, AJvYcCUo+jdWcWG2//71recQUhrODAj7UWuGXtcAiT+u3+tJFH1wOHfYk5lMjwNjoBlIKrcX3y/qalcMfcCd@lists.infradead.org
X-Gm-Message-State: AOJu0YweVNbQNqvusaaw9I2hpUCrmR7mbDADusl50Va58O3N0OQLVSHq
	KPiGg6r2vgzT+YNxk+hO+P2UUomhW7Px2h8z7nyAALL2LuTvxzPnLSRnRiuCii4R
X-Gm-Gg: ASbGnctJGg4bhNK9IFALzKTT7lp/eYjtOCSXElQbFWauZgmBxZtHrJ8ZE1KPI5MWduI
	NYc+rK552qMmOCkYvMK24MzBr7aJebUifLwvRkRmz/MM0XRh8d6EcIy6rIHP/x2dNmC0lWQ+F7x
	OAyN5j/LA/3obvlCRsO3CD+Eaf+5LK6wucpevMMLb31syegmj8jCgsL/oazR/l80hwAU0wSZOso
	ImAxHbqMKkC9Zf/Op3hJF3OU70lDVn5A9SP+vTaw4RUiNgpZfitXR+OsNeaO7uoSyVfDnsofl7/
	W44Cyf8uAUwQZiMQDfUZmrL14g1WdwPa0XrnJkP3cCICjXYBaw==
X-Google-Smtp-Source: AGHT+IGAB/OwhhPFQFM3I9gr3ZwX7mrBBqSd5Qamv9Oz4tI/DHuOdn1auxIzxZx5T6regSbZXfV4jQ==
X-Received: by 2002:a17:902:d4ce:b0:235:e942:cb9c with SMTP id d9443c01a7336-2365d88a17fmr25921145ad.5.1749792085991;
        Thu, 12 Jun 2025 22:21:25 -0700 (PDT)
Received: from geday ([2804:7f2:800b:7667::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1fafsm6391965ad.70.2025.06.12.22.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:21:25 -0700 (PDT)
Date: Fri, 13 Jun 2025 02:21:19 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 2/5] PCI: rockchip: Drop unused custom registers and
 bitfields
Message-ID: <0754ef2677ebcf2803f5e31301e617b3422895de.1749791474.git.geraldogabriel@gmail.com>
References: <cover.1749791474.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749791474.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_222126_871078_F662C709 
X-CRM114-Status: UNSURE (   9.10  )
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

Since we are now using standard PCIe defines, drop
unused custom-defined ones and instead reference
them by offset from Capabilities Register.

Suggested-By: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip.h | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 5864a20323f2..f611599988d7 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -155,16 +155,7 @@
 #define PCIE_EP_CONFIG_DID_VID		(PCIE_EP_CONFIG_BASE + 0x00)
 #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
 #define PCIE_RC_CONFIG_RID_CCR		(PCIE_RC_CONFIG_BASE + 0x08)
-#define PCIE_RC_CONFIG_DCR		(PCIE_RC_CONFIG_BASE + 0xc4)
-#define   PCIE_RC_CONFIG_DCR_CSPL_SHIFT		18
-#define   PCIE_RC_CONFIG_DCR_CSPL_LIMIT		0xff
-#define   PCIE_RC_CONFIG_DCR_CPLS_SHIFT		26
-#define PCIE_RC_CONFIG_DCSR		(PCIE_RC_CONFIG_BASE + 0xc8)
-#define   PCIE_RC_CONFIG_DCSR_MPS_MASK		GENMASK(7, 5)
-#define   PCIE_RC_CONFIG_DCSR_MPS_256		(0x1 << 5)
-#define PCIE_RC_CONFIG_LINK_CAP		(PCIE_RC_CONFIG_BASE + 0xcc)
-#define   PCIE_RC_CONFIG_LINK_CAP_L0S		BIT(10)
-#define PCIE_RC_CONFIG_LCS		(PCIE_RC_CONFIG_BASE + 0xd0)
+#define PCIE_RC_CONFIG_CR		(PCIE_RC_CONFIG_BASE + 0xc0)
 #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
 #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
 #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
-- 
2.49.0


