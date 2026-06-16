Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379B7CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 21:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgOZGAVRtcof+wGB0xB9WSeFloGw8arPsNKl8QzdnwA=; b=Udsjc6VOQ5B2KKFOkIBfEn+qNP
	8hWim5YaeFnCj2XZjJ/ZMZAsbg9bgWwTRnW2Yu92xhIl85BawvBsct729DSc5o0IWX7Su3we5dbYp
	dmf2uvsWIp7N73i7mQTO4jJBzjv/AesZW3YdD4Pj9Y64fd1O9mt84dZzQTwqImcLUUedsK+ljTbDc
	A7Pi8QnhC1PMVwsPrjILmj/8xZjvOd7CWb+TbR/70E4JJvGqil6OaVs4flqRlnE7/nuGpEk5hkSYk
	VTVDgP2b6T2RdYLcskWvvi9hoEqiQmIMHDFA8cb/KhFDQ808bnKh88r9AZuQQDECl8wF1sfzeHl70
	/Y7/FKCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZb7t-0000000GKq2-0zx4;
	Tue, 16 Jun 2026 21:15:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZb7q-0000000GKpf-0ggA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 21:15:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOr2g172546
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 21:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sgOZGAVRtcof+wGB0xB9WSeFloGw8arPsNKl8QzdnwA=; b=Q2oPYf+jo1OvqJTw
	32YbeVDpke0fD6J3kNMfzmSzeD788D6pocq05EmXvXt0Rd/og22w3ueg/tKQpMza
	IzGGHORUG35ejfjyPofnYwOQVNW4XY4vLATf+Ce05VjNd6J6/Hy/K89MSUsgsUum
	xlHDXDlX4aZ+t74kQ6McsFoQpP9FfcOJXv58eGmkFPEd/CRfDeUsPU6fJFyXQnWn
	QZ7zfvvUDKXW6QCc7qD9bFcLrNs63W4bm6Q6rC2lX8BHbGbwjjBRh7zWnnDZXG72
	rAbzAXhzKbx7O8L375+oRJ1XOHnQXl9cTFmpCxeY+XAoVkJQSbR8v/YUByIwA2li
	+zGIOA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09kcd6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 21:15:12 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-137fc6f8e9fso4928288c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 14:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781644511; x=1782249311; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgOZGAVRtcof+wGB0xB9WSeFloGw8arPsNKl8QzdnwA=;
        b=QshefIba3Zg9iETxS3waYjhI2BEetoJAsPNa0Zhb7Qm0Xt/SMWbU5RGxWUN4nV4OPV
         8gDi8VdgdLDsMLihHm/dwJOBc5YC2/3tTeKCqRg+yPAjuiTkpgw5LZnjvHRyMxoAVn+8
         nEmWOv8OzJYlZsVNiyWA4Ai/eoHtjl0TjDZnvJrcywgVQq3qti0jw0yHv5D06I7DUX/R
         vjHfz1sqofRkK8s7E8R+AFz4S7894+I1BwDi2jehaqhbrviScM0BKLYtI1+M/UP4jjxQ
         spKeNxukF7hVByByKswOPwmH1ckk5nn7EFkngqmXYvubgZD2LY2uzy2w4FLfVn9HMM7H
         t7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644511; x=1782249311;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgOZGAVRtcof+wGB0xB9WSeFloGw8arPsNKl8QzdnwA=;
        b=Y1f02A9rQ7auwuLDQLwgNXlGrc0UZKwGB0/SqQDCeJv+Mw2gZXNAoXf2qA9nNI1eFq
         iQJ8R7Iqqej0gfaTZ4KHjC5nUJ0McMb1AZed8Gc62ksT0RPHTIXea1WdpyMbpfnNtftn
         wXF1iSm4mQCLky7dRLV89WsA9imv6RBlLUKg1khpwXfQigbY1T30UBTy/aVMELnCac9E
         myYXjVgVjIKi1M+GI37qPoA33fdGIX0W5YmhaLcIb6n6OTAznexs1Zla4QTsHPjjCGVb
         w/1vatP2EJyvyUkSsRP2E1ZcOtadXU86nQBjDVX0ksCaJq8ewRJWlqIsnjo5CgS7e2IP
         JvNA==
X-Forwarded-Encrypted: i=1; AFNElJ/D1FXSWkrDKdSptOEuyYHYfc52DIU9KOTu0FyI+f6iHo8zz5Tz4xhN3u8IzEr95MjQjpGCXfqU+7xRQhmV5MIq@lists.infradead.org
X-Gm-Message-State: AOJu0YxHE0lFegcBcueCSG7WRjcTiZZB1cbZxwUIe9pWIgT2+W5Xutk2
	w7+IBJ4vwkuD1XWlYzxoXfl5889F6xHP5jdW3fa+bOZwlvmyWNgrIjU6X76KI0TkUg/BmhPEwea
	C1u+Vr+6kzG0Nyl8V1iQeplI6xFPeRQq1UKj0RDMNoK1sHwn2YVsDuZTgq+jAxz6jYWeizBBctE
	Qnbw==
