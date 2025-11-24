Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715E3CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=II8YI3C/iUDdwVikJhgiudHAop3AyyPyPytzzAcj7uU=; b=L9wWSVeBkvZC2NMeIJIIksE1YX
	lVayPdqvNcGtoRFgJOI96uFUuGBLa1siALIpDueVrJvtwP7FSB5E91uXNcRpVSHpbv9Of83Ef8jU7
	ge3qWwR/2HRk6U2u05YBjfvmKEaYAQvWlVmMmwpMAddImxKKinYWGkou5rrw3V/7SNhEGbmkQpiam
	M/INaSu33QDPXcfWBUg1VSD51W3NhepFsnsYy9/Nt4v4HkY9OQX5UxhyZyCAUNIv46rcJFw0Y1RjP
	HuSTR7VjtEMv/t+lxDgtcT8dYfE9ZNIrEdUsQ807q/tzYyRmnIrjYcpdXNenjzJafhlC9P6HTioSx
	YIp6iwpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTdM-0000000BPWi-0SE8;
	Mon, 24 Nov 2025 10:17:24 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTdI-0000000BPV7-2eLt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 10:17:22 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-63fc6115d65so3240107d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 02:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763979438; x=1764584238; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=II8YI3C/iUDdwVikJhgiudHAop3AyyPyPytzzAcj7uU=;
        b=w0zU+LpWpfsywPWoR7KnHFqaUKzLlrl0uDxck9UorcL5Zp/UCfHhoQZmh8/vcMwbMx
         0Afxxcfqg5Bk9HX4bztaijFn69/MSu4TDnprFjtLkvdpyM2lHp/vd3/nVehdMyqQ+A1i
         RdIaNOGkvoDFwn5FC+1TeR5GOyF//O8m450/C8AXRceDBb6rObzURRd7H9id/p/B/xem
         sFeqURmLQ7vu3od6ss5z2t01g3beGJsn/sfTfLxUAHb5A1khScfnXQPwuAOFNP4IhdCN
         nMj75erivVHiuqUBGsAuY8zXhS2VRyZrzvlWuslVwzKxP8JAe5cltZj2ZYF7XoXi4TbJ
         W+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763979438; x=1764584238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=II8YI3C/iUDdwVikJhgiudHAop3AyyPyPytzzAcj7uU=;
        b=PisnwHpOIG7KndtgKt4UAEQMUZt4OWfmbo3qkzGytxuo/t/kZ3Kqki0a+1s0MeZIyl
         dtfz3usuTN2tnUDFkcvkVRGcpZ3GUtTZuZhyi8UOfyMlyK28AA/dRe2zjSX+BiKIR8la
         A4kuH/H5OBs3e9Ix24g9901P9qw4Y0mLEacmCnPOQevbw+qZ0CCP+jYlE45DYjVsmcJf
         kwqwPyy4zQufPXQ6PKFtczPqSCM5wtTnI6lwGy1RJsNrO1TddmVSmtLPHwDRdLNpb/PD
         e1CsWzESKEgifgcZZGVH1UQ0HTOOXXLRKh9WHGz+TCbYBJ/0zZeqzgpBoSb6+wlsIvr0
         k1kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnqnzM12sro68ZTRG7pT9RjL/l8UkhjFQpOIgw1rotTst190LRGgmsKgXwROKakzQLn38EclfqEaKsSfJHlbpS@lists.infradead.org
X-Gm-Message-State: AOJu0YyKUNOrGOTFpYK8atGBFeZwOkCq/k7D01IDgpld45LG8Eu8YZMh
	Bhh4AMx1VfKQ1P5vGyBI7vb7FNC9PzgNWRiE2HtwFhJZkrpCFgKG8nSIPURuy0Mox4XTB+r30Gu
	7O1WuprQ5JUJVxVpoOD7uJE9v5HYJ3dqFF5RoHegvvA==
