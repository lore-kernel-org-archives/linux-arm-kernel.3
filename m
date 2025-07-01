Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEA6C8303A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7b4c8FAEbR26sZIDd9GjlRjW8NmHWg/e6iguo0YBys=; b=FnUWvOis3R5f0NUuwBLvYy6UPl
	Wz/NKTjNEBKxyne32Isyasdl6UrCzKxQTkbGh5PNqN8p2J7ZcIeOYvUOtFgMbu42QRipKTqsrobaA
	c9bxO5YYAd37jwcAwGo3ASOJk9Llysx3n8m5VFuwrH4YV0JuQEgSHUVASwxSFVsPq0W8eFUgYy/DE
	N+qtC4Ykz9mL997mh4kkQVBgyFq7GHgATS27sHwRHFLhEIWp/D/XwdsOKuHrpyoNDraKtUIvHTj7O
	i2h0SwUauAvTmBg/SW8mwIYm2QrtB38+fwMKgfP/Hnlu+CxYIJnHTPGNQjt/LA6hB1DyMyCTVzeI6
	HQK9LAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbK3-00000005Z9T-2fzL;
	Tue, 01 Jul 2025 13:46:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZp0-000000054p4-2how
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 12:10:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A6R3F029322
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Jul 2025 12:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W7b4c8FAEbR26sZIDd9GjlRjW8NmHWg/e6iguo0YBys=; b=pqFrBlPioOJlzMoi
	41hkI6RiQkIUPd+reYNaF+2l4dMszIj9gs2Gt8pJgqPc+zi5y91fr5yPE+9mBe91
	eAXgI3Qu1pfXhhAG4agIrHGP5lgECx1KNf+6ehkvp2unibXmJuy0TlZH+VA+vDk3
	FgyobEtGYdnPfj/lB6GnQ63SVyxkpn7GFZvlTSYsUCHkWk+M2nZOA+5JbaVjjhVc
	A+OZwhYMpIlketjKir7i+ys7L7+g3rjiFckVN7JG5AtOyE9YbFXYL5hCCgptF1QS
	l5X0ApCTpCSjh1SI1DAiEppqP6McnlghdXrP6QCm+InEwFY1yRzbGSLIP4BjV5Rg
	un0uDQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95j0me3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 12:10:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a5ae436badso8177821cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 05:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371844; x=1751976644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7b4c8FAEbR26sZIDd9GjlRjW8NmHWg/e6iguo0YBys=;
        b=snB4GO9ykt59qKMpQM6rX/JeDvexWCfLPe46kvvdMC6+QEzrdbBg/juKJL7WSEFNCT
         GlBfHynBOa2OlmPgDL4i3Ih/8l9KNWhui7P/ZWlhoFJOT3nXbGJNLbcm0CybueDb3SoD
         egNeq5sfaYBydNjpDQCYOA9TC7IuLjVSwWsZlcms/lLIWpwLVc8AILYTuZ4Ttqaj2Zfh
         nlYD4uBxYPNX0rrcjwS8QWFx/yuM+FWHHrPpshI9L+HGyfjdNgDs+GAtiGOB0MG5gFdk
         aGrT7T/7pHVSv5fDzJe5RCSEdTj/y03Q54aVhRQNxT+WltvaL0ZrUPqG0UXM83P+onuI
         7kxw==
X-Forwarded-Encrypted: i=1; AJvYcCWTyIQkVj9/F3Y6QgbPcmJP3+8Ee+8SB8Szw3ubsAWmHoQaB2xjaw+E3NaN6/B7tOYHU7wXXGG77LfdhtuLub6t@lists.infradead.org
X-Gm-Message-State: AOJu0YyJsU54tXFtAvcjXSMXgpjIL8pwCmHZK+fSapi9r/BOU7Dp/ohu
	0Ll41AFgk749XQcPCoWl2e6YwMZabo+dxCZV3/SjElBAg/yTfinpJpgRQv09wWi5wfYcKTUOdqY
	n9qhsTLADbcc09TJQV5poPRA7Kk8GSnL22Fo1VjYFFCbhGOzmvUmA4lwsk/RDEJLBTSIo72CYiA
	Co1Q==
