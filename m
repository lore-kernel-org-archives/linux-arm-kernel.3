Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2C3C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWUtcKBPNVdQnOWaiojxu58DcR5uB4/S6pjUi9rDujw=; b=gk2Ovqb640jLiIgqZklbmxpd5p
	2XQnPjgH48PynLcTgzBDKqFgjJ3+uQw+x1BClQNhR/D89Dls2SvWkym+RKizK2obuOAoZrAD1mu0u
	B7A5/YuXua226QrW79Mqj0DRCXT2k/N5iiC73j2RlufJAqtJW2zBJK3sN2Y9ZFITvgKgiJAWYHW6F
	S1uODQkd6AiYPMayKHFIkt0axYAaDYtch2cNkUxgftRWtyiqD1Ph98ZB+6luDzfqKC0IuC/GOEw+K
	El6un4MLe+VIj3QoVlqvlCcgTwkph+k1a6CXREMoChlcooIIITbDLSHc66qVQ7qy7eZYNdUpa+l1Z
	OJeERKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fv9-0000000EeIK-1bcM;
	Thu, 10 Sep 2026 14:38:35 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fv5-0000000EeGk-22AV;
	Thu, 10 Sep 2026 14:38:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789051100; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Qnf8yRtyLC1CPTVHqwV+O9vsI9sHTAhEly69ol4cCicYUhwKeHbcwwtTkyth7AI7dlS9REoXDNcqG2mE2wfLn6J+FbEiKtYpe81xAZfTCRoUuHcQB+qqwRVUKi1aK+MU4cndw8wdd3FX+fegVnn1vhOXXCjn4MVP1gDz3qTDuQg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789051100; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DWUtcKBPNVdQnOWaiojxu58DcR5uB4/S6pjUi9rDujw=; 
	b=XTq6tIYGcrIKXqel+PrtmNfisk0SnqeuPi9yY5XIR5a5ngjISPlaVBYmBgYPjIsCHFIh6sXHs2KYpo29HvvUGgoqGKq6bYsJKmyorU5SS9mansGWN4Nv/XdRJelO4iR0VVo8R86tx5Q2atgSmRpSbbgaQ1uDFBGqyziIjESrnmQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789051100;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=DWUtcKBPNVdQnOWaiojxu58DcR5uB4/S6pjUi9rDujw=;
	b=P/rruDHS/3M0kGTk8lsEn92lzuZJYLczyhVrA9gS+eEafEjgy8NKkCt/sdLgPyRh
	kcqbjiW8ZURoi4nuogVHxx2r6oCTOwcEPrum1B2RcYiHP4Tg9VsZgPMZ8ls6OqyRUKA
	bVqTmXog1nsNSRcceJ1/EHh/HpyYLRtPemJtsvVY=
Received: by mx.zohomail.com with SMTPS id 1789051098268291.1074430247711;
	Thu, 10 Sep 2026 07:38:18 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, Christopher Healy <healych@amazon.com>,
 Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH v3 0/5] media: Add fdinfo support for v4l2 drivers
Date: Thu, 10 Sep 2026 10:38:15 -0400
Message-ID: <xIs2E_YWS3GdsCX4z2DR3Q@collabora.com>
In-Reply-To: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
References: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_073831_586306_CD7E54FC 
X-CRM114-Status: GOOD (  28.68  )
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

Hello !

Do you have any comment on this ?

Regards,
Detlev

On Monday, 6 July 2026 09:42:17 EDT Detlev Casanova wrote:
> fdinfo is useful to poll information from the driver.
> Unlike the ftrace interface, it lets userspace tools get a snapshot of
> the state of the driver at their own pace, instead of getting events for
> each driver status change.
> 
> This works better to get information like HW usage time or clock
> frequencies, as well as memory usage.
> This patch set focuses on mem2mem drivers that are per-frame based and
> an implementation is proposed for the Verisilicon Hantro and Rockchip
> rkvdec drivers, limited to main clock frequency and HW usage time, as
> well as HW cycles counting in Hantro.
> 
> Even though it is not used yet, per core fields are appended with
> `-<core_id>` to support multi-core drivers.
> 
> To ease support in drivers, a v4l2_metrics struct is added.
> It stores metrics information and provides helper functions to write
> the fdinfo file in a standard way.
> 
> An example of usage of this from userspace is implemented in v4l2top:
> 
> https://github.com/cazou/v4l2top (Check the upstream branch)
> 
> checkpatch.pl warning: The 2 arguments in the show_fdinfo callback
> definition are kept unnamed to match with the rest of the struct
> definition.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> Changes in v3:
> - Rename the fdinfo key prefix from "media-" to "v4l2-", and "stats" to
>   "metrics"
> - Restructure the documentation to have mandatory and optional keys
> - Add core ID to fields
> - Add HW cycles count support
> - Add ABI documentation
> - Link to v2:
> https://patch.msgid.link/20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabo
> ra.com
> 
> Changes in v2:
> - Simplify key/value pairs by removing repeated <eng> suffix
> - Add media type support
> - Add v4l2_stats helpers
> - Add support in rkvdec too
> - Link to v1:
> https://patch.msgid.link/20260612-v4l2-add-fdinfo-v1-0-723211abc861@collabo
> ra.com
> 
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Detlev Casanova <detlev.casanova@collabora.com>
> To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> To: Heiko Stuebner <heiko@sntech.de>
> Cc: kernel@collabora.com
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> 
> ---
> Christopher Healy (2):
>       docs: media: add documentation for V4L2 driver usage metrics
>       media: hantro: Add per-context fdinfo usage metrics
> 
> Detlev Casanova (3):
>       media: v4l2: Add callback for show_fdinfo
>       media: v4l2-core: Add v4l2-metrics interface
>       media: rkvdec: Add per-context fdinfo usage metrics
> 
>  Documentation/ABI/testing/procfs-fdinfo-v4l2       | 129
> +++++++++++++++++++ .../userspace-api/media/drivers/index.rst          |  
> 1 +
>  .../media/drivers/v4l2-usage-metrics.rst           | 137
> +++++++++++++++++++++ drivers/media/platform/rockchip/rkvdec/rkvdec.c    | 
> 19 +++
>  drivers/media/platform/rockchip/rkvdec/rkvdec.h    |   1 +
>  drivers/media/platform/verisilicon/hantro.h        |   3 +
>  drivers/media/platform/verisilicon/hantro_drv.c    |  19 +++
>  drivers/media/platform/verisilicon/hantro_hw.h     |   1 +
>  .../platform/verisilicon/rockchip_vpu981_regs.h    |   1 +
>  .../media/platform/verisilicon/rockchip_vpu_hw.c   |   6 +
>  drivers/media/v4l2-core/Makefile                   |   2 +-
>  drivers/media/v4l2-core/v4l2-dev.c                 |  12 ++
>  drivers/media/v4l2-core/v4l2-fh.c                  |   3 +
>  drivers/media/v4l2-core/v4l2-metrics.c             |  78 ++++++++++++
>  include/media/v4l2-dev.h                           |   1 +
>  include/media/v4l2-fh.h                            |   2 +
>  include/media/v4l2-metrics.h                       |  47 +++++++
>  17 files changed, 461 insertions(+), 1 deletion(-)
> ---
> base-commit: 3c587e0b08bd3c4853a22792b9166b7457870165
> change-id: 20260610-v4l2-add-fdinfo-a790fceab329
> 
> Best regards,
> --
> Detlev Casanova <detlev.casanova@collabora.com>
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip





