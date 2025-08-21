Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D867CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wGT35ACRJqeMBans5AxgJKwaQp7w8jXRanXd6Ne1bQ=; b=YvMgObZOm7JCYYiQZvZrU+gbGu
	oybtQkF5psADmME4HJt+qhQq2IZ9hMp81fFr3G86Kw3fD9eIeb4mjXQRRqftbeWHaX/tbkknPXWU4
	PWSb0ZCnnYfakn/ZdW44qRY9at4mRdjiqA2eI83h81fdd8aqcUsfR5VsZBHN422ScLcx+2t3+GKgd
	Cr7VVK1Iex0/9KwLt4yKeyJvIyQhHmApBTOK6uXXouDQsWm79FevrEeI6mE02XR1S7fUGzmxwh9Rz
	Jvc34a/AHBpdYkmkki15oZEk6j7OQp25ni5Gx3PWMF1kD/cN8CwWegsqEF3aSOoJjGc4KgnHQZ/I/
	5p3WCCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEJH-00000000tP8-0iwO;
	Thu, 21 Aug 2025 23:03:07 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up94L-0000000041G-3Et2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 17:27:23 +0000
Received: from hillosipuli.retiisi.eu (91-158-51-183.elisa-laajakaista.fi [91.158.51.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4c79HP5p9NzyT0;
	Thu, 21 Aug 2025 20:27:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1755797235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2wGT35ACRJqeMBans5AxgJKwaQp7w8jXRanXd6Ne1bQ=;
	b=JxaM6Dv/fZ9UGmi8CIeam1q+xqkRmkbdNQvPActPXC/F/ZJAfA1SANSNEef801sTCREpta
	YKtbu3aaab9QwC5GNPKJpISv8XZJIlpnDAD+XGUi0YyPn1luTNz7As5Kq0rLtf0XubLuUY
	r+WE9vmFIJCrSPtCDqz+sDqPSv2oS1g=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1755797235; a=rsa-sha256; cv=none;
	b=AAONFo51j+0I9vh1CUJfqDu6AUoQysbFgjHSUs5GTdaLwvJdkuZhQI/fiXC134ugRux76U
	SU7ZtRfOlaxIi8HmGOHAEPe/dIaLbBSBhG+V1V7ddsOMQpctXUcniOiVLOwMWpCz1IqyAl
	UBhYz3+7bKqfJ8TTw1LZ+yhl/vKPeUI=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1755797235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2wGT35ACRJqeMBans5AxgJKwaQp7w8jXRanXd6Ne1bQ=;
	b=RQKnfDy1jf2/IN5lvVEIE8Af/aGZg4F51igPJJc5QMJavnyyXHPwljquRXiiL6rRBo5jUL
	ahLh8L0Tz3KsRiGJbxlHr01Nvq0ycF+ofEgp7GNQB21CehYOExQdkgJpldETtYSmmoY3f7
	tq4GOx2hMLv8B+0pArLngQqbABCtlaM=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 2E407634C98;
	Thu, 21 Aug 2025 20:25:48 +0300 (EEST)
Date: Thu, 21 Aug 2025 17:25:48 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Cc: alain.volmat@foss.st.com, mchehab@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] media: v4l: Fix dereference before NULL check
Message-ID: <aKdWnKdSDs2j73F-@valkosipuli.retiisi.eu>
References: <20250818093159.612208-1-chandramohan.explore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818093159.612208-1-chandramohan.explore@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_102721_979290_159A0620 
X-CRM114-Status: GOOD (  19.93  )
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

Hi Chandra,

Please choose an appropriate subject on the next time, this is missing what
the patch is for -- see git log if in doubt.

On Mon, Aug 18, 2025 at 03:01:57PM +0530, Chandra Mohan Sundar wrote:
> In 'stm32_csi_start', 'csidev->s_subdev' is dereferenced directly while
> assigning a value to the 'src_pad'. However the same value is being
> checked against NULL at a later point of time indicating that there
> are chances that the value can be NULL.
> 
> Move the dereference after the NULL check.
> 
> Fixes: e7bad98c205d1 ("media: v4l: Convert the users of v4l2_get_link_freq to call it on a pad")

Fixes: requires Cc: stable. I've fixed these this time. See
Documentation/process/submitting-patches.rst .

> Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
> ---
>  drivers/media/platform/st/stm32/stm32-csi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
> index b69048144cc1..fd2b6dfbd44c 100644
> --- a/drivers/media/platform/st/stm32/stm32-csi.c
> +++ b/drivers/media/platform/st/stm32/stm32-csi.c
> @@ -443,8 +443,7 @@ static void stm32_csi_phy_reg_write(struct stm32_csi_dev *csidev,
>  static int stm32_csi_start(struct stm32_csi_dev *csidev,
>  			   struct v4l2_subdev_state *state)
>  {
> -	struct media_pad *src_pad =
> -		&csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
> +	struct media_pad *src_pad;
>  	const struct stm32_csi_mbps_phy_reg *phy_regs = NULL;
>  	struct v4l2_mbus_framefmt *sink_fmt;
>  	const struct stm32_csi_fmts *fmt;
> @@ -466,6 +465,7 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
>  	if (!csidev->s_subdev)
>  		return -EIO;
>  
> +	src_pad = &csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
>  	link_freq = v4l2_get_link_freq(src_pad,
>  				       fmt->bpp, 2 * csidev->num_lanes);
>  	if (link_freq < 0)

-- 
Regards,

Sakari Ailus

