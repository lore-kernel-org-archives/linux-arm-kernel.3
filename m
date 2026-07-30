Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C82C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eM/+djUdUKJLWwx0zayHVa8z9iYSo8gtg4+aGAkdTc=; b=0B870NqJeMDRBoesMg1f1UZTPZ
	5N0pNl20jooA1fMCDbyC9YWPypYVUn8kPIGyRiXkMRw8g44dFjSLcWggE96WawtR5GxbniCgmPkpx
	bicvF45h9djujL6XYIp46WY8+A7bhl4mFmHE6v1Ky6GpsMedKis5p49soJsB/cZ8NDJO/od+yAjRB
	r5G2uRyN3uRvjkRLOhWkswX91+tU1SUzY2ed8G0NfRmXlQvFe944SWTjHV9YnK6Q0vBC63O0E5tW8
	8xN4IVHMEl2Wgy8Fw/+uJSt8a9l5l7tKkLxlJ7z7giI7ORJ9xuUSRsQrjbMpI/msKVtyZOH589Z70
	hn5gRTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPek-0000000ARUM-3So4;
	Thu, 30 Jul 2026 12:14:34 +0000
Received: from mail-wr2-x00.google.com ([2a00:1450:4864:30::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpPei-0000000ARSo-2F5D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 12:14:34 +0000
Received: by mail-wr2-x00.google.com with SMTP id ffacd0b85a97d-472365266f5so786460f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 05:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785413670; x=1786018470; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7eM/+djUdUKJLWwx0zayHVa8z9iYSo8gtg4+aGAkdTc=;
        b=G21tmINIX6KbtsAeSyQZMujtis/u/hrCb3FTeiGCLP85rF+Bo6n7EyJULsrBzGEa3i
         QmnEWvhTkGTGaSoRKtYQm7x9V9oIghKdQI1rO7y6ajTK6lIuhvtJ4cxDhWC4XJXmZKiF
         e7I8uu+tZVwb+ovTMnJmuQ3DesNXWnFJPnZS8CTLcefR1eoMs4ML1tgli4GfIZQx/Ea0
         0XhUr6xxKhtuaW+aIDaHgEwJJ/bEckl3JjvsG6GVG5ZDPFIJ2I+zTx1QRN/mQV0Yooh2
         /lbqrVzdW65Fy2ItSMAGp7hFqtifuQS963td50de8UHyL2F0lSO1igcrf/UEWaPdHnq6
         tEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785413670; x=1786018470;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7eM/+djUdUKJLWwx0zayHVa8z9iYSo8gtg4+aGAkdTc=;
        b=JKtxHPfgjbiKQN5wlb9P6Zm0lEh0ZFz/IkUtYP27f+veSozTef/tuBcMN/vV8q0qcf
         2PyJneTJ/0EjpqiaLARbXb2a5PGSCydDmmBpmZWAzGnUNi0mKEBfR0xTEnmxOfEDpkxG
         uSNQholBKAxqaMIgPIh/IDFsNUp4TZivtPgNQIzK3lzpqRiEurL3zy/qiE/MV3oC9+nH
         gnV9reeE1s58Tgzt3gsCCEE8Jyd+UeSXXukb+4VX9b/IShRABnOT74YtUcALYByqw1er
         fJHWGIPcSLG30wpY+nXwLkv/CFynEsReWgenclAZKIYaVef4qu6VRAi6neIprTs/RGIV
         En8w==
X-Forwarded-Encrypted: i=1; AHgh+RrUzjyw2ioxcVbnfyL0nOk7u0HMOAEoAemRcR5GziG9ROJ1B+3ONO2ePGCanMG4+UhJ+HbVx9bnSBGmA4Ot8L6M@lists.infradead.org
X-Gm-Message-State: AOJu0YxpZ3w4lqqSFMihkjAHOqDk1Ya3nM3XvVMAMdH6HQGDhu5sDJnD
	l+b1f9hiJTkIHmnp2QBOu50aUdRsewPsnJvYJHouQvKSFUxvgQ7ulAJHjwd7xycqcg==
X-Gm-Gg: AR+sD12HmSyVcnG5Fzn8ziK3qEPYBomKRVLUhIjXWlm7GARbQhmPpSK/aq63J9fKrds
	eAQa9k5ymQlMMunYZkl81nbnwthYYyYXd2dWr8oEHLjTX6TPYtF4ESEMFPt3YF/DsacJ5dPkyj7
	3AhNbcB7alKWuyJnFFYm+IUJ2V3/VAd4euTk6yHe62pQuWf/qN/9KvJYvPrRZfi1AEov482pD4V
	UXj3ztqe9LX7ntC7PCU29/p/Nz2IgUJl8NItpJq/7gqxo3casbBz1DmR42gH2EAr873HVQvihh9
	+XntmxFjPQDY+DVd+cpKwmBfRlHI/hhmUbG6L095I1GGbvGQeEvbk8nzp9Sp6uGu1IOeeJN+UFT
	uD7gTmVBWTQK/Jk56jQ1L+p89qCQ13BsiZhI/i+yXAVXf3XDdCAjRi2RQC5cxXqcOjyd91XOIFx
	IPVHTboUFXbxs/LE8AEKurKlxNeC1L9ABJzfCkpLjOee2E+eARXNUhJLNuZNcH9IigkA==
X-Received: by 2002:a5d:59c3:0:b0:47f:9283:1fb3 with SMTP id ffacd0b85a97d-47fc806e48amr3531249f8f.0.1785413669775;
        Thu, 30 Jul 2026 05:14:29 -0700 (PDT)
Received: from localhost ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cc54sm5743980f8f.21.2026.07.30.05.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 05:14:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 14:14:27 +0200
Message-Id: <DKBWBNP7VLCF.3FND2WKPV4NWU@9elements.com>
Cc: "Lucas Stach" <l.stach@pengutronix.de>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: imx6: enable ASPM L1 only iff CLKREQ# is supported
From: "Michal Gorlas" <michal.gorlas@9elements.com>
To: "Manivannan Sadhasivam" <mani@kernel.org>, "Richard Zhu"
 <hongxing.zhu@nxp.com>, "Frank Li" <Frank.Li@nxp.com>, "Michal Gorlas"
 <michal.gorlas@9elements.com>
X-Mailer: aerc 0.21.0
References: <20260719-l1-conditional-imx-v1-1-a55a57915c68@9elements.com>
 <t2zu6bv4dqf5znpn5uypkoieltlrzlp4kskt6jwp46xgqajhjp@6g5kiwwn72a4>
In-Reply-To: <t2zu6bv4dqf5znpn5uypkoieltlrzlp4kskt6jwp46xgqajhjp@6g5kiwwn72a4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_051432_701569_55C14901 
X-CRM114-Status: GOOD (  23.39  )
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

On Wed Jul 29, 2026 at 7:01 PM CEST, Manivannan Sadhasivam wrote:
> On Sun, Jul 19, 2026 at 02:47:54AM +0200, Michal Gorlas wrote:
>> Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
>> states for devicetree platforms"), ASPM states are force enabled
>> on all devicetree platforms. This causes PCI devices on some iMX SoCs
>> (for e.g. iMX 8M Plus Kontron SMARC eval carrier) to enter L1 even
>> though CLKREQ# is not supported (and consequently supports-clkreq is
>> not set in pcie controller node of their DT), which causes the device to
>> never wake up from L1.
>>=20
>> Hence, disable L1 capability in the LINKCAP register if supports-clkreq
>> is not set in the DT explicitly.
>>=20
>> Note, the logic here is very similar to 613f3255a35a, only difference
>> is that leaving L0s enabled does not cause issues (at least
>> I never encountered them myself when testing on the device) as its
>> not dependent on CLKREQ# being physically there.
>> Since there is already a way of specifying its presence in the DT,
>> the driver should be aware and disable L1.
>>=20
>> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for d=
evicetree platforms")
>> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
>> ---
>>  drivers/pci/controller/dwc/pci-imx6.c | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>=20
>> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/control=
ler/dwc/pci-imx6.c
>> index 98e1db751132..7471501fbf04 100644
>> --- a/drivers/pci/controller/dwc/pci-imx6.c
>> +++ b/drivers/pci/controller/dwc/pci-imx6.c
>> @@ -1318,6 +1318,22 @@ static void imx_pcie_assert_perst(struct imx_pcie=
 *imx_pcie, bool assert)
>>  	}
>>  }
>> =20
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
>> =20
>>  	imx_setup_phy_mpll(imx_pcie);
>> =20
>> +	if (!imx_pcie->supports_clkreq)
>> +		imx_pcie_disable_l1(pci);
>
> Sashiko raised a valid issue here:
> https://patchwork.kernel.org/project/linux-pci/patch/20260719-l1-conditio=
nal-imx-v1-1-a55a57915c68@9elements.com/#27076171
>
> IMX_PCIE_FLAG_BROKEN_SUSPEND is only set for i.MX6Q, but none of its DTs =
have
> 'supports-clkreq' property. So this patch will impact them also and since=
 they
> do not reinitialize the hardware fully in resume(), ASPM settings will re=
set to
> hardware default.

Right, for i.MX6Q, imx_pcie_disable_l1() could be called unconditionally
in imx_pcie_resume_noirq() after the imx_check_flag(imx_pcie, IMX_PCIE_FLAG=
_BROKEN_SUSPEND)
block, something like:

@@ -1767,6 +1767,7 @@ static int imx_pcie_resume_noirq(struct device *dev)
                        return ret;
                imx_pcie_deassert_core_reset(imx_pcie);
                imx_pcie_assert_perst(imx_pcie, false);
+               imx_pcie_disable_l1(imx_pcie->pci);

                /*
                 * Using PCIE_TEST_PD seems to disable MSI and powers down =
the

Though I do not have imx6q hw to test this, so it would be nice if NXP
folks could give it a test.

Best,
Michal

