Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DACC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 17:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLWXlp5fp1shTIcjuREf1LDdbeNLz9T5kczHBwu0iIg=; b=qNP5e+limUOEu/ehTJCQDW/1L7
	IKeN8Zcrj9G0zQwg5EOIuZmgkJ6Fjjf2WlPBiMyQhKuGhx/M964vXBB11veT0G4YrmMi1Ofa13CQn
	bOzHNWWeY7yqSe+lsV2uLfmOo1Q8pQCLKfv+D2QRHIfwkjXbdJzEEgXdjltLaWHwvPNmFNM38lZ1M
	rMMM70y3boyo9Iq1VHRznxE0mA9LF68xZ2pU+PhLA6p4ofLAbsZsdgDbXKhN9ww3E/uGDP6Y99lZK
	OXvMotaLmpQXZhqLBTVhYKlbcaMbqaARZHMjXD8e7XscT9VDLp0OxqFLkqCGf3LwkjJJRgjQRDgui
	y58vCbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjguK-0000000ClYg-0Ikh;
	Tue, 14 Jul 2026 17:27:00 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjguG-0000000ClXN-30J8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 17:26:58 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15bf399d3bso163355966b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 10:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784050013; cv=none;
        d=google.com; s=arc-20260327;
        b=gckWZO5M74lXjqVWRNWvOxMhn+vCmBqWnb05o6qNntAnRABgtGqcIvsAngxoD4Es6M
         o+H7y8aXg8nhB8j2Qb5kSq7FSSwcXPWQioYH6CPIgBnGQZhxMx3dw64ZBAd2Yai62784
         acrMlekMteMaZEK3hjIx25Zo1y1bPBNiLunZw9sa7TQnc7qr+pXtXMEV/LTtYf4rwLuz
         NnMpSLMWR21HwVIA5MNJpDG6e4s4kcO/Vv3yWcklsHbz1Ds/1vsGHsS1Z/C34ORLdl9V
         G9Y4FDrlaoeLDz0C//V20oyVKwWNloNNNDyIfSzDO2IiGKbhGGQHnDFSREHIeMPTxZT9
         KoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PLWXlp5fp1shTIcjuREf1LDdbeNLz9T5kczHBwu0iIg=;
        fh=brVK4umiJqXE+Dpm5hWl4LFKIlAQ90FmOpHfe8CjCbs=;
        b=UxAx/U/83pZmpkS1M5o1WLFkcMCOnbeLn6SjwbL+sx2PfaklQyHzdhRvxULxbCUh1C
         Kaop+/ako6Amhj/hQZrcP7u/J2hKSK3E1RgGDHbymDrvck7MXiAW3HZADiSV3lXUy8qF
         DB45swvGIC86Qc60msLekuOiOqhwI7e4miHVsY3aeBTVr7ZJxi6IvjPVdlhZ0nwUQcPn
         l12ZOk/hHEU4z2l5t4p2kaE7o3t+8loYlfHVKJjtR68XuAONlTBXIebMiAXfefYrdQDI
         tQ+SvVg+ZFphKedNDNn8qUdOQnEFTXcRYe8ScOt/OsBndnxzGkHQ95rPG5j3lK9fsl+a
         s9Dw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784050013; x=1784654813; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PLWXlp5fp1shTIcjuREf1LDdbeNLz9T5kczHBwu0iIg=;
        b=cqTmbD6oPel7i4dkJC2nEa4cGDFuWhiWl6UORsvlaHrLq5X+9IiJirHVFL3wWMuNLz
         h2JII7Q9UoQx6GPwDAnP+0oB0kdnJxouy1pCR9iwX+SMRHFkvT2WTrvzhAV0qWlGZAp4
         8Oswk/A84I05Tf431+EmPAG3SmKQ2BnUMIaXMPCPNv7NTfg62XvugxymKZahqYzMeXmV
         RP50TxmNuSirP8bfACeYoJmmSHkkIaBUy9YaGCgQTCpGmt/7xwtPk7OA4p4jxZnXA7h3
         Vnmeokfi1ZHVa4TdMZD2bzc5MVCgWfPYupM2RtJFbAyCBekY7MY3kJThMMuhPDsJLyua
         DbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784050013; x=1784654813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLWXlp5fp1shTIcjuREf1LDdbeNLz9T5kczHBwu0iIg=;
        b=qlOBaq4ezYs5sfZaaqaTsfVXDyf1lAbDJTLgq4IIX16oU4GM25dNXFupbcy3gT8ZFC
         4YPSnM2JNjPNRFCTootLIPJrftG7xz7kORJbhiY9l8GwX2GYkxvhwgWB3n06VsmKKx+V
         TcycF/AbVNbNasvAYFyRD9k9GgvlHZiiVOTqxBsdDOU9HwXQpfVbo0tCabnMhQr47PyD
         2PaiGx0fOaekyYc40fsxY+LrzDd0++7wdCmISA4BdLBv8a10a6OxbQx01m+HUO9SSPqX
         PoVFg4xT4w+qdPxtXfsQ5+Zc97fR4SmrE4f704NunHWrXzlc9J0b4JJ6dIZD0Bnnt3Ld
         YJ3g==