X-Gm-Gg: Acq92OHfGShOpq2OlSKj5Wa0UHEtYswztO8P2cIBk7n150kgmSLTylxKDYF1fkaR8ow
	1JSOdIE9jmu5QvcTwBCya1VJirWYdnRNC8NYOJOel/GB0IY+Mlr9nZKfiAoLKtCXJsGjJMShPGD
	2krLkDZ9ASmv+uLriEP1IUkUFUNeejR+Aswkww2DcxbH9zzcagGDbxc12Q4rj/Nfdm2PzMtDOOe
	NC4z6dYVbo+v6M2ZFWr9lJnND083F9cKrZdlIbSFxmQKdJ8dJD5GUfffUASdzGotdJYsqOns6lV
	HICSG2w30aOLpkRMw+ioIX6KGXVormQXILwSk0mM9feDhjXPICSTRzafo2VzNbD52fB2QOC9Uo0
	qOEWrpcZuOWi2gQNGRbTpiKiRqC/T/Shz5yQatrM/Nd1eafgZJQO6i6iTojwDqzmyIjlEsnsRYc
	FRP+7Qy96tlpbczw==
X-Received: by 2002:a05:7022:6b98:b0:12d:d972:b969 with SMTP id a92af1059eb24-1398f696275mr381893c88.24.1781644511464;
        Tue, 16 Jun 2026 14:15:11 -0700 (PDT)
X-Received: by 2002:a05:7022:6b98:b0:12d:d972:b969 with SMTP id a92af1059eb24-1398f696275mr381871c88.24.1781644510903;
        Tue, 16 Jun 2026 14:15:10 -0700 (PDT)
Received: from [10.71.190.32] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b97570asm14029259c88.12.2026.06.16.14.15.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 14:15:10 -0700 (PDT)
Message-ID: <eb50b45d-ad04-4da7-8cfa-6e1abb1ffba4@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:14:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_ffa: Fix NULL dereference in
 ffa_partition_info_get()
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
References: <20260611-ffa_partition_nullptr_fix-v1-1-ec2b7ef7e130@oss.qualcomm.com>
 <20260612-fat-energetic-hummingbird-8ddc62@sudeepholla>
Content-Language: en-US
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
In-Reply-To: <20260612-fat-energetic-hummingbird-8ddc62@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIxNSBTYWx0ZWRfX3c3QBTCJSwzl
 SzfojIY8I5TO5EQ+QjKW6wEG4FDIjjwq+4yMG20XXtnryk+XjTa0t359WPLCs0r4MIyItt/p/Bj
 kqUXiQpQPZS4pdqju9ZQ7zbPlOryHYk=
X-Proofpoint-GUID: tCXQzV8BH2WbK0Ikdh0szYbDQDGgjO4m
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a31bce0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=l2X_Lv62_SrtoPT5pgEA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: tCXQzV8BH2WbK0Ikdh0szYbDQDGgjO4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIxNSBTYWx0ZWRfX17CaygNknTvQ
 muQYz2USWMS6ZcQxASlNA/J8VQ1xFJErRr+gyK13XSB4SYCTXFDUmNlnEcW/oacGKnK4AqxqDUn
 oDIFArifSQ/HJ7Rq9t6gi+SVRiMqy8XMT3XPavCGcWf+yzm7CM7BV4/YPXvS7l5tsaPcuxzKK0X
 9ipILdu77LUEluPdcb9JLQA2P3jutZ+1Z4yKNboeB0KhkFlVdlVYdnGinkG2pKJzBZAs0eUYEUm
 7dYINvgdiqg8r4WVUMAyonKlzNvlGdvpkoAI0k59k1Ad6DVVpd/maY9NXUP/MZI6VcFz4RhIhQb
 xwFdYEAn05crPRCSwOgXJAXz5UtilFbAGYoV6RtL3IzPthrW0XIwtfXdP8VIx5lRth+jWi2SAoo
 zKF6jtQAVGfjcjgo2/SSqn/cOMTC0kntwkAvqwFw+T0+x+AlSv1hkYxa997EJoHsak50iNsr3ld
 fXPCd8EsOMi29mqAWYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_141514_384800_87F332F3 
X-CRM114-Status: GOOD (  22.19  )
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

On 6/12/2026 3:55 AM, Sudeep Holla wrote:
> 
>> Per the FF-A spec, the all-zeros UUID is the defined wildcard that
>> instructs the SPMC to return information for all partitions. Map NULL
>> and empty string to uuid_null rather than crashing in uuid_parse(),
>> preserving the intended "return all partitions" semantics for callers
>> that pass NULL.
>>
> 
> Agreed on the spec part but not w.r.t the interface. Where is the driver
> using this call and why is it sending null or wants to extract all the
> partition information ?
> 

A developer wanting all partitions might reasonably pass the all-zeros string
"00000000-0000-0000-0000-000000000000"? 

>> Fixes: d0c0bce83122 ("firmware: arm_ffa: Setup in-kernel users of FFA partitions")
>> Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
>> ---
>>  drivers/firmware/arm_ffa/driver.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
>> index b9f17fda7243..dd500fb81b79 100644
>> --- a/drivers/firmware/arm_ffa/driver.c
>> +++ b/drivers/firmware/arm_ffa/driver.c
>> @@ -1129,7 +1129,9 @@ static int ffa_partition_info_get(const char *uuid_str,
>>  	uuid_t uuid;
>>  	struct ffa_partition_info *pbuf;
>>  
>> -	if (uuid_parse(uuid_str, &uuid)) {
>> +	if (!uuid_str || uuid_str[0] == '\0') {
>> +		uuid = uuid_null;
> 
> I object to make it uuid_null. Below check is enough to check NULL
> dereference.
> 
> -       if (uuid_parse(uuid_str, &uuid)) {
> +       if (!uuid_str || uuid_parse(uuid_str, &uuid)) {
> 
> 
> I don't think we need to service NULL as valid argument via this interface
> as the callee driver needs to pass its partition UUID here.
> 
I agree with you, NULL doesn't seem like a valid use case.

Will send another version with your suggestion, thank you for the review.

Regards,
Unnathi


