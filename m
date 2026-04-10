Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B29F459F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 16:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpxvvvMHwW5S8XFerq/zSXfHt58MP2iwELTOcvUXtTA=; b=hSkJ+0UVUTxvke+MgFDxWV67fN
	KoJS2HpuDd92tA6j63l1e/DxtkULiX9hySezN0mvq51QKjNhB7BFA8fp3PrHL06S0B8Yom/HbxhNu
	3oDeoBbLnkgSx+zQC2ms8AMujJxfXt6BEqLeUbO+ZsDvcpUi6Yu3GvXYfpGcXX69Hsu1c6RJWdkK8
	DpLEpovuDsGYH4KLreGWxHwdvfZtiZKvhZdmwtCkc19/DYflkOSsIl6pvAVobEvLppakuPCdvy0ao
	iZrok1RpLbd5Waou7/EdKY78TXUZBRW+25KIJUIWrN7ksKhbXtRFClfVH7FNXg5NoVx4EpN3ELI0D
	mGtdAC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF4w-0000000CZrc-1ICf;
	Fri, 10 Apr 2026 16:51:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBF4t-0000000CZqv-055G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 16:51:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5074647E0;
	Fri, 10 Apr 2026 09:51:23 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F97B3F632;
	Fri, 10 Apr 2026 09:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775839889; bh=qdVzseOvTWqCZ+np1uwpYSC5FbMzSZB0d74LiMoUtd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c2fTK+TazfaOYZ3jSTWmVNW1wplv3FpCrvaAgb28d29sxEmAgsCDF7OgHKd+mNjk/
	 tOqOVR2tuUKOd6vuV0hSpZs8nFu/BeCTDfno67+foQKUJRhDBmn/zkSAViUW4S5vXv
	 OxGBLhyLgX8VkyV7+mOOMMxDhbekccZTwjN1rZ3A=
Date: Fri, 10 Apr 2026 17:51:25 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Sami Mujawar <sami.mujawar@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, steven.price@arm.com,
	suzuki.poulose@arm.com, gshan@redhat.com,
	Jagdish Gediya <Jagdish.Gediya@arm.com>
Subject: Re: [PATCH 1/1] virt: arm-cca-guest: fix error check for
 RSI_INCOMPLETE
Message-ID: <adkqjW5HzEfg3CZq@e129823.arm.com>
References: <20260410163636.259443-1-sami.mujawar@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410163636.259443-1-sami.mujawar@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_095131_228558_1944682F 
X-CRM114-Status: GOOD (  20.24  )
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

Look good to me.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Fri, Apr 10, 2026 at 05:36:36PM +0100, Sami Mujawar wrote:
> The RSI interface can return RSI_INCOMPLETE when a report spans
> multiple granules. This is an expected condition and should not be
> treated as a fatal error.
>
> Currently, arm_cca_report_new() checks for `info.result != RSI_SUCCESS`
> and bails out, which incorrectly flags RSI_INCOMPLETE as a failure.
> Fix the check to only break out on results other than RSI_SUCCESS or
> RSI_INCOMPLETE.
>
> This ensures partial reports are handled correctly and avoids spurious
> -ENXIO errors when generating attestation reports.
>
> Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
> Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
> Reported-by: Jagdish Gediya <Jagdish.Gediya@arm.com>
> ---
>  drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> index 0c9ea24a200c..66d00b6ceb78 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> @@ -157,7 +157,8 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>  		} while (info.result == RSI_INCOMPLETE &&
>  			 info.offset < RSI_GRANULE_SIZE);
>
> -		if (info.result != RSI_SUCCESS) {
> +		/* Break out in case of failure */
> +		if (info.result != RSI_SUCCESS && info.result != RSI_INCOMPLETE) {
>  			ret = -ENXIO;
>  			token_size = 0;
>  			goto exit_free_granule_page;
> --
> SAMI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

--
Sincerely,
Yeoreum Yun

