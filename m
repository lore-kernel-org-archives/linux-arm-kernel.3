Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30C2E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 15:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDt2nU/HCGuLKi4YQDj2IaYM1PBWLEa/ggxeMOrlmyU=; b=uc59vUolsdXTXr1JRcnpfnKwVo
	B468yRvmNwzTsk1jbjRn2be5yIZ11FtEFc+Q+dZmhdI+mfzbJ5NeTmmumCWMhFScxc4YBpEBcNAjP
	p88vies3bPjy5avCFhvB4SiJaGCJnwAwJZPG3UJCsfGP3EkTdYh849dyVbzNciSujxRYLNZO5bROI
	QPo/pKrJYqrwdCwkFE2jH4a3tGQwPrTtZC1zPubMfqOxLp6sttK1YvJGPBaRwtMhSVy7FDFLP6tSi
	MdvHjhMRI/73ZrZdwx2TPrYg3+UEwjrsm9h8Q7EwelaCv7Iv753E0N+gw7jAastyzzbJNxWl1o19v
	gGwLQm/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZt3k-00000002qzD-1xZ3;
	Sun, 28 Dec 2025 15:51:56 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZt3d-00000002qxU-33sZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 15:51:51 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59b30275e69so3347019e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 07:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766937108; x=1767541908; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xDt2nU/HCGuLKi4YQDj2IaYM1PBWLEa/ggxeMOrlmyU=;
        b=mpQd7Nq5xhHJK7UHIgdzKplHphklsZut/MXZ+umW53pA64cO30K9Mj046miM+n+1Tw
         RY5JIJNWAuJIj2CJBT8GGlAua6b2rIdTNMVbGA3LTEZetQN5hVmhHsxDdmy6GbhNbwrw
         bBiVe4jMsaw0BLgsvuE6Y+EFJEtjJgNlhYBgruAGAMQUfS14dj/SnqeIC2lOH9iwINFj
         Xu59eLPQXuypbEx/eLYJmkwUhXptuCsKa0Et8GxYt5aGx/IjbdljkFkHy81xxEA27VsC
         Sbj+ixdVN1GPNO0NIq1qD0wks3pIm7z7gT1cDQwEkOzfKF9UC29kVjRz+D20C0UvN10E
         i61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766937108; x=1767541908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDt2nU/HCGuLKi4YQDj2IaYM1PBWLEa/ggxeMOrlmyU=;
        b=eCxso9qbw4PV3vaitmdnVosZbK8UeaUx/pWr8iD5KS1Xpa1tZJq6x+eGkB9tbA4Ix9
         oOvfavsMzjJc79cNO1i10etrRdJZVKSdGLAh3LMd0DTJ4hoQzEy54T3atfmWCt/U3SfB
         KHNR3kaq26bzsnNlkGFbiLH2jj7jqfn+LiyckjrTJUK9gL0aohGQz2JWKRh5lpin87aB
         U1tFalXHwi/4bobj5KbDOtTtaVfo+2In1o2EIuW7lwXA1LLL5suWBPKAHOBwY7M0PwLp
         M+lEK6Yg2Js04yiOy8zeqckHcEaPy9ZdoytRFvVpwZ8EMgkmj3EVKiGLvm41hQZne+Ck
         upfw==
X-Forwarded-Encrypted: i=1; AJvYcCVERbREbY3EHxHe6CqVLTVqsAcNXBlgQxWQMBX5QXws5yBMEEMvyh2C7KlSYCN8ajvhYvBDTwGTnIks1yviyTeP@lists.infradead.org
X-Gm-Message-State: AOJu0YxFpGqJvVnrUp9hCKZqpdWhNIGrCbDe/eDJHVqxCFG03MYvrPu+
	HBWS3sWKrp1tfwCM7jBJpyWS3otK/Ly6/Hg1ea4K0Mrt/T7VPtsDAKSFFSVSgE/w3o1m6CbIBfn
	IfWHCCipluQRhVEEEy8rOk6Grwc/Z6lcjymwUd2IdeQ==
X-Gm-Gg: AY/fxX6mPpR6/GqSvs+zVNZI6wwveLghGLtkSPw9jP0iQseUNPMhxvy1RXxxx9AAhGA
	GIrb9fOSdavbFBQEESRfgNjm6jGl7mTUWvHYcu9PyU1Cahs9zWH2N7uCYP/d2g6dNOSS6yq2LSa
	A5J95t1qXZzuOlYY9egCOD8eJDMAvmeXP3ZOLSQoBgH3mZMVPAzys5VeoE75CYOvYcA2yq4xGDM
	w01oehgD7QMBCPCO/971RIbUPA4lh6WWUddm2Gz8sxK4U5/xFv+okXEZ1tkucupsJMH+yCC9++1
	nlHHEZ4=
