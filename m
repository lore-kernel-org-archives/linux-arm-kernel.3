Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F233CCC6B1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 03:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLcj2xFJ+ldAWy0+daCRV0vS+QgpQC6UVrd5FcRL0HE=; b=BbWn0gclSmAg0FlbD4eC7P5ekx
	JiUt5qx65uA9RYmZ2Ab1ECOOOVIeaO23lL3izcswg1518TY84VxOfnDp51/pzIssEPJovQ5xnYMUa
	mabJEcKc6MQnGZx0pzjOICi5gnvBu3c5Zv8z+jPcfw0mailUyPKud2zA7JwPZ3gojX6tnWL/fYe5B
	Ny2wd+FGjQv7gfA9/ySTx3bEiRAwoXX5zjpeSIuklGBCj7boCRwC5h4rHYocmOx6yAHV8OpQj94At
	SvB9J9X+4DbyVEw20YOolulRh4i+F2O5ecOJ5AoTtsGpcfA9Y1+eM2TbTkbsrJXeuan1kIjaPP8u2
	fjo+aEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCbz-0000000Gm8e-0bva;
	Thu, 15 Oct 2026 03:58:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCbv-0000000Gm7D-3p46
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 03:58:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F0FcIU1672232
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 03:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLcj2xFJ+ldAWy0+daCRV0vS+QgpQC6UVrd5FcRL0HE=; b=a7kG2EMKtNc3ppFV
	ogttzL9XW4vzOAZkDYPt2ffRra6tQRSjZqEc5ss7PKoRXS3+CC1neU11bs5H+wJJ
	hv0t6JzmuVAVNBJMNpYtXtmAHgvs0ZLgHPfCtsrwNzyRUiFaFgblwJe1V3XC0PN6
	5e+BVu6dTNcrxA0F6uGaN2XuN3U1OMcoMCDwscp9ZABI6fTaQcSDKunlFPDiWZXz
	U7uPDBBOcvNuwLLzE9W3WPH5sc8IN6Vq+iPqdYETcyY7IVg5T/j0sSvSx/BEH4d5
	1QpW/a0vbZDFtNGyLXbtAzN3PEPir4XiS13YiIp+WaDrZsNUxAmRnoE9UN1eiaua
	Q34uFg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhac4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 03:58:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-147be78cd56so19031067c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 20:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792036711; x=1792641511; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLcj2xFJ+ldAWy0+daCRV0vS+QgpQC6UVrd5FcRL0HE=;
        b=dFxPXflb1GeQAq+tDFS3qNJLe4YRzEjDhx7KUu6qf/wEhT9Iv86hwOXKM5VcvGHvcE
         e+gsN7FRHSriTGtHe8cTMyIZvDr7Ze5MGtXSXos88l0rf54HsvmUrRK8nbZE9m5Im9tC
         1S1cdJutkEcsFLUVlpl1SM3etWSzhTTeT40xx+NJkhchYh84bB7f2hK7vbQ2PuUz/5Ao
         wdkx/uCi4VAQYw2nvYg+UIgKzSGFx+hxFuQavLftPqXX/kXgJxiIvwI6oXcJuo9AscpZ
         x+iLJ7WdWYDDDRPl/0LLWoeYrf7XrpdJj5x0fRfXcQcmqi6lG4UZErK4/Fus62Uj0x6H
         +/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036711; x=1792641511;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLcj2xFJ+ldAWy0+daCRV0vS+QgpQC6UVrd5FcRL0HE=;
        b=vCVlTyx4KtFmoK1AX47vE54Yotc+lclSDQjFHLxQ5ujkk9sMhq5ec1if0RzFAZGmZG
         MSV3WL4AzYUwAfgfdDWBwwKiD0rwzwedkNbkbOkEhh48teyQ0BTDmv7VcbGPsf65Ts75
         SoHHFwChoxZSPFZUTDEP4Y/AORYN8ECJvUh8MIieNJG1rJZt0f4XweOiG7GTXpvTBnSQ
         YSVZvotizssgLIxelH1gmGmwfHpbUr9U1f1OR8ws5buFAftSpMNauo4NMF52EebmAGhc
         MGON010RSiY45SygNNChchTLDIzUms++HEw2R4Yw8wDRi3cmp5WsFjmDKxrud5VxJcWA
         nrWw==
X-Forwarded-Encrypted: i=1; AKwUvBxQVx1U/pLQ1REOqnvVLc0j8WCW2UvquqHYTH2kOdT8AnToMOidmzSAiEVbHEtLIL/X8uCMStQ2lOSCnxvBPfT5@lists.infradead.org
X-Gm-Message-State: AFq9FYJcUvhQHhnlYOPYuYFn7uLapeYzG6/Hkxppr3n+KgxathPO5EUk
	wzmKVTNKGk2y8rRM5HgAkEbOPGHftW9z8wc4JvsDcNKJ1S6IjI1L809PvgLRWnKlO+ffVs9HSzH
	1RL7/j91GqFgN7AUpDRm+gv+bqaCOXDL9f8vWUkSGu3ytgxYAJlBqJiORgzmHr4KoXK65OEQKFg
	zcCQ==
