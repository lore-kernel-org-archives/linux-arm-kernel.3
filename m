Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D3CC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 06:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUm8IylK3V7lcVuZn2ulYwmszlPFrNkvTKkjAabL9nQ=; b=4clrr9jSUHmV9vhk4lLv6s/DOC
	8NKMzDGu5W3ND8sQwkqkuu1mUbp70+ggLGx1NOXXewz2DVl/a91DMzXB18kuZdauc4VsWiEMhOU8e
	/mO/XQ+UEcRoZ+L14RbYWTYJ2pQoiPXwbm1VQLEovlFmd91USDaJhTG7OFsMYASCpupcdeqV+8ghh
	1ECxyk6JrGNqSeAY3Bz0AZdFaiyHGifWPvqKFckgGABtp3RB+lpu5FH4eZKCic1l9myCA/PXty4oJ
	HjOY1XVrF2cgqoWL6kb/Vgf9PHcf5EFbMgsxDdJBnoX/xZTHAu070pPTkNdQqNfbjqUT4BR3n7loy
	SSeD5yVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x761m-0000000AjAO-3cho;
	Thu, 17 Sep 2026 06:55:26 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x761k-0000000Aj8O-3J1u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 06:55:26 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc50bcf87b2so290546a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 23:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789628123; x=1790232923; darn=lists.infradead.org;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUm8IylK3V7lcVuZn2ulYwmszlPFrNkvTKkjAabL9nQ=;
        b=h0tYYA7jx01y+Usq1og4/cA8XT8HH0OUHslkRSP1h1QGndX1NjgTqRlyPGAnVReMRI
         C1aw7MpC8Q7ygitSzwtOuFI4sZzu/vDpMY6YWogV9r3Hd14XL9lDkLIbePySG6Ihi9dv
         K6ozY6eX4I+8XdDZAzGAeNimigqCxWLkGWPdz+nb7uQa4hxgcRfs7hsz1PuukUFYp/Xo
         pBxr4lPEgaJPX+iwvTibMJ2od2q/esnhO7+D+WWxoybcNTUrJWGTlAQSuOBGLo3H4xpf
         mfycc0WxV4DBS+bno90+yzhQuLl8H/tZbDeIQilTW+92kTQaJMdc6NxcUMyMySzcZSCV
         /VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628123; x=1790232923;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUm8IylK3V7lcVuZn2ulYwmszlPFrNkvTKkjAabL9nQ=;
        b=HpGqO8NhWNzoipg1s9AHl9yLUlnHRybxuuHDvAsfSSYf9yEjYEV3GAPE0BSoPAq68M
         awvWYHrxTbVdF+v8X3p4nUxKrtpjVloyqvk5XYXTOEA90Q111VEQlP2rxsnkxXiC/wgk
         jN0oF3cbA0ondD8JPWSRZh6VUfW9pATzitDFg7exxO0sCgIGHEOIya0ZhGiQFfoMcCiQ
         63n9GjUYkAYY8ZaPSGUYcBYaImmcP41SeHDb06UqP8kxQ1LiolmyrtwrsIdBBXSvL/SF
         xaLnDiSTiNqLmI5LM1NznR88izfZO6DgzMK7GSiYlalX39YoaLG2bsWWhj6ekE5ZMJSK
         V1Xg==
X-Forwarded-Encrypted: i=1; AKwUvBxXDUG9elfEuwOVbuxE0QlvsDhgugzdxRjIEFNt/t03xQBbuobrLGvWrpEcWU1KaT8YlhTS5clSRUReYs6BkQSF@lists.infradead.org
X-Gm-Message-State: AFuF++kHJh5g3ZCfw61ITphJjpBAYX+v+jw4LJ0rbBiPXm8e2kYWBUOD
	AJx51GHd5wgOLbnBjm3P19TBCf2FckVlPyzHlEcNdcPQQSMa6I2/BBNA
X-Gm-Gg: AYBFou3khRe5EduN/P+LqbvyxkLdB6mPr7RTF7IsFoy2pBNoR1MCvJcb76FmnW1HL0g
	DTykDBlbYisppYNV5UeoRaj1FalFOQ2zQZNrRnwz577UgSWtSSQqPeYTYdzhFIvmgshdyLzLNwO
	GJ2jgrxvrjB9mC3oPQsUA1l4yT4CUFvnWBDC336Y4wN6IJH6iNlNH6XbZNR8/wF64a+/W6St2r/
	XfI91viPt4IGkwPc2iNXyc6Z5esACN5GRzpYZieQWCm5hIBtPwYRjqVmgjofthjUQ4dC9bfv59K
	LwW9XwO6NS97bMxKl+tiE2rD/9RgM67qXFODfxhwfeDi+Lji8mp9E/KrDPtwLqZJHChTlr+lJC8
	K78uFTjEl4ZcBOZj2Bo1zK4qlOKiC+VVqSQgeRDydA0cvRHTLGD+gVSgy8mZEUlNjYdfevKyZOa
	JNn95cDQ/DQIbLFfPtC0cvS2tYr89pV6ET0FmHOzUG5wRaqgtQ6hmAjr6MsUOd4Ybu4TM0OpptJ
	2g=
X-Received: by 2002:a17:90b:4ece:b0:39d:ba21:fd90 with SMTP id 98e67ed59e1d1-39e1e491176mr18804302a91.16.1789628123381;
        Wed, 16 Sep 2026 23:55:23 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35def1f2sm3334653a91.5.2026.09.16.23.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:55:23 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: mediatek: fix PPE resource leak on remove
Date: Thu, 17 Sep 2026 14:55:11 +0800
Message-ID: <178962811102.1264013.13698060411191875408@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
In-Reply-To: <20260916051618.2904439-1-lgs201920130244@gmail.com>
References: <20260916051618.2904439-1-lgs201920130244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_235524_846402_44536BA5 
X-CRM114-Status: GOOD (  12.97  )
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

Hi Guangshuo,

Thanks for the patch. Calling mtk_ppe_deinit() from the remove path is
the right direction, since the probe error path already tears PPE down
but the successful remove path currently does not.

However, I think the cleanup is still incomplete.

mtk_ppe_deinit() currently only destroys the per-PPE l2_flows
rhashtable:

    rhashtable_destroy(&eth->ppe[i]->l2_flows);

This only destroys the hash table itself. It does not free any entries
that may still be stored in it. In this driver, L2 offload entries are
struct mtk_flow_entry objects allocated by mtk_flow_offload_replace()
and inserted into eth->flow_table, and bridge/L2 entries are also
indexed from ppe->l2_flows via mtk_foe_entry_commit_l2().

There is also a lifetime mismatch for eth->flow_table:
mtk_eth_offload_init() initializes it, but I do not see a matching
destroy/free on the remove path.

So I think remove should first drain the offload flow entries, using the
same per-entry teardown as mtk_flow_offload_destroy():

    mtk_foe_entry_clear(...)
    mtk_wed_flow_remove(...) when needed
    kfree(entry)

and then destroy eth->flow_table and the per-PPE l2_flows tables.
rhashtable_free_and_destroy() with a small callback would probably fit
this better than plain rhashtable_destroy().

While touching mtk_ppe_deinit(), it would also be better to use continue
instead of return for missing PPE instances, so later PPE instances are
not skipped.

One more minor cleanup issue: mtk_ppe_debugfs_init() creates the ppe%d
debugfs directory, but the PPE teardown path does not remove it.

So I agree with the fix direction, but I think this should be respun as
a complete PPE/offload cleanup rather than only adding mtk_ppe_deinit()
to mtk_remove().

Thanks,
Wayen


