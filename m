Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC10D4337D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3aIunwJJZwjkSc47JIdSCmw2c2ZlsEQ7RGvz1daEzI=; b=2/heoMWl47V+TWNZszo8YxYuju
	0jOw2HcsZD9YBX+mQUKAlHB5KLwR3FnX5P0JvlxbRZpMZjAIeHU7M6X2rvFUnTIpApMgHsuWg1cRJ
	zSVyeOzBUymeFuMu56PulkkQrKcITFaTMF/zN3E/WRd9ol6fQhQQeq+wUsY32p05tQStZglO+DhpN
	qRYeUGYKK9GrJv9WaPqF/gyWcCK/uKvgYYzuwJwu+Ip/RrIQs8rpQVSe7J3wBlyvfNkvxCJBxKx/F
	0v/4c/uaXuiTenqUsn403XjVcLDfKZCQFcuBe+36aGiqr7emO2AjkCa3takIuBCTmQMDFOavbXPAs
	O5BB3xUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95oK-00000007jPF-173D;
	Thu, 07 Nov 2024 16:56:44 +0000
Received: from mail-pl1-f169.google.com ([209.85.214.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95PR-00000007eXS-0Wc8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 16:31:02 +0000
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20cf6eea3c0so12867035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 08:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730997060; x=1731601860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i3aIunwJJZwjkSc47JIdSCmw2c2ZlsEQ7RGvz1daEzI=;
        b=fWBx5QW9UHnSTwxO5CjEw1tZB56WfDLEgE4NCj4veDYmEMZ3O+X05RnzuJssXmVq/y
         ZNTta5CYMd3HBCCV5r+R+rYY7iI3mTdai/uR2YYR/I/cHM5rbXbP95pjM0ffRnh97ZE2
         SpEiJ47/FAZ5flYlAi9Kuq41YjoMKk5fJLo5SB26IHJ7Hzjvzd+Tl7AhdyFgIe1G3K0b
         IRvEkrLyPMTWCxuO7Ya2B0uW+b4UsZl257Cz3d+Ko9BTSBb4hxCCu9IP/m++lRNV7VCs
         YXWoXJlGwh1TDUo+XFrMcYweT3BUztWbAjHWDeZAzZMXx9/AVuLfJSRo9zPjLEkerwrc
         lBxw==
X-Forwarded-Encrypted: i=1; AJvYcCXrMja95uJT8A1e5Q46FnEWh/B6gbALOCPTZ+XJjKslrP4xdZtOlPyTd/4+QXWK+sWhvCg8yeqbgNCabzSOeaXD@lists.infradead.org
X-Gm-Message-State: AOJu0YwyePlrOv1c0nrfrvXjWCzg8xKUvUzZf+up+YB3ZwbieTN7lBtg
	q+G1poeIjpWtyoS94H/WiiJBbAqkrKoErDmiiaI6gKQ/tAH5Em9P
X-Google-Smtp-Source: AGHT+IEGJto+1JijDqrubHaDC0FIg58jiL9pnEaSMfPJmuQ+AA54UQg+DzpAhfYNveKIfglNcXt2pw==
X-Received: by 2002:a17:903:2343:b0:20c:d18c:1704 with SMTP id d9443c01a7336-2118232bcfbmr352135ad.23.1730997059913;
        Thu, 07 Nov 2024 08:30:59 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dde241sm14228755ad.81.2024.11.07.08.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 08:30:59 -0800 (PST)
Date: Fri, 8 Nov 2024 01:30:58 +0900
From: Krzysztof =?utf-8?B?V2lsY3p577+977+9c2tp?= <kw@linux.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
	Frank Li <frank.li@nxp.com>, "mani@kernel.org" <mani@kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] PCI: dwc: Fix resume failure if no EP is connected at
 some platforms
Message-ID: <20241107163058.GD1297107@rocinante>
References: <AS8PR04MB8676998092241543AEABFAAB8C532@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <20241106222933.GA1543549@bhelgaas>
 <AS8PR04MB8676C98C4001DDC4851035B18C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <20241107072005.GA378841@rocinante>
 <AS8PR04MB8676F00E8F76B695772EB3B18C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <AS8PR04MB86765B904FEC1AA88F6F83468C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB86765B904FEC1AA88F6F83468C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_083101_193468_8F6B3968 
X-CRM114-Status: GOOD (  19.06  )
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
> > > If the changes aren't too involved, then I would rather fix it or drop
> > > the not needed code now, before we sent the Pull Request.
> > >
> > > So, feel free to sent a small patch against the current branch, or
> > > simply let me know how do you wish the current code to be changed, so
> > > I can do it against the current branch.
> > Thanks for your kindly reminder.
> > This clean up small patch is on the way.
> Here it is.
> https://lkml.org/lkml/2024/11/7/409

Thank you!

That said, there here have been some concerns raised following a review of
the new patch, see:

  - https://lore.kernel.org/linux-pci/20241107084455.3623576-1-hongxing.zhu@nxp.com

Hence, I wonder whether we should drop this patch and then focus on
refinements to the new version, and perhaps, once its ready, then we
will include it—this might have to be for the next release at this
point, sadly.

Thoughts?

	Krzysztof