X-Gm-Gg: ASbGnctpYDsX82tP8sND4bAhLAE+6omoNDxhsFhzRcvR93lsxyCbzkWlwIthQTomj+8
	0tiJtI9Y68y/cu+YkgBdZBsTQqMmKL1O6hBs3B2DrxrdGCLiwdDt/a0XUYxo7IT1tX6U0uSqC7s
	Qz+5NKm1hjhV3VgtyoyvHKM7oGp+7krv674+Q+DDIkXuBrAG/Etp2ccfpe7Kolt/Fr6oRlUPaHA
	zMifYR7iCvwD1zYueZm2bJ/OzKYTzf2V6Yjln3Kk6UR/XFyxSdC6+2gavMR9t/Oiya3ulz7
X-Google-Smtp-Source: AGHT+IHZKiPR/ZbuRZ0U59HQ+RscPzcZbVdRLvk9GoovnNcNednqmG4npANrIbRzWrLj9FeTBSnrW93KTr0acBSdJJU=
X-Received: by 2002:a05:690e:14c:b0:640:dead:f78 with SMTP id
 956f58d0204a3-64302acadefmr6058059d50.68.1763979437967; Mon, 24 Nov 2025
 02:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20251121125212.43093-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20251121125212.43093-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 24 Nov 2025 11:16:41 +0100
X-Gm-Features: AWmQ_bmRF82IjFCOc91DUmABpVXVUdYe_hVuYPuZC-41JJhfg_bW2drgqfzyHeg
Message-ID: <CAPDyKFp32GafgWBEn=PbVex1MXRo+nBFcVSgLxrqxMtLXnRFSA@mail.gmail.com>
Subject: Re: [PATCH - URGENT] pmdomains: mtk-pm-domains: Fix spinlock
 recursion in probe
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, nfraprado@collabora.com, 
	irving-ch.lin@mediatek.com, wenst@chromium.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, robh@kernel.org, krzk@kernel.org, 
	conor@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_021720_701256_E872A904 
X-CRM114-Status: GOOD (  38.01  )
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

On Fri, 21 Nov 2025 at 13:52, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> For some reason, of_find_node_with_property() is creating a spinlock
> recursion issue along with fwnode_count_parents(), and this issue
> is making all MediaTek boards unbootable.
>
> As of kernel v6.18-rc6, there are only three users of this function,
> one of which is this driver.
>
> Migrate away from of_find_node_with_property() by adding a local
> scpsys_get_legacy_regmap_node() function, which acts similarly to
> of_find_node_with_property(), and calling the former in place of
> the latter.
>
> This resolves the following spinlock recursion issue:
>
> [    1.773979] BUG: spinlock recursion on CPU#2, kworker/u24:1/60
> [    1.790485]  lock: devtree_lock+0x0/0x40, .magic: dead4ead, .owner: kworker/u24:1/60, .owner_cpu: 2
> [    1.791644] CPU: 2 UID: 0 PID: 60 Comm: kworker/u24:1 Tainted: G        W           6.18.0-rc6 #3 PREEMPT
> [    1.791649] Tainted: [W]=WARN
> [    1.791650] Hardware name: MediaTek Genio-510 EVK (DT)
> [    1.791653] Workqueue: events_unbound deferred_probe_work_func
> [    1.791658] Call trace:
> [    1.791659]  show_stack+0x18/0x30 (C)
> [    1.791664]  dump_stack_lvl+0x68/0x94
> [    1.791668]  dump_stack+0x18/0x24
> [    1.791672]  spin_dump+0x78/0x88
> [    1.791678]  do_raw_spin_lock+0x110/0x140
> [    1.791684]  _raw_spin_lock_irqsave+0x58/0x6c
> [    1.791690]  of_get_parent+0x28/0x74
> [    1.791694]  of_fwnode_get_parent+0x38/0x7c
> [    1.791700]  fwnode_count_parents+0x34/0xf0
> [    1.791705]  fwnode_full_name_string+0x28/0x120
> [    1.791710]  device_node_string+0x3e4/0x50c
> [    1.791715]  pointer+0x294/0x430
> [    1.791718]  vsnprintf+0x21c/0x5bc
> [    1.791722]  vprintk_store+0x108/0x47c
> [    1.791728]  vprintk_emit+0xc4/0x350
> [    1.791732]  vprintk_default+0x34/0x40
> [    1.791736]  vprintk+0x24/0x30
> [    1.791740]  _printk+0x60/0x8c
> [    1.791744]  of_node_release+0x154/0x194
> [    1.791749]  kobject_put+0xa0/0x120
> [    1.791753]  of_node_put+0x18/0x28
> [    1.791756]  of_find_node_with_property+0x74/0x100
> [    1.791761]  scpsys_probe+0x338/0x5e0
> [    1.791765]  platform_probe+0x5c/0xa4
> [    1.791770]  really_probe+0xbc/0x2ac
> [    1.791774]  __driver_probe_device+0x78/0x118
> [    1.791779]  driver_probe_device+0x3c/0x170
> [    1.791783]  __device_attach_driver+0xb8/0x150
> [    1.791788]  bus_for_each_drv+0x88/0xe8
> [    1.791792]  __device_attach+0x9c/0x1a0
> [    1.791796]  device_initial_probe+0x14/0x20
> [    1.791801]  bus_probe_device+0xa0/0xa4
> [    1.791805]  deferred_probe_work_func+0x88/0xd0
> [    1.791809]  process_one_work+0x1e8/0x448
> [    1.791813]  worker_thread+0x1ac/0x340
> [    1.791816]  kthread+0x138/0x220
> [    1.791821]  ret_from_fork+0x10/0x20
>
> Fixes: c29345fa5f66 ("pmdomain: mediatek: Refactor bus protection regmaps retrieval")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied this for fixes, thanks!

