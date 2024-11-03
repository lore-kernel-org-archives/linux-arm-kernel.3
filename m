Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAD6D11192
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 21:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdXLylQlZ9Tj3s4tp6NVE6CDQHIYZCRiCbzxNvRzB8Y=; b=pApMdejXqFsK4MLZQCZD+x/TyP
	Awospa1ZQ0qzHmOM+t7+M1P6UdBLeg2nPIUtFIWPfXDFHw+jo5zvNXtFMAC6mg2Dw+p1maIWRY+q/
	EgdA1u0sd9dDZi4fWjmOSwPTxSwQaLRtj7qDTilWTvhvvGbEneMmDSlJN73p7Mz8vsUrvW7ly5Ncm
	z8h2IM6f1FpfcMSvmWaSENK3eFMPpr/rn8jLLgtbkNPyJNxyforpmVxkhEhZbOlBSKrFLQTUFbMZ9
	HlDxqTJbuKsk4OgUJSip+5wV+5UyRucqxJDkoeKo5gzIP2EQMb2HIG/4iDw3S5bQGY5ILO1V4cY15
	F2YfVPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7hrI-0000000C30J-2PcJ;
	Sun, 03 Nov 2024 21:10:04 +0000
Received: from mail-pf1-f174.google.com ([209.85.210.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7hno-0000000C2eO-23Yp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 21:06:29 +0000
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e8235f0b6so3110200b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 13:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730667987; x=1731272787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdXLylQlZ9Tj3s4tp6NVE6CDQHIYZCRiCbzxNvRzB8Y=;
        b=jWDwx+rvzWvu5qoGrjarkfC2BmoEzILPJ/2iDdcXos4vmCPtdycDZ3QZ5OIZO9GUo7
         f49km40tqBdIEi32FF6x8xcegCbD6YAgRfJvyN5Ira8cgw/sA3tsYxapEozu5uLdJmtb
         Z6QqAEN0IkkvD57coa33O0Nd5HSmBH6ZP4u73MRzvKanGcZfOaTDNb+idPtywG63AFi+
         A8XyR7z2RSMBmhU1rKweJSkYJTFjqVVDue5tEX7pXIoREfU8+YrCTaz3F5gsFfgso3L7
         48+upWtadLgHq96BYgpan3M6NduBSujMwlA//fZIqqPEyNstDzHyunV1th5yTJU3T2pz
         C1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEkFx4aUVXmsq1l1Wr4TWFnSzn1cmLpzR/jDzQxEndEmK9ZqufRFGUgNcXyRSSZJIYot9wnXqsFMpHw41AsLC7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe8GkYScq6ta7eDM1GO6+AGvc/e9jF7xC0wPd0+2RIqhCu1T2U
	CjnjZZS4yv2tdIR+Cl6XQppTEiYQNIPXinM3muvOR/PK/sNF0OdGdKKzDX7r
X-Google-Smtp-Source: AGHT+IGYy5jVsN3Rgu5s8FJn2BIs27OnMRPfCyk7W+axLO91wyEHj+Gcm+Hn5gMgPRNEcSPhj8rh3Q==
X-Received: by 2002:a05:6a00:1794:b0:71e:db72:3c87 with SMTP id d2e1a72fcca58-720b9d949eemr19292028b3a.20.1730667987502;
        Sun, 03 Nov 2024 13:06:27 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1efb45sm6144523b3a.85.2024.11.03.13.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 13:06:26 -0800 (PST)
Date: Mon, 4 Nov 2024 06:06:25 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, robh@kernel.org,
	vigneshr@ti.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	u-kumar1@ti.com, danishanwar@ti.com, srk@ti.com
Subject: Re: [PATCH] PCI: j721e: Add PCIe support for J722S SoC
Message-ID: <20241103210625.GM237624@rocinante>
References: <20240524092349.158443-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524092349.158443-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_130628_549850_3F542B69 
X-CRM114-Status: UNSURE (   7.72  )
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

> TI's J722S SoC has one instance of PCIe namely PCIe0 which is a Gen3
> single lane PCIe controller. Add support for the "ti,j722s-pcie-host"
> compatible specific to J722S SoC.

Applied to controller/j721e, thank you!

[01/01] PCI: j721e: Add PCIe support for J722S SoC
        https://git.kernel.org/pci/pci/c/08e835268c35

	Krzysztof

