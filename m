Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCB6CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 02:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=; b=l4pnuAJcuUOhLX+Yxb4zQyeR6A
	7fS37uM8PROD+Coyt8bxgdEi8LP0/w8fG/sJDQteBFtoO/0tINznfz7J8A0Wt0o7PZ7iTB4eqZWv5
	T0tFKnNNDcVFrTcD1l0yCIhg4pxqx9sQUkMsCZWaMElJq/bx3JIzKjVQg353b1zE3qpOPL/ODGmYB
	Mbm4Cmac+nq0QUy0m+P8tFmjCE2yvrxLyAupGcjkI3npbJFiKjCzJ9LUuMuDEuCxGFcc4FUBNw6zt
	beim/NxUPhytQKjRMKhaki0VixC2+eHbi16AHu15uVfwZhgng2fUPlLVdQh44/3+gREDnjU12l9eC
	a4RhiAXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGKA-0000000C1wW-0BCV;
	Mon, 11 May 2026 02:24:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGK6-0000000C1vj-4BkD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 02:24:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ALFPfq2046727
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=; b=VXA8KIRdowG6Ps/f
	8zv0HVMzFMIYzuxxUOkhukFSFNHVQn9Y+kXeWGGtumsMTHHwFO8xGMF2Z0vQRGfh
	Nw0OhfDZWAe/F/N3/a0auPLxWPJq0yy6pFojTg52SXyttklbyZNwOx35VvYw42zk
	atPXPg9O1GbNJt1diMqlv/cCIhkMbNBbIgg4yxaXus7cdAtsu8YIx0aZW7FaW1mL
	zznfWgwuJZ7BoIOr1vhRkb+6unfTHtDSb7zWeDSBnlfiDirQsxeQQEQ+m2iSfKrW
	rCVmnKVmDTPWU20Zafee8J758wnULpxJCUELtLCBiouS3tO3RcvP6uz7IgJORWWX
	IEQHxw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1ux6v5w4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 02:24:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8bcb482b185so59053306d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 19:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778466284; x=1779071084; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=;
        b=ISZ6T53acvRhF1UL7zl7m+kvgIqloS6s/luMXwqhZYsPN6HBbCjljcBOl1vyrs7eG2
         ADusZjVm+GkLgIib1eyW2cr+wQl6eURyaFYwLGI3YPZrZgIImfonogZmqq2iohJAHTar
         3o/1phZhSA5Xn82PeXSmEcGXqLLkA9FEPmxa9PO8H3pPWMRtSXUprilU6vrPOmVjgyNP
         bIVCX0xKd4TnQKtThdSAPRivJ1PB/p2BqKT/GOzc8WbhaLY3OR4lYHt2PPHik952llc8
         savH75CZ+XV/Nqi7HdcwgCj/jcQp7bQvI57j/2Nv41hqqzxsnejfTHpEot5syPH/rKyB
         UbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778466284; x=1779071084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDiSg768CXBvGt79GGg+qABUaCPAYEyC3WguiTuB1ec=;
        b=CPRG4/ZijR49BNjCDdOtfDxlMU04JnIX5MpG61poCg5n4izPEXO9ARHLrTcdTf6HCW
         hYC9owPf+8YZxXUNTqWy6tFzebP68JRL2BjZla69zYG8Zkc5TdujPMjzsb6G2naF7eer
         HtETibLTrNES0rDhbFgOefaMxcaOcJoui7m5mvJE8ZgDAfrKwpT3dOM671kUGKIyzurS
         wysYr3X+IycDyhRftkuPb7JSnTwJkLpH/iGTX0XSIv0nHDb703G9Cu0Qe+f2ZOdRTGFU
         PJFW+MaV0DccZA4uYEYOM1m+d0AL5oYtrk9JW7niDXr5igYQQWhZ2h5ua7DwBvszY1YM
         Pmjg==
X-Forwarded-Encrypted: i=1; AFNElJ8ykyK38MXwlKl7lRxmYb44VVwxaQIYW8cgBFlxHqejKNC+6R6TBjMDDXt1xmEc3afPHOv+5YTFPxyTw8DE4diN@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq1BJTkJFAOlIq/gb/xu9/87SVASTxufsZPeRKuv3WpznXDBD9
	MIfEQhnXWULN135fTEz91vA6xRqULGEs1NvrPSHfM6kt2y/nWCj/ggGB1aqWwsEFe0RyrgSyXRe
	Jwo6f8iZrHdOaVST6jPJ0y9DNItaZ1CAshwzjmy8RxNHmEYK+XIiNq8kWcnIbYQPQ3DH9M+il2d
	d0Ug==
