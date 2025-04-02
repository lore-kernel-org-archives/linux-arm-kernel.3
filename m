Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C07C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1VmkVlpRc4WSi9FaO0aW2j/f9rNxZ3VMxxdj/njEz0=; b=GkzcLtjkEy/oCXThG6jmvL48cy
	Uo9mFt5gRPPppdT56HIYgNDw+cJaBcZwj8EOH7AvMiCz0l/gvbf+CEWU/Gd2SKjw9s7XwO2VJuQzb
	hTZ24tyAmNmvR/H11EzilyVzA0+wVhDR08G5CfwMRlMqQkaf6Wlflg9V48n2lQEy0pewQwv2ztw9d
	cgQYtJNWvj/0/TKrlh5YZg5dwfUrI6JU6biHGjGSTvoI+3wpJuRS0PNK44RoQlP80gXN6LqQxeCj3
	I+GjqSyDXMbh2uqny7I1oFjShOYQx1uuCEz4LiNwzvE7qWJ7wRobi19Xm3p+agnGKqHna0sxeTjx5
	5Gjdb6Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzu2-00000006VAI-1g7Q;
	Wed, 02 Apr 2025 15:21:18 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzqW-00000006URh-2cRy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 15:17:42 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-301cda78d48so11910325a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607060; x=1744211860; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A1VmkVlpRc4WSi9FaO0aW2j/f9rNxZ3VMxxdj/njEz0=;
        b=WOg0SxETOxwCp7GI1f8QfZFrnMsrX4zHufJ/RonQBdPqCt1Z5sETnt8tPgVrqpZqah
         uFeALebka1fsybDy/5by0xd7j8e42X7DJjw5k8bzUrhufzRTSeFRM4jCcDm30eMmw19f
         kMlLXApwZyxNvEiELv4en2IIi7QR/zKX6CSX17qQQysPY6OgGibcWbKvgh/UqQwbGsUK
         2qzkMwHIvb0hUsQYt5mVnPvQdhwN0swi5PokoUg45fH0zhjMSwYZq6+thDut12odGj53
         xify1cjmkPw0Vh4MvdIH9P4/32/DocZEZvZ90OaszSpwad7bzBd5gWg6VI6jonZX3Vsk
         WXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607060; x=1744211860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1VmkVlpRc4WSi9FaO0aW2j/f9rNxZ3VMxxdj/njEz0=;
        b=rxPFn7rQ/Cfhkla03SnfCceN1XXysbm2Zok6hYo77w5FDiIlDKe9SyZm1kLLvF4fuD
         y6Spr0dYLS2pHJ4sxHG2DsFIvGxcNoNky7nEfOawpCY4Av//oySZPqK2W6WXsNSnJ/A4
         CaggOU4V73fkJAtFvwU5gf6+EwdMTFJzlv2FQuRQbdpkqp1L23EjE7GPYkOxzN0Q5EJx
         ZRuGp1a6QmBzo+O9o2qQ5ySbQwMUzNjhanfVRQmGhHst3+KNaMzKx5rpY5SKIRysKl0n
         KLzOdqGUBWEXO5nC6rePiU2XW2xqCKqK5wKmRTfxyM1YTovG4tZnPP8tMFLcGiwjYp8e
         vDZg==
X-Forwarded-Encrypted: i=1; AJvYcCUpole499W4Bfhzqa5jkCeZTKSd5lYfJsVAlYtd95QYYcM/c751nIyhXYNvRZEb9MxFrCal2fNJ5iufV7jjcuwb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2vZp7t4yP/LLuIGu4skCetNhcl3ENw0+66jyiedTt5CTR6YO4
	LC1k/i9N1vDagRNbii0LbTtzfhFv96Gf3Dur5wS09qHiCWbqssOEmnYth1O66A==
X-Gm-Gg: ASbGncsr26msax+TiFG/nlyaxBn/QYSQ2WVVJNAlGHBGZVMJlB0IiwO2QNBXcus7tlo
	tOppVUzfDrkPCGX2wJQxnD3YzqjI4gVqAeltRVCBzP6ewGHt+CzvCAbVsjdGNx1iFXrKpOe1WeJ
	J7wrYiTiDGmDvwbdqDZzQ5bUP8vikoMwS9T/wnzn+nlVtFhOTcZZr0XX9Y6gosD2HKGVBSyaqb4
	cGzUsX4VePTBizXMkDIP4qmhIwvx7CeNxXJmbJNUThhgZ/BIto90Zv4Zne6oTgDVL0wyeVOJjWh
	Qra4g3TnPRmexy1ukQGfmC3IR0D0ftmA/fKqY5qiF645rJm3DKCtVnK6
X-Google-Smtp-Source: AGHT+IG16MivObzWU33JTwzx5znIxU6+vnQt0ROoOp8Kq1NbarWsZJpr2IHBGg06IH61ZT+KYFb1+A==
X-Received: by 2002:a17:90a:e7c7:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-305320b166emr18279561a91.21.1743607059436;
        Wed, 02 Apr 2025 08:17:39 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedf9b4sm109376755ad.84.2025.04.02.08.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:17:38 -0700 (PDT)
Date: Wed, 2 Apr 2025 20:47:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit
 L23 ready
Message-ID: <rqgl5jjauppyudgmugp34fillkeli3qkwf4uf2djghi6nslebg@pyi6rbwyduxd>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-4-hongxing.zhu@nxp.com>
 <ovaomfvo7b3uxoss3tzhrkgdy6cvxi4kr2zxmqsfjxds5qfohl@t6kc4rswq6gp>
 <AS8PR04MB8676687332C78840B927E7568CAF2@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8676687332C78840B927E7568CAF2@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_081740_661074_3B9288E4 
X-CRM114-Status: GOOD (  21.12  )
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

On Wed, Apr 02, 2025 at 07:59:26AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2025年4月2日 15:08
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; bhelgaas@google.com;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 3/6] PCI: imx6: Workaround i.MX95 PCIe may not exit L23
> > ready
> > 
> > On Fri, Mar 28, 2025 at 11:02:10AM +0800, Richard Zhu wrote:
> > > ERR051624: The Controller Without Vaux Cannot Exit L23 Ready Through
> > > Beacon or PERST# De-assertion
> > 
> > Is it possible to share the link to the erratum?
> > 
> Sorry, the erratum document isn't ready to be published yet.
> > >
> > > When the auxiliary power is not available, the controller cannot exit
> > > from
> > > L23 Ready with beacon or PERST# de-assertion when main power is not
> > > removed.
> > >
> > 
> > I don't understand how the presence of Vaux affects the controller. Same goes
> > for PERST# deassertion. How does that relate to Vaux? Is this erratum for a
> > specific endpoint behavior?
> IMHO I don't know the exact details of the power supplies in this IP design.
> Refer to my guess , maybe the beacon detect or wake-up logic in designs is
>  relied on the status of SYS_AUX_PWR_DET signals in this case.

Can you please try to get more details? I couldn't understand the errata.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

