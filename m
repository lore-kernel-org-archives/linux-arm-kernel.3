Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70632D25032
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 08:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6bCLbvW5A/zowtZrBrPo/Bq03CDcWcOqwDwQh5SQ14=; b=JIq7t+AJstpVA7MTgcXsYBl14+
	iRHAioOB0F3w737xIbWbpAgj/D96Gr/ygmKhcbkrb/OkB4PlmzTtEjsmiG5LRig7luYagjC3FNMp7
	TRjF/Pm7PsSRROthGLGKzHY1b+e8oxbryYdsaGERz10Qx4DTS6MyDmMxGAjI38ztAXCLfsLh9eIsp
	WSb+RuegETe1eCTPy6EfFQXmj446ErmJ/avTYWhZJrq/wffrxFFn+RwQwCU7jV/cXkFA1VMhS1uDl
	sQI6jH+MnJbdAVZUg4zFZf4DcvRxtAl0bGtTyygGehpO0qOpl+wwHCKV2OSJ0hM2111gqBzTYz8bf
	pr5jyyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfD88-00000004yEJ-0FvK;
	Mon, 12 Jan 2026 08:18:28 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfD86-00000004yCx-1d8O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 08:18:27 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-382f9211cbfso58373511fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 00:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768205904; x=1768810704; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6bCLbvW5A/zowtZrBrPo/Bq03CDcWcOqwDwQh5SQ14=;
        b=YYiHj94a1EGoGpz7YzyIIoWutqmgDINC/lHcx+A6Xx326SOZiY9TuNBhuf1x++aGYq
         lVsTOIFQ5VWi0SniGuV5VIaY7Z6JlOPZXv3LoLVCMyyrF2eBwLzSXyuFUOIQ8Lfaeiwr
         Kpg763QlES95o4RI/tPWQKmJJXROdolNzzDN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205904; x=1768810704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L6bCLbvW5A/zowtZrBrPo/Bq03CDcWcOqwDwQh5SQ14=;
        b=C5LAVlGe1wyjgNDQIrPyvXk55xQLrWlcj4dXHInBk7i207NrXKMOeCUKsk0wo/nXBK
         j5awF1e0ak492mjQWN255CUabIJFyZmSaMAkq/QEnCaEgM2kSD7A/F47xX9xUy/wjvmd
         p4Dhl/aoQsw1tPlN8Q17pM/pi7H1ja5pYvr06WcUbSy4QH9otDOOjvXGBBS8VK4v8N8c
         e1s2YHGZzOL69vbSfnvZ8Huc56YkKosk4klIzK5khHuUyluBRw1dslSdrVu5eUMELlG6
         D/cWgnGHt62vpCMfr/kSUkYJyFb79LkfId5KYqp77xJRYgx2OXF9ag2c5lK5fknFlDR9
         EMzg==
X-Forwarded-Encrypted: i=1; AJvYcCWnNeC3RT5iv7cokvOadESU/DJ7PVJIgkMngr5FdOmYnuCYjTA+aYhTFsZZJHdvbCY3bLDk3MIt+swXUMHR0Dt3@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq/GQNvKfnc7yhJNqnEfbAlXAZLcczUoEcUl0gMUWmldPiSDgE
	6kVnN7mr8xzW5rfLJxYCTlWC2qdjx1OQrHWXLHssijJXUuwLytRsrZb8hMZnP0PAtS3Y7O3GPvM
	5mlMZiEwSbDC85wlOqizHtc2ETAflRFdltH8xbn9c
X-Gm-Gg: AY/fxX5abXOyo0ihlXO8c2wvNEE6DgXpwsBmmQ7e7MvhU4Lksxg46gyvXkGevANUS+0
	hBEEKpZfTMPhXDrLzgcZaZsQWn9qgXLLrkAdyWuldtF1fNwwe3WI0lUcfT+/Qi7V4Aix+6AuvML
	Vp/WDY+Og1kMQrBzK+aGeux5Bz3JAZH13Y5hErolszX6YMFMkGA9Fc5bKlpfi8Xv/Yyjv4QxVXK
	9xy+ITqMs70jCd5CVZ5E5T96WppfUyFiqwLpHZroIPsXMT/ECLAiIivWkAsVWBSdae+YbQJrrOS
	JJdk0UwtoMHzm5WJ9A8maOqX
X-Google-Smtp-Source: AGHT+IHZj8OtKhvjb8Ys8ElSyf3nhdRjZrZvnNua8ODxVvC28Gw2WXeKLgSbqyeYTY7AH28BYlDFxpSNkhmnPhK2TKM=
X-Received: by 2002:a2e:b88f:0:b0:37b:b00b:79a2 with SMTP id
 38308e7fff4ca-382ff688d40mr47364531fa.3.1768205904306; Mon, 12 Jan 2026
 00:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com> <20260108143934.69634-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260108143934.69634-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 16:18:12 +0800
X-Gm-Features: AZwV_QjyElcmXKN67UO8XW7VC_1mJ-HQyn22SZQ60IamoKaOC4_dQt9Okx2MZZo
Message-ID: <CAGXv+5E4w==FbYVGdh+7+btZJBT6UQa3V9buMKO_z7M04RL8Vg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8188-geralt: Fix warnings for
 vdosys0 endpoint
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_001826_435692_263EED60 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 8, 2026 at 10:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This machine needs only one endpoint (@0) for vdosys0: remove the
> address and size cells declaration and rename the endpoint@0 node
> to `endpoint`.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

