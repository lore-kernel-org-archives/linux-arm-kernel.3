Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DC1CDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 16:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSJH8206N3zXxZb5NwNeSdYyuC4r9dG7EEW5EpoiYlI=; b=Z+Z2QtwHH0l5IiLFE0flR5Yu5a
	IovnWi5qLrf8h/gVt/83fFrmeo0+v8ZADy1maoohB0SV9JauV0Yn+i/c5KnQH5yUfwt7nDZG1eLvj
	9K1bIxYizdOP+/Tf9gjRoRLAu3rZZXzxEN6zheoJAUFQ+16GB0uNgtubVj1FZKoE2FEHAQDme323C
	7ezWSkkAYYEMDdadkRxokXiOvHG7RMnRK5szufcu2eaNBUi++Wh2U+fgxrAa5HheVQXng+bR/U2Gc
	4W/SgixRNuCEvC4l8p8Zvwi+wee3wqT8xexSiQR8qbk9iAo47Aow2BPZeHfhPNHcQTYrtLgFfEldi
	uGwBf+ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3h9-00000006bdW-0wAl;
	Tue, 23 Jun 2026 16:09:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3h7-00000006bdC-1OGF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 16:09:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBZMdi4017320
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fSJH8206N3zXxZb5NwNeSdYyuC4r9dG7EEW5EpoiYlI=; b=KjEJ4diJ/AaJ0SWQ
	yvUoPZwlLY2irWcHoyqoihkzjq7etgTOfCN3X1hS4VT3p1D4Czk/aXnLHHuWfHew
	MIKEs8RiFWGipWvQDCX0y2aNe2GWY+S1wOIgKCcEhZ3eEOjeBh7nLVWUaLDtxs3F
	uE3fu+aghEiLN6N1irlBgVzIfJBheTLeYBLmSIOHKY0Yz/9c0t9baPmlSFJ4Y9lB
	6/ZVNvaY2eHT93FAuHitpQqiOOzjZHUWCtJXZv38JFzHAI3frOoZPZWCsH3+xZX3
	amLiybRjVVD9RTUbuKsdTdKuH6c8hCmEsAvYzL7qp7dF1pdkdG6Hl53kGFwEdku+
	fKONAA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eygkjk7xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 16:09:48 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-967064afb5fso29041241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 09:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782230988; x=1782835788; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSJH8206N3zXxZb5NwNeSdYyuC4r9dG7EEW5EpoiYlI=;
        b=cLjpDT5dvce3cY/SB+WpV9anwRwR72Gm8HaVktjybJKSIxRlRqnEnHd7XKqQOPj5/N
         yTLvsmFyNk0/AX0EZivcTtVw7wQD1uXmf+c+SnuJWBd+dmSvugnd6Y+B+h66o0U47wzh
         oz0RcKeslQ5oJ7HD3bJ+u3gK2iurtq9W4TwBOL1aeS+bdsHjTEwkD+v98g0uBLeZNzl0
         vcKcrDanYMwglpKK58YTAO6+oT271QaAGXSHlf/3etNKqd+KoYwmjOeEHlnca+urrFI4
         BENYEa9agRPIbeqItgG7QCHSdigP+pb5aWKP7bFWmWaJN+7g8FsVkcyyumqwhewc7uuT
         gZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230988; x=1782835788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fSJH8206N3zXxZb5NwNeSdYyuC4r9dG7EEW5EpoiYlI=;
        b=aeMgkhqi/Xv8QOQ7mjvX/AoWDUPkIhy1b9tIaTbECSk6nDyN9jnk2ppAmZHrrC3FCy
         qHrEztwXUQ9GuMVc5L67y6HydrEpAEhKT3RIa65GnYH1BlxBXDbBcI7qYhnyMRZliSQi
         /MImDVBnxSTVxXxV6ht4o3ItGf+jf5mLWMtaWbVxtnJrlrjrEyV0c//raO99e9ynE0E2
         93n4XJuqYNbBcvkfCoL6aW+f66Ip8JgXpmgg8abx3JVFt6CTqjUl9YHcsW1U9sXffqai
         cfnHPkJbtR7qs2rtSuQtwHSxxdkOivfytORw0Es5ts4zcco+luYFQlaDZqu2J6iECJ/2
         EdkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+blqPnYDT9My8QxkpAuVnHxhpbpgI0x1Z54EV4fgACptOcMQZTbiQvmQEupZwM5OMma5aD9iM0LvK4mQlPlshA@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx33RnK61ogrqhFm4cxsWyeIHpZDn1vDcFtwL0mMRykrVP0Nns
	xqK1ooAvEiqWPfZkTQ9QBJtNx7Gy1KDc00dENQTh+LEWAeT2LelisNVrGeax9u2thXENLbzBCab
	yn7wy90T8MnNEyeFWVjfKDAKJCsk8qta1i0PEkP5xRr5pn3g6pfNfIpAOFEeWuY2lKChYD+m6zS
	oNXA==
