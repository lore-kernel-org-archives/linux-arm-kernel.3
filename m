Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E40D767CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DKR9AVeR0G3xfx3EGv4Fd4mJGH4v4vlNnGmLfHUTiE=; b=iMoedjZnQk/+OCEfLiRztxy4u8
	+nf+pQsHROkTjsidg3xxg6z54kfJhEOPDYELAEypkzXRZ2sECxZvzHppiarpiqXvhBfKQCobUeXNB
	xS3Crqr7FZVR0HKDiYSxTSinnEZxHDROyHIzRWtLL/WD6Sme8RYIndC7OMxa6alG6rJ1h+LOY+naJ
	/wHz7n9jGugf4Y2ZCVhS50rbDpQpxawepwx+tHJBRyAOzMmRtTKe1NboZFyqPJt7n35A5Duxe6PjF
	lB7xTvBHKJAH9aAUIaxWlv9h3xGziocnlfysbvq8FdDrgJe8ZEH5tW5zmUtIp6E1xawbCCC8BZ9uJ
	wQIeSDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXtV-0000000A8SY-04O8;
	Fri, 19 Dec 2025 10:39:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXtT-0000000A8Qv-0e9x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:39:32 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c39Q4101088
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2DKR9AVeR0G3xfx3EGv4Fd4mJGH4v4vlNnGmLfHUTiE=; b=aa9J8c0Q+s4A6fxi
	RpB373kzsso7Q4DLJJAahDc6UK1L8+3B/dd30QFSYPUNyd11k60pNBjPqqI9B3Yq
	k9hh1cYboVg8HxEOx+SHQxG+7aCtLGwD69FHnHSBaae7Nr1830F4ORaQumyakOci
	fHNg1tao98C6RYYEwl8Gg36E9Dym4oGvnhDBk+auUrBBx1URKZUvFDqLSNQkpqLo
	yO1/RnyvPBp/mV9CL3v+LfhtYy3U011LGADnFG5GAxi4HttPfqUBM3zaBL7p7KTd
	YOlN3fw7o83aej3k+KIo/67qlXOS1n/Pyz5Ial4QDyws2HkLIYBgFnoaOK9ySDrL
	YMfb7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c2by3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:39:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a08cbeb87eso22785815ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766140767; x=1766745567; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2DKR9AVeR0G3xfx3EGv4Fd4mJGH4v4vlNnGmLfHUTiE=;
        b=Br8qqq5UeyGQY5rDEe2YahiBRj8cuOfm4NWpbvggPzapqiPLgXj/SOKgmlOe/BAmhU
         9456Bt8mC4/otwHQ4YVDnENp1XAXuwX2/fV4AhDSwaj52I4lxUQ8lLR74IVN4ylfYDkX
         Hp0qoBE62O/LgdUITEnYqoWn0CjWn7wrXPy869oY2afGnp32Lh4/E7qitvFyEmPV7M7M
         8oX4Cpr/hRG7qcDr/REaNKB3mwTlMOGnwcS9tIek7uabhgNieGqFxbCKhFyZAkwsWEPw
         1E79EiBNC4ZzZwUFv7Clel+mtlBeCcQq+2GBxri9IVPTlUQsjivNdxyq3MFx5Cu1ZL8/
         jWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766140767; x=1766745567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2DKR9AVeR0G3xfx3EGv4Fd4mJGH4v4vlNnGmLfHUTiE=;
        b=OBt03l6rcJbG+RVGjmto2IC/uNl/HgH7eOMlM81lIaydJmFK4F1zFFizA9bwSEEQym
         YeubY9MQAnhK3qkzvLAY7B81dRFWbN9FDWpF6Xs05gieq4WhARuFbTS/G7n7C4gabhc7
         dRwmGdFzfDlhDhFoToeIs/bsfdi0HP+wbxgkUu8oCtYoCK8EGo7tWwaQxoOn9gT1vdeP
         VsCUQEaAh4WMfxmRMQNIjsqls/zCF5N7nEV78z2P9sNV81vmucc38S1Txx+pyOAyt8oX
         7bizxyLDOYOPeVb7FEc8F7cP55ccXNXoQeCOBRP1bdNI2hm/3lCcypHYKLy+aQCBcYhl
         fonQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8L7QhKfbg41H99f3CSg8x1cIjVBCorCGsgQqvxQqdpZn3qxrhyN8keV7KHvO67M3FYL37yTyyFguTnFrOfO+r@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/QvWlDNrgsQBTS/q1YTbj/tsL7BXhTawoHuwg8+Q84T1Crh3N
	qMFpr85FVSSD4HL3qAl2dhbxq/8m4iKoJANPPspmcOG32UtenncY0aayCma/WvwF0aGh3xduuC3
	FJ+42bZaeG+CnhonOYAHAXUgjAzkPWOC57BnT7vJsRvXonZbJtiikl6ezhnwMCFtHhjDSV9lt9H
	VDOg==
