Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D24C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 20:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0Xg77SDmiqEWZO6sOqYU9yowUIYMPro3DOs3XY8uJc=; b=GOeKdyVS/4zLBU/Rln7JiyPkI2
	/1fkoU+u2vgSlkCt7kk/OLL3At0ep4dy82EUT0Vo3MnLyvAy6sTxsgLVTYd+cs4q86vMpOTtSR3hD
	cNiD/Xh2p1ZFq6eqEWujR4ZbKSjRpZQ25LWaEkqo9QRpfiAD037JOobQir25oGqN16oQ2lbuGzHrl
	ObkC0pCcab0Qs83ZU8Z8O237wSZ+cHO+IUQYW5M9+powHNVFU8EWFxX+nmccyPRJFwivBQ9XGJBFl
	VWGPshkE1dCmJjPcTGde6JH7dfqQMRb+t7pNqWv+HkP6D7FkEkHsPd/zimPiA/7tuEQUVwb7kBu1I
	M4Q9LyGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZka-00000000xHn-1q6e;
	Sun, 18 Jan 2026 20:51:56 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhZkV-00000000xGL-3MBY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 20:51:55 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-45c958d480aso1712921b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 12:51:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768769511; cv=none;
        d=google.com; s=arc-20240605;
        b=BOLP4DzPuvUzXHdKUZkdSRfCjq+QHi1/GMWbEUOS0F6hlndMTCUVVXvFURrmok41v/
         L8Sp9hqS3uyOYf2IGq6hx7ay7YHbxs43yC+m28niNJxKEdrhAmXy8ZsaLIHSfewxb5F5
         Y+UkALWRqyPHQUeXW9sDx1YVlflTFnUj2ECyc0sGkYPzjp4yKzCQqcFPCxMmsq2HYkZP
         iHEcpIGhNASOo5CR3Ff/e0DmgX+wX5tqzESIMqtomDVTLCrFYrQ5mFe1lNK+6yr1yJIq
         iVor7aqCQY7BKhgWTMq42GU/J3GXUCUSeJ9Zw7+NDcI0iNN7O1Hn166VAm6bI0IDI0F2
         m8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L0Xg77SDmiqEWZO6sOqYU9yowUIYMPro3DOs3XY8uJc=;
        fh=RdV+qfqxMF93hAA3fzV1lB3te35ck84YvOZqnzfyk8U=;
        b=aokify//T9/YeqkWLhw4gfWXnABtYecxbS764pIulN7sjVFY3tY7fZVOX8XNd1C59i
         CyQZRxffnYwj4HqjLun8J0sVYX1ty1Wv1AzwxBBt7wlktA3g11GpqAVjpJfWkIluXCt7
         K2DFIUUPA/OjqBp5JudE+cg1d4A3G0D1xWjZQQVs1TLqBfLzkzIB2hYdHkwfeep/eHRq
         W/BNnpRKdGYKBPfMgHxAYjjK6W+9bG6OuNom2JXJjG1B6eRN+N2TfE6yTMGAAZdDLnyV
         0NJlZlGrLIdqBMH4ZJk/rfK+kinlNTtsaeGbepXq9a/Ip6kn7M/GTq0YI9/q8qvGCMTI
         d9CQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768769511; x=1769374311; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0Xg77SDmiqEWZO6sOqYU9yowUIYMPro3DOs3XY8uJc=;
        b=PKljx3GZhnEph6nqaMIwnyRnEPz/5jOyg3jUdPMpeHrsH0dO1aGSGNxNfk18qWzKij
         EAmd90xircvBEjN66VOw0oKiJN82UGcfD2W1YHkd4WCxgs3h9an6BfdMegedelYIS9J4
         VfNYffxcjegixeM22feKQHlPh9/G+R9UV+vFitHtr5Xd6LawIZBVpXcD6UjB89FgG/CO
         Dj8I3hvoIltwjahtnl11JJ2BooqU7WV+T8Y6Pzsvpljn2me9Lz3WdnlvxKGhrEdu8qle
         RhQemmIFGLZAlufU5EViiaimusx41Kg0NXrG7ReVSb4Y/hsmT7YqfxHShnvx+8M3jim4
         GZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768769511; x=1769374311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L0Xg77SDmiqEWZO6sOqYU9yowUIYMPro3DOs3XY8uJc=;
        b=C4nIxXx9CD/6+KGESk3eBAuN++0CuPyi+lvi5istL3xIXPPUvz+UpfGwgwoGmCV8F0
         xsWmXB0LIt/pTClhm2PCiMqQYdKixl0RGTVau3DOYMnbqVEn7bzVmgNwH+FTNUG3xBpY
         Lc7a4PSo15VvfoArHyhcFsuttUxWYXBHFIk0dledYXIWHjotybuAoBk4HPva/HPHExPm
         i2dVZ67IeFaQOsANZaq+hS/7CiplGATOYRhPgv9T8WBUaRL/QIwHM8S+DCKr7zFzK108
         bRBqIcjxKKJOhzapE/Qiqd2BvIvfyV2sArfsgf/PvN0RQp3UNY3HbLC0QfG9HVzvz2Pp
         53Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXhkdoupX9zqkLJU3fQCPAGDtHi6NXxM572tFERRAUg9ph3L+r4ubZQ3LTbtTBAJO3xiWHXz77ji+X/TrAOsauH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx98wiAibi1//d26FtMUz3bMhQZvmcUJ5lyoTdVK0BbTLYUoS4s
	uTIN0c8m7LNCYaX3MZq8RcOX6deF5bMrizQhuTG+cUC8O5esym/RxdbbR4GUkLXDQ5j32BXyCzv
	VvPGQL2jHvDZkD2GVriAgEKvW3ak45t0=
