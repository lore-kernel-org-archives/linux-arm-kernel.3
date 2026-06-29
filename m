Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A434C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 02:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQPFfKAfuAvHuuAQ/jaQ27ZsG9qI5Y1lwfUzTW083pY=; b=wkri2yeAtxe7+9DYKzmpt4DU4C
	qjluH0cuqQNK6Wmd0710Wz0HYfhmahtqXmfIU1vmq2bX1NPPGRNwix5Wi+dXT5ZQ9DSPvMHE50/If
	pIzWyflkgS2kK1atGCA0r+rUvSPO3HxYzx4x76hLlndFg9TO7e2utcvPysSRaUhjHjw2xr2l9yoYV
	sgJyuoTDuUnXR/8qXsD7Ng4uZFnAp5ZDydzrwnBh3rg7QvUfgW0pTqAVYszMFGIiSPy7DTHyAr6ic
	tA0C8L/PRHIEx8qM5fOH68rbXhoCRoRNRw6c5ikPLx42to3DZ6zgqBIHIJMKpT9ToNj2uxV4jAHpd
	B/jz50Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1QD-0000000DZBg-0VvN;
	Mon, 29 Jun 2026 02:08:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we1QA-0000000DZBK-0PgG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 02:08:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SM9Np9946775
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQPFfKAfuAvHuuAQ/jaQ27ZsG9qI5Y1lwfUzTW083pY=; b=WLTkKNL/4couuf/g
	52YliDdMBEeXnXG9GQVG/EBQZLZJWWenPC7RNUWRCVkvpzRBOzFh7wheO2cetdFA
	ehSCQ4sckaeTOSOUB4QyGGplx/wx+p0wGqz+hv+fLPSd0RzwpZt23Ct777WyjJSs
	F8Z3UBSrMWUIHfhgcLTLg4QQE3r3awM79nkV5BvrubcGx+Hyhv14VKrdA+mw3bBf
	CFlmHv5P6j3tQRoWRre0cMuNJ5u098X7GcGjm0lj3kcnx5tMEoNLumzKQen6pvAN
	tFkU5IbOqAyGXTMTAcAHnkCa87i0iv+foCklUhvOsZmZTuGBuZwyeIsxJf6ijF1t
	cFzJjQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27t7uxex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 02:08:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845c605617dso2183965b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 19:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782698904; x=1783303704; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQPFfKAfuAvHuuAQ/jaQ27ZsG9qI5Y1lwfUzTW083pY=;
        b=ddvAWWKe4V2IzZK2BfrXFdE9hA82NVAwwK8Jvqv92AnfppckIzNSzvnJkL1D2QacD1
         lOjeFkXDiizfh8UY3dowUGU22ao19HDwE0TwxBItD0p0KraOldRC7rahk2Ytc9rO16sG
         Eg5KUEvAnF/3+SVZwu8+8HGGtTdvEtAM/hDUTSxmzMZ8jp5EudRWDld8KeulayFk89+c
         Xz7XHW8EmgaQnKAnTaIg9xaxUapgf9B3FVpAVI5hofIKVjS0WySbDpacPvmvzH7AQ95A
         KzBAkkEi+IsZDJmGgW0ML3hEYARmlfnYcscKMp7oTZNWFQ5wgDEmoo52jG9zfyRFxplq
         XirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782698904; x=1783303704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQPFfKAfuAvHuuAQ/jaQ27ZsG9qI5Y1lwfUzTW083pY=;
        b=FIJQQ9NAMOkFv6yBQy3ZQQelRzYml7z81lxGX/DRdlEv10wmjjzM/njqGWFCXS/eT9
         RCTVjXBY5+/QzrKNhPzdufc0iHXrGnoY0BYsWvJaz2km/5rRsiWywSksYVNPdd9y9/JH
         SX4//4dunLQTzDCY9TBsj9JKybbThbuHfW/8WdQ0JARlXC+ya3lfdSER/ny/P3HGlvh4
         QFEnhlyCvhuK4MRxTFGnK29UYcJUSlA1UbXUwqV2ZabPxL/M7uiT2z/+1TQ/6KYlNkKJ
         X4pe2TGMtewy3djUnDSpkF2bew6xxXckr1V/rCD5SaXOkva1eCG1do4IPo3JVDBTCb41
         3K4A==
X-Forwarded-Encrypted: i=1; AHgh+RqtHYTtNYA3r1Px1ckdon/5dpTVE5/m/jSPAdF7+Ui+Fdy80z/3uU0fXg2zUbI5IoNl9uzyoVNFcER6NMVXOZo1@lists.infradead.org
X-Gm-Message-State: AOJu0YzKFZG0hijqmrkkRETutYpleDVgtZNDffVR1mua3XOp9YjHjES4
	Bo6SNqyXdpX0mtfjAJtGHtr/q7fmIlmtzw8MjXrbP8Wz/zxSmPmhuIrhqqt14IJl8yjlvGsM94d
	qS0ncOHIq9PQXNJ1h98Tts+a33f9uroIE8gipQNI9qUzFE/lvoT8exhlMzU1dfUSFxBT1m5lXn1
	IEnA==
