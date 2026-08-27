Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102EAC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g94yz5fedosPU2VDbIoL1jhvFxXuRKxNYR8GyxIQEdU=; b=G22QiHJcKBpi4LPU+vpidOtDsq
	1gXUCspN7qPkdCIE6T//Kj1BJeB+5tsJhpmc2eZSWxfK63nsiPrqfvLMJZViVgxZotRZck0NmSvFc
	pjRqAo9nDtydGOHbkU+RUpbzfHTEPV32HTLxv4Q++UqMx74ymwEqoFUe3Nj1VDxF6DI5FXAWnfGeT
	kDt456VPprMoyNRQvamAGrggx9VaA0KPUnNI1W5LQ3SuHUouO0kV9vBLLGcFblEuEmAd+AjNvkGfk
	CiQ2m2aSlXzz2r1oxM0y2g3ZdPfvOTt7UbARvq9RQTnVMtr0k6eyCmWWmU7wlRcwkiKzrxc6dU/XY
	0j7Wu/HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdGS-00000004P6g-2JT3;
	Thu, 27 Aug 2026 16:47:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdGP-00000004P5n-1pTN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:47:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbgiT1310839
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g94yz5fedosPU2VDbIoL1jhvFxXuRKxNYR8GyxIQEdU=; b=YzS1TQTXMjf5cW4U
	eEqDAGdglW4D3gG22mOeeDoKfj4kkOo+ZJNWp8rbdHRB5XdGsOHbadjiShL5uYKL
	m74+ahf5aH5dt+q7t/WUiLqNNQiijggXmwBTVpBH+X3zS2Lz8z64tSUhvUv8lXko
	FKItQKJgjJFP8e3dsuanck7evo5biLlFOFGdVhWFzgtif+EUYlB6stAN7wrNSspi
	Efnly8LzDl84/p1blOUCQfU2aYjr9rfNDGoakhisWbTFwhfmGKfz6NFxfHNaOWrT
	Q3f8UMwV3FKaHRTLZGxikov9/luY6JwA5Ge0NgeOyo15r9/wudG8nFSoUCXBASST
	u8u/8Q==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5ku14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:47:40 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a7de733fa9so225904b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849260; x=1788454060; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g94yz5fedosPU2VDbIoL1jhvFxXuRKxNYR8GyxIQEdU=;
        b=C8HMMFfPkm2FKzRH0bU33H67PFexw/5SD0z9ugAHpw89SYYtorixfNSulJVeJ+LXpS
         8LeLKmCm0iuWnxn0HnG/RmDoHgbB/aQW9nNwmstjcrG/6wyzkjdJFisiDyqMPfOk3x4T
         XElvjjGJQdsVLXD7oaoPx7aS4WmJu6Y0hbGRzaCYMRIn2MMSpkDWsytIPERBJNguudNe
         9VNkXGGgYm6wq/IUANsP+farJc8xLB76Z/RrhX+9m9CA6XTMy64H0OEeVpY+Vc6XvjRz
         7W++HfLv8N1GtZ3w4HRgRTL/htix1YyGbKORmDR9qMDD8x6JdobqTbWJhGvGv8OSkdKu
         vQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849260; x=1788454060;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g94yz5fedosPU2VDbIoL1jhvFxXuRKxNYR8GyxIQEdU=;
        b=S4KVgLZke2OFEoxhYJgRnAkhfYpYSj7dGkSTwqUiHgZXx39lSgEkQ4biJvCwnx3bkn
         RlQTwyfp6UTmZJxt3gzaYuICmI9CHFACyFiMWXwRWjSkDSjqqdTyxdEz9LucWt6OYb8j
         oWlESUl8FpqSWPhafqPIBXAizo306YAQpRN9DvZVmtGptKMaZlQunpLrYZj1ORhVj7QN
         Saf1S0AsGViQA00PN40LjDTM/gR5TnlnUlfyvdAlAQDV/Gir6FBmryfzKFndiCMaqqv8
         ASeO34UxzXnQI+xgeHa04rDW/SS/4AH994HUlUpeYUNEBRwX/PghuD1gkCGEpkBm9B+5
         5GkA==
X-Forwarded-Encrypted: i=1; AHgh+RraRbJHBga7Y/jqxcwC1Xr4M5TImq6SwVL9a4EPx8lpyaLIDLGziB3CUFOZwW6nCCWPG/UvAWqalhXdUYMqArN1@lists.infradead.org
X-Gm-Message-State: AFuF++nSjXxSZ32EhvrNv+fwKfj/V87aRM0lMRaA70Njb7he0yK1m7NP
	IPTClTr+yEzdKnGAMHRyLP2n6fZqBPJ3yKDkIdfhUuXydBW7o2WSr1HnrbVqO5YFv38EyJKLYAK
	R0Jd3owMzO/vSKydcKXEbRqGRbolUb9KgpaGVGGxi74ShZcHHAPso2WXXE0nCIdaDxPqi71wI7e
	Jltw==
X-Gm-Gg: AR+sD13OHtm/32sYP7rZ/954qRtp+L7PMqPHiGwODH8BB376Imn7tVXk2sjrgGQ6UOa
	6kMMblTZqmqLNVl1g0qokAwRjnuzZmzOl4N+0ZtYtTLBQ/FaARTMcVz6x6iEAWIqF8nh+Ppw47o
	R4AXRcuCh0zyi0vblPNZ93p6FotyS0Hv3ScccV/SkqDF8TXpluC3KEGbkOKrm0U0eRl+c04TmE1
	aX80+/GI15OQiz7rY0sQEQauAeSS3ri/M4Y5ElUdypRsahu+M4KVf0szr4ssJS4G6HynZRPsCXg
	fcyTLH16pKd4SdKyx5jc2faVTzu1TzZE1DYIn2ZIz/bKtH/4wf1RAHhcCyMXpn5C2axRV+q4N5/
	1r0eDY4Sxblyh7S9INPzjp+6h1H1ElNE=
