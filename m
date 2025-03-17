Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33F5C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 11:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jN0+M4gX8uMSJYT62hKxDE04ZoXl8RCCMboFMq8K3LM=; b=BzqFuPMWiUp88NLWFUEE960/if
	SlWXpQLSqOo40WmOodsZoO8G5IgdVs6BGtDFuJ1BY7C6Lz7eJlhDx7Fp0Rzwcl2WtYlYi7fN+27Ir
	D1uMQv09+os7/I1ktpY6qPF13ArU4gshlCl7YZF4W0EKHzjFjOeBIsSP0lGjBit6fp5RAGWR9J27h
	5/6AIHrWu6brkhIr6cIrn5qCyA0WLsYsSV/HlSGZcQFHTvHPWXIWyQDqftJZ33io9hB878SX+icHg
	m6x3PtASlwm6/qv7bF8j/OeM/49nxT8QypFk+MTk2Wy/3qqf2ryHKw13xSk/AFf+6bP+pLY/c+akM
	h2zShrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8nc-00000002QnG-1uuU;
	Mon, 17 Mar 2025 11:38:28 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu8lv-00000002QTi-1UyX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 11:36:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso14015725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 04:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742211401; x=1742816201; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jN0+M4gX8uMSJYT62hKxDE04ZoXl8RCCMboFMq8K3LM=;
        b=Ad8xefjkgsTSsclvQNe4ITj4DVsi4mW52JiUqqGTRcF6i9ogcZ7eFQLChd+La5Btf8
         nZEydTdQ64sCEGfb1lG6LlBCSn6eN+f7Ii0WlF8fkXqZSndk0gBVlygclA4B+KiVpA/I
         mBbcyJbxGQCEHPpv/97fY9TIq7kmSazlsMxkhc8gzmrr2AxDa6+S9yka/OTUTIySdfI8
         vZ/fPsGQNGp8xkSgWGZbcSp9oyIFez87bSzoww8YWq6jJGBefWtvaYz+E1g3n/7VCWsv
         7TsKhooNfKE1QzS5qvUWB8ELQNEZ2RhQyjh5YX0mLvDiUGYWYtLfr0lDLo4eFwMh/DJG
         uBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742211401; x=1742816201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jN0+M4gX8uMSJYT62hKxDE04ZoXl8RCCMboFMq8K3LM=;
        b=T9MTomlGHQoady1ORZISNWZoVNYNHqeDghIQ9VDNWuGCDJJXGMVtC8Hh2jt2UcCgae
         ojCOUFojKWtQDB/d7BlJUvZEUVpdigGrTEYMYu0UCySqSJszlSp1SaqM6jTjar4xN+8k
         Qi4VoRDpsI0eOfoaAEQty7au5EL+l8p8I5SOEq1cMk4TBGkgv0PjoDw92634YktrWLlX
         COtEndlZYMQvEW83Ff1Ebh46laJ29h2C+fFJbSn88zSPko30fgEyfkcmXHZn/k22JZp2
         Z3ZZq/p8xIvMLHH4hNgZeizTDRMNCFcWYdG63hZa8UPr/ijzbSZdE8/6gZdKTfPQj8TX
         pVNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrTArVTOEmiFKQe/jM/JdkbFxVSoJ5cmzDGbMCRX5Mae+NzrJOxiibbJsh0VOm92GymhHV6q9Zdv/fM5ZD59II@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+K+SX+CoAWxzNesB+/itMoXl19qSYuPy5rePl4cJBVGLnIAyL
	XDiydKlpvQfM2BWNWa4VOiYKW7z9C2llx8Bi1RIvWVax9vgAyx8nDrv95Cs+3Wk=
X-Gm-Gg: ASbGnct9lLnuyvQe68vFEDPxF59QLGSpEC25hYSr5l7toDSfw+cTmAAr1Uier6rpbjt
	HhYJDwOezmsTAJFZd+/75xwbGS2fLRRRx3rcKZvXBSoKZvfL+/ZNrMllSIemR7EyM5tC9u2tGKk
	Qit9sK9GIOAC4SmiJL/oMgvHpNdrU0dQDZNi15Z4qvfOgpBhSP7rmtQl8yabfLs39eZ6CWwi+Bu
	MrP3vFxKUaRW2ciPtkLGHiqVvj0gxv4k/DMSmXtfAHrIyhUumYPoCJKrEilW2DVl8B1GCmZF+V2
	75eazyZ9c7dD37yQKEcl9dJQQwqD5Rt9hBKI6wsK7jCus2IEJF69pA==
X-Google-Smtp-Source: AGHT+IGpe6gVPMzyOS93xBARTNQJHQXaN3m0Z+9TNyPFS5vYkYlGiqRdgGrs5Bmtix92MgU8E4mTig==
X-Received: by 2002:a05:600c:358c:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-43d1ecc3969mr122779395e9.13.1742211401582;
        Mon, 17 Mar 2025 04:36:41 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ec14bsm14651972f8f.100.2025.03.17.04.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 04:36:41 -0700 (PDT)
Message-ID: <c6a86373-64be-4101-a08a-74aa302bf64c@linaro.org>
Date: Mon, 17 Mar 2025 11:36:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] coresight: Convert disclaim functions to take a
 struct cs_access
To: Leo Yan <leo.yan@arm.com>
Cc: lcherian@marvell.com, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-3-james.clark@linaro.org>
 <20250313145456.GR9682@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250313145456.GR9682@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_043643_422425_9DD8A5BD 
X-CRM114-Status: GOOD (  12.02  )
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



On 13/03/2025 2:54 pm, Leo Yan wrote:
> On Tue, Feb 11, 2025 at 10:39:38AM +0000, James Clark wrote:
> 
> [...]
> 
>>   static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
>>   {
>> -       return coresight_read_claim_tags(csdev) != 0;
>> +       return coresight_read_claim_tags(&csdev->access) != 0;
>>   }
> 
> Likewise other claim functions, can coresight_is_claimed_any() change its
> argument type from struct coresight_device to struct csdev_access?
> 
> Thanks,
> Leo

I only wanted to change the ones that I had to. I think we should 
prioritize passing csdev as much as possible in the coresight framework 
to make everything consistent. Otherwise it's extra churn for no 
benefit, and if we need something from csdev here in the future we'll 
have to change this one back again.


