Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4087D6D220
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXBjavAzr+b344rqXrPUfRCnf/+ZQMxOzlCBRlY9bI4=; b=ae9nkcHwvFtI9HTRXgifzSlNEt
	6cArEW3LpjXdf9rflXuGkUOIUARmB/B71DIl0MUbpS3/HPlpinstdeBsMDWZayyW/ezFRtCwwIL58
	hCGsRO5OPipg9MNtWtP1fvWa3YasJeK0es8g3uzyvjZSaJe/rQGlumQoOs2mzFip/KR/F04wMlrQb
	zxBm/X7k3vPqTjJ6EWZcCFSLw1/Pj5g75/vIBpZAKGm+8/uHdp3w39u6D79GwremCWX1vLtDnr0QY
	1kGLSccocirfAEHmXcX8bClbC8OihiVgawc7hI32buKm6L6BesOWN44Vi/bz4BmLVDeGrYw8vzX7A
	wqdbCdJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEEL-00000008YDA-09V9;
	Thu, 18 Dec 2025 13:39:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEEI-00000008YCZ-3frE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:39:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9PelW4191394
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 13:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iXBjavAzr+b344rqXrPUfRCnf/+ZQMxOzlCBRlY9bI4=; b=ceZazrGplkJgGn4k
	g7hXFkAeQ2jBeSnDxZEy1vQTHBTxuhby02BQuDiGOOKJkqVXe5E6Maqz7D213Gum
	ocnw+GOeTQTGwuLcbDoULUp8HN+F/CoSpKwXrdYF3zYJxE9yHP2kW16wHcxVHktv
	a7b5jrTRQ/hIAssAo/XIKj48VfLJMx8YQQKcxA+IimfpTi9uBRyIziKFses9TDN+
	hXGhsEZ6ZigaV8KDeDo+Wi7ZDzUZpvUsl2HZ3xarAqxAVQ+a1rPTsRsFa1lyeXLd
	N6riFxSR0MacQFGBpdnQ43dF4+wBU6YyEYGUWygtjj1ioOKk1puQRlgv0Gz2jXQK
	I+Tz5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b47pkj57j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 13:39:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f3564e2321so414821cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 05:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766065179; x=1766669979; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iXBjavAzr+b344rqXrPUfRCnf/+ZQMxOzlCBRlY9bI4=;
        b=KpvGX/TchBEU5JlFDsgYqaiDx7jnICdG/7c+rKdNXvh14S9Pr8hXcNqgxvaA8KMwE/
         OMTa8EHI11Pxs8Yrl2K0p+6saXKM+SDJt+i75y0JU+VtbjaM+A1SFQdpjXEsLKReyMV1
         2waMM1ejghDTgPOkLhq/C2KBRgq4AxM8dOZ+PHdcwyrNVDTC+Eio9sxXRFCKmvATo7Tk
         FNQmoVMv+Zpkd/p7bQu0LAKzdLLUFA3LTbVgR1RuyEnNv9L5cTIO94K1c9wwhsF+JAH3
         DGoXzlDYl5gCAUq5HvWVdh7/6j4mo7HFWbs5xSUE6x7QrHfsnkOP9Cwvbr/hIZpGCBZZ
         ZdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766065179; x=1766669979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXBjavAzr+b344rqXrPUfRCnf/+ZQMxOzlCBRlY9bI4=;
        b=Gd4kId4efdRd+0DByjRuVz5A4RqO/D8TZdV4q+mh0stYLDB66qQ4OGe+fKRJqpImTb
         mGUXbt0R/pLd8V6hS9TsoVzcpBKD2c76N9HNQ47g9sPb3SxBzDOeGS4k6DifPOdM+DBc
         i95gByADPfz3ijBCSyOQxrR9Gd8PvknsI04TRhgln1zdvezAkxWj6ZbK7JMYAy28jpcX
         Nc6LQAAADOmbePv34koCHvzWgXZsPilURaVsMvBoRf3w7VVcpcgeECYYHTNyEfub7BJt
         yx/BZ+Q0FWkOKyyunzZHa1Sl05e2nkKy4fcoUfmz2l+srbV5b9rKaqjn059+5yfsIrF7
         v86w==
X-Gm-Message-State: AOJu0YwGBGASVui6ssznbsiI7TOUxh2sC52Ag6aCndEe5MoLBmJzwdSi
	skzftcKjYGVhz7xGUw5/r28sjmFTw5v3GjhbnXUXPg/JiTBnpS47kfsTgTwFnJY9saiPT3Pl9px
	AWYN2uG8C2OQMfceKv2vCEf5Z3nA6yI3ZL2wgIQM/0D3zREAF78FsL4SVr1rne+ZyRXZemfKc2t
	A1p0eE+xGfeA==
