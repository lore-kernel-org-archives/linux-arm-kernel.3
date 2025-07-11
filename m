Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8283DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+uJUa0zDVqqPkW/P6ZNncfaiD0Ik/YbmbIwujNrzqc=; b=qObs0uWedevRRn8UwaL7z85t0r
	HJMSB6mmHVo22+QlkZqSKHd5f2ooMe0+ye+i1PeBa7+BwxooFmfToFRt2BrBnrUtraFqQntdG0HX0
	4G7sQIOGNIrOpOWxEYyd4Lhdo8fTi6D0YUk6YPJ95byIgOVbuKykjBdeBKcIaQfB1+4+C4vAoWbAm
	MUT/8L4PS6F9gc+L15sTysaeqd0mXwwM7+HAMK3OKajitXhWGvMgc/GDqL4uPuww9RuoggTsLDksn
	l5B1xBGlDm4pdLu+gcdeCZarRaRYZyueg/JcjmKJUN/f2J9musYrIqS7DFf64eVFjJY+19iRaJZEs
	CQNzyl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaD0n-0000000ElI7-138d;
	Fri, 11 Jul 2025 12:37:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCvX-0000000EkjM-42wz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 12:32:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAurwx026053
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 12:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I+uJUa0zDVqqPkW/P6ZNncfaiD0Ik/YbmbIwujNrzqc=; b=E/pjBBToKGzsD7Nd
	aP/K0oulwHPlxsH9QDB5UjkokGaSTwp+ppzV3nPC+zT0BAr1G2IsxtUchb0/O1r6
	IXdkA7CV8TuW/2M6R1CGUEA9OTppGialSdxTjdC5tlulcQFhsGbFUpxIAY5Wdejn
	A3ym7h3zKXy/RBGl6G/H77MKPrI7+QLrsSlDnCZJN7KV9rsIRPzDY02eapz7lveF
	aZ7oKzOgavVo3GAdhfV6WxApnbgw0XnrD2vuizxgp7T753m8zZZmrSlR6jxDNbDC
	4rgx/9s1/zjlN4vrW6g+s0VCJ+K5kIBA7byNQu6EUv95pcKztrKQZlEfD0AxWhx4
	apS7jQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47u1a2g7s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 12:32:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7492da755a1so1839958b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 05:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752237148; x=1752841948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+uJUa0zDVqqPkW/P6ZNncfaiD0Ik/YbmbIwujNrzqc=;
        b=Nqqxem3dtzxoY3xHHKb6ofY9gx3oCdWLnSxBYd8BPWp6X237RMLTBMrh1OdbrwKQaG
         84iiVgKZsyfNHhYr7bcFpke8Ukzd1pe6Y+f2eKHkg97PzZf8wKFoUSNRmKO/pHwTCIe2
         /WdyD3oulCkAYZN16wJegmfNx4tKrAUwwtiCo/Kh8KH/gkoLeV93bcnytQy6L/f5Yhhh
         iBr14UDvMj015TydBybs0BJxwAeTs35ijZKcEEKHec7wnKuS/0EBwzsIcLHqpYfCi4Oo
         aXouU4EaIgc7oyic+GHXP5GueC6ESNpNLW1vPyba+0kleZp+5iAJCM9itiDfx2QWD8cC
         TqCg==
X-Forwarded-Encrypted: i=1; AJvYcCVB5uxbkktpQalbi6tuIBYfe4VoaGUOyIDjibmt7eoURv8EQ8ECMxBeECPokvBz0vG42QHrj0adm9jnxK5lfxup@lists.infradead.org
X-Gm-Message-State: AOJu0YzMWGhLflw6akLD1Tgya2T3t4VRknx/LP0YeUsYdkUllkU72LV9
	6T/xmyIHg+P+e8ortHcW3pjqAeCsCvg3VtyULW7mlYKuBwYj0gglsbCBTSZNXKYnp8SZmwHBhmf
	Pek3YhFUBJnbmFU+fVl//4HbYYjoNDJhxBIMX9G8jR2w7uHoS/044Ew+z6ioZB5gHt3fauITOon
	v/FA==
X-Gm-Gg: ASbGncuyQyx8EpZQ6wLv7L52Ura8/geYw5LkOYdAXJzPGv+SDpF8fKIJn2rVs4Hzc0q
	SGkca4KV4zCyW2ZX1Y1CbfBYXrzJfXZiu5uNZPQ/X4YqTewtD5N3s3ANifL0+1nQ3gcoULvWY14
	3kpFRUQa8Hgwt5UMOiUeHLmLt39iE5/bCuAQn8Yq1KDvkB+nosHfIvLszpzgQ5AV7rgFrTRJEKs
	qW6H3L5MPC5V3BBMMGQ3bdFThQ+HVYKpjIkTj4I5VzgDsWN+bof0ajGpnjCiGOLDN2WOWr8dZpW
	N9Ksftt13yqQFb2gSNSgXrX15YM5F4dzYHnPhYAkavy5aJdRjio1O24ahsa2H0mJHR3a4TQ=
X-Received: by 2002:a05:6a00:1151:b0:74c:f1d8:c402 with SMTP id d2e1a72fcca58-74ee07bb96dmr4845193b3a.8.1752237148312;
        Fri, 11 Jul 2025 05:32:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9gsUsqbiWSyynICyXIvV85uCk9/J6nn3GoQC+GKfjb1N1fCIuGevD1MSbYwD9kXnui8JeEw==
