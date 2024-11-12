Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14FDFD42BBA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lbAitaWBPhoWxH4bj4NOaD1/IoLABk7tVUOSRiI/Nhw=; b=X/iMdY0odZux3akY0LtcRDEj5i
	ThsZqcJCu0J++A5VjW7aYxVSV9xLDMCWZa+tVQoPyVs4PJ/H21CHTzcR7KjtLZSuon67WHpP7mZRt
	kozCglFyfDuzImFvwMTOv/6ConR+6so1XscFGp2daTRiFdkTtKrkRjaJtuQtvyf2D7iE6dxpp+9sg
	ULpNZOAJMZsZ+Plxg6V5/bmJS7OUrT0gx7Z7t3+1CzHWoGFWAaOL8OUdLBC0xnAwCNkul42Ked0NK
	Sk2uNu1kXFKAUUp3MNlK3Ma8TsPiSZqfhYMoReG728lyzxjdAOxn4wNMp+H4zvU3eGSTKwsjmxlaw
	k0PJ4boA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvKS-00000004VBu-1Owl;
	Tue, 12 Nov 2024 18:09:28 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvCj-00000004TWp-46PT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 18:01:31 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e2c6bc4840so4766690a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 10:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731434488; x=1732039288; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lbAitaWBPhoWxH4bj4NOaD1/IoLABk7tVUOSRiI/Nhw=;
        b=v4hlvCxDXHBZm7d68Y3ipmc5ZBSG1ZjmW6pG+zH3HgrwsZpxk0WIRJEGWj6chRvNtv
         TiLYjpnEhneruzbZdSnmIfjxDVNOFCWkFE89P8HBISwvasXPg7IZNLu9eVI3ZQHId5DW
         DRn2u9VXQQKEvLt0Ky3yRfhtzFIzwBFtoBEcbGkglT3A/3VPNGAat4J6Y2jKabo9ZQj2
         VWPlhdBCkNbggZB3gTIIyWqkdS9vFUvojgXBtDKo8tE+rVsNDVtK6wjvuXexXXUAZ2rW
         HcVkWa6Bfu1PpVuWLAmpBsRIG8m+2KnF5A6QQ+9aKsT2lCaSPKPy8OwRYkP6MXCjsgZj
         EaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731434488; x=1732039288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lbAitaWBPhoWxH4bj4NOaD1/IoLABk7tVUOSRiI/Nhw=;
        b=DaUyjP5WU45JRZ/SKtBMsprmmBbFfdjR9RGqhrSSjxFx9wxkX4zyysrozb1uG4YA7o
         L0JahPY76XAOwWbbiey91sJBeBxhDJWLC4z9BkozIZ1Q9iz/oUETHwgJ5Zo3SNjPAoZ5
         6pmD1on7g6aGnIXOTVT60palO64NPRKmaz0XbJbEhxBYFqXApBXMR7hKNWeIb3sBKPfG
         1xqp51Q3Cz7BfCRlyEiqT5vq2kUnV4JSyzFf7lIrDHh8LVBUKgK6RvqxAz3FvPD9YWKC
         6XPWkQKdlwJi5oah7IXBRfR6sTrG5W6AY9RY3UfihocthxdhmIqb79ilA9LY4YPYoOhw
         YkCg==
X-Forwarded-Encrypted: i=1; AJvYcCVxpDFeqJ7q3sl1sY203vRr+n42P5tNefGW3gNOUH4majpTnbWJQJRPJo6xXTVy9f3TtsD69nSq4wAju29lSzLo@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw+IroQn/aGjfrtEeCBCn12LvZhAF0gf0RhGp9PtXWlxz+L44S
	OpDFuzkE3PgJgFCFKQ2ij078bZVUynXEJMZ9bouwuWALlDu91IJDkdZsUmQfzQ==
X-Google-Smtp-Source: AGHT+IGca3hgSODbdD3FEl5POWQHtDbW0nz1PIxvyp10V1YZFiQ1NdV6ppvh4sdUZbzacBs0F6PQjg==
X-Received: by 2002:a17:90b:4d0f:b0:2e2:e91b:f0d3 with SMTP id 98e67ed59e1d1-2e9b17730f0mr22453864a91.29.1731434486819;
        Tue, 12 Nov 2024 10:01:26 -0800 (PST)
Received: from thinkpad ([117.213.103.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a4f6cacsm12941914a91.10.2024.11.12.10.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 10:01:26 -0800 (PST)
Date: Tue, 12 Nov 2024 23:31:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on
 pre-SYSTEM_SUSPEND PSCI impls
Message-ID: <20241112180118.pcn7sf6r3mswwwxf@thinkpad>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_100130_064443_E1B5B48B 
X-CRM114-Status: GOOD (  22.88  )
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

On Mon, Oct 28, 2024 at 03:22:56PM +0100, Konrad Dybcio wrote:
> Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
> CPU_SUSPEND instead. Inform Linux about that.
> Please see the commit messages for a more detailed explanation.
> 

It is still not PSCI_SYSTEM_SUSPEND though...

> This is effectively a more educated follow-up to [1].
> 
> The ultimate goal is to stop making Linux think that certain states
> only concern cores/clusters, and consequently setting
> pm_set_suspend/resume_via_firmware(), so that client drivers (such as
> NVMe, see related discussion over at [2]) can make informed decisions
> about assuming the power state of the device they govern.
> 
> If this series gets green light, I'll push a follow-up one that wires
> up said sleep state on Qualcomm SoCs across the board.
> 

Sorry. I don't think PSCI is the right place for this. Qcom SoCs have a common
firmware across all segments (mostly), so there is no S2R involved and only
S2Idle. If you use PSCI to implement suspend_via_firmware(), then all the SoCs
making use of the PSCI implementation will have the same behavior. I don't think
we would want that.

For instance, if a Qcom SoC is used in an android tablet with the same firmware,
then this would allow the NVMe device to be turned off during system suspend all
the time when user presses the lock button. And this will cause NVMe device to
wear out faster. The said approach will work fine for non-android usecases
though.

I have a couple of ideas in mind that I will post to NVMe list itself.

- Mani

> [1] https://lore.kernel.org/linux-arm-kernel/20231227-topic-psci_fw_sus-v1-0-6910add70bf3@linaro.org/
> [2] https://lore.kernel.org/linux-nvme/20241024-topic-nvmequirk-v1-1-51249999d409@oss.qualcomm.com/
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (3):
>       dt-bindings: arm,psci: Allow S2RAM power_state parameter description
>       firmware/psci: Set pm_set_resume/suspend_via_firmware() for SYSTEM_SUSPEND
>       firmware/psci: Allow specifying an S2RAM state through CPU_SUSPEND
> 
>  Documentation/devicetree/bindings/arm/psci.yaml |  6 ++++
>  drivers/firmware/psci/psci.c                    | 44 ++++++++++++++++++++++---
>  2 files changed, 46 insertions(+), 4 deletions(-)
> ---
> base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
> change-id: 20241028-topic-cpu_suspend_s2ram-28fc095d0aa4
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

