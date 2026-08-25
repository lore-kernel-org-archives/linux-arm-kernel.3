Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237BCC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 13:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaVfdGUEZ4eLonecVULryIdNy5Y/IszLAAF0qOUkWYs=; b=NwilvTb1UijUDIl+vsmqk1wtsv
	qZna6lrn+xTsEaC6r9xtNQ2slWltoDpol5wJn1bqJ1C2igtkU1QsquH0ItTSJocc+XrjtensFBPMg
	g/Ks/Bp+KUnnKP79YuGIKXWoDs2FChQEr9RXEgr2cARqNASL5bm1v253eBmUhzMQUXloBSfahwfMW
	zSdl8f689NLfwv8/kkIx+iIZEBgJn2WWe/S0Hk0nC7qDKwnTtH1n628M1fvtvRVTOtTUjA63tEE/H
	Gepv9reaFH+gMMamYW8Ib0rofqIOzza8KzyD0mbarZDihyHWRUPJTcGQ192NdAAB8Sn9snWax6JYQ
	ajbR8FSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrIJ-00000000sC5-2qzl;
	Tue, 25 Aug 2026 13:34:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrIH-00000000sAx-3VjC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 13:34:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PAut0x1152791
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 13:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TaVfdGUEZ4eLonecVULryIdNy5Y/IszLAAF0qOUkWYs=; b=FnffekqeV8VFB+Ck
	19eFxD/ZL3SeOCpShcRv2c3Ha5sn3Offs2Oow35eByVWEaXH7foOXc9kBf8VrffX
	EhmcvQ4WsT7din/nntI5p8KYtNKnnxQxsQOQuiHv1MMlbHD6kMsfOBvHjpbAqtyZ
	ZYuJ99fzWV64B4SG2tZWxFNHn6JJtoN5rFLoX1GjAm5MbqL81OeJ5WU8+2eBLFDE
	/Yy/VwhB68O8TI9YcA3R8jtrnG8guEr7MyRkap8Wr32Xo8+oQgK5644aD+IMhvDT
	vvV7iaBydDKFowLV8EYzd/ErMlUsQIz8ZorUIfyzVVW58FowK4KwSLKn1Sh+e80F
	bNUdYg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93nat5pv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 13:34:25 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e9e741693bso8847612a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 06:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787664864; x=1788269664; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TaVfdGUEZ4eLonecVULryIdNy5Y/IszLAAF0qOUkWYs=;
        b=CpV33jmTkz4R8nVV0PYdDQhJ5SjECeZib3rSUbu2qfTmg1XldJGFrg0Zi/JJpS0GcX
         Ymxbyod1kD9Vlcbt39aOoEKRLvD1gSIGFTuEBpjEc71H89Uq1vLyGn0anPrMLNZGQzZL
         83+bYsBYCMwUMAeBKoST3HszdrwMn3jVIXOxqkcaUo3BAx+9Jmmyk4g2W55WY9fhIaUq
         DyZiMN20ZhkRA9KKM9x/jVRZVc11I/xJoLCU0cWguZluwFCJ0WAiIZogcEfkAQwb0CFK
         NBMFCAWCN47OOXee65KGYBQJGsb/FYfGxX5KuoUsKbIwTt5kXJ5fX9MBxGXXiuxxoCro
         newg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787664864; x=1788269664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TaVfdGUEZ4eLonecVULryIdNy5Y/IszLAAF0qOUkWYs=;
        b=swu4KA082qbwECBkDLCIDCUSL4NEf9A2e2NcUCebBYXSRGUbYLp2aLbonxt7k+CfMX
         ICyDK2rZTW82wzocibUlEQQ7xfWpc0Y1FD4Q9S5+t/JKzGKVmurPgVGsZWIxwIIe5Ep2
         yQW4nsMVlaHYFaDxpPzcPtZg9NOwQvyqYcPcMvWLs9apaGxIViQOka2zQWwgE9LGaC7q
         ak1C53o9/HyOSstn07COPzT4Ln5hrQXPEM6oNzCm12OlQhiU/3943p1bOG2Cj3n+eTM9
         S5MfKqzS3ChyPFPI4qUgj4b5gqZ7GdbJDVUor6R+H98tD9fDY09vuGcgEFhG5o7U1FTH
         wXrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAu4VAnBzy+hzAyEw8uzf57CGj0evsYyXMt9WQTRmRgpjVvYBxqDx2r8f2jx+73VXPxpfBfMFe3Src8c1bDkzH@lists.infradead.org
