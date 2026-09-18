Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAEEC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H0b15hwR+X1R3+E8CNb2EtpvuqC0WA2TxRhDhiiOrY=; b=iytDoxGkuksuvl5yPI0FWCc/hx
	uTWKqiXy6r1ZnzpFyJKT6Q1ZlMCIVnGFfjnF2tk30yhspXbBs8z7cPbCyeCkQlwGb1+wWgSKPIN9A
	JfuggEd6lo1/lV/40QkLoklHZ6ADOwOiKYplsOmDqDGQmOnyQXCyB4q/O8nnRthU2mwn5WyVcxzoM
	StKC6lKopMN5iOQ+kSD1Ud6ssoWRfCvwNF5pkHhYbm8igP5QRsbi9zUF4DkEa8E4xr8H7c0diE3QY
	wMMY5qLhLuooDs9VRFlAlI35k2psu8zhR1HNppN3PjmJjsM4QwmV1g12M5FzwpJzO5FnX873Dyylc
	fZVNclqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VHx-0000000E01o-0frj;
	Fri, 18 Sep 2026 09:53:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VHu-0000000E01U-16XH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:53:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dO9e3746849
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:53:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9H0b15hwR+X1R3+E8CNb2EtpvuqC0WA2TxRhDhiiOrY=; b=kKCGluDo1Uauwfwu
	G0gRnEKi8K2C0N6JHL8isiwVgVXPRkjqevT70AoxlTBWmS5mm4fZ10D4ORYZTAF+
	5r0maBrfZ3dngbKGO/jF8d60s/RryTl1SIN6Q+Qze7kRV26cmRd1yjBBLh3CZdPC
	epe1ogOHmCjRbt+Bn510qLLTelH2dhVzBexleiQ0T+lW+x/zZ6CrkUEOnTSbd5k3
	IRH3CC87Ch7XLdEo44BzUR4G3x9U1KDXVCO4V9gQ+/RKsGf7uTT2zjPjrrpztx5G
	/rL1Du/Y8aIwotzOaHzhAemEoaFxVzadEkElwZk8gKhEq7LdCB9qKFrw6je9P3Yd
	+an1RQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5kjpg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 09:53:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0b66ecd9so70609185a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725225; x=1790330025; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9H0b15hwR+X1R3+E8CNb2EtpvuqC0WA2TxRhDhiiOrY=;
        b=kaVJ0KA6sXdNaJBCnpr0ENG2vYtCxEK1KYFPsFjZREq94kBDKydVknh04WtNWcMalz
         z+zjN/265pmHwaq3Kas+2LatHI88vKH8SQs57bsRs23Q5MzRQBjBFj2/BSOdIcijDdu4
         QKFoKpOGjy6NVWDOiYeehUO9cL5rtb9VgTVEbNSOt6p2IlS6oxY77TpgCcF/IZuh8yS8
         DMo5uPkSLst8h7v0VUlyr810chl0ok9KLcjcgouVsEcD1sann5WH9Yxg+OayqV8P7UgK
         UpWRW65YipLoY6oyabUcv0tow1v8woJ/sfFFgvUd0FCjh0afvT4nzjWkva3Olt5rKd28
         mmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725225; x=1790330025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H0b15hwR+X1R3+E8CNb2EtpvuqC0WA2TxRhDhiiOrY=;
        b=iQsHXqlLAW5HB8Q4YKGHIL2904P/Yy02GculOfHR1xRAYtrOdjMdYWRzFK8mRZBbXR
         ay5DiMC+AU9QlJF8PqMQ8CM828FO7j3DnWq7/vAK1lB0tlpYIfy3oSxkxjnQ+BE68iGw
         W0vg+ZMl9284e5+8vnf+ylYHuGC5sJZaGXAslrylUz9f13Yl6ApIMNdhEd80/Hc1nV7s
         qLM1U26DBYPG1CvbPqsFIqwyZhxe4DOTdrdVVXRWRujOdKovrge4vnbg49/feSqph8ml
         cmYnCRW6tHf1A1ZbLLhAT20+fT8eMILA61uZEyAzehha5ewiCHfjrZyn0lCO6edC24fn
         92wA==
X-Forwarded-Encrypted: i=1; AKwUvBwxrk7PudfleHXyPWz34Tzz8EJn1XH0xKoI7+BbmkMQ7NH0oD+RUEPkDs0Xlws8jll76GvO5zHD6tfoV973bNLm@lists.infradead.org
X-Gm-Message-State: AFuF++m/0AvLa4+SjV8IFiEF/Z/W9p0hKGuo1xq7QnR1rKxRMWgosLKo
	rX8McmaYezdn5DaQXygmHewsu6bMjWUSE0LyPEt+9a+Q1GIhPtIE1id90QpjsTwqeThTDOkC7pr
	XNZcZoGe2UnAYcXvplQ6sNLQAnl+0e7goIo1FLom8QmcG9Fj274jR+t2n9fM19TWtt4qJzAw4B9
	+Szg==
