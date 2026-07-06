Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EF8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTo6r7Q0G+3mUeTWof/QQHuOa8Dto24iGRfkDVleja4=; b=cOAMIdEw0FMWz3NFNKua6aO/fD
	scF0rCiW2GsSqWIpiuFG0LnBq5TM9SDgT3TCAGednJe+5Y1fF4Ih6SzB//ArgzmBL3lpWsjB2EjQe
	9r3SHnuxXo1nDZm5DKqIxIET5U5UorUG2Taq/cl7Ox02jwLldzsJqODjwdJFDZpvSTgBzvXV/AuU7
	CcaFksauZGER/0RZ/GdujVxDFyc6DsFqr6mgc9LmvXH5xsILql9JOLf+q8mqhAWymh+5HQuE8RZTY
	5jJCNbpVzq/YAJ8NIK/+Jrg2Z8X3pyg/rvvIzSipo9auKD2nqG//TT31gFn487REvo4NPHMD+D0GB
	En+/kxxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjw-0000000C48m-0t1o;
	Mon, 06 Jul 2026 09:35:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjT-0000000C3YE-2tae
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jul 2026 09:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QTo6r7Q0G+3mUeTWof/QQHuOa8Dto24iGRfkDVleja4=; b=kdyTy65yW+8ozekTmrSjbfuWZL
	UW0uEaTkbC6W0dp1NHMX8kA4OVbZKV18F34Dp6w6aYX8Ew3e4+H2rZVEgEcAQAu2o8WI8AOKb/3rM
	TiUw02JAL6ucqI6PeTDVlSh2N6V5Xs506jRU+EFWqmDE3A0aaF0NP0qqzJsdsXFbMfwY5CkfsaZRf
	1k1vpqR5LzV7Yc7xrg8VUpaURZEqh1nTX/2R+rwXILyT4GY3TAU/jpp1UJBY/kHci3gG4fUIGS8Vv
	/Zz806gmLCoeJ879eadoTTDLsNyMyrcrZ89JM+tZL8tVBsg4Sl6versmfyXQf4OmZ2XbyEtI1eIJG
	qfOGyNwg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgfjQ-00000006NSd-23h5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693vXk4172364
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 09:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTo6r7Q0G+3mUeTWof/QQHuOa8Dto24iGRfkDVleja4=; b=WaFTSykRMZ8moz5w
	cJT86o/XfgpM2XMCIH2HCskKeqkKUFiSrDoSQv8gl5Oblg3e0tgetbxsRxRf+tIQ
	aRSJYuXP8tXITqmGenuR3EsdSIOpMNoopfaUcHqmXgz+eggZvg3GF/tDsrDf1j97
	xW6uvKwGtO2168cb2js9VGiYbGR+hAxkoIZvD7XQnFoJMoUjkUhY8X+j7S7zak9s
	Tpdn6GoZx3OETA6Fur8WGB0Xzec5u1s3bO+V27hizCcfui4XV7f75lEn5EFyKooe
	c2awz5EHD/7scCyteBHvYA2MGoU7YjHb56uBbsi+KnyCUWUZAx3U07ZFcoJmCMl4
	qe8bDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t889a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:35:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e59d97df1so11165585a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330511; x=1783935311; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QTo6r7Q0G+3mUeTWof/QQHuOa8Dto24iGRfkDVleja4=;
        b=fDsEoGSvdsAoqDRcMEQc8X/dAoRU1xmUONcI5xnahQL002SKYE/9Mj6kkaR+glFbXv
         QHXypTmEg28zsvkzHYCzINn2ynQMdopqsNqyFck8+veS+EhnfObTJFJ9kJEcl8/1jbph
         dD7o2OnmTY1ijbJXh6uYEC2FRLyGHeJBz3VdqDmyNHKbUX6ERXTSrEB0oFdbtBpDqXnm
         x6gJv0x8QuP1XJ/39LX8fPvmpiv7Ixo3cgcSspx7adczYfayCcJKIL2hHICSw01JiD8Q
         sKbH3XCVktdB58XQyNIniTEv8JKBEcM0iUNfX6dC3qCeAJsa+Ke5i/X/KWB0YhBgBe/b
         V9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330511; x=1783935311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QTo6r7Q0G+3mUeTWof/QQHuOa8Dto24iGRfkDVleja4=;
        b=BcAHI1WKQMed7ynl+DLy2nekzAd5tKOWWFXLarqEFS7SDex3of+Qys2EW3BsFcweuA
         jqnvNeenQuQlah7IMNrDQZZNM6UiAJMN/wy4UVnmyNFBzkvYaDRXRZWWzeq8Rq2/rU0Q
         9iaOw/W2mQkZ0VanP+49NRyFLcYFXgRzqVbSinyR7d9nDfYu0iWNGPitKSBgK9FfR3aG
         DRzhpQu6oqb9uvtx8mJvrLAUi2S3b3ROr52pLPSx5mSxVYMrax6FXqrkuEY7mCa02CLa
         lBXmytUwm5jynN9pOlJfALa2o5t3FMj+Dz+EU/+N6bDdkIn/88pyxIsj9arA5IJef4tp
         FYNA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2reraYqRU/MrV4Cmn5gAQ/5xgd6oWtkXX3aQyb4Nrl3MhNrzjE5fRmRBwymDNdn1SrrrvZKBqOwKb1W9t1DHw@lists.infradead.org
