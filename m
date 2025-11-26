Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92914D1118C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4C1ziBJx+mjYUbjAmhSYYfbHlaOdGG35KslyrE3v6A=; b=13W6qol0C/vNWzhv0bxu+VxEuH
	o4m1qsDxnhGovZZguN41vRkh2OlDQtAzn7HOHwhwea0fH6b/o0JehE5OyXz3HPrZhe/DHWMPnJaRg
	W4xRgCHBrG6jT6rGzUidhnCvYAjvVc0kJt9opy4N1RmCUBSVsNolN+yFK0fXZ7mhqHe0SWkOqobGy
	dHayflKjRnsHqmIcPmLolYTx8faq+bXTyvXoX3Tza3cOWiKf4F3AGnVh13EvwKwEp0DUC80oM5CsZ
	eo5kuQzSyatXReJW6CTtNe9ZfbmG7Dm9tnaiGmCKYsKQxIBpHB5WaTefRIgCTazaXn4af9fKbxtX/
	ON1WPRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJY5-0000000FRvi-0X5u;
	Wed, 26 Nov 2025 17:43:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJY3-0000000FRvE-0QHY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 17:43:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQFEJ793738620
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/4C1ziBJx+mjYUbjAmhSYYfbHlaOdGG35KslyrE3v6A=; b=cT7W2fXqRsVUJVhr
	soy3LpKx4+EudPDBbmHgPxQC658fh1GhRt3sz0AtOpj5oAlo2lsw/IvKlUlmMLvq
	9jpZi1PA4ZSz+vkCu7/euX6E9XelQAyIr1Qlmi5sbXlJTIAsPom3kppk35kT6D3o
	3JgSjtVyPxVE2bo9+QtsviFVMUc4FoWuvCz1BKFp0V/AiJERp+JR91wgboEHUTcz
	jthMGHIxQwe1BrkYD3b3W/9k3+7Yo839uA7u0IuA2VuEQ76xW2Jipsmyxo799EWY
	XFvjAoNOV3q8jymyoQAFrdRW8HkmiHMA6Xyow/IPuP95CwPfm3YJ306ePs/+NyQB
	RKkwnQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anggykpt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:43:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9208e1976so14399779b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 09:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764179000; x=1764783800; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/4C1ziBJx+mjYUbjAmhSYYfbHlaOdGG35KslyrE3v6A=;
        b=WXKX1viQ/wGLIeZ6gf2ElQVzR2M0lKmYRZjMXBfLfku/5q8y6OU9gqYLZzpyxzv207
         pk8KGuVmzbvsIG9DY3chp6hlmuUGADAPYKRJ6ycfLPIgzGQ/BVO4PESHfEXq7b1AhbAl
         mONzOYnqyldUEh7dhOEv6TWthsqI0GuvEFwA5Zl4VrxGe9gWEtbseRBjXpnOrvFEtAxR
         VC9Vij/g0Ilt5U52GB8qni4HA3XQFQr0jaObRZdh8wbrsiamQJzE1MYUO2AocKlKuRoN
         1REgNfa9NYzMJC9Cx2nLdlJIbienSg+7UuMuAhgw1ABaqsMLt+ANRQgF0SRZLSWw49BF
         OLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764179000; x=1764783800;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4C1ziBJx+mjYUbjAmhSYYfbHlaOdGG35KslyrE3v6A=;
        b=hz8ejExSmcdQXRL1CoxJg++6ctfertMZpMjBKVr1Q29SShYt0y6qRB+gTIxnFptHAw
         FznfQeWuyQFCNqqb0Bb3GMYwUV/luILEq7qwxvN3L47BaR1+HnuCrN+aymPH+RSaZ4vt
         MVMQ/DsQHxlxcj4lfFcn07yVGgY5AEhIMYMg40vGoIVlL7C8Ymuke4/vVjaar7j/YgrS
         QKsZM+N6PnAiOfqIwaDd7/6XqY2J6Jjt/0Kbx4gXEXqQsE4ZmiqTb/+TRjUAnIlkazhJ
         B6KbJO5TaXwPpY3Gb7aY/vjxkuBfVRKXTem2jr3Z/b95xojAUU334r4N113QS8Xps4uX
         FQxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwJv3wQN5Xrl2JfnE7gcLdOccLRMpDdkV4QXX4cKCniMvCr5exHpuXtCYvZSNqoeehm+pk/Q5OqBqKsS1wCyK3@lists.infradead.org
