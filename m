Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA21C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 12:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/9N6IGO2b06XLqPK9RBGgEbBk8wQn9vBDguitaJu18=; b=ZBSrK04Wqd9lAjOE2gtiFEqmSL
	AaJsDz8e1uv9AoYSrdBtiRU90xNCh7MZU1YygivibBgW+r/GFqFxSPnrs7bwSOP40v0xY3aQLlHCO
	O4/K6cGQsuNVmEfv4fmBKjyqDOpYxiGZ3LZJxcUzPJPMHlThcOt2taplqLvOLJTW0JsbgTzFhQyTG
	RwRoYzS3E8Md+T9nKcX9szfTsXiJ+4WENPZy44xD3Nrx5GxGyD6F1Ps5nL6kH63vUj3ButlTQlffL
	p/U351IIJbPs5XxLUv8NBTkYW0DtC5Z1xL98g9ZXKmwA8825Wlv9s+vj+PfklCYVrpxpZaH3GpSZv
	2O8b5RwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8jz-0000000DIzK-3WhR;
	Fri, 28 Mar 2025 12:23:15 +0000
Received: from mail-pl1-f169.google.com ([209.85.214.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8iF-0000000DIos-0VXs;
	Fri, 28 Mar 2025 12:21:29 +0000
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227914acd20so48953645ad.1;
        Fri, 28 Mar 2025 05:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743164485; x=1743769285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/9N6IGO2b06XLqPK9RBGgEbBk8wQn9vBDguitaJu18=;
        b=BaFX3yd+5A6KnlRI8/WaW+a8xWokBe7xJoOQR/65/XC3/cqavw2Vc17sRmjWRObbE6
         FnWNWhPhoGJhsZ2S4dFbPYQWOKhnRswoj9L1rUMU2ntcZooTSn6T2nx40ZRBXXBuTE3P
         T0TotpV47EH3sKnMK1SyJxzXokfcI1w9z8oo/Yt+4p/TZFdaxfHsR1tXAF67ka7FgEOb
         ciHzuDza1As6mPoinzmeTM/8HqWRunHkV3LK9zskCScZq/fQwuFvYGsdWLQE4qO6fA1x
         jCWLvM8osgn9VGl1Wd/rC5m23zAHzHzGj7R17YMyWbNJCnOnSyqc1+xFPZNcA+sa6Fpg
         r9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvE1m84F/wuQF+jTgaeoZyQoc2TAmpAji2K0b0QyqCXXXHJ2ptOaZkuNcs4BPJj9+lB321rQ8l0ZeDEMT1OpZ5@lists.infradead.org, AJvYcCVSbApcewGM3oW//SaDOk+kJOAio1fw+cIX677dxwMuqB2Os+9ch9r6rEYELk7ZHC7mJFRsqqHN8GQ3zLaFmGA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNcFJXd/e8Db9fAJqYP6xkx263ljKnOIchTt3oKFeP8md3lQF2
	yIYGnYDb76e10X4AC+HXfkql0hCXwZbo70zTEeGbK77op4Koes8q
X-Gm-Gg: ASbGncvqyUH4Y+gI7sCe5ZgL5KWb7YC0ZhIIZyoKwm6d583TG5OmlvdLbuI90BGBuJV
	M+Fp6THWtu/8qRCraWAYw6mYapSqtf+52kD/tvjxAUXsOcqsiTstpfaK1nnM/e2UZ3Rzg7k41HO
	Mmhv4NZ1ek6M3reY8Twfao3n8G60e0ESH5DXHeRytb9vS7DC8y+2vtZ8L5xuvNmcpBxqN3MnuY/
	1EEzl2wxKk7dlD/DV1zCT8uBJil0+nXvzpfxVjofcflOxXm/t+6V1T0AtlMjh/8n01hCGO/4+v9
	nSXRW9NwuLR98Kd4ZZyN7aCaEXJrKUUAHVlnFj+ItvJ83O6VVCwgq6lD7VDEXq9TLORIq7nMgM1
	8NGo=
X-Google-Smtp-Source: AGHT+IEiqFnwgAfpimqiawKJtkxu/+UqZskGggMC1JBWEQJ69Smb/Nhm2zy+DwpXPUHdJzcDz3gJlg==
X-Received: by 2002:a05:6a20:9f03:b0:1fe:61a4:7210 with SMTP id adf61e73a8af0-1feb5b80d62mr4306855637.2.1743164485217;
        Fri, 28 Mar 2025 05:21:25 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-af93b52ea6bsm1271537a12.0.2025.03.28.05.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:21:24 -0700 (PDT)
Date: Fri, 28 Mar 2025 21:21:23 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: rockchip-ep: Mark RK3399 as intx_capable
Message-ID: <20250328122123.GA1187318@rocinante>
References: <20250326200115.3804380-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326200115.3804380-2-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_052127_156726_16903E54 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

> RK3399 can raise INTx interrupts, as can be seen by
> rockchip_pcie_ep_send_intx_irq().
> 
> This is also in line with the register description of
> PCIE_CLIENT_LEGACY_INT_CTRL, section "17.6.3 PCIe Client Detail Register
> Description" of the RK3399 TRM.
> 
> Thus, mark RK3399 as intx_capable.

Replaced the following commit:

  e55c67837a8c ("PCI: dw-rockchip: Endpoint mode cannot raise INTx interrupts")

With this one directly on the "endpoint-test" branch.  This is per the
conversation at:

  https://lore.kernel.org/linux-pci/20250318103330.1840678-6-cassel@kernel.org

Thank you!

	Krzysztof

