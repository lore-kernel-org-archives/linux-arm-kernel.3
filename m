Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0105CF34B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+q6MH2wUYmWiA2m/aB7uSk/4x8ihBeWt9CWI89JZj8I=; b=MCP28U/lO/k+/wJGHgY8qJU+gk
	WezZ0neLJ22qDfegVwqr/msW1pL6qk7LGjoPEyTBFu2FKP8BN2Dj4MA7CibOui9uz1y9nAVi+JTXg
	1ACbekRzaNvEpI8Xwuds1UlkhzM1+65Y9DFP21Y/xgoH2zbkWpi12UXC1qI08AlfJPrPtjbFMBbmQ
	j5We1uDq5KaY9klGICz8i3AZUGoD+oGtJ9CxWpkpEo8nH8ezBos//M+behWLIll9d0wnujW0NCcJK
	Wb9oPneMut6STt0aS96rVG6JIzn/QVSc3VSYS0DB4X3QTPGTrSHsUPYDlYOfCEoKVoqiBJ2GLWMdw
	nFAxAcoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLieX-00000003KDF-2d3V;
	Wed, 19 Nov 2025 13:55:21 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLieV-00000003KCj-1OBr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:55:20 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so48558585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 05:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763560517; x=1764165317; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+q6MH2wUYmWiA2m/aB7uSk/4x8ihBeWt9CWI89JZj8I=;
        b=KPKaiuRMpxvjtWSd9zPqlMbBkPKHsVeqAxGcT9uyn6wacbqygnhA4bGCAif0H8f9KJ
         nnp4ySaHT+wtHn5Bnuj1bn3M6j7Qq3DcAZY0ns9me5FNY8q1RY6PhMJR4AmpufETR3E0
         1y1Ux/+k8pYBh2sTJNQBCZWA9dtoC/Ei73nkL9/TnKrkTLF8TuTL4jSLxavICGYl06ZS
         SzWMCSF0stA5wAThSatgdM1smTMcjho/0gJFkTPpYcaNHhY+XLCqWzdxOpU8byuHXzEj
         +bDDMWy7CEqpM9g4mGHw/IN48Vq0NZSwpueINK3IjThhIy0rNibT0aH9yMV6RyDYbCkA
         7uAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560517; x=1764165317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+q6MH2wUYmWiA2m/aB7uSk/4x8ihBeWt9CWI89JZj8I=;
        b=hIMfxtCCqY8SVy7429Vet1n9YNWua7nxwaTQH0mDhZPApBBWUnGz425TGjqLC83kun
         02Su+dgdyVWYANIA8JDLgrMsUmDVLcpxQhn81HJqn7qZec2jSQJYgowdEvLNy2qZnGWY
         Eks+cWSVtn70Th6DcB3byudvWObprZHV8iegxKVQRo+d+xR7IEvyQ0qltUVusCdAF0qz
         8PdF8hWRoeN9rfVMOdRkEsBaFVRQocW+7rtii1jsOFRhRO53yFhrWQcL+Bb1aB2W8OH6
         swwDCrTB/bqJjxWsWM37Sorz5DILRbcPNsXfBKtEYkWZ6KRNwOoeBs96pXB3r12yMzEE
         QtwA==
X-Forwarded-Encrypted: i=1; AJvYcCWWnn4AW9qcifPAawzyPAOqoavKOjHg49KLtwguIIp1h1iHPyuw1hxKEF4lXkoXh+thmfG1t7NtGp1CS35/dZgQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxPDW06KZ5Rq2/F7ERCJ6MBn2IGcOXQd+59uX0AsfYp6xC9TJJv
	zPhP5NWD8j6UNWMGbEYMsoZtICpv/ywOrv1Q+TUqD8Nkl7+UGr7XsN+Mssxml7BS+2g=
X-Gm-Gg: ASbGncu8oOIuZi21+mlBnOwkzkipBr88+dRpMvc198ktPL72EHcbB2d1xrglaqFXE0G
	+vFSjt0Oy5K16V0FSQS+BbyrIZni37CXb1su3tcLXvkZ/L3bYx8nk2kAf+ZcqL7/6nDT/FPNNgK
	QvKy22bui0F7U8X2s5Pif/Ad2aysSaAnC8YwCbTetf5ePTnzpZHfJ5WbqQDWr1p5rBzT89O4vzK
	IbWyWD0qSPbdOVlu5ub5a2vPsB71+1zqQIp7CQhwunvoz+NHE2hhlNpWtNiQR2aJahhpihOOkdS
	OIrY6C/r0ovbj4+nBDYBbCa4BDM0H00sij8su4PK0iRi7a67BBvYgyrwE8QRgs4TH3ttfnfOBNr
	2xUEF0Dvw5OYLqNjcSf9HnQwPReTkxoQSAqK6xohLkVusSS6I7Wb+ppdEnU4vRfhpBcrTwerZuR
	wiRL6aft3vAH/MsjeC2FO6olOHKYYEku4EROYJMg==
