Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D13AC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuXyC1oOSB2vm0Rr+d7N6BqT0+ZyS774E0qFu11I2qQ=; b=wABGzC8DbLRSPn+BpuCcjraICy
	TCaxMYWT10wVsaY0bzsiRMwCfmCxbN4mkPoXx+nc/fcAAX7yaaiilxOrHanN6k+VC3Pwb1HQ/M7D+
	MPngq12z8o3zmtoiNj/EENDpB45eiq+CEMQn5iTlvRIPEBiWT7OTmfLABJv3JJFlcVltWBk/Wch4a
	HeSZj5W/Ra8PK8WY0J8VquxXkTRSpiDh9Nu+/OKWRFe0iKGG8yfCzSlLpGxBuruGNO+euOF55SCwA
	3Yg81mcbxYSMQePVJQee9pkxulbpHB+Ug4ZYulSIG65sPmTqOq9q9T49tL7DGqvJ9qK5ks9+cNnjP
	2xpd3bZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3UK-0000000BkUV-2twJ;
	Fri, 28 Feb 2025 16:45:24 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3Ri-0000000Bjlr-45qC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 16:42:44 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id D1BD3210D0D5;
	Fri, 28 Feb 2025 08:42:41 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D1BD3210D0D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740760962;
	bh=BuXyC1oOSB2vm0Rr+d7N6BqT0+ZyS774E0qFu11I2qQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZC+q+2cmxoMS5/5w+OQJrDHlI0cWX7041Z04WaxlO64/2SMVAme2kzBQNMQFXi/we
	 ObwR14nqEWrUYtHgXNr4LVNAIeFjUCg6DoWgQDBHcS527oIdmDS1oMTc1aVgfGsCI8
	 CcCkJXpoU7L9cjOUCBceQ9lSqXrova55ptgkseGo=
Message-ID: <41ec1b2e-0a82-4712-926d-ac73a7151e61@linux.microsoft.com>
Date: Fri, 28 Feb 2025 08:42:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] x86/mshyperv: Add support for extended Hyper-V
 features
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org
Cc: kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
 will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-3-git-send-email-nunodasneves@linux.microsoft.com>
 <681a8922-b743-42cb-8793-ece9ae8919c1@linux.microsoft.com>
 <f8d7c151-fc7b-4f57-96fa-2252c60bd81f@linux.microsoft.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <f8d7c151-fc7b-4f57-96fa-2252c60bd81f@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_084243_035920_D5312146 
X-CRM114-Status: GOOD (  11.17  )
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



On 2/27/2025 4:17 PM, Nuno Das Neves wrote:
> On 2/27/2025 9:59 AM, Roman Kisel wrote:
>>
>>
>> On 2/26/2025 3:07 PM, Nuno Das Neves wrote:
>>> From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
>> [...]
>>>    -    pr_info("Hyper-V: privilege flags low 0x%x, high 0x%x, hints 0x%x, misc 0x%x\n",
>>> -        ms_hyperv.features, ms_hyperv.priv_high, ms_hyperv.hints,
>>> +    pr_info("Hyper-V: privilege flags low 0x%x, high 0x%x, ext 0x%x, hints 0x%x, misc 0x%x\n",
>>> +        ms_hyperv.features, ms_hyperv.priv_high,
>>> +        ms_hyperv.ext_features, ms_hyperv.hints,
>>>            ms_hyperv.misc_features);
>>
>> Would using %#x instead of 0x%x be better in your opinion?
>>
> It's a reasonable suggestion. I'm not sure if it's worth another
> version, if this patch seems good enough to merge as-is.
> However if I'm doing another version of this series that still
> includes this patch, then I can certainly make the change.
> 

You're right, a suggestion like that shouldn't warrant another version,
agreed! Whether you implement that tweak or not, looks good to me.

Reviewed-by: Roman Kisel <romank@linux.microsoft.com>

> Thanks!
> 
>> [..]
> 

-- 
Thank you,
Roman


