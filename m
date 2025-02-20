Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DBBC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 19:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeQEm7g/5Ed+D26MEHjj4MWfwDZexQdKcjr1nchYGZU=; b=4EworQrSoiSXx98kTKc1TZYztW
	gTO3JgA8B9luz+5i2EEuL+SW/kTjWcweU4kTZUhaKKiyLlomOJbkiOu46C+b5bGq6+u0j/1EkGsij
	SUCHVnn0pRhtKVnVS3jRlSQ+6NyGlJoqsodQ/Ot/kMvidgWQY83kzpZKMqD0/304ONaCvUTjun9hH
	bvQi9QtMwLDpFf7eIOuepz3kuOHIqXCDtPye7HS6nKzYuTZc80wvJ+CbNVEvtfZjQQTxq1Opzbrux
	hk86nejzwxBu2NagrmRCYlXE9OHsAnowK8Ftz7/h47R+P/Wf3PH0TCfVk806ciLAXAaAMaDdvaL55
	IfWDo1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBpk-00000002WGf-0c70;
	Thu, 20 Feb 2025 19:03:40 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBoF-00000002Vqa-0YnV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 19:02:08 +0000
Received: from [192.168.35.166] (c-24-22-154-137.hsd1.wa.comcast.net [24.22.154.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6C1062059191;
	Thu, 20 Feb 2025 11:02:05 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6C1062059191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740078126;
	bh=NeQEm7g/5Ed+D26MEHjj4MWfwDZexQdKcjr1nchYGZU=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=TpP0wcMZCTRtM+c3Z7qG3/PCJYlDhwyoZnyPaR09jH6dl45kzjHXtPjI24GQ/6xsL
	 QQ6Z3LvqJurk+NGZ/iwfdFvK8c1VsWZKifGI+ToeeNOPjuc0+9o/gWeWO/jWYYOFbz
	 AmUyVSHXWUn9EwXFquo8gNtmRCwIMvXkrdKz1JpU=
Message-ID: <e85ddfef-2081-4c8a-96e6-e84a8410ff85@linux.microsoft.com>
Date: Thu, 20 Feb 2025 11:02:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 iommu@lists.linux.dev, mhklinux@outlook.com, eahariha@linux.microsoft.com,
 kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 arnd@arndb.de, jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mukeshrathor@microsoft.com
Subject: Re: [PATCH v2 3/3] hyperv: Add CONFIG_MSHV_ROOT to gate root
 partition support
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1740076396-15086-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740076396-15086-4-git-send-email-nunodasneves@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1740076396-15086-4-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_110207_212406_8D69C258 
X-CRM114-Status: GOOD (  11.13  )
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

On 2/20/2025 10:33 AM, Nuno Das Neves wrote:
> CONFIG_MSHV_ROOT allows kernels built to run as a normal Hyper-V guest
> to exclude the root partition code, which is expected to grow
> significantly over time.
> 
> This option is a tristate so future driver code can be built as a
> (m)odule, allowing faster development iteration cycles.
> 
> If CONFIG_MSHV_ROOT is disabled, don't compile hv_proc.c, and stub
> hv_root_partition() to return false unconditionally. This allows the
> compiler to optimize away root partition code blocks since they will
> be disabled at compile time.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  drivers/hv/Kconfig             | 16 ++++++++++++++++
>  drivers/hv/Makefile            |  3 ++-
>  include/asm-generic/mshyperv.h | 24 ++++++++++++++++++++----
>  3 files changed, 38 insertions(+), 5 deletions(-)

Looks good to me.

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

