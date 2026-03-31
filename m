Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC74FF60FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=; b=t5a5rAuo2TYsFwidjBo1HAIt+s
	JWlNHVR1UUhzog2hg7omx9QWezp/9SYxuPNi6r2it1OePo13EBzPvb8rSBxzkkLkmc8V5Wet3q2zf
	n/vxilj9LsanQd/7WE8ziJkOiioq0+/FTok+O78wv0hssgAK+9P8uijKwvjf8VkQUUFhwdbAk8F/W
	FXKqvwrk5XgI2hKBrgPdlbu+pc7vS8Wv2+1jCKKnSBYS180Fjw93IglbPPiSJRLc8birFT9PQk6eV
	9ZkXF7OIag5ATsje+Wp3QE+2smzE4+UP/p1BqS8bOpXWro1AguuOMMGXcsudKlhfIIySxYnmYGdZ3
	1vplkBqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W9n-0000000ClZj-0W2r;
	Tue, 31 Mar 2026 10:17:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W9k-0000000ClZP-2jZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:17:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VAGOex1090544
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=; b=loXJfLsleyyK2lYk
	uUqEUWFp00l/vt2tn+U3wXTNfpw2JRYo4gzMgTuy6J0/uG8k+4PKq8OHAvufrzaJ
	6y4BNNrQ6nmC3zp0zQXKTurNGkkcaM/r6N/Qkhed2fa1vlRN+Geqt5d6Q9YnUCyz
	G0yn1c50zJoKaXna701oSwDAnh7NOB+GySLqiO1brg+Gi2EdLRVYl+ZigbF8qRjr
	cR61pM7/rrvBRksOMRhy0QPPlxIsJBFzSI7SNSDlfQwezPlVuf+dg9BovZhsZxwD
	60pDLZEkbp77A0gHRfkVlvAYKW6ZDkLB/3Yhke1+QkAfcEDe0M45BZrQSRkTYXmt
	N/He/w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd47qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 10:17:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89ed6f0c71aso12077006d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774952227; x=1775557027; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=;
        b=Z0ed57rImjnc15CgaUAzEVgKMYTXI+ugWY1MWcapZdfmy5UbjiNPSY2eBFBL0ph4y+
         QRROMHU7BSZ3k6MCGrsLEysZcWTc7e6lCY1FiGFOkGho+lTTndvN7R4wxfkG56wBKkws
         sPfD1vvdTHSyy/wbuOdiPJ7hV7YyrrHgLBuED7BLfUlkDWUs4akk07zJK9D3TWWgISaV
         HdEnFa0oXrOOgRYwfo9yhzaj5VRFtl+xHas1eSLnjYo6Er2lES8VI3e4tpGvRyjYri3d
         AELHgjAGJIdHoIVlAq76QBy6nE3lcGnsW/dZQqGM6DnD/Mw9VMiv0GKlt3KA0YkyIMNz
         ptqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952227; x=1775557027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4pKfZf1Rj3Vm8qq6JVDSEPxGWYp4S4vfpw302SHdg4=;
        b=LZGQj+YtS+UpxmeYTjeZ9B1WHTfgTecdJwJzE8ueBXNth+3hHQ4/UlTu6GvS5LUsTL
         XGJHBebEyofCTQCEG344NMh+bY51ww2mqepzo5mTVvXWR/dQZsAql9eosioyUvvCC3GZ
         1BxIGdVVqK9eBxEkudcH0joczECRprDYM7KqKc20p4eTuFJFLzHhVLpnsAlEMI0UE3xd
         PlEWHfTU/KKnBdmz14fWutCRh/FIipTeOSGnjPk6V2gk5EVLqL4GFNWJsEgO0zuNdGMV
         8Z3bDxERmkYjbHTEEdn/BT8a0ARjRTN4j00Ya6TSm+pjn+zbb76MErtRQKbrFNi30Te2
         vNxw==
X-Forwarded-Encrypted: i=1; AJvYcCVAwvRK2P4IWRaxF6FuP70OrJZawfabLTxcyMkstJiBZ5snt3bbuHHhjUHLEWEBLIgzMYytWFTUJkTIPdH3D5tQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzMPoRhDpxfurAxPnMfdV/2RzlwFllq4DchFh/Apg3che8nYuvY
	IQqhwNv3qDKGN/BdRkcbPpd+rbRNpbx2RHMjBlXzxe9dLdXCAFkCGv4qrl48qL1Z3H2OnK4tDQZ
	Docwzw6EUlKIGuSF7jngny+hbgI96mw89rfpFhoA77M+7c7famz9J1pjXFEd2mOuaY21EinRKZG
	cWjQ==