X-Gm-Message-State: AOJu0YwBdVCgz0AwBuZ5oxUPDzkERDBe6Vb0tIqJHYdHHduUAPC5LSsK
	B9iNgDB/B0AHiHUJ6Zw1MQUYpLciFU8Qa4oV+yzU4KgRzYewyZFw41mIFzaFKMgU5gsrdaNrOTU
	0pe/yGdCjRH0zLdPnShKJKJckmN1bR2iCtRWlDjhqi+aAcupGuF2rR1pArIjpW1UhK0ZNE61ndJ
	WRDA==
X-Gm-Gg: ASbGncuF+kGUETBG42uWZTqT0zmwOtZIEryZ7ZiQp+HJzyhaN8i20tz6yoETBXo+hc+
	5GIVWPG8mpStYYcfXHsTKWJQs0XFuthj8yhflirlAsL59o6YIA8OS10phmKDfuTbrlCdUQ+UgrA
	XBUHNX5JbSjlpsbk7Wgp7IO9ShXlqn5Rj196lgFGaEMD4WIYTRNX8PT6Db8xNATa4nbBmjHre9q
	RmeU2M5tV/sUuqAGlSWTxRU1Xw81fCkvFpujT0IWkbGQoGUZ65FQ6qCJMWGz974q3Hj3NXv+fY9
	MiIAgCTB3L8gFKJqH29oHCNaLpGhPbM9HY6RiQnjgB9AssPaeimc06QhCKc3RcKdvp8UZfULbg4
	LhtaFRCMpeN2jZ5D0FVnTQeQlUqnYiN6U+KGQXQF7y0M=
X-Received: by 2002:a05:6a00:2e28:b0:7b2:2d85:ae53 with SMTP id d2e1a72fcca58-7c58c999ebfmr24059793b3a.8.1764179000415;
        Wed, 26 Nov 2025 09:43:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFE9auC0BPVxJ4KxcFP48LwF0xTVOASw2feRr55RR8ZX+bZHEyVlBeSIXXDN1cl0ZFO26GaMg==
X-Received: by 2002:a05:6a00:2e28:b0:7b2:2d85:ae53 with SMTP id d2e1a72fcca58-7c58c999ebfmr24059760b3a.8.1764178999869;
        Wed, 26 Nov 2025 09:43:19 -0800 (PST)
Received: from [10.216.6.208] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471022sm22183967b3a.21.2025.11.26.09.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 09:43:19 -0800 (PST)
Message-ID: <acd1b134-2c8f-af01-0de9-d9779dd2ebdc@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 23:13:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v17 07/12] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-7-46e085bca4cc@oss.qualcomm.com>
 <aRIfc9iuC2b9DqI+@lpieralisi>
 <80e68e44-a8e0-464a-056e-9f087ad40d51@oss.qualcomm.com>
 <aRxmWrAkD0Vu4pF+@lpieralisi>
 <1da024e7-efb1-3a1c-cc13-0ae5212ed8bd@oss.qualcomm.com>
 <aR2P4CxQNebac6oU@lpieralisi>
 <682b1a0c-644f-2aff-1860-cbf9a53bc62b@oss.qualcomm.com>
 <aSc2Yh3AvLXOBvcz@lpieralisi>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <aSc2Yh3AvLXOBvcz@lpieralisi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7JmZCaUZse5UAVKJVtLvYBrv4_Q-NYsM
X-Proofpoint-ORIG-GUID: 7JmZCaUZse5UAVKJVtLvYBrv4_Q-NYsM
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=69273c39 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=aq4WiCt_VBwjG6PfwrMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE0NCBTYWx0ZWRfX5uEy89tWnZpG
 eevPRKx9ERZ5yMv5rSkcXeCOMe0zJz4MWeEBUFv8ZHV8BTGq4R4XkX7vF9QtWkvgWbr8fJsWNzu
 O8qMil3f9b/vGm9RVK/IeIhiu8S77YG1iQ5XaSM05pkotxKY7so21ccZleICIZ0Io7Ucz2BX2zp
 Ho303K+PEMRjwErcJWRhubNWy1Z7+zUWFIPWAVz1PBUbDAutypWJDGUazH4ivbyUzJnXAywTH/9
 4fdkWBh7cwdufeYIYuWN53/RiPf0GPAaPmWUGviSAB+Nnv7G3cb93akO6tbo3xCpE+M5lJ9+Psq
 1vqwpY0YZ26pvMug5kAChU2g2dPw6jyhrgi39niyvqR9TrJZ77zspfmV4NMFHOaSEQ+8OmHuJJU
 H3hbQUrLYJlZ96/2sznkx+TUFZkCMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_094323_285005_546783A3 
