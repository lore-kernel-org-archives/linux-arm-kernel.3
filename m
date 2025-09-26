Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D96CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 13:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E63HIm6hfUIUCF/NebOyqvn6g+tEqkfrm8u2QMJ5tw8=; b=TVP1WJ2nRfN1BwkgL/QfLnu9uh
	i2nxBy3CEH/wsOKoGiNUQF3/SYtoXMWYPmmANhBg5WfDMEqqEBCx5WQLC8i2UI8qWuieon1PVceXX
	89SBtkqLllC4HZ0orOUMGb1zsRyNmMVSdQLxHRLK+3JzV931qpmegkKS8XSNQb8GWGeJi8L0B72aV
	m/tAe1Vlh9KkG5c6moQrqIuF7MigmQFr68qKCE8kKRYIkOIONdDSRbmVZHgi4uxC+EiKCfziACKWk
	xoKeMvZKcHNnl7iTxoe4KC5cJhHGGfoUAbAjkYjgrJ7TGm/t9Op5NzQeFiaU1nVJDSTedx4ZKVW3h
	sdGlebnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28fc-00000001dKz-3wnI;
	Fri, 26 Sep 2025 13:39:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v28fa-00000001dJ4-2qSU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 13:39:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q9jjFS024045
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 13:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E63HIm6hfUIUCF/NebOyqvn6g+tEqkfrm8u2QMJ5tw8=; b=izncMGYNdUqo8E3w
	gQZxTs52PektAYwyZSafWsuPESdlDkPK79sbajX8hDHMXorHmH8P9o2HR/1JLQdt
	OpZW+6yye80afqDWs3iqyNoIkqtWPXvbBVX9S/gz6TOPExAM26rAnehCi8+ij/6a
	sueHn0d6nN9i76ndyP9gxQ5IuZbpjfjStLS5a4SAtgzA6G85JfQGvC340XrkHuZN
	EoPyY3RHd44NdBFvJTyblFemUHcRVwdGyCIvhgp2o1W/p0uM55anRT95fpOlt7/Q
	qxZMGKiAyDNoXBfglP4uWeELZgzvUQsTcvKWbVn3cTo6GyMFTnAuLtMonQp5M3Ai
	xsnmDw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49drfwgmtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 13:39:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7810e5a22f3so2314837b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 06:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758893968; x=1759498768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E63HIm6hfUIUCF/NebOyqvn6g+tEqkfrm8u2QMJ5tw8=;
        b=r/eS+1zEOUe63ljbwuxXo/rMWdu/al4bg17ujvClezt8p62yekwnssIXYlyZFZzev7
         D3HCPaMisnOBNr+DHtuViVvomiCveCF8YwOrQqa1/p2w9Aun83u3XN8q/GQjPTsah1Ny
         59BzFjK1OvVB36ykSk92401erh8zKNX3oFCMvrZLSQXe8ChG0guGAMMDpO+/ANYj0bm8
         eUb8iTfueWJ3pELDbCUfvT/BjzjbmiOxW9vCCbrnqPzACkzUqi8XCh2t9xBCaeNsUs+v
         5y0dTIoAeLG6+PRJYamrmjs8y8/TpPcuCtc3uL+MU0tIusIdd1Ia52+YIlQJIBPM6+zA
         LjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWW3oRK6gSmHNYiUbkAE+jg+vRGV4622W9cKoAC4Y5vDEzlww43OV45N/QzahFE1+t3jHIa8f99Ku5unF0yxIB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3fj+1YMUZHef3t3lYBwweL4A8YZgr4aOSVuNv4RhSgP7x2V/l
	z4x+NSXnZODMoNEay0q1Z1rY5nVpA25Qq9eCnlNLfd16/4w1wt8NZlqdQ6RcHAyFFv+HBk9Glhw
	pNFaNdKx4Ey1KxZyZtZ1Q+O5vgQTlgZspXv1xqg4/aka5RGfxWyZ7Yt1H1etzd7yZdCK9Za9LZk
	Go6A==
X-Gm-Gg: ASbGncvGhkDNGFrflpuehNXRwGcBrHoc7hqfsw+0s+ISK9CxFgnALi2MQL64UdKm2CB
	K1ii07DDKsFGpcNK67NweF60wYA42DmATehW3r0aIrpKKsCA6sqxielLAEO1DbVpIJ4k6W0ZwBe
	zevk4gmX1qSHlFteFJTJG0x5r01jfw+6EZFfRi525HWRVNFX/vv8Rg+pJpxY190u7xp/8Z22h0O
	YMVMsXelEUyXHl4b0kjRPvf5bYIsYaVbBNVLfu/fPwWyL2ijSF52xoClrwDGihM3wx7IgD2fbk4
	DHKe6GuG8J0h1NRcOQ9Ll6moVlWHdoFhTdmDsVLoVn3JYZZXh+CTQa5ncYkSor9Dqbs3RdvQ9Mo
	=
X-Received: by 2002:a05:6a00:23cc:b0:780:f6db:b1bd with SMTP id d2e1a72fcca58-780fcdd28d1mr8678969b3a.4.1758893967778;
        Fri, 26 Sep 2025 06:39:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiaP1HxRLVUpY8VZEiq5l3q06EZMQQVXQhWmy8UEaYDj2MmG+Nz3UAs4qURBGWNpupm3mF0Q==
