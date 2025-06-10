Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE75DC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=; b=ZzbdP8B/5x6aPNg8VZlzsd4TpE
	X26+i6Nvy8/So3ugykw9vHxGWW0vafWBHhpmVhPjPcAhwvIVNACICJi7QLHvuH8B7NGcqZpV97499
	MeTSqGQFfiY+h7sTCmuyVg9Xajp2ksSVzNwhYc2FqpvhehM+xwv1eqItfszFrK06BevxJVwimiWJA
	ofqpLGCjorZWbIB0ZJmz/Ro5OlDDVH8XX82Z8jAn6RXwXvr5DycagvRHw+M8+rHYOHCgbC8sKxHuU
	PLqFu3VOQaDluZNitmsZDSDzRzI3T/xNEH5W9Rn0Emjj5blWcALGJGpgLuYIXUkaCL4HozLj0GLht
	bY1EFkmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7nt-00000008JM9-29oA;
	Tue, 10 Jun 2025 22:50:49 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP6Th-000000086qQ-31Ox;
	Tue, 10 Jun 2025 21:25:54 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-87eeca0d038so407315241.0;
        Tue, 10 Jun 2025 14:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749590752; x=1750195552; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=;
        b=WwSvJwGjEuGPHTcSxtIRlcQNjVTl2zoHIhMNBnz6XkSmxp3Lsm57HLE1FvM1KSexcY
         cc2a33lIRxJEMXPLKNzTNAQlQG4Kxd9uEy/D4ts+vq2rlv+qtmP9O8VnvFYzHwnQtb7g
         mW9Ax+z5mYuVlj2lV0yuLtJUvRsbnhLe8HNVE1wjFsyuI2F/zmt3cXnA51slpeZAO7+j
         ai8Qy/OKfkOrXKNW7B7jFnpeC3ZzliBWKtAdRyHXvWIwUfMW9gTl9MXIHkGXvHzkXDUf
         PduHNckvzpz4PrD/Dedc2wTOeE52YkhiCv7Cg8JZUYp6DOYjBNIfYrbIt87fluJm1O8Y
         g/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749590752; x=1750195552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uBBexglmDg860eeLxvF6Ft+pxKPH1DbiU+A4sUq4Hk=;
        b=vi23a3JY1JydFEDEMReghW7PCJI2jJBqrvSpJEAZEj3NtcjdTKCfI4VMJIjK1OAeHI
         ZK2BLeJSzknJVQTBK1K71cIzgUONcR+Br3LDU4JwEkF1cK4woh1cqggkeVH45Px9ejS5
         b4TdbzAYAD7XuEM89GKXn4Q0DMxFE7vQeV+hmIAQGnpKXXeQhTXqwS60R8C0HHWU7yob
         smx4xhf1GHtTH7H6apdQh9UuO0LZ/bNYG4t2K+e+zfVbg1hbPEseM5mrhhq5bcFq5PGI
         XEDCmYjsD9y9gKkHi6XTLGS7wv98hCRB2W8Dq49QNgWEfB5bgZDYH1ncickRikOfRsCt
         x4NA==
X-Forwarded-Encrypted: i=1; AJvYcCU8Co0pL0yDPs4bcM5YZZ+E5LbtDmbIHG7bJrhq9p6QSPHxnCEoPIEH9CA1BdX2mQFSJQbXa53hpDInEy2Dq+Wx@lists.infradead.org, AJvYcCXcLsxN3dPxP2Pu/YFUab+If3BEPmpODxXg7b7nWVBi2LPCW4id3L8PFQSH6Ah4J+dxjCiLiy8uPhrT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg4rzRnhOWb/HvXZFbnJM29QRuCmDi2k+FyT2AeVVSD4UDnuDi
	rKSLojcOViEzmHDU1KRVqD9R9PeGNNJSfpQFPbok7lpgy0V7yHKq49zZnBo+UImg+XWdZBfD
X-Gm-Gg: ASbGncs0mAY6Ce72Y4Awx+9lMnBJ6PDRt34sz1ua+LJRC70QTgdocwHNHyAmoHZO7G1
	FlnbsC07kOShmFpGQR0zBlsYgydhJqq1xqMa9xjPmjfFnwnwlHumte6g+38JRX9ViGYyiX5hQYn
	jhYYcSZbVEJzTqOiOsj3gZsXS8CKlpFc+loJaXEj4kQ5Qxk8jVA5a1Y2s6sUVc63jjn6DTIFjgK
	FNmCAdp5wKjtSiupheBIaGdYP9onvzEWVd6Ssg5HPQE7otSqMtZ3ARmruHJnn7r2iCW/YDoeSYW
	k7fi4mjiQcZhUzTZWgNux15ONYjD8cj8NcIjugAW7glTT7dnHA==
X-Google-Smtp-Source: AGHT+IEYCVf9ZTSqj5YgISDZOrt+1R+QNbwbWikBaMK6UitqswT/0tSQ42AOnMjbILWu2QKm252CUQ==
X-Received: by 2002:a05:6102:54a9:b0:4e6:dbbc:16d0 with SMTP id ada2fe7eead31-4e7bbb8d8f0mr604930137.14.1749590752616;
        Tue, 10 Jun 2025 14:25:52 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5ce9::dead:c001])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7bb030493sm356549137.19.2025.06.10.14.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 14:25:51 -0700 (PDT)
Date: Tue, 10 Jun 2025 18:25:45 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 4/4] phy: rockchip-pcie: adjust read mask and write
 strobe disable
Message-ID: <f0451239a23e9c0c97692d2cae0d7d3068d6dc85.1749588810.git.geraldogabriel@gmail.com>
References: <cover.1749588810.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749588810.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_142553_759246_98FFE790 
X-CRM114-Status: GOOD (  11.69  )
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

Section 17.6.10 of the RK3399 TRM "PCIe PIPE PHY registers Description"
defines asynchronous strobe TEST_WRITE which should be enabled then
disabled and seems to have been copy-pasted as of current. Adjust it.
While at it, adjust read mask which should be the same as write mask.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-pcie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-pcie.c b/drivers/phy/rockchip/phy-rockchip-pcie.c
index 48bcc7d2b33b..35d2523ee776 100644
--- a/drivers/phy/rockchip/phy-rockchip-pcie.c
+++ b/drivers/phy/rockchip/phy-rockchip-pcie.c
@@ -30,9 +30,9 @@
 #define PHY_CFG_ADDR_SHIFT    1
 #define PHY_CFG_DATA_MASK     0xf
 #define PHY_CFG_ADDR_MASK     0x3f
-#define PHY_CFG_RD_MASK       0x3ff
+#define PHY_CFG_RD_MASK       0x3f
 #define PHY_CFG_WR_ENABLE     1
-#define PHY_CFG_WR_DISABLE    1
+#define PHY_CFG_WR_DISABLE    0
 #define PHY_CFG_WR_SHIFT      0
 #define PHY_CFG_WR_MASK       1
 #define PHY_CFG_PLL_LOCK      0x10
-- 
2.49.0


