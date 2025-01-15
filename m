Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1334C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMf/gjH9CaGlznAM7Zrfe8YwB74BkxcaBNpx5Jp341k=; b=ucOKKvxgPVUnTxQoOqDHwYa8/2
	vu4X0IzZdPMxE+KHQOg9gqh9gEha30N6olvdbgRmqoLxGZWQn9bwkjygcIV/1clXlnkNL2a4a+XjC
	iIfOjVBiX+yzqW0PmuokanVXv3RtcyK2xsoQ67U2SoNBDA1y9jLq3O8glzDCzQaLWGm6twoxXhYrB
	SlQBNXIutvKwwNsZizUuOWGwHi30O7pj0tAh51h57LOnFQOzQu1XohJA6GJbDjThHS8iXb2hwAxLn
	jQoJ2suTWdr4LsAYvoR/7YDP+JC84kU9EzBF2PGfLjXW38NmjVnGyr+xYHgQvbL5ZXteBcXT5pzUm
	RH/17VDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1e4-0000000Bgvc-3Mmt;
	Wed, 15 Jan 2025 11:33:12 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1cg-0000000Bghi-21Qe;
	Wed, 15 Jan 2025 11:31:47 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2163b0c09afso121390235ad.0;
        Wed, 15 Jan 2025 03:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940706; x=1737545506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMf/gjH9CaGlznAM7Zrfe8YwB74BkxcaBNpx5Jp341k=;
        b=BvZrEDF7ZUrDLqb2w4l6sf+aLqX4cbiaPHdWSF4//JZyisElkn9XH9iDG9YKyk2pvh
         iPbkJrTcvkNb+F7T5fa6eq+lbU+pxS+jaQnzwml6G7ywFOagW1JvuhOip3Ed8gX7l1bv
         yhiHBuH5eWSo2PjGTdUnjA02SYfgdPB/JQH4F4+yFU+4+nA0+D5FyNSo35wa38spnac+
         RGF4YTp6tB3hAGnYHLaLQtBvrlhukpHn7YqGr7IS5jZxNGwCrthQ32SOlK3WdJ8twNKJ
         8yDCFRmtzHAKeL5JNGnMgmdbhAwaRRr7g9MXfWA0OSiDfpAz/oC5Q93NFXCBQqa90Z7J
         ymTg==
X-Forwarded-Encrypted: i=1; AJvYcCUVBg22hiE+wrQT/KMC90hWjDcDCdlZxfKmVgN9gqqNvwerVFFuxdAtz/rszczl1/dg5XSSw6ML206mfWAbRpk=@lists.infradead.org, AJvYcCUWe88FBoq0BztAVDWC35QFQo4D4g8TuApmiIH+Ox/07j/KuRMfzUBFcXgAD0B8f9G1f+UXakfh0Nfn1w8QKI78@lists.infradead.org
X-Gm-Message-State: AOJu0YzsM5ayTtpokLjcWwpxZzua7IVeLQmscY2QG4QdHg1P66qM/uR5
	dC+W0WKGjPjLx0ClD+87nPgwx0/gw3OCzwLdnDjGNnIJzVjQB+5sVYcP53uo
X-Gm-Gg: ASbGncuJUmIsZ36G3l71Dnij+fq+OGd9GyPpsU6jArn98/L/ooLt0GTn7sSvFTbkLu4
	CawrUEa6F5bkiBcTPj+DDBRvqAWrnRJHPabnyyH7XwYs/mzsXc8gHwInF8LWyr1D5bvekhQx2os
	oEa+/u6MIWE3ObiU/Ds0+fhGkmwbmQYq+lTcbcnHUHPvzuUPckY4eSklp1DVGGC9MBhuM+yUQmD
	8SX9UITNs4igT+yqO7MLnNA0tKgEKSn/MYIfX0UcxXJ9MnCnZcOgfByydf6WXBmN2HJq3Ad9qYh
	xxuN31uQZu5ncNI=
X-Google-Smtp-Source: AGHT+IHH3vdl0SoO7I29qFqmrTAjmo+4RApDGp3zpjzEyS9KqQP4GKUQ7H0LW2xUTEH4LU28i+G6ew==
X-Received: by 2002:a05:6a00:2c86:b0:726:41e:b313 with SMTP id d2e1a72fcca58-72d21fc659dmr36762604b3a.16.1736940705705;
        Wed, 15 Jan 2025 03:31:45 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658db6sm9275820b3a.104.2025.01.15.03.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:31:45 -0800 (PST)
Date: Wed, 15 Jan 2025 20:31:43 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] PCI: rockchip-ep: Fix error code in
 rockchip_pcie_ep_init_ob_mem()
Message-ID: <20250115113143.GK4176564@rocinante>
References: <Z014ylYz_xrrgI4W@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z014ylYz_xrrgI4W@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_033146_531843_0C6EFA26 
X-CRM114-Status: UNSURE (   7.01  )
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

> Return -ENOMEM if pci_epc_mem_alloc_addr() fails.  Don't return success.

Applied to controller/rockchip for v6.14, thank you!

Krzysztof

