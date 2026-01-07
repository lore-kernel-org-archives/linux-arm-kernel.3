Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FF0CFD622
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 12:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYCI4w9k8oi4dmTuKQYOx7KUNvsHa0y3t3MANYqfbcs=; b=VtQFH5PKoTx6H0mJ0Q6WDQavLk
	qICn+qN3HTYgBqrL6oQowU8d9n/7NPmrrHZB1zrh6n65p2DWmelGqAv1c+rYiD6arR7xODA7tDuTM
	ennMTJ2M4LrvVLvH6djPLMnkb1sS/zTdR6AJXvZiZAK5CWLqhUsGZPhTwpAJbiyXxivrvNZBjfCdm
	ngn7CpHtziaVnGl5lGLs/Sx6gRnaR1ixkYtSFJ2co4AsHMJb8anP0M6GSIHO1tA5sdrTmUIg19AUD
	jj4vIfN5ExONaDSt9R+8AO5B18udL2OUR5tFFC7CHg2I9YKecZN1tOZ4t0coS0eT+eXPSbRflPHYA
	nL/HnXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSa0-0000000Etwb-1UA5;
	Wed, 07 Jan 2026 12:24:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSZy-0000000Etvp-2HWK;
	Wed, 07 Jan 2026 12:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Cc:
	References:In-Reply-To:Subject:To:From:Date:Message-ID:Sender:Reply-To:
	MIME-Version:Content-Type:Content-ID:Content-Description;
	bh=kYCI4w9k8oi4dmTuKQYOx7KUNvsHa0y3t3MANYqfbcs=; b=iIcGFZbak8YUwJgS1juo3XnxBz
	3XVFnOcWIUHMZiRXyGnGRwjybh/BD3+E0lEtJYk3YKLQwHJiynv9bi5IImYMMjNFRb5cwjSaSiNLF
	NU4oYeOv3y5+VTGfAxQOxWu8fm1DW+/Qq2zxfE8hpKsNBfAOT16LxIn2RN1NS3PPChC18J1Ax9ivl
	D/2Lr1Gntt//K3BzPlDHRBSSAORWsc6TH/KRslfUnIO3XdYl/JMyYdDJsfaRKov7HogEIVm1PGZSL
	AeFiQ2x7oYzkbjNZpPGnZLZ0DGCZLotAG6781gzTzbE7JCZ8wlFuaO5wCqIUyAJXhWJlpx7xVSW1b
	IdXg6r4A==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSZu-0000000BIx4-3ZW0;
	Wed, 07 Jan 2026 12:23:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A454143392;
	Wed,  7 Jan 2026 12:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6F3C4CEF7;
	Wed,  7 Jan 2026 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767788631;
	bh=b8Etf9Ux2d/4mljHjahgtB9DZrTyWaQ9AiYmAkqWiiQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=IFJ5sp8fiVS99y8gOAM4iABccbY1d+5f1Mf0fJtCVx9tusrJ4qVgCssKPQL5h3i1I
	 c9Ac9h/h6V6DtuzySwROCCPfpp3BAAdyc9MK+8x/vVuVYF6yyAVJ1MlgniNkZzf8ax
	 fwFepEaKVZLDUhKgCZLH+vXV/qExuYvgBohl10UQVZAihqhUQqNpC2TQHdZN1Qo51P
	 HYp+EbzAG8SQ6YdrIRf2v9Oc+inbXg3aAUM77lr1SDmkiAdjp4Hdozzq0zhhIwZ+Vr
	 c5lIvP9fRJse7vzi8Qg/8IGTv5vdo5FDSbKZ7bFZph3AwUDH4cZgZWVhwYMg3jeWdR
	 I8sUlKhCJ8B5g==
Message-ID: <49d2e8155d4ab283053c79f08c3e5334@kernel.org>
Date: Wed, 07 Jan 2026 12:23:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 02/10] drm/vc4: hdmi: implement clear_infoframe
In-Reply-To: <20251224-limit-infoframes-2-v3-2-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-2-7fd3cacfefed@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, "Abhinav
 Kumar" <abhinav.kumar@linux.dev>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>, "Chen-Yu
 Tsai" <wens@kernel.org>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jessica Zhang" <jesszhan0024@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Rob Clark" <robin.clark@oss.qualcomm.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sean Paul" <sean@poorly.run>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_122355_036896_022E421A 
X-CRM114-Status: UNSURE (   4.66  )
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

On Wed, 24 Dec 2025 03:02:51 +0200, Dmitry Baryshkov wrote:
> Implement the clear_infoframe callback, disabling corresponding
> InfoFrame type.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

