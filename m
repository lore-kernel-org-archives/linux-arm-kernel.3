Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB68EC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAzvwPMvS0QGNlY8eB3tLuP2d1LA5UE0AZDeb4igS9A=; b=YmxzkD6JSUYXZTekxNdhpjMwzT
	QZ4NCWZ/CgOrtnYL8EZ+vD890pmESSrhHb82Bd68xCxep6zaVOswCh9tXIot1S4vYRrap5NMlsJZ6
	PDVDM4NcFGjLljLbWZuYNIi1bM41rhf1hvgFtFqQQ7FH8uZ8uxoLPt60mKA8ZbHvEgblmEygGXPwm
	Lcq8Ao9vYdTzOzrNjHute2UnbKx4LtZNlsY58x5IpnWr9OpnR6H95JqCGXjlGziJ7KiTQoYAFtQDD
	fB4e2AkHymAtp9JYUNnE3qPdf4h91aA6qH12WEqVb+nCMCAnrsoUmyHAtTUThEEAr2yxY1C7/bBw4
	1mRv0XFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvUh-00000001GM9-48Go;
	Tue, 25 Aug 2026 18:03:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvUg-00000001GLg-0yci
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:03:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PHdSop2145243
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 18:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dAzvwPMvS0QGNlY8eB3tLuP2d1LA5UE0AZDeb4igS9A=; b=LStShXilBn/N/NVU
	B+zJ086C8sJhHVWLd+R8rKiO9UfjZ0740/W+UGfDVPq1bKPENeK4jFfAyipylQJu
	BVHo5R1jDR+u93GetjgtVEj78/zpeMpkezZobvZcP9GvPdAdpFo4xz526CB7J4/L
	wPFFto914JwtFXJGu1jM1yJ53TkHeSG+BI8vSo/ENi2hzJ3W+en+8vdrL2/bwVXl
	kJuIV4gj8mFE7uBeQYpZkJxQgJk5IOocT7/JvB5MDsMUsmsuP51NgRq1E37cVd3H
	wwmoU+biGU/cZYb4Y03MkYOB3Di92t2XG3svLhIS0lB99KMrFzTR7kXia+r5OxvD
	F5eR6w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9cgu110p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 18:03:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso156977a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 11:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787681007; x=1788285807; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dAzvwPMvS0QGNlY8eB3tLuP2d1LA5UE0AZDeb4igS9A=;
        b=TF7haHwcFEnMSY/Gxy/KK3iC7cGPm6QMHXfOCJILHK7yAxxPyn07bUW+Gr3qKdQKIE
         DQcsgdT14eD0L33Fl9XFehg5fh5yccCuB49LYATCe/zfi+kQotdsxLrpE1WAnhaD0Q6S
         dh4MSZy4YqF61j5rj5GfEv8JFyh0WAFqTpGBmgI0hi4ScBz8BwcfxmJhKisZIdhfcn+S
         dTLjX7h+Iu5FpqwilUnNxk59f7SEokgh7RjBYIxKQTTKJ3pTFWe1EPTThK9onqAZJxxy
         Cvn0QMq9l3Ap+tO81osAvzQuKVPSmkdv9AGPTytWOcAuI1E/m8RmmFF7y3x888roJJgx
         N2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787681007; x=1788285807;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAzvwPMvS0QGNlY8eB3tLuP2d1LA5UE0AZDeb4igS9A=;
        b=hFXINt+V1krFgKqMSUvg4RB9m4D831eteogS06kV3zD9zAF126Fw8g2ugnS0D7Z80Z
         tGJmleYOXI+fzzpdX+sga1SUGVfvHzn2WHM9PGsrcONMTXgsJPdF2dpc3A8WfSES4nYi
         V+iLcIN4MK3rFDJSVhbQzG+ukU7wHXiO7NduJrJbUIv+sJpbKV1hv+doChzC1qO8qp/2
         N4sVeS6h+IvR06zH1rPb8XDO2e/4PG6FVg9pVHStXRTZ4DxgdVV2AdpEsd/YUvz34OUi
         yH9VcVSj/ZGijtN0xjuYm7wUTJtShB++A5boQ85WGdWf6nfVd3K+L0RmVBgVhnpx+UcP
         rc/w==
