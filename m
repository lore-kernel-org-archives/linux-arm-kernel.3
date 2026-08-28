Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF771C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMfz7Vhc8U0TsC57RZ2pmSfybZVbiyDGTC2Y9/EyfeQ=; b=JM6aQnbqGH4WWsNg29S9VRPvWb
	NcbU6n2oU9WPqou5xJJqk0YHsR6dPcbys77LTIwCiEUTR9V+15JjMmwTGDHqC8ikLLE0/fb8OB/XQ
	XkCooj6VZsvUjpp9NSF19uTgXpauOwc3eqrbwn05ay7wMKi2ekOwRbL5alF/TiSzOuBFYMDjaju/N
	lkvbt0tLh8WMVI7c5nKIHaSpuQWskM89uwa4MgKt/oWgZ++9hN+Xh5dg2RojpIueccqBtjLjhsWFo
	2vkCj4JrVqZALYTSSYVdb7eEMfGuOjiBU7jHkPVBvoglvPCMvC30XbHFyHWnb67UiksW0QqdaXPRU
	vT3Vtq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxuG-000000061DX-1WUL;
	Fri, 28 Aug 2026 14:50:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzxuD-000000061CR-4BvT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 14:50:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDl5u12647881
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 14:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMfz7Vhc8U0TsC57RZ2pmSfybZVbiyDGTC2Y9/EyfeQ=; b=dnExEQ/tkR3FHbuq
	C2YHv9pwKXa5wkI0RGBfLdmjTG7PffoW9MPOAlMpDvx/OkD0LqTDT6tIMnRcPd3y
	XmsN0OV1ML92ZCGkNvH9VB2ZunDL9+rnQWtx8jJNztfHN0wINeOm7iCBUPOkcz7z
	+PSO6d/pwvYp7vSRni5VRqAVJmF1lL25bu7oK2G5wC1eDhwpa/dzegkWvgc4a2e/
	ddYmqKrI6WZCazeJDUq6ssxzv3nqSTGFJSaQU6NmNLAcaYrJrseun4PmVCD112vd
	Tksj/4RUsVn67ZuQ6vK89u8rqQEHOioUdN0KOLGCKOqGfrf9P/mYMbNCtcz+BY2A
	3t7rKw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h01ggt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 14:50:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1846767a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787928608; x=1788533408; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMfz7Vhc8U0TsC57RZ2pmSfybZVbiyDGTC2Y9/EyfeQ=;
        b=Esj7iEp2J7s9bCInHJvQjr5hlAUjajYFt1zTmAemrdJDxWoTBJP61/5EWxixqW98I+
         JjpQ8H5Ag//9dQw6aN89YveIWzpu5hCox7HfZGDxZ4gd8fqeLwkc4VDnXqNUIzmVNCw1
         PLhlJQajzaFr9y8NunHBzm3i0UqGYT7eD0azG6UL0Nv1qP7XWRvDMBBmg1zlkUvL+fcv
         FRJMV5jyBNispFCr4Nnusff+uyNjpQRkdC1ICjJw4TZTESCmuHrRQ8tDn7845tgnuw5U
         QCotQN+4UypifPkNPjLowH22jnZh11ctUEuraqsZtz1kuywvblrfLxliJeRvy/TwFLl+
         U4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787928608; x=1788533408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMfz7Vhc8U0TsC57RZ2pmSfybZVbiyDGTC2Y9/EyfeQ=;
        b=ZFyruFxvKTaGehhyUxJXECShePxlBfVWeQ49zcdNlchRO+Td9ShI2iK8dVqmP9NawV
         egJKT6I0GBkS1drvggd5v3C8OkA+IVdStAsWhFNZJAl5fM6sBiXJ0++2rZziUxTgceu8
         NgAnemfCU/cBzlKUAX5wbkAUto3OkxI3tr9ii2AdroTjKKxpaeWWHi1H58uABLiSPRcw
         Ooa8SqpyFMoh+FxM2KMz2F8VeyIAcPhtpvAvN/RMjs9FHBiw38RIAeRhkYGgoLVX2XiU
         iUvW1ztx2w16wZghQ5QkO6VVDRuBDAzlvMWEydlwBL8xQy7I6kI60GrUW2qGqCnlUZpv
         rKjA==
