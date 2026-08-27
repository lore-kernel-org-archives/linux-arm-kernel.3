Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A2EC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvanX6LwER3+dYc3eyM0edZztrpqWdRZ2jTMJJO+V0U=; b=D7iPBaQDEC5MM5JFaOc/5INNX0
	Gwx1IqAxJvr5BCyhajTiBUx2TwpeFFWKq/fUqF1JceYS90MERI1EboGvniXxouLr+qPD7cfHJay/U
	x3+SnCUdXqHKGpAQAJxBqDOSFn4+a38RjLlFJo+UPpfOf++VN71+/o1F7uToWmOBOWiEBg3Be5Y4C
	9O+hCQ60ArjatxnnOKDmdbKzzsbcKno49sStQDpKAACHLz44DD6i9KMNJUDRZmATFnmu/l0opAj3y
	DVBCjyrY5JegUuPYWHy8kfbc0Q5uocmF3CDVqKUxbqEBsBt5foBtmZliL65jdksOlb39LsvUfpa1C
	vToCLz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeqi-00000004ch1-34rU;
	Thu, 27 Aug 2026 18:29:16 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeqf-00000004cgM-2psp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 18:29:15 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c2055573c8cso21148866b.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 11:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787855351; x=1788460151; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uvanX6LwER3+dYc3eyM0edZztrpqWdRZ2jTMJJO+V0U=;
        b=YWLuw5K0GC+2gOtWXxL/FpjM/0e5RLQXu2wF0hRXuQh8L/azI0TsAmt8u3/EwmDbim
         dsF28MNt36+nYcLyfzxpVFcdk4e/1l3bx17YVONpabJMTEPhCWrjenT3BO6YNqFyVllE
         6ghKUampnIIEcr0nLGZ9V0HCS1Mu+WQzJzv/J9AD2a+sdFLlVsnC3E2tflgwu6gESQOu
         jmnkcgrb5R36MQ9hoaWZJypzYOWt6zwgyqK7eB0gRL/8IueLltOm14ex3BpLb5oh/YqJ
         bbu0/kqpfW3SsWbvpBkJ8eJ16DNJzc1Eg9U71pFDonkgLribs2SPBwtvlYBbY69NsV9q
         iOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787855351; x=1788460151;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvanX6LwER3+dYc3eyM0edZztrpqWdRZ2jTMJJO+V0U=;
        b=OJDa1SrwCAkf3QlR4VX6AKNdYxY8I77TjP94ffj0p9zKOnVvR+jr+KafyjH4JzyvFs
         49Uob1cMmmgcI/bK9oSokLPMik+doEg/3wNIyat+mrmS0Gi1fTvfF7b/9XCvMYLkpH7A
         kwD8qqbWB8hOU9cSfdr+rw+xPOcSVzz0UwN0AwPuXzOgBuRmbfvKBBT7zZhEyJvWBSka
         Qg6vhjAxBXPOJ+cD4ssxo3e+g5UvYKZtH7geWKqs01mt4Z06DQBjhVpw3LjxEPDRZH6j
         HRp7413SA4MnsFOUA+MitYlEoZvoUhD3aXfAmbf6dwxErjgZBPiD8rc0oJg9Yp6I4FUv
         GoEQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZtqlRcfuNsmZZcnRgRyzq82r48iFQtYlaNGAToOKxe3mYitrgHLy4NGT1d936mZY2z+L5ronwHwXKuVoaBVcL@lists.infradead.org
X-Gm-Message-State: AFuF++n155A/9Zf04ZAWkQB4Upx9/I5lt/Y7psAb6zE0qYRq9UZFP+8N
	R/wr49iV/ybivFmahEWAq1QqgXV+K9FwU9WPnFujg6urFNjFiBIRmdgZHLoLqK7BtQ==
X-Gm-Gg: AR+sD11IeHFvzdEgZa1NoGVyX7SvcQUwbTmj+OUNnUoV6pGCl6wh+FFd8khg29ZnqLf
	hY21Adxb4KonwMas/V5ykXJZbHLZUNwiaGree9+bQ/hGMWD1XzXe2a/x4TTj4yybHsgqSddQf2I
	GHuID8PW3mcgrNimZybfD5wRrq8nHPAtQ6lWnLf1g0UfbGsR26jx0m7YZEJ1EoSRT+vV3pfAx8I
	XyytHf//mUR3l3DJOl2aGL7x9gaREb6YVEWj4BzPfT3LVDI11KPHhHmo0uP/Z580TGJcOFkUuqa
	GKIIDr66rf2V2lnb0CJO1WOEjcueY7VSPnuGTIs7qNjBsXxzSic3XLZ1I9Xbza9RexIGUIUsfqM
	cVjGjeuvlk4lJDxkrpF60qOHjUML2v2MRufM+LyNyOUw4DxgvoM5je7upgO0bkDSvs1kT2pTz79
	GhAla9Xosy13wMUsPRRWOgTq4xOKYMhIv7w2F0PJ5KWTdSKKEWnPswcS/O6eUwDoEZUSYp