X-Forwarded-Encrypted: i=1; AHgh+Rpzrc80ljHsS7uv5C53UD8ygSKgmTKednaA3Fmsy/i1k1mm4pAQpxjUZ/x2PYP1mIPGrdfndhudVIihbnvMwJrZ@lists.infradead.org
X-Gm-Message-State: AFuF++l89alZ/Sh9VkVrJfSDMCyQY8JAClT0mJnCm1GQshEeM1VE7bbG
	+KMSpcLH//q8jDgMRytVJ4y5F3SoDsz3eduVwxNhEUQqLxFfSZWTdFhTCSPEO6PSvJ/48Wdu1J1
	SOXAGsjpqO6lI/ofuGaSsIP9jmw2IUt4FnY0MvdhoX6uGKog9NFvugfop3+xb/FE+v1SIiB3n/6
	beDw==
X-Gm-Gg: AR+sD13jsKRVfomluFpUEbH3B1ews3/wiNQQncOgVItxPh+0V2SIzN1547zPaEJbYSf
	Wll6mDnphi0XbIv2towMmeeAp2ecW4uBBv3n9tNgQWpXVhxwCs+kzIgN/yduaWwKHN3AzVoQeT9
	Jphad3JtojuX/WP2zzTJoNybiMxLa8jUztqNCY49E4WuFOz+nHtIEksL/EIpeKrTFaZIOOzWlJ3
	NFdcmfLOkQ93gqc3jnTzOxInJnIRQ7DqThA304E8XnlyJvtNl6JN+lSj6Tn4JcgGOnYkZXhfTIC
	mfbaunH9DEh/9m5ABmz4DrVGhxonNMWXwtreMUV81/WM9lYTM8ehwW7gXkxMEiYOwhiqpIaCIOq
	9aldfKZNLg7fgEi87QveO+9rGr0i9vG6L
X-Received: by 2002:a17:90b:4e8d:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3966d400334mr1832603a91.1.1787681006066;
        Tue, 25 Aug 2026 11:03:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8d:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3966d400334mr1832233a91.1.1787681004826;
        Tue, 25 Aug 2026 11:03:24 -0700 (PDT)
Received: from [192.168.0.7] ([49.204.110.145])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a8f20095sm914906c88.6.2026.08.25.11.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 11:03:24 -0700 (PDT)
Message-ID: <29b5226a-d403-4bdd-a114-eeb2fd341ea0@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 23:33:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] i2c: qcom-geni: Use geni_se_set_rate() for setting
 source clock frequency
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
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-7-61171ab1cdce@oss.qualcomm.com>
 <8af7a34a-da4f-492f-a51c-cc420edc5e6e@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <8af7a34a-da4f-492f-a51c-cc420edc5e6e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE1MyBTYWx0ZWRfXxgvsZcdsClSo
 xtvn3AVrXum1pHZhMzuh86FR5QE67JR0hpmdaxj0BnBQG1+cl2lEpqM2RvZZMGc9Y0TGUdNhjxy
 ytkCgjgMHAHUfrFDBkzl1dgxqVs+3AE=