X-Forwarded-Encrypted: i=1; AHgh+RqD7uB+OErmbPnOC4PejRsoYB3QhZYcIlS1N/XIszKls6WvaruB1bF6FC8GrSa0J/tfNp3OOPF+snK+FaQEWKMt@lists.infradead.org
X-Gm-Message-State: AFuF++kkU69p4+O+oh+yFkkDX6PdurNGX/PGG0uE+rR8il2UEFjzygs8
	hMQ0WD8XHjcH5tdQFkdF8esIZFbXH658HNbllrsRANv8UOQ8bg0jH60p7l9IAWbWFKGUfwTc5LB
	NvKy4eLzfiVS2SK0hvAXJsUp7w/iff8toxw8Ck/OY4jrdg4qbrrlYHz1Y/PzRVMoQelXgcn8KbD
	93XQ==
X-Gm-Gg: AR+sD13m47Vilpv1GZFNPGpfX96cMTIcnQcRBmwILjg9Jw335I0b7DBNqIci1PSkCjY
	+Rpa+h+Fz9zlSRTlBTwaZyCzzHxK4U1yc0DAuz8wuVobRUOuHSJilTwMW8O9q1G/yM2Ah4Hl9Cf
	aieNQBaof3SJ9iY7PvN+oMuzKR1ec7Z1gcSblXz+eU97LOLID107VzKiIv+43iq7YzIIIiZ3u/y
	svb+9S+6nRnGAGcIVbtdvD19K1rh+VD4tA94BP8Ivj9my5ff/h73CnqCUNMd3erNyo4+2fM7K3+
	FoQQT7K4A+832Zrf+5VR5BKHfiTVA6Rk8ICbKLEO2pdGLnXPndSfF0GbVq/BT14WEndvt409vls
	gXbRsG0ZrzAjMFzVLzTr4LNQssngzWZoYjg==
X-Received: by 2002:a17:90b:4d88:b0:398:9bd3:d6d4 with SMTP id 98e67ed59e1d1-3989bd3d8c8mr344649a91.14.1787928607873;
        Fri, 28 Aug 2026 07:50:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4d88:b0:398:9bd3:d6d4 with SMTP id 98e67ed59e1d1-3989bd3d8c8mr344578a91.14.1787928607246;
        Fri, 28 Aug 2026 07:50:07 -0700 (PDT)
