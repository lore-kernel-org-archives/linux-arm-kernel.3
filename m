Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B72C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQQaX7dLiH9spYaOUwUq19F+SUoVy4mqeHG1ly59DKE=; b=b2GZSeOoP47B1qGzjxB/ZbPxXW
	eMizfbMUzOzb9cyHyq8cuzaly4rCPFm5lpIp1EZOtxhfN/dy4MDyD6qL8dOKLRz8dEwDxV87fdYfc
	dcrEmEXLSM9QT6bPX0xKzg8E89v0i4aPEL+16rH9j0dMFhn+lDyHApuZ0iNQRsnsqKQggi0aoNmAE
	ItFePz1b8xLI7oiRbeieYgHg8zNBqA2DxDok2gqQDVklOJNNM/SuSPeVo8VWfcol+eYqD/3nlxYss
	1HwhXHKfSe0AViqGRt5kD9JH8Sx3W2NpUY+3WgNylIOx4HXWv5HoVg/DcVzVviDm+P1M/N2SvgEi6
	lk+lU/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f8K-00000002Q23-2u74;
	Mon, 21 Sep 2026 14:36:40 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8f8I-00000002Q04-1igG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:36:39 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-67109935888so2888071d50.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001397; cv=none;
        d=google.com; s=arc-20260327;
        b=n0tSJshbNjwD4Mix0qckV0aEATpaF50au89Kg2CH5mzxWbFov4mfiPWC2aXBHXWMkv
         K818dHpe8N2wDACckOEa8vojN0MFzm0zxhgcZq/QVhQWcOUzXF5cYQNUwzFE90n9AofQ
         0F82w7uyg9P8japmStRSEVIumhrnqlMNiEkleEpmN1sJRCGM+bD2HrKZZcX7FVYMbENv
         3/canfynGhmAHMg1XViL5xmHyKN+RLrJwreAfMC61AvWHl/DceWArCnKXnzy9R/Jmz3C
         E6Qj6eyb2276raMm362TMjp+z9OPYCDsr9ZpXlXEaOgcPgoB43eKWjr4c/96bAJCmhg8
         nCoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UQQaX7dLiH9spYaOUwUq19F+SUoVy4mqeHG1ly59DKE=;
        fh=ZQX1rwcliA13R7oJo5NnvdOf+KIfRNoK7KV3wqSfr+c=;
        b=Vy9Jb5nG9DKIZatdrktATc/guPeGbaTfTUUx2O8Ayo7QUPAfp+aQ1eGfwVW7JXIs7v
         AdnguKOv2Ypzqrq//Bf6LxJHkz+/pyozzhCsiAubP3nHo5sU/kDu9zBqC8apE+AuY4vu
         annuLtVvafZLi7vK3+uxyi316wO5M/6C97lSETc4xSoizYlNpW303a/AiC3j3uUXM+sx
         Crp3JdAIYG1n1EsyObHItUrnRu0rSNTqPD80TgGzMdVoYkoUQwDwDlJQj2GMojdPmsyL
         5OtJydRWHWdqRD/nH3i6SrHkIxlBxtXoNoQUdE/cz0PSyuG/6Or/dmZnROz+yXAoLiDE
         i4Gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790001397; x=1790606197; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQQaX7dLiH9spYaOUwUq19F+SUoVy4mqeHG1ly59DKE=;
        b=spJfJhVahikKdYDpXnybtOnYnkG9Obc2IN5NskE6lg62Rqia5RtogAzJjwXUWzYdvZ
         ukVjCHcIBMMXOp5XBdiwYxDa0DocNysRd+ytf89/w1HWCsHgxzGdaWf5H4tSeyRnwFGy
         tfkg8xnlihkulZJzq9YOEcUHeymvtgWC+wmyxRNYG1YSUuHAfjEL4bezf4Z+2pKc0eL/
         du24bSsq6efo5HzOVByYqk5nW6AezgG22lNBpDp9Mo0KzdWfLhWfY+ylehQwq+1npOlA
         Stbw20f167TJb28yFWPawShobI1qT0CuI2ipEvcKJxuMzAnRCr5XFTh0QiO8aAUX+agw
         Eg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001397; x=1790606197;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UQQaX7dLiH9spYaOUwUq19F+SUoVy4mqeHG1ly59DKE=;
        b=2P8MK9G7o9j/zB/+MXiUGEpHz6jKNykXk+fgHxddspIxE4tbeAis3p6vh1ZDT08bmV
         5kujWZMPHSOJbPX11XeZuAORx4DT123GuP+5lm0p0tGISHIxvH40vAqnvNwIImGeoeNb
         uj/Mg2cptdn2eL+4+5/yd2XJ3/sx7GD8qVOLfum0aedztuIKjHeYMsFB1MbiKnpRJl9x
         JXklcB3tFOKLG7syZ1Jh82idAAk0ZliIEQdzBWQJ3tFgVZvyhaNlxX4G6GlpTgmXl3PK
         o3YR2X+mMb7CQ0y0l44FU89P1Wda9B1sNaINVlgiSLD+0Tu+jk6hr3PqznK8L4Pw64/l
         1S9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzoOYx7xUlTL18HTSqPe3HuvIEz4iI4mDYALfWyU6N16oKZDQUpoATucoAmnxCm0x/yYkCrmu7veLfMhbPTIine@lists.infradead.org
