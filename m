Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01331C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 16:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1dxk80zPIpL1q4PhQ4ndWv9Mj5fqZbTdnW5ZkYRDcU=; b=FEgJrGxxv+q66SGylIk5Xk79g9
	dEUFMqL18lwdT+cqFFTTNeWnTo0RWPde5Lyc7A2nhgWzd1BJ5p2Bz7T4BlmM6m7bxta8i2p01QIoT
	CBxIhQGnWAycMhbZx7BKLWdfby+gTl+m/1L7ywjWfBuHCFxEnLJoPOLluh/FXxfl74PGHM5gF2xet
	DCm3xijpv/5W+vyn011rnFD4y83kwJtf9rO1SV2wULsrynovtf2bikW573ZX8VsoP7nYuAO5e8cpb
	cEUHm8KewqmFZPKNnHgQtSCfpB8aktMwt0fbQHAvZgSfhfhTYtvISzSkRsKDYW6t07prHuAqGPv55
	KOHub6KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ibT-00000002IcH-1cf6;
	Sat, 26 Apr 2025 16:42:11 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8iZZ-00000002IVB-4769
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 16:40:16 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7369ce5d323so2689069b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 09:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745685613; x=1746290413; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G1dxk80zPIpL1q4PhQ4ndWv9Mj5fqZbTdnW5ZkYRDcU=;
        b=zXvbXvsPWmhAXW0cV4BJ8icBn71B8ADR1WPJhp85DGBq/gGxbnFdCKq2At/3J7Pud+
         CBfxza058hm+OChdzo9X1iwnjAijO5kIgCZptqRmBHkWENnCMgQST9j7E6vl0V4u1UAb
         g4hL57/jUGgNm1nU70ijbhwd6XdcBxQByGL7bLq0Jk83Lu9Vs++UF8nme0hyURrBxzV2
         nQVOyVnJt2ZLbfwwT7bpelIxUKTbVZeWG5tcpj2Pjpah13jFQ4S2dI6iAAk7BDq5McHU
         CCC1U6fNiPqmB8QOVI7UqRcpKlQuBugJyl64+FX+22fRVrweePB3Siu6J//5h7vo7/NL
         GACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745685613; x=1746290413;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G1dxk80zPIpL1q4PhQ4ndWv9Mj5fqZbTdnW5ZkYRDcU=;
        b=SQ5bYszf08ftaZSG9IfSfQljLGBWyeXMPIkZngq+4QxqwDW3raLAWrFaVqsE2FBl23
         R1fRGNWJBz29bywfvJqWvM809Y3Hch3McU0K/fkqXWPUVg7Ad3jVFVSvRISIOcjQ54tQ
         LxtbCq8yRrYX8p4pMD8UGXPh2L/wDWiZk+fGRRuLxnZ06p+fdTNQPi6Ko/F1vYyH5toP
         piNTdOu6CBFtIAuubDp/sDbij4XbrF6WGlbCm30YhVp+3+9Fq93M9fpfv4XxnbeaHd0x
         VoUBqAoVFbj5ISDudwbNoTLrjJCLWWzYsdq5Dcj15laWNv8ISvhE0NLzVKgofypBYYDH
         zrHg==
X-Forwarded-Encrypted: i=1; AJvYcCXY0R13eH95LvnKxRcajOe4Yba8ipOutrvx6EA5ycV8D7Tg9/qWy7OqbA3Q2ih1ehOrTAsQvYRCTPEzzfRNASIx@lists.infradead.org
X-Gm-Message-State: AOJu0YxcFzP/hWlBl2u8pCE/L2No6tWQFqd5Rjq1WRXrW0DWoAmLJJek
	lUgRTLLbV9K87d4EOm5mBt8RcC11dNYGVTj04fbvMhJ2O4nFRic8hlskhq/5xw==
X-Gm-Gg: ASbGncuJMp39wBm/DkilWLhOE0V153XuUWmwS2um1qcpKw3hCdJB27UGtbDBYbHgs+J
	QCetJxZBgL8uoqPegGauFM5IdMJt71t9KrE5wPwhRndd9mtIYo1ggkYPlJMejg+3gFHhd4sCfxQ
	iG6Hc3SC6ourpZVrHeALsHekoaEpmePuoksn7rdJA5/MoImfeeioueIQO1ZBpe12AGMzVjes1jR
	ldmXFf3DKbYN59eqYhICYeuK+JFnG2vY/zF/g45ZY25EAOW00ZA8RqfPhxAUJJgnwQn9dLJTlhZ
	vzDlWlM1ipjG1MDg1LA/ErSOHoUdp0M9MbvD8zGKrZVRiaMPrrbN
