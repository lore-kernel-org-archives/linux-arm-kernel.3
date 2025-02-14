Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572D8C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucKiOpBc+S4NSSHbPlsmk0SXtuaeNxQ7iIuZM167kvY=; b=eAhU3FaWf8N7grTkXdCC0qPhf7
	8C2i03Y+5Id9iFLMdNTM4U9FxLOxVIDMe4kD+RP2BgGQPwly27ly6sgtWiPTGBsznnEI+/PHGWT3C
	2/ozj1l3REp6efalvLyddIrDf37uUlycPGkRd+io1OcflvmFiKNmWlVEamAw3Uu0wvmvmLFoYZ6ZQ
	ktEzGZW+BvRmyN3kT2ek41p4nrvGkTwB6HXf24wDgv0/a49C7ScbYAda7bJrkCuUfG9dAY7d5bEJF
	hGqhk7ba4yW1+QqSGMifhwFVx8MDBvXoEXj+TE++3UjF2jxmExas/4kE7oBk8W0o3OibTVm8M7g4l
	2qKZ2HzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Oj-0000000Fs99-0HVi;
	Fri, 14 Feb 2025 18:26:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfb-0000000FkY8-1Asq
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 17:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ucKiOpBc+S4NSSHbPlsmk0SXtuaeNxQ7iIuZM167kvY=; b=eZHxJ1o8BK69XGHKxmCx+OJP5K
	5zxX51B6qxAGqLeJ20BCbV+dRocgAHqvImpTpWs2VdajjHIZKOX6j+i1oP1onb9OxeiclCPl6ghhD
	AK27MFJGPoSQ5SBqAdjRsPWk2vtUbVhMJvs7umt2/D0ufOClt1tpIIkZo0VHKYAxUdkmKfMVBdWf+
	TWfcNWGY4+gO8JSaVTFOOTVKQh4DnNpoTTsN17lWGH765XnskHcMfn8m0D2RDYG1DapckzdtFU4WU
	zi+95OniGJUmz4dAZVbHUeWhiV0WehU7FUzODf17KpGYo1X2uLkaPhWlLlb4iPesxvP74ZB8cj5KP
	rwTI++nA==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizfY-00000001IFt-1IzB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:40:06 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5fcad6dbc73so1162189eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1739554803; x=1740159603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucKiOpBc+S4NSSHbPlsmk0SXtuaeNxQ7iIuZM167kvY=;
        b=DSE3NJs4+Uksq6Igktgt5A5OXNdBoHYJ3B2NBTjI9MK+eebZMc2XCIFi0I2DjUBsD6
         9tHlXivgSlfTVxsRyet7xE6B990okazbyrSkXT97x6ep6I1gZuggK/gvIAo/5yJ+PJ9V
         AQbPswpiGp62+SUSWxFuGd/7AlYH5tL1wWSH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554803; x=1740159603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucKiOpBc+S4NSSHbPlsmk0SXtuaeNxQ7iIuZM167kvY=;
        b=wMeGJhoOdAll+ZddZiYKLZZtFg8HdpqALTKCwZa3VaSyrCxw13wXZrtR0ygNxxCjRz
         pxDLYab2rf8q8Q44oi7KRoRqFli3oOTJA2KrQeKE5as+w+GKErA40sSj3hCXrNzYBxVp
         kdlmoavUP/9vQ1ekzUAlgMNsxtok3YcFT0W0LBPSkCYSkBERGdPP0vAX/gg8ID1kVsAG
         UcsWcFazHw25udBGzrY+9Bbu+sJG8lnSSlNqprcyiebYWUGbAfvsMQf2HJe78oHG8wIc
         CwAtVId+n82A0OBCVxdJBkQXwArKbnmIGS4O5DhsQUq06bepAYaFrpGKhOYYMJknLdOv
         dq1w==
X-Forwarded-Encrypted: i=1; AJvYcCUDqUkOMuIKJfJO2tbYEizxWNuTSBSDCPngkajzlC13O6U2zQfKAL0ucsjkRUMljKxUBVtqAPKeVgpMwlPB3guv@lists.infradead.org
X-Gm-Message-State: AOJu0YybHdW9fE30Cpf9yv65CNLDk0kEHhxFStLHc7kjHPRj8MPkKswV
	FO+D0U7Io9hna7sxYFWICSBkPEXYVOc8wQsKdL1hgif+GhLvmgNPsCRehaUlYw==
X-Gm-Gg: ASbGncuL/sHFK2ejUmVuRqpKDs8nntSfF7Y7hQ57umr/i3i/7dCbDs3i34N+D8o3hK6
	wfj2pSKES8dDNCbVKoPG98wgXgLsX7ojt+A5hLue9rVrynZs9hU8n1N7Mvx934OcLxntS7LPVly
	VIArtmm2aCb7V6MPIuKXpiXQKxFdR8B3sv6adb7gRSk7YehjoL5fNclQEHYSud/s9YQFJwWHrDh
	zaTlm3UBOXmQAxGMLDlzompGBYVi1OpA+Xvxww8CIKB1YT3BxyjmqgyKcdPId/y6lSxUwWuZHti
	NyuBtHc9ERZGufBcOnppxoJxVnV0FZ9hFl9GcFaZ2VdIMQvVdx+AWogPZHO1Dj+/YahPc40=
X-Google-Smtp-Source: AGHT+IEHCQouVhYnVU0zbdmV9+4+4+6gGSYlzxuVdn+GGhOSlftYZsrzvcgZIZVnH8WQyajm4LLIQQ==
X-Received: by 2002:a05:6820:220d:b0:5fc:ba35:d704 with SMTP id 006d021491bc7-5fcba35d7fcmr2395959eaf.5.1739554803022;
        Fri, 14 Feb 2025 09:40:03 -0800 (PST)
Received: from stbsrv-and-02.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fcb17a4ca4sm1284073eaf.30.2025.02.14.09.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:40:01 -0800 (PST)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/8] PCI: brcmstb: Do not assume that reg field starts at LSB
Date: Fri, 14 Feb 2025 12:39:31 -0500
Message-ID: <20250214173944.47506-4-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214173944.47506-1-james.quinlan@broadcom.com>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_174004_579831_21594D0B 
X-CRM114-Status: GOOD (  13.54  )
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

When setting a register field it was assumed that the field started at the
lsb of the register.  Although the masks do indeed start at the lsb, and
this will probably not change, it is prudent to use a method that makes no
assumption about the mask's placement in the register.

The uXXp_replace_bits() calls are used since they are already prevalent
in this driver.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 98542e74aa16..e0b20f58c604 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -415,10 +415,10 @@ static void brcm_pcie_set_gen(struct brcm_pcie *pcie, int gen)
 	u16 lnkctl2 = readw(pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
 	u32 lnkcap = readl(pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
 
-	lnkcap = (lnkcap & ~PCI_EXP_LNKCAP_SLS) | gen;
+	u32p_replace_bits(&lnkcap, gen, PCI_EXP_LNKCAP_SLS);
 	writel(lnkcap, pcie->base + PCIE_RC_CFG_PRIV1_LINK_CAPABILITY);
 
-	lnkctl2 = (lnkctl2 & ~0xf) | gen;
+	u16p_replace_bits(&lnkctl2, gen, PCI_EXP_LNKCTL2_TLS);
 	writew(lnkctl2, pcie->base + BRCM_PCIE_CAP_REGS + PCI_EXP_LNKCTL2);
 }
 
-- 
2.43.0


