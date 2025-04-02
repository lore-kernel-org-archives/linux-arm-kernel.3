Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C4CC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhuADULP2/DYR+/MqPtSI6Cci67OQxTxzfXSmiaFrjc=; b=gx8/zp2+2kEvEYFmxQ6Kc8mQpo
	NF6EPHxgklmj5dP/JmkNBPnExcohBkRNA26cEIpjqZsBNmM8+lt3pIWOhM5zbYxYiPBxJ9qLcp2+F
	QEiX8U9N06EMtcHlrEfRuCB9R25PhNb+tZanHLfzGFfPMcDwJK1uOn7JdwEQYCxHXN/ptG1dMpLyn
	jin0WYMaL6L3bko2bh6+5eTXAYc+5+i+CtgvOJDt+iVIM1tnUjFB+fLn+c8D8lbJUbv979HIBDgLu
	oE0fYgYnkepmVAW2osmgDF2InHmrzvSmcnuOl4t91CenLa/Y46FOk2STrOfTBsexA7NF/GDsLyCkO
	YNK0/FnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsXB-00000005MyC-1Iy7;
	Wed, 02 Apr 2025 07:29:13 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsCK-00000005JZO-2isM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:07:42 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so11125610a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 00:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743577660; x=1744182460; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IhuADULP2/DYR+/MqPtSI6Cci67OQxTxzfXSmiaFrjc=;
        b=EZ/jnieuWOS+fmdkJ4mWNASy1bf0qvVd5YLawhZt0zN80FKKnuLxu4xxbmTIqemaEF
         Gs5ht0D5jiJdGR7RQsnAOo8H62MXsVLNWCnOmexmQ9XYAM0yX7NhLBJOllegnJkJhLRL
         p0Lznut/BnP3jZEG4TqK7N+gfnyw6Tl8M/THuXrGK1AVUe/QxT+ykbxFSvY4RvD/XsfK
         /lywmWoPff4LL6hx8HAIVK88bXrZrJKlNCNzU3+6QRCsgaY777cuqbiUnutu8tx8mYUl
         FDwb1aPZGeNzofJuMBxqebRACTk9/DcMB23CZxMZxf+8K8FqBv3FxjiR3AoD2bnHdL1r
         9BKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577660; x=1744182460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IhuADULP2/DYR+/MqPtSI6Cci67OQxTxzfXSmiaFrjc=;
        b=rTz7y6vPcvLxOxxfVJ89jVbvp8ziopy9+PYjCKq1XYN7sJZjUBE+EYy9xxxOi0N3FM
         ClSunZXitAe9XorSuX9E1vAcyvjUsNLeVCwIXaqz8O2iLPlMXxu9sA9sCEKf2cJW1HYs
         cd26eG/Gt6nimCbHb31JOymBDhVuEldVwrquirQY7Jw6dppjbBQwQVLoACwyMQJ4FUMf
         ajyOwpWRpU5IU1DgAIcMfrePq79AWa6kH8nMTQ6vklt97zLz5YMRRFIj0f9yRDyKEpKV
         wUWoqtZN5MbOJiniWCOVs0mQAaBKGhoaxtl4xdmy+HC0nLQ2ij+EeAavBzzWyCQxhamH
         dTNA==
X-Forwarded-Encrypted: i=1; AJvYcCW+CoEhhNAJsBmmwnAzhutJyE0JLW0/OidnSOMU4UAafhws6lchM5TsKjDPPQYpNCvp3GCUA9iIoWPMoXuj5LbU@lists.infradead.org
X-Gm-Message-State: AOJu0YxTAH//RStAV7/yy3BzmowNTWLKE+CsMAm5OQCjjq3c0e7hb7Su
	Mj3buoYldeBxCCeE61NzG+jwAGZ4sm1GJ7t/8w6xeoDUJ0VCBTZQt9/WFY/yKw==
X-Gm-Gg: ASbGnctYFDn8I04g4PYa5LvWTFVp/v6gTD8B+cQL+HPYbtsf2PnTxpYgeMwAhvSUXPE
	SuUikjf+6mFBftnEfgkG9MNx5WDkVQjUOiozxCyWTylrBT9XAGs732FbOeSawuCt5g/MA4uf6yU
	49wTwKnj6mbi7i5UizlBqZTsC3OtU525lKj3rkqc/hNjBBCJ2sUN07HjVh2OFITeHCIFqfnQxpW
	RiGijOeaenSzi+UDiZOHNlV7UEsYI6He83hnrI5aChUdlfU4OqnHFE8rHNykv+zVCa5Q2RJqiau
	xxZDkODI2irU+nwjZAr0KsNPuwHKMJs/EkZUDdnY/i2LznarbWhsvmg11oRCEMG81ds=
X-Google-Smtp-Source: AGHT+IE4wHP6J9GXf8X7N3O4gyhGdGcC+e9u9+l3c8VFMifgnYsypn4gjUxr5vUgHQch7GtGcGvLkQ==
X-Received: by 2002:a17:90b:4f4b:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-3053214596cmr20228761a91.25.1743577659803;
        Wed, 02 Apr 2025 00:07:39 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec71besm101393275ad.14.2025.04.02.00.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:07:39 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:37:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit
 L23 ready
Message-ID: <ovaomfvo7b3uxoss3tzhrkgdy6cvxi4kr2zxmqsfjxds5qfohl@t6kc4rswq6gp>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-4-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-4-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_000740_864560_D2657EE3 
X-CRM114-Status: GOOD (  11.93  )
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

On Fri, Mar 28, 2025 at 11:02:10AM +0800, Richard Zhu wrote:
> ERR051624: The Controller Without Vaux Cannot Exit L23 Ready Through Beacon
> or PERST# De-assertion

Is it possible to share the link to the erratum?

> 
> When the auxiliary power is not available, the controller cannot exit from
> L23 Ready with beacon or PERST# de-assertion when main power is not
> removed.
> 

I don't understand how the presence of Vaux affects the controller. Same goes
for PERST# deassertion. How does that relate to Vaux? Is this erratum for
a specific endpoint behavior?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

