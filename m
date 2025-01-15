Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B745C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqp/xKYJlk6xjm9oXtg0IyK09CAv3plZIRx1yYheMC0=; b=s5Jld8j1HBDUWkLawplSLJ9pzd
	WiXRDRJaT05+PhWWkTF7QNDLoQjuB7OjHrK9nmFOirPqk5JemGaSdtpl9MjSr6IaH7JGWg8QdX9rw
	ZF6z0gp1qzbKIe33/OCICxAmwtKD8DU8FA9TwoDi65CmgbvDAc9VtHex323p1Mxf4fKp0y7518867
	+W5sty6g5IFlOYrS7f/HR/ps2+NJxf72ckA4YI4F0hcjARLhjRUBH11yOqMaeBJDU1pxIePeXmXz8
	FiX3JJSMEI6EdDg69dbvOgYkDjWEXcFqdVOATl1GfP4wf6Nib4YAGGE8FfIlTJpn0BS90TvAX7n6s
	6cTBap5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1bB-0000000BgQL-0mjF;
	Wed, 15 Jan 2025 11:30:13 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1ZY-0000000BgBu-3Uqg;
	Wed, 15 Jan 2025 11:28:33 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2167141dfa1so13238155ad.1;
        Wed, 15 Jan 2025 03:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940512; x=1737545312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqp/xKYJlk6xjm9oXtg0IyK09CAv3plZIRx1yYheMC0=;
        b=wpmLd2O1AHehdTW1xteLXsLEP0O1R3UsHNIHCPfROw//jRh9hvmp2MCLZjFi+wFvJg
         yQlgqL5YUhGySDb43DE1aGKsZebcO5rj1FmNr4rA5JZjytm31jSpl6YmGsCC3cJqhpoA
         sCi2DRaGTuSRwyGvNCT5Y6bWkaCE4NSKj1cwuHJQVWucIVODKImhkHcJuZhObE7XMk5W
         ccXaSWg+ES7fFQzHQI+Ei/IJ+m9iw+t8gr3yD+xFh64njFOJjGfBsDi5x/f4SdrJkPJr
         hqNvdHd/WuyuNmMmxpnQGLmc5cg1XLnVSSb9jzZSntIXhCD6sFGnFep1aUllXPJEDobo
         3ufQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMmxrFMaByw5Epc8cIt5OErHvtWeJDs4TDaFdY7/ed5mLSjynvMQ9i4n089+kdRfYJdNkG7aQyGTytaBLOOGE=@lists.infradead.org, AJvYcCXRQTyiOmLxLNwjKpe3kddN4xP+xn+SCDJ7QlBB2ZrscVmCIfe0rgSGsLeSxotHbBKga7jEl4qNlji4NeaLSt0W@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8BMhNkMNeYjsPXPDKdC18tOaJeclsXwklr/j3teRGWdzRUv26
	RZJ8RXDeixheo9U4AK/XEmuAHG80ZxJ1lYkzt/ImPCJ2he7SBe/sqC4e8zRv
X-Gm-Gg: ASbGncsvjojU5ebvjmBGmth+5XHPDM25CyAd1g1FT9XhPiQrwI00RPMargnf9iOKnAQ
	6F3NzsRmKFsy6CDeT12FVQgrAOWWrzaOo3VWma/hwOsDHxWqklZzVRieRAPSdCNa2in6s7QwcD7
	g3JRElfN8nwkTHvOCDYIlXgCk6pQdEF8djn2g+2O0lajJLm9yH9SpUluu4nMshClaTOMzKhFOxk
	pMd7m4sK/UlkxuB6ZczKEiiDor1k0lsM8+Cl26ZFXqFKUfFqJGRp3VjVqK4blLASaZSkuPd00LS
	BDP303DfyJ4RHm0=
X-Google-Smtp-Source: AGHT+IEKdHrLd7CdKz/bzUdcA2Iy0TnBTOOXFKEtiOmjZ3qwUkKfa5EV0XWzkjB574DaqoYFs4zJVg==
X-Received: by 2002:a17:902:c40b:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-21bf0b76a12mr38927045ad.2.1736940512009;
        Wed, 15 Jan 2025 03:28:32 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f2199ebsm81265345ad.143.2025.01.15.03.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:28:31 -0800 (PST)
Date: Wed, 15 Jan 2025 20:28:28 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	cassel@kernel.org, lpieralisi@kernel.org, heiko@sntech.de,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: remove redundant dev_err
Message-ID: <20250115112828.GJ4176564@rocinante>
References: <327718207d3cd72847c079ff9d56eb246744c182.1736126067.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <327718207d3cd72847c079ff9d56eb246744c182.1736126067.git.xiaopei01@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_032832_873001_05FF0FB1 
X-CRM114-Status: UNSURE (   7.85  )
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

> dev_err is redundant because platform_get_irq_byname() already prints an
> error.
> 
> cocci warnings:
> 	drivers/pci/controller/dwc/pcie-dw-rockchip.c:454:2-9:line 454 is
> redundant because platform_get_irq() already prints an error
> 
> so remove redundant dev_err.

Applied to controller/dwc for v6.14, thank you!

	Krzysztof

