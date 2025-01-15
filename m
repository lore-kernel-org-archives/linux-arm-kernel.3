Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C055C02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjRxHp95fgWw/A/HfteiujvMA9qxAfC7IB/XFcENGNQ=; b=WRY6mDD43rOyCSs1o78m7l6jNs
	+Dcrw+zjbvyEKhTxrKSjylOEcpO8hBKTeQxhpCp/t48yxkkVQ+E/a97V+p8wceB08+Rp3t9ikd73f
	deStotxUdsqAXEtti3ITVjNYqL5Ccsd0AkvLjA8SCMtW0Ev89+fMbyy76RlSdH+r9lD1S3L5G8ury
	PThMaJFFvxerekVZDuVA0KsgcKeoT2nKkhWhNPztHYe+lk+ZMN1Q9JXV4fqW+Drncy2K24SswxkXi
	cArgr21BNHxk/sctwmTAvpE04Zm3OwBVdkOQpAgMok4XzwMnGphXKsvGmvSr19NtQNS4/RctGhbaM
	+oTJrm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3em-0000000C182-2DFS;
	Wed, 15 Jan 2025 13:42:04 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3dX-0000000C0tZ-1JC6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:40:48 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21644aca3a0so148844285ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 05:40:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948446; x=1737553246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SjRxHp95fgWw/A/HfteiujvMA9qxAfC7IB/XFcENGNQ=;
        b=eid+WSBQjfDut1Cs1OjktdaTzM2YhX5wn6uW74EiHvBTrJQoRhmsTuJGIlX1Zjr8UF
         V4Ahj9m6Wc315x3vb0PzUUS4IOwKO6NpXsdkeM+8HqBbQlez/riFovzthicQKwEpBsGK
         0NBAi9X6Zmu+rAqvd+CcCfEJkUkakNkUqevpeED5+G8G3sDAKzlVRF1H96l3bwciklwg
         Xmd8qayXSwVNFyeUsTOoC+Q10miNaUBqzFpqj4KbwwpJVSz9oMYgGL1nm1S8Mx9IN94Y
         BkQTtS3uAeO81xWg/NjQPugqyd2+9aY5C+v+W1w8VTD0E+a4wuBRS7TAVLwGCpPuSnqG
         A56w==
X-Forwarded-Encrypted: i=1; AJvYcCXQTyzufzK5SnhRNFIspcK0AnIMhYTeNg6rX1zMPjuzBAnbSKdCwwGefsqlBxSHjraCFyTUos0/QAF5K7N6ET/n@lists.infradead.org
X-Gm-Message-State: AOJu0YyOhxIXTGq6p9qgYFJ/meYi0ascaPutShMsSPks9lhwIs5kXxVH
	XgiGdVe2c3wYiHdxFql+Qb49sIrEE1ToAvZ0cwNsMFdtB1RBveoA
X-Gm-Gg: ASbGncsWXco+ZXaPgSfcI4gRlRwt8bFJ6JuDJhbb1VSNwan/WfImWLKjPNzXHkn3lTC
	SdXZ2PU9AI5llAYaFkqeioGF1FIeCJLtprZqXRa2HIRQQFBeVEk/rHkTIeg/jyWy80mfZzqUGv5
	l9xaj5kTY3FeKqHHfPrbpVhZnUAaWFRrGXpu0oj1/SqYCLQ6qSO9IeJBbSoJuFSjNxvOL3Y+OvN
	GS1IbmWWslW8Thjy7JPyYc587pfMyjugZpez4aqTy1gyt9P3hxTrmgaKgSSbGiWfoab3dqPihz4
	a5TDjQlb4QOb6MM=
X-Google-Smtp-Source: AGHT+IFBc9u2m9CIKKe0EemdS8o4PhYCZliHYxexP/9pM9Xw1hjCmQoL6ghLKLnHjOXUvJ+g6cNyvQ==
X-Received: by 2002:a17:902:cec3:b0:211:ce91:63ea with SMTP id d9443c01a7336-21a83f56f9emr450296855ad.15.1736948446445;
        Wed, 15 Jan 2025 05:40:46 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f12f919sm82767655ad.69.2025.01.15.05.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:40:45 -0800 (PST)
Date: Wed, 15 Jan 2025 22:40:43 +0900
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
Message-ID: <20250115134043.GA1049031@rocinante>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
 <20250115130406.GS4176564@rocinante>
 <20250115130609.GT4176564@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115130609.GT4176564@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_054047_354210_35A687C6 
X-CRM114-Status: GOOD (  16.91  )
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

> > > A bunch of changes to refine i.MX PCIe driver.
> > > - Add ref clock gate for i.MX95 PCIe.
> > >   The changes of clock part are here [1], and had been applied by Abel.
> > >   [1] https://lkml.org/lkml/2024/10/15/390
> > > - Clean i.MX PCIe driver by removing useless codes.
> > >   Patch #3 depends on dts changes. And the dts changes had been applied
> > >   by Shawn, there is no dependecy now.
> > > - Make core reset and enable_ref_clk symmetric for i.MX PCIe driver.
> > > - Use dwc common suspend resume method, and enable i.MX8MQ, i.MX8Q and
> > >   i.MX95 PCIe PM supports.
> > 
> > Applied to controller/imx6 for v6.14, thank you!
> 
> Richard and Frank, please have a look at the code to make sure that
> everything looks fine to you.  There were some conflicts while I applied
> the series, and I want to make sure that nothing is broken.
> 
> Thank you!

I moved this series to the controller/dwc branch as we have changes there
on which this series depends.  Hopefully, this will solve the build failure
we've seen on our next.

	Krzysztof

