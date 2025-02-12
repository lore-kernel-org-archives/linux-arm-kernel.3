Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F1CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 04:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGrirHqveIit6aqRJIazknvS9VacjJy/z7EXHhG3ufI=; b=JpI8kKISbQ7y/UoTMRTSMvor8/
	4WIj6w8v/seY65AfHxLScqCSfk/NJ2290+r4Md06A4dtevi2bK+VixcbKxz2STrv69TLnsy9mZpz+
	0DqpeX5mMIKf9ot+67yE+gZcTb8/imkknwXE/3HYLGCZMDLTqUMY0G7pDjc7wxbAm01i3IVg+XdhG
	cdsTqd88VCinh3qFw3RX0oQaAZWbKU3kLkc4iFVRLf2MjcNsxUiAcqEA5gI5s3a8kUJvDSWoSPokX
	oa+b70GVTqZKZruund+CpeflLS5JwfunaaJVmngCcUC7PR6UMhyLhYz1VlCZ2tM7FJqDcc9Yv6HjA
	QDzR7Byg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti47R-000000068nJ-17gu;
	Wed, 12 Feb 2025 04:13:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti44c-000000068L8-2muI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 04:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70D9F5C54B5;
	Wed, 12 Feb 2025 04:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D29CC4CEDF;
	Wed, 12 Feb 2025 04:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739333405;
	bh=LfTqYMNqbDCdif5LqgS5/zDpDtXkvNu0iQqDL0rZSm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XoijgSACpeHYNmrRqkpsja2L/mnGksF3YPY3mmltqefrFF0vhrkYuuIUYu2ay4+x3
	 Z2Mq1AjdX6kpP1Yk40Owq3AU0CVRB9idFQOJ/WV8uUouC0wwhQsIwhor1bjP0MlAa4
	 FJVnaJBdd7pC+a9aM41fOiQi4oFjlECLOtNxTdd3D9d9/zBVTFUMWoM1Ky48Vb6Bl1
	 U7E7LZH38fvax6FN5Ir1FvWN0Ct8poE51V78ev9G5P+lfxZUC3Iz+o+uz02u6wLsaO
	 Yp17Rev7jXMu9NXhoCAng59TtEB+XeIVAOs6BqUTkx1Q76qrVi5SayoRVg93th2LIu
	 yqDnvZhs7XfCQ==
Date: Wed, 12 Feb 2025 04:10:04 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	wei.liu@kernel.org, mhklinux@outlook.com, kys@microsoft.com,
	haiyangz@microsoft.com, decui@microsoft.com,
	catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, arnd@arndb.de,
	jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com, mukeshrathor@microsoft.com
Subject: Re: [PATCH v3 0/2] hyperv: Move some features to common code
Message-ID: <Z6wfHOPNUL2KcSG8@liuwe-devbox-debian-v2>
References: <1738955002-20821-1-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1738955002-20821-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_201006_760831_BE0B27F4 
X-CRM114-Status: GOOD (  14.67  )
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

On Fri, Feb 07, 2025 at 11:03:20AM -0800, Nuno Das Neves wrote:
> There are several bits of Hyper-V-related code that today live in
> arch/x86 but are not really specific to x86_64 and will work on arm64
> too.
> 
> Some of these will be needed in the upcoming mshv driver code (for
> Linux as root partition on Hyper-V). So this is a good time to move
> them to drivers/hv.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
> Changes in v3:
> * Just use percpu input page for the hypercall [Michael Kelley]
> * Move the calls to hv_get_partition_id() back to arch code [Michael Kelley]
> * Rename struct hv_get_partition_id to hv_output_get_partition_id
>   [Michael Kelley]
> 
> Changes in v2:
> * Fix dependence on percpu output page by using a stack variable for the
>   hypercall output [Michael Kelley]
> * Remove unnecessary WARN()s [Michael Kelley]
> * Define hv_current_partition_id in hv_common.c [Michael Kelley]
> * Move entire hv_proc.c to drivers/hv [Michael Kelley]
> 
> Nuno Das Neves (2):
>   hyperv: Move hv_current_partition_id to arch-generic code
>   hyperv: Move arch/x86/hyperv/hv_proc.c to drivers/hv

Applied to hyperv-next. Thanks.

