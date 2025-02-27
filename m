Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A487C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 05:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iea2p7PLsuC3Pv9hWcZqc+g7MssOtTN4ntA2Qor9cYQ=; b=biZDdhK+0BzZf7FPpGsTLiartg
	EQSj1nWs9Fdhr/M0zs+Y1UpGaET/kk3N6oQdzK1KfmcDZJPs/rqPUG9ZWf3S5fv752Y0xfjVPTRzL
	Arczi7F4C9DLagq2Asp1CJya0esJfolwmNLgDSlx0rrT8NzniIPyNnxlj6186P0/SVC81ODIszTCj
	Bl5vZNoURo3NkZCI2HkL69oKlCzLatQgHyipzplrbVxEHSSCNK5lUBRhTEdxYIsIYE66araMQ4RZl
	nusLPFB1ilJfTWRbbsjry3JhWWctmcJ2cjcpL1UMKHUdxisJiqs7BkKyKCvgII5AxGFXmIMo9Rf9r
	xBNk/M1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnW1f-00000006L0j-2Pw4;
	Thu, 27 Feb 2025 05:01:35 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnW07-00000006Kpg-144S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 05:00:00 +0000
Received: from [100.65.224.197] (unknown [20.236.10.163])
	by linux.microsoft.com (Postfix) with ESMTPSA id 14C3F210C33B;
	Wed, 26 Feb 2025 20:59:56 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 14C3F210C33B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740632398;
	bh=Iea2p7PLsuC3Pv9hWcZqc+g7MssOtTN4ntA2Qor9cYQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Bd4YPgQLvmbfbncvYfFew/zguQ0HiCvJ9aEWoQUT66Fxhg2c83GG4VCicn4NMl6VV
	 IyiUwx/KjkHQ7sR1bQl28wWBQedX+tg9LD8TRuABFxlGaHvLvHBu9o4/+SzhJbQvVn
	 xORRfFxbcKDfCxDjSFQbTdoGYEFlrd8fTVax2D6g=
Message-ID: <8ce2dc94-d4e7-45d7-8228-e8afd2bef3bc@linux.microsoft.com>
Date: Wed, 26 Feb 2025 20:59:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
 eahariha@linux.microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, mhklinux@outlook.com, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 arnd@arndb.de, jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
Subject: Re: [PATCH v5 10/10] Drivers: hv: Introduce mshv_root module to
 expose /dev/mshv to VMMs
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-11-git-send-email-nunodasneves@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1740611284-27506-11-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_205959_344247_B150BDFA 
X-CRM114-Status: GOOD (  15.20  )
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

On 2/26/2025 3:08 PM, Nuno Das Neves wrote:
> Provide a set of IOCTLs for creating and managing child partitions when
> running as root partition on Hyper-V. The new driver is enabled via
> CONFIG_MSHV_ROOT.
> 
> A brief overview of the interface:
> 
> MSHV_CREATE_PARTITION is the entry point, returning a file descriptor
> representing a child partition. IOCTLs on this fd can be used to map
> memory, create VPs, etc.
> 
> Creating a VP returns another file descriptor representing that VP which
> in turn has another set of corresponding IOCTLs for running the VP,
> getting/setting state, etc.
> 
> MSHV_ROOT_HVCALL is a generic "passthrough" hypercall IOCTL which can be
> used for a number of partition or VP hypercalls. This is for hypercalls
> that do not affect any state in the kernel driver, such as getting and
> setting VP registers and partition properties, translating addresses,
> etc. It is "passthrough" because the binary input and output for the
> hypercall is only interpreted by the VMM - the kernel driver does
> nothing but insert the VP and partition id where necessary (which are
> always in the same place), and execute the hypercall.
> 
> Co-developed-by: Wei Liu <wei.liu@kernel.org>
> Signed-off-by: Wei Liu <wei.liu@kernel.org>
> Co-developed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> Co-developed-by: Praveen K Paladugu <prapal@linux.microsoft.com>
> Signed-off-by: Praveen K Paladugu <prapal@linux.microsoft.com>
> Co-developed-by: Mukesh Rathor <mrathor@linux.microsoft.com>
> Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
> Co-developed-by: Jinank Jain <jinankjain@microsoft.com>
> Signed-off-by: Jinank Jain <jinankjain@microsoft.com>
> Co-developed-by: Muminul Islam <muislam@microsoft.com>
> Signed-off-by: Muminul Islam <muislam@microsoft.com>
> Co-developed-by: Anirudh Rayabharam <anrayabh@linux.microsoft.com>
> Signed-off-by: Anirudh Rayabharam <anrayabh@linux.microsoft.com>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---

I see some issues reported by checkpatch, both vanilla and --strict.
<snip>

Thanks,
Easwar (he/him)