X-Gm-Gg: AfdE7cmpuqTNFJw4snQF037XA5/qQ2hHnaIG4la3hRNIL7IT779fntbquNMv48Upj5g
	udhI758KcBPA3dihtE9Zs/6wrhwPQmMJ2m3VOyV6NYxftXq87EOV84QcVcuq2hsJKU8ydDL3CKY
	d8hDPzmSJfcRBJIH1JdGfeLsuJqDkjQ8Nu8IlNIhsx5hAOfJyLCNsLhUbVDth98AexQLw8wo/UL
	K/1ua26J99t3PkD6pV29N6x1BAUBDaOAwECuQY3EbiurtaJgaabPRbHQA5gIOoyJKiNq2i0in69
	uH/5jPGf0ICw7Zp0Kkwi7kiOSpEolXyanOHdXFppPk3uZgpTvT98LNT7EMem5ZtN8OcdXtVj6zm
	e2KcDCZjUegQjImzynS1xYBDkPuvUSFT5XfY=
X-Received: by 2002:a05:6102:1620:b0:674:84bf:8e0a with SMTP id ada2fe7eead31-72b16d7a278mr3803414137.7.1782230987802;
        Tue, 23 Jun 2026 09:09:47 -0700 (PDT)
X-Received: by 2002:a05:6102:1620:b0:674:84bf:8e0a with SMTP id ada2fe7eead31-72b16d7a278mr3803389137.7.1782230987312;
        Tue, 23 Jun 2026 09:09:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e99b968sm536990866b.24.2026.06.23.09.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:09:46 -0700 (PDT)
Message-ID: <aa1471ac-bd1d-4e1f-b61c-3db86d2e31aa@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 18:09:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] iommu/qcom: Fix pgtbl_ops leak in
 qcom_iommu_init_domain() error path
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
 <20260623122034.1166295-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623122034.1166295-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX9kkU2VzbUp1i
 oth76Pi2nmi7kYMGikEnZyDgNIZg2phu5TuNNC3hL2WY6r2zLrDLVOSkkjCHwxxsvxqdBCtKluo
 dPYiT+99Y2E3bCqrviKJfpvr90iYZFllO0Xmw+N0Wg1kvfsRobw1vqf9kXjvOy1R9SVayq/SkXg
 gbXE3q0Tlo8+UFdN6Ydw6YwMFsWjnf2pczhhqQu+hKnpwoEolyCpCL8Zi0unr7nyRJS/bNqLGw+
 rn0GmObtEz/PwlM6z06g4NOx3U0v6Ey1wu0t6WcM6w0c8KCHbWSST/5EHRy5iGinObsBRu9+FRh
 dOYs371dzQvg1zYCZQn1MRl89Kedr3ng7WYIIVUpIQvtgyBXIDleOWdOhYGwCkQwY60mOhpMdfM
 ghnM+Fi5OVn9lWS51GUuPo0njA8dWfatLDLTH+UA6gcgGDGAC88XgYgokTsveZriOAhwUORx+s5
 XigsfKIgi/uwoa2u1Bg==
X-Proofpoint-GUID: jW4oYrF8zS_uzQy9cnS62gQRP5_sYxBR
X-Authority-Analysis: v=2.4 cv=SoKgLvO0 c=1 sm=1 tr=0 ts=6a3aafcc cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fzWtvpM4OtHSxDPwpw8A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMiBTYWx0ZWRfX7mjTViaIIEuY
 T1ajGkilSXnVrjhF2t8q4kZGVmvWA8pggDB8hOgLkH2ZYI6ezEZe6X9fKE+LDgGhD9VioKuCZdZ
 uXaFCDxitVaVEyK6k2PSPk1C9PsPYAQ=
X-Proofpoint-ORIG-GUID: jW4oYrF8zS_uzQy9cnS62gQRP5_sYxBR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_090949_486610_DF717952 
X-CRM114-Status: GOOD (  18.12  )
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

On 6/23/26 2:20 PM, Mukesh Ojha wrote:
> alloc_io_pgtable_ops() can succeed and then qcom_scm_restore_sec_cfg()
> can fail for one of the context banks. The goto out_clear_iommu path
> only cleared qcom_domain->iommu; the locally allocated pgtbl_ops was
> never freed, leaking it permanently since qcom_domain->pgtbl_ops is only
> assigned on the success path.
> 
> free_io_pgtable_ops() safely handles a NULL argument (covers the case
> where alloc_io_pgtable_ops() itself failed), so add it unconditionally in
> the out_clear_iommu handler.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 4e714a8e1fac..b6ce85f7f923 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -314,6 +314,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
>  	return 0;
>  
>  out_clear_iommu:
> +	free_io_pgtable_ops(pgtbl_ops);


This label also jumped to when alloc_io_pgtable_ops() succeeds,
but there's a nullcheck inside, so i guess it's fine

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

