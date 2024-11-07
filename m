Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9F4D5AE71
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f87EsgUx9jRfU6fOaKBBba12po3/P9HypMoaCZO0Ifc=; b=qX5dYgtExJDJT5lAbRnee7qePE
	HhexADqPLhUSsiZtDoHPzdfR9WsXvnVB1mi0eQ6zLGeoMK93Np6Lk1lpkmeePTp9Z9VOqcpI8Ym1v
	8LWpOLNkd9RBLmF+p9H7NDFgcksQahEnTZ0UnB256JFso7R+zBpJKjib6Rb+nQYvnXjtik7kBrMI4
	JiCsChPeaYdeEr2eRMixbGk1QOzSFErnm/oKU1+DZe4YHyZmbiB1NHjS/VBRig3A5cr4k31StJNTA
	yc1xzyBy9s7nmbUtKDMrLfmp9BxGfUlFM527isQlsUOM9KyQEfTooVG3/kKDsP70zsencFR0geMAN
	mlnsMA4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yA1-00000006Axn-29Kv;
	Thu, 07 Nov 2024 08:46:37 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8woL-00000005y3T-3VH7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 07:20:11 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20cb47387ceso6650335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 23:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730964008; x=1731568808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f87EsgUx9jRfU6fOaKBBba12po3/P9HypMoaCZO0Ifc=;
        b=MGu9fydscAuCDWG6RsB3UrnIQMl9BYH1/p5z5erSqWVBhgjWEOJOdqAIDSNKMmldWo
         vNHhavSC2BOjQ0+9abDS7qm0koeyPJ+fIKvLxR4m/92z5/DR087TZICM+3H36KU8l/uq
         GQrnQw/qt3hcj3j7oY6/SXQKSTBnXZoAiSu+VtAdiPCRySGmxpT/yARKbipHE/4gz5nJ
         Pd+TEuejCMysqUkPD6MP4la0UHhE1XxSV4X1Dv4Dg0ZcX6TkhYGqIc3E+GK8fPOtuebf
         RVCeCGvzxVDTgDs63xs2LbMc2dkL6klU/pQmsiTM80HmpR9SRKN1yJc8bUE6ha9p0Ydt
         QsBw==
X-Forwarded-Encrypted: i=1; AJvYcCVtBMS5am/JGIhXXjC4fGpU9ghGDwnRw3u6DXkKJuu1TU06MS1xVGJ5oEg+qSbAqZKQqR9RMS/rJIaMiT8LCplL@lists.infradead.org
X-Gm-Message-State: AOJu0YypG+xa513J+s8rzkXql684o49F2NKIPzyYGBnq5/U59p/4Lm5l
	tIjQp+lSltsG2GYxVzccLR0DJ7u9xw50n/kXRvmeQZJg+Y6nRa4A
X-Google-Smtp-Source: AGHT+IGgjRJm1tBjzyx6VNtbd57u2h7PQMgL45gBSJk4BeJmz+8g81AStqWX2H8l0t6FV1sYafgWiQ==
X-Received: by 2002:a17:902:f547:b0:20d:2848:2bee with SMTP id d9443c01a7336-210c6892da8mr604716545ad.16.1730964008443;
        Wed, 06 Nov 2024 23:20:08 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58e5bsm5833335ad.195.2024.11.06.23.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:20:07 -0800 (PST)
Date: Thu, 7 Nov 2024 16:20:05 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
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
Message-ID: <20241107072005.GA378841@rocinante>
References: <AS8PR04MB8676998092241543AEABFAAB8C532@AS8PR04MB8676.eurprd04.prod.outlook.com>
 <20241106222933.GA1543549@bhelgaas>
 <AS8PR04MB8676C98C4001DDC4851035B18C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8676C98C4001DDC4851035B18C5C2@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_232009_903189_F713E97F 
X-CRM114-Status: GOOD (  20.57  )
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

> > But I don't think you responded to the race question.  What happens here?
> > 
> >   if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
> >     --> link goes down here <--
> >     pci->pp.ops->pme_turn_off(&pci->pp);
> > 
> > You decide the LTSSM is active and the link is up.  Then the link goes down.
> > Then you send PME_Turn_off.  Now what?
> > 
> > If it's safe to try to send PME_Turn_off regardless of whether the link is up or
> > down, there would be no need to test the LTSSM state.
> I made a local tests on i.MX95/i.MX8QM/i.MX8MP/i.MX8MM/i.MX8MQ, and
> confirm that it's safe to send PME_TURN_OFF although the link is down.
> You're right. It's no need to test LTSSM state here.
> So do the L2 poll listed above after PME_TURN_OFF is sent.
> 
> Since the 6.13 merge window is almost closed.
> How about I prepare another Fix patch to do the following items for incoming
> 6.14?
> - Before sending PME_TURN_OFF, don't test the LTSSM stat.
> - Remove the L2 stat poll, after sending PME_TURN_OFF.

If the changes aren't too involved, then I would rather fix it or drop the
not needed code now, before we sent the Pull Request.

So, feel free to sent a small patch against the current branch, or simply
let me know how do you wish the current code to be changed, so I can do it
against the current branch.

Thank you!

	Krzysztof

