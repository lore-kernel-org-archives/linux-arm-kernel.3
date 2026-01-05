Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432B5C79FAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=up2RJ7mBO3QRQNqNSX63k2cfkFf65kx0CXGDWq797Cw=; b=X9PEx7TjsfK1AHiEW/fuhV/h5v
	d4ROeZSjr+tmI/PxHF04s+RuVL+uabIGxOp9ipGs5m2kPObFpPPs+THIwWSD4hEtIy3SV314cH6Vc
	khXzzx4LSns6i8iuZrBxe1LgzCEVnW6VwCrieGB8RNDlqF2SI1nSW8uTfvCd5+HlRMYMmnTUUKvO+
	BISfKVqYt/uq0MSipWjs4QQkUnq+00ngdWf/7xp64FxCocXohfDBNjn+bEnDi10NJz82qgPbfxR4f
	oWpD41j6+dROe9Y7OcKIQAYUA22sB96gMEG1ZPTqHITLjUVRp0A69JuvlZP3mqMtlrkqQ+3mKKHC/
	6Pzo27Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcomQ-0000000Bsf9-0lwF;
	Mon, 05 Jan 2026 17:54:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcomO-0000000Bse2-116u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:54:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605BJcuL3521182
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 17:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	up2RJ7mBO3QRQNqNSX63k2cfkFf65kx0CXGDWq797Cw=; b=NqCFXncl0eE41y7F
	1cjWzK7v1HtXjtW0mU7ToSsxoWtRLv7c7lswLOrH4GN//cBpvicmRjLDoMWRV9SZ
	oJ7HiiI9szam6Biqz/qlgvPCvu+FNz56ehYrUtMn2stq4V4ME496IQqEmbSCON5l
	02S2WYsLDMqnv7VnK7IQW+BwGzG+ubNQYTRKCUpiUjIroRnDLeP0ysbL0SQ6xNGW
	jpNpXpjDUXUjSL68EzqN6d3mKrEJvEsMpGTU6v1dXQ6Dql5Rfz71JbrsxuXo56ut
	iwF9wHgJiZhZS4aNKntm2AKN64SUTrVRnX0stKs6bXYKgu1p2ljx5Gh3YaocQGyt
	bx/xKA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg6uua5dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 17:54:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34aa1d06456so716594a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 09:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767635645; x=1768240445; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=up2RJ7mBO3QRQNqNSX63k2cfkFf65kx0CXGDWq797Cw=;
        b=S16zHQPPxC3JU1YRfnCh447E29CFHZku3HJBLoxWNu20m1Kty5GUOBZfEYvQJ+qU2U
         VPn/9NBKu3fCnQZKaSKfujhThJ1DGGxxs5utredKBvML6nd8gXqd7d1T5bROITXAe2Lx
         nQw8afZinRksh0UJN5MNjemEHQkgbCvws1VKmoEfu/8NKaFFvAroxAyPZ/jBxh+QaQ0f
         DTJRStANtUoHZHx5aDGBYllSBEtVyG7nhOjozzuI6Vmx1TJKSV54MdYPW8JJLErBFu1H
         2fKkhg2n4aPz/yxxuSgdZACfnEf2trJaOqN5A+CM6HaxzdJzUYBeK4V9WbJRyCBCx/O2
         eIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767635645; x=1768240445;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=up2RJ7mBO3QRQNqNSX63k2cfkFf65kx0CXGDWq797Cw=;
        b=MSJxSNwC6heZ1DNv36amj/LDpynVRxvVpoeybZVh7/nlowIe/39If8ZJWr04kCa+/w
         8eMnG/BI7XEKA6ZsxB08t9ARLBdRy7qIHX2K0+x3QQRCc7JJM9qmF2FmYsDqdB+Zz9Im
         1LFeUbhhEJaWDnQll1BZcCN51PDKN234YpIGgSfnQTAWa9z61MZfk0/QWpNOvELjkZ+j
         VlU7humcuiIF1pE9xzqMVYWKaMFDjVGFMKzaK1Vwk6Hhw6059DZSRrL+a3+Blew9WlUD
         eAvPJZoeOhvT4BYhX3F+59BLNEMs2sqM8olGUn1KCINPUHh0d9AQQMaE1IUTdKjuuaFd
         i7xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaN1q5Yf2Guh1wL+M26Z1Y0K/TbFRDTbw6B+XcdyZ3MZJVFTUXJO13b2rOTZeRgBcpL7x2USmdam6ZYdrIjG1z@lists.infradead.org
