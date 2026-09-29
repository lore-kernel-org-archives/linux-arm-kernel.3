Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B8FC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fW5DRUsCcbLeD3llus6C7UVKS1kxhpTnHFxnIYGddMQ=; b=STZsJmXlPFiBk1JpAZhvmskAmp
	v3Qz8I/FmiZEehcQ9L1Nl5CndE2PCYO3yTB7zaI2R4U8Cz/p4gmggp8KgHOxi6nrjADAoY7+HFDVr
	/xX21/hSE4Gb4KYE6Q424mitEvOAy1sskKCEebk4S8zo51I5vZzIkiaXLaiU+fSeAOAGZ4bFxVGk1
	528XRDKpc7Lk2VUb1h0Gvjdn+6S0OrcxbE+Glldj7EJ9lSsajmRZAcFaWVlS5XrPudXYh+nSLVlXu
	1CePlaGVdyJEYUXN+x9L2Xrgcyp7a2JtBOC9ZsD1vaIKZNCf6apols7b6tPiciU+ikRclklC0wqdA
	87AXOj4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRoB-00000002Xif-2EyC;
	Tue, 29 Sep 2026 06:59:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRo9-00000002XiA-0gl6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:59:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47KWT3241633
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fW5DRUsCcbLeD3llus6C7UVKS1kxhpTnHFxnIYGddMQ=; b=DVZFtaqEENb2+2n0
	neuosQgeL9HZZU0T/SdS3wZm0ltmKPVUYONl5MfawuZoQ3yqIgGeBGgK+1kNR5zz
	dzBRb7a79eNLH15nFbaFONjWZXtxhXkVW+5ISpAW4V6PjjZHIvb5M55PKcZJlscr
	SfXk7vfdjB8aau4/qnNNggK+71UaU63DuiRpX8N7uOb+LBzOx8DuR08Tktl40s0X
	G1pK8Q08BhkEUWY/l2aBZVLKVTT2y2uyeMKkaNOjky99WPEkqabtc6E1NYxJ/UIg
	pSlzvSmApOCOAbGTZaPPGXGcqA+vF66PMW+NMcEADO1qweCrV4JysdP1C1v49spa
	q5lY4Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144skgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 06:59:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so40233775ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790665159; x=1791269959; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fW5DRUsCcbLeD3llus6C7UVKS1kxhpTnHFxnIYGddMQ=;
        b=IqZ4pXEvzzJHhod/fNdDywvl7f4TXm9/7Ao9O01GMA+7XhD2hXXCbGhVNsFxbgQRkO
         jpMfkgvPnfvWg9XkakNvKtzwfeWd5nObqDONXmZzLX8E0oSKKFYipFifbGQb8ODuxqiO
         ITwuRyywApRBbRmBlEqgGXMjdTufbUm/8Y6N8ZIwVic6Tym2QN2VbGrSmailHr9IovB0
         n+i8PFt3hEBADxb2SSY9lxJ8eVNiATJ4opARrEkwMwwVAFRcn96Q19uxOySeeSLcmF5r
         GW3NVozrj5eIIAtrc3BIciXF8vCcwj4wR6d4xwtIbv7a/OEIsjR75hyvAIG5MZKv5Irc
         RuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665159; x=1791269959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fW5DRUsCcbLeD3llus6C7UVKS1kxhpTnHFxnIYGddMQ=;
        b=S9eZAzkGBQBCZuqritZYRb5wvOLR1yoBfzOofssSD/J43qbGfG4FUgg2tz90olF5K3
         zf1+crM3RTeUtYQnbONLx0j4IEl9Pq0URWuQglWNGSWAQjl6tlEv2WsDsYSXoDoJxypx
         FM5QFxBdRMXu2MybOZowzMemqO4B3lbIgehIQ2exzab5W/7u12T8Wh1tTcl5qLkjWnqB
         +rPMbnhrmAd2rfGW8QyrBEXuNyzsNrlpjlX/mQEeWw/xdVFEjkWtVLm9qidMX1i+9uzN
         uTggfVm3DuGS3atLgE1LnyGcjmvea4jm1ZOesaV7pET9c5i1nqwOquFmLOC4JoJc/j/l
         EfRQ==
X-Forwarded-Encrypted: i=1; AKwUvByJ1702z5qRBZN3leQquvcIx8wxSioGM7wDcNQ7Lqq0wUHWDpbN8O1gKAcah4D2KjecmooLjJIvc8tTY6PZKV+Y@lists.infradead.org
X-Gm-Message-State: AFq9FYJZg/BxbIJqQC8SySSh7lPkKIbaAgGqMRUkd2KWffPNHIcFGW2Z
	UhEvUWeeIkOKTfQI6TFzsHMGkMNEuFLFJ6GZl9+6uExOo3b/c6/5ac9yPUIcvYad3gHho7eSA2K
	6i+NF4IECUnvh64n3a9dNJ3sLdUi7uniUpRNa6YlnsAs9pgEjjQlknzXujr5avJBZPjb/m5cJQB
	qDzw==
