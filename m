Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EA7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 16:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4FZXV4gOB4t0fuVavrKgoPj2lv8582gyC52JUezK+g=; b=ufeREmrJZiijAzIqYUfraqfAJA
	z3ikiTxJEC0nesyRzOLzOVlVoNlnUjpk3/Kwps/ORYBEb8JxaJJ9mQqC08JFAKHYtUuy1sjaO3Zig
	tarJG9hSKeoXSPzsBLj9UgdBE7wjwfOdNC4PS94d6OW5ovRxpLqHIla4Meu+TzyIdKGxGs2n6v70t
	jBt44PVQTF9nWDz2JV5iGQ9pRuEo5Jk3PNie4UKzUFOMz38lK6bXmKGrZ0FsN7fwxraR/7xCR4KT/
	YrLyuDuuSuCiilk4aR2IkaO8mTtu7n3/QWaTfzvxa2ijVshRczs+vpjaUa9TuUCKSdtFvpbBoyY0u
	gwDfke8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrDa-00000002zTW-20O6;
	Thu, 09 Jul 2026 16:03:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whrDY-00000002zSz-0EDm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 16:03:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D05126A4;
	Thu,  9 Jul 2026 09:03:09 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 135E93F66F;
	Thu,  9 Jul 2026 09:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783612993; bh=N0FPojFXU0pApsxKjA1PK/ID5/1WXuMBs5arWXUUvQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwUl9usLcQddI2IzwBL69XkoXm9FRCR/3m0y3ujMpzKtgWru2cs8UDMVIssWrVPQU
	 JG2qjsqxCDsS/8xxdiEsS9gILRBqQkZ1ONfPMNskK9VX59capxh4Gyj7I8rry0cGuv
	 h8ai4NIhmyLq0K/FlfnlZMTxncnREZbvxw+fSdgU=
Date: Thu, 9 Jul 2026 17:03:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, ilkka@os.amperecomputing.com
Subject: Re: [PATCH 4/5] perf/arm-cmn: Add new filters
Message-ID: <20260709160310.GG1024232@e132581.arm.com>
References: <cover.1782830759.git.robin.murphy@arm.com>
 <5304caf0300992329742d22b746167b2f3e4174c.1782830759.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5304caf0300992329742d22b746167b2f3e4174c.1782830759.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_090316_148311_7AD3ACEB 
X-CRM114-Status: UNSURE (   8.52  )
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

On Tue, Jun 30, 2026 at 04:19:19PM +0100, Robin Murphy wrote:

[...]

> @@ -284,6 +286,9 @@ enum cmn_filter_select {
>  	SEL_CBUSY_SNTHROTTLE_SEL,
>  	SEL_HBT_LBT_SEL,
>  	SEL_SN_HOME_SEL,
> +	SEL_SNP_VC_SEL,
> +	SEL_ENHANCED_HBT_LBT_SEL,
> +	SEL_EVICT_STATE_SEL,
>  	SEL_MAX
>  };

Though SEL_SNP_VC_SEL/SEL_ENHANCED_HBT_LBT_SEL are not really used in
this patch, I understand this is preparing for new filters.

The secondary filter between SEL_EVICT_STATE_SEL and SEL_HBT_LBT_SEL
also looks good to me:

Reviewed-by: Leo Yan <leo.yan@arm.com>