X-Gm-Message-State: AFuF++lY0m+OWOtzkd5b9SuKc0VwKZOBuwvUi9KN5Z6yZCqRPVPdEsFR
	+t+f+sRecz5fWwJJl8RBC0sMREI767aL4y3uF/51VYG67bIhMdPIHili0JdNWdk8ReJy9v6hDHg
	19mzNd2QamG3mjYVwgCCQ1cbqbTjzE8c=
X-Gm-Gg: AYBFou0arA4r8SiinR2czSLDyMFxOR7skbRNb7yyuZgyewFUhUt8gUmvDVM+WNR1/r7
	oe7SXo5e59wQgNcu3AJcbOTjY7bUxyl/r9SuC9ZnxPq81tIsIZQXq+mthX8OANjDLPg6fegIw/D
	doMA21S99i+ilx4E23wwAaVrt1Zr24HhaLdn1qvJX4txqeNHvBqqZJ/80sFD2Cerxbwh+KkCEok
	aJWZUt9o7kPaQmFAcBz6lIXPlyZplYDXLA3uf/bMvyAma4uBbXs5iaOmEadNFfhE5Qb98hnZser
	oAKGIkUK2gDQDTBACDdiTVg/IgsR/TmO54JzRT2DC/jrH+PDriskU5gR+A==
X-Received: by 2002:a05:690e:43cf:b0:66f:ac49:a27a with SMTP id
 956f58d0204a3-6717fc65521mr2383542d50.14.1790001396949; Mon, 21 Sep 2026
 07:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260916051618.2904439-1-lgs201920130244@gmail.com> <178962811102.1264013.13698060411191875408@gmail.com>
In-Reply-To: <178962811102.1264013.13698060411191875408@gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Mon, 21 Sep 2026 22:36:24 +0800
X-Gm-Features: AcwNN1VX0XaLkydRZySUPzjNak9mjroYac8VQM-fZ7BBkk7Judurvc9M8LXCNAM
Message-ID: <CANUHTR9Csn86KgVMTCBPBobAjg78-M3TR1VTz--yLyG74w6YbQ@mail.gmail.com>
Subject: Re: [PATCH] net: mediatek: fix PPE resource leak on remove
To: Wayen Yan <win847@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_073638_464219_7077B468 
X-CRM114-Status: GOOD (  24.98  )
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

Hi Wayen,

Thanks for the detailed review.

On Thu, 17 Sept 2026 at 14:55, Wayen Yan <win847@gmail.com> wrote:
>
> Hi Guangshuo,
>
> Thanks for the patch. Calling mtk_ppe_deinit() from the remove path is
> the right direction, since the probe error path already tears PPE down
> but the successful remove path currently does not.
>
> However, I think the cleanup is still incomplete.
>
> mtk_ppe_deinit() currently only destroys the per-PPE l2_flows
> rhashtable:
>
>     rhashtable_destroy(&eth->ppe[i]->l2_flows);
>
> This only destroys the hash table itself. It does not free any entries
> that may still be stored in it. In this driver, L2 offload entries are
> struct mtk_flow_entry objects allocated by mtk_flow_offload_replace()
> and inserted into eth->flow_table, and bridge/L2 entries are also
> indexed from ppe->l2_flows via mtk_foe_entry_commit_l2().
>
> There is also a lifetime mismatch for eth->flow_table:
> mtk_eth_offload_init() initializes it, but I do not see a matching
> destroy/free on the remove path.
>
> So I think remove should first drain the offload flow entries, using the
> same per-entry teardown as mtk_flow_offload_destroy():
>
>     mtk_foe_entry_clear(...)
>     mtk_wed_flow_remove(...) when needed
>     kfree(entry)
>
> and then destroy eth->flow_table and the per-PPE l2_flows tables.
> rhashtable_free_and_destroy() with a small callback would probably fit
> this better than plain rhashtable_destroy().
>
> While touching mtk_ppe_deinit(), it would also be better to use continue
> instead of return for missing PPE instances, so later PPE instances are
> not skipped.
>
> One more minor cleanup issue: mtk_ppe_debugfs_init() creates the ppe%d
> debugfs directory, but the PPE teardown path does not remove it.
>
> So I agree with the fix direction, but I think this should be respun as
> a complete PPE/offload cleanup rather than only adding mtk_ppe_deinit()
> to mtk_remove().
>
> Thanks,
> Wayen
>
Agreed. I'll extend the cleanup to drain eth->flow_table with
rhashtable_free_and_destroy(), using the same per-entry teardown as the
normal flow destroy path, then remove the PPE debugfs entries and destroy
the per-PPE l2_flows tables.

I'll also make mtk_ppe_deinit() continue past missing PPE instances and
send a v2 with these changes.

Thanks,
Guangshuo

