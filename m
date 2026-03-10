Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6342EF3C27D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgUe0TFn6d0vjPmbLxKtIohMDX7uiKOUBiGY0vO4PaI=; b=LtHFDQk92UQUMaH/7eMEGDNaBI
	52bR4Md1FvdydansUTEDfupUCduOzFdSOjcq8EkIJTEHql43E+ZIP1Bt4w2x1YS4Wb7YLdcttdtYV
	LDxrBvKIKzxe06YE8f8w27q9hi9UuKD0x9UPRlOaDXciZrpxK5VJ9CWOYIg9xG38LCsV2+tWjNbUj
	L+p8qR0FtMJMHVZ55c3K5fgsxnLqpu/ee8hUT3JoXGQhkfMtfIPDUDNbSDw9AVrPpP4bBtyVLImrN
	Urfd0RMGRIWYKDmzm/yDwuSYaHjqc7PjS1eQ7uRkbbybpI69+bConajTPTuDYDfhoYj+t+Fdl9rAp
	YR0uT9PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztsL-000000099Gl-0pct;
	Tue, 10 Mar 2026 09:59:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztsI-000000099G8-3Pp1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:59:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8h2iI2754011
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lgUe0TFn6d0vjPmbLxKtIohMDX7uiKOUBiGY0vO4PaI=; b=Xs8tsJIaHuFREk0D
	X0/b6Es/83vmE0IH6BgNgd5sda9mPkmieLyMsDF91whgiJgXQNXYiRb9QkHR88TD
	xoFPVRMob0nwQEJZYcIlCSkPjptYkjXDDlNmqPdsbk5H+Hxasl+ROILF1FMEJZ1j
	OxYjgdH8cK+LX09gX42fk04Fkk5YoGJOsmdYW/Jqngt1old/BEWmTec/7GpG9emm
	YEC4IebUlfSG/DzZlTLx+gNgmlVm6iUjcSNnYpC2cDKWHCjZUK6Yy6FjEXRRf+fz
	xF8VV3ASO7vKPZkyGumge0dPKpyzsutqg2gW/2O1rrH8wWoghWSNZdORS0lPZCv/
	Uc3+aw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mr9ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:59:36 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a08e6cd15so542407866d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773136776; x=1773741576; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lgUe0TFn6d0vjPmbLxKtIohMDX7uiKOUBiGY0vO4PaI=;
        b=Stw/h4ucR3Mrko7bS8w10inw2oi7cr+nyFp+pDvYDLfmkzcElJJGk4vg7odt3BqXu1
         Q+gFZQHby5/zVr6aAxac7Hvzg7+jqmWZtUN3SmdtmEn46exML42dHUOT5P+gl1hVUfkT
         nHhy1THvvXQTqZ6wUNtnbTZeDvnz++h+6+gjQUc4LJVOp/NA2554rmmWQyGXLFgtclJ6
         uxXjVRlzh9aqOra90QrChYNdaV+DQXgNOQWnsESod/7XHVJ2HAMdGaTCHzfQGhzo7IYv
         hijZ5g7e8dSlZPKy6zIornfuH7kqpk4snM+GBPGXk5lw6BT4XnHkXJ8U0AvUpiAzqdFN
         IjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136776; x=1773741576;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgUe0TFn6d0vjPmbLxKtIohMDX7uiKOUBiGY0vO4PaI=;
        b=FCEzKdtZGa0Kt8pd9YAqYpu5b5thR3FGnQa5+ZJnOMJtIcefdniykk74LB6MBVUsE1
         cMEWbEaiymY3jL91J5aZefliCOAms2APv5wOCUacHl2Fc/SEnWAEsgMhYblqUAey9Zl+
         s67/yZhYTESBS0YDMwkEXqX88RL1UJF0bcgyJZsEjf54RYiaJkFTfhAd48wE8wDdcvpj
         O1oL7n7M8XObI+JLEFYGnztCvotpBnEsScAU1Mj0yHW7Mt36W3f6YY0XkUgYKDFZqSwc
         ss7EAG0snSBQZo0WctHgoSAbNvHy5sEwadAsnoI4rcsoZpDMzqyz/3nn0XMzlsoQ9nbQ
         f8AA==
X-Forwarded-Encrypted: i=1; AJvYcCVrWJhlr7cmcR2YKNtS9F37XQsCx8wIPLouomyk8Yd/PcaEncuAxhX5ayF8vI+FCv6BOhGCLlVJwfqYiS6hnjkc@lists.infradead.org
X-Gm-Message-State: AOJu0YyiiiJjGTTCVrBINjoT6NKUuxm5eadGjDPk4lVARGbcJij0RQqW
	VEGZViBw7I6ZROKWsKeOzBDB3589uTW4SXcIFrIeZNm/zA7A1CDeb8hmfDzcWzjlfwC7BS/J+aK
	AE0NHl8pegsVN1iE3XVJ+t0418fZZ6l4SdliWBZNO3rWz1w2ZfzRTsXP7Bem/19SBcIB2WyCa4T
	SF7w==