X-Received: by 2002:a05:6a00:23cc:b0:780:f6db:b1bd with SMTP id d2e1a72fcca58-780fcdd28d1mr8678917b3a.4.1758893967264;
        Fri, 26 Sep 2025 06:39:27 -0700 (PDT)
Received: from [192.168.29.113] ([49.43.224.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c048fasm4502469b3a.75.2025.09.26.06.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 06:39:26 -0700 (PDT)
Message-ID: <4a3f9494-27a2-47d6-bdef-0b1bcbd99903@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 19:09:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] PCI: dwc: Implement .start_link(), .stop_link()
 hooks
To: Bjorn Helgaas <helgaas@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250925172517.GA2169496@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250925172517.GA2169496@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NaeFF-BBMYJQffqrdA4Uthbhhn2ojxf2
X-Authority-Analysis: v=2.4 cv=JKA2csKb c=1 sm=1 tr=0 ts=68d69790 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=w+9hNF1SH6wH5mqaHp+xkw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AYVm423qkfQxZcs1cpAA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: NaeFF-BBMYJQffqrdA4Uthbhhn2ojxf2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA4OSBTYWx0ZWRfX43MAH+OdNVkW
 uZN/WWRiKG8Q0EesumOyBWV97yTCYOfMri+Nw8pbHpnvXsgft00grTwzMf1S8h1Zqrgyo3hoHp/
 GXyYQwhXlpBqwohDJYP2EbP270A+C4ICwK3/WOrSNydZf9e5oXk02PSS6fvqmryR6zudyhWLeix
 38VZ/bca41IhWdFa5jXFpivBImWqcGi5kX0z5b81b1YxdXuUvXi2t5nZI28uAZ4lyMm/hm0ngBd
 eILL4sM9yVgwA1ja9esKob9CdR4hrGspuekNwCEKf4C50lxDdIFu8N4OiMo2JL+s8/2XS3cWkN7
 v0d1IUNq4RdZDDyUcyu5kUtscWEv3DVQCTK6vX/8X8aNaR69ACm2zDh1cqi8apl4wyi3ipK4imy
 TNsQCnBUsFFdWMMGL4qEIWykOWoRAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509260089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_063930_731370_CC4A9108 
X-CRM114-Status: GOOD (  29.62  )
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



On 9/25/2025 10:55 PM, Bjorn Helgaas wrote:
> On Thu, Sep 25, 2025 at 09:49:16PM +0530, Manivannan Sadhasivam wrote:
>> On Thu, Sep 25, 2025 at 09:54:16AM -0500, Bjorn Helgaas wrote:
>>> On Thu, Aug 28, 2025 at 05:39:02PM +0530, Krishna Chaitanya Chundru wrote:
>>>> Implement stop_link() and  start_link() function op for dwc drivers.
>>>>
>>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>>> ---
>>>>   drivers/pci/controller/dwc/pcie-designware-host.c | 18 ++++++++++++++++++
>>>>   1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>>>> index 952f8594b501254d2b2de5d5e056e16d2aa8d4b7..bcdc4a0e4b4747f2d62e1b67bc1aeda16e35acdd 100644
>>>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>>>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>>>> @@ -722,10 +722,28 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
>>>>   }
>>>>   EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
>>>>   
>>>> +static int dw_pcie_op_start_link(struct pci_bus *bus)
>>>> +{
>>>> +	struct dw_pcie_rp *pp = bus->sysdata;
>>>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>>> +
>>>> +	return dw_pcie_host_start_link(pci);
>>>
>>> This takes a pci_bus *, which could be any PCI bus, but this only
>>> works for root buses because it affects the link from a Root Port.
>>>
>>> I know the TC9563 is directly below the Root Port in the current
>>> topology, but it seems like the ability to configure a Switch with
>>> I2C or similar is potentially of general interest, even if the
>>> switch is deeper in the hierarchy.
>>>
>>> Is there a generic way to inhibit link training, e.g., with the
>>> Link Disable bit in the Link Control register?  If so, this could
>>> potentially be done in a way that would work for any vendor and
>>> for any Downstream Port, including Root Ports and Switch
>>> Downstream Ports.
>>
>> FWIW, the link should not be stopped for a single device, since it
>> could affect other devices in the bus. Imagine if this switch is
>> connected to one of the downstream port of another switch. Then
>> stopping and starting the link will affect other devices connected
>> to the upstream switch as well.
> 
> Link Disable would affect all devices downstream of the bridge where
> it is set, same as dw_pcie_op_stop_link().
> 
>> This driver is doing it right now just because, there is no other
>> way to control the switch state machine. Ideally, we would want the
>> PERST# to be in asserted stage to keep the device from starting the
>> state machine, then program the registers over I2C and deassert
>> PERST#. This will work across all of the host controller drivers (if
>> they support pwrctrl framework).
> 
> I don't think there's a way to implement .start_link() and
> .stop_link() for ACPI unless it's by using Link Disable, which is why
> I asked about this.  If Link Disable *does* work, it would be a very
> generic way to do this because it's part of the PCIe base spec.
>
Hi Bjorn,

We did test as you suggested but unfortunately the setting are not
getting reflected we need to explicitly assert perst to make sure
pcie is in reset state while applying these settings.

- Krishna Chaitanya.

> Bjorn
> 

