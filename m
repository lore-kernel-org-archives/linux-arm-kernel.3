Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D90C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laxQUa2iwGyTNDtBa6S1LG374rW09RB1CYSVN9bF2Ew=; b=t9vUfY4m+M8XUjR1gh/I/CmQCi
	Dc7byhxe+u3YjQPmY4G+vJ15WEjzNwB03on6jKvyBShPjEctVNh6uvzPm7EcVM7hXBS0ALTk4CbhA
	tvYM0v1v9Uxk7yZuvPwNrwn0wp8aed9XTdaRe36Fj4nO45Ocp237BfdAFQ0O5IKnu3WOmb8BtUGP2
	i83Y0z3Z6HLDXIlc6gaHMDRF5VS0dQNtt6zYi4VNtUrqxRkTesgs8K6wm9zvT3nKiQDU0DMgkg8gL
	jJKOdIg+d6+w6Jl7fKGxp4N2xGPjYt+twMbHZMHaHijg9oBaWnXSQv5MdmXt9uP1PighFG3wVy2q4
	6NhWOrYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnoB1-00000009GRx-1LjC;
	Fri, 28 Feb 2025 00:24:27 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tno8P-00000009G6G-0xm1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 00:21:46 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0B9F1210EAC1;
	Thu, 27 Feb 2025 16:21:44 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0B9F1210EAC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740702104;
	bh=laxQUa2iwGyTNDtBa6S1LG374rW09RB1CYSVN9bF2Ew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rO2aj4Cu80fRwlpTq389v36uTw+53TKIzBHJgNH9RbHbV31yyxs7t5moGAqalVVLz
	 pW3c3b2Rbgis+2faahPrWY0gcG+RyLONFYtSrWhG5J6Di1GR5AyCqPSI3n7BcZYYcr
	 OPv5FPMPhyWA5pMcsXLrORKizHmr2coZx3nGe46w=
Message-ID: <9c8b92d3-d3fc-42a6-9493-2e18508c5890@linux.microsoft.com>
Date: Thu, 27 Feb 2025 16:21:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] hyperv: Introduce hv_recommend_using_aeoi()
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
 <1740611284-27506-5-git-send-email-nunodasneves@linux.microsoft.com>
 <f509907e-019b-4d16-a0d4-1a5acfe8592e@linux.microsoft.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <f509907e-019b-4d16-a0d4-1a5acfe8592e@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_162145_294694_E9009F9B 
X-CRM114-Status: UNSURE (   7.77  )
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

On 2/27/2025 10:04 AM, Roman Kisel wrote:
> 
> 
> On 2/26/2025 3:07 PM, Nuno Das Neves wrote:
>> Factor out the check for enabling auto eoi, to be reused in root
>> partition code.
>>
>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>> ---
> 
> I think adding "No functional changes" would bring some benefit:
> that's an additional invariant to check against when reviewing.
> 
Thanks, I can add it for next version :)

