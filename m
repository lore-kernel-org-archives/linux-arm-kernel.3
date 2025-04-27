Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26AEC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 11:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCW3fClu8hd3i15UY5+BkYv0EoS+YjFdR94yHfWo7NI=; b=AnUD5YLQImHkjdj8ctqm3Ezti2
	lnmdF95RWC2XpJuxPWgIpY6uJWIHtCc5whBLNSI1OG3982Bg2azbgjIraXpDUtAJhgqv/bb9HJIJv
	Lu7IkQTMsAE41ExuckGLZrJ3LkOAQT7I/wZR0fWvKU2us1D6Zf8FoHZ7uXOZJUXkvML+7JzEb40fq
	QZPdwLSP2IZmPU7OKM9joaASl/A+jttWenLj+z4EVN7cPFs0leQwfsYexNHj4aj9fSN7BQGm61IVW
	NUmrgEa+6WyIzwKvdoBntKIyUL8Wq9uDLQqlvSWmsfamKUtud/YosELyZ0XDB7Y1X97rmmOOIplBl
	9nB6lwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8zwG-00000003OHP-1SC3;
	Sun, 27 Apr 2025 11:12:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8zuI-00000003O8A-4BQy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 11:10:48 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22c3407a87aso57403785ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 04:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745752246; x=1746357046; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BCW3fClu8hd3i15UY5+BkYv0EoS+YjFdR94yHfWo7NI=;
        b=qQoahPUfOI+obwG2uvY3pUId3JIVVZC1gqA2rdFOAxEyClJxhLCiC48Y6e8zky/xF5
         m2Mf2aV9E0qORIvvvIzfhANFVGB0zjqfgwWPWxJb6S7q84ks9j2tq7VNFl02hTqIbDvw
         Dtvya9yfnt7mCZiT0KapH3VU7px0/Yb/WWHxMnnjo/Fuhyd07EnMch1e8oLGkG4WMtKH
         agRbh+xieg2YhgfDCBFIlkFgOGSoKgruAN8uYfRdsynOyZGF0ifvdBIycXfr7RFQnH2T
         xVFwhu+kj/rMa2t0NVLcNUGzFzZDn0gkTkOqos5fXFolKhofP+k4xEdaMtUhSJqrSuYi
         fxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745752246; x=1746357046;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCW3fClu8hd3i15UY5+BkYv0EoS+YjFdR94yHfWo7NI=;
        b=I4cVrAtHaGzURuI9eNizhYNqwuxB405wEOdoLN1EdbEzPaPTX/tmsdwHgQQbrgWsBS
         0zzBtXKZkW2Dc89dmQci/dIeiZZz1lCnvTFlk7tePVjJ80lXQHBs/DdqxdnnH16X8e14
         8/yp9Lyc/fS2eu9CA06GEYxbyEn5jOT1r1UYzXJ2xKntJm8USCiWQ75AZKJ17pxoihZz
         +VBMqdYFVIbzLxy6UW6MOqYNEw5hc+oF+TsNeM1nVg9Za7lWIE94x+CVUsGsvbwmAKHn
         l+QQgS5/Q2fma7F7vdhfvkSZNm8/C5NjRIJLnj8pHTkoWKx8Afr1qinqHMW3Wfxl3Aly
         a9vw==
X-Forwarded-Encrypted: i=1; AJvYcCUxhwMv7xv+vaoKx0Ca6Qslq0iliO+/Ol4bom2eNT0m5Uu2FiPujN+/H6B4z25uzP4gibGKPVL9JxVPO/1hGSgT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0R69VLS4kaTnPdu1WtUQDkTmzD7C4rPsH+Posowpc/NzbdbU8
	pSAl973fP0qB4xW/m5TQIvw4fdan2MFWjboUs4GcHGU7HOAYa9Rix5MwjDWWSw==
X-Gm-Gg: ASbGncufcfoOeMK0gXf+bKzjbLwG4dUIesuZmSDLJO4QZpIKXszlIXZzfIl3ApX6R7p
	aitZeeJejfkZZDjEqC4h2mEzneZ2ToP6N2X/5cEC17ck3WRyKaxs8YpLhWp2ntobHag877sqYo3
	wWXMT1iYuso98IYadE3p6F79vY1D2OtX8+3OMjcu10YiY2kERwN9KNJ1dqrfp8fVdjdqy269SD0
	4NSE7XYnan6A/ne41chDAUopoNyAnDLzi7jlzEtBbuq0OtAZ1ZjGyG/MJwUtW8bN+ePXyGalIFB
	iZSfKC7AbcywGuZWny6sPAszwY0hYV6nQogNyhI1cNUzMN4p+ENR
X-Google-Smtp-Source: AGHT+IESxIRh9ywcqSB83gIp43lT9P2vpMm3xBJxMCs41iZKziBWs0161UNH7ZZMchhUoZ94nY/2tw==
X-Received: by 2002:a17:903:1b23:b0:220:e5be:29c7 with SMTP id d9443c01a7336-22dbf63a2c2mr132522725ad.39.1745752245995;
        Sun, 27 Apr 2025 04:10:45 -0700 (PDT)
Received: from thinkpad ([120.60.143.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d74c93sm62360595ad.11.2025.04.27.04.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:10:45 -0700 (PDT)
Date: Sun, 27 Apr 2025 16:40:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com, 
	heiko@sntech.de, robh@kernel.org, jingoohan1@gmail.com, shawn.lin@rock-chips.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 0/3] PCI: dw-rockchip: Reorganize register and
 bitfield definitions
Message-ID: <yhcnrmmmphqz2egrws5sxobysf6ntnd7xxl5vuzo34y5aunbj5@pe7i352kgdm7>
References: <20250423153214.16405-1-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250423153214.16405-1-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_041047_048879_26A0AB2A 
X-CRM114-Status: GOOD (  17.16  )
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

Because of *this* dependency, I couldn't apply this series. I'd suggest to
respin this series avoiding the above mentioned patch and just rebase on top of
controller/dw-rockchip branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=controller/dw-rockchip

- Mani

-- 
மணிவண்ணன் சதாசிவம்

