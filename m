Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE8BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hO6xcDIc0zi6w0QwroXm/ugLcJogfcgAT7RlRKexx38=; b=1VCQAeP4zgXcto86ZuspHYnbKu
	1lcF1F0b+nRhThrmgxV5ZQ6eTLiIeB+QVYv1z27ugLWqHUPPUmGwv8/W9OhaZ/5bZahigBtpo+vbs
	wknEmgxey/2Hh2Wh/0HWDPpwPJRQTUa68LNXbmO9DHGQNGUuYg7H7bvS47+CtuTvOxP/ghMT0uHg/
	zSvRSPi83futtdWGumO0HvLzSE6+cQfOzxp6KFSo0L03Ym64lrEWLqkgF6M2taYnYA0S86/etYpPj
	VsqlEiAWPZcU9X/ib6Mr9FF8I9AcMi/eRSeApvrph3BaYQliRUrtgj/kOfG7brXRpE3I8jxm7NTjD
	VFwo7+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTdF-0000000HOqB-2gmr;
	Wed, 08 Jul 2026 14:52:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTdC-0000000HOpn-44bT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:52:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3ddc2617574
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Jul 2026 14:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hO6xcDIc0zi6w0QwroXm/ugLcJogfcgAT7RlRKexx38=; b=I/6K8tSV8Tog1rSx
	QxTgfuz3V4KJuTrPPMd8xzxm2aaI6LUUSzIanf1NQbBAEsalbCXUwg382Rnv3p/a
	jlD5XnZYGzgz8Uq63XhVbDtel8TCA0glGeJp7uDS2/7jzS24G+OzLfripjdAvyUs
	FLlAFqO7Fr/02nlVXF7J7d7Yc//8R67dC1D06wli2yKvt05bnScaZi+H8ZaqYGwp
	W4BNxGV2GnQmaAUIBS9iFVnWhFsGQKOGoAs7QJFDxEy3zArlMLhqu81mxr2WIh49
	rrlcQ5TANwq1woAas9TIzX7YWOK0hKx1eMAwxXKKzh/eZDTNfg6thRCZ+7owT9yy
	0rAePg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9gqwa3uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 14:52:10 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a17baa4d18so940315eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783522329; x=1784127129; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hO6xcDIc0zi6w0QwroXm/ugLcJogfcgAT7RlRKexx38=;
        b=JeNbPUhT4iaDo6MlAP0oYUS2O92DgKtJOqolQEclRQucnEJDfBrJ99dWRg3/sQ7veo
         +ee6SJWDPWlCOKXdQVRwpZiKCx+w1HX/81QIuOp/Zgv3Id5BVhjAw7D4s4d2bu8Www/e
         hWCn+MYZ/bMArPnC/iTXmnP9xT+Oztdo+5Ssf8c6OiMX+vxH1e0eU+ETu8S/6Q3K70bT
         VltzJOkAQ1GndwQaCmXiYLlHuiUaj9GC7Sh3ZRnNRl5ON7+eK8kEtJ7Jra1egl73WedN
         M/02R09wenuAEIe9WshxngUlg1rQATcu3Qu2XQUIG+Hu0T4ISJkit/xcvd34Jvs//m7i
         wGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522329; x=1784127129;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hO6xcDIc0zi6w0QwroXm/ugLcJogfcgAT7RlRKexx38=;
        b=IDtHLKO9g7N7uNNxAocSjjiM40UD6aMyQiRtQL/0J0AHsMlC9EThDnqgyH2NETTgh0
         T+VeQO8SQMQEdAvpxPoMOutEuUnO0LGENg9acFu6KXetyweNcH0s35jb1Xcs4LJh5fQc
         vX4LwDW5cOgoNYa7z2aqPrSasDKLpVZ1+yk/Gu/nGt7QsUeYbLA6XO05H3gZt3Su2CI6
         FYZfbfzM0sy4SrXarf+bbilJGzmoQh5tTt6MFElPibMgZwjH0tuR7f+GJp4xkuDM0nY8
         44JO1VU1q4EOsdEtv8A12oxoc9B4kANatTbabNl7ldDxA+jze5C4fbBv/lKeR9ra4qlQ
         rWZg==
X-Forwarded-Encrypted: i=1; AFNElJ8amjwaU9LaZ9FXEgIYBmFtHO/BMStOb30FMSBeDGPWP0wz6PXV92z/PsfDt+Uw+i4xaIqnEbrbDiPyfFh87gXX@lists.infradead.org
X-Gm-Message-State: AOJu0YzMnmic+qCFDDPeLWB5Gqk0go9eTraGyagNabModgOvTR+ufyoF
	UaNgEmiEEfhK+Z2o2TvmYVKPNED0bbQEomAr9fK+e+ml4bBfCB9d5jcQ5XPeCveKkiKQNQfL6EF
	wpQc2P4HC/eccB4LDA6hJNpTF3bWGDn4WfBEAY6noLHfWLSArSQ+8mw8HXE1VpRk5DiHMLDI9Qq
	uFCQ==