Yes, it seems like we may need some additional analysis/fix, but let's
look into that separately beyond this fix.

Kind regards
Uffe


> ---
>
> This might not be the best fix to perform, and I have Cc'ed Rob and
> Krzysztof for them to have a look at the spinlock recursion issue,
> as I think it either has to be fixed, or the affected function has
> to be removed (or both, actually - in any case, if not fixed, this
> could backfire, and I'm not sure that the only function that shows
> this issue is just only of_find_node_with_property() or if others
> also do; at least, nothing else on MediaTek machines as of now).
>
> Counting that this makes *all* MediaTek machines to be unbootable,
> I'd prefer this fix to get merged immediately - so that it lands
> in v6.18 (which is at rc6 at the time of writing).
>
> That - because I think that resolving the source of this issue will
> take a bit of time and research - and I really don't want the LTS
> kernel to be broken on all MediaTek devices.
>
> Note: When I initially tested the commit pointed out in the Fixes
> tag, it was working with no spinlock recursion - I don't clearly
> remember what kernel version was that, but I think it was some
> linux-next around v6.16 or v6.17.
>
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index 407b4a7aba10..721224c89865 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -1006,6 +1006,18 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys)
>         }
>  }
>
> +static struct device_node *scpsys_get_legacy_regmap(struct device_node *np, const char *pn)
> +{
> +       struct device_node *local_node;
> +
> +       for_each_child_of_node(np, local_node) {
> +               if (of_property_present(local_node, pn))
> +                       return local_node;
> +       }
> +
> +       return NULL;
> +}
> +
>  static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *scpsys)
>  {
>         const u8 bp_blocks[3] = {
> @@ -1027,7 +1039,7 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
>          * this makes it then possible to allocate the array of bus_prot
>          * regmaps and convert all to the new style handling.
>          */
> -       node = of_find_node_with_property(np, "mediatek,infracfg");
> +       node = scpsys_get_legacy_regmap(np, "mediatek,infracfg");
>         if (node) {
>                 regmap[0] = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg");
>                 of_node_put(node);
> @@ -1040,7 +1052,7 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
>                 regmap[0] = NULL;
>         }
>
> -       node = of_find_node_with_property(np, "mediatek,smi");
> +       node = scpsys_get_legacy_regmap(np, "mediatek,smi");
>         if (node) {
>                 smi_np = of_parse_phandle(node, "mediatek,smi", 0);
>                 of_node_put(node);
> @@ -1058,7 +1070,7 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
>                 regmap[1] = NULL;
>         }
>
> -       node = of_find_node_with_property(np, "mediatek,infracfg-nao");
> +       node = scpsys_get_legacy_regmap(np, "mediatek,infracfg-nao");
>         if (node) {
>                 regmap[2] = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
>                 num_regmaps++;
> --
> 2.51.2
>

