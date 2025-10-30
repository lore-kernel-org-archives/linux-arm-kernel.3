Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1542BCCF9F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 05:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7M5/feYIXAcY/xiSvoX7AATD4bRj++JaUOMJzVqLb/U=; b=RRcke7sKm+nbsiZtNClrlttG9x
	S6jHu1q8EGjB3y8jcam7m6Nh1if6c6i7Uws+l5XVWEuNA9SBHvq/KOEwP36zcFKSIDJHOs4ovcV97
	wwmZlGA5MFaDxWAtdJqz59H4Moju8RegwD7mn/NFz8m4D4XTKbFrAt/Qe6V+2KV+gSC60r3ehQnaY
	ILFga7EmXayFi0zNyO4y1CwFOlsNEc/P8rmaO/e2tvAwL72T0KpcULCpOOnFwFhzyzCO7NArbJ+SK
	hAwKVMbrMIR5I3qdthqBBezQ3m27+UnXFG23dPk/00BI6+wiI7q0l6T4ryvdURaZnq/0erPqEvgXf
	QgeqUevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELLo-00000003W0I-1LUo;
	Thu, 30 Oct 2025 05:37:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vELLl-00000003Vzb-0iO8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 05:37:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TKVFpF1501736
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 05:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7M5/feYIXAcY/xiSvoX7AATD4bRj++JaUOMJzVqLb/U=; b=b4GMrorz0W4TMU75
	3T9CRxT9sb3JenThV91wxDEZCZTNp6TCFVK5xU7KPfvomzcJtxJeQ2h3PPll0ORt
	syi4uWn8kab/OI00aD1vnhRqjR52fN1zZwXiaYlkzdaYJAR6vebpJGpWh9xIok5G
	Q1SujHUUiGHwsb5UvedzVT9DQT+jvYfYdh66SN1wTDp1ker+MUOqoFbs6womOH7b
	/Ji7rvy7HaWaIb51jCZ5uZDLz0mKr/tX0sJrlwxDmWa/aONxR6qmKGGHMG25V+tf
	SehFzwkPAgCVIZRdQNdITf7ApxpZyxhrP+aM2AUbn6kH2ImQdPRXJiHHoE96JPXu
	dzLKNw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3t1jsa7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 05:37:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290bd7c835dso6125365ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 22:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761802648; x=1762407448; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7M5/feYIXAcY/xiSvoX7AATD4bRj++JaUOMJzVqLb/U=;
        b=ZGtoY5Rk3Ae9IRSRX+n8kHJvOOdNKmpZQl98LzTaUUH/gYv0OgfhjjZF0aoE4KqeVk
         EiXdjgWLVRWmvZru6ihIVD1aZyzfBwmaXrzJdSJ3qPuc4eHWLvGqcdPRdGRO8jCT6pUu
         9O34I1EEvo8r+KGwdcofK8udVs1EGHP4HL9hCqFgpgVhCE4IhBZtnZDh4N3Kyk3Hj0YP
         qO5UpPGEt4GZZGeQqRNHd0Zx/m2uAAQjY9wWVUc46oCK3EZNZo2q4LOhSbIqUsPrMwpf
         YRwGYO4YWLYKHRB6Dw/wYwYYldZHqKSxwhb4ZM9yuf5LLSnqD779WyWlRvoEmwFfWpta
         bRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761802648; x=1762407448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7M5/feYIXAcY/xiSvoX7AATD4bRj++JaUOMJzVqLb/U=;
        b=uPH9H99E09iB2vykMb4dIsyt7Hct6irE8hdguMbLnk9cAxjlZAPzpszdufbxKro1qo
         avaIYYZf2BKLqIxuIZ3bahqT8spVoR5T4oANbC5gzHCcHOIb6bXCHyKxEBy8pTau7nzs
         9kuxp/Dm3WbHej1wicdRkj+taC5/n1RKK3I7mdtpqUUfFVCvr0X4IuQj0cAa+dfHt4wz
         wrGcdC0Usg/q267bVgzWbJ0xgQWHgGvnmmJvH8krwcsCK7EE8PEGB8CGv3rKNpCQ9fav
         90nUKOnNt1WCTx6c3wp3AAP7YWxgxaQzAaKd6/mQoTPfE9wRwJPf4+H+Ng63J4Gc7XoW
         m+VQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6b3WMKkVPi4SIOnoTP77a6ksch7mABuwnN6u5Hz5xBzv/1Hm7AL/dKi/7zLt79VRkkaTERKRq0q3dZEMA7QpS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw69Hv+JFAdnXir4HdYc6OhciWESNQHRgopQwrmpSQAMVebYUZV
	uj3CxjXlhyJuOuVDKiX+SyUj+RnV7IJrnRq3Pdc6A3VeAcmHDcG9T3r4GRVhgdjb6m7pp9BgPRM
	q5wdrdWwCNJkjpBrCObnOXdcJtLfXTCIfGqftvm7Z5NO2USRKmrVt3DzIFrOPKij6OpaLowL/uz
	y3zA==
