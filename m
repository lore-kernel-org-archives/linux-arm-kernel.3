Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64572C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 20:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbknqAYZmPxfRwbqcU3Sz00LFa87wd+S4zJeOJIzXSg=; b=ooJmlXB7CXSH/enZucu2eD43av
	tN/Do5KDt+fLbaWXzI0bJpvaYIHUBvhfLBlVQaM5X3+6mmTm7X5jUPvUpdxZL0212K0LOUNwBGFQK
	XWiCzXIixEMn+ZQWeO5wdYIKAedKZW3vXozWne0SPzyuuzq6v2BcFKji6KUBZLCLSvBuLQv5QjDK8
	eGE6teWHBEaPtW1BmYfSCALjCvrO9/19rrZJnpKoB420shIctccPKHij3mV0djcD+vPU+7yoQsx2f
	DcnNYNJgfExxvmr5wN6RxKB08w82uZ1eeAarbnCJz6R4dHc62DZrQwijxXZVLG0bjid4uzanTf3CJ
	QaS8FE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1L8-00000002x22-0jHv;
	Wed, 01 Jul 2026 20:15:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf1L4-00000002x1M-3f43
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 20:15:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661Gmb7q1711469
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 20:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbknqAYZmPxfRwbqcU3Sz00LFa87wd+S4zJeOJIzXSg=; b=VJMD/e9z7HUThUD2
	L5GjT4qqw3dMF7M310mF7xsS6p0DOG5vuvctFE30BDECahkwx10QRUoRQ5EOfh8G
	Um2bGmtC0UxJx3Ep2kcZw9U72hmyDIcp0WtXq0U6eleoVFGubytVTqNSyOkPBpjJ
	TxOmt9KfIxnhpDoizQvnC/kr6hlp0+nOrPuMN8aUh17YUDL3tLvTzX6FwDYuIq22
	I28OIlygKKqLvsIGWWKPlRTb4skRNPPhofsOSWx0PAeWLppy93RqnXuZRdDIrswB
	jcWHyHZi2BHl/0PuMdK3rMuI+TFJIu2nGF7DoXehJRyH4eBFwdI0quB2/29l+SYY
	iPhylg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541seex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 20:15:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fbdbc4d03so1292147a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 13:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782936915; x=1783541715; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbknqAYZmPxfRwbqcU3Sz00LFa87wd+S4zJeOJIzXSg=;
        b=XYHOhvSDgLdwmyA2suPExq+EFgPQo9Y2hH7C44xAKUp2yy+9oGQRUktVT9B85T7zyd
         NI0W12O/p4hXXCczTtMJEIJGkYIl5AdFwqWli8GhGCqFtbZa9GgJYyGkkijgqJG57gRX
         LXTaz7oCy1CHIZUxn/0n4gJ9bIS1yaF10GDgOCk9NSJkdYeGgyT4D8iFGEbOzlnOx1yK
         x1rl3FZAX/tsXyBJWXwRynETONqzONOGPYFC4Sx64GOscrM3AHZ2OYrcTPXqy+IeumCT
         g/NxXyufWpslnMD1c4OQ66SJFtAY8KnoysBbnpwULRJ3fTzCHNRmaz7Cx0XMqU3UZL+5
         h+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782936915; x=1783541715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qbknqAYZmPxfRwbqcU3Sz00LFa87wd+S4zJeOJIzXSg=;
        b=Ew4+IWDXLo5CYsEPIoXQzmqzs1w7YrVKvBq9aCusoGgB+uwhup0fDgYYx5wivN0HuO
         9F7PiRD9xVORQu4x/9WjZxSdoyKerD+JHxv2kHc/5jPoeE8AurC6iChP08Z6qq4vOfAK
         7gTkJEEkcgMt+ZA24q6SrPApX+AddfGcE9atR5vKmbYhKw3t14ii8hanQ4+PSPEI615t
         Gpa7s5e/tdTXh6CrCF/xGuIu/GR/A/PG/lNQJVSTF407cj4MZmmpfeZmm7yW0XuRilTc
         TYFQ1du1TZKZYpUfM+8ILPE/3um3nu6cKp0exzWMU+YyDNQih1brc7zIBilG3qZyuDS+
         4W+w==
X-Forwarded-Encrypted: i=1; AHgh+RrXAvwQ/97F/huB954WBApAT5tAJeTOi+VPn6KY63NrJUREmUuzIrEGchacrduuHuHKpRRbZw6TAlZAUWb92EYM@lists.infradead.org
X-Gm-Message-State: AOJu0YwPf94kq3eXF+LLtsGoueURqUZ8C8ntaUcHBWEGVobngoLDmuzK
	hNKjgpH3kAwStKK81iNgZU0pSU0X02pbNR0d1ZAdNPG2TYJAuh33lkpNp0tNUIGV4n6x8o0DDuk
	ahUfKFaT9Q1jTeqMGuBOsZOeQT/u/Di5Z49R5CQ9cdiptE6t0cdJkcpyv9arCGXr5wFslcyypPw
	Z3vw==