X-Gm-Message-State: AOJu0YyYh+CgIkvvgvSjYXdUnzqFzHdFT9QQ/6Wq1z3llv0wL9B+E698
	Oykq2ydt/8DDssUiW/oWbst4JkNsIJpDoBMayv+HL2XruwOwAyp2+KpbJhQhYwiLPJ+Qe4zsEFD
	DQl6C+ft60MH10DcZFj99GdmrMhWKCQoiFdW7FJIranm2UFO2Qe4LLXRG+bFveKP9RIipdtR4Yn
	6QGw==
X-Gm-Gg: AY/fxX4M/tsocGl5LasVeEi2EFawOdwxrccVjPAFNDVUciLdnQw7b+gXggDqsTlAD2f
	zTy49AEe6h+mu0GnVTc1Ly/CKfhQGGwG0y+gX2W8u1vonxHguSlpaAXs5qT+WNdZ+7sfIXuH7Gg
	xG1avv2sUm+kssGlzc6fYKD710Qv1F0qnT9h/H0w+xJJNLvCScN963Lg2icj1IMEqo2lQ7ax5tS
	aebo6pcaRpReeleB/4nnGZSKagT9DNQOa+B5q5u+a6n9roSFW3TmEoy5eQcwSwAkvy6q90jBZJV
	ByE2BTDoLLOL7TMYfkJhHGuDcRgmLzRSJ1ZD+yCV0B+UhPFVKQrqxboEcFcDapej8jmyA70e6+V
	uEc0PvmkZbbjxCSoc0nPC6XIwrOLkut4ROqW6n0z42oC8yRtwLhJnoww/p8gW/ErJKpgB7pQErN
	erCdzn
X-Received: by 2002:a17:90b:2684:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-34f5f273b91mr120677a91.1.1767635645300;
        Mon, 05 Jan 2026 09:54:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEAjGO3oXRkqFt+Dr912mQRBhrraJgw+/RX85ptzw8Hrud60zSlNKtqDujFJK5kumkbSyRog==
X-Received: by 2002:a17:90b:2684:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-34f5f273b91mr120641a91.1.1767635644778;
        Mon, 05 Jan 2026 09:54:04 -0800 (PST)
Received: from ?IPV6:2405:201:c408:b07b:6589:c739:d9cc:4910? ([2405:201:c408:b07b:6589:c739:d9cc:4910])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7a557asm11725a91.3.2026.01.05.09.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 09:54:04 -0800 (PST)
Message-ID: <06619e53-7260-7bd2-1954-dd10b92dc354@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 23:23:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 01/10] power: reset: reboot-mode: Remove devres based
 allocations
Content-Language: en-US
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-1-ebb956053098@oss.qualcomm.com>
 <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=McEB+yVYxropzsqLExZCU5Pd_iy_=5N3pTxu28-ZX=7_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE1NCBTYWx0ZWRfX3MGWffWXjBrQ
 atwLFkLgMaKQLHm49hWcV6iONfXfyJLhv3Gj1oT4SelPpTRPzJ9RRfff3uOWE1ZtVGcSpHnMZMO
 31+5QLNASQOIwfpeD1uw1SzaPJm93ecm5fWE+AvSZ0aiHmzrAj4dDaNF8UlpgXutpx0BFCBZlMK
 66kMUSXFPcoLM/BDRqbVw/8rdtcJCbzuotDtzip73ynqGFAtSw+lANlLustq8g8zsK3vKHL+Upr
 gtxP+/Grdz4R8153TDn/tgX0m2UeCZLLYOz1/Uzip3xNfLUgCeHrCW0y2KY9/R0p0mbWKO7xZAn
 DdxQsAla7qemB0Nl1OzrCgIxZyoiiS0mIXBXk1P/h9daZ/yEj+FRBrCz7W2AcqXUJntMzAUEWhp
 ymjyHP0vl0fqbwc9ny2D7Bj7xrjwbhBZ9uuXz7qpTmUSVrUwhlZsEpSqV9Izp3e8dIhquRm52Q1
 nChOCQLuWoUgkoYji5g==