X-Received: by 2002:a05:6808:220b:b0:495:d7ec:b6ae with SMTP id 5614622812f47-4b39824e860mr35154b6e.16.1787849259936;
        Thu, 27 Aug 2026 09:47:39 -0700 (PDT)
X-Received: by 2002:a05:6808:220b:b0:495:d7ec:b6ae with SMTP id 5614622812f47-4b39824e860mr35036b6e.16.1787849259382;
        Thu, 27 Aug 2026 09:47:39 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b36ab2b542sm4508205b6e.10.2026.08.27.09.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:47:36 -0700 (PDT)
Message-ID: <54721a71-cc94-48d3-9581-4d2b09038d6b@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:17:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
 <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e0ESVe4Aiat6-IFiAn50eeU1MgRrQAy_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX3FCjZ/6JyY0V
 2hdOpKwC1BowgZh0Ols90D+5nMGC90TFjAJIIZ7y1bYKctE/CxVArQ5ML092lIooh4PwCNWL2wI
 tfEcrNNYK4K3KAtKasobOW7T042xeeU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX4utUdM4Mc435
 fFQqeemTA9ShhrC+GDhw8kec1qGkxTFOO2ZFUn3q1iBAlnhKn38YGkuYSv78X9J/Aukz0FPXjTd
 atk5LcUkXHmHwtAz+k9nPwAb6ll3G+8eFx5HQYQCJjvuHbA/egRxUANMJmmw67JHLQ/56y0eRyb
 eXTttE5LfWKAIsa+lEeGImKzAD1iD5StoOLYU0bE/EXogklhUf2AjZJRLektlLEIuEAnJTszjPK
 eSqu5igIzS31INVSLDP8TKQ2z8tITDx2K1ZrGC+pdzx68OnzSe6W8Hz2sViUbjw3i4ES1EFCjYw
 ich64yTHJ8hz2oH7bDxHiZGEJzmke9NdIzufafy4liO/ZscSW6ZTu2VMHNxZOXHMSEcTqW9Jg38
 4j2giD8+Jxd094mNEp7kLx4nwIqxKmkhP2YoQEgYy3jOjYXyWiLiI8zb88iKsIaFjJPH3GsMNuO
 /MPGYGlQQ9nuTsYb8pg==
X-Proofpoint-GUID: e0ESVe4Aiat6-IFiAn50eeU1MgRrQAy_
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a906a2c cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UvNzHEgi-OKrLzb5I3AA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_094741_744930_8120954D 
X-CRM114-Status: GOOD (  19.51  )
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


On 8/24/2026 1:27 PM, Abel Vesa wrote:
> On 26-08-21 21:39:00, Hardeep Sharma wrote:
>> Add the interconnect provider driver for the Qualcomm Kuno SoC to
>> enable bus bandwidth voting on the platform. This includes the
>> aggre-noc and cnoc-main NoC instances with their associated BCM
>> nodes.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   drivers/interconnect/qcom/Kconfig  |  13 +
>>   drivers/interconnect/qcom/Makefile |   2 +
>>   drivers/interconnect/qcom/kuno.c   | 977 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 992 insertions(+)
>>
> [...]
>
>> diff --git a/drivers/interconnect/qcom/kuno.c b/drivers/interconnect/qcom/kuno.c
>> new file mode 100644
>> index 000000000000..9a5bd53e7ed9
>> --- /dev/null
>> +++ b/drivers/interconnect/qcom/kuno.c
>> @@ -0,0 +1,977 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
> [...]
>
>> +static const struct of_device_id qnoc_of_match[] = {
>> +	{ .compatible = "qcom,kuno-aggre-noc", .data = &kuno_aggre_noc },
>> +	{ .compatible = "qcom,kuno-clk-virt", .data = &kuno_clk_virt },
>> +	{ .compatible = "qcom,kuno-cnoc-main", .data = &kuno_cnoc_main },
>> +	{ .compatible = "qcom,kuno-dc-noc", .data = &kuno_dc_noc },
>> +	{ .compatible = "qcom,kuno-mc-virt", .data = &kuno_mc_virt },
>> +	{ .compatible = "qcom,kuno-mem-noc", .data = &kuno_mem_noc },
>> +	{ .compatible = "qcom,kuno-pcie-anoc", .data = &kuno_pcie_anoc },
>> +	{ .compatible = "qcom,kuno-system-noc", .data = &kuno_system_noc },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, qnoc_of_match);
>> +
>> +static struct platform_driver qnoc_driver = {
>> +	.probe = qcom_icc_rpmh_probe,
>> +	.remove = qcom_icc_rpmh_remove,
>> +	.driver = {
>> +		.name = "qnoc-kuno",
>> +		.of_match_table = qnoc_of_match,
>> +		.sync_state = icc_sync_state,
>> +	},
>> +};
> qnoc_driver_init() and core_initcall()
>
> then
>
> qnoc_driver_exit() and module_exit()
>
> Please have a look at all other Qualcomm interconnect drivers in upstream.

Thanks for review.

Corrected in v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

