Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D0DC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xyFJhUKmXvISbhvlxrsKbalUZLIqSWCZyj7Xp1Z3rU=; b=JYDlfvGmR2uh0kaKYfsE4S6bMB
	ijysHYdIYqfvAaK8y4KHkg/m/QHUz5tCq91zqWvUPQczRbuYA1cYRbQSscuAwfNSr2KyNMnhLpklx
	hN3thEPb/bjy9CKQQAEgqC33j4XQF09y5n738Ojm6ZpqIElzDfO3g8eMbTeZt+Ze0iqX9sadRWMWX
	UlVUPpERBXnygZcjAAaro6dFj/IKCOVB077uCNI06t17hWd3ICZf54yhxO6QKQ15MrHHSQWzb5pzQ
	h9VYSSCDvHzbwV5u1f8ezBj627qjwZ3e13pInb+BG2oDkyvaokhdJwpXfLJjs0uNeeYpCrmkKPCol
	ny4/AQLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSRc-0000000AYNF-3Xq0;
	Fri, 07 Feb 2025 17:47:12 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSIy-0000000AWS7-3mlU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:38:17 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f9cd9601b8so4227103a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 09:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738949896; x=1739554696; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4xyFJhUKmXvISbhvlxrsKbalUZLIqSWCZyj7Xp1Z3rU=;
        b=EnCMseUUBIR15C2Ydob9yPm2vi6sxoCyuF5akBWhkIB47T5gBbLMSKKi0RAjtLT+kg
         3bjv1OvnMb+WsjO8lgEIVL+yVvciZHU4jw1fYhNNEItU2ewbqxR083ezqEdx0+HgBGva
         VvFv1SwWEy8XGX9+bkOvgGhkX+y1/rNVW2/bxybdteHnNIqba2kZOWzxFxTHXyqAiJvZ
         3YtEVyqeyBsCCXRbIcmVL8Qcl0wBatyuWDeKhd8XBnUwfzURP/RE6RtvikluMkaXWAnn
         LqUloWf0BkS/9x5pB3ryPGEMNpRVaKrSYe0HCpIJZsNH3M6bIeopCl+UxbAQMtw+YXlN
         MoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949896; x=1739554696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4xyFJhUKmXvISbhvlxrsKbalUZLIqSWCZyj7Xp1Z3rU=;
        b=ZIEOIcx7K1LQdL0/JPY6OhJTieGVPp1TSadpWn2oVliqhjoxhiha26Y27b2pyY+zNL
         awerNjs10Lh95yKg5A1z2pZik8B/2gFV+7ndyRPStv5xjjpK7evsnt+dkBde9xov78ri
         Z32gp+mnSP4gvX0j1uAzNKHniKvDXdliF2bpe1zgmhtL9hg7P7TsLHAQ/WLv9E9XLdMd
         450qNeJpgZXnSNoxU/mSbbf1QdtMsiFvNLcCVoYYW6c7UzcIbYzXjomfjO5yJDOsc471
         B052fpFBNTzTS9c+cQ+39vgXVvA7Xh046Yz6Jc04fzjKDXtf9POed9LjxfdTn1V7OkBD
         XmUg==
X-Forwarded-Encrypted: i=1; AJvYcCWD3vS1oHKHRRCnBvzmCpIvdk+pmbi0V38U9/1n0OPzc/vOeXDNDXuB7iJ7gHXcCAQ3RzGZATHIgiwBxmfaazb6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3XVOlALCNctnWVcjBH37+PcJnzSyodUHKWVg6pzUEakXhJkTg
	mN4n1TVBPBFML4KIibxgFN1yev8UP0/x4evzGupD93driIuA/MeRHWkLdAj5CQ==
X-Gm-Gg: ASbGncv/XlCc4UyztGPv1RdKUmArt2rWQqhBomHA0GCKP/QCwcLRm9hxBMWwvDS+G59
	G6XRKGKNmTSsdTS85iD7GfQXzWYdW453uBIUwjk3NXrI/herPGp8WW7TtMYIF4q8YXypov+fdXj
	2uBkInJcu/vZE92Lz9HOraRIytnH30xJAEhX9LT8HT5KhnWvy14lPxpU41LVHbRCxQ+Wy6eGk+g
	opQQuzvosgOtnb8Z/lEAV8TDQfNk5BLteybb889Km4d1sM5Vlo/Lgjdm8YaAoByyKcZjRGVukuQ
	rTGT9+aGeJ1aYwMRr6R+HmV0YA==
X-Google-Smtp-Source: AGHT+IFprNv/Fxes+yO0Is4d70/qLRRGy5XcxfptGmrec0u4U5JshNdQEzKB4xo6nsXGXHm3iHyxoQ==
X-Received: by 2002:a17:90b:3903:b0:2fa:229f:d03a with SMTP id 98e67ed59e1d1-2fa243e9e0fmr5424081a91.26.1738949896065;
        Fri, 07 Feb 2025 09:38:16 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa0942d30esm3647036a91.0.2025.02.07.09.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:38:15 -0800 (PST)
Date: Fri, 7 Feb 2025 23:08:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Remove leftover mac_reset assert
 for Airoha EN7581 SoC.
Message-ID: <20250207173809.wykxrugz3neinpru@thinkpad>
References: <20250201-pcie-en7581-remove-mac_reset-v2-1-a06786cdc683@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250201-pcie-en7581-remove-mac_reset-v2-1-a06786cdc683@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_093816_938480_C3CBDC0D 
X-CRM114-Status: GOOD (  19.71  )
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

On Sat, Feb 01, 2025 at 12:00:18PM +0100, Lorenzo Bianconi wrote:
> Remove a leftover assert for mac_reset line in mtk_pcie_en7581_power_up().
> This is not harmful since EN7581 does not requires mac_reset and
> mac_reset is not defined in EN7581 device tree.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in v2:
> - fix typo in commit log
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index aa24ac9aaecc749b53cfc4faf6399913d20cdbf2..0f64e76e2111468e6a453889ead7fbc75804faf7 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -940,7 +940,6 @@ static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
>  	 */
>  	reset_control_bulk_assert(pcie->soc->phy_resets.num_resets,
>  				  pcie->phy_resets);
> -	reset_control_assert(pcie->mac_reset);
>  
>  	/* Wait for the time needed to complete the reset lines assert. */
>  	msleep(PCIE_EN7581_RESET_TIME_MS);
> 
> ---
> base-commit: 647d69605c70368d54fc012fce8a43e8e5955b04
> change-id: 20250201-pcie-en7581-remove-mac_reset-16e7b6e3ef06
> 
> Best regards,
> -- 
> Lorenzo Bianconi <lorenzo@kernel.org>
> 

-- 
மணிவண்ணன் சதாசிவம்

