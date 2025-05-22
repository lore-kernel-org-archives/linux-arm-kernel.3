Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E29BC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 16:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4TU7tpZlMQ+Z/J8LghDjXFqurzAXCCyNj4y5yRCbxxA=; b=WC85zN1H5ag5rS/KGFQp9Zubl0
	2zUY2lESSsg4c2VnRA16QvgXQ8QAPlsHNxEgRDKUv4knCjT+VUrdsGGVnftKjk16+Ye3r5SYTMOq1
	sDrPYXTsYoLNMF3DbX53561i/e7NyJ1N1BiFypIZmMYwckD3+XAHJ0ywosa3NjaSDmTKGYsu0/xv3
	xDoOjYRvR3fWyjih6Jx3ZBYw0n0ria00H2N1MYdxXIY/b8sodfxoO41OyzCywR9Vsb8llVpighIwO
	hnoub4y5o3SpFuWJo3elSmFefdhkSLzj2Lz2FkaldRoHhVySKQZl1xUzZglemTFOImHBbdN/RuToz
	JFcI/aDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI8lp-00000001Yw8-06rm;
	Thu, 22 May 2025 16:27:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Y6-00000001OAa-1zUt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 15:09:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7SpEL006789
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 15:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4TU7tpZlMQ+Z/J8LghDjXFqurzAXCCyNj4y5yRCbxxA=; b=UPdtHD0t5rzG2PyO
	uEeYfmAhVCCytztDb7YFG43djr21rHuLH/C9324MtN/udM9cjQ4LGYHjU03nP/Wk
	FsRhYS9dLwQ9iG/QZyFyz8qQi535GH9OD+iTbNmL8OPf8HhTzDLSeOZruddMzMSx
	VZobcU01dbMxTRMn8RLpnskm2mNq0ZBM6XZIc6CNUtohE7lWZaAhd4/qzRjTvUEp
	wunHxEe9L9pJpAOVIj/jj5NSGlHPui9Y0n8j99grPRh5RYyuu/gVEI4e5TSgEDgj
	rVvizRGnDurLFSqUKMUnkjHYIiqZfubZb0MMi3at6lQqYKPgkuYI87wnPPB+gD14
	O/20eA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0pvts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 15:09:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c555d4ad75so58139785a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 May 2025 08:09:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926571; x=1748531371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4TU7tpZlMQ+Z/J8LghDjXFqurzAXCCyNj4y5yRCbxxA=;
        b=lJ7LE0iZ/HIENQNl0t3z1zI2wkCryKktKFzuj/6YxPCwJi7bQcB+sDRwVZyLtItDSU
         tKotKYHrubdoVuzZ5nyyLy7011RYI7YaNJTB13fbT1aHEphLhEksFAb5rwpU1i5tzqbw
         5sAND2AVPPNqbnzVRkEVnJ3BsHN3jepZWYtK4baLxB9uCoqpt6OTQX8aZbD0ltSPVJXZ
         cLS4cjHmVqz4kKDq26XZhpMlCeCM6ezxjAzVd3zLPTVZoOHmdnu+O1zwJYH49Xeuwg85
         mdLmhuEzxksbOe42Y/M06PB4RP9Dp0xDdmoYDeYxSSN6x/JOJcMa5aeVr0DBhUZHMOPC
         pCEA==
X-Forwarded-Encrypted: i=1; AJvYcCXE+MCoR89nw/+VkGxNWKQqRiS9nxsiyM1HCTPEb0z3XJYKFq9VbYvMEFlI/92QxDsAyjTK+nFpKPpRRLL1wmY6@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0h6qzU0oSRlbgBfKfrPeCXy7xmjmHv3fESkZbWuW2t8n3qkRJ
	9X86Vg1riPBHXbF/SmUYXbLGjMMYLdOKDliQvpx+2TvN90LAcQ1k8IhZTTFwzBv9OnXNb+bTkf5
	6el9WaLYdEGCH+yV75sp4NxpK+BUA26Dr95fgmOXKw9mOOO/nGFIkjfnLmEijnUry9MxoaB3EgR
	ylUg==