X-Gm-Gg: AY/fxX6zo3dLteeoDv72oYQOBT5uILqBe7CilxwwCa2fC70VIMugzqk5+k2bwerRVMa
	YyI2rP6c982ycd7yogR6cdWgH2tJZWhymTnfQG3krjSadpWwz4fgVqsUnf2z2qFmTkvM6jPf3Td
	H8GXMlGzD2HmRRNAbeItWIaa4Z0Rk8i9v5mB/heobTEFoyFNQK8RLVdx1ghg34QklN3zC+HFCIZ
	qSBR7ndDVo88g2E9Mcfc0GvPmao5KbKnKa3HJ4WlsHsPqpE4GegBk2L9rqF1v9txinbHd8MAtA2
	STCZOfs6yeqmdxRTJFfsCSWgpbM5yh76MhlBw8cVb8KpFMC1RGBCGKMMiFNk8085MvilqTPvWqX
	nmjPokaiQJlWbksLkd0XRjFfrHcB7cFoIbhr5TzGh6RvuIqBlHHPg0EUKoGcMO/YTPQ==
X-Received: by 2002:a05:622a:43:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f3610818f0mr19712311cf.4.1766065178768;
        Thu, 18 Dec 2025 05:39:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTeIvy/NjnisAiBdGVDUI2R7PT5nt+0PAwtdl6wvnjsNYp+nDPPgKkDdnegJEkAxI51ztlow==
X-Received: by 2002:a05:622a:43:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4f3610818f0mr19711931cf.4.1766065178347;
        Thu, 18 Dec 2025 05:39:38 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b5887d4a0sm2459517a12.23.2025.12.18.05.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 05:39:37 -0800 (PST)
Message-ID: <9964bf4b-a6ed-4429-8c70-520cd19781e9@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 14:39:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
 <20251216062223.2474216-6-quic_nihalkum@quicinc.com>
 <5bd29b5f-6fcf-428d-b451-698d92f0883e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5bd29b5f-6fcf-428d-b451-698d92f0883e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: H2NRIb-LVaGNt4v3q5Hn9Zb4VXs0UATS
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=6944041b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lOoz2d9cngm9sXlBlawA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExMyBTYWx0ZWRfXxpcG17u3zkkk
 032IX7tRDInELS3VSOkUsqUS2O1as6bnBhYrZ93dOovsIFDEho5wcAEq/T+7AUS1x/7rGx5COIY
 p7U+GMXfAuidM3BcrEVnA/OtZ8SHsdV0QxLqjUc+5yW7k5nt5uOdvetgTRSGUK19ItrBoewq/dW
 PujkJ21Rhf47gmQMcY8uqF49excxI8aFl4n4XZ6ku+wFCDwv+zcwlAEsnKfAeEI6LYdbVDRgANb
 r4r1mfITspnVg7dU80qWwwu1Gqn4K2/xGzGKjRR0/OnatCbMhrhx3/wP9HCslmRh9hUZWjC/hRi
 0n3HLin16nQHEW4jJ21KRD6vSudtGFwaN/QpcxS6BCL3nV9/p+n6zosrHxc4xCsY+/QwkyHb5jj
 P8Gzq/ZNfKKzjB2tn1sblvOULXwg3A==
X-Proofpoint-GUID: H2NRIb-LVaGNt4v3q5Hn9Zb4VXs0UATS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_053942_925171_89C87715 
X-CRM114-Status: GOOD (  10.99  )
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

On 12/16/25 8:35 AM, Vladimir Zapolskiy wrote:
> On 12/16/25 08:22, Nihal Kumar Gupta wrote:
>> Monaco EVK board does not include a camera sensor in its default hardware
>> configuration. Introducing a device tree overlay to support optional
>> integration of the IMX577 sensor via CSIPHY1.
>>
>> Camera reset is handled through an I2C expander, and power is enabled
>> via TLMM GPIO74.
>>
>> An example media-ctl pipeline for the imx577 is:

[...]

> If only one of 3 defined from 4/5 regulators is used, do you really wish
> to describle all 3 in advance? You may consider to remove 2 currently unused
> GPIO controlled regulator descriptions, and squash this change with 4/5.

This is useful, if only to surely park them when unused.

Konrad