X-Google-Smtp-Source: AGHT+IGU1N8QBbdq+8B2sBGxa7sL3yjutJLHsa+eD4d/4O/IOXbvlkTxqF+kvhbF6vdkbcVRxjuHnPzltz+HFIkKUD8=
X-Received: by 2002:a05:6512:124f:b0:599:105a:67ce with SMTP id
 2adb3069b0e04-59a17d727c3mr8952951e87.9.1766937107517; Sun, 28 Dec 2025
 07:51:47 -0800 (PST)
MIME-Version: 1.0
References: <20251128041722.3540037-1-macpaul.lin@mediatek.com>
In-Reply-To: <20251128041722.3540037-1-macpaul.lin@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sun, 28 Dec 2025 16:51:11 +0100
X-Gm-Features: AQt7F2rKehWvSimlxiGz9Dfw_4j8BvE8_7xLSPYZyFy88f7zjPyzLM7SIUxe60A
Message-ID: <CAPDyKFranQ=UU5waLcw27E4SG30bps80DmGs+zZs6N9=iZa_zg@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: mtk-pm-domains: improve spinlock recursion
 fix in probe with correcting reference count
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Weiyi Lu <Weiyi.Lu@mediatek.com>, Jian Hui Lee <jianhui.lee@canonical.com>, 
	Irving-CH Lin <Irving-CH.Lin@mediatek.com>, conor@kernel.org, krzk@kernel.org, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Ramax Lo <ramax.lo@mediatek.com>, 
	Macpaul Lin <macpaul@gmail.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, Stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_075149_856343_1759945E 
X-CRM114-Status: GOOD (  19.37  )
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

On Fri, 28 Nov 2025 at 05:17, Macpaul Lin <macpaul.lin@mediatek.com> wrote:
>
> Remove scpsys_get_legacy_regmap(), replacing its usage with
> of_find_node_with_property().  Explicitly call of_node_get(np) before each
> of_find_node_with_property() to maintain correct node reference counting.
>
> The of_find_node_with_property() function "consumes" its input by calling
> of_node_put() internally, whether or not it finds a match.
> Currently, dev->of_node (np) is passed multiple times in sequence without
> incrementing its reference count, causing it to be decremented multiple times
> and risking early memory release.
>
> Adding of_node_get(np) before each call balances the reference count,
> preventing premature node release.
>
> Fixes: c1bac49fe91f ("pmdomains: mtk-pm-domains: Fix spinlock recursion in probe")
> Cc: Stable@vger.kernel.org
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Tested-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Applied for fixes, thanks!

Kind regards
Uffe



> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
>
> Changes for v2:
>  - Rewording commit message.
>  - Add Fixes: and Tested-by: tag, thanks.
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index 80561d27f2b2..f64f24d520dd 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -984,18 +984,6 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys)
>         }
>  }
>
> -static struct device_node *scpsys_get_legacy_regmap(struct device_node *np, const char *pn)
> -{
> -       struct device_node *local_node;
> -
> -       for_each_child_of_node(np, local_node) {
> -               if (of_property_present(local_node, pn))
> -                       return local_node;
> -       }
> -
> -       return NULL;
> -}
> -
>  static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *scpsys)
>  {
>         const u8 bp_blocks[3] = {
> @@ -1017,7 +1005,8 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
>          * this makes it then possible to allocate the array of bus_prot
>          * regmaps and convert all to the new style handling.
>          */
> -       node = scpsys_get_legacy_regmap(np, "mediatek,infracfg");
> +       of_node_get(np);
> +       node = of_find_node_with_property(np, "mediatek,infracfg");
>         if (node) {
>                 regmap[0] = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg");
>                 of_node_put(node);
> @@ -1030,7 +1019,8 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
>                 regmap[0] = NULL;
>         }
>
> -       node = scpsys_get_legacy_regmap(np, "mediatek,smi");
> +       of_node_get(np);
> +       node = of_find_node_with_property(np, "mediatek,smi");
>         if (node) {
>                 smi_np = of_parse_phandle(node, "mediatek,smi", 0);
>                 of_node_put(node);
> @@ -1048,7 +1038,8 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
>                 regmap[1] = NULL;
>         }
>
> -       node = scpsys_get_legacy_regmap(np, "mediatek,infracfg-nao");
> +       of_node_get(np);
> +       node = of_find_node_with_property(np, "mediatek,infracfg-nao");
>         if (node) {
>                 regmap[2] = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
>                 num_regmaps++;
> --
> 2.45.2
>

