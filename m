Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33396C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0ZDrhkLSCLc2jf7TcTUKC2c3xBVgJDsNtUs7W0iKYk=; b=eIMQHx4mb9LYCN/9Hp/THPwH6G
	5IKfKyc7aCSFTYMjT2Gtw8kMl80Nr8Cr6xNiV9/7yh/w0bdNNbUUUsK/jd4v8zZRgLk8geTohUfOG
	rZbH3x9e4BgdBfcCzxVsA6+cNFXYksMaAGGq7pqD6QZ9cUTo9uat7EdHJzJu+BrHCiVciuqNG0yJU
	tYyI/e26jLf9gRBxN0tEUpWepK0z3jHSwGT1oL1Gq8vHSp3tUbL+3ugwVzeQAHL7iLq3v/7iFk4N2
	AB3NtuUGbo78owfogQCjUQ0fGyyx+90KOyhngEVVS+Yo0dHfO11AvkhxbiFfLj0hwIMUpcQhzwwTi
	nwIrUAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tno68-00000009FgB-3H6P;
	Fri, 28 Feb 2025 00:19:24 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tno4a-00000009FXm-2CcM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 00:17:49 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 94D10210EAC2;
	Thu, 27 Feb 2025 16:17:46 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 94D10210EAC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740701867;
	bh=i0ZDrhkLSCLc2jf7TcTUKC2c3xBVgJDsNtUs7W0iKYk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g7NibrQdqws5JRPkgJqIsiE2d7Y64O6ROaP1K5ksEH5RdhwCg6L8FbbcJggiKRfJp
	 8q/Niz8hKhPUqAQ3fqeipGIBgF0io6TAB8yTWiZ6nQpVTkPWxtYvjqK8mM8NcyBrh2
	 PSiJK1oHnv8IYoOIzZ108JWhO/Yf2fdCdgA2ANdg=
Message-ID: <f8d7c151-fc7b-4f57-96fa-2252c60bd81f@linux.microsoft.com>
Date: Thu, 27 Feb 2025 16:17:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] x86/mshyperv: Add support for extended Hyper-V
 features
To: Roman Kisel <romank@linux.microsoft.com>, linux-hyperv@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-acpi@vger.kernel.org
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
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <681a8922-b743-42cb-8793-ece9ae8919c1@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_161748_583976_2A5A9179 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

On 2/27/2025 9:59 AM, Roman Kisel wrote:
> 
> 
> On 2/26/2025 3:07 PM, Nuno Das Neves wrote:
>> From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> [...]
>>   -    pr_info("Hyper-V: privilege flags low 0x%x, high 0x%x, hints 0x%x, misc 0x%x\n",
>> -        ms_hyperv.features, ms_hyperv.priv_high, ms_hyperv.hints,
>> +    pr_info("Hyper-V: privilege flags low 0x%x, high 0x%x, ext 0x%x, hints 0x%x, misc 0x%x\n",
>> +        ms_hyperv.features, ms_hyperv.priv_high,
>> +        ms_hyperv.ext_features, ms_hyperv.hints,
>>           ms_hyperv.misc_features);
> 
> Would using %#x instead of 0x%x be better in your opinion?
> 
It's a reasonable suggestion. I'm not sure if it's worth another
version, if this patch seems good enough to merge as-is.
However if I'm doing another version of this series that still
includes this patch, then I can certainly make the change.

Thanks!

> [..]


