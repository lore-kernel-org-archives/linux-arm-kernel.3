Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF91C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGrI6nAX4nCRtePDyYEwyLt8sd0vFatzh0dTirTXVmM=; b=qxSs+lStfBSr3siJC19tlPXy2E
	WLyJZncbW9g9lYPBy1kdS8PwdZefkcMK92tXog8QK56XR+BIceiIq05kML0arUuDrtHq56/DeyCgU
	1NKq7G/5O3BoGVKa9LfcW6jpTNCZG5ON+si4k8JRzLPbZMB9ZlUwOrhjEjJud7af22cda4xkXVN0M
	VLRfwOxN1aMfO9/9nEg09zk9oCqNomi70ccYAqFnSEfyuV6N4CzXXC0q0971p3MoMKM25EGmblwzZ
	Qmheu2Sg6mNs+84IBIxEog9IdnN1pf+eBz8meTdY4sf41+4mSyJbhhCwrNOwVDQxqgNw+11uP+GHb
	2gpDPU1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQok-00000005hbb-2nyg;
	Wed, 26 Feb 2025 23:27:54 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQnD-00000005hPU-1PJL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:26:20 +0000
Received: from skinsburskii. (unknown [20.236.10.163])
	by linux.microsoft.com (Postfix) with ESMTPSA id A1F5C210EACA;
	Wed, 26 Feb 2025 15:26:17 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A1F5C210EACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740612378;
	bh=rGrI6nAX4nCRtePDyYEwyLt8sd0vFatzh0dTirTXVmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRHB5n/BwWwjybWsdCNB5VfjPzZD1F81cg1tOqoOTWFpj/E+2a0diKph99mozzpjC
	 RTwswAhsL0o5kgdjfSP051gSwIKm5rwqxffU/xii0NrPI8dY5jpJ5I7Stb3EYL+9tP
	 xsbT5cjD4mQcz7Wu1lwehl/9OhyuPnWcFq4Q9oIQ=
Date: Wed, 26 Feb 2025 15:26:15 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
	arnd@arndb.de, jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com, mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com, apais@linux.microsoft.com,
	Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
	gregkh@linuxfoundation.org, vkuznets@redhat.com,
	prapal@linux.microsoft.com, muislam@microsoft.com,
	anrayabh@linux.microsoft.com, rafael@kernel.org, lenb@kernel.org,
	corbet@lwn.net
Subject: Re: [PATCH v5 01/10] hyperv: Convert Hyper-V status codes to strings
Message-ID: <Z7-jF8rB5bDgSBiy@skinsburskii.>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-2-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1740611284-27506-2-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_152619_414737_A35552DF 
X-CRM114-Status: UNSURE (   8.69  )
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

On Wed, Feb 26, 2025 at 03:07:55PM -0800, Nuno Das Neves wrote:
> Introduce hv_result_to_string() for this purpose. This allows
> hypercall failures to be debugged more easily with dmesg.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  drivers/hv/hv_common.c         | 65 ++++++++++++++++++++++++++++++++++
>  drivers/hv/hv_proc.c           | 13 ++++---
>  include/asm-generic/mshyperv.h |  1 +
>  3 files changed, 74 insertions(+), 5 deletions(-)
> 

Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>