X-Gm-Message-State: AFuF++m6207s6WGsjDnMFa5H+l/hxDfMNGPLnTaHD6r16TtK9dE1icBn
	U5iX2w8Qh41E2Sn4QYd3FOUrSFDHYJOQRHROJV0D6rllCnyy4ILr7MgTAL/HvY3rimYSY87o4oC
	aP3FKYNfLS21zdtRtnAaUPtWB4lBMixi4ntzXWoyaYnjvSOLRQ2Ywq449cIwCqWNezidiT49cKL
	AMMw==
X-Gm-Gg: AR+sD13Rf23rWBVypaCOaWaVz9btKZ47jojmVo5K52OJWzNEk3TElTqWxYeg/MnhFmC
	g0qJv7VKbdCTFeXC08pg8dh86G8u1CKGbZDgZmfrxcEpPv7BHjpNHFYDf7OoVN8ZIzcMMZCDKpP
	6pYsVlBDsv5Wn1sAO9zUkuNpy9d4LwK0WhBEb9SNBjtzyqvhAsSU+G4y5JtvdULhoUeCd7ASUsR
	G6+ZKv5sPOFxVF5NcRFlllDdTTQxsiYI6ne4iMJdIRp7mGqOMS9FfFV5MldoMySPn9WrmuhuBiX
	Qp3/OYaHMZSi6YFb47mRfZ5/c6N+2v09ke/5yTq7vlaakDtIJ6+rRZ21MvLrDyHqKGN5TgfVcv/
	ntrTv4FbmT0+M4TOy3ZaWf7JgmJbfLr9j
X-Received: by 2002:a05:6830:4116:b0:7f3:a8ac:45fe with SMTP id 46e09a7af769-7f461510b2fmr33747265a34.11.1787664864247;
        Tue, 25 Aug 2026 06:34:24 -0700 (PDT)
X-Received: by 2002:a05:6830:4116:b0:7f3:a8ac:45fe with SMTP id 46e09a7af769-7f461510b2fmr33747175a34.11.1787664863701;
        Tue, 25 Aug 2026 06:34:23 -0700 (PDT)
Received: from [192.168.0.7] ([49.204.109.155])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f48fc866b5sm7180397a34.23.2026.08.25.06.34.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 06:34:23 -0700 (PDT)
Message-ID: <57b9cb3c-6fcc-4f61-b372-97de8058ffac@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 19:04:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] i2c: qcom-geni: Use common GENI resource
 initialization helper
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-6-61171ab1cdce@oss.qualcomm.com>
 <2329d1dc-9907-4338-8bb6-2a32e3e261ee@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <2329d1dc-9907-4338-8bb6-2a32e3e261ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDExNSBTYWx0ZWRfX7AimQ8mf/B97
 PY+P4jaAowS3v1qCRS3w44ZypyR/kcP+GKtmWBdJD1Mmx4kqizoFE0z/q8TLksmA2PUZGaWFb5z
 XzmqeRqO7tsCtgBRfujaT36HmVIuJYs=
X-Proofpoint-ORIG-GUID: Yl7w-f6A9OouCbweAzVQaSsoxp-bcLYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDExNSBTYWx0ZWRfX1FxsYS3wLzhj
 GRIRij9uGxhGYDmXVPPbmDow/rXcXpF9ojJkdG0YyzgPAFiPLllkcbLjaWJOnGR51I3m+LkkZHp
 pmB1P3+JP8N+NwT5zf3wuIhG9FtG336bWgZrbbzMIRq5B87BI7HirdNZBsZDx5KY4mUDkuerdKF
 49l7+xXYppgBYJPGhrAGPTJmtNlXlRH1KPIJJgFwFbD+caf5dbHZ+C4BbvJGRtlYouzeb3/hTd8
 wwCuQoFvYE3Nt3nPwO6NP2GjmeJxSCm1R8kwUG1msAgQY76nkLn3s3gTfsWTDL6eM6lpG4aGmUw
 UEH9DDR7t8V9Udt6xDbdO1lI2t8VzrtIhEHi0hJlFSzEOYDq/L9L4a10SxSvxu8TinxHsAiPos1
 a2QaxF1Pqu+fZfMmLaPIygIcnM9k43O8zO/oq2zTDejad0niKQMgf9p32cAAbJPLXGdJgtY7Uqs
 T1viA4eb546ZgRt/KHw==
X-Proofpoint-GUID: Yl7w-f6A9OouCbweAzVQaSsoxp-bcLYj
X-Authority-Analysis: v=2.4 cv=W74IkxWk c=1 sm=1 tr=0 ts=6a8d99e1 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=V2Vt80KW7rYiXl8IeOG9JA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=atO44hwG55kBqV7UmNcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_063425_883603_846C5BFC 
X-CRM114-Status: GOOD (  22.99  )
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

