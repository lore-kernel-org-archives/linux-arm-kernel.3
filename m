Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689ECCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lj57R/YmZD/4Sj5RKNgxE3jSaNf76h7dCY8rZUL46zs=; b=kf1Y5jLbZKe/sFyb2qLHpNeDvP
	iS6JFTn+3iEzBk/hBQHQdDWKMDWftvEZ7LRE0k73o14ZVD2aTWXDL4oH496bGb1IQXT0eEHagdGz0
	WsvNlMnGebCNjfB/1TqU5VcUWHGKgpDIxHsmIEFVVv+Kc4Xo15K1/SJLHqkWgm+RPOV+l71gGSwu4
	yu769aW41F2hKJWoy6DQxs4FQuNMTvg7JkT6d4M6ZxhVJlV3Q66QpXnANTQi2xJ/gN2ehrUCD0FcU
	jIwt0qC5lbhN6GJW+3iB7GK3IzFXdgkX/vmsISzpgVRAQl0X3peL6Q1AJ759eSdnG9Yz7HJOECnZQ
	my/qU3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTAP-00000002lda-1zL0;
	Tue, 29 Sep 2026 08:26:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTAM-00000002lcN-3QqE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 08:26:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U5tw3834165
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lj57R/YmZD/4Sj5RKNgxE3jSaNf76h7dCY8rZUL46zs=; b=EKzxBWNYBMtLcPz7
	/BCQFrhl/ke8baY6roWkO8tR1LgkVy12Oz+pbm5PPTZrtoJMYn5d8StPqA5bPB6j
	+ncyNGLBE2iCUSB44/2QawwYIdfKvvU5g3VX8g92PwP6/tnWGqi4oL37Z9coJpyz
	DwE3ehJ94WzN+ylUwxKIhrqAcZFUE2hvI8A18xRSxa3Oow6N3hIVPXqdLHss1MQ9
	CA+bH83x0q4njg+AgY2qVZKwl5RTHrqiR5I4UTFBdcus0PFRtVza76E0VNi6TdIv
	kn9l0UXeQqoY16o7j/GsOumaLFULZH+3kLUVagI6aicugHbKCz95N7w60M8wYTLI
	qc+5OA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkhst5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:26:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c29d85d0dso40149885a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790670381; x=1791275181; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lj57R/YmZD/4Sj5RKNgxE3jSaNf76h7dCY8rZUL46zs=;
        b=Fs5lllbUrJEEXvrDUVah3ceSkovy6gXFRMngnhnP5gKSdkJAgLNvXXlo/+m0pJLEmX
         jrqgTPX4EpoM3Mp7iZmGiBnT6zVjP+BCZ/zOfzCjFem+92sxshzle1UrujPBLs4reWQB
         71zxjlUsW53LZvY/viSJySY2baWA5cu7H6UVEmtBF3n5s9NXQvbPR5YMO8Ze3hdxKPLL
         gU+XVrNchydDXEMUjRdFcC5dS1OyuxwKwizB01CFWeyAS4/w9tn4Y3DQHmJnQe4vnIjy
         NyZxyE7goOPj7SF42P0NUjzYYPG+Vk5N0JO9ulunRzrdTvYAi7rYnTTvtHamf67u2GnI
         zbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670381; x=1791275181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lj57R/YmZD/4Sj5RKNgxE3jSaNf76h7dCY8rZUL46zs=;
        b=XS9g8F/6QlBVU97VFqmjdxzKuVmAjxAlUbiVO2UU/30faqGA3qVjMH5ZyRKt41XAMg
         1boGDHpaNRSl1tHs7XeQeOklqeXA5I52qgs+1+a5s8zX9aMTKTtWy8YLr7MJGn4xCpkS
         YfENS4jJwbKpmuW8Nnxh/vwUcRhkJl2MSDDDlpkaWKW+XItNAbQhql6n5Ikul3Neymv9
         BwyoMOyDR39y+FUHu+q0NtNUUA/zJ6HPSwP8eXyoj/VZZ1VmohrnAlIoJB9qFP488gVO
         BxVGtvGNcAfFIS5yq1lDVH0i0yVWWGAGGxp6vqIduWeI2kJvXWIs1S4KhUmIr5LoH7Rc
         kwHg==
X-Forwarded-Encrypted: i=1; AKwUvBwJU9yiQESkxKpYd2pl0vQBl5rAf8ZJ1UiOOfdtzE/NJJV6zzpunNvMoXQLdEIM4GxiJoTtq+xwplYT06rEkKIl@lists.infradead.org
X-Gm-Message-State: AFuF++kLsjd+RA9WDn9D5T11GlXZehnToQ72PJPFSLaratowlNukd14S
	TudW1dEbC9V8nlGEUEIL4Er7DUQJQ+c1VTuTe/BYf+215S0Wg14td6JmtcUJfnMVQTK2pV5uzYP
	KP68IwgCx5I1+bbW/PSSc9DO6s1UfykE7nPbEcTw0RSvZ+EsRp20YQGeNDptIbHrayz9kIWSaOy
	s/dg==
