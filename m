Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B27ED116EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 02:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwkbFZLKD9aKeC3WKC6OPnPkUZ3sWv42q7KMB+JxdX8=; b=g5bPDRJxKrlA1FadMpPtYeFaBt
	SzdbWHhPMHz44B0syGsRmcFdmKwd/Qd447mNkUcZr3TsEb0LtZ/SNLcKp+f/MxVwTwAjaUKVl3mvs
	lRnmtQl32IkKWtdXlgIjK7qhrGhH7HF+a9Uu+5wXg9B5yPiNhGB4aPOYMETnSQhLW09bg3CeSCKx0
	jAd3yHJvOYtQ6pqnM9vJTb6iuhyk5XTTomy/J9Hkqkx26Funuzpi1zIQ7/lHM5pF34I/RrJLKFfSc
	a1508d9od6Vqd4pV+PSn6DVMvJb22I1T0lDgOh+F+PoujxA+uyLON990ICJfdNWEsPM2du1ig70u4
	YQFB/2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPAdm-00000001Ay6-0qDZ;
	Sat, 29 Nov 2025 02:24:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPAdi-00000001Axe-2di7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 02:24:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT1p0Fp1893633
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Nov 2025 02:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LwkbFZLKD9aKeC3WKC6OPnPkUZ3sWv42q7KMB+JxdX8=; b=ZALh4Pgcd8YVKgP+
	fN0REEvqQUhyynIAaVR7UNxqaYTXjuvxBkRg+zmy1wtOwMHLTannk9Qe/dEuYVjh
	NtotnQuuhIJybxaFmG4qKnYXSkH7vfsKuIHpWUpn62qx/ErVGb6FWhcYiQbwxAiY
	TiSzF9GoMw+fqvRH+OAzedJSvSMo/cTV4aEFaQPDy7rm+REIQS0uf5B5WKIwrmXa
	YMfaX5cQC6NRedarveoSEBgodtt1eOq9EF2roeELSgB5PTTVukVPGnUGXiravc54
	5CBpHgINJLw7PNM2SoGY57Uo3p40m9ParY0orVWnfZjyyBBWBNvAF+c7DIIVWqhh
	FvBtvw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqpttr3e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Nov 2025 02:24:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3416dc5754fso4155698a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 18:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764383083; x=1764987883; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LwkbFZLKD9aKeC3WKC6OPnPkUZ3sWv42q7KMB+JxdX8=;
        b=HHBe2l7kFU9IuBHJavw+5wQ17orxWc8B9Cv2Qjnk1txmfIShkvGvKAZDlnJYJnEtvT
         h7QoWPSnM/glDvxxSKNY4AMAFnSo3O9CQZQMjVGfvxfhH8MNpVNjuuDjjKV6ZD1YVUKT
         Km8DAD5UxN21ZZO7CLOloZ1tWWkbOMTfxBc8cLsjf6eCU0UZRq19VzpF8NAlV+GGY617
         sDsLiU03j4OXDkCt+UrTJ15xWuPPOdlJ+S2L0PR71JOUTUDF2Qt+LzBi/B2jyRQD35nB
         eHEspBu/IDKycG6bL95erIoExsd0s5yOoXfkRCotjF+pAfBx3iyKJY9hG3vZdVKCGDYS
         gPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764383083; x=1764987883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LwkbFZLKD9aKeC3WKC6OPnPkUZ3sWv42q7KMB+JxdX8=;
        b=WuO8pV0S9RIGJJu+2VjiscsEa9gavRAFQh5IR8cw1nhO2ZqvuxpYRf1v19eBoOHPH1
         sm+bB7ehUWdoK73r3sh271RbHZnq4n2cPF4eoqP73EDBxMiju8XXqrZlMAAQ6JEIST15
         D6eU6kGefx/+3sWMni/nfKd9A8naNAS8SZr0bn2m+pb3S5+aK28fLpFD1Ru7mtPMkIar
         bqzCI0P/Wu5r9CJDogqyUrkT3VV62V+lqXI9mxUPbnm0b7Mhb7v5e6Mfn2oauD60AYbA
         eZ0jOr1KGBjqFTTpormZXT1hXgRP31M8cstpIFMzp3Xs+lZ1PfxeLQwp7SuSvzb+8NBv
         GA7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhx2H8JJe5L+CvBbwcGyEhTarZE+3ctApB6fWfUTBjVyCnp9GcmwjBedVZwG9Ozk7xXetmTYXKi5yYuu8fnu8R@lists.infradead.org
X-Gm-Message-State: AOJu0YzZU5Jaa7bD4tds4TBLQFhx7/j7dL88s/N4uanKZrRs59Uwe3OK
	S96YWzfncK7BPf5iIJeeEYc/AUcMMHD422pT5NcVlQxJ3ATjmBePVBmFV4QYqUt5I4HmCcFXI0S
	6tpxw4pIMZFJQHgLX7EtbVYtZYMa8Rv7U3piGqOcPXMBkL7GTOZMZYDfnp+wkRnuqbKUFiyHfVZ
	6yqQ==
X-Gm-Gg: ASbGncs2862qfqFgDRGMsRnGfAT8mfBuOTnk+Xc3EqtGHqjJifE+07+2oxN7sZ9GeMa
	zN3hb7uTr9y9UX99gbam9Xk+2yuefTAiBVeleMyRgKr70+kHK/+Lm9Gl9MxG9LXjspHWT4xSX71
	v21AJoyZaWSCYcZMUnjnTRkbpDZxSnb+wiTrlwP4vQ6p422WHRgG2ovMBpj18ulyjzdhdGksU65
	t3B6nBifLAdeDaexaoQdreAr8epNVWxo+KG4ociFCl9jjDI6Egvl7NRS4nVK2GN9eYN3MNn6j2P
	9cElvXQvb5RJCPqjeljvRmberFGGTRr3olT1RYDswzoFmZxwxwZIvOgzFgo4UWBN1S4M7bNP0uf
	vyPDDyYn745df0yljVrcjfSA+k2ziWDwR1htUcEwMzBYJ
