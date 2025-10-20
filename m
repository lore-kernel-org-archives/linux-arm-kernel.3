Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1170CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzMuFEKLkLg4cUyPzJ8L8XlJRjRXyriI3UI6ZizNKkU=; b=nqO71ShJf6JHMl1AOgPGwm/CqD
	A0nXsWHStHSSoYQkUe9KHeaurHcnjrQ7BTRvGdSNs8C1waVjVQosmplEeKjOo+eNrWuoy3FQQ2P57
	8QG1+slTV8CSml0KfP36hKFNp0dvgHDeNad0WJbnRYivQ4ieSsm23CStQQX025mbMofGmOpFEaxOt
	fqRV0fOYZ/buQwqvoXCJYjUGVuC1zCbRkqzJrE+5vpBkLJyl53yksqF8CFACmaV39dP71/D3Yn5bj
	TUJKWGoe+5nWmCRnf3vw+jfqH9J86K2Hw0zYv1TXp1dwYKqCPAiI75Mu5p8liXLpGsUlKx5fQf+W7
	potD2ptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvH3-0000000EjDN-2y2E;
	Mon, 20 Oct 2025 19:10:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvH2-0000000EjD0-07OI
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 19:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yzMuFEKLkLg4cUyPzJ8L8XlJRjRXyriI3UI6ZizNKkU=; b=lnjbRNiCDgR2X12YmkDzLO55RO
	nUUaypMwVw5kcNFycOkK/gsToxsfTkqNJwHeyONDam7/Gh7Ut7PRZKfU/ctn284HYFYdz1N/unW3r
	i42aepv6M/oWZA9s7Z6sRRdxwzA+7SJC8yDsmDbvTOQCwxUE4T7TSvnl00TMDsyHBJcJ2zJHgDsBD
	ZIA36XxaZ/f1rWo/P5m/pl+SHVsQTtzJJLLNQ1+DNlsuHR3BXEkVumzqeztiDRx20oRbQOwL/dNOV
	EM7FzLIVRoCABQ0GDfZGSpuf5DXPNHNDgSE8zslfFAcREyjRDKqaO8mKGHp5khJL29pzBqFqEevlp
	tx+BpCMw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuPI-000000008Tt-2Jzd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 18:14:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KIwr0Y027021
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 19:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yzMuFEKLkLg4cUyPzJ8L8XlJRjRXyriI3UI6ZizNKkU=; b=bxxTWAlGFb+c3Odr
	5HAbLzMyAEILhm9zTyaUNFHHIH724DRNWdL/Gjpb7fYaHG6CwhEb1waxwY1gMA7L
	Yr5ZxZ+AydKHeOgprBSVj4iNkR/Hb61C0plNU+c01d26Q5ZhCyJiALNg2bU3yhad
	LZY99F30r+zuKaR8Er1QfuzhLHeiNtOow4/6isXxa8tT5ZgvXqRDRVWy5hEznBVu
	AU/3+kPGN6mZW3+PpDa+K+Lt6mooIVma7+Xks8ZXEtLLM3YMtm37qzqa6m8cWvwz
	hmoFbJ/Tu7/Ldt/oM8I19lG6Tquhk4zbdYYm45+XB42Sd1O/HeeQRAXVBxTvu3Mg
	HXdPJw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pe2hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 19:10:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b630753cc38so8383751a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 12:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987411; x=1761592211;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzMuFEKLkLg4cUyPzJ8L8XlJRjRXyriI3UI6ZizNKkU=;
        b=gHX3HBlvXd1277hlWT1LcVtAqt3k8PnMKDdCzG6h5hzyKPKaIetPUkchGIprLS4wqQ
         DeLmEKIGCFpDD4Akqn90Z+jqhxDdA10UNmVcZhZ3tf7UkSooUs9U4fkTQevQYrXMCjYz
         qZ4g50L2Rp3MgO02JTn3zFORf3bSBlu269oAOReEpLHlQ1dpWIQlRTwCav+UbwtWAkQk
         ZYoPcxDCPOLtv1M7ngPFpOrPvkUvoFNNMU8hMWTSe/TGKVLFVxCs+CO2S1jAPHF/9doO
         BEXMMyaJCgV3+3vvzDH/tEpCQbC5FO2T+ruTVaAgeKeKtbKdWQ16WxiOMPvN8Wcz16HE
         jJjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwGelAmsZifSB43Qzi0m2DJxwVqwLslkyCuIkDSP9mFS+wWfz2mjhxrF8vI/iXyYaaBgSmAJUZi4/VleWFEFy2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy9BPvV0KggVKDoAEEgLnJH0d64NuYSyMx3+DKjgkB8N/jzzdg
	G4wRHvoCZSSPTIVJwUtLSDPrX53SDcdhMr0tlH4JLpOrTwmXDWTou5qucleUekSUVPLY9Toxmdf
	ZYKlglDQlcH+zKH5FUSYEWWON7DbnbFE1lLu1W7V7nH9JO0oKZEcR5bw2XodPQf6FGQjjh10Z4L
	WPYQ==
