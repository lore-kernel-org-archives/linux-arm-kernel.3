Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85504C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgp92zvnQjpgyBEdGrnvBKK/NiUrLp23oGoJzduBB2s=; b=gsTMSqloh6Ddf4zQjMbJPFK4dd
	v3Ew0q8IaRuaapjDeu9foeH6M+RRF+IntK7FzAdxO5ah99Mj4jzeVxJa/1PJpOjq8hKayX1YTbvP/
	UqMCokT2h3btLeVKpgOglvnjcAj62gd1YLR5ulRMdGe2wf4AERbtvxzm1RntNc3n0QUrPgMqefIrx
	SoAFhvSlIIK8NXOEwlZ0iJoqc3BToi1Z7uezjAfTRG/buqVfWf056+I6KZgGrOlXUAhtl6iq4X5iP
	rGfEYsTwh5hyacKdUf7bBHz0liv21IbHh5HLtiQtK+IA1wdRoFdM9/E8WaZAlvIFPjNOJEPGQsMwb
	C5OLq6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU31-00000005B4B-44LV;
	Tue, 04 Mar 2025 15:19:07 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTnl-0000000573T-2y8n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:03:22 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2f44353649aso9192877a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741100601; x=1741705401; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sgp92zvnQjpgyBEdGrnvBKK/NiUrLp23oGoJzduBB2s=;
        b=hLLmeJrmboUskOsUMGjxqt2UDgPjBwjLkAl9VuN5FDkmow3qR8elZpLnIHZGNAy6kp
         /AtGwWuVjMtQFgK1dXpR/rpyIjp0v4KNorkW998rKYYf1ZPYvSfzqDIBQVlxrgkFHm0U
         AlqrIlUuhMMlfAVZyoWqv3VVz+iAd0aWQfBzjH6d7pA2LmLkA2RTbsboWcjdcQvC0IPC
         QeoUBQhtYxmjkK0vabR21ub7lp29SdJSRZCkTIJs/ZlOCo+HVK8xuSvrJF8j6R0OsJyF
         cPosSJroKSRXKcsx6stRiaBSZSHQIwizT1OQwabOcTJOwLiQQR6vDmhjiRSYhETmL5ey
         XUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741100601; x=1741705401;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sgp92zvnQjpgyBEdGrnvBKK/NiUrLp23oGoJzduBB2s=;
        b=L/PXHK2bVgTnrvx/6OY4eOfML51mDaaYmgvBYgLsb+nIcngp/EGzVoi3FdzPoM7QiQ
         O1Oy5Hp5Ai+F9N1itoj+XIqvbJ8G6hzJ2TVrshRx0HngjWOSqHjg5NxNnB+lA8hKHDKL
         /meRrEo8JThfhaCPu2ABLrQvh6fSzZUuoxjnjzw1LBB0jFVL1ssJwzcpoEXEtmzT2Avr
         cTKQNzFJ/XlbsVhYKnrMPLquSWu6d7SvfIUDUS8p6+PleMCB4uz0PZdA5CvFAwGKJZNh
         lHYh3jDf8/hJarINEftbQmCT9qmtOZOAj6FNdDL4PdM5iMHelSMvcsdfPfrjorZfz+Wj
         s8Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUwgzyBrJIuFqgBibUFNz6nmWX5P3Hs5GnWX2Lx5s4GiVnfZcwfUQ8d2NLr5JqgmaUazGmbRoYUaWMsNrhSbbSv@lists.infradead.org
X-Gm-Message-State: AOJu0YytQVKvF9av/Nvr4qvjdB4fALQlLyhoXG+Wd0DxbtWfd95al115
	h7HqRUpZpZsEw1Jw6grsGeWYYgaiQOWYmZnNLtRz0vnj+/ft+Z7GSyukhqGkZg==
X-Gm-Gg: ASbGncvvixwHea+gLlaHxoTA6yeRFP5IaZ9hdGSCBcelptdW3+DpgsU2Az+0e3U/vrB
	APJz6HhFP8GKNcF/wKm8PladFv9NKGplXfOdMr5nlkwdZLqzZNWt8ABqGF9Qro4h/fiBfYgNbsx
	v5TukxudcJXh0SsRumxkZz+gkDwQUKE7C0Vjk6Zby9Vj6XQEsHEJyW4CdbtcK9o76S0rC17VfL4
	MiMRJzhOL/L7zTxKXPJBSp+KW5+gSigOS9HLWXHGoZgqJ632gh93SDtvd6baRIHV6CYpG0Y36pd
	SbJAugEGOcICpAfbyk5REGBP+ZHGZdQwH4Ww8V47g0FErx9Rlb/ZhLA=
X-Google-Smtp-Source: AGHT+IE8Rj7wGhoLcKkJr7aGFix0dNkKxSLf/uewEpInYpKi/5JDsy8IrIQcKfWAb0vRV66bAYwhQQ==
X-Received: by 2002:a05:6a21:483:b0:1f3:4427:74ae with SMTP id adf61e73a8af0-1f34427778emr2142169637.25.1741100600658;
        Tue, 04 Mar 2025 07:03:20 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de1f52fsm10116872a12.32.2025.03.04.07.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:03:20 -0800 (PST)
Date: Tue, 4 Mar 2025 20:33:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/8] PCI: brcmstb: Fix error path upon call of
 regulator_bulk_get()
Message-ID: <20250304150313.ey4fky35bu6dbtxd@thinkpad>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-5-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214173944.47506-5-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_070321_741254_A1F10F8B 
X-CRM114-Status: GOOD (  20.87  )
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

On Fri, Feb 14, 2025 at 12:39:32PM -0500, Jim Quinlan wrote:
> If regulator_bulk_get() returns an error, no regulators are created and we
> need to set their number to zero.  If we do not do this and the PCIe
> link-up fails, regulator_bulk_free() will be invoked and effect a panic.
> 
> Also print out the error value, as we cannot return an error upwards as
> Linux will WARN on an error from add_bus().
> 
> Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index e0b20f58c604..56b49d3cae19 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1416,7 +1416,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
>  
>  		ret = regulator_bulk_get(dev, sr->num_supplies, sr->supplies);
>  		if (ret) {
> -			dev_info(dev, "No regulators for downstream device\n");
> +			dev_info(dev, "Did not get regulators; err=%d\n", ret);

Why is this dev_info() instead of dev_err()?

> +			pcie->sr = NULL;

Why can't you set 'pcie->sr' after successfull regulator_bulk_get()?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