X-Forwarded-Encrypted: i=1; AHgh+Rrxv97TobBs2p+p3reqqNudIxnZXoGaUzqJ+PTDLnDkZ79d27G8eXN1WJ5R2fw1YsNouFgB+1AM5arcA89iV8pO@lists.infradead.org
X-Gm-Message-State: AOJu0YxGKlGQsKMFDDyUG06DIMh8uh/KIVn6/GPREI2pR/8iRP7ekYlx
	mg7PlERb4P3UB4JTVSbRp3lx03jCwIihJwzKTKR8O03A/ks/r4EuguMGCYiyw1hkmqQGtqJRzt8
	XkUnBHFjvjMg+oBgbAGxuC+nxiy4WK07y9EZ/v4GyGg==
X-Gm-Gg: AfdE7ckfgnDRo/vLGEBqkG6h0ZlpERkU+ZaNrm3leK8PCeDdHZg+0lFKs0L3hJZzC6A
	opmW/z2tP7Hg0GyTzXdDBs9N9mKxSMjRmPkLNRAtWA8GomGAeLcwpBp4alByGbfiX/Kyx9M5GOh
	z24Y2+yHbsHJ9TkN6XENeVYNtH1io8lz9w0BnNtAZiA+QNAO/iOeTWZkdmb0Qa4nWZ4YVDnouBM
	9LOGf+s8mzex3JP54zac9n/aeqxa/KGatindtxNKEC6LsJBNDabgwwX/0pgaDkr/pt4jflpwaHY
	KPk7MTViKVEiqZ38K9khv8NVH+o=
X-Received: by 2002:a17:907:7210:b0:c12:61c5:c141 with SMTP id
 a640c23a62f3a-c161ea21391mr577764066b.53.1784050013253; Tue, 14 Jul 2026
 10:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <MN0PR19MB609171877109E10553B5DB5EACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB609171877109E10553B5DB5EACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 14 Jul 2026 21:26:42 +0400
X-Gm-Features: AUfX_my4WyuEyYSRptLwrCR_TmeHbnjRc7E_6wyzD01sMWP4nnwK47T7aZfKKfg
Message-ID: <CAKTNdwFxW9aGk3Ux_DhCvhYcwUBEz=oEei+w=9Zo-78jgGtGWQ@mail.gmail.com>
Subject: Re: [PATCH] phy: rockchip: naneng-combphy: Set RK3576 USB3 SSC downward
To: Liu Changjie <liucj1228@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_102656_763800_14DFE10E 
X-CRM114-Status: GOOD (  16.45  )
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

On Tue, Jul 14, 2026 at 10:46=E2=80=AFAM Liu Changjie <liucj1228@outlook.co=
m> wrote:
>
> Program the RK3576 USB3 spread-spectrum direction to downward before
> applying the remaining PHY tuning. This matches the vendor BSP SSC
> direction and follows the existing RK3568 handling in this driver.
>
> Without this setting, a HIKSEMI MD202 (0bda:9210) repeatedly failed
> to accept a USB address on an RK3576 Taishan Pi 3M. With it, the same
> device enumerates at 5 Gbit/s and completes a 64 MiB read/write test.
>
> A separate 1 GiB stress test with this RTL9210-based enclosure still
> produced SuperSpeed resets and I/O timeouts. This change only addresses
> the initial link behavior and does not claim to fix sustained-I/O
> stability.
>
> Signed-off-by: Liu Changjie <liucj1228@outlook.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers=
/phy/rockchip/phy-rockchip-naneng-combphy.c
> index 2b0f152f5..324a0861e 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -1015,6 +1015,11 @@ static int rk3576_combphy_cfg(struct rockchip_comb=
phy_priv *priv)
>                 break;
>
>         case PHY_TYPE_USB3:
> +               /* Set SSC downward spread spectrum */
> +               val =3D FIELD_PREP(RK3568_PHYREG32_SSC_MASK, RK3568_PHYRE=
G32_SSC_DOWNWARD);
> +               rockchip_combphy_updatel(priv, RK3568_PHYREG32_SSC_MASK, =
val,
> +                                        RK3568_PHYREG32);
> +

This duplicates code which already exists in the
rk_combphy_common_cfg_ssc() helper function.

Could you please try if [1] fixes your use case?

[1] https://lore.kernel.org/linux-rockchip/20260714-naneng-ssc-fix-v1-1-1c4=
0a58061ae@flipper.net/

Best regards,
Alexey