X-Gm-Gg: ASbGncu9xQySD45V6DXcGiWoCnVZ5P2boG/ANZYNdtgwXgHsPUzlMyPdzL621JJkaS8
	6sm4mbhSyQBfIGts2nYHJq1kSC5VvB6VyAAiU6O9BTdT0fcinavE5mxLaEgPk21w4SBl6ejKU64
	cBi+8bBnZ9gKP+lvS/fp4i+8sz2IRIOV1xxkgRyHJJHHkvFqhQrd3Qoe00khetEqN+3dstGIdoz
	HrmFRf6mYxrvD48W699nlEfQRajGf92ltmsiojRNEhY5x6hOaVlHapSiqj4YOvuW93UMm6mrFr7
	b1MXymfBOGwaZNTI6zTQ0LnGWcSucNEx26v0fmAznvSuZliEctDw2xE/mDa8OmxOIy0umqCM1D9
	yeryGeCIYocvlV0X6yRQ5Hpi8aNWrTmr7IZ3trOVkpOLMFKkfeOeFepvqvlJZhgOAOyjgLxU=
X-Received: by 2002:a05:6a20:42a3:b0:334:a82b:97d0 with SMTP id adf61e73a8af0-334a84cf411mr17501120637.22.1760987411129;
        Mon, 20 Oct 2025 12:10:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt/NPam4b5rrf4LmdQPIY4ADl573FSqQwAJ016hQUWxp2uqRMDdylgVudT1VdQyOPbZPC0nQ==
X-Received: by 2002:a05:6a20:42a3:b0:334:a82b:97d0 with SMTP id adf61e73a8af0-334a84cf411mr17501091637.22.1760987410686;
        Mon, 20 Oct 2025 12:10:10 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a7664a462sm8777498a12.8.2025.10.20.12.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:10:10 -0700 (PDT)
Message-ID: <5e0b80b9-8cd9-4e5d-a5c0-7fbea8325855@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 12:10:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: Support for FTM TLV test commands
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20251020153759.407516-1-loic.poulain@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251020153759.407516-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX2Kbu43o4hhbr
 Hjbnh+FYOJ+66JF4htC9pQ/aX45XeUVoh4EeAFRZ1p+MwzxqCHtXkBDrFE38Sh09CkE8rpecGdk
 55JRimAx5dpoRmsfvjcvd5M5wio/5901uea78VJvl2zAOyphuP4/0hh/3h4wFUYDESDhyvtqGKa
 j0yHali08bmNPo7JEKM1qwwaYgQsg0bQvcGZ1tLuYUxXN0f932CibFvQv4ECb2JDEco0fuaghaX
 dQMFkRPOyC7Pn7F+fPaY2mjFpVbWnBjtouxNq+zznL5qr3grrJk7OG2cmDDV/oALHwVDf5u/UHv
 LGql6WHRthDxE/3StPhNnjqKy40WucIc16DpIe5KK+6+ufg9OGgbyQ+EwA2HfvlO0GQujQ4z8Hb
 yWL0c6guFJbXyTDWQcWVXUCqmDO+gg==
X-Proofpoint-GUID: LuQRo7nshDqbUm_VwiUXrklbbR-ZJGUE
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f68914 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Oq1PXzKV_Ju3vwlGj5AA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: LuQRo7nshDqbUm_VwiUXrklbbR-ZJGUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_191456_891427_BA227DCA 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

On 10/20/2025 8:37 AM, Loic Poulain wrote:
...
> +static void ath10k_tm_event_unsegmented(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)

i'm going to split this line to address the ath10k-check issue:
drivers/net/wireless/ath/ath10k/testmode.c:34: line length of 91 exceeds 90 columns

(for now ath10k/ath11k/ath12k prefer to not exceed 90 columns)

/jeff

