Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B03FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxjUtMEcf3guQFZGlMGFmhyqPC1whCDGyI3j3Ls/ksg=; b=0TgsrN6nn/jrsUYnnCUpstgErv
	NhZxkuMqB53NZ67PyUaUNZa3gwTXq+Ui0bEXUdAA3MwRj2uz8UKIaEq5Oo0zws5WLR+JobYLrgVam
	e1jVlQvuWS2VQp/gVmlRSYg1PKpVuJ35DoXPf/hkEmn56fUcTG1eN2SfXNfpk9PbPgzoKVoPjMdYi
	fC3OYR5xnA5CmgrFZHqBG4LCom2WIZUL2v3Emh0gh1C9joP3pWs/GdKfJXedjdTvJfwYSDz4sxWzy
	Uh0z2bQIWNBaXfLHnmcHJzUtihZDEqfIBfAIO26FsJRF/VQHcRRvFem1wHKODlo6kGEmEMhjMmmR3
	UXG5VfyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI18b-00000003KNo-2n0R;
	Wed, 29 Apr 2026 09:23:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI18Z-00000003KND-32zZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:23:20 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ptrT1641662
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UxjUtMEcf3guQFZGlMGFmhyqPC1whCDGyI3j3Ls/ksg=; b=NluoVTzKDbY/EWNF
	n0UgMKO7HIAW6YgTUMNXzxE+Dd5xMHpkkUWxf9Wq30kCsiM5cSWq+mFFrrPDDBkQ
	l4zmEoY5YxYZbgfvvrT5GVqRl3NRDarMXN4d/UhgZiwEBJlvRpA3ZBDSTRJQCIFv
	+8jcospOPer1998kmM6HDF2iFUdFo5S1ZmMWYN2/oCGKE5q7ibPPw8hhUcI6tnS2
	mtdnJsplXDmZ7IjQBxillmsjHqVVzmNgoF0yFcqa5cMQZ6ndHnbTROD33mvyviox
	g5WDILuC8OUXAOCacqd+VTMlTvWMRCpaZ3DyufvQnPIDFf7AKaftNgZG0nSUvUm8
	4iMalQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj80te7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:23:18 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56e072ac05bso1080278e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454598; x=1778059398; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UxjUtMEcf3guQFZGlMGFmhyqPC1whCDGyI3j3Ls/ksg=;
        b=cc4+/ckqIL5ppyzsYvVAZFrj7iUkq6XnGmSjPeQ4MgqezyeOKgF9epbY5WW9sVkGxH
         rVSlETvTMQ5XksBgsujcCvAO2Jh73wEnU7of5PAAl3H5IQrSfWnAn3pZB2nCFJNFiN7x
         wLwVdEyPDRVtCtGHp+EOfzCKqp+ahbyKNOHwbh3a9qxREffk1XQYOejuCapJ6bLOEnQG
         qoKLCSZVCd8zTI4/WoYN71W5Z+m3ei8Kl1ET98XILbmJ58xKSRjOIF6weuO0PUOj94EU
         JkaxAn+Vi1SAizkIf09ofEdLvtomMoYHw5Hhq6+PbEY6XFA1OFYGMHZ9wNda3PtfMEhK
         eLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454598; x=1778059398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxjUtMEcf3guQFZGlMGFmhyqPC1whCDGyI3j3Ls/ksg=;
        b=J6ZWKAcKjKnVYpSAQJWOgaR7YrRxHxW19M5+LIzZHDlGAFVLKo3K0dhZmDthUPOkDG
         xhFmtggdLJ52qcyWYOypZZrpJWZGaZD2E6sdMjb14V50UxL5XMK1w42VEix7IKGelGn0
         CpXpuQNlZ7k2YNxPpxKMhxqE26ZdA06D1MKj9pPLd0fgCsIAddfTFFCy3LR8OmzyzZQk
         HW9Dr5OXZiHzWtW1Zk3QnGJxBHJdfGyZgBbslxSYZA//w/0/O/S24ah6w3B8/QYCntRM
         8wVZbJ6dl1bgCM0HJjnX25IS/FR0R77mV0pDwCOMpP8rezynp0ZABPz8TO4XWz5YPoXR
         yn4g==
