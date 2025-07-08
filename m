Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24164C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twXK54xRPW0BLw3i1+4eFj5+Fo3XWGa/TGbjPTGxTb0=; b=2NR3rQ+kQKD2UHFSdTqhSIfr6a
	sKEejdzXNEccTSKOLK8vFWJDz3nXJfHVfXaXwiaN2OavPmsGutjD51GqigQ65+0HUOu0Bquq+WG52
	g6cBNYergQoGDiTPpMQh9HdJBQl0+sbvU0Dn0ViPlp6ZhiAjwEQIvMDSoUhHXalWL6GNaKlh1vgVk
	zbYOV42JHEcT4HYaYuV+YFkSNfWkKao4z2LJIT3HwquHChCcudMr0VhC+xm/wZ3DpZekfeHQcFHya
	J/FyB+aGSaP5Qk0+VoJH20BFvvcsfN+dxmB1k3WdH4xxTrxsFiosHjgyWaz/vdtY4LlsXgK/jgDo4
	BM9Gliig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8DE-00000005OyA-0bHA;
	Tue, 08 Jul 2025 13:18:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ84m-00000005NNf-1EdG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:09:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1D3B44528;
	Tue,  8 Jul 2025 13:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C85FC4CEF0;
	Tue,  8 Jul 2025 13:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751980175;
	bh=i5ac9SChtjYkBpXeaatwHMA+NmCyW2sXFAgtd2zGcUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7o/2fjhz3surBgptJZ8IyeOiv/khPg3mb5gcPOv1WTbX1EO1DpQljuOxuo3tNtpM
	 RJCMjp1saMRV0LOXlp9LzOFOEtsB8BdIJsEXDHF/8Wxk6ZNaGWhWQUR4EMZD0ritIp
	 mRz7UVDDbOF3JBgrJiGzzdUFVGxv77hYC0ysVbYea3XP2egK71fFrtNmN/+4EHVz9y
	 SQY5KshavR8U+YxM0zQ7qSXjUT/IDROn8ujWrovAlwnRoOpMKuulCuYJsnTefVxEg0
	 4Rzl+uJw9WUd6USITKzkp+x7sszSUiDLIMOqqd/jCP7PmwRgkyr3JtsOnX9xqZ977a
	 HWzZG8Gq88F5g==
Date: Tue, 8 Jul 2025 14:09:31 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() when releasing
 task_struct
Message-ID: <aG0YizySqTc475JW@willie-the-truck>
References: <20250625-arm64-gcs-release-task-v1-1-54cbdc2db416@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-arm64-gcs-release-task-v1-1-54cbdc2db416@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_060936_351781_34042391 
X-CRM114-Status: GOOD (  17.73  )
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

On Wed, Jun 25, 2025 at 07:56:34PM +0100, Mark Brown wrote:
> Currently we call gcs_free() when releasing task_struct but this is
> redundant, it attempts to deallocate any kernel managed userspace GCS
> which should no longer be relevant and resets values in the struct we're
> in the process of freeing.
> 
> By the time arch_release_task_struct() is called the mm will have been
> disassociated from the task so the check for a mm in gcs_free() will
> always be false, for threads that are exiting leaving the mm active
> deactivate_mm() will have been called previously and freed any kernel
> managed GCS.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kernel/process.c | 1 -
>  1 file changed, 1 deletion(-)

Thanks, but please can you also update/remove the stale comment in
gcs_free() which refers to exit_thread() for some reason?

Cheers,

Will

