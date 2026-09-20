Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0EAC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 19:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iK0Gs6NwyFsMQI3jnf150QmPrlYyVsEEpsTC+sIIk0=; b=3vbZ4vPk1Eo7KZ+jVcaNiX5dOI
	eU1Vsfd+lQ5XRjuO4hutZ5Gh7Jk7viPm8ZCwhclP5BiECLguFJqEinz1R0WU44VkH4eG9lvsCIKPO
	BN5dxVRayp98TwfoG7e0GRNBSpwo3Ex9+WbKkFC9s1cq1TRftTIEdJvMgjwS7mIaQIlZRABB+3hvv
	5hrUvMdp2NOTRrU+em1TuC80/cP02MqUuO0Vc/XRI/zL9+LHQ4VplQdZ604JS+KUsVWmj8g/sDF3K
	Y2AS3DlyvZ0sAghlI2+c03zmGvTLsxxhT8u/B98v9h9rwNsW0bpJ438puFJnRSVu7/mMryJlfAckv
	KKc4hhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8MwP-00000000HdB-2SGG;
	Sun, 20 Sep 2026 19:11:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8MwN-00000000Hcz-3Qhh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 19:11:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B28AA600C8
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 19:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B4F1F00893
	for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 19:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789931465;
	bh=/iK0Gs6NwyFsMQI3jnf150QmPrlYyVsEEpsTC+sIIk0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UbGC+9NMdrBSZ0ww0vVmCyzviQjfaxpOY7Y9CIhDubZBEV0P0AtE52Qf1LpyL03xn
	 8L7+xaTQp+93uC03JdbDN62qIpC328X0SxPzeTRXrST833+mvYTVOFVMNUpEFLsrI7
	 cFSfLJaYQbq0z0ysjGsV28FN65VmvcAWYYHeX77uNsyh5pY49S+CP76Ym8oN8Ji+4U
	 Lv4cW4weyCCFuRznKqnu4Fmvy/Sp2Pi7GfxAQqqbl/XQVCq7r+WaWFnuC8zIwy5yT3
	 qoXpeJnTTtceduTUD5oaroSfwUtLEIld4wxKokdqmKfHAV1n/zWuQGpQkXdszFQmGn
	 RnWUm1744Lulw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16c72so1817325e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 12:11:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPsjmfuJPjyN5w6AtAoY4QwTRpuRg+fnF2M6nu/2hB30yZxEYJaHZzBP07S8II8cYyYe6qoQoSaHrkmJjhXsNH@lists.infradead.org
X-Gm-Message-State: AFuF++kVkQC5bwus7N+3wfLntm6BMGKWZZOpFxvjEkXwKMcErAZ1k5Bv
	dJ6OzmrP8Ld56ktWyNZTmLU94G2LCa2YXMV33VjAgO39NF3+ZZM3324ZqZC/hUu09NyCLEGT+Gh
	zsD3zVBVIU/pVCOUwUZiD30yzyYOCOMQ=
X-Received: by 2002:a05:6512:3ca0:b0:5b6:1a7d:5539 with SMTP id
 2adb3069b0e04-5b8c19766f1mr2578175e87.64.1789931464136; Sun, 20 Sep 2026
 12:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260917192835.58126-1-mhun512@gmail.com>
In-Reply-To: <20260917192835.58126-1-mhun512@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 20 Sep 2026 21:10:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLmbacE7go5Y0sGE+bZoQMAX5KAXFVTxdpiimTJLjmrWyA@mail.gmail.com>
X-Gm-Features: AcwNN1X9_5IhszzIlEYDKCauIiXNs7gHNMzBl-slkNJgbJg3EyuhXhTi27XEGhY
Message-ID: <CAD++jLmbacE7go5Y0sGE+bZoQMAX5KAXFVTxdpiimTJLjmrWyA@mail.gmail.com>
Subject: Re: [PATCH] net: gemini: Free the shared queue after removing the ports
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2026 at 9:28=E2=80=AFPM Myeonghun Pak <mhun512@gmail.com> w=
rote:

> The software free queue is shared by both Ethernet ports, but each port
> remove callback frees it. The parent also frees the queue before its
> managed child devices are removed. This can free the queue while a port
> or its threaded free-queue IRQ handler still uses it, and free the same
> allocation again when the children are removed.
>
> Keep the queue owned by the parent. Explicitly depopulate its child
> devices before freeing it, so both ports are unregistered and their
> managed IRQ handlers have been released. Disable the free-queue
> interrupt after those handlers have drained, since the threaded handler
> can re-enable it. Only clean up the queue if it was allocated; it may
> never have been set up if neither interface was opened.
>
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
>
> Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethe=
rnet")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

A good patch, but there is a better solution!

Replace the crazy freeq queue with a private
page pool.

I have been cooking a patch, let me test it on
hardware and send it out.

Yours,
Linus Walleij