X-Gm-Message-State: AOJu0YxK8JWnLtL7vVPULwbYZQl4PKW57WAXNtkrUmTApXJ8l3BjniYi
	oZfodu67tEr4I4NMopdKiAZAzgsA3vu/GUzVqUqlFNpw/Df9FPcZfWOr9GHNoFmIu241rpDl3L/
	G8s7ceiD3Vj4hKcFZkiiztij8DUMutwvYnTd7z5iF2HW8puH+LtwHkix0V7247VBFkPymdG6TRN
	0MWg==
X-Gm-Gg: AfdE7cnzp/TGp/cqcAeSK3U8I40hkKFI0hBAgY1fjcXtF/LQyw/k5F7rutOvPXSJfSX
	0czLAGpn+tJBUp/hPhW+JDC9lxsRC+QsIsL9EKVS9D1KYr8qXMuumNbOIwgdZp+b2t5cf/flfWj
	FogPLWLm95ylJvvJIvBgVs+YxFczwihEcswoqRpPGUw6c+ZRir8u+ageotGnrsUrScRf7rD3Io9
	TQWwSqkT3XwGCglc6QJE5n0KkMnx+wJ/COOqInGW9ZiRT3BpQwGV++tXknyg1dqfV6JGJfXFM6b
	oLGQyEwwV6U8eX5RKE7PvWp8AApOQbprV+Ka87ziIH8DQv0l7Q92xn7hzuSz6rZAo0s1tDbRKMi
	DuMAKzcAp7ID7t0AZqnH0NEEUYt9d/KrDDxA=
X-Received: by 2002:a05:620a:468d:b0:915:fad5:9096 with SMTP id af79cd13be357-92e9a0c23dcmr868735385a.7.1783330511355;
        Mon, 06 Jul 2026 02:35:11 -0700 (PDT)
X-Received: by 2002:a05:620a:468d:b0:915:fad5:9096 with SMTP id af79cd13be357-92e9a0c23dcmr868734085a.7.1783330510946;
        Mon, 06 Jul 2026 02:35:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c6f5fsm717445766b.51.2026.07.06.02.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:35:10 -0700 (PDT)
Message-ID: <706ff852-1b61-412b-8e25-9ecab968361b@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:35:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] arm64: dts: qcom: kaanapali: Add QFPROM node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-4-6ac53de56314@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-4-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX/qJ0bCFrwrXy
 0NUgzdQnrFFsw22UirKHkF4VgmG9jw6Tu0VCd4dKNZv4dj2k/A84H9plklQg0awsjDC2ngCugMB
 kSqNrRrB+LpiRr54B/KJOy2bd6b3fi0=
X-Proofpoint-GUID: lOBIgqgWNy8A4c0EJjsxTlO7edcJEhk9
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b76d0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Z4vjmEANuloM4Dk0XroA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: lOBIgqgWNy8A4c0EJjsxTlO7edcJEhk9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX0iCEi1vGAadf
 AzoeapWwoMWf6IAR4s5DmFtj5zdEYWESOTriRO5wT4HeGkuQRuvIXCPYNnvXty8CyIe00nUsn64
 YSvbIumHrqhjMhzt4um7KhFckWJ0LU5AWfLLQBk6NRtOWwcplRDcMyxQ3qDiQcoFEFpMaTJLYOl
 C5lql5m6hS/GTJIBrOjzi5sGUUdl6sVnABZGOcgOjY0KDSEi/ygik43PWezNlON/fGVsG+17wFe
 BePwkJ/4YDUZM3/nU2uUrBzIPDxzqeSMgeART09lJUmVN++S8U8qqvaYSMoHGv+uehbUe9R0tI5
 UnVnOHqFEr9BGfoLUegUqP33HPp4sM3yW/28X8oRnCeGqQfKAxBI/USqPDM88hCj8IW/IfaJM9x
 dUtbYJ/eHXHkB5Ju1Jth9oOOorcl/VZaUpWnFe5CHCv2DqwJCvheK3XWmi69a4uRy6SAnVb3Bhm
 mBwNIW+0SId6CtkMcBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_103516_976493_40B72327 
X-CRM114-Status: GOOD (  10.52  )
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

On 7/5/26 10:00 AM, Akhil P Oommen wrote:
> From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Add the QFPROM node and GPU related subnodes on Kaanapali SoC.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

