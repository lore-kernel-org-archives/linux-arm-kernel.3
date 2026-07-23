Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8FBC531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 13:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2Yu9Mq1SFTFe8Mrc+cdWZt3E4WobO9rD3AAbFfTYOQ=; b=Q/Wb3PyKvxAcuVDf/qRJn2JkZ5
	ZL8u+sXhxfNdi/D/IyUafwFV5YyAu9Rv58xIOhshkJHrXTE76XaCUeivY+tx8anvXV3hpffgCllJv
	eYUJG/AciqKYjQQeAyW56JZK63m/PnUpAh2MK6gVbCIF+/4zp9TZyf6RR84iEiZX8ywW7AvJrnW20
	UC8FS7FnOeYVG0oZkEuCUBAPUjI2tBETm8nq+UaCE9hEMR4/XRfWjw7XUhZ3NqSPhMSjvvk3ONjfi
	QdZ6gzlWL1Zn06KMRXDS+LsfLK/ydEO7C9BZYXfXzf/lPEwxZ21h44H8kzu048VP4Z0w92a/104zy
	IU0FhuOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtGq-0000000EM0O-1vyi;
	Thu, 23 Jul 2026 13:15:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtGn-0000000ELzB-3gcf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 13:15:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvnbb011774
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O2Yu9Mq1SFTFe8Mrc+cdWZt3E4WobO9rD3AAbFfTYOQ=; b=YvnfJFYlc6uMK5J6
	USf20nI4P9ev31sIlk3UWubOmQvdg4ONcUSaWbPX/M3TX8HH/AD4tZGHQmkKmDnM
	/PJLc6E5vREwL6ZeBCZFEYoZ79EDzNMwIBboa6UToePWcKHMGv4gjgmqZOvsnisJ
	z6pD6BvX1Cdx5IKX0s5TRnWO+W/pWqo9J4JDKZJaAw05lekqmQf+U/iTcN5AF8lZ
	cJPzNFlUURdUpoLxzaLGzdSE7v+cScvu9Ds7znmnMPhHsvs6abVn0Y4Ttm4DHNQW
	eu+8DZqpL2xazJLJNrIx2GXsKEsGF/htrKWTLELE66umqLD67eHikWNqfi68Au6f
	ktpijA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkayha6xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 13:15:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so10313581cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 06:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784812513; x=1785417313; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2Yu9Mq1SFTFe8Mrc+cdWZt3E4WobO9rD3AAbFfTYOQ=;
        b=HROfZ91tH5zRgQ3kRKwmwv3rdS/dcVDmTrv6X7KJPH4tfOo7eHrxfWQtL43EWiuifT
         69zZ2qxeyq9Q1SRcC9qInfS22T/QGlqqN9gSHJcWD+gdC+cpRXda6qRJXkKAeEXbaJPZ
         tyXpWtmcsnxDkyTJ7LBts6mTJ8fwexsJClgrV36ep098ssugBYZkC5TzeEjt4JpJ6UBt
         UCuUcZYO7K3n8iGDuUIzsnWBneVX0RIg4Zp03CMAF44e7T2l+5lJqAHPRk1f8pGYPVZI
         XZFcIFVOgAiE7QLjOX5KSosSKYgd7q7BMvItnQBEfeDxH8Z6ZaZpLzbf8tVpoFtn+/9K
         ScUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784812513; x=1785417313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2Yu9Mq1SFTFe8Mrc+cdWZt3E4WobO9rD3AAbFfTYOQ=;
        b=nVdZn7YfqpWy7VSZG14SvKFZ/ipirBGIDZiUvqMIDqpE9hvuzVt4s2DeJToEtrpy1p
         d8xKKap4n3CBr5koox/G/7t/b8GEZhFJ19ibN8WkB5Sn5iyqVuYR+4TvFUh9IVC4WtQx
         dT3xZzt1C0H+yygSdvhj/9aqAnt/4s+EWB3HQYm8IjxrIGDXkJvXvsMh4cobMtKKynyt
         vmQQIWM56WKbOffqS2M9voU9g+9Loif8FlEt7jOrgjKGHzpPx8JJ7AxlLuZ4FyQtoH59
         F25a6S2Xsp795bvYWxnsMr6tMYwM47pcSXrZup7y33EMtW1YudrHds9xT+N51fB3YD29
         L6OA==
X-Forwarded-Encrypted: i=1; AHgh+RouvbPNubh0pgDgsX1nYfVRaTAow5Lw83FN/1ilGrcKrn6TH7YZ05KoXNg4O7FJzGRh9JUwEU1pp2U77gm10Loc@lists.infradead.org
X-Gm-Message-State: AOJu0YwcCMM631e89lxrF7XQ7Zw2n6Hppj2ZC0MYgGVlr6TlcaYvO/1B
	ZFGyJBZGXTIsfELqbUDppJVb5vmsWV1a898O+vA5JFRyoq9ZIwAlOMi66n+urBUnMDDwSgqme5V
	pI8uKV8ArYOKK2J2v3tpzQpjQeF+QbZJ1jOiaP62HGsZG5B2G+xwjO5FjpMjrfgI9ac+3B7i03U
	747Q==