X-Proofpoint-ORIG-GUID: Ow_PgkQO8vMbqSZADBx9Fqfvs2uPfTGX
X-Proofpoint-GUID: Ow_PgkQO8vMbqSZADBx9Fqfvs2uPfTGX
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a8dd8f0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=T2iwtsF3Qoe1cvxaLfjbZQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=s8i-5AHMM79FQocxpXYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE1MyBTYWx0ZWRfX4y0+dApUEFZn
 LEYoj54gFe6MA7bkwvKhSQAv6n+UByW5GETdUO9C6iUZeWUBQYb+7wVqWYtvW7K0HZEsW/1XeoT
 foTCuxAl3aWFb3naDrl/ykeAfjcGw3N9/1ZOxjPwyz8H+mFCOEBq9efGIU3SKKhOHz26nTXuLpO
 4Gbpci3XsbBrBglLJ1Ox6kKyId9DrsCgCKQbjK6ngj8r+OayGSTLB+YExQNZJv/I5D5+wqsBtJy
 vsRichPqoI9wp2QTQkxrSQt/iNIdogsIfDD7dnhp9QAbFTXWZxnHJildXJ41UeH5hK8I5t2LVUb
 QrMXI2Tik40N8ygLVbWgTs2six8M0t/fMOmgPsMhkkHEwdGCaF+6WBphMQPJ3gobv3IHhiadMFf
 5RzoA5UPTytu58uHtFye2Q51ZqkqpZ9MOhT9cuqJ0uFnITB0XRqOXfr5GLRudi++y9gXy5e22kp
 lRoNtDDVEtkUC6aB5Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_05,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_110330_406978_896C875D 
X-CRM114-Status: GOOD (  26.65  )
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

On 24-08-2026 19:11, Mukesh Savaliya wrote:
>
>
> On 8/5/2026 1:27 AM, Praveen Talari wrote:
>> On the SA8255P platform there is no Linux clock handler for the SE 
>> source
>> clock; resources are instead managed by firmware via a genpd performance
>> domain. The I2C driver therefore relies on geni_se_set_rate() to 
>> apply the
>> fixed 19.2 MHz source clock frequency expected by the SCL divider and
>
> somewhere it's 32 MHz also and this may change too ?
19.2 MHz is just the frequency currently requested by the I2C driver.

Other frequencies such as 32 MHz are also supported and may change in 
the future.
>
>> counter values programmed by qcom_geni_i2c_conf().
>>
>> Call geni_se_set_rate() directly from qcom_geni_i2c_conf() so the
>> configured frequency is applied to the correct device (the perf domain
>> device on the firmware-managed path, or se->dev otherwise) without 
>> the I2C
>> driver needing to know which resources_init() variant is in use.
>>
>> Drop the now-unused set_rate field from struct geni_i2c_desc, the
>> geni_se_set_perf_opp() usage on the SA8255P variant, and the unused freq
>> parameter from qcom_geni_i2c_conf().
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/i2c/busses/i2c-qcom-geni.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c 
>> b/drivers/i2c/busses/i2c-qcom-geni.c
>> index a23554d101fd..4561e2d235d5 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -213,11 +213,11 @@ static int geni_i2c_clk_map_idx(struct 
>> geni_i2c_dev *gi2c)
>>       return -EINVAL;
>>   }
>>   -static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
>> +static int qcom_geni_i2c_conf(struct geni_se *se)
>>   {
>>       struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
>>       const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
>> -    u32 val;
>> +    u32 val, ret;
>>         writel_relaxed(0, gi2c->se.base + SE_GENI_CLK_SEL);
>>   @@ -233,6 +233,10 @@ static int qcom_geni_i2c_conf(struct geni_se 
>> *se, unsigned long freq)
>>                    itr->clk_div, itr->t_high_cnt,
>>                    itr->t_low_cnt, itr->t_cycle_cnt);
>>   +    ret = geni_se_set_rate(&gi2c->se, 19200000);
>
> hard code ?
Good point. The 19.2 MHz value is not intended to be a permanent 
limitation.
This matches the frequency currently used by the I2C driver and 
therefore preserves
the existing behavior. If support for higher source clock frequencies 
(e.g. 32 MHz or others)
is added in the future, the requested OPP/performance state will need to 
be updated accordingly.
> May work currently, but if higher frequency support added, source may 
> change.
>
> Also you have added in commit message, but add a comment also here.
>
>> +    if (ret)
>> +        return ret;
>> +
>>       return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, 
>> GENI_DEFAULT_BW,
>>                     Bps_to_icc(gi2c->clk_freq_out));
>>   }
>
> [...]
>