X-Gm-Gg: ATEYQzymF9w+S/OVYGEpOAiTfMslgL/UU0NoquJsPV8O5NgcLd0R8KvuJWm9wakr2VZ
	pqncUxFfjqUzJhxN7+nruxwXUo7xW2C9dGp+1+kbehTHUFnKIgo/6oAyRiVZM3aCEXTvXBsRqkh
	BHjJfiRK7h53V0O1l9xTc7YqobcDVVUMacRb0SM4avrpQeUUaSij0w/JVLQB8aEwBsZM6Ej4zv4
	ikUg3UccceRQ4Hl8tBPvi+yJPnVleG0+YcWBOGRABzx6tTkawG8QyGjKEcoVZXA5LAcErYCRXRY
	5Sz1ledr96leZRJ4KFedyU4jSCUh6omcdMD7LBcIPBqm0FbIHq46xdyKw3AJScvf+WsumMEkd0G
	3QLoAWdrgci6llliJUJanzHr3Z3ReuG8PnrRgFlgdsfxL5vFHm9rD/bPwehZnRMkG/xE4IJEuFV
	bAasI=
X-Received: by 2002:a05:6214:27cb:b0:89a:45d4:4e42 with SMTP id 6a1803df08f44-89ce8f96a82mr171653066d6.5.1774952226920;
        Tue, 31 Mar 2026 03:17:06 -0700 (PDT)
X-Received: by 2002:a05:6214:27cb:b0:89a:45d4:4e42 with SMTP id 6a1803df08f44-89ce8f96a82mr171652776d6.5.1774952226451;
        Tue, 31 Mar 2026 03:17:06 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a6744sm377853566b.30.2026.03.31.03.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:17:05 -0700 (PDT)
Message-ID: <3e3428e2-b07e-4d65-9cb4-afad1a943bb5@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 12:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <a746be68-4f5d-4792-a896-bb693d029ea4@oss.qualcomm.com>
 <6ca492d7-c041-42b0-8f41-cd29ab7b4bab@oss.qualcomm.com>
 <51a05279-1759-4c03-8bba-835a9e972ccb@oss.qualcomm.com>
 <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <445a53e3-f467-40fc-9b01-dc776555c3fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wakRmLmBz202-zvSjv_01MSEZGOpmd6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA5OCBTYWx0ZWRfX3+2huWuCr7OX
 tZc6R1JjAjYuXVDq69Y/879FZFjWwukPRcnYFYxf5YffABIWWF7ZNukCesAkJItbvV/dVG8ZrFZ
 FcmO6NrCPjXa+eTE+y9Wnt27KbtVhK1ydck61idAncP4voGJIXhyF1He1Xx8sa775MGabpNQvCv
 aP4hG1ypbL/JPsqSBmbFAgi+EsfS8FTCmDP9GSzjWdvRsWa2cgDZR/jxch1Liyx5igMcbHoshdv
 EyXdBRaMNkdPimrCBzYLuK7spiSr2ZIJ1BmFvdU7GxqLUtvW0VEtPDrQX0ESwZKjUnhvbmhBAmc
 DAq2xhfIlJ3k7fnLLLFFIbt9ptdTvscbMrYr3OZa6W0Kz7gKOuCrEJ0RTGnnK8FGnPjBglkqzrB
 O4cFsODNdC8mk2x4Q4WIx2ma4k+A5XkI3c483756BRMTiKO6vFcJMeFVl7ZtUlO5kTdArXBH7+7
 3eW1+5+WdZ+N1agiqRQ==
X-Proofpoint-ORIG-GUID: wakRmLmBz202-zvSjv_01MSEZGOpmd6H
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cb9f24 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=y-Wd9Zd1aYVehlAUloYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_031708_701516_83069E4F 
X-CRM114-Status: GOOD (  15.61  )
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

On 3/31/26 12:13 PM, Krzysztof Kozlowski wrote:
> On 31/03/2026 12:10, Konrad Dybcio wrote:
>> On 3/31/26 12:09 PM, Krzysztof Kozlowski wrote:
>>> On 31/03/2026 11:33, Konrad Dybcio wrote:
>>>> On 3/31/26 11:17 AM, Krzysztof Kozlowski wrote:
>>>>> The static 'struct qcom_cc_driver_data' contains probe match-like data
>>>>> and is not modified: neither by the driver defining it nor by common.c
>>>>> code using it.
>>>>>
>>>>> Make it const for code safety and code readability.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> --- a/drivers/clk/qcom/common.h
>>>>> +++ b/drivers/clk/qcom/common.h
>>>>> @@ -49,7 +49,7 @@ struct qcom_cc_desc {
>>>>>  	size_t num_icc_hws;
>>>>>  	unsigned int icc_first_node_id;
>>>>>  	bool use_rpm;
>>>>> -	struct qcom_cc_driver_data *driver_data;
>>>>> +	const struct qcom_cc_driver_data *driver_data;
>>>>
>>>> This can be a const ptr to const data, even
>>>
>>> None of other elements in 'qcom_cc_desc' is const pointer, even though
>>> they also could. If doing this change, let's make it consistent - so
>>> shall all of them be const?
>>
>> I thought about it, but then it turns out that videocc-sm8550.c has:
>>
>> video_cc_sm8550_driver_data.clk_cbcrs = video_cc_sm8650_critical_cbcrs
>>
>> So we'd have to duplicate the entire struct
> 
> No, that's not a problem. Pointer is not modified and we speak here
> about const pointer.

Right, I already had constifying the various struct members in mind

Konrad