X-Gm-Gg: AYBFou3ysiIlmXWS0+QspRiXQpS/72Xuy8jyS9CDXjMZ9ypyHRwxPJwj4uEt4Ish9yK
	pX4NOqtkbm9BfbPcUxIA1Zes1zS6eZA0NAO1h+HZaRRXsha3y+Hd9PkDa2A1eHZcJwzQXTx32kL
	IsLoIct9Zng6F0a59dklNO5P2W2FeKNy9iQO6WUleCpbX1FS9ziOdx35WQc6jGbu+my6+zeoYNI
	R//bxIgbT7LBJZZU3SY40oawG+TsGNY9AwJu86K5cSso7oDGVXWxOVJ40MAWcYAnyYg3wrtaOV2
	17S0h+jV9p0FGWlHVvE5bSDXMCljRpa5ZQcKYiSb12hEeVWmxvZsg/m4v/vMj2Gvg8oFWQvaxPn
	NijPFbKC815bTjf5yzJ8+S3pPu5LRRA==
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr12450007c88.37.1792036710683;
        Wed, 14 Oct 2026 20:58:30 -0700 (PDT)
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr12449972c88.37.1792036710046;
        Wed, 14 Oct 2026 20:58:30 -0700 (PDT)
Received: from [10.218.14.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b29c2f861sm41853429eec.11.2026.10.14.20.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 20:58:29 -0700 (PDT)
Message-ID: <666e2768-28a8-4bb7-8c15-457ad20970a8@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 09:28:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] serial: qcom-geni: Use geni_se_set_rate() for
 source clock configuration
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
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-5-091697dbeb02@oss.qualcomm.com>
 <cf4b63ca-adef-46f2-a616-01841a70b173@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <cf4b63ca-adef-46f2-a616-01841a70b173@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Kc-TgXmgApeThhVOMRnNNNlq7Be0NNL8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNSBTYWx0ZWRfX5H++plfK0h7R
 6uPvfaYNTqx2bKT5hih4KvZ1KsX5jeNFjq0i7ISvYICuLdAQmfshJqM1kWNSlp2J/xhhsQyI3hl
 8zfQTbldq6lwgAI5CdeF9hrIDxQF2zw=
X-Proofpoint-GUID: Kc-TgXmgApeThhVOMRnNNNlq7Be0NNL8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNSBTYWx0ZWRfX7qLTroAWJdU0
 luFJTEzxdnUb9CVrN7vUgtgLLaJrYbdi+hZhZ/VYNg3Dcfe0GZUK/z/4kFHe5IGbGOG4X3JGsCH
 fH/IUlNbAzfmkYRdkqxxbmAfdifkT7j4SgZUGls3s+CCX9fqiAVrhifVp5rVfpPw3yfbmXJJrZC
 a3BO080yo6wMTRFVgz0a34t1dEeOdnbE5eOJZNzm9o7leiIRgtps9ShuXx8Qa7AcuENiFuVVS/k
 XkFf76TOJHFVABp8zcmM6GRCyaDBlajE49JPotuBffw5sZexdviptTky+GOXitxBH89P2/B5w+Q
 RpJDMzEHj9PJ+HZTtFIciP2uH1xP5DFrVRwH7sx636rbgTXITIhEm9SRuLsGk4u8KbaXoMOXxot
 NmcnmskDCQkHHIs9hvYYqo7X3FDYwRrz9GxEbrVCoIGb2oqWbCd69bvuqfHCTrSOPgJWkIhjYvW
 zPzAIEQPzuM6r9dm5Zw==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad04f67 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ip-HRx4nHBnhdLLshUsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_205831_958787_BBF275CB 
X-CRM114-Status: GOOD (  16.12  )
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

On 08-10-2026 13:05, Mukesh Savaliya wrote:
>
>
> On 8/27/2026 11:29 PM, Praveen Talari wrote:
>
> [...]> @@ -2039,15 +2041,19 @@ static void 
> qcom_geni_serial_remove(struct platform_device *pdev)
>>   static int __maybe_unused qcom_geni_serial_runtime_suspend(struct 
>> device *dev)
>>   {
>>       struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>> +    int ret;
>>   -    return port->dev_data->power_off ?
>> -           port->dev_data->power_off(&port->se) : 0;
>> +    ret = port->dev_data->power_off ?
>> +          port->dev_data->power_off(&port->se) : 0;
>> +    if (ret)
>> +        return ret;
>> +
>> +    return geni_se_set_rate(&port->se, 0);
> Is there any register access happening as part of this 
> geni_se_set_rate() ? i was searching but could not see after seeing 
> set_rate() callback removed.>   }

No, there is no SE register access as part of geni_se_set_rate(), nor is 
there SE register access immediately after it.

Thanks,

Praveen Talari

>>     static int __maybe_unused qcom_geni_serial_runtime_resume(struct 
>> device *dev)
>>   {
>>       struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
>> -    struct uart_port *uport = &port->uport;
>>       int ret;
>>         if (port->dev_data->power_on) {
>> @@ -2056,8 +2062,8 @@ static int __maybe_unused 
>> qcom_geni_serial_runtime_resume(struct device *dev)
>>               return ret;
>>       }
>>   -    if (port->se.has_opp && port->clk_rate)
>> -        return dev_pm_opp_set_rate(uport->dev, port->clk_rate);
>> +    if (port->clk_rate)
>> +        return geni_se_set_rate(&port->se, port->clk_rate);
>>         return 0;
>>   }
> [...]

