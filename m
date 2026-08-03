Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E429CC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=doqYgb+n1+MzYaFBkm0Z2OZtZJMR4/CPw3oK9XHvRn8=; b=Hxg+oXq96tTNq4
	KIV8B22C5odvRSSOG/zSF6wQ7XTeje5COs8KwJni5Tfd3+I5tM80ZMbWRjPfMF6c/KSdJwFSbB8zm
	eag7D2bcrF+zUEY5rLFp+fbzjbpKqyw4cDDIk6gWSykxV4UJ3xreT/g8DQWVUWjDJFZb+qA91C1TU
	dPvmAh0B40H4I678BbTw7eMFCOXdvv3kR26tpXfh6lBKPE+IMcKGgbWjM+Vp2kYIKOVBtdQjMjKtF
	lPQZ3nL8/ADdbfnugcS/hn+06mkdGf/CppqdWvhaUtuiJVvhgxAWQ+iTxkVwOW4gkXYwnoUcWh9uE
	xXWml/JogtDdc9pfF4/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwBT-00000000Bpo-46dD;
	Mon, 03 Aug 2026 17:10:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqwBS-00000000BpC-0KJ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 17:10:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2708C60A64
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D385B1F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785777036;
	bh=doqYgb+n1+MzYaFBkm0Z2OZtZJMR4/CPw3oK9XHvRn8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=eOr794kIfY7W46iYnnLxRi118Vzcbg5sdZLUGw8OGSnDbs1p7MZ2Ldhbj3haxzko/
	 yzTY9dPWS0RMMlQV4lxj2OoVbIcTJvN/othQoHnVe801TzUUo0JFOtu+/iHTGpWMi/
	 Rzx2A08ukI8cx1n5taUtGS9EEtHLSA5yuq7o7fJhmtPAWersXusVQeoVbb4BWl0HIg
	 juRcwHPOdd5zwWfjrlnnqfGmr+B6M9jn+J5H0SNOyaSF4VgFoaspl5QchpzZNumLMU
	 LU+jaoyNSEpdss+sJdFx50CC8qA/8+w7mQN2HkcxXGrDoiVfJ5B96XGq1yddYAYVhZ
	 4qmYRo5wtKnzA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c8e65e3f5so32408511fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 10:10:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp1MHxhRRmHZJEnqUl8GsyfaglIiMl/LMf8fUEJeJMckyAebmfLGZFX+Vs3Dm1HdbtgJcQ1QnYOaiYowc7tPexM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe40Q7SU0ZFtrEwSij53ObzO6OctF9xRcw2B9gkFvkaBxsfrbg
	VhA/2ZBfKz+oB/NLu1IISgA6KFLqhpf8bI5ByvgtgsdESEhzzRn633NFlcRhMhxQK4JCPBgIP+2
	XS780aS/jq+sjBgT7TsfF0t/Aq/RyTco=
X-Received: by 2002:a05:651c:a331:b0:39c:7294:edd5 with SMTP id
 38308e7fff4ca-39f86149fbcmr20474521fa.16.1785777035316; Mon, 03 Aug 2026
 10:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <759c74e3a22b97ca066ef7910ca4b91b852011e6.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <759c74e3a22b97ca066ef7910ca4b91b852011e6.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 01:10:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v65TCJTNNJCNHOrD5crXDHaB5xHk38OoU8cJYneLoK6WzQ@mail.gmail.com>
X-Gm-Features: AUfX_mwpcFy3zfeI7QO6fCWDy-K5pNTC3w93qmXynM_39UegKq3dSKNgaBP3zYY
Message-ID: <CAGb2v65TCJTNNJCNHOrD5crXDHaB5xHk38OoU8cJYneLoK6WzQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] drm/sun4i: Drop node references while building
 component list
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Two references are leaked every time the display pipeline is walked:
> the output port node in sun4i_drv_traverse_endpoints(), which was never
> released since the driver was introduced, and each node taken out of
> the endpoint fifo in sun4i_drv_probe(), which stopped being released
> when the fifo was introduced. The latter is still safe to drop right
> after processing, since drm_of_component_match_add() takes its own
> reference.
>
> Fixes: 9026e0d122ac ("drm: Add Allwinner A10 Display Engine support")
> Fixes: 8b11aaface2b ("drm/sun4i: Implement endpoint parsing using kfifo")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/su=
n4i_drv.c
> index 8a409eee1dca..e9baca360160 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -289,6 +289,8 @@ static void sun4i_drv_traverse_endpoints(struct endpo=
int_list *list,
>
>                 kfifo_put(&list->fifo, remote);
>         }
> +
> +       of_node_put(port);
>  }
>
>  static int sun4i_drv_add_endpoints(struct device *dev,
> @@ -394,6 +396,7 @@ static int sun4i_drv_probe(struct platform_device *pd=
ev)
>                 /* process this endpoint */
>                 ret =3D sun4i_drv_add_endpoints(&pdev->dev, &list, &match=
,
>                                               endpoint);
> +               of_node_put(endpoint);
>
>                 /* sun4i_drv_add_endpoints can fail to allocate memory */
>                 if (ret < 0)
> --
> 2.43.0
>