X-Forwarded-Encrypted: i=1; AFNElJ+W1b8HHTMazoYSw29IzvfIZ5flkdpwuDDbW9Jjf6mZmBCEUzfQuQxJkj4mB4P/ra8uBTGiemkwFyiPPSos6tlg@lists.infradead.org
X-Gm-Message-State: AOJu0YzvC90EYEacX7qWzLmalW783/EpYoV5mI10iUKEPhkSTCqe0HjU
	oTLNIlMx4B/SVaNI2mwuEs0BFXj+Y1J4+yOrmcmhEadVvm6jFqvyPy62sLriedfY1aMD8AL8k8s
	hlY6/Br6bU3Sv+RIfPuDZkKzHSxZZ1bkTldZxcfnoPZgz/GKUANodB/hsxMgHiWTz+YG6WgWITt
	y9aQ==
X-Gm-Gg: AeBDietegKKRQXNzeixU+VGMSPk0HADz1FwDPv73qDC2zGYy/xt4PpNtPk7wd9+EmUd
	LnmXrImUzMpVscDqgtZfPdTnh1cqR6i09uF2pdvXciFARlb7LXjBZiO3hWp1usFNGAlvaGblWRT
	ilUBYgnMoluVWS4J9lhOqiOCtKB8EwyYxAotNjrA51dlgppk/FMf3R651wrwPcyeEEtzIVdiR+I
	X1LZVjGXUkWdhVloATXv59wAdb9iv1arjT6EqbSNzuZg6HcEhiiNTJvKo1OkzNi2euEOeQ22Bbd
	jB39+E9Xavi/ZQ/FihNOVqzLFeu1QQeATYO8vjN3whoAX73OiWChR+aQ30wrE9AWNkwhqejl4qN
	PTjW/xmeTxqx1TrQsHjH8akWjiG57OZhq4NDH24W+omkX1/lV3Yw3WV/cHWxodXnTIdkMJD/mF7
	C1DcNcGo+1vthoFA==
X-Received: by 2002:ac5:c8b7:0:b0:56d:a70d:7f06 with SMTP id 71dfb90a1353d-573a2942f1dmr1298094e0c.0.1777454598152;
        Wed, 29 Apr 2026 02:23:18 -0700 (PDT)
X-Received: by 2002:ac5:c8b7:0:b0:56d:a70d:7f06 with SMTP id 71dfb90a1353d-573a2942f1dmr1298090e0c.0.1777454597661;
        Wed, 29 Apr 2026 02:23:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb9854393c2sm65350766b.36.2026.04.29.02.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:23:16 -0700 (PDT)
Message-ID: <bb02291a-1579-4069-b6b1-757a0b5fb7e6@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] interconnect: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
 <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-interconnect-qcom-clean-arm64-v1-3-e6bc3f7832db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 489TI_f9OvaiWorlGaUKm8xQLPtvH6Sh
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1ce06 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=V2NSo1CrvwOFa_RsOSoA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 489TI_f9OvaiWorlGaUKm8xQLPtvH6Sh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MyBTYWx0ZWRfX4i5WKvcCKlmx
 bMcUfDU/hdIA0T04qPOwjOiCvHPVshZqCR4WFmfNjiRAkj9Pjinjwy6EZGE5SrQ6ohrsi4jzudD
 3Jb50/bXhLPoKACnzpK2j28yIInet4odmhOzXN/tEqFgtmMsqj8CivrynneAu6blbTkZd1Rh0ln
 tHL2jFOEZVHvbIouXyx06A6jEjbmZRVrs91hRj09sWlKXiK/GYc0piwa1itNUFNXsaqB4PvPF5H
 r+ej66hPbbjawyoIN+FZFKQvQTXyVBbWuqCl4zjQ6zR61SwdomcLvjsRd9eaMVvf/iRzVlmtKKe
 vs02ngryPE97T8GWSJDw0K10+GWvfJg3RvgKCF1OwA3Y9q6PQHsXx20SE4Ph4Hx2cnVoDixyOhp
 W2/v+V88gd9dcltV4jvAWNCB6CbGV7MUYx468uMsY4eevxTJNT4LEJbZcFbRtRKyX4ZOok8GYkI
 GNnCoqNyp3Ec9xa4LFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_022319_884569_D2A96463 
X-CRM114-Status: GOOD (  14.03  )
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

On 4/28/26 7:32 PM, Krzysztof Kozlowski wrote:
> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
> basic or fundamental SoC feature: bandwidth management between internal
> SoC blocks.  SoC can boot without these, but power management or
> performance will be affected.  These drivers do not represent any sort
> of buses visible to the board designers/configurators, thus they should
> be always enabled, regardless how SoC is used in the final board.
> 
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.

I'd say let's make them all `default ARCH_QCOM` - all of these drivers
are required to boot (minus the OSM_L3 driver which is "only" highly
desired, so that your CPU's bus isn't heavily bottlenecked)

Konrad

