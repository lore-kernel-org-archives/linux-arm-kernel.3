Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA11C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 21:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZqba3gVX41zqsOhdc28XH+vmCDKWwigOXcxvppEBtM=; b=UGwRCEf9TeHXPmKeitw8VIEag8
	e5WMorAtMr2P+yFnrzSrxhWo3MZm8mgW1JUau3FviXTax6RXMTfGsW4I02gpMMAsZv23p6SJv3+sP
	QUO0BoAM5sLKVcUJakcI6pcriAwrcWBFsPGtR9Sfbd9KASnSw9DfF1/0G9WGZq6zOieC5dVGP7IQp
	TuR9Kj0KuWTTfEXg6jeP4IEc0P0My4R62xPJU7NCGw03PQ3Nbw4wiLYUO3w2e+n4FUorexbFjl7n5
	iudU816/Mw5YPMXHmTtqTXW/WwU4oVu9oRSEFmQrpfnv/RKN49KZKfq1ui2Dkm1MLW4W/JcmWYSbm
	y3OOoUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trl9z-000000043z0-2OZz;
	Mon, 10 Mar 2025 21:59:43 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trl8L-000000043pb-07jO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 21:58:02 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2234e4b079cso85747115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 14:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741643880; x=1742248680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZqba3gVX41zqsOhdc28XH+vmCDKWwigOXcxvppEBtM=;
        b=ieUVecTvPWNvPx8+1Ox/lJEeN9notccJJ87xN+aXr88UzLw/OFDApCmxnzIgY19qyo
         8Xq61yH7TXxYyjtezLzFf8HgZQuLmRHj8ulM3FY1BVGSp8FCsMD2rLV1KfZ2Dauo89/D
         HHoBJqtBEXadhcWh/1OfWn7XEtVGepniBGgvcYSD2O3aVSYLayPIwKrtv0ED+zmVobhp
         tBPAjZ/4TFRAFvKLqxY5xZBWznTqKMvbNndBBkhuMr6Hwl/sUxQZTnRca4wowwu2N0WI
         51YvGggtZNa3SGARLGbcxBtlt9lk5um722RuZiHz/nzIPj3CepP51PJ6MmJlVz9K/bBn
         rR9w==
X-Forwarded-Encrypted: i=1; AJvYcCW9Wa/rHIrvPcoGWPsrDYgsubVrktD4nslfjgpWRkCx1eivNIbZ5Cml0LU/ngChmsrK/Q5MzCFa7JTaa6VbsjaW@lists.infradead.org
X-Gm-Message-State: AOJu0YzsawKzPml28Nh2EB+swT1MPdCsl6hRrBf0fqRr6k1XH/+3R6+7
	dprBnfkdlt0pNizXxumUDmjOOsDMs3uf8vj2OCm2AdRSqBBKaNTV
X-Gm-Gg: ASbGncsQMHL4R76RLKAfq5xBCYIwjeAZAddRazRH7iUmJF1pQJYmXfIpHPOOz7e6JuK
	A81mECjhJIO4ZeikVUqd5zYjCp9G7elC7NBr33AcKI19Ko9ZZJjTeW3yjDvnnJZS4QX7QsaK+ED
	u0BRf5P9w07hjR0s++t5H07vyo0/+ylD9SHDWt3IFsklPLEOqd64rF1sIKsHCiGG1mSLyplG9G+
	aCR1I65IrD4vMgeVVj5arJG1P2ArXtgFdIEjgekeFx085/l5QNJHph9fkJ4WHmXRh1LVVqMobZw
	ppfFwVH5ZoVPDkFpqPylS3hzXdBSf1VuwDXerZT9bbAdKpPxNydylxqbOUzcIAhxoj3jNV4lCsY
	2oOw=
X-Google-Smtp-Source: AGHT+IGyxv4vNjjG7KaJ3iyPdfXj74x7uGlGIgwHhUObVU0+SSpA387sqH72IQVZOID5ZMrgBJYuhQ==
X-Received: by 2002:a17:902:f94d:b0:223:5a6e:b2c with SMTP id d9443c01a7336-2242889a729mr153897815ad.17.1741643880051;
        Mon, 10 Mar 2025 14:58:00 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-736cf005d87sm3571543b3a.49.2025.03.10.14.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 14:57:59 -0700 (PDT)
Date: Tue, 11 Mar 2025 06:57:56 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: manivannan.sadhasivam@linaro.org, robh@kernel.org,
	lpieralisi@kernel.org, l.stach@pengutronix.de, shawnguo@kernel.org,
	bhelgaas@google.com, s.hauer@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, imx@nxp.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v1] PCI: imx6: Use devm_clk_bulk_get_all to fetch clocks
Message-ID: <20250310215756.GC2377483@rocinante>
References: <20250226025628.1681206-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226025628.1681206-1-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_145801_064746_47D0C02A 
X-CRM114-Status: UNSURE (   6.63  )
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

> Use devm_clk_bulk_get_all() to simple clock handle codes. No function
> changes.

Applied to controller/imx6, thank you!

	Krzysztof