X-Gm-Gg: AYBFou3L4bNh3Yk/4elrYvvPpDYBKehjMpiFNIXN7KVWd8Un066MdUrz9GduFZPE5o+
	7ii8ZqLDlnqcbCZT25Fyw3T8DoilRfbsdMiuzViYwKj4BpSly3xNbWlXpu6l5Cxr/r2Snizekpp
	GZRIkK5gcA7ji7SAIt4+jSGuS7hu/eaTLFQVpdPeHwlQZApKPKJ3sb5EU5DO+2+kWN5JJtgPb2v
	9Q5ji0wCwFmRcEQeVNNOGl+bumkyMoutLdG7ZCTzT+2pkDA/aeH+a+20lqi9TkLx8G/g5l1bAPi
	aJYUTxqZDP6IzSHol5CmXZ4+VDhBD5RveiVKj6VfT5iYlwMCNZerZOqFHJ03sEDHqa6g9d9zUad
	A6J3r8i+ZYTMBDlMa1oVw/g==
X-Received: by 2002:a05:620a:468f:b0:93b:c6ec:780d with SMTP id af79cd13be357-93c43dd5b7emr2345656085a.5.1790670380761;
        Tue, 29 Sep 2026 01:26:20 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:93b:c6ec:780d with SMTP id af79cd13be357-93c43dd5b7emr2345654185a.5.1790670380282;
        Tue, 29 Sep 2026 01:26:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb9057d20sm380135a12.32.2026.09.29.01.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:26:19 -0700 (PDT)
Message-ID: <c341b7ab-fc59-4234-a25f-715035fc1779@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
 <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
 <5a55edf8-bbcd-4e2e-aa08-c9b62e527a43@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5a55edf8-bbcd-4e2e-aa08-c9b62e527a43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfXxpHWo0ffp58S
 5GkqBnXi2+eALWbgYClH3Yl4zhPgtVeGj35raiNMiMUYkFr+LGoV3IIYcFiAdlPZFM1GJ+2GoJS
 bt0FurKj0QYJw1xxf+NBGouADF1v6uT5r3f6xUzDoE6L/+8KF/1wBZd7hbGB18czdi+SZYB9LLl
 mrSSiYkwdkpVLWmhwuxDAaLVpxFsAIGpWj12IAagbV5mnaIHmMtLBuamMt9mm9evntuuJOhLxDg
 AfWXHIef/8hqG0+sDe3CV3UJAZAUK8DiF5x5Vn7gHdCpvu3+SotMjFNH8pR0EibWjdPjs7dgO6U
 Xcf0w7Dhs4kHt3vyIbcp9SEJzULVMLa+hDGBwqcWSoKXKG5hLHAUqxak1mp/cKnRFkyCsdMTVVM
 urA4/8l31olECnTGfZEIH3iu4NJsYQj4DLJ2/OacMyVvznth84sORfgg3w3vvoRTpwO2uAdi4lW
 zhvoeHxkcBB8nh0cPNg==
X-Proofpoint-GUID: FVhGKz6Fkgd8gLj4-ugyyKMZyXaC-iBN
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abb762d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=-jS8umMHsOJWnNsN0pIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: FVhGKz6Fkgd8gLj4-ugyyKMZyXaC-iBN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfX4xvipNfCuMkf
 E/OqPuh2RV5/BNK3WWOMyuknRdsxLtapMUIPTbnqBbBUJBlOOX5MuAccfSMhb1e0E5bqU+txytf
 PIeUelF6n5GUfAezSsvbISdMJJYOk0k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_012622_973015_7AC0A500 
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

On 9/29/26 8:59 AM, Hardeep Sharma wrote:
> 
> On 9/3/2026 4:27 PM, Konrad Dybcio wrote:
>> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.

[...]

>>> +            ranges = <0x0 0x0 0x0 0x0 0x1000000>;
>> likewise here, you don't need to precisely limit this.
>>
>> Konrad
> 
> Hi Konrad
> 
> Here I cannot use ranges;
> 
> An empty ranges; only works when the child node uses the same number of address and size cells as its parent. That can't happen here:
>   - The binding fixes qup0 at 2/2. qcom,geni-se.yaml requires #address-cells and #size-cells to be 2.

Fix the binding please

Konrad

>   - soc is 1/1. It uses 1 cell for addresses and sizes, like the other 32-bit Qualcomm SoCs.
> 
> Best Wishes
> 
> Hardeep Sharma

