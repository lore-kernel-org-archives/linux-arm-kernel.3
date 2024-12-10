Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DF7E77183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 23:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbsUv2uSUD6IdLlUiwGe9UBfCIFkso55xH3tnUJICTk=; b=LEw5zNqEbskDMIYU2elGEp1423
	b6wdX1y52I2/pWVi8uty63mGOXNLMhPDNY+86FDfSYq4xaAg6P/b9QqWJ9WgC43SK67wtWnCM/Obr
	tnelRE8vQkt9QH6HbfGLideSHwucjE0peen6JlKqYQE+jNo/WAH/4DYG2XxiwN2RJBZQILMVEjrhg
	YbUdGC1PCBUsDpSrgk2g4yPUpA2sufx3VFZBP0KEGqSXVMq//iIqst5Dc0Yw6YDRmi/m4X2CJjzKq
	6CvBMn6nIxezQMp0u5M8/ZuOrRK/hjEywK4snnTrIX8vGd04ts9GbnI1zLobBx2GrY1rigOWTtBqO
	qrazvDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9VI-0000000D8pb-2Psl;
	Tue, 10 Dec 2024 23:18:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9M5-0000000D75K-3kLU;
	Tue, 10 Dec 2024 23:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WbsUv2uSUD6IdLlUiwGe9UBfCIFkso55xH3tnUJICTk=; b=qnbA+GWZqDmQmtnEbp1wOfXfHH
	pcMnTWVPMbmvNcTfsE2f5MuCJ3dgfqz+B8U379AMx4Y20MfXo1GMEY8LN5qpWX4C4kPOy+WZimTvW
	MtvfBXRoXlIQYZ0p1y/81CD4wwrDty/fKRZ9a7DBkU1tQov4BN1UpkDzaxwJWogNK3Y+38mjFvqMw
	VYVeyXC//lnGcdzqCkxOwGIkjrR/u9krKlx25+tt2O4IBqAIX+E5NDDJF9ZXW6oAwo635lLwxUXnT
	J8lNtS5ohd7eTI3XB+5kJIU6NpITTL+9VqA++HW78eN1x0G1xrb/konDNe4q9inch0FALGCg0lgmw
	JW35Zeng==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tL9Lu-0007Hr-QO; Wed, 11 Dec 2024 00:09:14 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v5 04/18] drm/rockchip: vop2: Fix the windows switch between
 different layers
Date: Wed, 11 Dec 2024 00:09:13 +0100
Message-ID: <5109751.mvXUDI8C0e@phil>
In-Reply-To: <20241209122943.2781431-8-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241209122943.2781431-8-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_150925_956679_84B8A2CF 
X-CRM114-Status: GOOD (  17.25  )
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

Hi Andy,

Am Montag, 9. Dezember 2024, 13:29:17 CET schrieb Andy Yan:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Every layer of vop2 should bind a window, and we also need to make
> sure that this window is not used by other layer.
> 
> 0x5 is a reserved layer sel value on rk3568, but it will select
> Cluster3 on rk3588, configure unused layers to 0x5  will lead
> alpha blending error on rk3588.
> 
> When we bind a window from layerM to layerN, we move the old window
> on layerN to layerM.
> 
> Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> Tested-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

> +		/*
> +		 * Find the win bind to this layer in old state
> +		 */
> +		for (i = 0; i < vop2->data->win_size; i++) {
> +			old_win = &vop2->win[i];
> +			layer_sel_id = (layer_sel >> (4 * (plane->state->normalized_zpos + ofs))) & 0xf;

checkpatch is unhappy about the length of this line (104 characters).
Could you please restructure it (helper var or line break)
so that it gets below the 100 character mark please?

Thanks a lot
Heiko



