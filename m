Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377D5E909C7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 15:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Nsb9d4cdh3TIN7gk7P/dLzs//wsu5O2NugIegk+Dvg=; b=0dk4MRmWwFmobsn/qkpUCsBBbS
	p8z06GerolIAvu9cuxUdm3M33i0FyDjEP1bY+KPfSpHBCwO0KEvGe24WFopZ9jZID409ubUXhSmMf
	LsDcf6DyO5pcyQV01dmV8/Z2vcJeyAnfdEzhoxkRXiFJ9hFb3RkrwAAXx8pZ1hfHcxrpJSe4hnYaF
	m7QlcUhv6q7V5C/C5HbO+5CKsRhkcm+F7LyGgUIEYo9sAjBxlTa53Re8mbgCrFBlN+3dahU7/6W+x
	GcQPuMQXMKnp1SN64uEMdapkeGM5g1XJGCCrPbxJEb7i7yhdpR9slX1Y8vel+wb0mr3gcLN47aIYM
	KONdNp2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNMr-00000008WdI-0qSC;
	Tue, 17 Feb 2026 15:52:05 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNMk-00000008Wcd-1yMy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 15:51:59 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-65a3015c206so278070a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 07:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771343516; x=1771948316; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nsb9d4cdh3TIN7gk7P/dLzs//wsu5O2NugIegk+Dvg=;
        b=AMQ5X++vIp7fZEityQryTaZPNcXr+0/P6y0l1PSrhNdVRlFWQXDz3Ge2XTCjsUOaJ+
         HTBQSnsDutYllBk/AEpErPgwgpd3q3/dLouuOpITm5O8KuflUHB+JUZ9qcU536AFSkxZ
         PuRSZsWmcOh3Z6NREqvqZGXwcnWWZZzUR9zSkC0osV/BpkDkM8IN9/ttWdhUyDWuRSC9
         t1CQ/6bM2a8X5P7KYx3dMJ9wc7eHGaZLVeG0uxNC9y6v7WfPOLqG8Cqr6/1l2iGX4M7K
         3tCMJcJ1nL8T3MHr4ZB2GRSe8gmuwZtKhVjHK8ZxbpmLTy7rBWehuOsaDVSXhYK1gVYe
         k8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771343516; x=1771948316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Nsb9d4cdh3TIN7gk7P/dLzs//wsu5O2NugIegk+Dvg=;
        b=kV06+/1JjTIFH12+ztt4YoKaI3HuZbUlfUH27Fsi3y5e53jjVOLczIfEIbcBlhz4wE
         GNxIyVGX2jgIhNA37DQporh2wyKhoWens95FEkdPeJc7UShsWcF58YAs75brltTB3psx
         4b2zuHzEW9Oo8N6lijoVdznzeAVm1s+lz3t1+RE5yjM4/R2oNV5C1qNGDAoyDWmPnmMx
         T1sRV5to3FmHjUjglRFWtL1vvGNw6rgRqPtH34NhVfpeCz+aWLjottvgGA3/gU6esI40
         ojjQ7Cf3w2aUH4P2+gZbTUdA0vRwzJDCKL2rSPtHRnjPHTDgiXpVnV7Ck5CEV2pLO3zB
         yDQA==
X-Forwarded-Encrypted: i=1; AJvYcCXcA5PLyBYSSFeRSQXB5AD4AZzvod+J4fjL3cj3TxXAPzD9xPxXbe0q5ojQBSFjadi9l9vVavutZz/DerVaeGuC@lists.infradead.org
X-Gm-Message-State: AOJu0YwEoJ62Q1kpKAqME0go/AX+PIK9OMFbhaKoHF/ReSCS/rzOtjSi
	y+UlkJ+/m6ov0M3Y+mFk2k8jR/c7RdQ9SKnKaq+fUnXziW66Dmuxc2D8
X-Gm-Gg: AZuq6aJ8YP8YSx4VBZCEqwZ6ZicpzCSjDE9hXYnyilniZu5WJeZNmTiBZpodWcM4LFe
	8CdwCDoqSp4fs1TjPxh2EdBOQNHs/7mvDbNa98eVLFGaL/Q0O++VLddxe6Ytz67TiSFC497ZhVt
	1KRgPrcRhYb7c8aWm2znpt4YKakIgXn9K+cmSywcwZ6npZYrt55JwFqHlfdIZriojVVftotO8G0
	K7c7YAUo7qWOGVGFNZoPhcNGlVb/s0j/WZUsXqroe0/T6r1Mu4p7Vu0s2AUNKZfMYvkUKFBg7oQ
	TB/foFVALi9arYMj3exCyKVUWA+6kLEN/SlIHXKK5ypoOfCo2HhxBLAhbTVNtjI5xe9wDwhHsB+
	RhG4jDwTC5A5G5Fg0dt1INRfrfQ5GaBIlMwAFLpzsP7n5XPyUR/TKzXLBMShvEkTaQrArNqS4Ow
	POp8p/+qk0CMY7B1g=
X-Received: by 2002:a05:600c:b93:b0:47a:94fc:d063 with SMTP id 5b1f17b1804b1-48370e38ba0mr147624125e9.1.1771336712310;
        Tue, 17 Feb 2026 05:58:32 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:ac3e:d4d0:5059:7047])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48378b5196esm129721775e9.8.2026.02.17.05.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:58:31 -0800 (PST)
Date: Tue, 17 Feb 2026 15:58:28 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
Message-ID: <20260217135828.4hgbyhnz5nuzm6p7@skbuf>
References: <cover.1771258407.git.l.scorcia@gmail.com>
 <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_075158_517999_7270BC9F 
X-CRM114-Status: GOOD (  19.59  )
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

Hi Luca,

On Mon, Feb 16, 2026 at 04:22:14PM +0000, Luca Leonardo Scorcia wrote:
> Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
> describe it as compatible with mt2701 instead. It is safe to do so because:
> 
> - Bootloader doesn't rely on this single compatible; and
> - There was never any upstreamed devicetree using this single compatible; and
> - The MT8167 DSI Controller is fully compatible with the one found in MT2701.
> 
> Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")

Not sure which direction this patch will go in the next revision, but
(if this patch remains in this form, and intended as a bug fix) please
do not mix fixes for the current (and stable) kernel with new development
for the next kernel in the same series. They are supposed to be applied
to
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=next
and
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=fixes
respectively.

(also see Documentation/process/stable-kernel-rules.rst for what is
generally considered to be a bug fix. We don't use the word "fix" very
lightly, there needs to be a user-visible impact.)

To help the build test automation select the proper base branch, you can
use the "phy-next" or "phy-fixes" git subject prefixes when generating
your patches.

You can send fixes at any time, but please send new development for the
next kernel only when the merge window isn't open (unless it is marked
as RFC, then it can also be sent any time).