X-Google-Smtp-Source: AGHT+IEkdbSdxiPZRPo/BfGmPl8Z82ZAzyIqM965RgSEKLzus7ZjC7qYxPL1XYrZ3Hts2RXQnznpcg==
X-Received: by 2002:a05:600c:190b:b0:471:131f:85aa with SMTP id 5b1f17b1804b1-4778fe4a039mr165734565e9.13.1763560517126;
        Wed, 19 Nov 2025 05:55:17 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1012af0sm49846635e9.6.2025.11.19.05.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 05:55:16 -0800 (PST)
Message-ID: <a199db90-a344-40e0-8628-b4c3b56fc92c@linaro.org>
Date: Wed, 19 Nov 2025 13:55:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
 <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
 <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
 <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
 <43a60afe-5170-4801-ae70-9243cf7b45b8@linaro.org>
 <20251119123647.GC8204@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251119123647.GC8204@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_055519_422999_8B30DC2B 
X-CRM114-Status: GOOD (  25.23  )
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



On 19/11/2025 12:36 pm, Leo Yan wrote:
> On Wed, Nov 19, 2025 at 12:00:30PM +0000, James Clark wrote:
> 
> [...]
> 
>> ...  But then to make
>> the code match the warning it might also make sense to change CONFIG_ARM64
>> back to CONFIG_CORESIGHT_SOURCE_ETM4X, which Leo suggested to change. Maybe
>> I can just delete the warning text, practically this warning can never be
>> hit.
> 
> Armv8 CPUs can runs in aarch32 mode, strictly speaking, we should also
> can run ETMv4 driver in aarch32 mode as well.  Then CONFIG_ARM64 is the
> right choice, this can remind us that `is_kernel_in_hyp_mode()` is
> always stick to aarch64 mode.
> 

For the avoidance of confusion, in this case CONFIG_ARM64 and 
CONFIG_CORESIGHT_SOURCE_ETM4X are 100% equivalent and there's no 
functional difference. Yes maybe 32 bit userspace can be traced from 
ETMv4, but that's not really related with how this code is compiled.

>    static ssize_t format_attr_contextid_show(struct device *dev,
>                                              struct device_attribute *attr,
>                                              char *page)
>    {
>    #if IS_ENABLED(CONFIG_ARM64)
>         if (is_kernel_in_hyp_mode())
>                 return contextid2_show(dev, attr, page);
>    #endif
> 
>         return contextid1_show(dev, attr, page);

Not having an #else implies that the contextid1_show() part is valid 
when !CONFIG_ARM64, but that isn't right. That's why I had the WARN_ON 
because it's dead code.

Personally I would drop the is_visible(). It makes sense for dynamically 
hidden things, but these are all compile time. IMO it's cleaner to just 
not include them to begin with, rather than include and then hide them. 
Then the extra condition in format_attr_contextid_show() isn't needed 
because the function doesn't exist:

GEN_PMU_FORMAT_ATTR(cycacc);
GEN_PMU_FORMAT_ATTR(timestamp);
GEN_PMU_FORMAT_ATTR(retstack);
GEN_PMU_FORMAT_ATTR(sinkid);

#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)

/* contextid1 enables tracing CONTEXTIDR_EL1 for ETMv4 */
GEN_PMU_FORMAT_ATTR(contextid1);
/* contextid2 enables tracing CONTEXTIDR_EL2 for ETMv4 */
GEN_PMU_FORMAT_ATTR(contextid2);
GEN_PMU_FORMAT_ATTR(branch_broadcast);
/* preset - if sink ID is used as a configuration selector */
GEN_PMU_FORMAT_ATTR(preset);
/* config ID - set if a system configuration is selected */
GEN_PMU_FORMAT_ATTR(configid);
GEN_PMU_FORMAT_ATTR(cc_threshold);

/*
  * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
  * when the kernel is running at EL1; when the kernel is at EL2,
  * the PID is in CONTEXTIDR_EL2.
  */
static ssize_t format_attr_contextid_show(struct device *dev,
					  struct device_attribute *attr,
					  char *page)
{
	if (is_kernel_in_hyp_mode())
		return contextid2_show(dev, attr, page);
	return contextid1_show(dev, attr, page);
}

static struct device_attribute format_attr_contextid =
	__ATTR(contextid, 0444, format_attr_contextid_show, NULL);
#endif

/*
  * ETMv3 only uses the first 3 attributes for programming itself (see
  * ETM3X_SUPPORTED_OPTIONS). Sink ID is also supported for selecting a
  * sink in both, but not used for configuring the ETM. The remaining
  * attributes are ETMv4 specific.
  */
static struct attribute *etm_config_formats_attr[] = {
	&format_attr_cycacc.attr,
	&format_attr_timestamp.attr,
	&format_attr_retstack.attr,
	&format_attr_sinkid.attr,
#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
	&format_attr_contextid.attr,
	&format_attr_contextid1.attr,
	&format_attr_contextid2.attr,
	&format_attr_preset.attr,
	&format_attr_configid.attr,
	&format_attr_branch_broadcast.attr,
	&format_attr_cc_threshold.attr,
#endif
	NULL,
};
>    }
> 
> Thanks,
> Leo


