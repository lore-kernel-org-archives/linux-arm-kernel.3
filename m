Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3E7C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFhFJP/IVjFFdhwkyRYn3nHcZ9DDbQ4DU++GQypzBxc=; b=0MCEV4wnaE8kPKY6cx1KeZ7mlD
	5/FnqLAPF54BkxsWbDPnlJInQvEexSfds6DN/ZrwWF552xWQxtJ9KhZlgHwiDVVu/czSyHw4/l7kL
	+1Xqdu2zTt53zrN36eFMGfPUo8mwX0RipFnu+HMJ3bbJo5A55+0t066uHXacuITAANrwwc6OZniw0
	1JFRb6cFs7zR2P1a0/ByAfVAZEIqW3OLxPC6VApmJK78TZlCiweKuNeHkbUAMskPFdayonEh/tYGn
	e0Z9v+RfZn9ZDqAV0NBmX7MSueX4GUcLlBzObKMAe7RijBv8B07Ad+gWqs8VnRC06Gcz0mwAaHVdz
	b5CflfqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxS7h-0000000DpKe-3DF0;
	Fri, 21 Aug 2026 16:29:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxS7d-0000000DpK0-46kX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:29:39 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmUP21875160
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DFhFJP/IVjFFdhwkyRYn3nHcZ9DDbQ4DU++GQypzBxc=; b=DnVFdtSWrIC5Rfut
	N+aZ9krtfc7J5XCZZThi1NTJzZ04Q6hGJWFZSgAhV2EBfJGJY49ptTfOEnwc5ifi
	OQiTqMc/FdaHgScsptGPd2oHTVcgIKmmRWYBnw8QcEmycGSQ0EB6rOLb4vIHvTgx
	E9R1metkVKVlDDZ7/o44EiNi1nFGpf1rrvXOdYe30yqUQKordhGNOhj8O1h1XZ6C
	REiaXEKL28pCk7fmy3R9gHCT55Yv+Gz3/pJYnESWnKQW5PMBoy71IST/8rXLmo0o
	vpgBDmbmAhTeaLsent2m9+yOJT+UzEG6WB4obSQchFFgoTxjpkEpJEz+LB6h9R/f
	gvX3sQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdeaexg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:29:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a23afcbso18678661cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787329776; x=1787934576; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFhFJP/IVjFFdhwkyRYn3nHcZ9DDbQ4DU++GQypzBxc=;
        b=a3mKMGEsz8WmKoc8SrqCyrAlHrmhL0O/v4vCSa9KEvnLNIhciNdOlLcrnBngZPAAeC
         1Z7GL269therR4N8KqQ6ucNHdjEiH69fP/YPdylQyNhaK2UuEgjQMPanvPmFSuXwh1F4
         DqOttTRc86Wh9xUssNFHcK7YaPHrnzRZ82BNme9N+OxLl7r02duh18IDuQS+isgtA66J
         cCdm96KgWvyMNWP0xtqTsEcN00Gq9PwJEpr6DqaPDWoFqP8eDek7k/U1cLzG83EgX7aD
         6EgEaoD88b5o0JgTH0Py16JG0DDQMjz5reaXtRlyWi1Hunax929oi8tATjvVpBdwV5JT
         hKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787329776; x=1787934576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFhFJP/IVjFFdhwkyRYn3nHcZ9DDbQ4DU++GQypzBxc=;
        b=JsR/WacXpapff3Izg1izxhl0oEbIWfFNccV7vjM3pDkOQZiQjgUPTuaCIpTps6rBsS
         2ib58snNYyOefJl0SpIxDc1gd+aPq76bR82N0YO93ZO+imd+jpRvyPbXcv2JsjzVhvkb
         4tj7vZJcCx/+G30Zk4ccZtm+qokW+9O7X6TwEPYNz7aRdFy8ScMzjmY8DoPv3hKk9d7W
         XZljzxNQILA4Z0lupf+48KvmFgJejHnNn0sbSatsRSqGpR1ZPQb24vYhzIYMMmGJre7w
         bt11XubhzXjmB32a0L6byDdQXaGgR0flcoWtkbBVmomzmp0bqHeTgsxTbIM2dmcRVF9a
         bQ8A==
X-Forwarded-Encrypted: i=1; AHgh+Rp6vhmwyX2FwO3KUrcBtQPx3KUdNPQZDpafU9GmB27ouULAhJ7EcVzvQXXKC1noT+uYDMPu1vpNMmiFYTQjpcWK@lists.infradead.org
X-Gm-Message-State: AOJu0YxiZz3amF+H49lEwAl+RdyS2HndVVlwf4JLpwye1Qaysil7aAZv
	/4te83wbJUACuzRHziKR+p8KpYwMw7KuFz306WxkpXnDGgm/L4G7dY7Ltyp2asGSsfMFPmfkPTp
	O/fMEYxjj7/I1+TB7kuSzvPwLSFB3IUooFMxlMRR1IVAbe+r929JagvkeGCc7UMxzAd+uuTaWzl
	f+0A==