X-Received: by 2002:a17:907:c19:b0:c12:9b93:61fd with SMTP id a640c23a62f3a-c2556c2bea8mr46389166b.6.1787855351489;
        Thu, 27 Aug 2026 11:29:11 -0700 (PDT)
Received: from localhost ([185.213.155.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68desm1116779366b.10.2026.08.27.11.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 11:29:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 20:29:09 +0200
Message-Id: <DKZXTSZPJMY8.XM7YYCVPT3EP@9elements.com>
Subject: Re: [PATCH RESEND v2] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is
 supported
From: "Michal Gorlas" <michal.gorlas@9elements.com>
To: "Frank Li" <Frank.li@oss.nxp.com>
Cc: "Richard Zhu" <hongxing.zhu@nxp.com>, "Lucas Stach"
 <l.stach@pengutronix.de>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260827-l1-conditional-imx-v2-1-40b324aa2a94@9elements.com>
 <apBvfYOnCHfl7Zu9@lizhi-Precision-Tower-5810>
In-Reply-To: <apBvfYOnCHfl7Zu9@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_112914_131658_373F5855 
X-CRM114-Status: GOOD (  23.75  )
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

On Thu Aug 27, 2026 at 7:10 PM CEST, Frank Li wrote:
> On Thu, Aug 27, 2026 at 06:51:00PM +0200, Michal Gorlas wrote:
>> Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
>> states for devicetree platforms"), ASPM states are force enabled
>> on all devicetree platforms. This causes PCI devices on some i.MX SoCs
>> (for e.g. i.MX 8M Plus Kontron SMARC eval carrier) to enter L1 even
>> though CLKREQ# is not supported (and consequently supports-clkreq is
>> not set in pcie controller node of their DT), which causes the device to
>> never wake up from L1.
>>
>> Hence, disable L1 capability in the LNKCAP register if supports-clkreq
>> is not set in the DT explicitly. For devices that set
>> IMX_PCIE_FLAG_BROKEN_SUSPEND, disable L1 on resume as well, as these
>> skip imx_pcie_host_init().
>>
>> Note, the logic here is very similar to 613f3255a35a, only difference
>> is that leaving L0s enabled does not cause issues (at least
>> I never encountered them myself when testing on the device) as its
>> not dependent on CLKREQ# being physically there.
>> Since there is already a way of specifying its presence in the DT,
>> the driver should be aware and disable L1.
>>
>> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for d=
evicetree platforms")
>> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
>> Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
>> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
>> ---
>> Changes in v2:
>> - disable L1 unconditionally on resume for platforms advertising
>> IMX_PCIE_FLAG_BROKEN_SUSPEND (Sashiko)
>> - typos in the commit message
>> - Link to v1: https://patch.msgid.link/20260719-l1-conditional-imx-v1-1-=
a55a57915c68@9elements.com
>> ---
>>  drivers/pci/controller/dwc/pci-imx6.c | 20 ++++++++++++++++++++
>>  1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/control=
ler/dwc/pci-imx6.c
>> index 98e1db751132..1fdcbcd2422e 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1318,6 +1318,22 @@ static void imx_pcie_assert_perst(struct imx_pcie=
 *imx_pcie, bool assert)
>>  	}
>>  }
>>
>> +static void imx_pcie_disable_l1(struct dw_pcie *pci)
>> +{
>> +	u32 val;
>> +	u8 offset;
>> +
>> +	offset =3D dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>> +
>> +	dw_pcie_dbi_ro_wr_en(pci);
>> +
>> +	val =3D dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
>> +	val &=3D ~PCI_EXP_LNKCAP_ASPM_L1;
>> +	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
>> +
>> +	dw_pcie_dbi_ro_wr_dis(pci);
>> +}
>> +
>>  static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>>  {
>>  	struct dw_pcie *pci =3D to_dw_pcie_from_pp(pp);
>> @@ -1442,6 +1458,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *p=
p)
>>
>>  	imx_setup_phy_mpll(imx_pcie);
>>
>> +	if (!imx_pcie->supports_clkreq)
>> +		imx_pcie_disable_l1(pci);
>> +
>>  	return 0;
>>
>>  err_phy_off:
>> @@ -1748,6 +1767,7 @@ static int imx_pcie_resume_noirq(struct device *de=
v)
>>  			return ret;
>>  		imx_pcie_deassert_core_reset(imx_pcie);
>>  		imx_pcie_assert_perst(imx_pcie, false);
>> +		imx_pcie_disable_l1(imx_pcie->pci);
>
> Does l1 disable permanent after resume? should it be
>
> 	if (!imx_pcie->supports_clkreq)
> 		mx_pcie_disable_l1(imx_pcie->pci);

It would be unnecessary, the imx_pcie_disable_l1() there is already
guarded by IMX_PCIE_FLAG_BROKEN_SUSPEND, so we know that only iMX6Q
ends up there on resume. And none of iMX6Q DT's sets supports-clkreq.

Best,
Michal
>
> Frank
>
>>
>>  		/*
>>  		 * Using PCIE_TEST_PD seems to disable MSI and powers down the
>>
>> ---
>> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
>> change-id: 20260713-l1-conditional-imx-c2bfd20ae085
>>
>> Best regards,
>> --
>> Michal Gorlas <michal.gorlas@9elements.com>
>>