Hi Mukesh

On 24-08-2026 18:42, Mukesh Savaliya wrote:
>
>
> On 8/5/2026 1:27 AM, Praveen Talari wrote:
>
> [...]
>
>> @@ -228,10 +228,13 @@ static int qcom_geni_i2c_conf(struct geni_se 
>> *se, unsigned long freq)
>>       val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
>>       val |= itr->t_cycle_cnt;
>>       writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
>> +
>>       trace_geni_i2c_bus_setup(gi2c->se.dev, gi2c->clk_freq_out,
>>                    itr->clk_div, itr->t_high_cnt,
>>                    itr->t_low_cnt, itr->t_cycle_cnt);
>> -    return 0;
>> +
>
> This looks wrong to me.
> First accessed registers and then we are setting ICC vote ? we should 
> enable resources first.

At this point the hardware resources are already enabled and  the ICC 
call only updates

the interconnect bandwidth vote. Therefore there is no dependency 
requiring the

ICC vote to be issued before these register accesses.

>
>> +    return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, 
>> GENI_DEFAULT_BW,
>> +                  Bps_to_icc(gi2c->clk_freq_out));
>>   }
>>     static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
>> @@ -1100,24 +1103,6 @@ static int geni_i2c_init(struct geni_i2c_dev 
>> *gi2c)
>>       return ret;
>>   }
>>   -static int geni_i2c_resources_init(struct geni_se *se)
>> -{
>> -    struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>> -    int ret;
>> -
>> -    ret = geni_se_resources_init(&gi2c->se);
>> -    if (ret)
>> -        return ret;
>> -
>> -    ret = geni_i2c_clk_map_idx(gi2c);
>> -    if (ret)
>> -        return dev_err_probe(gi2c->se.dev, ret, "Invalid clk 
>> frequency %d Hz\n",
>> -                     gi2c->clk_freq_out);
>> -
>> -    return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, 
>> GENI_DEFAULT_BW,
>> -                  Bps_to_icc(gi2c->clk_freq_out));
>> -}
>> -
>>   static int geni_i2c_probe(struct platform_device *pdev)
>>   {
>>       struct geni_i2c_dev *gi2c;
>> @@ -1188,6 +1173,11 @@ static int geni_i2c_probe(struct 
>> platform_device *pdev)
>>       if (ret < 0)
>>           return ret;
>>   +    ret = geni_i2c_clk_map_idx(gi2c);
>> +    if (ret)
>> +        return dev_err_probe(gi2c->se.dev, ret, "Invalid clk 
>> frequency %d Hz\n",
>> +                     gi2c->clk_freq_out);
>> +
>
> why not move to geni_i2c_init() ?
>
> Check recent patch @ i2c: qcom-geni: add I2C frequency table for 32 
> MHz firmware-based SEs.
Okay let me review it and update.
>
>
> Let's agree to move there, to avoid issue.
>
>>       ret = i2c_add_adapter(&gi2c->adap);
>>       if (ret)
>>           return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
>> @@ -1281,7 +1271,7 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
>>   };
>>     static const struct geni_i2c_desc geni_i2c = {
>> -    .resources_init = geni_i2c_resources_init,
>> +    .resources_init = geni_se_resources_init,
>
> why to add common driver function to i2c ? and also spi, uart ?


The goal was to provide a common helper that avoids duplicating

the same logic across multiple consumer drivers. As a side note,

this refactoring was done based on Konrad's earlier suggestion to

consolidate the functionality into a generic implementation.

> Can we not call that function from within i2c specific hookup function 
> ? i think design wise should keep i2c as local function.
>
> Also driver specific anything can be managed in local function.
>
>>       .set_rate = qcom_geni_i2c_conf,
>>       .power_on = geni_se_resources_activate,
>>       .power_off = geni_se_resources_deactivate,
>> @@ -1290,7 +1280,7 @@ static const struct geni_i2c_desc geni_i2c = {
>>   static const struct geni_i2c_desc i2c_master_hub = {
>>       .no_dma_support = true,
>>       .tx_fifo_depth = 16,
>> -    .resources_init = geni_i2c_resources_init,
>> +    .resources_init = geni_se_resources_init,
>>       .set_rate = qcom_geni_i2c_conf,
>>       .power_on = geni_se_resources_activate,
>>       .power_off = geni_se_resources_deactivate,
>>
>