X-Gm-Gg: AfdE7ckJuqdgLNwOGQTeRO04sOd7iWhDnpc2JtDY+MtievQkGDCNcNgNtz5CSWEAt3z
	RG9aNii6fMOS8o1rs6ANTyGQ0nBdjDxsJGUwOzQFe0/AxEe4aARG1FQx8rsfNUN040vC8XNIeWp
	YtMw7qc66ckg5a/8mQLIf64RO04exOPJQ/3lhq+iKMMlhV5Dny28SMoeYk3Spitk/kQqtOX8J8x
	R8bEhqsS7m7D6ZinxiNnFFP3SbVKBAzuQ5CHoXVTpPAi+SzMMqKkUJ+cPxC7TO6jImJYP0lMjZr
	i1pRFxrL81vsOg/wEE7y0A2dICFqryitT01SnBHZu0XoTolKp8ytP1PSeebZAWDeK+EyQk77z1N
	aEQE3vjAiWf1HECDhDx6qxVFc9KGXi5Sd+JIG7gchf6kb0Xi/Jo6enOq3/vSOMLlZWMnRV9toAr
	I=
X-Received: by 2002:a05:6a00:2986:b0:845:ccf1:49b6 with SMTP id d2e1a72fcca58-845ccf14c44mr8944864b3a.45.1782698904518;
        Sun, 28 Jun 2026 19:08:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:2986:b0:845:ccf1:49b6 with SMTP id d2e1a72fcca58-845ccf14c44mr8944844b3a.45.1782698904079;
        Sun, 28 Jun 2026 19:08:24 -0700 (PDT)
Received: from [10.133.33.20] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40ee417sm10426170b3a.40.2026.06.28.19.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 19:08:23 -0700 (PDT)
Message-ID: <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:08:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260626154949.GA1812158@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAxNiBTYWx0ZWRfXyIvpM0wmKkZx
 OTBxjuOQXiXunrgFLarnYEQQ6mx3jhbYCWdz/YnHF7AlCegGU5KnZXIZxgOc9sRtnwGjGpCtvhB
 QcMR8hU2gJa/bPDnAB/hhURmiASQn+A1tZBkq4vo4RnCChwC3sopmtr7juPte6WVjMquN3GwuO5
 GTWTsm8Z0oMCqUwjA15tiA1BDFH/NXZ5JZext4Ih81U5+bpn6ca2ALq/lGsegOy0SxKyJLEPG9N
 SyXESkczzYbd5nSPxriUo4yzpxI/+MArPQ8Z+98DBPSPtHb+OWyN7T2amV9rSqPkr5g3d7qaMUz
 iiyVookA2QbvQIIOEWGPmRuD8fvCwN1Ue+h7SfwYTet2z7+/hPhXlKb9tws9S33GR+JDtTuyLA/
 6Ma2n21Q2rzugooEcY1qRojmLDHhou6MsGRToUAsLrY6JudD3vQqlkrQgM9hHYdVVLUGAQD9MnO
 sC4Irpp/aVrdvRhQ4ww==
X-Proofpoint-GUID: 6SA_poPkafcUMuBjvwHWEQ-WWmjtSpGc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAxNiBTYWx0ZWRfX2Y8ZO4E4tSQA
 F5g1jbIeQwnkLv9cgN3YOkAjSp7/gmA71TKx1ZI2f3+iL2BAQI1XRfDLXSTHuLAMsa0FLm0yGYl
 +0/8wFCsTym17EXUqHIN2OlkW8lQCRA=
X-Proofpoint-ORIG-GUID: 6SA_poPkafcUMuBjvwHWEQ-WWmjtSpGc
X-Authority-Analysis: v=2.4 cv=BdnoFLt2 c=1 sm=1 tr=0 ts=6a41d399 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=AzejHKQscgVUoiqplJQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_190826_148394_867B7A19 
X-CRM114-Status: GOOD (  26.74  )
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



Hi Leo/Suzuki,

On 6/26/2026 11:49 PM, Leo Yan wrote:
> On Fri, Jun 26, 2026 at 08:09:58PM +0800, Jie Gan wrote:
> 
> [...]
> 
>> I have another proposal: what if we allocate the ATID in trace_noc_id() when
>> the device does not already have a valid ATID?
>>
>> Possible scenarios:
>>
>> If the itnoc device is connected to a TPDM device (which has no ATID),
>> trace_noc_id() will be invoked via coresight_path_assign_trace_id(), and a
>> valid ATID can be allocated for the path.
>>
>> If the itnoc device is connected to sources other than TPDM, trace_noc_id()
>> will never be invoked, and therefore no ATID will be allocated for the
>> device, saving resources.
> 
> TBH, I'm not sure I can make a judgement here, as I don't have enough
> knowledge of the topology. And I'm not sure whether the listed
> connections cover all possible cases.
> 
> I also found commit 5799dee92dc2:
> 
>   | This patch adds platform driver support for the CoreSight Interconnect
>   | TNOC, Interconnect TNOC is a CoreSight link that forwards trace data
>   | from a subsystem to the Aggregator TNOC. Compared to Aggregator TNOC,
>   | it does not have aggregation and ATID functionality.
> 
> With your proposal, wouldn't ATID be allocated for the interconnect
> TNOC while being skipped for the Aggregator TNOC? That seems to
> contradict the commit log.

The ATID is allocated to the Aggregator TNOC during probe. The "WA" in 
driver definitely break the original design.


Can I fix the issue by adding "arm,primecell-periphid" property. That's 
would be the best temp solution as it avoids breaking the original 
design of both the TraceNoC AMBA driver and interconnect TraceNoC 
platform driver.

The TraceNoC device here must be treated as an AMBA device and I am 
continuing to investigate the issue with our hardware team. We aim to 
fix it from hardware perspetive for existing platforms if possible and 
ensure it is fixed in future platforms.

Thanks,
Jie

> 
> Thanks,
> Leo


