Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D13FC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 18:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5G2E+vUtbY0uD73lnb0uFLzyVFiAj2xuYirRrBVabo=; b=giYnNg4JTumcZpjI6YcBq+MxWH
	Qa/Izf4nDHBFbaNXdcadb8oDl2+42Ghl/P+zHPeefaaSj8EljyxQy6+l3ZhEC7muysOxZHqtCDPOI
	CS7VKe2IfqQkS62j/5rfPm/9EQzo871C1bsamnMkJWZDoLzBTFz0SW+Hhm1JA4x2o/yymji2oxVhv
	VpLnrrpVc/eVfTbMSelUBJWxR3C9FS2CHrQPRu++GVH/vjVeiC2nQWwK8dmTjPIZbBpV1BkVZ3bqI
	nIZL9ICQaqdJ9w/Pe37ka4DBfZ16C6UxPVBPjj8tgcDL6xak10pHpg9G5Q0Jy9P8HVPlOQLRIiqlf
	24BDJJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBlX-00000002Uko-2eFz;
	Thu, 20 Feb 2025 18:59:19 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlBiw-00000002TyT-3pbz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 18:56:39 +0000
Received: from [192.168.35.166] (c-24-22-154-137.hsd1.wa.comcast.net [24.22.154.137])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3FD35203E3A2;
	Thu, 20 Feb 2025 10:56:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3FD35203E3A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740077798;
	bh=x5G2E+vUtbY0uD73lnb0uFLzyVFiAj2xuYirRrBVabo=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=lUMMvA48ESzUkTcMMWbiIOhiwtv/5Arnq9nEGx0Opzkkyf/25jcaIaXOcbLSbB1CI
	 ZRKu+5PZFWAm1gHdFNiE9YEbERuun9hBsF4ziOTScybHjKQm/XVkGxfVqkKj36Rl+z
	 ZECAN3e9WjMqh5k0vLnnmZyqpA39OUrA31KrWvJw=
Message-ID: <db2015a0-63a3-4005-9ad1-9b2f0b57ccb1@linux.microsoft.com>
Date: Thu, 20 Feb 2025 10:56:37 -0800
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
Subject: Re: [PATCH v2 2/3] hyperv: Change hv_root_partition into a function
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1740076396-15086-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740076396-15086-3-git-send-email-nunodasneves@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1740076396-15086-3-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_105638_978219_8FE3C971 
X-CRM114-Status: GOOD (  13.47  )
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
> Introduce hv_current_partition_type to store the partition type
> as an enum.
> 
> Right now this is limited to guest or root partition, but there will
> be other kinds in future and the enum is easily extensible.
> 
> Set up hv_current_partition_type early in Hyper-V initialization with
> hv_identify_partition_type(). hv_root_partition() just queries this
> value, and shouldn't be called before that.
> 
> Making this check into a function sets the stage for adding a config
> option to gate the compilation of root partition code. In particular,
> hv_root_partition() can be stubbed out always be false if root
> partition support isn't desired.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  arch/arm64/hyperv/mshyperv.c       |  2 ++
>  arch/x86/hyperv/hv_init.c          | 10 ++++-----
>  arch/x86/kernel/cpu/mshyperv.c     | 24 ++------------------
>  drivers/clocksource/hyperv_timer.c |  4 ++--
>  drivers/hv/hv.c                    | 10 ++++-----
>  drivers/hv/hv_common.c             | 35 +++++++++++++++++++++++++-----
>  drivers/hv/vmbus_drv.c             |  2 +-
>  drivers/iommu/hyperv-iommu.c       |  4 ++--
>  include/asm-generic/mshyperv.h     | 15 +++++++++++--
>  9 files changed, 61 insertions(+), 45 deletions(-)

Looks good to me.

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

