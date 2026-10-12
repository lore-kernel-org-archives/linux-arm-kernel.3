Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE57CA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=; b=dRULCrZJBQE6L9XwWRklna4etO
	2TA1pa64/BTS7mmi2jRrHe7eJgIfgO4QXlj4lUBXxrWeDxKNR2+/07N1mrg3RKVmHNgdlxpoT5ltA
	NtL4i+KkbYJp6VHzpgRHzQt6GClIt0p0yTvOHxeWl4VvsXqtrNc5k1vPZU/OrtQJKxk83Fz/UVnwm
	iUDEXuv+aQYn12jILSLc8rQKWMWLuJuhlFSeDIBe57f67pr6ZKGzVAkpeG5I+qGToOrLxUDw8iFmn
	hwC13Nig/TALS+YdAn9pERG6kkurvXnLFDwonAwA9k+vO0vxYwBNBI7d6puVdu+wnu0f4z6mRplaj
	85Jxeoug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGK47-0000000B8ql-39wd;
	Mon, 12 Oct 2026 17:43:59 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGK44-0000000B8pA-3YKS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:43:58 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so2823559a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:43:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791827035; cv=none;
        d=google.com; s=arc-20260327;
        b=HD9Uy9DdfnjQ9dYaxH2Q46wncmLxZFETyO/udl4KH9GdlSWLHzvC4gJoTEvgpZvYO1
         2FZpelIxsT9/vsEowjGLCwhEDwjHxOS1JDyR9zd2OPnjyg0LApTpyhUS+eIlgT5tvlak
         gYdl3y6ev1ckrv2NvavWyW/qat2fQK+VAK42ZYdpeCDLw6aSaJed5L8EHepQwGusGgoL
         +IsGykR0hiSsdazB03bMP9FS/q/8OAr3nhBc8FzKzewwZks0Q45hAePxBt9XrkW3YD/i
         CjLhtl5QGmUVIh0feXin3H2vscA5eEXcxLpHpPN9toe5YeMo+9EG/vLV4IsWSLoS+SX4
         yepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        fh=8gCnk5fOAChjb87OOw+wMYR/ACQ05DObMdjR3wSx6jQ=;
        b=abDnUTnPtncxZoeGyGm3soUBDExYT2Cb/9y0WqMaABky61XwueoGQA7IHnxQtOgnPB
         Xz7Sq8TQqYpWP+Mvx1XG2sl/o54dp30w91/S7jmx30lai4wAMjP/tVxowKO0Bfx0U7IS
         dJL2tHXA3Uq0c1K4Hzeu4IHcnsuoxdLguuakNL0TJUULDAH8OiNvxACOum6AwntP3rqD
         rO+6yANuw7ZONsmiFbYYloWxQxLui6Da39hBB0o48FnhO9ga3LzQoEkxFjtrE35TFgCC
         fhbsshOpv7riNPCMy/fU9rG2f5Ll7wiU9UdIEtE8nxaJy8tWiTA2Fhytwv8WgMGBvXIy
         j66g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791827035; x=1792431835; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        b=r5pqoxkgDMpNNApP+YitL2xWGnQm7iFZgg06hXWmqgkr11mpVkoa7LZS2gKuqPX1sk
         hQUXIXsT95hHIEDYpLZ9ILTnIWd3V3x+ekNdYJRy2O+3TTAD55NJD8bnFvQd5I1kC7N/
         REhBqRoA9Kbuje77A+F6Ig7XXdkZoP8IEUj/+HCafdm8KzTeD/1JRjTw2kKYDRZjDIgT
         fI/ovDwZoTwXIBSPzRuN4dxye/bYGDtomJdEmRviObcZAGYMkMHY4+pRw68i3oBrO7VR
         IZr03HX/CVdUKuv64sQ0UHDQ/B5IU7623frLMbyO5PxUvpDs7+WDj9kZ3cBc9VYIsrxd
         rXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827035; x=1792431835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        b=h69t6t611+N7rjKW2kC8V40mBv0b3WPr8Ssplqe76qbq7sJMhQBu8stoxcG62dOcXQ
         tBtIqdSxIpL9og2qH9XQ7ueEJJ5YlqgqDYPSRHcAqlkb3aiB2hb0a7o0fjp/Y4Lt5/f0
         VkNYNSoggQ47PzHCvMJgN3w97BQaic28lFCrzyDSlpCCQSsvuWsyyLz/OjUx3RzND98K
         WKHdt1wgx223vbxvy4vzDnadWjvRr0FL6ObLkwMFW+285ZWSnRCytWwef/k2+vfb/S2p
         zMQSHQ0toc73IEeEf+XpK/4k+FaxMl0DPq6uNf23eFcYslV1FNeh23dtVhRUj2bHiJzJ
         viyg==