X-Gm-Gg: AYBFou1fCVMGjcx5zL5/LRuyMI2CLcfy5plUaZxaGdxp9kU1I4Pc6kUR3oLU1c7MoGQ
	ZxlJW3KYboXkXLoa9g1zjuReOXzNLBYbKVVwA+x/Z6ddmZUxcakMqbwrskYgMnsRr6FnAhuyIaQ
	+baaA2L1aFmZL44gugjdIX1DXsywRMiaUkXxBtaCrR1i02ujoc+5/M/oTUzq+X+B+PPdzXI+gkt
	I/pCVYTRBTZXfc1MBQaOiA3P221n5toSJvmPakpR0zCb0sygWQEe82bQzBy/7pzMrepZzlk5CeK
	kj4zXail1C7+anySoqCPnWLsZ46bQylTfL0jPyrEfJ2bJs6aa3oU0oHGTYw9U769ykM89DZyCTl
	1GAsyzJinzxVuCs7jiqd86/3HIXgxfH+xTP9Vr3kHR5Fzuqz0GS3+UOyvGSbDbAc=
X-Received: by 2002:a05:620a:1a0d:b0:93a:c10c:6b5a with SMTP id af79cd13be357-93bdc7237d9mr245918185a.29.1789725224535;
        Fri, 18 Sep 2026 02:53:44 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0d:b0:93a:c10c:6b5a with SMTP id af79cd13be357-93bdc7237d9mr245916185a.29.1789725224114;
        Fri, 18 Sep 2026 02:53:44 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5d63sm3071523f8f.3.2026.09.18.02.53.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:53:43 -0700 (PDT)
Message-ID: <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Frank.Li@kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNiBTYWx0ZWRfX+gOY5COWsf3H
 ArRmFSm8LyxMfrioyOl5IgszQVs/GsJTa0Ydgw1ipAhaz3W4WIoAMR2F0sNof8f67UUMcQB110u
 44F3xHIpRDmp4iHKuUd4NNLo5ohxGwTqSIijJLCNc9E8+lkQSiWzTIpW4h6ZTsBYlndlTeZrxN3
 ElZVemGF4oCOewBO9N0KV6O7CQbGu3tbPuBlMBsri7NK6KAATn/WffM0mTsx0psDCoaom33hJBv
 NLsiIELY4E+XSrB5Le+KrZfShV0fXdcxdTTxIpf3uASf36MrtdN6dQnzPCQnvENcBwaT5LMnjoJ
 SQikde0W6VO7biET8h/H5OBisUowUR67HRIcUYkr+YioUa1w8l83z5y4ko5UXaA/ggadvGapsHx
 7BJzRqBnp/qPLy1BJ1x2DC5qZIrXpE2oW1K+mwyTQUJlE2HS8f92vad9qdHkKnQMORaP6olwJMZ
 4sZbY5cOIHO1qUeleYA==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad0a29 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Qub20nr9Pen87uBCr1QA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: uWHNSih9Ac_1plEbmu9YVppBYj4w72zW
X-Proofpoint-GUID: uWHNSih9Ac_1plEbmu9YVppBYj4w72zW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNiBTYWx0ZWRfX71pgua5hmKg4
 upHoRNBoqe1CXAwEIfs2gzLqAhxShCxNcleBnGX1FAX+npiVIEhlTxMbPLq1UiyRphyIKpKI7XL
 u4gknMI1mlWPjL2zDJGhAHX4YX0IGwo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_025346_315289_E0EB1190 
X-CRM114-Status: GOOD (  19.71  )
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


Hi Hans,

thanks for taking care of that


On 9/18/26 11:29, Hans de Goede wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> SCMI client drivers already describe their bus match data with
> MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to consume
> SCMI device tables. As a result, SCMI modules do not get generated module
> aliases from their id tables.
> 
> Move struct scmi_device_id to mod_devicetable.h so it has a fixed layout
> visible to modpost, add the corresponding generated offsets and teach
> file2alias to emit scmi:<protocol>:<name> aliases.
> 
> Use the same stable alias format for SCMI device uevents and sysfs
> modaliases. The previous string included the instance-specific device
> name, which is not useful for matching modules.
> 
> Assisted-by: Codex:GPT-5.5
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---

[ ... ]

>   
> -#define SCMI_UEVENT_MODALIAS_FMT	"%s:%02x:%s"
> +#define SCMI_UEVENT_MODALIAS_FMT	SCMI_MODULE_PREFIX "%02x:%s"
>   
>   BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>   EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
> @@ -185,7 +186,7 @@ static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
>   	const struct scmi_device_id *entry;
>   	int ret;
>   
> -	for (entry = id_table; entry->name; entry++) {
> +	for (entry = id_table; entry->name[0]; entry++) {

Is it possible to rely on a NULL sentinel?

Here if the id_table is NULL, entry->name | entry->name[0] dereference 
the NULL pointer

	for (entry = id_table; entry != NULL; entry++)

>   		ret = scmi_protocol_device_request(entry);

[ ... ]

>   #include <linux/bitfield.h>
> +#include <linux/device-id/scmi.h>
>   #include <linux/device.h>
>   #include <linux/notifier.h>
>   #include <linux/types.h>
> @@ -951,11 +952,6 @@ struct scmi_device {
>   
>   #define to_scmi_dev(d) container_of_const(d, struct scmi_device, dev)
>   
> -struct scmi_device_id {
> -	u8 protocol_id;
> -	const char *name;
> -};
> -

What is the reason of converting the char * to a fixed array? That 
limits the name and may result in truncation and potentially name 
collision, no ?

[ ... ]

