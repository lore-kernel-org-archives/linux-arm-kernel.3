Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794E2E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DF6tF/ronwtGaLPzR1Y+1eJC2THWzh90BDnwiyxyUlA=; b=O60bLFtq5fNN1XGfBEa4XEZ8w7
	p3YZQOtQO93bcNvf14Xv/9pAc40ilNfXRpeAl69zxB2I3NbfbepC7ZSF3wVWrSgGfxOulZsqhu9Mh
	XogBwMOwVgOHR/VcHce+aaNSqRjFuAliSrimW3HcnUqhEGzRROjFMz3W1z0uL5pbUTEzwJ8Z34D8Z
	mU0UGJrkwWF/W5WflLpLFIGnIlmDV29L3BqrSlc2P76pwEK/mkU5oYxA2xe2OrsmV8WNjm1dtLZqT
	7pqZmaApnvO9VrjEY54iX22TEwgX0XexLb7/Icp0ra1yc+TO9y52IfBtKE+Mzzb7//UkQkBmrLER2
	GPwES/AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CtX-00000009fmL-0Bxp;
	Sat, 02 Nov 2024 12:06:19 +0000
Received: from mail-pf1-f178.google.com ([209.85.210.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CrO-00000009feF-30lC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 12:04:36 +0000
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-720be27db74so1753705b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 05:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730549046; x=1731153846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DF6tF/ronwtGaLPzR1Y+1eJC2THWzh90BDnwiyxyUlA=;
        b=dY9WPtnhfnlMlwPXplk49OtuEESW4DLA3dW+IoSR8PQ1QgYneoKSg+78UBs1SygmWR
         idM2SjUVo2RFaUuR1+b1snxZif7XMp9SMuacOAlG+YVunKvOG62IJeGjXUjuBr3gOhch
         UH6cpbRtUNYUO/Lg6la3LnDCFWyieEKZ2aypbVvVw5pYKrQCsIjw7CFzSKW/EBfy7Nqn
         n9nD3ajItGUhMdrar1lSKKysyioeCtH2XBj1gDwgcswm9BCWirN8DLaLSeQJYhp8JcTj
         7nHm9TKNgf9TX3bED2UcJFc6nyeydQfpqwL6kaAcQEkFq4Q/BwEZWL49ah0PnlnDgFag
         Kd/w==
X-Forwarded-Encrypted: i=1; AJvYcCU+sE/RV807VthHq2N8Ru9Ah5r//IN5B4/aKBvhCKhECOjDGcdxUn9zxEtgSgFa/TKUewaLXC5PITQf2TDA6/ws@lists.infradead.org
X-Gm-Message-State: AOJu0YwnwcModT7+tLuoJ5ymcWAMEE4TgTenykLaEBVDiboqk+jR9p1W
	IYoR4x39e1fDNNDJWcrJMv1aXyMrT8ghQTA8d2y9c3/mJdbu1W2c
X-Google-Smtp-Source: AGHT+IH3QBupALD0Xsyr4GM4EVgvwE8anNNXOVnVeSjs243gIoBttfPnD+0+H2RFRYw7KFhojBYygw==
X-Received: by 2002:a05:6a00:6386:b0:71e:427e:e679 with SMTP id d2e1a72fcca58-720c965da56mr8996435b3a.4.1730549045701;
        Sat, 02 Nov 2024 05:04:05 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ef741sm4062238b3a.82.2024.11.02.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 05:04:05 -0700 (PDT)
Date: Sat, 2 Nov 2024 21:04:03 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Stefan Eichenberger <eichest@gmail.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, Frank.li@nxp.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4] PCI: imx6: Add suspend/resume support for i.MX6QDL
Message-ID: <20241102120403.GF2260768@rocinante>
References: <20241030103250.83640-1-eichest@gmail.com>
 <20241101193412.GA1317741@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101193412.GA1317741@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_050406_781036_AFCCFEAF 
X-CRM114-Status: GOOD (  13.19  )
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

Hello,

[...]
> > Without this patch, suspend/resume will fail on i.MX6QDL devices if a
> > PCIe device is connected. Upon resuming, the kernel will hang and
> > display an error. Here's an example of the error encountered with the
> > ath10k driver:
> > ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
> > Unhandled fault: imprecise external abort (0x1406) at 0x0106f944
> [...]
> 
> Richard and Lucas, does this look OK to you?  Since you're listed as
> maintainers of pci-imx6.c, I'd like to have your ack before merging
> this.

If things look fine here, then I would like to pick it up.

	Krzysztof

