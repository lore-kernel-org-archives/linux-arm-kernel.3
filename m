Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40524C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 01:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IxnCSmHJcqdacHXHVn26Xp3ngLM6GH49N7wfCQU1L0=; b=Xq4IdQ6USyzYw6/odjlgwZRlr7
	PpLX+rn1dPPTh1tvZ23/4hcZGbMK0xZki1mQq4pchMkOG9PDBfAwQqUkLAPAFZyWnLPLSIASu3/7O
	BWms/EpE1Z5OWZ1X75D847tfr9/wq2dlZjf1O3Md8oc9cG/f+FgijoTXKdwB0dOSODTvHlm1bFAHz
	LJgG1KaywayA/k79qD9yH+Mh8Xi+gferNk4nPkJepocdSHoveDZ0DGwUqAz2pqRJnPAFbyTJNYO+1
	AQEkJwjmHJCsdJas2bHfExF3o5YBzU+jxZ9ElL2Vc8rEEOnDIAvFMf/HTqy+blH4QkciQKQESCBqU
	bqQWbdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYExW-0000000DZaY-0RzX;
	Thu, 16 Jan 2025 01:46:10 +0000
Received: from mail-pl1-f179.google.com ([209.85.214.179])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYEwH-0000000DZSD-1xgZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 01:44:54 +0000
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166651f752so7559555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 17:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736991892; x=1737596692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IxnCSmHJcqdacHXHVn26Xp3ngLM6GH49N7wfCQU1L0=;
        b=a5SZuHNHtcZZgF2MOS808MOMdfVioVulasA0hNtQ9fWHiuIYGJ9W/qo/+fu+8O8Art
         dYQLkn9af979VW1C/BW2ULQC5qaKXtRQ3EMv/eKDATz/D0r1dtFOD5lINkCQmvpcMujU
         cqRoTPI/bAKpMOzy+lfH/zV6Jiru7vDG+1ol1W3iSFLzehOaWD+ZCzjUZqVvABxzDblv
         UE7YZZDacTRzFFpcsPMQdGTUk8aZrViM+2ErJ14nWWt814/GLy6X7nKTjNuLul1sQW7l
         SDR6JfkcSIJsVpSy5YQaE9JYIS3rpLW+dVRHEejKYSg7aQGap35X10fib56dOea/ZBhp
         1gBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2/SBUdDZ4yoFDxBXUQkCLJAw/n+3upv76k04qYQMA2cJ/e7ezYiG8ME30s4Bf9XDd6MZunXtKS1DjcNHK7lRr@lists.infradead.org
X-Gm-Message-State: AOJu0YxHwkiYYnRslBcLE/4CyGUGPWoQa9cJkjTySJSSpwJ3RaEiQh8Y
	Z3iPfdhpuNTysj1c1THs3OTpBeNRNC/9G4NPvklBrvFUCR/Q1uIC
X-Gm-Gg: ASbGncuR2ag2R3WgYefLEHMFuZ8WxEk3fSKGI2fWvCY2jMvdjufvU6TAu6DZwA+ZlXt
	cuST6ZmTouBDe3xEY3eaISbXqko2mw5IqoTBsF13GY82kATApcjyPnjlDZeaFu1aqSUEl8293oq
	U6pN8Q6fse+gFCKarxEr9qR0XCPFM8E1kJBE0VQVuO55vZLNlceVRapDeNnvS8e747YcH07ftWs
	0esSSp7B5uYNpWKC7Avj3ko0oio0LPhf5lL1Wk6sqC4h8gix5U/7AnHyWHqSqxeDSqFLZ7FbILp
	Hl8pyluTwL/x8Ds=
X-Google-Smtp-Source: AGHT+IGGiOe+Hpc0pTCxovPJPJMYD6+JInJoiYZN0S/mOekGvxlc2y5Gy3dg47SbKjnI78xknytLhA==
X-Received: by 2002:a05:6a21:328c:b0:1d9:c78f:4207 with SMTP id adf61e73a8af0-1e88d18b316mr46931346637.11.1736991892554;
        Wed, 15 Jan 2025 17:44:52 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a3130d2eea3sm10500937a12.0.2025.01.15.17.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 17:44:51 -0800 (PST)
Date: Thu, 16 Jan 2025 10:44:49 +0900
From: Krzysztof =?utf-8?B?V2lsY3p577+977+9c2tp?= <kw@linux.com>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"robh@kernel.org" <robh@kernel.org>,
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
Subject: Re: [PATCH v7 0/10] A bunch of changes to refine i.MX PCIe driver
Message-ID: <20250116014449.GA2111792@rocinante>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
 <20250115130406.GS4176564@rocinante>
 <20250115130609.GT4176564@rocinante>
 <AS8PR04MB8676BD2E443B72DFECAEFEE18C1A2@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8676BD2E443B72DFECAEFEE18C1A2@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_174453_506119_55916B18 
X-CRM114-Status: UNSURE (   9.80  )
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

[...]
> Thanks for your kindly help to pick up this series.

No problem.  Thank you for persevering.

I apologise for letting this fall through the cracks.

> I checked the patches, they are fine to me.

Thank you for double-checking things for me.  Much appreciated.

> BTW, I saw the dts patch had been queued into pcie/next too.
> It's better let Shawn merge the dts changes after the driver patches are merged.

No worries.  I will drop the patch.

	Krzysztof