X-Gm-Gg: ASbGncs6sgZ0Zg/jolRHtJN6Qtar0lRwGJcZlh9IeLU4JdFayUy8GRAKvsBj86cD0Ge
	fd3e4zTvFkcXBpPA//aOiSOFuPajk96hGoIhpcAgHIf4Tjq4fIipBE7xFl8WlBGG8/KJqfQVNgq
	b7+1NGcDjqqjnX9XSfWq0uZ8bjrteCgS7ApEf+rasFw8aa4dC+Qhtudo+J0EaBBSdO4zYpJnGrs
	O+8o0In/aaW1CCaheijKumnSDVNkSguy9/hcechHk3bX2pDnKjK3QlXQGurS/KDNmMUJK5w5/vQ
	kEEKkSTD7Qn5j+/NIhspVUw44makIiK6jCuGNWIvuRh+DuHjkbAnsOlPeW1O3jzOab2uO5ChtpY
	/kY7ahiq4
X-Received: by 2002:a05:620a:3710:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7d46774f6eamr146982185a.13.1751371844046;
        Tue, 01 Jul 2025 05:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTxzbx67vZnwclq62QSQMEsaHBiUQUi2s3v5N3dbE7nNpEwja0y/5s43uax9D/Bfc+SnBykA==
X-Received: by 2002:a05:620a:3710:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7d46774f6eamr146979885a.13.1751371843303;
        Tue, 01 Jul 2025 05:10:43 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca1619sm854280966b.149.2025.07.01.05.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:10:42 -0700 (PDT)
Message-ID: <a873f197-1ad6-4a7a-ba66-5fef10f32c57@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: ipq5424: Add NSS clock
 controller node
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_suruchia@quicinc.com, quic_pavir@quicinc.com
References: <20250627-qcom_ipq5424_nsscc-v2-0-8d392f65102a@quicinc.com>
 <20250627-qcom_ipq5424_nsscc-v2-7-8d392f65102a@quicinc.com>
 <cd6f018d-5653-47d8-abd2-a13f780eb38f@oss.qualcomm.com>
 <db1d07f4-f87d-403a-9ab3-bf8e5b9465b3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <db1d07f4-f87d-403a-9ab3-bf8e5b9465b3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3NiBTYWx0ZWRfX2Jn28azCqxDX
 4XQ0IeNBa3v+nSloE0BHhCeJJXQLsu8tNfmYpY+E3cL3l17E7+mCb5DX5Yo/3CpOUm02/yLLRv/
 m5d0nSU6SWabHNiS5y/t14G74kFseenxqJk+LDUyx8rmRSnLsI1wZYh72WDnuJI4MV2uJcWB0ZH
 XEAn91eYQBwrVu2l1d9JqCQNVv920nJ9DlHnezkZSwybVOsIAftvphSIUShbgs6kcl9ZU6IzXxi
 g+eoVaNM+xyMkxQ/2qawvlM12tDtf+fjIC5U9BFrykwowbZKxsp7RlatxThjOo8w+uodhmFf3uE
 dcJbcv7VgiIXYdidcIvs3ZS/gcg/fnbkPxxCbjpcaFx/Tq3wLATfaoHBGKf7nbpAbMwLUZBwWCE
 zE2jtIInIsIJAwqT7mLir1kv+8xrE4bx+AgpMCFS46FnltvTQek2fmfVSFGWmxAQdwFpPkbt
X-Proofpoint-ORIG-GUID: FYAs_zF1m_sy5aFiNMtdrtPLm-cfqF27
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=6863d045 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ovtazKSSlfofSAFZHdsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: FYAs_zF1m_sy5aFiNMtdrtPLm-cfqF27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_051046_687157_791060DF 
X-CRM114-Status: GOOD (  18.31  )
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



On 01-Jul-25 14:08, Luo Jie wrote:
> 
> 
> On 6/28/2025 12:27 AM, Konrad Dybcio wrote:
>> On 6/27/25 2:09 PM, Luo Jie wrote:
>>> NSS clock controller provides the clocks and resets to the networking
>>> hardware blocks on the IPQ5424, such as PPE (Packet Process Engine) and
>>> UNIPHY (PCS) blocks.
>>>
>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 30 ++++++++++++++++++++++++++++++
>>>   1 file changed, 30 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>> index 2eea8a078595..eb4aa778269c 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>>> @@ -730,6 +730,36 @@ frame@f42d000 {
>>>               };
>>>           };
>>>   +        clock-controller@39b00000 {
>>> +            compatible = "qcom,ipq5424-nsscc";
>>> +            reg = <0 0x39b00000 0 0x800>;
>>
>> size = 0x100_000
>>
>> with that:
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
> 
> I initially thought that a block size of 0x800 would be sufficient, as
> it covers the maximum address range needed for the clock configurations.
> However, the NSS clock controller block actually occupies an address
> range of 0x80000. I will update this to 0x80000 in the next version.
> Thank you for your feedback.

0x80_000 excludes the wrapper region. Please mark it as the entire
0x100_000 that it occupies, no matter if there's anything in there

Konrad

