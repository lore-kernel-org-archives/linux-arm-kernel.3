Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144E4C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 09:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drCh1pRCCuVVCI4fn8N9RmOugnbPrEsMkgW0vT+Cabs=; b=c2xvtVBIMrmvog2b9MOFWoSij5
	e4WUWyP/G9XdrKh9SXZfuFTFN4i2N8W4Cwnn/JHgbHr2+yVqodf9UT9QFDnv9q2xSVcxoTxR3Vvey
	rm2ShBDurcGO7m2l4WoLb6XUDYQLjN/Y1Ym9CdUkYVBpV2K8IyewQq3MWMfPz0kPfw+/Tda4tlFQW
	lTkMM/MASsNZBh0qyXDGW00gA5OOVwEIAsvqOLriXLL3rUpv68P0SCaKbjk276jidAgsAZMSsCx/h
	pau/3ERXjbEh0Im64bOUxBInXYfeZdqMBbULdljHw/glE+7WjJ3O5OxYjHDhQl8UB7SHo0vDZwcuZ
	btV1pgkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzIF-0000000BCv6-43kV;
	Wed, 15 Jan 2025 09:02:31 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyBF-0000000AzxO-1n4W;
	Wed, 15 Jan 2025 07:51:14 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2165cb60719so114890945ad.0;
        Tue, 14 Jan 2025 23:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736927472; x=1737532272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drCh1pRCCuVVCI4fn8N9RmOugnbPrEsMkgW0vT+Cabs=;
        b=lUbojXaDqvuAjDmMYDrPZRIsD1xnaHbwtoOUTXo+yS2COnIZV/UeChgjMRGAqe8dPo
         U1EZhlZ4wfwD3Ks+0Kd9xXOb3ThzMxtCcxDXHiUjHqc9NQe8lALUR9ugHw+9vw8pHZaV
         tiLA+ZDtIygKH48UwxXmicQnLbz2K66YyVC24aRGPdpc89t+A1UNTds20Ldpuk/nxXcM
         0UnYrLl1fl5BeqpE2CuDwYlL2pbXNmQwC/YAvC8Loa4eLN4a054oQSOdAfRihUSxqowS
         Z42DF8NcL7ACA0QJqp6lGVxHIyoOIPl52htv7KMklZ0gondAd+X5hw/WmbD2ov6bV5l/
         zvSg==
X-Forwarded-Encrypted: i=1; AJvYcCU1jbkvzodyXzodrlt9BN8jjESUmzHksTCCaSQ+967QnZ0zRc1QSOY8rXrKd3aZ8lStrZkJ3yESbeiLe38izVLO@lists.infradead.org, AJvYcCXxIRdS7d4qzjtYQuvthLAOuxvn3BQ9i6GE3wZ8N+3GILFw0WqfwJvnswMS4xd+a+0MiKpjtcURq0vMkngW6mI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFeLCI9M1qJOV/COhS+36Sq95exoJAS/GIMPPFWbG/R4cQPI+p
	U6b69nEFmRC5ak+H7Ot+4xS9SQwuooJG1vQvPANuE8r4lGC3x7mIXCQVQQBa
X-Gm-Gg: ASbGncu4ljgsKFXatpBfT80/duaqgKvcx1i/amibxO1tE2cuJIcVoY00LzZB7xpolQM
	gB70hKl6W42wKjUReyy0WhAUyL8q9uM9PLODasl9bThRE5qsv+yYiE9oGkpUieAjvjKYH5PNsHc
	38AWtb1Czpjp9REEPgD5UQT0jgjUuDyn7ZaQShKgl0IzNBuUca/ubtNRF9wK0RwLDCcEcsH+y0O
	I4nnHgMyyolqaxcUAHmz2lDAQDftSdMzGbJNyLXcGUg00y8mgm9gES12VJdGDwEsbojgkb0ttCJ
	Cfmch3V1OIkroyw=
X-Google-Smtp-Source: AGHT+IF9TnngdOrqXrmwB55byFeDNpcjUAho4KzCQx6WWCHOh/pLidGszCFWm7Pw0uVlfLtCKp9MvA==
X-Received: by 2002:a17:902:f60e:b0:215:522d:72d6 with SMTP id d9443c01a7336-21a83fd2383mr432105685ad.38.1736927472073;
        Tue, 14 Jan 2025 23:51:12 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21bb316b825sm48453045ad.237.2025.01.14.23.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:51:11 -0800 (PST)
Date: Wed, 15 Jan 2025 16:51:09 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] PCI: rockchip: Clean up on error in
 rockchip_pcie_init_port()
Message-ID: <20250115075109.GA2704262@rocinante>
References: <7da6ac56-af55-4436-9597-6af24df8122c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7da6ac56-af55-4436-9597-6af24df8122c@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_235113_463494_13D195B5 
X-CRM114-Status: UNSURE (   7.33  )
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

> Call phy_exit() before returning on this error path.
> 
> Fixes: 853c711e2caf ("PCI: rockchip: Simplify reset control handling by using reset_control_bulk*() function")

I squashed this together with the code this fixes.  Thank you a bunch!

	Krzysztof