X-Received: by 2002:a17:90b:3f44:b0:336:b563:993a with SMTP id 98e67ed59e1d1-34733f241bamr28027489a91.23.1764383083401;
        Fri, 28 Nov 2025 18:24:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuS9uBDENp+8fKPMnRbGGtrFWsMhy+XKSLqbm+LJ7zW7xyYkOcTCKFSJdCUmmv6bSYkyVlxQ==
X-Received: by 2002:a17:90b:3f44:b0:336:b563:993a with SMTP id 98e67ed59e1d1-34733f241bamr28027455a91.23.1764383082897;
        Fri, 28 Nov 2025 18:24:42 -0800 (PST)
Received: from [192.168.29.63] ([49.43.225.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f080beasm6276026b3a.47.2025.11.28.18.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Nov 2025 18:24:42 -0800 (PST)
Message-ID: <a4c6d47f-28b5-40d3-bc82-10aeb14f8e78@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 07:54:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] PCI: dwc: Support ECAM mechanism by enabling iATU
 'CFG Shift Feature'
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jingoo Han
 <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Jonathan Chocron <jonnyc@amazon.com>, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250909-controller-dwc-ecam-v9-0-7d5b651840dd@kernel.org>
 <20250909-controller-dwc-ecam-v9-4-7d5b651840dd@kernel.org>
 <alpine.DEB.2.21.2511280256260.36486@angie.orcam.me.uk>
 <c7aea2b3-6984-40f5-8234-14d265dabefc@oss.qualcomm.com>
 <alpine.DEB.2.21.2511280755440.36486@angie.orcam.me.uk>
 <cabf4c20-095b-4579-adc1-146a566b19b9@oss.qualcomm.com>
 <alpine.DEB.2.21.2511281714030.36486@angie.orcam.me.uk>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <alpine.DEB.2.21.2511281714030.36486@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PdPpsFzfTofRJm0MIPGJr3lnvI40nO2b
X-Authority-Analysis: v=2.4 cv=evjSD4pX c=1 sm=1 tr=0 ts=692a596c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=5EZHiQk+3i9I38XJ8QjOGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=guimUsFpNTjNUuBwESwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAxNyBTYWx0ZWRfX2388selS6m7u
 OzAsVSv26cxii9p6tf0fbXviGY86akVICi0C78S3LM225SRep3brratSuYmBr6AzDHKvosvMuNX
 VeQnx+4zl2SY5JBz3Y4Wyvb0Z2da0pd9mDa1/4s3bmxftkoUc1V0Ls0l20580EhRyZiIvZNvIIF
 +q9rtccLj9xmfhk5Hh+lewkCr4HlBqCJyDBsxJ8aNCYpZYYICKrdmOMmSQk0DP5EwdSVZOItsQX
 x7sp6kqmL+PqhRFKhFfNPf12cjmYy4HniBCTREZZFdWXXRRgBCzF/izqFGHIzd7BOiR2epIWsds
 CFJXULa50uNih1COQhmcWp6Ovb9FPxC5HG2tayYQlkDuLqilj3YJm0sE/BlI1KFaZGC4czxxkHb
 KcsY3MjJOzf1czeu4fp0JmZHpZ2GMg==
X-Proofpoint-ORIG-GUID: PdPpsFzfTofRJm0MIPGJr3lnvI40nO2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_182446_823801_10BE86E6 
X-CRM114-Status: GOOD (  13.69  )
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



On 11/28/2025 10:46 PM, Maciej W. Rozycki wrote:
> On Fri, 28 Nov 2025, Krishna Chaitanya Chundru wrote:
>
>>>    I have no slightest idea why it should cause a regression such as this,
>>> it seems totally unrelated.  Yet it's 100% reproducible.  Could this be
>>> because it's the only device in the system that actually uses PCI/e port
>>> I/O?
>> Hi Maciej, Can you try attached patch and let me know if that is helping you
>> or not. - Krishna Chaitanya.
>   No change, it's still broken, sorry.
HI Maciej,
For the previous patch can you apply this diff and share me dmesg o/p
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -448,7 +448,6 @@ static int dw_pcie_config_ecam_iatu(struct 
dw_pcie_rp *pp)
         if (ret)
                 return ret;

-
         bus_range_max = resource_size(bus->res);

         if (bus_range_max < 2)
@@ -456,6 +455,8 @@ static int dw_pcie_config_ecam_iatu(struct 
dw_pcie_rp *pp)

         pp->ob_atu_index++;

+       dev_err(pci->dev, "Current iATU OB index %d\n", pp->ob_atu_index);
+
         /* Configure remaining buses in type 1 iATU configuration */
         atu.index = pp->ob_atu_index;
         atu.type = PCIE_ATU_TYPE_CFG1;
@@ -931,6 +932,7 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
                 }
         }

+       dev_err(pci->dev, "Current iATU OB index %d\n", i);
         if (pp->io_size) {
                 if (pci->num_ob_windows > ++i) {
                         atu.index = i;
@@ -946,6 +948,7 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
                                 return ret;
                         }
                 } else {
+                       dev_err(pci->dev, "Using shared io index %d\n", i);
                         pp->cfg0_io_shared = true;
                 }
         }

- Krishna Chaitanya.
>    Maciej