X-Gm-Gg: ATEYQzyVO1guekBt0wh4ClTqtDqPrhZvj/RnuLVW3qG+XXUHMSHh3WqIMRQ5pYUsNpC
	92ardlNWulu/j0I8+JFS0QJHb6N2eoPWN8bqQD6Ov3rwM+UCSKAwKYG3hW4TajUPgnbgV+WeSm0
	lOQx/YjpRmUlJQobJmEuAbLOBdRpCFL6/Kgzg7fyAb/geMK4QPnc6lVIqf4ohML59yedRuNYvS0
	Zn/nEG+ZQauWyoFGH/0zFcv288mBLqu0ttFsGk0LGGq3Y8y78aPfd4Wr4KP9vNkyUNh2o5vAznR
	/2336clV9UODLFlpb/szN5UL7mxjBdUPjdzJCgA4aZR4vV0Y0EcWsauUApn/9t1wj2Fxr0iztR4
	lDFQSUdQj2+h9FoujzlTjoyZe88/49L/pv9rjQ7PXQ7QX+574
X-Received: by 2002:ad4:5de1:0:b0:89a:258:c1d5 with SMTP id 6a1803df08f44-89a30ad59bemr219718196d6.50.1773136776367;
        Tue, 10 Mar 2026 02:59:36 -0700 (PDT)
X-Received: by 2002:ad4:5de1:0:b0:89a:258:c1d5 with SMTP id 6a1803df08f44-89a30ad59bemr219717766d6.50.1773136775932;
        Tue, 10 Mar 2026 02:59:35 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485419b8526sm68327405e9.0.2026.03.10.02.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:59:35 -0700 (PDT)
Message-ID: <9a9cb7f8-54cc-4c43-a5a0-f022394351eb@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:59:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] workqueue: devres: Add device-managed allocate
 workqueue
To: Tejun Heo <tj@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
 <20260305-workqueue-devm-v2-1-66a38741c652@oss.qualcomm.com>
 <aapTSyrkqqZ8j_XL@slm.duckdns.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aapTSyrkqqZ8j_XL@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69afeb89 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=f4WQo65-w8K6TlvLPnkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: R-zI2SbNYQhnvkdjkQ7RQ39infcWoz_H
X-Proofpoint-GUID: R-zI2SbNYQhnvkdjkQ7RQ39infcWoz_H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NSBTYWx0ZWRfX0946DROIxzLQ
 5b2oJvXW9uK5/QyRr+aqUzUSgEzM1OiCAi6Jw0CPy73R+K3Q77Uzm6QSOX8yBI2xTOyzolehZrO
 YZBOwIiliZioIwNEOfgBlzuL8Qv/6ocx580dmAFOlrTkzn6PwFn7Mph9ThguroOqebasCnsH7+l
 5OnQ27e63gRbxzfJ+Wyrf2chjZ76kiAfJyOct44fll/G+rYFPUZ677bkUQ2PPEHT1rWEJx7/FjE
 bmw5ak10bWzQ7zeJfxkovSJFcgXpWpmbH/ke230VWxvd73PFtvuBY/q+XkUwxuskCsT+iFvuICw
 7pD53eBjK6b1jiw65i5iKab5ZAOHQbDlZCUFA9CTfPBCZfnuf5BaKMrzyuiEEhqk8HtZG9ffcWm
 C/27py//mlrdVpYfYtNFiXRpqnuBzJp0IKoic0rC3wRZ41gbJyUtZJtIuSnLqlmGkh/2wlIx2qh
 /7t57cnKhSW87yS8tgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_025938_964931_0678F95A 
X-CRM114-Status: GOOD (  19.69  )
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

On 06/03/2026 05:08, Tejun Heo wrote:
> On Thu, Mar 05, 2026 at 10:45:40PM +0100, Krzysztof Kozlowski wrote:
>> Add a Resource-managed version of alloc_workqueue() to fix common
>> problem of drivers mixing devm() calls with destroy_workqueue.  Such
>> naive and discouraged driver approach leads to difficult to debug bugs
>> when the driver:
>>
>> 1. Allocates workqueue in standard way and destroys it in driver
>>    remove() callback,
>> 2. Sets work struct with devm_work_autocancel(),
>> 3. Registers interrupt handler with devm_request_threaded_irq().
>>
>> Which leads to following unbind/removal path:
>>
>> 1. destroy_workqueue() via driver remove(),
>>    Any interrupt coming now would still execute the interrupt handler,
>>    which queues work on destroyed workqueue.
>> 2. devm_irq_release(),
>> 3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.
>>
>> devm_alloc_workqueue() has two benefits:
>> 1. Solves above problem of mix-and-match devres and non-devres code in
>>    driver,
>> 2. Simplify any sane drivers which were correctly using
>>    alloc_workqueue() + devm_add_action_or_reset().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Acked-by: Tejun Heo <tj@kernel.org>
> 
> Please let me know how you wanna route the patch.

Like I described in cover letter, so I propose this going via one tree,
e.g. power supply. The first patch might be needed for other trees as
well, e.g. if more drivers are discovered, so the best if it is on
dedicated branch in case it has to be shared just in case.

Does this look reasonable @Tejun, @Sebastian?

Best regards,
Krzysztof

