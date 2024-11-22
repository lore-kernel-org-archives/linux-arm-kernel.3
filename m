Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7A7E69184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzq5xBGhrLm4GuYMaG3vOjkgbW2jTLhEik+B/AfpKr0=; b=Qp795I1WCQCY6kjTE2PCFpgWbm
	EDn7cn3f91azrJsLs4OB3eSxdBrFpTblwLZYwZUHlTZJxzrbkLU7NJzoZ42Q4pqoE21wRaoQQyt5g
	xY/Ey2fUFoAKDS2vNofbyaM5U8lyVDxmOFE89Y+jDSMSapgYZ47eZhZLE0RAOveiYlTzsk4kqb0rl
	qIbHgPMcl+dutrXT+ZWwhaZgE2UwCssEjnF9+oY42dHWwZfWYGZivzd9gpL59XIEwzAPd/yBWgDWK
	hNmD05g5B8Dotf33cMgH96pb5XEZoNbXpyCI4LBOI0tQNosTQpVLJsrsof9W0K9t63kORWgCIf5ov
	9dTtBZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWqE-00000002tMh-00Qf;
	Fri, 22 Nov 2024 16:49:10 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWoT-00000002t5t-1cDI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 16:47:22 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7246c8b89b4so2545081b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 08:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732294040; x=1732898840; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kzq5xBGhrLm4GuYMaG3vOjkgbW2jTLhEik+B/AfpKr0=;
        b=HKe1Gkkm+CBPi0EVJ6u1iVRo70tbxmhvb5MeWf2MWUFfxDzop0xqX2CvSWNkG7PMEI
         5K3AtaLH17SHl/dY9OPq+9YZ4sNcH5qxyuDUl0t2FVEPvU4A7kn5of2N0QzCbKFdmqMz
         o6cvMGNmkhWWNfRx6LSKozEpRWDc5GXZJm235tclX+epfKib+OnzIKN/mEqYVVsNQ6YD
         34QBW/SKz17/xwB89fQtbiixjr3OHB4WpXHj4Btlm764zK+XlZ40VpoUOrjPO3dyPgsA
         Inbp5i8DtUt1IcX41gAwlUAnYryBUUw6TxlCGakGlQZ1c7WctasFaoheAXdLL+dIF5Hz
         /55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732294040; x=1732898840;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzq5xBGhrLm4GuYMaG3vOjkgbW2jTLhEik+B/AfpKr0=;
        b=C+c8zxrY2aAlvU8g2kEZS+MI/AaLH1/wIZth5n33xqlyvgtxRTWU2UD0G+jfQ9QqAL
         kR6mLFUAL3IXCXOadOQk1CG+TwoP8DGcVmGOgKE6dFk+hhAhTrMFftjLrlj6QpS+o5DB
         PedHA4/DD75+9W2IUqm5/vAY12P0//tam78DtqUkN5M2L5c8W+I0lin/BA1TeffmqeJa
         YVeQEMhyD6YBIS26VS4Aj7VBeMVh07SmSWA0Eoxnjnz+oV8/uKlFIAf/BYxdsKYYPU0C
         gXcvJBL4XmC3A2J6HDBTesp5Ltn3hGeD2kjFwCc6z+8iinDZELR+SWX3sxTF8b5eAB6y
         0fkg==
X-Forwarded-Encrypted: i=1; AJvYcCWpJ+aZBe6IMuDa4Vm0ru1t2o768a8KRLbn0yeW10a1SmGKcpgb2DZYynqUVJx9Yt4mDw5VCGan6wixnp6EkTjk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx06F9VJPOyjpTFM38IhmFVups/mPROL57nxkTzTev8hoKJ5wK7
	SyqDjqCzD+ROV5rjAd2BnPPDJAy3oOMrM4VMK2cLoxBwn/48QEGi2go0xlmlpQ==
X-Gm-Gg: ASbGncujKZI6fnkWw3WRkafkDxYLMUR6SKZRVhkMIBySCf1BHoefAOHl3B8UXFKvut4
	X1y+jkNEEXHg4pHEEqBW+bjzb58mJ/uzCTWQMdHDqU9IEKpw3JS5fQkK6nB9oWEtgHnZYpQcqD8
	ROrZuZugVmCZOcDT1PQGt4L/LqGpxxp0bxoy8MV/Qm/4qpI12bmmvpPKlx/GzSyYimSL8BBcdfw
	TYR9409woQGl5WonX2QwM7MW5BKqi2NEsw7xXZq+DX9mUXPrUPbBs9xAkVl
X-Google-Smtp-Source: AGHT+IH2RH2HUiPHMzLk35ACiz5SeB6Uib1iKjXQGa54thdOMDLFrThNUfglBoU0p2O84vxcD04wlg==
X-Received: by 2002:a17:902:f70d:b0:212:35f5:b564 with SMTP id d9443c01a7336-2129fe2669emr56816865ad.7.1732294040271;
        Fri, 22 Nov 2024 08:47:20 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba357bsm18336365ad.88.2024.11.22.08.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:47:19 -0800 (PST)
Date: Fri, 22 Nov 2024 22:17:14 +0530
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
Subject: Re: [PATCH v6 08/10] PCI: imx6: Use dwc common suspend resume method
Message-ID: <20241122164714.aj4dzv32zixdj7pq@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-9-hongxing.zhu@nxp.com>
 <20241115070932.vt4cqshyjtks2hq4@thinkpad>
 <AS8PR04MB867625A97A43FE5352FC0E768C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB867625A97A43FE5352FC0E768C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_084721_420724_AD2CE966 
X-CRM114-Status: GOOD (  16.40  )
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

On Mon, Nov 18, 2024 at 03:00:44AM +0000, Hongxing Zhu wrote:

[...]

> > > -static void imx_pcie_pm_turnoff(struct imx_pcie *imx_pcie) -{
> > > -	struct device *dev = imx_pcie->pci->dev;
> > > -
> > > -	/* Some variants have a turnoff reset in DT */
> > > -	if (imx_pcie->turnoff_reset) {
> > > -		reset_control_assert(imx_pcie->turnoff_reset);
> > > -		reset_control_deassert(imx_pcie->turnoff_reset);
> > 
> > Where these are handled in imx_pcie_pme_turn_off()? If you removed them
> > intentionally for a reason, it should be mentioned in commit message.
> > 
> How about add the following descriptions into commit message?
> SRC interface is used to do the PME_TURN_OFF operations before. It's not very

What is SRC?

>  suitable. Now DWC common driver can do the PME_TURN_OFF kick off. Switch to
>  this common methods, and remove the useless turnoff_reset manipulate codes.
> 

Hmm, so 'turnoff_reset' is used to send PME_Turn_Off msg?

If so, then you need to say in such a way that the reader should understand
'turnoff_reset' was used to send PME_Turn_Off and since the DWC implementation
is used, it is not needed now.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

