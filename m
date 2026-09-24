Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C91EC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xajPQk8GjdXK5kaUdC9KQJ19YcliIXFOaF4kzScKofU=; b=cgB0LxlVAR/DVO0WPbN9R5nTcz
	MCG3EPos93LZ5u+0lGrXRZ59IcKWxk0GJY/LVpwCx0NxNZ16EY/iTK5WD2X+7vVUHOTToazmyrN/O
	1+7GLfKWNVYTnYIRxc0dpn/MrEkIFQTJ4nSiuWiak5swiGV4w5tSdLIT5810wtBF5jz75Zixr9GZy
	wkVPZRuTWfOwkF8cRoJUAZHTw7eGsCQAke6vvIZXMws+HpfreTfBrXtaIt9K+CFBQYIQ9FqXCUrI8
	rUdMNRlLOXWjWk6rFwcbJdU1hl+ZX9lpiAJk3fDVy5hNfPpkaORmkVXC0T5XFspd/r6wcj1qJ3Wsg
	SZAP42qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hO3-0000000ApXb-3QTl;
	Thu, 24 Sep 2026 11:13:11 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hNw-0000000ApTp-0oxR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:13:05 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so1100521a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 04:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790248383; x=1790853183; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xajPQk8GjdXK5kaUdC9KQJ19YcliIXFOaF4kzScKofU=;
        b=I31mE1xHemfCNvvkoioFQpqaS8YFHaKgPRwSEUD3k4ygtl1pGlL+gOvpc4iXPLYgLP
         rifR34wem0YS7ZtjvWgBbLlb+qn59IHBpC1kpAnyuqqhwTiwWeCHfHYiPtnKNCfxjyWw
         5WRBCIpU9sER9cA2sGHkq7Twep8IGe0CoTqUp7LgB7P+e8Df6iHtbDYpe80C1aaGpQbO
         MlI9Ei7wdLtk0SE6d7EQtNs/bBjv5Un4Nvk5jm5oTwUDpq7xplIMWRyQPpJxpSU1K/JD
         AsRkApRDdbq4yXKJSSKy1ygPWoWmDsADTVDQlyRxVgZ25ZymBNhBLqpmYQJcDwP8IbUR
         Bptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248383; x=1790853183;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xajPQk8GjdXK5kaUdC9KQJ19YcliIXFOaF4kzScKofU=;
        b=L09b7Rzzz1NH37lDACQxA5aBW9drfL6y6TVUsAsP7/ZBnNIMAgYinmoZsoxKSZB59/
         plZuFLIUICt0ko09buL0B5YYHKbaSiCYWEwvszCTJzpR9HMJAxC1xSJ/7t8+UXsPgp+3
         qKCUcZvZKH5uX/8wYoVTBBJUro8aAfiaeQHndBHUzpEfhQqfPcRHLRqvHH41kTbJ9hUR
         dTO0/NaDh6lEH2jtcyTJnp30xHFyg5ZUmcUfIgnvXxCs0PdoY6pehnrOYtBqHUlXzgxT
         FP+AUx8ATQ5oovqREEH6N2sTOCMTguFe3DHsJ4CTX+woJvG8dcIDq9dtRnfxBltXNNtV
         YKjw==
X-Forwarded-Encrypted: i=1; AKwUvBy7x+XOwtZiVH41XJtjoSImF9bFILZPpnaNOobRnKqLezzMoLhgu9/wGvNTZ1W6u4Ba5mxQwLGlKWF6oQb8zm1l@lists.infradead.org
X-Gm-Message-State: AFuF++lWtZIPxoQGxn+nbuGHN6TlKBT7AiHUmh9BgWZXIDNdTjcahor0
	Ms683knE4D1LDI2HBnxuiMjAc3VmA62NYxKp507DtCec70LeD8hKYu/n
X-Gm-Gg: AYBFou2WylswRMiEjyHlZ2wopBqtSkTfOJIqSgMVXjvHpOU9t+sLqw8n3sopcl2XU/m
	dls44G+AQbQ7gMVk1LivwY3o4KBkejw5CgdSyV/EsZCl6llrKNh8p2iuLotX/CjdYfFolzpZBAD
	PgFDmfeaRFCjaGJkZkWyWETON9MSGE70eUsiw9m/sMBtVh94J0RyAncaFvU2KQ+0ciJS2SVJsXz
	W3D762AH1AvQJMFJmivWGQjxUmN7vXVI+7Chu68pt6UtjSIx1/I93x1sVyvxNyipq8r3iQKKR2h
	B3UPZGIwKbFOYkMguMWcQcyYYiJL3ax3Ux+HUCeuRVFxwAABef3QVNH2a4bt4OA2Hs+s2qMV9B4
	h8K0O+J0R8ds9j0xoN1G+43Ztb5Xp1vuAVU+yU609+Fw9Doamn6Ke3PCBfijSpbLmBs3Ke2YU3m
	a6B8XQ8o+dvzZ2WJAtwOAYQfws9t/VXcE3LXCFpWkATN+ZM8XfWEZzfDHKlTQ8hp5y1HAzusK3Y
	DxWZOZWURPAvNb5fByxPfGkm5oVKoC71g==
