Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D25C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 19:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uumL/iMZWLeatJCRzK/5OqmHs1yyifX8CVVlfPUqW88=; b=unT8XNPUXukG0w5lAec3y2XPUg
	HA7EPhIPEupn+LQZxmuBJrb7bXkxD5AFUP6DgKmdZwc83qE14YpE3kj3jnZ2F//4Hlh+ozmVgn06A
	xOVRarmQ3041mvvQHsn6RpqgjjZt1iXZw4X23s2b3l/pTZF15mHBqwHiaf9DGQjMC/rN15udSR+EA
	5QUyTFriXJUPbUDcx1e9pJstycxJ+wbPRtYRUfAeEinS4DVjDE3E+S9OLMwJnseGucR60myLBn9j3
	p1ajgz70jn3vI3azBl5UmvDauC6KSPO1yjp8vCf6b1y7xLBCuj94O5rj/BmeQ5VSlwH3mZE9GmA9N
	O5+csjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAgi-0000000F6uz-2N4t;
	Fri, 14 Mar 2025 19:27:20 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAf2-0000000F6ok-20cQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 19:25:37 +0000
Received: from [192.168.0.107] (76-14-231-56.or.wavecable.com [76.14.231.56])
	by linux.microsoft.com (Postfix) with ESMTPSA id 068C52033454;
	Fri, 14 Mar 2025 12:25:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 068C52033454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741980333;
	bh=uumL/iMZWLeatJCRzK/5OqmHs1yyifX8CVVlfPUqW88=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lcwAW6o9/himPCT2tEXXsKoXHWO8oRb1H+x24X7ywVm5YDb+pGWilcslz1ctKgD2Q
	 GFC+AqJBc2u+TzfWQJOXhlLuVrZvFJflC3ZhteSn1bhAyI+98O5uSfCvvTUlOFsxju
	 DJnw4BKFc9L2OEScqPySBUc6fAC0f5am1INgXf3w=
Message-ID: <c480e790-0abb-41af-a0cb-e358ff7b671f@linux.microsoft.com>
Date: Fri, 14 Mar 2025 12:25:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] Drivers: hv: Introduce mshv_root module to
 expose /dev/mshv to VMMs
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
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
 <1740611284-27506-11-git-send-email-nunodasneves@linux.microsoft.com>
 <fcd132af-03e4-496d-ba70-0097e90a83cf@oss.qualcomm.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <fcd132af-03e4-496d-ba70-0097e90a83cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_122536_547686_4C0C3CB6 
X-CRM114-Status: UNSURE (   7.94  )
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

On 3/11/2025 11:01 AM, Jeff Johnson wrote:
> On 2/26/25 15:08, Nuno Das Neves wrote:
> ...
>> +
>> +MODULE_AUTHOR("Microsoft");
>> +MODULE_LICENSE("GPL");
>> +
> 
> Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
> description is missing"), a module without a MODULE_DESCRIPTION() will
> result in a warning with make W=1. Please add a MODULE_DESCRIPTION()
> to avoid this warning.
> 
> This is a canned review based upon finding a MODULE_LICENSE without a
> MODULE_DESCRIPTION.
> 
> /jeff

Thanks Jeff. Fixed in v6.

Nuno

