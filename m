Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A46D12663
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 18:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6b74+PpIp4g7MMqPdYt95ZSBDMLgOHp379BS/AlUf30=; b=KAFGlLHlfNabODe0bnBk8u/Vqm
	7JDSX33BFAujqXLnObr7aR0bsqQ5/qjMkmf6FUS3rMRmDRLddEiQlw9vI9i/2tGSDK3K330LwVaDG
	PiD1X5T0j6uGQz73jpDDNkWSs8PQMl+HIARLFOBoejaW7dMiyBwbQxwLnoDTNMFebC+9IZEWUMMLd
	7WFYuLAZ4jxWtepLNfZ40aVnla/EC7PVd11E96GKq2BIuvv5VzdNCcJ8Sdn2fLa+uG4/ktekzPPe3
	0p0tupYI3eWF9ZdbdfSk2x49gBiJBNf6/k0UEFotDdcI2+oUqVTaTjpKUNrtTPl8FHLdxiJjio0NU
	omg2PM7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQUw5-00000005hzI-0Vf1;
	Tue, 02 Dec 2025 18:17:13 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQUw2-00000005hyr-3N1I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 18:17:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so3655986f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 10:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764699428; x=1765304228; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6b74+PpIp4g7MMqPdYt95ZSBDMLgOHp379BS/AlUf30=;
        b=PfzZIS51IEefVRvfzstTcJ+xdchqOm2I801fSJyeZ/bCIRaAcjx5oRz/sRuvRvA/dz
         TLwrCu2nknQL0eFEDBEhGxKDdjtfYQRvsKzyioP1gK6uSZUKp61a24jnQvt7Qfojw1MI
         bxpecg15+bevF9UJL+hcL4lHgj+FC7aXyv7aV3xMRLHwTtOrRmnntwBAYDF47nBhMZQx
         dSFIghlDPB5dB27VumCiRcR5AopN7pdqccmX1m/VSiw1Bve2oVq+kkNLBCWbe0vAGIuI
         x1+JN9JXHWEcT+u/DYBwbSajdd0X/m6kpDVfGJIAyHOFtBcl0kAQGqEBzedHfDq9aRqG
         /7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764699428; x=1765304228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6b74+PpIp4g7MMqPdYt95ZSBDMLgOHp379BS/AlUf30=;
        b=VqL0ERyXPi75AXThng5FSiLoFYP/74U+YMxAevOMbyfDDB6zF4xSLYG6d65cpl+d35
         Q/8Ic/334sIVKKyvHzUjD9e2LvWpeyiDTXnte46Ds765QpEsc/g3tyuz7MtF3QL04aEt
         I5ReBfvNFota5utye/7uOfL0Uuvtc/3Qs/ud3pxQR+TWxbgwa/9wyZ9b0lhEIlng2+eb
         jl7xocD8bvZ6ZTgW/BdGbCiLhm6FhwFLNgPnwwR/3ZpLD9zabZsv+SZi91UQUjQUpO1R
         coJ5b0D4Q3UG0YE9HISqdb+PJZHGc+0Y7SxzfgCdj/UI7lS3iVGTXnul80VJpdBb3OJe
         PoaA==
X-Forwarded-Encrypted: i=1; AJvYcCUHT2ZhAUKS8B3m8vB5Gpu7oEn5ZKqZPFmBb/td+oh20mShSioeaBrRMeix22YhFRRuGzjAUO82SzCNohOjwU3D@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdamtxjg3M1tOnd44zlC58pkMNTkMPFfGHbmhnq1nXkC6WNPsc
	8yGNbbcH0IvPt/NFyVZ5brU6ZqDb3RU4v9ljbRjFy/dzHBYEFfTryhhfw5qRT2G3xW0=
X-Gm-Gg: ASbGncsVzIJMqdPwVdVwCE5MgAOywFThyCwMFYCg9buiNUu7WKq7ASet7wsNcm6Ene+
	naDxStdM413cpthP5lKQLWT4ptcEalebiZ20ZxZOUE69EsIjqWm67tLnVe/yROSxNLF2E6Ra/Vq
	OYGHjP+zFJ0Qux+7d0dpH412jDb58FjSaeTiyp3Je0g0UHfzuUh03SMaTOHMs6NYZOmetZb46E7
	dEcQV88Q3s3YGrkGRkjHqWo7IGnTtfFT0AMPLKAmrVrI5EH5CAj3OhKp5sc6kOFrpoGZW/tbWup
	a+NUZmnTTwm3v4l4+HfqJfdOBSMKJHI0FCCrVcGg4meHIBXYBLGGD4OgKHunhLYpz1CNUCs2gsr
	qmHcVfBLVFDAup2+K5LNC9o/V53n76kuMqfalGoB/5LEOzw3FX6hytbh6crm55kesHOZtbS8vtj
	OaStbLj7IOhciW0gCB