X-Gm-Gg: Acq92OHKgLC78x1wAAdpnDRDY+8NzOAgy3lDShivx8HD9xNmSyzhEsbp4NdFjuYYZH/
	sKTZ7r5mcwwshGy0yPbEsdtLoxjkLbcse4xWIfxKZpXN7Zce6PsocdcOlBcQoQWNlHe2Nert3+J
	idKLcs1TMVKMVWQA6P+tzVqAA8pFRSDNSa6BMxKtUndCUpxcgxpM2ut8DXOgNuPpN106G6w3CVj
	3zli6z2fYXpVqg6cr6V1p8zgpxJeUyDkvokmvOIuc1CsC31yUJLGVvasW55fyZlpHZb+qHFtH9B
	vceei6DkdDVXsTeyrwoS3Oa+hAHEPPEF5RIRuGE9HsoI527tjJ4y2nBl/RBtP+EiRptAdVzbEXD
	qJ58/xL1bHFn6SIl6FsYtWbcmv/h+CYh68XMNaLYjLsvIpE6Ols/x8UMUrPORSlEQe2Px8n6BFE
	yHNU3kyEM=
X-Received: by 2002:a05:6214:469b:b0:89e:a170:6af2 with SMTP id 6a1803df08f44-8c1afabc2c5mr138776926d6.41.1778466284614;
        Sun, 10 May 2026 19:24:44 -0700 (PDT)
X-Received: by 2002:a05:6214:469b:b0:89e:a170:6af2 with SMTP id 6a1803df08f44-8c1afabc2c5mr138776556d6.41.1778466284094;
        Sun, 10 May 2026 19:24:44 -0700 (PDT)
Received: from [10.38.243.40] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53ce7e73dsm300484716d6.42.2026.05.10.19.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 19:24:43 -0700 (PDT)
Message-ID: <1d6b4182-7cef-4c00-a655-095c0388a038@oss.qualcomm.com>
Date: Mon, 11 May 2026 10:24:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] Add dtsi to describe the xe180100 CAMSS block
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
 <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
 <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <328860b4-1d4b-4a90-9d10-cb70207aaa5c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDAyMSBTYWx0ZWRfX1GpK0z2gqQdC
 OeXTxCpv4aMSmY/165iblMCSIp9tnx1sLJ6jd4tMksxdrkryXA3bqWaNj/tf9wXbI1gqqVBE+St
 XGPWw37CW5uomCFWy6PZW/NFMjFaSHlBmQXo+SCONUBYznpsGcfr5IePvNpuwpJs9xmd8xsJIli
 eW84g69JMuKSvASFbAE8yz6Z7wfEksJ6Zv2Z0XVKun82dte8uYpWf/8F/8hSfNFN2m59+Fh1wiT
 8U+pXtqVvuP9IxuZuyIakZnL/Hyw1rv96QWp4dex7g+UErIkTx1KbRpwZtG1GeQ6ujTY4oT2yGh
 l5Z/OSpy3stDFJdY2yK3VASfDlhW4KKXfC1r05mHZdFT64eoLxuuC5YQBnqXeiGGVC8ke/dsrsJ
 INQPwUDJ5LfdyaAzQgqHPuxAatu8ZvJbjxuYG7dwSntpcosa+u+mJ3xaJbLN1P/7qhfZnW9J1k8
 uzNohOhNvduw66Ng+UQ==
X-Authority-Analysis: v=2.4 cv=QJZYgALL c=1 sm=1 tr=0 ts=6a013ded cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SmDLwImcmQvp-VwJOJ8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: sRES99gdQV6SelSSAoBFeIB3jvs6rvF2
X-Proofpoint-GUID: sRES99gdQV6SelSSAoBFeIB3jvs6rvF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_192447_212035_0E919CA3 
X-CRM114-Status: GOOD (  14.58  )
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



On 5/8/2026 10:23 PM, Bryan O'Donoghue wrote:
> On 08/05/2026 12:40, Wenmeng Liu wrote:
>> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> 4 x CSIPHY
>> 2 x CSID
>> 2 x CSID Lite
>> 2 x IFE
>> 2 x IFE Lite
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> I'll repost my working version with the PHY stuff so I'd kind of 
> appreciate you not posting an old version here, just wait for it to land.
> 
> ---
> bod

If we are able to designate the old version as a candidate, and should 
the new version continue to encounter substantial resistance, we can 
provide a functional version.

Thanks,
Wenmeng

