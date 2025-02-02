Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1170AC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 12:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uETwJAYLiI++YAvvMckAL69wPehGQ7drAEjc1+6UWe4=; b=oieHS5sblBOcBe98rYydgh3sh8
	UzSnc+bo8iWPeac4zrDx0Mv7v/1e3g+zQzSRhZwuwlzmfkB5aytgWAWLjBdP7kK+SS1PwQSK6yhtB
	eq0PeYXNW+RbO1PRJ3OrBbUfSl/8wbtGGK0Bzfs4+sZGmvTjSqdDiSLHWCqu3rtZ0gTlAHd5m34w8
	OY+1bmws1mGQwGIEYTxzh5tafLWGVvEEqM1xJ6xYe8ts1GOxdMTj3Hckw79qWxSQfd77eHF0lb9Lo
	caCtvL3zjDj8GVel4q3dk9Ii+yiyPI5Kxsv0RqISjAO1KjBYBxoMzUUJPFDXEfyvCK+JgQiemPKNJ
	j/d/oatQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teZ3z-0000000DjSZ-1uzu;
	Sun, 02 Feb 2025 12:26:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teZ2e-0000000DjNz-20BK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 12:25:37 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21680814d42so55601635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 04:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738499135; x=1739103935; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uETwJAYLiI++YAvvMckAL69wPehGQ7drAEjc1+6UWe4=;
        b=p91RNw+XTeqM+cJh6JMvAvHxm6irqd7D0MvNvhwlmU1RnmduKI/Vlnxya0i7d3fG1v
         YgQchEjRoCmpOu6YwX40HY271MBCW56z5f/l/eceZw6bdiRZcG4IxK8fhifD9UtPoNTh
         /krQn6GhgXj/qbJrFA7wdbfxKXQoVkU4Lta5zo6JsGBUqnhccyAJHW53FotA4/SsBcqo
         GYBoieorWj4aV1taaw9P74esQkwk+oqkksIbOsLwxCLN/Y+5tKqGU2atBd25R5hUIP1z
         9Hw7UTpVV9BDJFf3ItwhhCjMSYqpC8QOiCD8198djWXGItkHbZBSD5BnBKWABiO48o5+
         sUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738499135; x=1739103935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uETwJAYLiI++YAvvMckAL69wPehGQ7drAEjc1+6UWe4=;
        b=nOyEY01+uhZINS6ZqDfwCFUyq6qAAcTPiE3cHrlMBdUkHWweUhEMWS5AY7mY851tla
         aP02XPepnQSOt03R0GJqRRZ/Wx1AelOkBbeP4JGUdSO5+nSeq2JPmkT7SHNea9NIj7A1
         MmSsjpW86FHsSjEW8YGhHRlBPJt/uL0uv3d5/bj4+ScYWD6FOFKAHqRc7a454fw8HGAa
         DC/sYjaBrFMfRf+JwmV2S5dYVkfQX8AErZvKnHCqDm0zgM5NPgkhRNfoFlyiojiSVzdO
         2beEeXNAEMAHu8+84c2qyIv2BlvPqgaW3nKcwRoELrcQUNgUSeaHHqULJNvmSPVEq/Ab
         9WuA==
X-Forwarded-Encrypted: i=1; AJvYcCVTcnGnzT1i8n5VkYvb/gv7GkUW7bBJRSQ9NIqZ95HcIA+pS7LN5DCQFlWgfcswG++4022B4dWxZT4uNA4kenwr@lists.infradead.org
X-Gm-Message-State: AOJu0YyJjxtuFvo5WmpPSSq9XJLD6t36BhnBtj+BTmJ9TT6fzE95+D2L
	LC3BE42rwWRbP6awbXlZgreBiiSm3gfiv55lU61xe3AAVoWorC0tZhqCvldCwg==
X-Gm-Gg: ASbGncs4GfSgPlmTPFfL4UDd8Arey/PNSZWbCqGzLnUMhVgdj3g2ej7F4VOtiTlJFAR
	G2wago8RX2NbddqPqC2q7vdb7YTWtZ1U6IS++8ylNlErmdnUMPMcTrioaiWUTBbKIIBnlBduecm
	DIzaZVBF3vyLO3GPGBBOrahNvjuW/YF6VmkBcrbWA8sEA+FRKPLHpIX3stMzrq+y9w5GG/+1Kw1
	A6cXgmlAjhCN17H2HKbNT9FUfDsaX6VB5FBAa0RVLAFPkxa1gXxAzRla9VwtO6VtLx4ca1QrJXf
	Hv1+b5LqZHyYPsP9sTqYIbKgPHY=
X-Google-Smtp-Source: AGHT+IFWA1PkbYOvPhddgrggwj4vKffI2QbvJQaiOGMB+TdTMcR+A/IqI39Yf7APF00zFjplkX/PAQ==
X-Received: by 2002:a05:6a00:3a01:b0:725:9cc4:2354 with SMTP id d2e1a72fcca58-72fd0be1847mr24747903b3a.10.1738499135407;
        Sun, 02 Feb 2025 04:25:35 -0800 (PST)
Received: from thinkpad ([120.60.136.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ccea1sm6411268b3a.122.2025.02.02.04.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:25:34 -0800 (PST)
Date: Sun, 2 Feb 2025 17:55:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	jingoohan1@gmail.com, p.zabel@pengutronix.de,
	johan+linaro@kernel.org, quic_schintav@quicinc.com,
	cassel@kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	fabrice.gasnier@foss.st.com
Subject: Re: [PATCH v4 01/10] dt-bindings: PCI: Add STM32MP25 PCIe Root
 Complex bindings
Message-ID: <20250202122527.ggy5ccz7o4umyhif@thinkpad>
References: <20250128120745.334377-1-christian.bruel@foss.st.com>
 <20250128120745.334377-2-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128120745.334377-2-christian.bruel@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_042536_541853_583C8682 
X-CRM114-Status: GOOD (  10.34  )
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

On Tue, Jan 28, 2025 at 01:07:36PM +0100, Christian Bruel wrote:

[...]

> +    pcie@48400000 {
> +        compatible = "st,stm32mp25-pcie-rc";
> +        device_type = "pci";
> +        reg = <0x48400000 0x400000>,
> +              <0x10000000 0x10000>;
> +        reg-names = "dbi", "config";
> +        #interrupt-cells = <1>;
> +        interrupt-map-mask = <0 0 0 7>;
> +        interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
> +                        <0 0 0 2 &intc 0 0 GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
> +                        <0 0 0 3 &intc 0 0 GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
> +                        <0 0 0 4 &intc 0 0 GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +        ranges = <0x01000000 0x0 0x00000000 0x10010000 0x0 0x10000>,
> +                 <0x02000000 0x0 0x10020000 0x10020000 0x0 0x7fe0000>,
> +                 <0x42000000 0x0 0x18000000 0x18000000 0x0 0x8000000>;
> +        dma-ranges = <0x42000000 0x0 0x80000000 0x80000000 0x0 0x80000000>;
> +        clocks = <&rcc CK_BUS_PCIE>;
> +        resets = <&rcc PCIE_R>;
> +        msi-parent = <&v2m0>;
> +        wakeup-source;

Does this property really need to be present? If the WAKE# gpio is supported,
isn't it implied that the RC is a wakeup source?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

