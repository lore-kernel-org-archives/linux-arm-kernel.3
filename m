Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FAEC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlCdoqnuy1rzQZsJE5kNcyighHEqrB9PSElkNCee3L8=; b=IfQyZSwRzD++c/aTxikwamL0aj
	/qCHRM07v5q9esE/jxgDEsg6V0BtVvxAcgiqy5AwAE0TXjHil3PF4kwXGt6gp+x3+WcUxEuJk2moH
	STsLt72RPevu1d/u5u0LkljhjngpCirbKT/QNrN8fkHnm1FnAhLii79gthrO0LFG3kpbOuxIZcETm
	iTqiSsfHlxLj2UA9lCPkj37vfxPuHL69m0bT5iK8RUtMaTdq4mPM7UHqhMA2XFxnYDds5lHU49uoy
	Xy73Py9iAZ/1o0qxTsGL3MvhI60wWGonmONQ9jTIKykE2QBiO2+RFDxFhvuxrOR+3OPaytB3TNFdt
	W8E4gjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK2x-00000008E2q-2p78;
	Wed, 12 Mar 2025 11:14:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJbx-000000089VS-2bfM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:46:54 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so33508955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741776412; x=1742381212; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PlCdoqnuy1rzQZsJE5kNcyighHEqrB9PSElkNCee3L8=;
        b=CJrfLDOrGHrIbdsbYahc+fp/109oyWGIfvJCZb7LUwtpsE27XNf2n2n1uQrXkG6tKc
         YQLms2Zy4kN+yd20dyygIBpSmmE5efktvYBFe4tI/49v37S+KU+WG3360uv0FhJIVmXd
         5u4UBLfj7ZUuZSJDPBY/ElEYTeVPEKqAIujpUSNddpHRkgf4DMzWCh9oIPCqWR+SZciL
         g4qftIc/Aq5x3RO/q+m+rN6jahTDpb6RpHP1GXcRDIl64WZlPZJDKKmcmvyjjAXMOx25
         MFBObuVE1KotdtsQ2IwmfT+Wt1X45O2lcN34h653/0P4cIVxvSn92H3ZIRlZPdJn0xQ5
         RgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776412; x=1742381212;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PlCdoqnuy1rzQZsJE5kNcyighHEqrB9PSElkNCee3L8=;
        b=su3TctTctNnp7p6bZMZPVaqVpBbGmwNrURTQmKXfMSlLyoIItyrZ/AorB/qD8gVuOj
         aicnwS/mFaJ4IZca2vYFm5oKyyABK/TtRFfYyoQ2kZt64mCqvWfSOVijknHdcRCZQbRD
         49kV/MtkJiwy/Vb/EPbLYnEmdqN/SETXyRCqy5UG5l+2ZDCZ2myWNyzm4Ai4AJ79fzni
         NoAUSjGJ8x6z7iHJFbci9wUZPjdTcXD1YC80HXnm/I9+2nDNUcWr5R9gm3oHiXy9KHgt
         8FuXr54Y3nG9b4XE/6lwH7wv+kyXaW3SmAuuvrH2n+7cItgdVxoMKU71lY/hM7EotQ+5
         Ly6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmiT3okEM4/lyXW0Vkd1BVQACQSoXteJGYTFJhojWVxEDOK5iWwZnh8aYendodDhIG9P6ZwjxQ0E1bgLEUBdJV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7r6RuNbfoaUJOKImHdmGuRRnEKM29TTLz1piEDfZ9WkRLn4Uh
	ZzzOL6nXrPXH9aS37n3Rc9T43qPmpScpybptWsTIe71ihF2pZ/XxgHkapQKO4XY=
X-Gm-Gg: ASbGncunQTwofLu+IPRveZx7ealArAYA+23hLm1wSKqwui1Qv1/Y+7aeO/hqLfh3ZmE
	MocW6fbPsBgagIWnHgFsELlb8tp/1IzMdBwjf2AyNFTi63ujSux69SE0Ocdr57ap5+4UzIy/QcI
	uEREvzrje7NMlCFJnyFqy4uuVFvj7GPy8YJElfbNvY2ttgVwN4q5vXlgGgNcCDdxDJlLrCxMNI4
	RD38yd/KoayKlyfoVerMwL6B7XbSqckrSF5QBuWYVik2Z5xVUm/jqVDPMHINpakeMowWOPdIrXJ
	l38+foMymPgUKi0L/pklb5bGFGMx11uWZr/X+1yrpvYhr9zUzO865Q==
X-Google-Smtp-Source: AGHT+IHEYJN4xPkzICEY1jso6wVewx65u7jQrXPP1xJLeTxQL55K5z0VSuFkgMOyPntNnn+Hd4A7Gw==
X-Received: by 2002:a05:600c:5618:b0:439:9a40:aa0b with SMTP id 5b1f17b1804b1-43cdfb7e4b1mr156156805e9.25.1741776411989;
        Wed, 12 Mar 2025 03:46:51 -0700 (PDT)