X-Gm-Gg: AR+sD11IB9Ks5a+eYYEy4x/LdYPEc+NLSYHF0PYOHOUOveX4YDVDAKXlhPtm3/EFG7t
	nhbRS5+pmgNyZa3TU/gXSiOPm3oddVq+hmXew0MDXoeMZMDI1YOlt4tmfqCz2uezNK+GkaQALbS
	KezMXMZdU5NfpTEhZkOZ3kSWZm8GsT0SVfino7klMHr+WWDiatGMl7WMuzo+wZ3yZwHQLHrDtR6
	lWMBLH3YZUg9CfudiQwiGEURK76NgnXNG5eGvPocQSNr6qitx0R/jmNTclR6OEvgh0r062nDV+G
	pA0B2MzuQRRDmmfCeWpitdB2NOmg7os9bzc3z20BDC+rpWZvDhtWt24wkFIEwfBoBmwH9SdznQi
	Nx3m9cIwi76XVM0fddu8PW+OqbG3XTpEd
X-Received: by 2002:ac8:5805:0:b0:52d:9c92:d558 with SMTP id d75a77b69052e-52df5a07540mr72188481cf.23.1787329776272;
        Fri, 21 Aug 2026 09:29:36 -0700 (PDT)
X-Received: by 2002:ac8:5805:0:b0:52d:9c92:d558 with SMTP id d75a77b69052e-52df5a07540mr72188021cf.23.1787329775827;
        Fri, 21 Aug 2026 09:29:35 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.20.211])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5eec1f31sm66561536d6.13.2026.08.21.09.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 09:29:35 -0700 (PDT)
Message-ID: <3f92d72a-9f3e-4149-b37b-e138bdd86050@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:59:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-6-3079794f0f73@oss.qualcomm.com>
 <20260817-benevolent-nyala-from-valhalla-46cbbc@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260817-benevolent-nyala-from-valhalla-46cbbc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BcroFLt2 c=1 sm=1 tr=0 ts=6a887cf1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+KmVXPE0btiop/5qwQKk0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=acOcqc2iJ3WRxsWVYcEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: kGPsxJt6-HUC6en_ksSWaFUHE_P1GfcQ
X-Proofpoint-ORIG-GUID: kGPsxJt6-HUC6en_ksSWaFUHE_P1GfcQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyOSBTYWx0ZWRfXyjQutZU7edir
 Wmv4gTNXwHuJES71BJdzlP44HHxTogqkuXGr2aP79nc+T6YMTTshdz+joLnuFVtJEnqQdeQAgfG
 DjuQ9jmKkQyvlw2Z2JquLR3P+E4IkBE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyOSBTYWx0ZWRfX3p9A3LGJcxrc
 JX7iyzy8D7MIqX0OHzVKCbkJ2hqlGc6OMdW29D+CHEwHbo5+jY3GDy/6v9kbClwT8RZ0cyJGGss
 p5IC1aoXLoJBr/AXKOcqB2APr28lB5FwRLirTXnCId5Ed6JsuRJqXKkKwoE1esMUcRPK0Dlo0BS
 N3zrAVIyJpYcmVnvNM8tQgw2wQ8AYHYzWbhlmD2fSGEFIJS/7bg3wknxbFDEQxfeiXB/C/15tWT
 akXFXHYaiVkVI8FGqGJtQ+1zZsNfknzR9zStoS2ChaKzPEjxTs5pvjcOz5Q0ojPDCFmL6W9N983
 DeI4V/ajMR0w7hr4Z7Qatbx391VgQ0d67WC009yW4XSREnSu/3bHxo+exxb1bInU5XvIfMDUV+C
 EMSJK7zNjA+zWh7cIpDedB5vXXL7thVF+k2KzlpXI+RrGekiolEJWODdlEHB+prnqlHxE45doC7
 lYC2EYuHcYWavdnAZNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_092938_322663_8B308F4F 
X-CRM114-Status: GOOD (  18.55  )
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


On 8/17/2026 12:58 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 14, 2026 at 01:01:37PM +0530, Hardeep Sharma wrote:
>> Document the RPMh-based Network-on-Chip interconnect providers and
>> associated node-ID definitions for the Qualcomm Kuno SoC.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 82 ++++++++++++++++++++
>>   include/dt-bindings/interconnect/qcom,kuno.h       | 89 ++++++++++++++++++++++
>>   2 files changed, 171 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
>> new file mode 100644
>> index 000000000000..ffbf14356f12
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
>> @@ -0,0 +1,82 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interconnect/qcom,kuno-rpmh.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm RPMh Network-On-Chip Interconnect on Kuno SoC
>> +
>> +maintainers:
>> +  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> +
>> +description: |
>> +  RPMh interconnect providers support system bandwidth requirements through
>> +  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
>> +  able to communicate with the BCM through the Resource State Coordinator (RSC)
>> +  associated with each execution environment. Provider nodes must point to at
>> +  least one RPMh device child node pertaining to their RSC and each provider
>> +  can map to multiple RPMh resources.
>> +
>> +  See also: include/dt-bindings/interconnect/qcom,kuno.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,kuno-aggre-noc
>> +      - qcom,kuno-clk-virt
>> +      - qcom,kuno-cnoc-main
>> +      - qcom,kuno-dc-noc
>> +      - qcom,kuno-mc-virt
>> +      - qcom,kuno-mem-noc
>> +      - qcom,kuno-pcie-anoc
>> +      - qcom,kuno-system-noc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    maxItems: 4
> Why are these flexible?
>
> Look at other bindings how this is done.
>
> Best regards,
> Krzysztof

Thanks for review.

You're right.

In v3 I've made the clocks fixed per compatible rather than a flexible 
range, following the sdx75/glymur interconnect bindings.

v3 : 
https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/

Best Wishes

Hardeep Sharma


