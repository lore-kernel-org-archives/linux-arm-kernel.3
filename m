Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F268606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qR+gG89Y;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q9hswSs9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hKwZwLISlyrZRoSYe8UqN4PmHGGlaU0ArAeEDXc/U8I=; b=qR+gG89YEzJP0JKck6M3ZIw4qB
	AJwoTXnRsAAqqvPi+rEJpJw7t0k94/66wGZ6ptdjX0QtlUmPf7U1GuhI4Bh2F0NhwUWNj26GTA8T8
	rhzcx2KWb9+ZhyH7XZye9ighR8cu/FgL79m9vpJA6zZVt4j1KeLY0qWSaWyaIl+NP2dpFrXVs4wFi
	VLbzf6n672jmj0U890gX9HpQ9QEbs4UNBlf7HwsxVfI1pqYx8aP5rcwEd6VPoOLM79Bc4oidhwFXV
	vi6ycfFzXV0kEo+mYqyAy8AtmQUxr8+ndCy00BtxKFBEqqc166UNw/x/hQ/ZBhdiULEgLqsYcauoE
	Ct3II0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOV8k-00000004T3K-2L4E;
	Wed, 04 Nov 2026 07:10:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOV8j-00000004T2n-32eV;
	Wed, 04 Nov 2026 07:10:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EA0D60AAB;
	Wed,  4 Nov 2026 07:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526B91F000C1;
	Wed,  4 Nov 2026 07:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793776232;
	bh=hKwZwLISlyrZRoSYe8UqN4PmHGGlaU0ArAeEDXc/U8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q9hswSs9fAm6Kf513ogva/n6h6XPf4VLLcCoKgUfFdBy64lp78UD1lVZj6M76LUfm
	 PssYbEp8JLXQ/2IOO6tSohW7inzGiSaVNW+zJYT/D8n1SNdf4WK8byHDKj0/rf2aT4
	 +TATT9gF0cIuDQPqFOmmqzM22w7TpCj/Aualk6dix/Kpc+EdDtLna5KhoMaHvgFQUv
	 kwiG2dlT/umvJtUrzrvFX+mrSbWVzva4YaHvp42UpJ8bIx16hUhZctGtYKacyr2tC5
	 mdGjYsGOxOAceNE7hvOKK2vJ/8oc+LL6qPAI4QIqep4zsxAaf5oUE5fH+JrqAdIqMM
	 9SNsphzhuNHyg==
Date: Wed, 4 Nov 2026 08:10:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Maxime Ripard <mripard@kernel.org>, Andy Yan <andyshrk@163.com>, 
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Sandy Huang <hjc@rock-chips.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: use the safe iterator when removing device
 links
Message-ID: <20261104-wombat-of-phenomenal-blizzard-93dcf0@quoll>
References: <20261104025346.1527550-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104025346.1527550-1-vulab@iscas.ac.cn>
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


On Wed, 04 Nov 2026 02:53:46 +0000, Wentao Liang wrote:
> rockchip_drm_match_remove() walks dev->links.consumers and calls
> device_link_del() for every entry.  That drops the link's reference and,
> once it reaches zero, __device_link_del() removes the link from the
> device link lists and schedules the release of the link object.
> 
> list_for_each_entry() still reads link->s_node after the loop body to
> find the next entry, so it accesses a link that has already been
> released.  Use list_for_each_entry_safe() so that the next entry is
> loaded before the current link is deleted.
> 
> Fixes: 7d4e981d41e3 ("drm/rockchip: Add device links for master and components")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
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