Received: from [192.168.1.247] ([209.198.129.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e2f44sm20474280f8f.76.2025.03.12.03.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 03:46:51 -0700 (PDT)
Message-ID: <bed04866-a477-498a-b33a-a631759733e2@linaro.org>
Date: Wed, 12 Mar 2025 10:46:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: configfs: Constify struct config_item_type
From: James Clark <james.clark@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 "coresight@lists.linaro.org" <coresight@lists.linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
References: <1011717e5ed35ec12113a0d8c233823e820fb524.1723368522.git.christophe.jaillet@wanadoo.fr>
 <d8164311-83e7-4fb0-ab82-90e1a2762b01@linaro.org>
Content-Language: en-US
In-Reply-To: <d8164311-83e7-4fb0-ab82-90e1a2762b01@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034653_666382_2454DCB6 
X-CRM114-Status: GOOD (  13.81  )
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



On 12/08/2024 10:12 am, James Clark wrote:
> 
> 
> On 11/08/2024 10:30 am, Christophe JAILLET wrote:
>> 'struct config_item_type' is not modified in this driver.
>>
>> These structures are only used with config_group_init_type_name() which
>> takes a "const struct config_item_type *" as a 3rd argument or with
>> struct config_group.cg_item.ci_type which is also a "const struct
>> config_item_type    *".
>>
>> Constifying this structure moves some data to a read-only section, so
>> increase overall security, especially when the structure holds some
>> function pointers.
>>
>> On a x86_64, with allmodconfig:
>> Before:
>> ======
>>     text       data        bss        dec        hex    filename
>>     4904       1376        136       6416       1910    drivers/ 
>> hwtracing/coresight/coresight-syscfg-configfs.o
>>
>> After:
>> =====
>>     text       data        bss        dec        hex    filename
>>     5264       1120         16       6400       1900    drivers/ 
>> hwtracing/coresight/coresight-syscfg-configfs.o
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Compile tested-only.
>> ---
>>   .../hwtracing/coresight/coresight-syscfg-configfs.c  | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c 
>> b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
>> index 433ede94dd63..213b4159b062 100644
>> --- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
>> +++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
>> @@ -160,7 +160,7 @@ static struct configfs_attribute 
>> *cscfg_config_view_attrs[] = {
>>       NULL,
>>   };
>> -static struct config_item_type cscfg_config_view_type = {
>> +static const struct config_item_type cscfg_config_view_type = {
>>       .ct_owner = THIS_MODULE,
>>       .ct_attrs = cscfg_config_view_attrs,
>>   };
>> @@ -170,7 +170,7 @@ static struct configfs_attribute 
>> *cscfg_config_preset_attrs[] = {
>>       NULL,
>>   };
>> -static struct config_item_type cscfg_config_preset_type = {
>> +static const struct config_item_type cscfg_config_preset_type = {
>>       .ct_owner = THIS_MODULE,
>>       .ct_attrs = cscfg_config_preset_attrs,
>>   };
>> @@ -272,7 +272,7 @@ static struct configfs_attribute 
>> *cscfg_feature_view_attrs[] = {
>>       NULL,
>>   };
>> -static struct config_item_type cscfg_feature_view_type = {
>> +static const struct config_item_type cscfg_feature_view_type = {
>>       .ct_owner = THIS_MODULE,
>>       .ct_attrs = cscfg_feature_view_attrs,
>>   };
>> @@ -309,7 +309,7 @@ static struct configfs_attribute 
>> *cscfg_param_view_attrs[] = {
>>       NULL,
>>   };
>> -static struct config_item_type cscfg_param_view_type = {
>> +static const struct config_item_type cscfg_param_view_type = {
>>       .ct_owner = THIS_MODULE,
>>       .ct_attrs = cscfg_param_view_attrs,
>>   };
>> @@ -380,7 +380,7 @@ static struct config_group 
>> *cscfg_create_feature_group(struct cscfg_feature_desc
>>       return &feat_view->group;
>>   }
>> -static struct config_item_type cscfg_configs_type = {
>> +static const struct config_item_type cscfg_configs_type = {
>>       .ct_owner = THIS_MODULE,
>>   };
>> @@ -414,7 +414,7 @@ void cscfg_configfs_del_config(struct 
>> cscfg_config_desc *config_desc)
>>       }
>>   }
>> -static struct config_item_type cscfg_features_type = {
>> +static const struct config_item_type cscfg_features_type = {
>>       .ct_owner = THIS_MODULE,
>>   };
> 
> Reviewed-by: James Clark <james.clark@linaro.org>

Ping. Just found this one hanging in my coresight branch. Still applies 
cleanly.

Thanks