X-Gm-Gg: AYBFou0gL9/D3PMz/MVrjdtKLCfP5T63MAQZeI95xYWeTSjj3cnKqMsuVXRHWcGygAM
	YuycK4zARtYAyvbgGitRvIHGV9poKOi9tKTrx899BU0bAVAQEi8MMAXV9WGRu6/lKghNAmWx1nK
	kf0JuG60E1tTVPTwvmIpKZ66O3TzDq7wWiM7c9MdpIdTqiHFTwDdqmR39FKwUA4aImBmkQ5wggJ
	8+4id/Y6zmVgNmwTxPMhNAjT2q5QwKCoiGScQvGKvO1gBUSxnkpIEBuBpamxmTStJlmIhbALtd5
	qruPoA03dAGBRO57x/ftl7xHa4tuNHaK9mqYwBMhyrO67h/bODnyEg1HG9OGsphSQKWL/yFItZT
	+yUh3uiaWZzFIov74uR0rXcNGOKebbiUuRzWzSuWZJBfP0/qvBxGRGOUCgsMj84G0x99XKw16bF
	E8UPGk2z4wKATHtbPksfJ7
X-Received: by 2002:a17:903:1b70:b0:2df:4876:50d9 with SMTP id d9443c01a7336-2df9499777amr91491785ad.18.1790665158916;
        Mon, 28 Sep 2026 23:59:18 -0700 (PDT)
X-Received: by 2002:a17:903:1b70:b0:2df:4876:50d9 with SMTP id d9443c01a7336-2df9499777amr91491345ad.18.1790665158454;
        Mon, 28 Sep 2026 23:59:18 -0700 (PDT)
Received: from [10.79.116.189] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c680sm5559478a12.16.2026.09.28.23.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:59:18 -0700 (PDT)
Message-ID: <5a55edf8-bbcd-4e2e-aa08-c9b62e527a43@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:29:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX25rKJJrDzrn2
 h9g5e9Ovtc+5paCgkiuF5nf8lUm23ec2LNo0TwXB7KyNdhIKb/iDg+m8Zi0S+9zc3tcJaJz+Eu5
 Vk7inztmYNzOPfqqlf4TqUO7GFv8X9xP2VXR2FepGfN6cjJdVF0DMifGW+O2AnxBUI88YabvaSs
 vItk/mogKY5KNQV7ArXyS5cT0savTfPb0N8E+JkZrUXzPg9kxLIdrgODcq0erdes8QPBKEl0I9+
 hW+paOaJN9CkrQ5f9gDyoDlSwlttD6oQBA84igEd9rPnio56s991ZtTrcVdgKcVV89/Y+fxqn3z
 qjvlqRhsDDYFWTthKXSlyYiZmOnbqyO4o4pJj2pX0WMWhoL45wFqlGaQwCjF1beVyLHCj/bMbmv
 5Yx7Shlq+peTK3oZX+opgsKhgbi3ocb2ng/Q4j7yEYoI3PZv6wG/JfthbSVe0tb3eaJQHGX+szl
 FOWPkZy4iCGH7vS/Lrg==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb61c7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaPtSKYIirbzHVDMbN0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: cMDo0mXoxvwrhs7sJDwldWQ5r9GQyPLU
X-Proofpoint-GUID: cMDo0mXoxvwrhs7sJDwldWQ5r9GQyPLU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX7lxNkSH3Rj+e
 seUtsuvaF7ZGLqp930BN2ZJdkWT9njdk82bSmcypdGwq+x6aQmijl9GX6HxBPEHFkY6nXhUdQDW
 SZhangk8y4SPoQefI9RalZOMNj+HPws=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_235921_326156_6D4806C3 
X-CRM114-Status: GOOD (  17.29  )
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


On 9/3/2026 4:27 PM, Konrad Dybcio wrote:
> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>
>> Peripherals included in this initial set:
>>    - Single Cortex-A7 CPU with PSCI idle states
>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>    - GCC (Global Clock Controller)
>>    - TLMM pin controller (110 GPIOs)
>>    - Interconnect (aggre-noc, cnoc-main)
>>    - GENI UART console (QUP SE3)
>>    - SMEM, hardware spinlocks (TCSR mutex)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
> [...]
>
>> +	soc: soc@0 {
>> +		compatible = "simple-bus";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0 0 0xffffffff>;
> that's just "ranges;"

Thanks For Review.

fixed in v6 : 
https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

Best wishes

Hardeep Sharma

>
> [...]
>
>> +		qup0: geniqup@9c0000 {
>> +			compatible = "qcom,geni-se-qup";
>> +			reg = <0x009c0000 0x2000>;
>> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
>> +			clock-names = "m-ahb", "s-ahb";
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges = <0x0 0x0 0x0 0x0 0x1000000>;
> likewise here, you don't need to precisely limit this.
>
> Konrad

Hi Konrad

Here I cannot use ranges;

An empty ranges; only works when the child node uses the same number of 
address and size cells as its parent. That can't happen here:
   - The binding fixes qup0 at 2/2. qcom,geni-se.yaml requires 
#address-cells and #size-cells to be 2.
   - soc is 1/1. It uses 1 cell for addresses and sizes, like the other 
32-bit Qualcomm SoCs.

Best Wishes

Hardeep Sharma


