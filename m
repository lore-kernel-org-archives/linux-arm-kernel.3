Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0AEE69184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZwDSMvFnipM0RD36mLVFKH4L1T4MEAtnhkfsYAv+8A=; b=CbyxK3A7mpXb5w2xgHBekQoFuB
	15DxrGDtKtdKWMLxUTTXe56MfXS6XOSrJuPr5v+VF2N13ibRGh0NZUZPKdzkcFK5EIiXKRWWItATw
	HtQYzBVuhMXSlDyaX4eBO12syVG4xjRqm3YWWIC0efvT6niNvLO4jOXfXFTZa2n90scTjkCaykIxh
	nRx1mpB4XZ0FAJbA2ufs25XnudT5E9jlrBcXMxm2r5t/QW60NqTl4bdpDZOxp+OJQ2hfImdKIiG4G
	1bpmOohI0s37r3K5tEA+OCE9xKHwAAbFWApv4tG36qJ2INtVRKh5RmXBexS1UWpeld1mS8aKuBOwz
	AEFA1nVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWz5-00000002uUG-0bdj;
	Fri, 22 Nov 2024 16:58:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWy8-00000002uPj-0ywT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 16:57:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2120f9ec28eso18915495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 08:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732294639; x=1732899439; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FZwDSMvFnipM0RD36mLVFKH4L1T4MEAtnhkfsYAv+8A=;
        b=s1n+EEEg+EFC2OujieXJN2qhhqTXmeISbia1EJJf53ElPu3bGNXoB4uLYphkg3YaMD
         0GNb75mcFsjv5xq3qT2vTcc+Vv/kjwzNMCzrmjd8hZp2kyzfo8guJ9aN86W9OiPnLM+y
         mWq38mIJsoVp/rVS5vqvSNY7g9by5HVKdHXelFF7WfS7t17Vs0cuDb3ar9niGdMiSn1c
         b0WeSwHO5eVvgGu/J6G/7VsJkJDRqj/UJzoJqIDJfcUmh9KrIcLYRSOG7B6F3Gv1I/oi
         eFutY7ERQXMoGzFDzlNSatcpJcD4m//etScpRmdEbDJ27aQSTYnspugp3jIQ27f+moHN
         St1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732294639; x=1732899439;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZwDSMvFnipM0RD36mLVFKH4L1T4MEAtnhkfsYAv+8A=;
        b=ULL+mFifrsAMQfMzFTuss9ZJdarxIzQ7lT1h7ZZCIZBFntwVHR0exCY69KIBw2l06E
         aIr1y/IhECCkrThHLtPi+jYH+M59ek3p1QK8sNwTL6QKC2Rkh+sFQEUGecUfikA/aaTj
         veuCxxv5woTFPM612PE801s248rQwIt88MK+99XNLRfK4Q3YujMjFdXO0ddoMmCLjg9J
         fzOeSfPzYrOazynmf23IkrdmtbiqoAycUW0Ieyj3IrB3Xq/X2L52PkD+e3ypVsS1XgCt
         i4cK5qREOt29ivqKvV0rGUF0gWuiH5wUwSHVt6xjV3gtjy7Ktoxgo5uHEK6qLL8PYic8
         iXqw==
X-Forwarded-Encrypted: i=1; AJvYcCWmUCRsUJmY8lOtTjcLwmE3Ay8xvKAE8x4/XbuKIBvI+oqakalEQY3CVrdTYXO7J7JU86moduuyfkZdMrYUk5c5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/3kKh1244SjyZHXs+MuLZTHs420AfzqWEV/yhCD2MZewpLglJ
	ofrC+md1nPdJS1RlAzDscNgOYOKApPkE//Duq7iX18R3AUDwHG2N7IT3Ccn+9w==
X-Gm-Gg: ASbGnctltQKOibtPh0jmhyYixmEO/YuhllLB1uhMpXZiWtbq4XPQLbb8K/JO3lScnBD
	u0ZhSQr/BC5tOqVT4blMwWSrfdDOG1UMEpcXNp/JYa7G0D4JkMpRHPIN5ip0pky+j+1dY7Q9V1s
	iDpmXGX/Qvjdbi9bpJLiFzahu9zg0nWTo0mHSDSVuNpQynJNWrmVocts5yh6QU3IMq/25RNsDpL
	w/e/sEULGFhmfmudwTiQotd4zfB9ImRG1gITEppUdPLg3LT9N4E1cSPM/3S
X-Google-Smtp-Source: AGHT+IEBQTm+mdF5/l17srn1QQIlJ8cpbCtyU3PjuFrTHKPmmM8RGnmeO63H3UfI8TU8tQ6zNeMktQ==
X-Received: by 2002:a17:902:d2c3:b0:20c:6bff:fcb1 with SMTP id d9443c01a7336-2129fe0903emr55796195ad.1.1732294639012;
        Fri, 22 Nov 2024 08:57:19 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc21a1asm18338035ad.222.2024.11.22.08.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 08:57:18 -0800 (PST)
Date: Fri, 22 Nov 2024 22:27:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, l.stach@pengutronix.de,
	bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 08/10] PCI: imx6: Use dwc common suspend resume method
Message-ID: <20241122165712.5m7xuycxzjzatf35@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-9-hongxing.zhu@nxp.com>
 <20241115070932.vt4cqshyjtks2hq4@thinkpad>
 <ZzeHGd/vfNFgsID2@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzeHGd/vfNFgsID2@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_085720_278945_E51B1D15 
X-CRM114-Status: GOOD (  18.46  )
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

On Fri, Nov 15, 2024 at 12:38:33PM -0500, Frank Li wrote:
> On Fri, Nov 15, 2024 at 12:39:32PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Nov 01, 2024 at 03:06:08PM +0800, Richard Zhu wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > Call common dwc suspend/resume function. Use dwc common iATU method to
> > > send out PME_TURN_OFF message. In Old DWC implementations,
> > > PCIE_ATU_INHIBIT_PAYLOAD bit in iATU Ctrl2 register is reserved. So the
> > > generic DWC implementation of sending the PME_Turn_Off message using a
> > > dummy MMIO write cannot be used. Use previouse method to kick off
> > > PME_TURN_OFF MSG for these platforms.
> > >
> > > Replace the imx_pcie_stop_link() and imx_pcie_host_exit() by
> > > dw_pcie_suspend_noirq() in imx_pcie_suspend_noirq().
> > >
> > > Since dw_pcie_suspend_noirq() already does these, see below call stack:
> > > dw_pcie_suspend_noirq()
> > >   dw_pcie_stop_link();
> > >     imx_pcie_stop_link();
> > >   pci->pp.ops->deinit();
> > >     imx_pcie_host_exit();
> > >
> > > Replace the imx_pcie_host_init(), dw_pcie_setup_rc() and
> > > imx_pcie_start_link() by dw_pcie_resume_noirq() in
> > > imx_pcie_resume_noirq().
> > >
> > > Since dw_pcie_resume_noirq() already does these, see below call stack:
> > > dw_pcie_resume_noirq()
> > >   pci->pp.ops->init();
> > >     imx_pcie_host_init();
> > >   dw_pcie_setup_rc();
> > >   dw_pcie_start_link();
> > >     imx_pcie_start_link();
> > >
> >
> > Are these two changes (dw_pcie_suspend_noirq(), dw_pcie_resume_noirq()) related
> > to this patch? If not, these should be in a separate patch.
> 
> 
> Sorry, this patch have not touch dw_pcie_suspend_noirq() and
> dw_pcie_resume_noirq()'s implement, just call it. I have not understood
> what's your means.
> 

Sorry, I got confused. Please ignore above comment.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

