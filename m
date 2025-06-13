Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3275C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/L0PwwkoPnRzlL6fmDLU+JBmZkHn+VWrN87UcWrxlw=; b=TCXklCXGN3pyMjj69OfbRta1Eg
	7r74JvcGhuHAtEF6Pk7GQc+B0uOmSSfPMe+Q9xVCPh6yFV8OWxdO76GWHJuvTVn7C108BO+OdSz+j
	X6oTOlo72XHoxrCvLp029beqVvhHHy7UUrOr9+fFlciadXiwM7dNRKmEXDasZjJZ9YZSA/mPKhjUg
	1TiMJ5AoaoE0pnBxcNi5Ahx/q6pRi1KQ1FyCkEVKkOw+F17LVrsLH1zeqgtzKtGVETLcSkKD86EjN
	m964AkKpoGUM9OPmIgD4CJhVGQ8uyZvxA440y+D5RbwW7vHXBVJPOL1fKkphWll7RqDI8nmFsMHyl
	9FFSUbJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7KZ-0000000H3kw-0sFJ;
	Fri, 13 Jun 2025 16:32:39 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5yZ-0000000Gonm-44qI;
	Fri, 13 Jun 2025 15:05:53 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-748435ce7cdso2031310b3a.1;
        Fri, 13 Jun 2025 08:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749827151; x=1750431951; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d/L0PwwkoPnRzlL6fmDLU+JBmZkHn+VWrN87UcWrxlw=;
        b=WPd6+oYbVxlSNFCJFgUWgq/95GXI5Uqdg5tmFk59ytUlZfXUjwiFVlxBJCIklhgDn0
         LpjIGTUUFAa4Z9FvIRLbBy75qdcZ1atjZEc2+uevxa83MPH3HABJxPR+xzXN4WYR0H/X
         TgpktwIj7GfkMxaFPilL1flnWtIFD7q8qVXzI+Qg+pCzbY6izFHYNAPS5tUkhdAavXK0
         aGjMaOX9T+o6S965QZfzZHptNngHbAKs+p8qkuUjgwG1+S0Vlk0W160XTJUD+fVlMPqe
         xNrggIC69jbMethp1j7lkTpjerzDQmcCZP61cHJkI2whb3mCi1o3zQzKOKYDaGYqr+Pr
         VNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827151; x=1750431951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/L0PwwkoPnRzlL6fmDLU+JBmZkHn+VWrN87UcWrxlw=;
        b=nqvBHs+WjXh+FAcpNiauC7FYQGFPr99GQ2/j9MDtPp3zpJVsyzIYX8EQAXO0wE/Rm8
         aUxtJwch5dgWeD/44H+zZvfjWP0asK2tf+Z96/WCLC7emsuwbqK2u/wmg/Z2iNZwEia+
         U0dRfG4exCvvoHmV5rIomArImPkSKbPPfOvY+Rlg3BicuvIhsCQrd1zAdj0ZTcU6qUJE
         XL7OdJBgseGVIiRr82QsRNdkXN6j4ASOpYpOyCNBnfHY9So24tjCa3WDtc4j5vTO1CFQ
         RckiURJaeMVw4vjm7gq/S3CHSVHE6jN+u6b5M+czVjYsbeonAnYkJL6gAw6Faj5synoN
         bf5A==
X-Forwarded-Encrypted: i=1; AJvYcCU3ntI2ZEv5ibDvgtB6POrsbqE3QasDCOD0DzQFj8YsdNiYrCZ1hcWg6rkIZFOzfIaqsQe0GT8ZwTSS@lists.infradead.org, AJvYcCVFbD4mACIn9FEPCpgHH3FoXRYmlNkF+cZkwhLH46rv7seZttsq6SsgX8LUKE1hKegXWaPJGITQyB0eSH7aqJ14@lists.infradead.org
X-Gm-Message-State: AOJu0YzvPFfraULvi7Z+sauA0t+ibMUiJlBOQ1a1LtHaIoH2mouFQKOm
	mNZQsrWCMH9ukh4XtACMkUt5wm4AUek/x9F8FuheNXXCV4VVfB/UJmAkQofHhGXT
X-Gm-Gg: ASbGncvmU/NQViUZtZiMarpYIuYctkyY0RWBj0i4RHlHO4w0QybaO9z3PVL/Qzo960B
	w+nCxBXPAVuX2uGVaE6QNeCC5fPOSiV/NYi0sQSOz9tIhKlzqTnUxovLet0YAnZ/0zq6m1aJVzn
	Wbaf0SF+qrlbXYnitcLGZVFmAHdi379FUySB6hQRJLHgzADmopXJ8J0bQSRDUsPDTnqrRA10o8V
	kwLN6iF4BwPuSdXTZ38fuItsu35os2i3Jd++5QQCvC0TBGLFU/qpXiKEfwyLK8zUOZllPDN01mR
	NMm620J55cA7KyrAlIV9ypv6JoJ+C8alU0a9616lctzquR4KHw==
X-Google-Smtp-Source: AGHT+IG4B1Sr0UrOZfVg0WrH56Dwn4JeKH9TeQsHR+vKAhqTKWcWTRjwhT3U5qwgEodmsfG4i94Egg==
X-Received: by 2002:a05:6a00:4fc1:b0:746:3200:5f8 with SMTP id d2e1a72fcca58-7488f8044c1mr4455309b3a.22.1749827150000;
        Fri, 13 Jun 2025 08:05:50 -0700 (PDT)
Received: from geday ([2804:7f2:800b:838f::dead:c001])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ac001sm1725865b3a.108.2025.06.13.08.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:05:49 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:05:43 -0300
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
Subject: [RESEND RFC PATCH v4 2/5] PCI: rockchip: Drop unused custom
 registers and bitfields
Message-ID: <ed25d30f2761e963164efffcfbe35502feb3adc2.1749827015.git.geraldogabriel@gmail.com>
References: <cover.1749827015.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749827015.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_080552_005709_92BB44FA 
X-CRM114-Status: UNSURE (   8.72  )
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
unused custom-defined ones, which are now referenced
from offset at added Capabilities Register.

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


