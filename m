Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3C5C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Edi+mxOirOcipkYMbmpod5zEpzX0KxRpV83btYhPch4=; b=hay46hWTFPOdQTWekXyKHkOvsB
	sSzrec+eeqyobLEzlW5QrpCfIqWjDlYBuOJcGq6hpJAI8hcUjoscsb7SI+Spd9iBq3aNevIde6Mdv
	GJUSqI3LEQ3uY8Tskj+sn4JW8wtpQxLcnKuMnd/2e+QOpClE7UT+MW3btUQtcpGkBe1yikavSFTx/
	pELdljaEsHdaYkUkDI/xMt3mm1nIgVgQXzF4yRFtb3Wpo5nqQngqDD4uOK5ElzjGBX1cRvzq8tN7f
	gKT7KyAAW9zqmv2B5jiqoL3OzWDtrp0N5dGnoep+o71cm6rNZhe/89Bv8ZhVAbCSeTmM9ecDIEsIk
	4bJ7Hf5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8PG-0000000EfSL-3ONk;
	Wed, 14 May 2025 09:28:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Yh-0000000EVxG-3UZY;
	Wed, 14 May 2025 08:33:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0A8C5A4AAFA;
	Wed, 14 May 2025 08:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175A2C4CEE9;
	Wed, 14 May 2025 08:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747211626;
	bh=AQgavCoFrn3p4kZpEsuTDbl2iBlKZHyz8RjR4wpvqDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6ojRjkBJnyhqb+fdGrlVbRl1CkZXo09J3lhjAkNtgbF2/3sDyisvQtaep8xxk1pW
	 ql5we5PXROfoE98FkW1DiiOwAIzJo1305qx3HV1/ni1jCVKotrsYUv7l/0/2WC3lBW
	 mvxVJ/sJGB05lrGoZ+Q+Iuq8NtBiIkOUoE0wdLdRx8KAXNuiA4IfkUgykcaPqKSiuE
	 q6kj2RiFfrc6c+i/EbqPqCopFiQ4d9/z5Dpnd/3XErvvNwCs8mgtsDX0vQyuxA/Uii
	 MapWBnhHlxRj22z4I5qLxoax3VfHiEc7ewatwW0LljFq6vymzZbP8Gjnz5aBmuBn7A
	 0raE+KVU2WzDg==
Date: Wed, 14 May 2025 09:33:44 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Melody Olvera <melody.olvera@oss.qualcomm.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
Message-ID: <aCRVaNDQP/PdAXPR@vaman>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
 <20250409-sm8750_usb_master-v4-6-6ec621c98be6@oss.qualcomm.com>
 <Z/exOF4T+0vNLQwg@vaman>
 <0517c37d-b1ba-466e-bffd-9f47b0d458d5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0517c37d-b1ba-466e-bffd-9f47b0d458d5@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_013347_939882_CE511F14 
X-CRM114-Status: GOOD (  12.55  )
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

On 16-04-25, 15:45, Wesley Cheng wrote:
> Hi Vinod,
> 
> On 4/10/2025 4:53 AM, Vinod Koul wrote:
> > On 09-04-25, 10:48, Melody Olvera wrote:
> > 
> >> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
> >> +					const u32 mask, u32 val)
> >> +{
> >> +	u32 write_val;
> >> +	u32 tmp;
> >> +
> >> +	tmp = readl_relaxed(base + offset);
> >> +	tmp &= ~mask;
> >> +	write_val = tmp | val;
> >> +
> >> +	writel_relaxed(write_val, base + offset);
> >> +
> >> +	tmp = readl_relaxed(base + offset);
> > 
> > Why are you using _relaxed version here?
> > 
> 
> No particular reason.  I think someone pointed this out previously, and I
> was open to use the non-relaxed variants, but I assume using the relaxed vs
> non-relaxed apis comes down to preference in this case.

Nope you cant! There _needs_ to be a specific reasons!
When you are doing read, modify, write, it is very important to know the
right version to use...

-- 
~Vinod

