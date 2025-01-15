Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2055FC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7fe4W5yc3F8Xv0So0kkrSAGzgbnJTso86hkv0C/0xo=; b=jwOm6wByYvAT19SNz9PScJUAB2
	aByH+xD8QfVCMyCpL+3NhTo/ex5FsPHY5xJxCSccT2oa8dZU7I0HhnvyqVjbfUdEKotVkaNNPO9Zd
	EIIYkmtxtVkk01G5gNoKgLkO1EAdJ/YbdXRJpeMc9C8pq0dVpNWKmtXu1X0+jwRoZhDXoyoE9xE8W
	E2WSsnRyMevPQ2q4Mc4enlwcq4SrSEmfGJG1djJwYqSuYeGYWCtwRHjQE+4GA5P1p9YUUfn30MTLz
	hy+SaOu60BkKXdYchcDEcIuQDrGV15Qd9Q//072WdoPX9MxkpTiwjGHKFQm6P1hrLvjTuEmh8Di+B
	eLdGtxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY37o-0000000Bvxy-1MVf;
	Wed, 15 Jan 2025 13:08:00 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY365-0000000BvaI-0bjX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:06:14 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2162c0f6a39so15847515ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 05:06:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946372; x=1737551172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7fe4W5yc3F8Xv0So0kkrSAGzgbnJTso86hkv0C/0xo=;
        b=b4sMcuSTL7iqze+6wLicvOTZB5HvEBsC3xYfrAhpWzW4XdnnQELrXAF5K/gj6bXD8W
         JX1p6F4+2xQeTm0d4uig4XxXdLJeg+/dPgwMewihIyvf9IFk7ikkas3iqt+BeqkEKuJl
         CZOqkkqSlFXi0HtOdo9VLb3gHdWhINbaausQg0zaolmv+OhYlgOJ3VxWAB391BHVUjGh
         haTn3wNkr5faMZTImYBuL3PA/CiJkStibus21StfJNAgyHNyoAVnSyOtMCXFdMSQZP2T
         TwMu7+izKrUDhortB72JX/dkmLRgFDE+lUBbaFK3gWK5yB4IAZ0bwDSGcxtL8TLvoiJ/
         wz3w==
X-Forwarded-Encrypted: i=1; AJvYcCUyt4C/qGEqxdh1HlkDG5mOUHXAr8NZHd/B4gukzSMX1pbk7lbvnGmEeQL/m0iKM+JMFmAstp8cyIC1J0VxwuZj@lists.infradead.org
X-Gm-Message-State: AOJu0YwVM4t2izMAtps6vqLIMzTUdEJSqLtVyrdK6tdCU3xQKAq1FFhs
	/wZbeweq/AfOWiUyzyb6J3jqAJtrYn6AlyKXBj1QXhiu1B11rj+1pWehcQCj
X-Gm-Gg: ASbGncua4wQBv5W9KwzHtnbfLoeSlDNPWyaMzyaeFtqbHg7Wqyj0Vg0/HYSRYh+KFyc
	tgBe95R1Z3XkFhLgTtCB1KfeeM7OavR29oXMNgTjKsq7jQV8lrWi03jnXKbOhiG9uTtvWlkxvdh
	7I6Rr3iw1XttVIO1jmzwgnnuKGej9IaexH7TDosWw6z7FvylhJ+NTk/vcMbnTW/tK9r8TRwY5LF
	+Cssd+WoQxOM4Xc5Vy+wegIY00AhEI/l3D+NvtXrNN7uBhW65Fhdgaaqx7g6Ah3PBUolI3+sZLL
	hs/eP5Vnq0Gaa5o=
X-Google-Smtp-Source: AGHT+IH7Jz31AbcmjVSbvq5BrZBB3n03YE0IrL+y2Ko96uKhRd1FiR82/SvqmJ8dZ/Wra69YjzLPHg==
X-Received: by 2002:a05:6a21:338f:b0:1e0:cc01:43da with SMTP id adf61e73a8af0-1eb0235a1f9mr4919297637.0.1736946372423;
        Wed, 15 Jan 2025 05:06:12 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4056a6b4sm9361210b3a.60.2025.01.15.05.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:06:11 -0800 (PST)
Date: Wed, 15 Jan 2025 22:06:09 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/10] A bunch of changes to refine i.MX PCIe driver
Message-ID: <20250115130609.GT4176564@rocinante>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
 <20250115130406.GS4176564@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115130406.GS4176564@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_050613_179400_BD69D91A 
X-CRM114-Status: GOOD (  13.05  )
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

> > A bunch of changes to refine i.MX PCIe driver.
> > - Add ref clock gate for i.MX95 PCIe.
> >   The changes of clock part are here [1], and had been applied by Abel.
> >   [1] https://lkml.org/lkml/2024/10/15/390
> > - Clean i.MX PCIe driver by removing useless codes.
> >   Patch #3 depends on dts changes. And the dts changes had been applied
> >   by Shawn, there is no dependecy now.
> > - Make core reset and enable_ref_clk symmetric for i.MX PCIe driver.
> > - Use dwc common suspend resume method, and enable i.MX8MQ, i.MX8Q and
> >   i.MX95 PCIe PM supports.
> 
> Applied to controller/imx6 for v6.14, thank you!

Richard and Frank, please have a look at the code to make sure that
everything looks fine to you.  There were some conflicts while I applied
the series, and I want to make sure that nothing is broken.

Thank you!

	Krzysztof