X-Gm-Gg: AY/fxX6YkxAFoq8R1/FOtQvuoCQcLw/R1SWPbuESO4qo+aEiZ1NtFJtoyMma3ZhlFU4
	j2/0E0JYPy4yCM9sqUxniv/CuaWz/htEkQ9qbiwDjOSFSWGUKavdbodJws8ORfVovPwYv9Zr7y8
	ffDFW4gBgIB8wm2zSqUprN8wu6gmVd1hko0Vszk2OGg6Ap9hU/Lt2rxacbb9iPC19XNqN8WkftY
	F1WZw8uxr46CwAaB2vgXSjwtN9EG8sIz/XahqmYEYp+a7dBfH/1kSf/6gzAjZA656fkFcYf
X-Received: by 2002:a05:6808:3008:b0:45c:8045:89a5 with SMTP id
 5614622812f47-45c9bf6af97mr4658298b6e.21.1768769511004; Sun, 18 Jan 2026
 12:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20251224114452.141689-3-krzysztof.kozlowski@oss.qualcomm.com> <20251224114452.141689-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224114452.141689-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 18 Jan 2026 14:51:39 -0600
X-Gm-Features: AZwV_QinxiGf_fn13PxcUNz6VuDVYig5FVOqXyYeBIQ5vuPNPU2n6zlYdxCF0h4
Message-ID: <CABb+yY3O7pqswS16qJx-Ud_HHxdkboRDWy4qBitd59wM_O31tg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mailbox: zynqmp-ipi: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_125151_849988_6539894A 
X-CRM114-Status: GOOD (  18.42  )
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
>  drivers/mailbox/zynqmp-ipi-mailbox.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqm=
p-ipi-mailbox.c
> index 967967b2b8a9..42d2583e44ca 100644
> --- a/drivers/mailbox/zynqmp-ipi-mailbox.c
> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
> @@ -904,7 +904,7 @@ static void zynqmp_ipi_free_mboxes(struct zynqmp_ipi_=
pdata *pdata)
>  static int zynqmp_ipi_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> -       struct device_node *nc, *np =3D pdev->dev.of_node;
> +       struct device_node *np =3D pdev->dev.of_node;
>         struct zynqmp_ipi_pdata *pdata;
>         struct of_phandle_args out_irq;
>         struct zynqmp_ipi_mbox *mbox;
> @@ -940,13 +940,12 @@ static int zynqmp_ipi_probe(struct platform_device =
*pdev)
>         pdata->num_mboxes =3D num_mboxes;
>
>         mbox =3D pdata->ipi_mboxes;
> -       for_each_available_child_of_node(np, nc) {
> +       for_each_available_child_of_node_scoped(np, nc) {
>                 mbox->pdata =3D pdata;
>                 mbox->setup_ipi_fn =3D ipi_fn;
>
>                 ret =3D zynqmp_ipi_mbox_probe(mbox, nc);
>                 if (ret) {
> -                       of_node_put(nc);
>                         dev_err(dev, "failed to probe subdev.\n");
>                         ret =3D -EINVAL;
>                         goto free_mbox_dev;
> --
> 2.51.0
>
Applied to mailbox/for-next.
Thanks.

