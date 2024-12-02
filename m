Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F98D78303
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kI7vAHJP2xzXL2Ldf4Pd669MPbu2D6JPp+Ub1IliRd4=; b=1KOq5o51lnyuX5EJZMO+Kl2Emw
	sSmoL4ZscgL5U7EOUItRB8dmOZbL/g2yedG8em994CRs90X7LYSDaRI6DpaW6CkPpMOcV/rLNSSs2
	4pTrXAHhEpPmeRVE5OLMKUo7TDNqA0JZNWYKZe85WRtABOJ/U1Wie/XvQZ5AvPDaOsWPQJ6T9oOKC
	vFKNdo26ngExp75V459bF35cxa/ojLID6vBZHd1Bjig4IWaWxr8skE0LnnjIUt4JtkMxs881WMFzn
	Kt/s1Uy5XDwXXi48zhZw5lP1PRLpS3H5FnLLzuaunPS01ZhSqPqgcObFjfJ4VgEbT/rVT3nd8iBvi
	a2ELOEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3Xr-00000005hxz-0uuH;
	Mon, 02 Dec 2024 10:20:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3Wr-00000005hsB-47M5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 10:19:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90CA45C4BDF;
	Mon,  2 Dec 2024 10:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1B3C4CED1;
	Mon,  2 Dec 2024 10:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733134784;
	bh=0nLS4J9qXeFv/L92DDeQg9+azIKURqKYfy9mdnxjm3k=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=kmhsd5qNP8PjnFw7JW1cgOBNkW9mQLZPH4pXX5/8dwKvqwnJuyfirt1aqyztIlDdV
	 IH1fjkg7XyFypJst+r31tBHNAEr7/qTjDQF2oM/8PA2tPcxtUxuYqdYsN77yJxxDxE
	 D49bbL44XFfS1wbpfVfBn5YTyxG+t99wmK43EiWT1WvygzcP6G28C/zlIKWPnlzfCe
	 zAxLiPTwPN1zh6Klz9GCZ0auLZ+9TcEQ0RsSi8QLjmsaMREjCrwaybirjM8aDu7HJp
	 PiDC4e0R7txSroxQpjqcg7C7CBbHK/g+gMX1VhGs3ZGwVqMxES1G+5DNd4QBX8vEir
	 0VvpMFIv5dbLw==
Message-ID: <77545786331df8bfaf5fdcb309437358@kernel.org>
Date: Mon, 02 Dec 2024 10:19:41 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 00/10] drm/connector: add eld_mutex to protect
 connector->eld
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Alain Volmat" <alain.volmat@foss.st.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, "Alim Akhtar" <alim.akhtar@samsung.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Harry
 Wentland" <harry.wentland@amd.com>, "Inki Dae" <inki.dae@samsung.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Leo Li" <sunpeng.li@amd.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marijn Suijten" <marijn.suijten@somainline.org>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Phong LE" <ple@baylibre.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Rob
 Clark" <robdclark@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Rodrigo
 Siqueira" <Rodrigo.Siqueira@amd.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Sean
 Paul" <sean@poorly.run>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>, "Xinhui Pan" <Xinhui.Pan@amd.com>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_021946_069886_498011EE 
X-CRM114-Status: UNSURE (   7.21  )
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

On Sun, 1 Dec 2024 01:55:17 +0200, Dmitry Baryshkov wrote:
> The connector->eld is accessed by the .get_eld() callback. This access
> can collide with the drm_edid_to_eld() updating the data at the same
> time. Add drm_connector.eld_mutex to protect the data from concurrenct
> access.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