X-Received: by 2002:a17:90b:314e:b0:39e:5ade:f9de with SMTP id 98e67ed59e1d1-3a098b431dbmr1903170a91.26.1790248378423;
        Thu, 24 Sep 2026 04:12:58 -0700 (PDT)
Received: from arch.localdomain (123202092053.ctinets.com. [123.202.92.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5dfsm4399478a91.3.2026.09.24.04.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:12:58 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: damon.ding@rock-chips.com
Cc: Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jerrysteve1101@gmail.com,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH RSEND] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Thu, 24 Sep 2026 19:12:49 +0800
Message-ID: <20260924111251.936444-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <a0754d11-d88b-4dda-972f-7c696a037bc2@rock-chips.com>
References: <a0754d11-d88b-4dda-972f-7c696a037bc2@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_041304_251225_F970FFA1 
X-CRM114-Status: GOOD (  31.71  )
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

> On 9/24/2026 11:24 AM, Damon Ding wrote:
> > Hi Jun,
> > 
> > On 9/24/2026 10:04 AM, Jun Yan wrote:
> >> The DP PHY is optional: the Rockchip RK3399 eDP controller (used as the
> >> internal eDP port) has no separate PHY device and relies on its built-in
> >> PHY, which is programmed directly through the GRF registers, so its DT
> >> node carries no "phys"/"phy-names" property.
> >>
> >> Requesting the PHY with devm_phy_get() therefore returns -ENODEV (or
> >> -ENOSYS when CONFIG_GENERIC_PHY is disabled) and the driver logs a
> >> misleading "no DP phy configured" error at probe time before falling back
> >> to a NULL phy.
> >>
> >> Use devm_phy_optional_get() instead, which returns NULL when the PHY is
> >> absent and otherwise behaves identically, and drop the manual -ENODEV/
> >> -ENOSYS handling. This also removes the spurious error message.
> >>
> >> Assisted-by: Claude:deepseek-v4-flash
> >> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> >> ---
> >>   .../gpu/drm/bridge/analogix/analogix_dp_core.c | 18 +++---------------
> >>   1 file changed, 3 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/ 
> >> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> index 18e76d1e78e1..28eb668d3e3f 100644
> >> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> >> @@ -1427,21 +1427,9 @@ analogix_dp_probe(struct device *dev, struct 
> >> analogix_dp_plat_data *plat_data)
> >>       if (ret)
> >>           return ERR_PTR(ret);
> >> -    dp->phy = devm_phy_get(dp->dev, "dp");
> >> -    if (IS_ERR(dp->phy)) {
> >> -        dev_err(dp->dev, "no DP phy configured\n");
> >> -        ret = PTR_ERR(dp->phy);
> >> -        if (ret) {
> >> -            /*
> >> -             * phy itself is not enabled, so we can move forward
> >> -             * assigning NULL to phy pointer.
> >> -             */
> >> -            if (ret == -ENOSYS || ret == -ENODEV)
> >> -                dp->phy = NULL;
> >> -            else
> >> -                return ERR_PTR(ret);
> >> -        }
> >> -    }
> > 
> > It should be better to add some comments here:
> > 
> > /*
> >   * Exynos5/RK3288/RK3399 use Analogix DP controller built-in PHY,
> >   * no separate PHY configuration is needed.
> >   */
> 
> Well, I think it should be fixed to:
> 
> /*
>   * RK3288/RK3399 use Analogix DP controller built-in PHY,
>   * no extra PHY configuration is required.
>   */
> 
> The Exynos5xxx case may be more complex.
> 

Thanks for the review. I will add the comments in the patch and send v2 soon.

> > 
> >> +    dp->phy = devm_phy_optional_get(dp->dev, "dp");
> >> +    if (IS_ERR(dp->phy))
> >> +        return ERR_CAST(dp->phy);
> >>       dp->clock = devm_clk_get(&pdev->dev, "dp");
> >>       if (IS_ERR(dp->clock)) {
> > 
> > With the comment added:
> > Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
> > 
> > Best regards,
> > Damon
> > 




