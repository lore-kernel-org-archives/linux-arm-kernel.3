Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA87D41C36
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cF0nCy3K8ZLd3O9dxWEhMzL6K3i/vuZmXtZs4+t9Dxw=; b=28f4WIUU5HneW3kTgi4jNz70+H
	hSzMygrWYvYxjbIbBm3w64FSt/dBseIxRzk4a6zcRZKTXnk9WUUQG5kkQphWxUPx/5T/Hi4wmPRrR
	KT2B1ViI0SGQzvws7JpuCcSFTbHfS4slWaB4mP1QnmidkbiKxurwb1z6oy7EPEDapzgCGkqAHlewM
	+cj/XtWyCzKhCJVmNSeY6P3dcHnQaA2rgV60wq94MuC79eJfSBq1RbgtpAaR3zpP2r84JnjbA590d
	iQaCfs/wZ2j11mkJJXMX4TyD1q/ibJh/Mtrd5kDPxkfbN91FkmQXhngCCNZFdWUwaScLRb0hjBCqr
	a+XahUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgUn-0000000Gcbu-3t5v;
	Thu, 11 Dec 2025 13:14:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgUk-0000000GcbL-2Lgx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:14:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so506115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 05:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765458847; x=1766063647; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cF0nCy3K8ZLd3O9dxWEhMzL6K3i/vuZmXtZs4+t9Dxw=;
        b=E7G/OCXqvDVEhCr9GyP0yFkUBVYX5upjDwYUaOYvmqYeUBNLOdvMW0kMMoK8qkC+bu
         y+dk0fcrP1n/KJqPS+V3itK/7VVthKGBHriYG7P6CXphYTJrXuLZRgn5DRU5+p19jC8k
         9itBdmswnCwMnuHjd5Z1+igAS3elosrNW7duIWUFmnsbQARP0i8opNxsXiFjZtVI0lur
         TjSYHfGINSDjlOXd0oOE2cpjnkxE/91aBxbeIY3besdyEDC8XKrvay75jK/Mc6KDr9Qu
         lNkF8/Nom4eUo1NyaayrT+MgG9YBELhoXAskx9ATfwQZ92E3R3D1S8ifsd/+E3ygLN7v
         DXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765458847; x=1766063647;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cF0nCy3K8ZLd3O9dxWEhMzL6K3i/vuZmXtZs4+t9Dxw=;
        b=cidILO2FE345F8GVLi9Vn3wtmpkLlQ8BBIY/xci/974xYfNoddi4ehW2CgC62q/jUB
         xnfAkS6yjqJD9GHL51ej7QffGDsvucZMjo/9uUbOYoh1e00of9hTM7Dr2aA6OJje6f/x
         z7mTZCAHp5BXCN/Pn/klsgI0Cs/2rW/+NGXy6iuqnJ4mFqMj0mcmOCwFmK9lVmicfqPY
         Dw7Myf2swrnauZ6sTJxJ8/HbGi2OMuUz64EMMXF6D2dsMXDL/Vul9e6ie9G4WAWwMl0B
         kqbDShZS3zY10yWuT3FcH/1A7sBaklLj1ElIfZTcE7DBRAOCEdcO0S+XP39EbLWx28oK
         btNw==
X-Forwarded-Encrypted: i=1; AJvYcCUyOvjgyKp2h5j8zAL0HOmi1LQBR7sh0bqF9i0ShPG6p6C6vNMqbmJwXkSncDrSLZq8S+55Cw0Ev7a2lefusNtn@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv8HjqvKJ2rlTX+GTckUcRm9FGlQclCl0G4qvSAxcbdVJ1R1an
	6TTS8vWT7fKVGGiEY+zGJuI2qcWkn5QgXU6Pkk2CpdSdms+ijG8k1cVFOeuQkvGUVKo=
X-Gm-Gg: AY/fxX5Aw8ng1FZvZ3qwC8FYzGCOFYBawoUe3rF95AHNcBFKBKjUBLc400cBAGErPth
	i9z5JsmzFDjmbNKXzD7FLhrpIEWxjhJqGyy9Yc9UutAUTB/UDo2Fy+tEPOR3U7N69/fs3ZuekQf
	oaoV3P/e+yE6Vwo9jf7DwB4UJqMt94F5A8D0TocM1IJObEs7Leq3y01bpVFQPvEChEM0r/CGAmO
	7o6+qdHLi0rtqatO2VDIF/cd526+/9KB1I0mLEwZyM5PbanqI/Ky9IS7CDyBmfuPpzAOQJGSlSw
	lGJsCoFInArMB8RFoH0/8fXSOiqx9Bz0RLeeUIrwJml4KJ6MAiqtVzTVu+/Yplc0NoOAu4ChLeX
	lNQwZ2oiPlwNn9efmW3ZWa29+RZK+H93BtWFSMdLQ78Rz1fBDbgZdidJlTjVKLgGeurB9ocRYza
	4kBQ/mDyYjsLX547ly
X-Google-Smtp-Source: AGHT+IFuFpTFsvxTJRwslx5ZMVgnCZWiNXSiHVXO7iLSyGUOA6ovHk2vIf/10hdCpVsmTmaoDOpjWQ==
X-Received: by 2002:a05:6000:25c5:b0:42b:43cc:9827 with SMTP id ffacd0b85a97d-42fa3af896dmr7158361f8f.38.1765458847497;
        Thu, 11 Dec 2025 05:14:07 -0800 (PST)
Received: from localhost ([2a02:c7c:5e34:8000:c186:ec41:4ac0:f434])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a702a1sm6260871f8f.13.2025.12.11.05.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 05:14:07 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Dec 2025 13:14:06 +0000
Message-Id: <DEVEXHI9CEFA.19RL3BXTV8E38@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Vivek Aknurwar" <vivek.aknurwar@oss.qualcomm.com>,
 <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <mike.tipton@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
X-Mailer: aerc 0.20.0
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
 <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
In-Reply-To: <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_051410_621448_77AE3FF1 
X-CRM114-Status: GOOD (  13.53  )
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

On Wed Dec 10, 2025 at 11:28 PM GMT, Vivek Aknurwar wrote:
> Hello Sudeep/Cristian,
>
> Just following up on this patch. If there=E2=80=99s anything missing or
> needs adjustment, please let me know.

Vivek, please avoid top-posting.

> On 10/14/2025 12:34 AM, Vivek Aknurwar wrote:
>> Some upcoming SoCs define more than 32 operating performance points (OPP=
s),
>> exceeding the current SCMI protocol limit. Increase MAX_OPPS to 64
>> (next power of 2) to support these configurations.

Didn't touch for a while. The way it is stated confuses me a bit.
Should the value defined by protocol be updated out of the blue?
Should the protocol (defined by spec) be changed first?

If protocol changes, then should the version/minor version be
updated/added?

Thanks,
Alexey


>> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
>> ---
>>  drivers/firmware/arm_scmi/perf.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scm=
i/perf.c
>> index 683fd9b85c5c..2249ef7fe790 100644
>> --- a/drivers/firmware/arm_scmi/perf.c
>> +++ b/drivers/firmware/arm_scmi/perf.c
>> @@ -27,7 +27,7 @@
>>  /* Updated only after ALL the mandatory features for that version are m=
erged */
>>  #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x40000
>> =20
>> -#define MAX_OPPS		32
>> +#define MAX_OPPS		64
>> =20
>>  enum scmi_performance_protocol_cmd {
>>  	PERF_DOMAIN_ATTRIBUTES =3D 0x3,


