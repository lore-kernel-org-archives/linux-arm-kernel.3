Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB95E69185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 17:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9Rzu/atJszaZiZQ8bphSysVEtM05e/rUjckRGXXQa8=; b=U1/++jaayegJaxrYi/tbUjHqng
	eEL4TE+GaSMaj4/65ea3A6pKR/5XhFjDL4jVtlWcUWhUTvp+V03Y91/Tmr7/NawpWDlDwHGfoVLHw
	GIq8xVm8MJhXBPeqiYtpVWlXMeMYRBYYYDBAN24cmbR97KeoCKI1yHPwN0+GaFNj86VnRrLOteZN5
	k+19PA7F9h7Kd7Au88Q93NAAWCTYzNw8HuB1qfMKvDdeW50nDGRMfrU6gmzP7gDlQf0PByyQbww8D
	1ofqv1VrIpGdiQrpN0RHTzGquFfu6qGVLAXStpkm2RCbDz5sIHr0Q3Pt32r+Jt+qt/nfpwRkAspPF
	sAudnUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEXCY-00000002wJH-1ADM;
	Fri, 22 Nov 2024 17:12:14 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEXBC-00000002w7i-3pCP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 17:10:52 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-7f4325168c8so1560213a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 09:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732295450; x=1732900250; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m9Rzu/atJszaZiZQ8bphSysVEtM05e/rUjckRGXXQa8=;
        b=OIeN3h5BfvG810t8Meh+51NMLM2xgQRRIoNFt0ITSZrSCbTbZujW4byPnpEvxI4H8c
         EZg96hYdpParbS+ZfJkY+75QbBpi5+42rye4GIl+ZUjLQtyOX1fhyDpItXy7ofBewtEt
         z7dUqOaO+FjwMrclpwpymtFvhX9MYdRu1sXdHQjGXYvx3GDLiXK/ACUkn7c1v1+15QDn
         5nKfealyReFy3BCNVozNk3aHbvh4ID8LUuyPVdssgzdba9rOHHTt+TP9EPzD/Jfmz8jA
         BLBcW5ynHb3OI3hlSTLBQT9LAP74ZMe04yVTbAoLtsTLEz3zmvPEESqorXvn0aSrcCbP
         4K8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732295450; x=1732900250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m9Rzu/atJszaZiZQ8bphSysVEtM05e/rUjckRGXXQa8=;
        b=o+5rcIzTzHh/1lWuNaGIO9cZBfq0gxDHXwWYBYJnVommdogB+BwnDrWC7aonyFtDTL
         redJ9x6lhLQIS0hJnhHWz7kB6NEkqaqqJXBwXO8IVCVnbKr/akWq2fGb+ICa+ekubdsw
         k/eUp584JRfAv4vCXQKylzisUb7q3FvbNUnAERniW2mHXKVRlDilNkbYYw7HIMTZoCXV
         nIDnLsnHwnEmZ4knPzZIbF8RAXIYsnhkVfZxfqETHpTiZpfFd9bvsuWgMqwHVuAEc9Pc
         wV6mSKzMiLnv2B9avfU2+GU9EiEY9xfIFv1sjovuFZA+qtMT+LuRHA8mBTAEC97R43z+
         RJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAT4sw/3iwLfAdPV6z8tZ/92+qxK014fE9+D9RROUl0/dgzlbEEAAjjerf9uuAiZf6czobfeOWictDKGvwqeD3@lists.infradead.org
X-Gm-Message-State: AOJu0YwarGQwFURzye1yQeiC4sB9igTNeHkUy/dYni84OoPKNwPvkDJU
	OYmloXvAf8kppNkqpp2O0rqgjUeWtjZYTIze3fRfj0IJvjomfS4TEWInvR3Aug==
X-Gm-Gg: ASbGncv5ekxuezbgw4cRf8QblDelpkyp1o+d6+YxUonLDt5dC/RpLXUUB2eQuWSoWUe
	3uJVpgQ5U1z9kfnQGuNdQMfK/XDMSQ7/WxwmTVaoowyqAyGNsyBm7sQGlV+mwdZS9iWP1ssG/IF
	WcyfLXhFKpyjFhdIHEoyMs2f3ejBSieucxnL1pCHWeVBnyP++yPJxNxMoIQJQJ0BvuV7vaB/77g
	VJwr3KF/caI07V9Gc86CMiSwC6ACy8Ic3resae2zYzHCDlP6/3uZk4cn+gP
X-Google-Smtp-Source: AGHT+IFIhc1R40hXLVSot1qpNb47cXTxZcrRwISXx0lJGKYTEDxVxH0DwKBYDolmma7+CJxTTAgLkQ==
X-Received: by 2002:a05:6a20:d503:b0:1c6:fb66:cfe with SMTP id adf61e73a8af0-1e09e45ff0emr4838841637.21.1732295449974;
        Fri, 22 Nov 2024 09:10:49 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de57a562sm1847026b3a.195.2024.11.22.09.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 09:10:49 -0800 (PST)
Date: Fri, 22 Nov 2024 22:40:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 04/10] PCI: imx6: Correct controller_id generation
 logic for i.MX7D
Message-ID: <20241122171043.j2xh4fvdo6goq7o2@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-5-hongxing.zhu@nxp.com>
 <20241115064321.3cuqng7bzmphiomw@thinkpad>
 <AS8PR04MB8676989276C723C26DADFB5D8C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676989276C723C26DADFB5D8C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_091050_948833_77842481 
X-CRM114-Status: GOOD (  15.96  )
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

On Mon, Nov 18, 2024 at 02:59:48AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2024年11月15日 14:43
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: l.stach@pengutronix.de; bhelgaas@google.com; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; Frank Li <frank.li@nxp.com>;
> > s.hauer@pengutronix.de; festevam@gmail.com; imx@lists.linux.dev;
> > kernel@pengutronix.de; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v6 04/10] PCI: imx6: Correct controller_id generation
> > logic for i.MX7D
> > 
> > On Fri, Nov 01, 2024 at 03:06:04PM +0800, Richard Zhu wrote:
> > > i.MX7D only has one PCIe controller, so controller_id should always be 0.
> > > The previous code is incorrect although yielding the correct result.
> > > Fix by removing IMX7D from the switch case branch.
> > >
> > 
> > Worth adding a fixes tag?
> > 
> It's originated from commit 2d8ed461dbc9 ("PCI: imx6: Add support for i.MX8MQ")
> 
> How about to add one Fixes tag like this?
> Fixes: commit 2d8ed461dbc9 ("PCI: imx6: Add support for i.MX8MQ")
> 

Okay.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

