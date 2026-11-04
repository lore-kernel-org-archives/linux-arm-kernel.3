Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7C1606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qqF4k3zM;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTEEBTXH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x7na+hJXaQFri5minG/TsKB4aINthrdOp08XbAZdiBc=; b=qqF4k3zMHnZc1OvRgnSKPvZtxc
	Qwyjx8Qn7/in+n/yGcyxKskm2pd3IPv1IIgL2cv4aV+eQuYO3NRupOtX2VpX2t85/7iyGkNcpweM1
	90oADNcXdbMIVw68axsIOCIyngIFaYx/9bU5p1Mi6BT1AoDswYLjBhEJTYOCUcx6NitLxVF1eEsIV
	F+IXHiX/aE0bSdaAG07y4zynzQuPwM4nTi1fvkELjXNXKDjNAxa0hepgwGs0E/Rt9vs1pMTEm1yfZ
	LH4oByu1KIn5Kmob3Slm64WOBM/2L3yx+iy1YW9r7LYQuKR4DBBM+JL8v6ORsrSkRKDECuaWiR2Yx
	XAyGFK3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOV8W-00000004SwH-16QI;
	Wed, 04 Nov 2026 07:10:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOV8V-00000004Sw1-3pQ4;
	Wed, 04 Nov 2026 07:10:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47B5960DAE;
	Wed,  4 Nov 2026 07:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379121F0093A;
	Wed,  4 Nov 2026 07:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776219;
	bh=x7na+hJXaQFri5minG/TsKB4aINthrdOp08XbAZdiBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BTEEBTXHHLHVrMMWodEXltqfsl2JEb7Aq23EaFWR+QiJkP4DYFzPTOQhWqAKP/5Pb
	 zIsgyIUiNcOtM00r3oIHLg3RFf85n7wb2ptPDcunpgcUpJRrtXE89fWZnDXvlVbN7B
	 mZ7ZGHOaQLkdYeI3XT75PFbmaBdudsqn5Gje2gyiqEBpH9CTMrxnAZL1DEYVeNtRhj
	 tEVvqw9uT8tab7InG9WbJ8Chd3CheCOM8pPXtj/djLKkZf9sQcS8QYpkWrRVmm9Egg
	 oG4pf2cHIjONQ1t62IvzwJnvxUOxIWzFujV+rZaE/P2oC7kSeSVlkNEST4qnB1CDBq
	 sS6sAUZ5HUPVQ==
Date: Wed, 4 Nov 2026 08:10:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>, 
	David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, Andy Yan <andyshrk@163.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/rockchip: rgb: fix panel bridge reference leak on
 setup error
Message-ID: <20261104-daffy-advanced-booby-a51472@quoll>
References: <20261104024058.1508856-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104024058.1508856-1-vulab@iscas.ac.cn>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 04 Nov 2026 02:40:58 +0000, Wentao Liang wrote:
> rockchip_rgb_init() wraps the panel with drm_panel_bridge_add_typed(),
> which returns a counted reference on the panel's bridge. When
> drm_bridge_attach() or drm_bridge_connector_init() fails afterwards,
> the error path only cleans up the encoder, leaving that reference
> behind and leaking the bridge.
> 
> Release the bridge in the error path, just like rockchip_rgb_fini()
> does on the success path.
> 
> Fixes: b7797081ccfe ("drm/panel: embed a drm_bridge into every drm_panel")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/rockchip/rockchip_rgb.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Multiple things here:
1. Your team ignored completely previous feedback. Multiple times.

2. You use multiple identities with this email address, thus I doubt that we
   speak with an actual person.

3. Your bot does not even bother running checkpatch, right?

4. Nothing of this was reproduced nor tested.

5. Finally, the same feedback:
You sent multiple independent patches, to multiple independent
subsystems. The amount of these patches clearly suggest this was
AI generated and most likely not tested.

More importantly, you sent all this work without properly organizing
relevant patches into patchsets. This makes reviewing difficult
and might cause multiple reviewers to address the same issue.
Replying to the entire set is impossible and requires handling each
patch independently, instead of applying or discarding the set.
Maintainers also won't see the bigger picture of your work. Quite
worrying.

This is on the verge of hostile patch: bomb us with so many
contributions, we won't be able to handle them in efficient manner,
like responding ONCE to ask you to slow down.  Considering all this
is untested and LLM generated, I have even more doubts whether this
should be considered for review.

Please read kernel documentation BEFORE posting more work. It will
explain you how to identify subsystems, how to organize your work per
subsystem (so a patchset grouping multiple patches with a short cover
letter), how to document the issue discovery method and what was
or was not tested.

Best regards,
Krzysztof





