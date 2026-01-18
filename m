Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF190C98315
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 20:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ebu4LnVWsggvJ0VMBMc6Smge/3FP4WVsi5XQ/uYo0k=; b=cMheseJL0bwKdFuXCnRu49Sk8R
	qxvCpqs8Tu03TkH4tlEVUQW0yBkwJEnPvT8OFxp8LiTZhYhsK5s4Xz1712b0sHEHHoDaCLzTQYIZh
	z84mcnMq1UoTdN2CUzIhN4V4aDcuUb1KCPW4UYevsJ21dp0EER6emjZksGfgsjXGOKzYv9qZvuCeb
	XaImrdwS5u7gNiWFnt8mJnkThvzO9vFIkXXirtp8pcGxvSUqZKR4q+E3jnweK1gUkuJD74Sru3pR6
	v0rCXh3csq6SQAj0mUdE6YG/MnsVAWTa8cx+DSWkNYvO2hh5FrwVlyfEsp0E8iw6qKJfeRzpGuCOi
	6Lw3AEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZju-00000000x9h-3aKa;
	Sun, 18 Jan 2026 20:51:14 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZjt-00000000x8w-01xe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 20:51:14 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-45c798c92edso2294986b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 12:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769471; x=1769374271; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ebu4LnVWsggvJ0VMBMc6Smge/3FP4WVsi5XQ/uYo0k=;
        b=LYBfusNmkl9P45LXGZZUqywPPxJYwpXARno/gt2JLTi8zeQ1uHnQRaVT30jjjUokdA
         ZDT5xTU4Uh1GD8EELk6TwUQHinyhNpwIF2bkfAO/QwqntPyVBjEwITJ2uSWvkhMsstrJ
         7/AVwEiRZRRlKDFrh/ouLPmyvUz6wmgF9b7kl4DNL3VpPJTHDBHgzrv4MygX6RuNIHS7
         Eow2NEWciGBys/YfuOJt6OWJG+P0bwBuEAwv2At3nI3s48siZ0wLz3Z2GHQgHSNpFD04
         RDXgBPTlMP7VCMi9VR2iSLq+QqXLS+89sdo7sRDge6HRINLCulM26O1uiHn4iTKLi0HO
         NV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769471; x=1769374271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ebu4LnVWsggvJ0VMBMc6Smge/3FP4WVsi5XQ/uYo0k=;
        b=jW9cR9jsZ4ugg2lJkq/5uYM8t5fKbaZnbZrE0rRDTkkQCBuDffn7pMvR+AeOeQWKyT
         cfEnZirIyQVW/azEFwU9TgabIV75VNPKx5xR8O3AY1nnaLOM6D54+izpbjv1kzyIaKnm
         xERay1SZuaauP0kUyG5LTO3EWuwrqd4s4sHe/f/A4DdYFFW3ckDiSPX9IGfR2NheMDyI
         WhJL1uc8+cfYLG9LOYEFzMOYGsSETjMp+4+e9OqX79y1HWjfXYPhR/X/lzfygdMCRawJ
         OWZzXvDI1Q3wlD6e06K22NJ8f9i2O7V9DWeuk4JjdOBP/s7X8UB0glbMlobXvYOEh5BG
         lSyg==
X-Forwarded-Encrypted: i=1; AJvYcCXr32ZO71Y7Ff+ePo18tGpUA+0ZkjmAUuzl6odDWxQ7KEuLAd4RJsRTIoVMsirb7Hmb45mOegwDgcse269RiKPi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Y6YVYcJSv5z2Wd/zqg6lBtueGNwVxUtJEO3SmpHSCBkbyDsd
	vITN4drslmecFpRKhMP/mN24qfNYamvFl3h2wOHj5DD3q/P/S5j/F5k1sbpMLBmnEGomSiBeBxx
	eydWgXIqp1pSMfwkzyDDFmliJ/gF9Ti4=
X-Gm-Gg: AY/fxX6DV03oLIkOeBfDzdkxIBv5Y9j6f4GVwvFUMepq8DrVHSr+RV9FsaN+PMqPkmB
	nfNHTc1x/YzueWTQ/PYKYwLerHMSRlrlWooS2EDXdmHU9T6fXEhCVFS4Ws4b/LDJ2pS6ywNHvYo
	2M40Jdwtjy66+wQmaCMncTiLBKYaxsbwbZBcwnUlPZduKDSWpRIbPU6zMoNLPEefekvc/5wXuAC
	xiCW3DA4qCdvRoIUNn/+jPXp8FIOA8Zoy7mRrNc5EXOvjxDqyMK7QacQqlbxLbMEANQ+pKWhqxB
	MdwbK7g=
X-Received: by 2002:a05:6808:4a48:10b0:45c:a919:4281 with SMTP id
 5614622812f47-45ca9194a13mr2871401b6e.55.1768769471670; Sun, 18 Jan 2026
 12:51:11 -0800 (PST)
MIME-Version: 1.0
References: <20251224114452.141689-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224114452.141689-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:51:00 -0600
X-Gm-Features: AZwV_QiKHuV9-iLza1ZNjEP5Pn_YvHBwe0eaKo1Fuq0mka0rXUyl6A0C8nMcMM0
Message-ID: <CABb+yY3vehi0wAtfLh=LL6QtXmcW3zo9-CyjfLeT3wYtNHB=sg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mailbox: mtk-cmdq: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_125113_054406_C2D12391 
X-CRM114-Status: GOOD (  19.19  )
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

On Wed, Dec 24, 2025 at 5:45=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmd=
q-mailbox.c
> index 1bf6984948ef..9da16b30eb41 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -636,7 +636,7 @@ static struct mbox_chan *cmdq_xlate(struct mbox_contr=
oller *mbox,
>  static int cmdq_get_clocks(struct device *dev, struct cmdq *cmdq)
>  {
>         static const char * const gce_name =3D "gce";
> -       struct device_node *node, *parent =3D dev->of_node->parent;
> +       struct device_node *parent =3D dev->of_node->parent;
>         struct clk_bulk_data *clks;
>
>         cmdq->clocks =3D devm_kcalloc(dev, cmdq->pdata->gce_num,
> @@ -661,7 +661,7 @@ static int cmdq_get_clocks(struct device *dev, struct=
 cmdq *cmdq)
>          * as the clock of the main GCE must be enabled for additional IP=
s
>          * to be reachable.
>          */
> -       for_each_child_of_node(parent, node) {
> +       for_each_child_of_node_scoped(parent, node) {
>                 int alias_id =3D of_alias_get_id(node, gce_name);
>
>                 if (alias_id < 0 || alias_id >=3D cmdq->pdata->gce_num)
> @@ -670,17 +670,13 @@ static int cmdq_get_clocks(struct device *dev, stru=
ct cmdq *cmdq)
>                 clks =3D &cmdq->clocks[alias_id];
>
>                 clks->id =3D devm_kasprintf(dev, GFP_KERNEL, "gce%d", ali=
as_id);
> -               if (!clks->id) {
> -                       of_node_put(node);
> +               if (!clks->id)
>                         return -ENOMEM;
> -               }
>
>                 clks->clk =3D of_clk_get(node, 0);
> -               if (IS_ERR(clks->clk)) {
> -                       of_node_put(node);
> +               if (IS_ERR(clks->clk))
>                         return dev_err_probe(dev, PTR_ERR(clks->clk),
>                                              "failed to get gce%d clock\n=
", alias_id);
> -               }
>         }
>
>         return 0;
> --
> 2.51.0
>
Applied to mailbox/for-next.
Thanks.