X-Gm-Gg: AfdE7cmdAFQN+4jJymTCj7KAjI0/Vim6jyKUy+nhuGzXqVw9+SmgSk+W4PxOINuShzl
	/Ee6j//tpjmiD5yuJlIXrAc5DtXLWypbctLXsxOwA0tVHpLF6+M6ubCnHnm1gu6FdgliYbJpvuP
	Bc6pU3OBtpzP9odiDu+xk8MNzVdOGmjzLKfv67/PSFqfH8uHugzSw/AyG0juW1UyOscLv+NsjHb
	1t/ubG6sbsba5/bFA7u0G0xjXhmpThVBiI7aom7zIzeu58KZrlCuSf14kusCSzQChRnWtcoRXxS
	KVqPl8frVCQJilXyUZ6AgGH0dhiIBaEaQ11YDb+x01GveeCzMuk+aRADGvdxbUThGehr9jMfRTN
	hb42yn3Zsz8IuXyFXiWld1ysAz2s1TTD+mkfEij/domOj4WpYK/cebxY=
X-Received: by 2002:a17:90b:3e8b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38069c56f8dmr6708437a91.15.1782936915338;
        Wed, 01 Jul 2026 13:15:15 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38069c56f8dmr6708381a91.15.1782936914545;
        Wed, 01 Jul 2026 13:15:14 -0700 (PDT)
Received: from [10.73.235.220] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc27e0dsm872064eec.27.2026.07.01.13.15.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 13:15:13 -0700 (PDT)
Message-ID: <50fa76ba-91a9-4bab-ae85-46f7a8a9f1ed@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 13:15:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] scmi: Log client subsystem entity counts
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Jyoti Bhayana <jbhayana@google.com>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
 <20260514164422.0eba9a61@jic23-huawei>
 <8857fc71-aec6-4682-b4f4-0bd463f367c4@oss.qualcomm.com>
 <20260515-strong-lionfish-of-effort-f74c7a@sudeepholla>
Content-Language: en-US
From: Alex Tran <alex.tran@oss.qualcomm.com>
In-Reply-To: <20260515-strong-lionfish-of-effort-f74c7a@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ArRDvmPiS9n1ah9aW4zfQV4GWfpaU8Yz
X-Proofpoint-ORIG-GUID: ArRDvmPiS9n1ah9aW4zfQV4GWfpaU8Yz
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a457554 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=vxRzfglfhILO5636UqgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfX3Gl95z3+8iIR
 CxowAmzCAa9v4WQ4okNyCksbrcFtt/L+QS1qOBPoRLIOn2DNMjqJhTDiNAPDffc2hPK+hnahS58
 NT6+PvJvbLijUpeZ+0VRR/+yLf9sO5l8n6lpNqzOyUSaJDpNT5acrmRPi4U4g+cC1woE4H9b48+
 0j8t5ZQSOCe1axQECU+Abfa39LN71aYZolCsKDn2bjUCH6kI8q9vBJOLL52kccHHsl7RUbahnJc
 Bx4s99aOT/G4Ytay+R4UTSC9UYsj7OcsmL2i8ZlDkO/NLOrh02h54LB4osWcKWUGI6YdPB07mo0
 0titXwBYrpp1aHh+KwiaBHP//alRgD27TZ65e3gE+LVDF4TTI7a6Hja4xiRXNs/G3sBIdq2YC/1
 LIIR6FHh63cEO1xj8eCO0oJV4/9RegjhgLAvpuHszLfuY/aASQtra2NbbPx2fH3iyVBbDZOoVaj
 9ztNPiNtzSPyz8OLYNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDIxNiBTYWx0ZWRfX6Fh5BtuAdrD6
 NcuLMdRhIJEFlIBVVkCVgUU84ov+4Kev8o4rplY3++5yImNrEv8fAuZcgLj6ByttxP8PZ2qJQyl
 cJSmmsBZErfjuzS5epvp9SFX4qsblcI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_131519_057395_F81CBFA0 
X-CRM114-Status: GOOD (  20.20  )
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

On 5/15/2026 1:29 AM, Sudeep Holla wrote:

> On Thu, May 14, 2026 at 02:23:56PM -0700, Alex Tran wrote:
>> On 5/14/2026 8:44 AM, Jonathan Cameron wrote:
>>
>>> On Wed, 13 May 2026 10:16:53 -0700
>>> Alex Tran <alex.tran@oss.qualcomm.com> wrote:
>>>
>>>> SCMI client drivers do not consistently log the number of supported
>>>> entities discovered from firmware. This information is useful during
>>>> debugging because it shows which domains or resources were exposed by
>>>> firmware during probe.
>>>>
>>>> Add logging of the number of supported entities to the SCMI cpufreq,
>>>> pinctrl, reset, hwmon, and powercap client drivers after a successful
>>>> probe. This aligns these drivers with the existing logging in the SCMI
>>>> power and performance domain drivers.
>>>>
>>>> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
>>> Hi Alex,
>>>
>>> Just curious but why +CC linux-iio and IIO folk?
>>>
>>> May be you had a false suggestion to add them from get maintainers.
>>> If so be sure to check it's suggestions make sense!
>>>
>>> Not to worry - we can all hit the delete button ;)
>>>
>>> Jonathan
>> Hi Jonathan,
>>
>> Originally, there was another patch in this series to add the same
>> functionality to scmi_iio probe but it was dropped. Apparently running b4
>> prep --auto-to-cc does not prune stale entries from the cover letter. Will
>> manually remove all entries and rerun the command in the future.
>>
> I guessed so, but why was it dropped ? I don't agree to adding them elsewhere
> just curious about why it was dropped in this case.
>
We could not determine whether to log the sensor count provided by SCMI or the number of sensors that were registered in probe since the driver appears to only support 3-axis accel and gyro sensors, skipping the rest.