X-Gm-Gg: ASbGnctbyUelAALy3IlMV2BmV37q1ISoIUtx2mCMxIeW5u8SXwRBCim+4afZtXKCqXu
	pfGjbTBclhgvIVn/BdprOpaOfzThXBmKK7+tGiJw3bUkiFRuZLUMw+8L81k1ySUpqcCf/lbREaU
	NDxieXlu+irDLb55omZhbEFmQQ2cDC+9owClS7rJ0eGkn62QDieSdeYrtgZiJk+XP2HHZv4WHRs
	EpZ/d8zGN1sW1GAZ5crqixMmtx751TU09mq43gBqwd5OUhwbJ8ygBn6wHUtAJVCvibijY5yS5ab
	vZQ8DSRCjRjsmhYvm3Sn9WQVfjElLsH5OTzGlWqJpY/nfLGO3PtAa8OANN8CtxIywA==
X-Received: by 2002:a05:620a:268c:b0:7c9:256a:953 with SMTP id af79cd13be357-7cd46731135mr1464769585a.9.1747926571553;
        Thu, 22 May 2025 08:09:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbVvSMIebTkeQbAVUwqeqJX7z9XwZxFk/FRvDNQuJYn/rrDTOUl3Z7yNgTaJEQuswHZtywSQ==
X-Received: by 2002:a05:620a:268c:b0:7c9:256a:953 with SMTP id af79cd13be357-7cd46731135mr1464767985a.9.1747926571210;
        Thu, 22 May 2025 08:09:31 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60284aeb666sm578997a12.60.2025.05.22.08.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 08:09:30 -0700 (PDT)
Message-ID: <423565b7-6b11-40bc-accf-902e80314300@oss.qualcomm.com>
Date: Thu, 22 May 2025 17:09:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Song Xue <quic_songxue@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Vinod Koul
 <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
 <7f82b59d-f1c0-44ad-a623-3dfb86c95c7e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7f82b59d-f1c0-44ad-a623-3dfb86c95c7e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: D_n3O__oo5YRElRMOmYyCE2Kn2Fru2ix
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f3e2c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=yVuqqs4s3M2hehkgkIQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: D_n3O__oo5YRElRMOmYyCE2Kn2Fru2ix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE1NCBTYWx0ZWRfX03XhIIiQFjez
 nrlNCEHttsudY9vC0DHPsvnfbjAveo5CA9XS2KVHWBA5oxQSd4o0ssDKtSaLwrfBR1zWrj8JKzU
 y9mr78za4ZrFrgr8FFrZK8PX3sGEaaRdmtsnb3Gm6zC66GEu4jJcIaP8uKiTZI4n8frUuzlDjER
 Hj9op89deQyMeOSF+aUizVrKula+7vz2VYuxrhO3G+hKwJAEaTEy6hPT5pg4q2LnNsPsQ2s6gOp
 3U55+xy29XCvfIUK+3YcB3bQpn+pVzutX0F4KpDkgDxlNmdrI7abys856LPnNd9ji3OLBUNoGhl
 6uQIErMfIVphQKr17TLpa1mk68Tl79mstR2kA7noTBqGmG7raFU3t1x/avUPMRTv4GtqoV4lVjY
 nxcVYj6R1D0gxAAhSLUW30Zshe0rCYNYjoUE/x5M+DVP8H/1F3e5i9bZ8WL/c39S/1iM5R2T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_080934_523670_AB820CDC 
X-CRM114-Status: GOOD (  14.89  )
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

On 5/22/25 12:56 PM, Song Xue wrote:
> 
> 
> On 4/22/2025 6:00 AM, Melody Olvera wrote:
>> From: Wesley Cheng <quic_wcheng@quicinc.com>
>>
>> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
>> sequences to bring it out of reset and into an operational state.  This
>> differs to the M31 USB driver, in that the M31 eUSB2 driver will
>> require a connection to an eUSB2 repeater.  This PHY driver will handle
>> the initialization of the associated eUSB2 repeater when required.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
>> ---

[...]

>> +static int m31eusb2_phy_write_readback(void __iomem *base, u32 offset,
>> +                    const u32 mask, u32 val)
>> +{
>> +    u32 write_val;
>> +    u32 tmp;
>> +
>> +    tmp = readl_relaxed(base + offset);
>> +    tmp &= ~mask;
>> +    write_val = tmp | val;
>> +
>> +    writel_relaxed(write_val, base + offset);
>> +
>> +    tmp = readl_relaxed(base + offset);
> is it better to use "readl" which can guarantee write visibility?

let's use non-relaxed to save the meaningless discussion from dragging
on, in fight for what is literally a couple nanoseconds each boot

Konrad