X-Google-Smtp-Source: AGHT+IGdPY6yqrBKJkkOOYWF6CM+7Jwdu1H0nVTCpwkcVSguUh9pxxkKdepb4CrjpvgK1/jyWOMffg==
X-Received: by 2002:a5d:5f82:0:b0:42b:3220:9412 with SMTP id ffacd0b85a97d-42e0f3491e2mr34996565f8f.28.1764699428016;
        Tue, 02 Dec 2025 10:17:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42e1ca1a3f1sm34529299f8f.28.2025.12.02.10.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 10:17:07 -0800 (PST)
Date: Tue, 2 Dec 2025 21:17:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: Re: [PATCH 1/4] net: stmmac: s32: use the syscon interface
 PHY_INTF_SEL_RGMII
Message-ID: <aS8tH3VD9uxl56ah@stanley.mountain>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
 <6275e666a7ef78bd4c758d3f7f6fb6f30407393e.1764592300.git.dan.carpenter@linaro.org>
 <aS4W0M+ZkQzuUjtT@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS4W0M+ZkQzuUjtT@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_101710_879171_CD4B171A 
X-CRM114-Status: GOOD (  16.55  )
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

On Mon, Dec 01, 2025 at 05:29:36PM -0500, Frank Li wrote:
> On Mon, Dec 01, 2025 at 04:08:20PM +0300, Dan Carpenter wrote:
> > On the s32 chipset the GMAC_0_CTRL_STS register is in GPR region.
> > Originally, accessing this register was done in a sort of ad-hoc way,
> > but we want to use the syscon interface to do it.
> 
> What's benefit by use syscon interface here? syscon have not much
> well consided funcitonal abstraction.
> 

The GPR has a bunch of random registers that aren't really related.
On these chips they're just regular MMIO registers, but in other
configurations you can only access them using SCMI.

It's better to group them together that's how they are in the hardware.
Otherwise we'd end up randomly adding a register address to the
ethernet device tree entry, but it's nicer to use a phandle to
reference the GPR.

The only register we're using now is the GMAC_0_CTRL_STS but here
is the list of registers in the GPR.

From 0x4007C000

0  Software-Triggered Faults (SW_NCF)
4  GMAC Control (GMAC_0_CTRL_STS)
28 CMU Status 1 (CMU_STATUS_REG1)
2C CMUs Status 2 (CMU_STATUS_REG2)
30 FCCU EOUT Override Clear (FCCU_EOUT_OVERRIDE_CLEAR_REG)
38 SRC POR Control (SRC_POR_CTRL_REG)
54 GPR21 (GPR21)
5C GPR23 (GPR23)
60 GPR24 Register (GPR24)
CC Debug Control (DEBUG_CONTROL)
F0 Timestamp Control (TIMESTAMP_CONTROL_REGISTER)
F4 FlexRay OS Tick Input Select (FLEXRAY_OS_TICK_INPUT_SELECT_REG)
FC GPR63 Register (GPR63)

Then from 0x4007CA00

0  Coherency Enable for PFE Ports (PFE_COH_EN)
4  PFE EMAC Interface Mode (PFE_EMACX_INTF_SEL)
20 PFE EMACX Power Control (PFE_PWR_CTRL)
28 Error Injection on Cortex-M7 AHB and AXI Pipe (CM7_TCM_AHB_SLICE)
2C Error Injection AHBP Gasket Cortex-M7 (ERROR_INJECTION_AHBP_GASKET_CM7)
40 LLCE Subsystem Status (LLCE_STAT)
44 LLCE Power Control (LLCE_CTRL)
48 DDR Urgent Control (DDR_URGENT_CTRL)
4C FTM Global Load Control (FLXTIM_CTRL)
50 FTM LDOK Status (FLXTIM_STAT)
54 Top CMU Status (CMU_STAT)
58 Accelerator NoC No Pending Trans Status (NOC_NOPEND_TRANS)
90 SerDes RD/WD Toggle Control (PCIE_TOGGLE)
94 SerDes Toggle Done Status (PCIE_TOGGLEDONE_STAT)
E0 Generic Control 0 (GENCTRL0)
E4 Generic Control 1 (GENCTRL1)
F0 Generic Status 0 (GENSTAT0)
FC Cortex-M7 AXI Parity Error and AHBP Gasket Error Alarm (CM7_AXI_AHBP_GASKET_ERROR_ALARM)

From 4007C800

4  GPR01 Register (GPR01)
30 GPR12 Register (GPR12)
58 GPR22 Register (GPR22)
70 GPR28 Register (GPR28)
74 GPR29 Register (GPR29)

From 4007CB00

4 WKUP Pad Pullup/Pulldown Select (WKUP_PUS)

regards,
dan carpenter