X-Gm-Gg: ASbGncvA6UuoZC3Wc2cMtQMnDRqnBP7NpZs8BUYBKklznO13Nbkqw05oPnY9CjfHt7X
	MsDLdrx0U/61XFZzYB8fdNCtF17PRDtiTpQdI6o5o40attqzV9lADgmYidi4CbFldZ0W3OIh7BP
	4Na2atGJ7wT8pPZpiE5qYdTJe+Bcqg8LTXWaRmwoO6p3owhsXiL157wQxqOKDfPKJKTOPLY6fQk
	hHirHmm8/ciEg4h+/eYrvnZLh/jFyKoYt7PdpeaZWdLZsxZ++BFBDBPryTNUHI48LMnKVNLqEku
	uJzpi1Wmuv/MKasEVhRA3iITfLHtu/Yi6ZaCymHVnp2SEVavr1uj0hTnVheLZArEcdWLJ9lJXMH
	De3AOfWOlDz3LP6YcD7FporskYvjGs5Y=
X-Received: by 2002:a17:903:22cf:b0:278:704:d6d0 with SMTP id d9443c01a7336-294edbf56admr21509675ad.19.1761802647647;
        Wed, 29 Oct 2025 22:37:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOi3AtcF65oro4e3+BO0KlY5luy6t+0LWSKM1u0T44ogvuEu8VYVcI28WV6vxqGpo9V+1xOg==
X-Received: by 2002:a17:903:22cf:b0:278:704:d6d0 with SMTP id d9443c01a7336-294edbf56admr21509355ad.19.1761802647083;
        Wed, 29 Oct 2025 22:37:27 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d39048sm171628295ad.66.2025.10.29.22.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 22:37:26 -0700 (PDT)
Message-ID: <dc230a62-bd31-450a-9acd-fa654f694b3a@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 11:07:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] PCI: dwc: support missing PCIe device on resume
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
 <20251029-rockchip-pcie-system-suspend-v4-9-ce2e1b0692d2@collabora.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20251029-rockchip-pcie-system-suspend-v4-9-ce2e1b0692d2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lG5rWwkd-7iSnCife7gpusb6A2ly5xR3
X-Proofpoint-ORIG-GUID: lG5rWwkd-7iSnCife7gpusb6A2ly5xR3
X-Authority-Analysis: v=2.4 cv=M/lA6iws c=1 sm=1 tr=0 ts=6902f998 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=G1FknBJvTCrQj4ipN-0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA0NCBTYWx0ZWRfX/Zrz5nrLh9+q
 sh5CToaCHFdZ6/UiQ72nnmnGpH+dyu/0XNT/IpCLk56B8J29hw9J/AvJs3OcCbN2+89TH/WV+2i
 3hqR5nsZZO7OGoJle4617aZEec9tYb6vLbTC2EeVnDNCP5IjoVFIvMyaGgtyaUmMHWLJITTM1SC
 Lcm4darnnEx179snbeSv7Tk4A8KCyF0oSbMlYBk3eSfnODb9cH2OIoMirmW5us5SG+kd+9Zt4+B
 UUBZVgqFJ3S3t1Y62rwV/TQ2vUopOvaYz8hZERwD5jTKEvnTWvc1HHQfkygmisqVn49Hakwbd0n
 /e1yBruySaMS/nf8bp8HdUJVvRAPgN3DRwUZpeUrNzgas0NobRdI5ucrKlooPsVQI/KA/rHYSts
 BaIJhVMdFaLW62Hyz+GvVSpKk/8vPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_223729_226215_E12B31BB 
X-CRM114-Status: GOOD (  26.25  )
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


On 10/29/2025 11:26 PM, Sebastian Reichel wrote:
> When dw_pcie_resume_noirq() is called for a PCIe root complex for a PCIe
> slot with no device plugged on Rockchip RK3576, dw_pcie_wait_for_link()
> will return -ETIMEDOUT. During probe time this does not happen, since
> the platform sets 'use_linkup_irq'.
>
> This adds the same logic from dw_pcie_host_init() to the PM resume
> function to avoid the problem.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/pci/controller/dwc/pcie-designware-host.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index e92513c5bda5..f25f1c136900 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -1215,9 +1215,16 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
>   	if (ret)
>   		return ret;
>   
> -	ret = dw_pcie_wait_for_link(pci);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * Note: Skip the link up delay only when a Link Up IRQ is present.
> +	 * If there is no Link Up IRQ, we should not bypass the delay
> +	 * because that would require users to manually rescan for devices.
> +	 */

In the resume scenario, we should explicitly wait for the link to be up, 
there is no IRQ support at this resume phase
and secondly after controller resume pm framework will start resuming 
the bridges & endpoints. what happens
if the link is not up by the time endpoint is resume is called. And 
entire save & restore states might also gets messed up.
There will be no way to recover from this.

- Krishna Chaitanya.

> +	if (!pci->pp.use_linkup_irq) {
> +		ret = dw_pcie_wait_for_link(pci);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	return ret;
>   }
>

