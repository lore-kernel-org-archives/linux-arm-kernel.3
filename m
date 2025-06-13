Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0BAC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/L0PwwkoPnRzlL6fmDLU+JBmZkHn+VWrN87UcWrxlw=; b=lHh9UV2yEv+CsL/B4wCtb2c7Bb
	bPvRknC5NbFpgKC396qjUX7eqLc3smwq35SZ18slUZNkYNjKNiM0GvX6Hy0+AmcU6YnPh59vd0zC3
	JcZSqHncURod9iGWeZWh1MOFnpJqEpWxYjWNgyEIiGXVEZMckx4xwypKbzggNf5Imdzxg0YqziNei
	dsGC3k7e4dVhXoxDetLxJBRlZQLKdIu/WDC/CXONVECjZhCSjAWDwQwySuVK5H/ZO7kB9EqLp7KEI
	ysjwLQtIgOF7gZF+ygHDTJ016M+k7TIz2z+1pUZafpJEGX9wcv8zADe1FbK8ILXwe72UIgmyCRtpQ
	xnenxspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6wT-0000000H0V9-3JGb;
	Fri, 13 Jun 2025 16:07:45 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5km-0000000Glxx-3OZt;
	Fri, 13 Jun 2025 14:51:37 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23602481460so21759305ad.0;
        Fri, 13 Jun 2025 07:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749826296; x=1750431096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d/L0PwwkoPnRzlL6fmDLU+JBmZkHn+VWrN87UcWrxlw=;
        b=ifHxRyCXOyjFZXTcMrei9kgdZZCbyIGVgaQdncJjeaCRNcY3oEW7v6lzq4YDRWRIwC
         3l7ENXmbbrzF/X1d7l1r1Sd1Tlt9hCqN+qU5K0VJHmUbxRcVgpU0QUXAZMqqwhMqoOvU
         TFdKObV3TlL/fgozG6G2mbwwT+Lo7e00CcOJnftdXjwBvS5QhY98fzvkL49hb0g2JNEw
         EiC85s5iA3sP/NctpxCdaYUQ/QYLpDuZq1SeHSMlq+mqLMI9PfEejWgXfQKw0mRkKfCE
         QKLYeTbKQESC4Wzqe/KBaAQOUc/HxAJJ0ak/HAfwOX4LVkDJdiHk2Q7XaaG01b+vjYKH
         HnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826296; x=1750431096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/L0PwwkoPnRzlL6fmDLU+JBmZkHn+VWrN87UcWrxlw=;
        b=M2f+rOtgkouGAmry6YbM9zm0eAp5T7Xvu4SmE0b+fuPkJsjqtLAXz3sG+nEszfBoOK
         doSYC07V5JjEOHnK9BBf8xTyBmZbzR0F8Q/H3B0HwliWWEW1C3Vhj5CzqveXWdp8/s2+
         m1mInPWU7CYSJXceKSv4O5UONZLhNaXKiCgfAEjjH+eBvm6SecNCwIJTPfdd0AEv20r7
         MeLc5+m515oy6qwenmkUNXSDJEyWyTHVSuuXrePMGaSKgr0mwpea6ZnQv7rg70ieb1Fo
         NKf6W6vkr2lVhDwJK9d2hAYqgQKmiD8k4dZY6+ih47naD0jcWGbpdqxZWfe2XqAnC6Bc
         auHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUICgUWawR7fAHoxSQlepkyfpjJ7Qb/eKI4ye6n5qGnB57bRgsg1cJiukY9xrr6mCdulm7yuxe2D0jbMx76envg@lists.infradead.org, AJvYcCXfO9QDkTsiM2zUjBuM9lh56A2/Vyjd3N9afwhMV+4ZfnAG9EslVRDlkJFjaMZHWi1HcYP+KH61NTEw@lists.infradead.org
X-Gm-Message-State: AOJu0YxuNqBrj7Wp2SousdMZyBHWpjVZZAWdX0WjfTQllyIDCq426yuT
	b28/H9Jsb6NaDoGOW5s/4Zx43hjKsLbtEVI3YijMAO7gEgJYKl8Dq4X+ZAQ2RjCV
X-Gm-Gg: ASbGncu7O+dMtlT/Rh/VKMEZMrsEtfZqvGtS3Ty4l234BcbIBFd9ZU28pcrvmy7BLsV
	rCrBlV90C9iAXYodq+vFEK+RrerB9TRXQg7P7Qy9rigylfs2bFC3LZO0rEYkEXoEYHa33MRBunf
	cZ4obsjmINEfbNjC9OxLAfuYJmDcDnYcJWlG2YtxeckCsAebPXtBGu/MLRq4bw4sbrHq4jUP6X1
	3zMwdkxVH74viJYOZAvMLNh5NZ6Ro0Asa5Lj1tcm81xdqV1BduryIbra/0ljxwsMcpVldHBMLwq
	GA1bfzVtYvPWBTAOy13TR/HjTclMn4wCgIhE2e4YAt12qauWnA==
X-Google-Smtp-Source: AGHT+IEIIUA/SqQ/LFR7HRB5k5zVKg219NACECTVDBepqqz/zObVh2DDinY6N9JMXMq66xyxr+KZvg==
X-Received: by 2002:a17:902:e5d1:b0:231:e331:b7df with SMTP id d9443c01a7336-2365db08f94mr46802515ad.29.1749826296073;
        Fri, 13 Jun 2025 07:51:36 -0700 (PDT)
Received: from geday ([2804:7f2:800b:838f::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c5fef6sm3847533a91.40.2025.06.13.07.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:51:35 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:51:29 -0300
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
Subject: [RFC PATCH v4 2/5] PCI: rockchip: Drop unused custom registers and
 bitfields
Message-ID: <ed25d30f2761e963164efffcfbe35502feb3adc2.1749826250.git.geraldogabriel@gmail.com>
References: <cover.1749826250.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749826250.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075136_844027_9CA257C8 
X-CRM114-Status: UNSURE (   9.32  )
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