X-Forwarded-Encrypted: i=1; AKwUvBwu/INEwEetEGrUR7GVPJv8rtHAVXDMQGtEpN1Spn0+/62oJFO1NjO6qnmX/RI3T6iDHknjugUOBMYOLO1RYxoV@lists.infradead.org
X-Gm-Message-State: AFq9FYI5gqAFxduPwf6mwj/hNPz04ytdE7vTs6UOWjo8U+j1IUnZ94Qa
	uVGueNuGVQDiwJpiOq0BQir8Ck/e3eHLMQB9SQkYWezeMQId4ivPIQUmyCPC8035ZdoomGaNVvw
	2cUdj3ooVwtJY4uJhNUye+Pby3LkdYIY=
X-Gm-Gg: AYBFou219veFC0pKQ6CqCp67dGe0iz/nlv+pIcEYeI/JZkC/dKuihuwU736UHZugglD
	2Pujye3jpaSxwSMaPF+TSB6Yer1D8r4mU5SxneaE0JjvUOQz3ZRI87qDABzsYiQ1WgxYdZscO0/
	sZTj2bjKAAmTk61dKfX2TrB7ociG6TAUiZCckzMfHeEmBr4N8iybD3yZAGTz/s5U26LL6Ue7m7n
	at3KgFeRw+EbitwV9cxfwPkLO2upenB3L4VG7kEF7sLFwvZMNrvnbngmpRl+j0GZnICpLf5mo3F
	4PFJkg3TmE8eVZT+fRXn9CrF4RryUA8huIIstPaP440OHKtjR3lnug==
X-Received: by 2002:a05:6402:4341:b0:6ac:8761:17a1 with SMTP id
 4fb4d7f45d1cf-6b17c27a7famr8072014a12.36.1791827034421; Mon, 12 Oct 2026
 10:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20261010115539.9237-1-l.scorcia@gmail.com> <20261010115539.9237-2-l.scorcia@gmail.com>
 <20261012-quirky-emu-of-renovation-c217dc@quoll>
In-Reply-To: <20261012-quirky-emu-of-renovation-c217dc@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 12 Oct 2026 19:43:42 +0200
X-Gm-Features: AclHuK-aSGZTx-4HZF0vtpTq6BBo_BN-ay9Tv6iz0b611lBgirjVShAwSUrYMCA
Message-ID: <CAORyz2KgX-7=gfax06+Pb5SFq4dVTtcTY2pbH+FDCRNZ+AVXOA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: mediatek: hdmi-phy: Add compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Fabien Parent <fparent@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	chunhui dai <chunhui.dai@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_104356_895951_028BBB29 
X-CRM114-Status: GOOD (  11.17  )
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

> Why do you have flexible clocks?

Hi, I'm sorry but I need a little help in understanding your comment.
If you meant "Why isn't there a constraint on the clocks' names", it
is already provided by the existing conditional block [1].

If you meant "Why does clock-output-names have only the maxItems
number and does not specify the clock name", it was there before [2].
It could probably be added back with another conditional expression.
If you meant something else entirely I apologize and would appreciate
some additional guidance.

Thank you,
Luca

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/phy/mediatek%2Chdmi-phy.yaml#L90-L102
[2] https://lore.kernel.org/all/20251217-mtk-genio-evk-hdmi-support-v2-1-a994976bb39a@collabora.com/