X-Gm-Gg: AR+sD10dYnHM+EE9ZY+LZqOyX9wgkHwtnOyq9TlCIQoGLOUUn9a/WFFC2D5u1DVacdt
	f6hPwAQX1iY5C0A+9nhuYaLexFEgF0tANbceKgGkAOvlthctkgD8SF6FnAhEBXHXo9J0RDwSbRm
	w6tEhKpuMbTavCKyL/BbQwMMuJezjQ2QpU2aEP29nbdNLJe2Kr4woolxpvCltRkwZlnoiY5qui8
	qTdpvpRY1UxjIr8QlqcVoBPXaUotAEk0fxWUIIYVPiH5bLioIUNV3DV/yNWyC3kS4CK63jtSreT
	Oz2sYop+tMBSB3m3fx+OGnPnMAwQkxTv/oMcqNpBXdUjKia+Gr3fTEi+QhI31EZIBNRATLJswPy
	1R50n0PaCMCiimyW0u0sejh+RUmAsD42c24M=
X-Received: by 2002:ac8:5a0d:0:b0:516:ed02:c85d with SMTP id d75a77b69052e-5283ddfb06dmr27815841cf.3.1784812513412;
        Thu, 23 Jul 2026 06:15:13 -0700 (PDT)
X-Received: by 2002:ac8:5a0d:0:b0:516:ed02:c85d with SMTP id d75a77b69052e-5283ddfb06dmr27814741cf.3.1784812512670;
        Thu, 23 Jul 2026 06:15:12 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d31c73sm1031686e87.52.2026.07.23.06.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:15:11 -0700 (PDT)
Message-ID: <01237c3d-7248-4460-a115-512ca3d0a706@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 18:44:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 03/13] power: reset: reboot-mode: Add support for
 predefined reboot modes
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-3-e7453c548c21@oss.qualcomm.com>
 <9367ec1e-d01c-489d-aa3a-fb361538331d@quicinc.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <9367ec1e-d01c-489d-aa3a-fb361538331d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a6213e4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=v7qggGzDPz5B41Fs5RsA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: FCpKI-CC2_6DACFU6QQjYGss-6q28kQq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMCBTYWx0ZWRfX+E0Um4wSa8vA
 cYsD79P5WQRVd6eSJTrZTk5/4kXQ7T9ZslM15dIjSSWL0TXnPsTP4gl6v9904t5EzVsCJpqkb6U
 94pYOKddYK9oOlhZn5XWNMit1uT+jQfdCnnFa9Yk0+eJuJHAUouwFPUMHqSL2LuzDDjs3dnS6vC
 pZEIrBHsginhkHcTnLJWCSvmNCj1EmQfHSrwaeIYc935lvkRlw8Vs6zXUFKTtfraI3SHKBr+MJg
 P73H3jq3j73Wdj/1I5L/sKZ+J738gP8naFsNF9CcJaCOuyywqd0j5HnfqnUL0jirYsXvk5Itt2n
 KAy/oqziap/H8CV3IV5OvcWiBZ9PAoQxolPY+SMrVXD7xgBE+aRgnq0FhMrVqp0Pzcf+MC0gMx2
 EeXPnrFhGenNQfPYRHZQYLXgiXwD9K37xa66URhyiWZIZaDu/OPXyZnuNNPSX5RDPUsxrZhAEgw
 o9AB2XT81XsJg1aV17A==
X-Proofpoint-GUID: FCpKI-CC2_6DACFU6QQjYGss-6q28kQq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMCBTYWx0ZWRfX/1X73MXzfBED
 K7W9Cd+8wWMvHq9JKZGXdIetuCQDKMUYDNuIBf4WHXTyXmXiOIEw4HF3KYsKwKHk8fLecw++1Bd
 scpw6YYhF81FkqhqlQFnw0kyahUzexc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_061526_034735_3FBCD886 
X-CRM114-Status: GOOD (  14.68  )
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



On 22-07-2026 14:34, Pavan Kondeti wrote:
> On Tue, Jul 14, 2026 at 10:46:31PM +0530, Shivendra Pratap wrote:
>> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
>> index 34a81e4b4f95..b216c7595f7e 100644
>> --- a/include/linux/reboot-mode.h
>> +++ b/include/linux/reboot-mode.h
>> @@ -4,18 +4,34 @@
>>   
>>   #include <linux/types.h>
>>   
>> +struct reboot_mode_entry {
>> +	const char *name;
>> +	u32 magic[3];
>> +	int count;
>> +};
>> +
> 
> I see some where `count < 0` check, should not this be size_t or u32?

--
count = device_property_count_u32(reboot->dev, prop->name);
--
this can return -ve values on error. and we store the count in info-
 >count. Still the count in above struct can be a u32. Let me review this.

thanks,
Shivendra