X-CRM114-Status: GOOD (  22.59  )
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



On 11/26/2025 10:48 PM, Lorenzo Pieralisi wrote:
> On Wed, Nov 19, 2025 at 05:32:42PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 11/19/2025 3:07 PM, Lorenzo Pieralisi wrote:
>>> On Tue, Nov 18, 2025 at 11:11:33PM +0530, Shivendra Pratap wrote:
>>>
>>> [...]
>>>
>>>>> Yes this could be a potential way forward but that's decoupled from the
>>>>> options below. If we take this route PSCI maintainers should be added
>>>>> as maintainers for this reboot mode driver.
>>>>
>>>> you mean the new psci_reset driver? yes. Maintainer would be PSCI maintainer,
>>>> if we create a new  psci_reset reboot mode driver.
>>>
>>> Yes.
>>>
>>>>>> - struct with pre-built psci reset_types - (warm, soft, cold). Currently
>>>>>>   only two modes supported, anything other than warm/soft defaults to cold.
>>>>>> - vendor resets to be added as per vendor choice, inside psci device tree(SOC specific).
>>>>>> - psci_reset registers with reboot-mode for registering  vendor resets. Here, we
>>>>>>   have a problem, the pre-built psci reset_types - (warm, soft, cold) cannot be added via
>>>>>>   reboot-mode framework.
>>>>>
>>>>> Why ?
>>>>
>>>> If we want the new psci_reset to take the reboot-mode framework route, is it ok to
>>>> add default modes (warm, cold) in the device tree?
>>>> If not, then the design of reboot-mode framework(power:reset:reboot-mode.c) needs to be
>>>> further changed to equip this new feature. 
>>>
>>> Well, yes, all it needs to do is allowing prepopulated reboot modes on top
>>> of which DT based ones are added.
>>
>> The mode-cold , adds a third variable to reboot-modes as the first parameter for 
>> invoke_psci_fn is different for cold vs warm/vendor.
>>
>> cold reset call       : invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
>> vendor/warm reset call: invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), vendor, cookiee, 0);
>>
>> Each mode will have 3 argument - like:
>> _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ _ 
>> MODE   , cold reset, reset_type, cookie
>> _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ _ - 
>> COLD   ,   1       ,    0      ,     0
>> WARM   ,   0       ,    0      ,     0
>> vendor1,   0       ,0x80000000 ,     1
>> vendor2,   0       ,0x80000010 ,     0
>>
>> So reboot-mode framework will now define and support upto three 32 bit arguments for each mode?
> 
> The cookie value is unused for SYSTEM_WARM_RESET, you can encode there whether
> it is a cold (SYSTEM_RESET) or warm (SYSTEM_RESET2 - SYSTEM_WARM_RESET) architectural
> reset when the magic value(aka reset_type) == 0x0 ?

sure that should work. if reset_type is 0, cookie to decide warm vs cold.

> 
> The reboot mode parameters do not necessarily need to map to PSCI function
> calls parameters - provided we define that explicitly.

got it.

Sorry for out of inline question - 
So the psci_sys_reset() may be looking like below after the changes suggested?
Is this on track?

if( panic_in_progress() || !psci_reset_cmd.valid) {
        if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
            psci_system_reset2_supported) {
                /*
                 * reset_type[31] = 0 (architectural)
                 * reset_type[30:0] = 0 (SYSTEM_WARM_RESET)
                 * cookie = 0 (ignored by the implementation)
                 */
                invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), 0, 0, 0);
        } else {
                invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
        }
} else {
        invoke_psci_fn(<psci_reset_cmd.system_reset>, <psci_reset_cmd.reset_type>, <psci_reset_cmd.cookie>, 0);
}

------
where psci_reset_cmd is defined like below?

struct psci_sysreset {
        u32 system_reset; // this will be set as PSCI_FN_NATIVE(1_1, SYSTEM_RESET2) or PSCI_0_2_FN_SYSTEM_RESET.
        u32 reset_type;
        u32 cookie;
        bool valid;
};

static struct psci_sysreset psci_reset_cmd;
--

thanks,
Shivendra