X-Google-Smtp-Source: AGHT+IEwFTn2KnzLPGidnDgvRdMd237ilzSbG/yZ5gr9RWrr3uHMD0GXUKLpE0ghRpRy4DDG51PaGQ==
X-Received: by 2002:a05:6a00:c85:b0:73e:30e0:8a2a with SMTP id d2e1a72fcca58-73fd896a123mr7017507b3a.17.1745685612904;
        Sat, 26 Apr 2025 09:40:12 -0700 (PDT)
Received: from thinkpad ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25941bbbsm5216582b3a.65.2025.04.26.09.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 09:40:12 -0700 (PDT)
Date: Sat, 26 Apr 2025 22:10:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, 
	heiko@sntech.de, robh@kernel.org, jingoohan1@gmail.com, shawn.lin@rock-chips.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 0/3] PCI: dw-rockchip: Reorganize register and
 bitfield definitions
Message-ID: <b6loj46o6txf3g7xrcjbewcz6kph7wh3lg732k4nfp72pfbnms@hsxzofycadgl>
References: <20250423153214.16405-1-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423153214.16405-1-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_094014_021587_805B2BC0 
X-CRM114-Status: GOOD (  18.76  )
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

On Wed, Apr 23, 2025 at 11:32:11PM +0800, Hans Zhang wrote:
> 1. PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
> 2. PCI: dw-rockchip: Reorganize register and bitfield definitions
> 3. PCI: dw-rockchip: Unify link status checks with FIELD_GET
> 

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes for v3:
> - Delete the redundant Spaces in the comments of patch 2/3.
> 
> Changes for v2:
> - Add register annotations to enhance readability.
> - Use macro definitions instead of magic numbers.
> 
> https://patchwork.kernel.org/project/linux-pci/patch/20250416151926.140202-1-18255117159@163.com/
> 
> Bjorn Helgaas:
> These would be material for a separate patch:
> 
> - The #defines for register offsets and bits are kind of a mess,
>   e.g., PCIE_SMLH_LINKUP, PCIE_RDLH_LINKUP, PCIE_LINKUP,
>   PCIE_L0S_ENTRY, and PCIE_LTSSM_STATUS_MASK are in
>   PCIE_CLIENT_LTSSM_STATUS, but you couldn't tell that from the
>   names, and they're not even defined together.
> 
> - Same for PCIE_RDLH_LINK_UP_CHGED, PCIE_LINK_REQ_RST_NOT_INT,
>   PCIE_RDLH_LINK_UP_CHGED, which are in PCIE_CLIENT_INTR_STATUS_MISC.
> 
> - PCIE_LTSSM_ENABLE_ENHANCE is apparently in PCIE_CLIENT_HOT_RESET_CTRL?
>   Sure wouldn't guess that from the names or the order of #defines.
> 
> - PCIE_CLIENT_GENERAL_DEBUG isn't used at all.
> 
> - Submissions based on the following v5 patches:
> https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-1-git-send-email-shawn.lin@rock-chips.com/
> https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-2-git-send-email-shawn.lin@rock-chips.com/
> https://patchwork.kernel.org/project/linux-pci/patch/1744850111-236269-3-git-send-email-shawn.lin@rock-chips.com/
> https://patchwork.kernel.org/project/linux-pci/patch/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/
> ---
> 
> Hans Zhang (3):
>   PCI: dw-rockchip: Remove unused PCIE_CLIENT_GENERAL_DEBUG
>   PCI: dw-rockchip: Reorganize register and bitfield definitions
>   PCI: dw-rockchip: Unify link status checks with FIELD_GET
> 
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 87 +++++++++++--------
>  1 file changed, 50 insertions(+), 37 deletions(-)
> 
> 
> base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
> prerequisite-patch-id: 5d9f110f238212cde763b841f1337d0045d93f5b
> prerequisite-patch-id: b63975b89227a41b9b6d701c9130ee342848c8b6
> prerequisite-patch-id: 46f02da0db4737b46cd06cd0d25ba69b8d789f90
> prerequisite-patch-id: d06e25de3658b73ad85d148728ed3948bfcec731
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