X-Authority-Analysis: v=2.4 cv=eZ8wvrEH c=1 sm=1 tr=0 ts=695bfabe cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LC1Hwnd0PhZBVGXlRGcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: qbGV4AQQ-gRylwarPZQENrLdZTMNlsti
X-Proofpoint-ORIG-GUID: qbGV4AQQ-gRylwarPZQENrLdZTMNlsti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_095408_404871_CA776741 
X-CRM114-Status: GOOD (  19.96  )
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



On 1/2/2026 3:35 PM, Bartosz Golaszewski wrote:
> On Sun, Dec 28, 2025 at 6:20 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>> Devres APIs are intended for use in drivers, where the managed lifetime
>> of resources is tied directly to the driver attach/detach cycle. In
>> shared subsystem code, there is no guarantee that the subsystem
>> functions will only be called after a driver has been attached, nor that
>> they will not be referenced after the managed resources have been
>> released during driver detach.

[SNIP..]

>>
>> @@ -71,9 +74,11 @@ static int reboot_mode_notify(struct notifier_block *this,
>>  int reboot_mode_register(struct reboot_mode_driver *reboot)
>>  {
>>         struct mode_info *info;
>> +       struct mode_info *next;
>>         struct property *prop;
>>         struct device_node *np = reboot->dev->of_node;
>>         size_t len = strlen(PREFIX);
>> +       u32 magic;
>>         int ret;
>>
>>         INIT_LIST_HEAD(&reboot->head);
>> @@ -82,19 +87,17 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>                 if (strncmp(prop->name, PREFIX, len))
>>                         continue;
>>
>> -               info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
>> +               if (of_property_read_u32(np, prop->name, &magic)) {
> 
> Please use device_property_read_u32() if you have access to a device struct.

Ack. Can it go in same patch with the fixes tag?

> 
>> +                       pr_err("reboot mode %s without magic number\n", prop->name);
> 
> If this is an error, shouldn't we bail out?
> 
>> +                       continue;
>> +               }
>> +
>> +               info = kzalloc(sizeof(*info), GFP_KERNEL);
>>                 if (!info) {
>>                         ret = -ENOMEM;
>>                         goto error;
>>                 }
>>
>> -               if (of_property_read_u32(np, prop->name, &info->magic)) {
>> -                       dev_err(reboot->dev, "reboot mode %s without magic number\n",
>> -                               info->mode);
>> -                       devm_kfree(reboot->dev, info);
>> -                       continue;
>> -               }
>> -
>>                 info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>>                 if (!info->mode) {
>>                         ret =  -ENOMEM;
>> @@ -102,8 +105,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>                 } else if (info->mode[0] == '\0') {
>>                         kfree_const(info->mode);
>>                         ret = -EINVAL;
>> -                       dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
>> -                               prop->name);
>> +                       pr_err("invalid mode name(%s): too short!\n", prop->name);
>>                         goto error;
>>                 }
>>
>> @@ -116,8 +118,12 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
>>         return 0;
>>
>>  error:
>> -       list_for_each_entry(info, &reboot->head, list)
>> +       kfree(info);
>> +       list_for_each_entry_safe(info, next, &reboot->head, list) {
>> +               list_del(&info->list);
>>                 kfree_const(info->mode);
>> +               kfree(info);
>> +       }
>>
>>         return ret;
>>  }
>> @@ -130,11 +136,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
>>  int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>>  {
>>         struct mode_info *info;
>> +       struct mode_info *next;
>>
>>         unregister_reboot_notifier(&reboot->reboot_notifier);
>>
>> -       list_for_each_entry(info, &reboot->head, list)
>> +       list_for_each_entry_safe(info, next, &reboot->head, list) {
>> +               list_del(&info->list);
>>                 kfree_const(info->mode);
>> +               kfree(info);
>> +       }
> 
> The code is repeated here, maybe factor it out into a separate function?

Ack. let me try that.

thanks,
Shivendra