Received: from [192.168.29.63] ([49.43.230.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d6925e92sm1131305a91.2.2026.08.28.07.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 07:50:06 -0700 (PDT)
Message-ID: <aabc3dbd-3e5b-4272-807f-f0743606e25a@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 20:20:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is
 supported
To: Michal Gorlas <michal.gorlas@9elements.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260828-l1-conditional-imx-v3-1-6fbba62164d9@9elements.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260828-l1-conditional-imx-v3-1-6fbba62164d9@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: j1U8JvvyDpNY20GthcfUmCzQWittnTJl
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyOCBTYWx0ZWRfX63d88+pNsUuN
 vLa5iBPxTb9J1baNcklE8a4r3OzLe/RDLRsFgLqf2xgrY7PynOAWIUcZ4pxLqDy6j/EXy4eoOc8
 Oo2bLvYefZOlWvArwdhEzJLXOMmD+6o=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a91a020 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=LZewZZGB/thYnPi3wayTIg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=YG64nluAAAAA:20 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=PzGKxP3WAAAA:8
 a=8AirrxEcAAAA:8 a=kMM-w56GI0ZO-asq7NAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22 a=zCCnohV0i-_k6euCn0hJ:22
 a=ST-jHhOKWsTCqRlWije3:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: j1U8JvvyDpNY20GthcfUmCzQWittnTJl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyOCBTYWx0ZWRfXwt5H3ZMW/jEa
 Y3MgWnloAAdC9NwCx0Om4ULY/SBu5YWcWmw2dM3JqHeDuYAJ+rAac3sG/1isPdEBhBKMTToj/ta
 HXQweFcjW0vju6A8ybKikNo/vn+RDUs8OuNEEROmC+4cDWNX5MmoJrsImH4sYl0/cDY83i9yz8w
 +wQlMHoKeKB9pUinLUImLIc9gpQMPvZzxyPNM8q7pDnutYPjMLl8QFMIMjiMq/EChULX6+YsmQX
 gRTBQ87S430VG+7/LwbL7Kxrj46q1+UtZhfRh5WYd8K713uRLU1YyLisYSLRks8Cky6dWaMqtcI
 3C4ptpJW6OL5p3Njw4ZuK/9XbQA1ao0WJ7VZNpS0w8+eXAyBLjBUfYe9amt4/5rK10pM2HzXe5P
 4jCaJ+AUBSktzQSDRSPhXIZLtDjNek22PYAtNSc8WA6sTpDavTi0XWDqGu2ASMSQ9KfMLPBYc31
 hacI3mD0F3NxqPiXeXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_075010_108612_C1CA18DB 
X-CRM114-Status: GOOD (  31.74  )
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



On 8/28/2026 6:40 PM, Michal Gorlas wrote:
> Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
> states for devicetree platforms"), ASPM states are force enabled
> on all devicetree platforms. This causes PCI devices on some i.MX SoCs
> (for e.g. i.MX 8M Plus Kontron SMARC eval carrier) to enter L1 even
> though CLKREQ# is not supported (and consequently supports-clkreq is
> not set in pcie controller node of their DT), which causes the device to
> never wake up from L1.
CLKREQ pin will not play any role  in entry and exit L1, it will be used only for
L1 sub states entry and exit.

If you want to disable L1, try to add aspm-no-l1 property in root port[1].
Recently aspm driver change was merged which will disable L1 if that property
is present[2]

[1]: dt-schema/dtschema/schemas/pci/pci-bus-common.yaml at main ·
devicetree-org/dt-schema
<https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-bus-common.yaml#L167>
[2]: Re: [PATCH v6 0/3] PCI/ASPM: Mask ASPM states based on Devicetree
properties - Bjorn Helgaas
<https://lore.kernel.org/all/20260812023735.GA846004@bhelgaas/>

- Krishna Chaitanya.
>
> Hence, disable L1 capability in the LNKCAP register if supports-clkreq
> is not set in the DT explicitly. For devices that set
> IMX_PCIE_FLAG_BROKEN_SUSPEND, disable L1 on resume as well, as these
> skip imx_pcie_host_init().
>
> Note, the logic here is very similar to 613f3255a35a, only difference
> is that leaving L0s enabled does not cause issues (at least
> I never encountered them myself when testing on the device) as its
> not dependent on CLKREQ# being physically there.
> Since there is already a way of specifying its presence in the DT,
> the driver should be aware and disable L1.
>
> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
> Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v3:
> - pick up the reviewed-by tag
> - Link to v2: https://patch.msgid.link/20260827-l1-conditional-imx-v2-1-40b324aa2a94@9elements.com
>
> Changes in v2:
> - disable L1 unconditionally on resume for platforms advertising
> IMX_PCIE_FLAG_BROKEN_SUSPEND (Sashiko)
> - typos in the commit message
> - Link to v1: https://patch.msgid.link/20260719-l1-conditional-imx-v1-1-a55a57915c68@9elements.com
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 98e1db751132..1fdcbcd2422e 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1318,6 +1318,22 @@ static void imx_pcie_assert_perst(struct imx_pcie *imx_pcie, bool assert)
>  	}
>  }
>  
> +static void imx_pcie_disable_l1(struct dw_pcie *pci)
> +{
> +	u32 val;
> +	u8 offset;
> +
> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> +	val &= ~PCI_EXP_LNKCAP_ASPM_L1;
> +	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
> +
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}
> +
>  static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -1442,6 +1458,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  	imx_setup_phy_mpll(imx_pcie);
>  
> +	if (!imx_pcie->supports_clkreq)
> +		imx_pcie_disable_l1(pci);
> +
>  	return 0;
>  
>  err_phy_off:
> @@ -1748,6 +1767,7 @@ static int imx_pcie_resume_noirq(struct device *dev)
>  			return ret;
>  		imx_pcie_deassert_core_reset(imx_pcie);
>  		imx_pcie_assert_perst(imx_pcie, false);
> +		imx_pcie_disable_l1(imx_pcie->pci);
>  
>  		/*
>  		 * Using PCIE_TEST_PD seems to disable MSI and powers down the
>
> ---
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> change-id: 20260713-l1-conditional-imx-c2bfd20ae085
>
> Best regards,
> --  
> Michal Gorlas <michal.gorlas@9elements.com>
>
>