X-Gm-Gg: AY/fxX6WRC73b4do4jZ1vgfQJ9fESy5HEyruU5I+pMyKmJ/D+zsRN7+6NeCURiftL4S
	a2fR3Jzj3om6lb4Oem75L7/0XyXO+9qkrwqet2w3sBEL9xBMaOA6+rNYJp91gHV+1ltDN82/i45
	q+9rOEyoRLNC/7zFOpi7zPI7pavSPAX6f5ytifk6u0BhJOS17bGhoIjSD4bVCUKKPP6PhNIfHka
	pcfKBXZ86H3fYHdANmuES4q8llp7K5YBLnLxF/gsxyP5GqmfBAtqOVdSbSsQIr97raLmpDZXihZ
	0LcxFS2pHOjQ1mI0Hs+Chb2o6ydHMHW8M/4Iwvvj6/vfrvYpjP+MlogAd3iUDGlkl2pfJUgQe2U
	8DTjI/cTxZWRTtEH7vwXmChNa0603PLcBVUnqeA==
X-Received: by 2002:a17:902:e884:b0:2a0:b467:a7ce with SMTP id d9443c01a7336-2a2f27352a7mr27092815ad.36.1766140767100;
        Fri, 19 Dec 2025 02:39:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHjjNmZyZL1M8MmrxLZpRtoEvO3hbj9TdfoS3U+i8ntekOrSW1gOPRLwiSGrbGBtNeQBc0kQ==
X-Received: by 2002:a17:902:e884:b0:2a0:b467:a7ce with SMTP id d9443c01a7336-2a2f27352a7mr27092615ad.36.1766140766585;
        Fri, 19 Dec 2025 02:39:26 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66472sm19494225ad.13.2025.12.19.02.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 02:39:26 -0800 (PST)
Message-ID: <57ab2d5d-5aaa-4f9c-83ae-0f7ebc1e648b@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 16:09:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] dt-bindings: clock: qcom: document the Kaanapali
 GPU Clock Controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20251125-kaanapali-mmcc-v2-v2-0-fb44e78f300b@oss.qualcomm.com>
 <20251125-kaanapali-mmcc-v2-v2-7-fb44e78f300b@oss.qualcomm.com>
 <20251126-elated-stoic-scorpion-25b630@kuoka>
 <de44560d-4ed8-41fe-be7b-56412b933a8c@oss.qualcomm.com>
 <fbe39eac-7c92-4a08-bafb-31e5c51a0613@kernel.org>
 <503f445e-0d12-407d-bc77-f48ad335639b@oss.qualcomm.com>
 <e8bdb176-b6fb-4dd2-8b5b-9da8073fa915@kernel.org>
 <ca118faf-3451-4b83-9074-82bc5e1f731e@oss.qualcomm.com>
 <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <3e8128f4-3cba-4c13-a846-e5f1638a1e0f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NyBTYWx0ZWRfXwpOOw/ratLtE
 0yM1eRc06ufcUzC9+M1dN7i0fe2S8GYv/GNlvQ4k2TnZXifwEMR+vnyzf5RPGaC2NZuX1kkD5zk
 YQUgwh5/thBjR5SVdk7whEnPJIhI7s0LdnKYltfIQoQMwjXN0jlwYmcWtIBujJRp8Xj3ASNrsmw
 MLoyaDQiA2mvKyXltLhLPY5T1Q79Hr2lXoMydC1CaZO7jXLqfHdfWkAzjf2Mr9EGESbwCXbTKou
 ioewcb6UdrrHapUcyFe8K6MuiT0YaCZCWGm5qaBIG4pxLraLPE3WfPccv3Osx56UByfisyH8feY
 2PrC2HoD/RwJ1QqQnH0lF7jwnmEKtRYyuOG4sELkZpy+CQ/xCCQoZg4I14/vJR2j8C/pbubqZ4b
 FTOdoOxYUBXdGdxKwN+2C+MS0MlBSzZOY+x4ZNTDH5jwlXe+fzdWeiCRaIuEn8EwTwCcNTaJlFX
 8DGbeWaQXM8RPn+xS8Q==
X-Authority-Analysis: v=2.4 cv=dOmrWeZb c=1 sm=1 tr=0 ts=69452b5f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bZysObWQuULb7_ZgAGEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 6p4JDBrK0UQKgGL6_gvDx-8geqsxyGYe
X-Proofpoint-GUID: 6p4JDBrK0UQKgGL6_gvDx-8geqsxyGYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_023931_258960_70EE5A29 
X-CRM114-Status: GOOD (  16.21  )
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



On 12/17/2025 7:24 PM, Krzysztof Kozlowski wrote:
> On 17/12/2025 14:21, Konrad Dybcio wrote:
>> On 12/17/25 11:09 AM, Krzysztof Kozlowski wrote:
>>> On 17/12/2025 10:32, Taniya Das wrote:
>>>>>>
>>>>>> We would like to leverage the existing common clock driver(GDSC) code to
>>>>>
>>>>> Fix the driver code if it cannot handle other cells. Your drivers do not
>>>>> matter for choices made in bindings.
>>>>>
>>>>
>>>> As it is still a clock controller from hardware design and in SW I will
>>>> be map the entire hardware region and this way this clock controller
>>>> will also be aligned to the existing clock controllers and keep the
>>>> #power-domain-cells = <1> as other CCs.
>>>
>>> I don't see how this resolves my comment.
>>
>> Spanning the entire 0x6000-long block will remove your worry about this
>> description only being 2-register-wide
> 
> But that was not the comment here. Taniya replied under comment about
> cells. We are not discussing here some other things...
> 

I will review and add support for handling #power-domain-cells = <0> in
our common code of clock & gdsc. However, the initial intent was to keep
the GDSC phandle uniform across chipsets as this is a clock controller
by hardware design, which is why #power-domain-cells was originally set
to <1>.

-- 
Thanks,
Taniya Das