X-Received: by 2002:a05:6a00:1151:b0:74c:f1d8:c402 with SMTP id d2e1a72fcca58-74ee07bb96dmr4845108b3a.8.1752237147622;
        Fri, 11 Jul 2025 05:32:27 -0700 (PDT)
Received: from [10.219.56.108] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f90d66sm5040981b3a.173.2025.07.11.05.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:32:27 -0700 (PDT)
Message-ID: <cdadd6cf-18c9-15c7-c58a-b5d56b53452a@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 18:02:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v10 02/10] dt-bindings: power: reset: Document reboot-mode
 cookie
To: Rob Herring <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-2-b2d3b882be85@oss.qualcomm.com>
 <20250710224740.GA15385-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20250710224740.GA15385-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MKJgmNZl c=1 sm=1 tr=0 ts=6871045d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8
 a=PKmmUXB_vcMajKhYsGEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA4OSBTYWx0ZWRfX6E1jABW1tjJr
 ud696SNIUITuClMYGTELCqw2wAWA2nwJELQi4EJ9SaKzTOU9UCwzgJA2kiqcVYevG7NNOZwywHF
 PwwDbBx76tQ291tBZL1JD2jGDjYeiAituAufK80yJN/R7fb9ElEIuBSaCnXQq0a8KG+fuF1IamE
 NGOn56/FT0vVklEHciEu66chqLK1tSn9hrf3lx7YtAL5NZxb6EI+l3bK8oPVl8h3aaupfXLXrpo
 AxcEFrlru+2IquydOn8r8VeU1ZapNLHiyFWiSP5F/cH0HixIMmXM2F/zqgg9Vf7jntIDY6MtJqt
 u5FQje1xf4Db8EIhJyBqVDwoHX3i2rAo6GCuPI8QYRWOgGceNn2sWPZbWBokTMirxe9O2xYW65t
 on7AZEAZ7g+ykt1ClgUM+IlI4ebFGsVQs7O2pFzwtFA33In4D/PuvgepIdVYlK/sD+v20WB+
X-Proofpoint-ORIG-GUID: 8W19KcbPVUzJVkuTh_FT6c7t0wXv2ZlD
X-Proofpoint-GUID: 8W19KcbPVUzJVkuTh_FT6c7t0wXv2ZlD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_053232_112055_74B8B234 
X-CRM114-Status: GOOD (  24.02  )
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



On 7/11/2025 4:17 AM, Rob Herring wrote:
> On Thu, Jul 10, 2025 at 02:45:44PM +0530, Shivendra Pratap wrote:
>> Update the reboot-mode binding to support an optional cookie
>> value in mode-<cmd> properties. The cookie is used to supply
>> additional data for reboot modes that accept two arguments.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/power/reset/reboot-mode.yaml         | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
>> index 3ddac06cec7277789b066d8426ea77d293298fac..a4d2fe1db51e0c1f34ebefddaad82b8cc0b1b34a 100644
>> --- a/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
>> +++ b/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
>> @@ -10,14 +10,15 @@ maintainers:
>>    - Andy Yan <andy.yan@rock-chips.com>
>>  
>>  description: |
>> -  This driver get reboot mode arguments and call the write
>> -  interface to store the magic value in special register
>> -  or ram. Then the bootloader can read it and take different
>> -  action according to the argument stored.
>> +  This driver gets reboot mode arguments and calls the write
>> +  interface to store the magic and an optional cookie value
>> +  in special register or ram. Then the bootloader can read it
>> +  and take different action according to the argument stored.
>>  
>>    All mode properties are vendor specific, it is a indication to tell
>>    the bootloader what to do when the system reboots, and should be named
>> -  as mode-xxx = <magic> (xxx is mode name, magic should be a non-zero value).
>> +  as mode-xxx = <magic cookie> (xxx is mode name, magic should be a
>> +  non-zero value, cookie is optional).
> 
> I don't understand the distinction between magic and cookie... Isn't all 
> just magic values and some platform needs more than 32-bits of it?
Need two different arguments. Will try to clarify a bit below.
PSCI defines SYSTEM_RESET2 vendor-specific resets which takes two
parameters - reset_type and cookie. Both parameters are independent and
used by firmware to define different types of resets or shutdown.
As per spec:
reset_type: Values in the range 0x80000000-0xFFFFFFFF of the reset_type parameter
can be used to request vendor-specific resets or shutdowns.
cookie: the cookie parameter can be used to pass additional data to the 
implementation.

Now to implement SYSTEM_RESET2 vendor-specific resets using reboot-mode
driver, we will need two separate arguments. reboot-mode already defines a
magic, which will be used as reset_type. For the second parameter requirement of
SYSTEM_RESET2, we add support for additional argument cookie.
> 
>>  
>>    For example, modes common Android platform are:
>>      - normal: Normal reboot mode, system reboot with command "reboot".
>> @@ -45,5 +46,6 @@ examples:
>>        mode-recovery = <1>;
>>        mode-bootloader = <2>;
>>        mode-loader = <3>;
>> +      mode-edl = <1 2>;
>>      };
>>  ...
>>
>> -- 
>> 2.34.1
>>

