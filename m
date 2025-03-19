Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D124C35FFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 04:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONzR6HCwazaLp6Y5MCq95xw25jXEGlNy15BjbvDTfa4=; b=JS1tf6nmmppITkLAbeWOTLu/dg
	sTQXvdAfjbCUocKCDgsy7lzLV/oX4p4cxErs4uLkyXIYri5jjJScX6kjeI6jGLDIDg/CujOF7OrKI
	0ySbhE76Cc7z1oc7oZGMw4Rt6HN8+zhqleODzpopGmBITHWPjCzzxHbGsuALkOpqQvFIWfAGsf1+p
	u8OKkLMvHr9U4Yhtx7bqjmLY12U8aK6JFSpLL3bKJjyUZKSqs1gN+fjz2GMa2NBfZRq/+o1DYHauE
	lrHjcWOp6iB6ME5HFicqw5dJ28zRJdoQ1PvSXfq8QNkeRqAr3U/+TFYJwAtcqpxA8P1ljdP4UCcx5
	DDaLTBSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tukke-00000007xBj-1Fat;
	Wed, 19 Mar 2025 04:09:56 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tukix-00000007x5w-3QaQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 04:08:12 +0000
Received: from [100.65.32.26] (unknown [20.236.10.66])
	by linux.microsoft.com (Postfix) with ESMTPSA id EF9092025373;
	Tue, 18 Mar 2025 21:08:09 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EF9092025373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1742357291;
	bh=ONzR6HCwazaLp6Y5MCq95xw25jXEGlNy15BjbvDTfa4=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=QCHO07m7FpcYme3eveUH4scwJxhTwlntXMBs+EPRpfKCCcTXCFuKDticTp8t3de3x
	 gyuFRbSvX+QysyHSsHhqX/3WT8FgeDuzFH9Nss+Kt6sIr2qv4aUbv49Tyr+tJTnrlT
	 usYh3V7lmxcE5jboBQuAqbZ04GiOUg+TOyIQ3fDY=
Message-ID: <1a60c4f3-b93b-4bc2-9ded-07a1acd9d754@linux.microsoft.com>
Date: Tue, 18 Mar 2025 21:08:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, mhklinux@outlook.com, ltykernel@gmail.com,
 stanislav.kinsburskiy@gmail.com, linux-acpi@vger.kernel.org,
 jeff.johnson@oss.qualcomm.com, eahariha@linux.microsoft.com,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 anrayabh@linux.microsoft.com, rafael@kernel.org, lenb@kernel.org,
 corbet@lwn.net
Subject: Re: [PATCH v6 03/10] arm64/hyperv: Add some missing functions to
 arm64
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1741980536-3865-4-git-send-email-nunodasneves@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1741980536-3865-4-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_210811_881145_81AE78F0 
X-CRM114-Status: GOOD (  10.55  )
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

On 3/14/2025 12:28 PM, Nuno Das Neves wrote:
> These non-nested msr and fast hypercall functions are present in x86,
> but they must be available in both architectures for the root partition
> driver code.
> 
> While at it, remove the redundant 'extern' keywords from the
> hv_do_hypercall() variants in asm-generic/mshyperv.h.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
> ---
>  arch/arm64/hyperv/hv_core.c       | 17 +++++++++++++++++
>  arch/arm64/include/asm/mshyperv.h | 13 +++++++++++++
>  include/asm-generic/mshyperv.h    |  6 ++++--
>  3 files changed, 34 insertions(+), 2 deletions(-)
> 

Looks good to me.

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