X-Gm-Gg: AfdE7clUc3vaqIj4oFJKuRtHAPijc01+wm3pPiuG6JiuuRIniVmkKwocvaAIYQ2D2OJ
	fdUDRf1EOTemsqjAyboNELy0SeA0IAS3mAlArOlRTipbLZ6aulFrgxFp6sT9kcweoxl5a8uNHBe
	m2Lj7REXhswB5HcLcj3dXTk1XXcl2CYKKClHg0jUPq6GYMI1QeNYenDny/fxrrd7dkeobKw8R5T
	lkXN8qeVLgk5QAz9fwwYAzE+KOJmutEIfciR8tvWdfeZiSAakI9rK/Zs6sWHVtDwr+XN+UdAYs6
	cCD1CuUC2oH7TUFsalJTFTxnp0jXmeFT8Y9ogmOxL3IpEyo8Mjm9EYFCxMVpsV4YKdVvUDvbl/i
	f1J9k01MFhJokQ7qSCmT6rCS8ObykVoxK9LFXdrs=
X-Received: by 2002:a05:6820:20e:b0:6a3:21bb:17b with SMTP id 006d021491bc7-6a36da17682mr1672816eaf.58.1783522329613;
        Wed, 08 Jul 2026 07:52:09 -0700 (PDT)
X-Received: by 2002:a05:6820:20e:b0:6a3:21bb:17b with SMTP id 006d021491bc7-6a36da17682mr1672782eaf.58.1783522328951;
        Wed, 08 Jul 2026 07:52:08 -0700 (PDT)
Received: from [10.219.56.198] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb13d624sm16831050fac.1.2026.07.08.07.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:52:08 -0700 (PDT)
Message-ID: <4e266d45-ee88-42f8-91da-6253927686ae@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 20:22:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
 <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
 <nrht4irqtvt2vk3lrqvljonarc4kanht2nrwjt7pppsfhozffv@o4xei47l6gcj>
 <e8b247d9-d60d-497f-a831-a9772d27481a@oss.qualcomm.com>
 <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <phlk6zsxr7szdadsvgoecf7ewcqjkuaj5aeqmfqa4uvvvvnsmj@57u2pofxewuh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NiBTYWx0ZWRfX+c4Eoe1BOBrl
 KI73J3HcRXIb6sasJ3us037RKJa4KfOTePORgfETKQQmwUqCHcZYWRVve2nhHexUJDGRfPMAcq2
 6UEEra5zKXqlHEPGHmyBjExkpu6TaIleIwTuCJ0in1zQVBX4hSBJXg0u1c04ji0GG2+7h/GezJg
 dH+/E/lJG7srFgwiX+03bFryUNTO89YUiOHL+JLtwItSVJ5FVkKoLqoe16VpNqB9qw/aNNVPIz3
 OOcivs6TjhZ5Ydevt+7aDDdPDGGoECqVdP8MTPXuC7+nC5xBErke1eGxxkQNuENELXbIUygEtik
 8eLL3lAMBCs2EiCFLpMELslMbNOY1JzwCGb9i5sHAQBbJgswAdlkYRFB51mTUBP7MRQRHjemAd8
 LOtd0jezuqNLsre3MyXexDEOomFebcG3T3NeG/Md9hZ9MfIoyLy3SmTa4jxDkQyOurBLHGf/MPY
 8tACzmnNhdqZBw7Mt3g==
X-Proofpoint-GUID: _OywYYh80g3yGgeuv86sVZcetOk4r9ZI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NiBTYWx0ZWRfX2i289XpJdL2+
 S5uFRz3mgBl7B3+mQdq/Eh1Bxx5uXv+lzIgRo225Ej3lTZ1KoY0o6ps6RXdFG3SoQg7NHWDdsHJ
 tRz8HvP+U5B4sjR6C9QUKy1Oz2RCwRo=
X-Proofpoint-ORIG-GUID: _OywYYh80g3yGgeuv86sVZcetOk4r9ZI
X-Authority-Analysis: v=2.4 cv=Wf88rUhX c=1 sm=1 tr=0 ts=6a4e641a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6nhsP2hVHzjk3Kom7RcA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_075211_023884_E75BB700 
X-CRM114-Status: GOOD (  23.26  )
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



On 7/7/2026 10:12 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 06:06:59PM +0530, Bibek Kumar Patro wrote:
>>
>>
>> On 7/6/2026 11:09 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jul 06, 2026 at 10:26:34PM +0530, Bibek Kumar Patro wrote:
>>>> Some SoC implementations require a bandwidth vote on an interconnect
>>>> path before the SMMU register space is accessible. Add the optional
>>>
>>> Why is it limited only to those SoCs? Is it also applicable to other
>>> Qualcomm SoCs?
>>>
>>
>> I was hoping to keep this series focused on the core infrastructure
>> changes: the bindings, base ICC bandwidth-voting support, and DT
>> interconnect properties for the platforms currently supported on
>> Qualcomm Linux and have been validated so far.
>>
>> The additional targets have not been tested yet, so I'd prefer
>> to add their support in a separate follow-up series once validation
>> is complete, rather than growing this series further. WDYT?
> 
> Then it should be a part of the commit message. All SoCs since SDM12345
> need to vote on the interconnect (and then, in the cover letter mention
> that you convert only a few of the SoCs). We possibly can help with
> testing on other platforms.
> 

Ack, sounds reasonable.
I'll add the first platform onwards which interconnect voting is 
required in commit description.
And update the cover letter to clarify that this series adds
support for the Qualcomm Linux-supported targets available today, and
the list will be expanded in follow-up series as additional platforms
are enabled.

Thanks & regards,
Bibek

>>>> 'interconnects' property to the binding to allow platform DT nodes
>>>> to describe this path.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
>>>> ---
>>>>    .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
>>>>    1 file changed, 27 insertions(+)
>>>>
> 


