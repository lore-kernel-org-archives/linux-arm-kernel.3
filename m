Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43E2C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bJjHs4K3u+gvdjbfOs0Xg8GRiY9vzGbZiOJ805s9gPE=; b=x07PKrEUSLLgjajWh1AudHDzs3
	VJ7EbTDdB9LWwI02lWIUe1oCQavetkgfCwKalD+55v7q+k5cW9M6fiOO5dDXHfL6stkVkLpKdY6Ec
	g39nY7u7r2+6qnjf9Oq6krlPPbS7sJnocJdC7NC6tJO6qZ5UqDCJcYCAXQf41O5sr4pf85KqsZbO7
	jMuiDbAnLpWxM7IC07XS4cpho9VqlHrNpjA5YV2UXy6I/fLt7eNsStuSQfaKD31nNU7NN5oD9sde0
	EWlnZKL0wQJzV7am6CgDm5Pnkkm/3XZMUpvMIyf17UXcpiW0YDcDrG3bR+Wrq639/QAtQMhwIMMy9
	6bt0KRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cMs-00000001wH2-0fSA;
	Mon, 21 Sep 2026 11:39:30 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cMp-00000001wGE-1IKh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:39:28 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e66390995so15143505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990765; x=1790595565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJjHs4K3u+gvdjbfOs0Xg8GRiY9vzGbZiOJ805s9gPE=;
        b=BZ9Np9kR+pY8wDQ3o8ZgV/avcqOHN2COuOXhW1pVxP/jKkXiiVmr4p+iT8fosTWBIO
         GVYzreWYAc6jTk2QAJg1BnK0diPcGcgNefwEKQKHpAF+7BCMImPjjVYDu3UAz7dxvEc5
         6aDT+b04na6XOU/rlx3UHQ0e0h661PDS2lVRuVGk99i4wFxfMlKtuijLTG9utRnhvAVk
         ZvHazQNq7yIwm8XBE6Djnjs5tKXWblibnnuT5//z7xyZkBRMwg3dAPQvQ2/wbijXR/wS
         sfMQYSTAx82i9PiXHbe9Nc8wiKCl4Rf+lyX2Lxv+gYXyUt1tIsJJ5KHvpOw1Bm2NcaqL
         h7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990765; x=1790595565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJjHs4K3u+gvdjbfOs0Xg8GRiY9vzGbZiOJ805s9gPE=;
        b=qaCmq82vgwInAFRGpzujwohSbgthSl8vOSi2NOcgda36pF3p9uO2lslVmji/1J4kID
         1Ysp/aJSl6VYjbxF4zW6TlMBWHTRFzo0Sm7cywfqnMneu8iPSjoo03fDXfmukWr87Fi1
         D9Vvn5MMQ194uo67NAgxRAUtXbG1o7MS0gsb/+ESZCDJ0n/5+SmC2SPrS35K1AF84AhD
         B5FoVw/Ei60mLjNatrwdAoWORxjXi5PsnS5hf0Y5XaYkYu7A4NgG/Ypa6+RYjvKtIizq
         pLWHcfhICKWHlqCgpSIVxX3XA+tOCrGYx6dfeoKs1811WSPwpvaKbKgw234w7cJkug2h
         a9eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqdvcOe3as0czcDW68swhuATxnU9JIhOO8WDdr73TngwAHa48zH3h1rXMM7AweVYtpKoa4lfwnGBdSUaWW6Ul+@lists.infradead.org
X-Gm-Message-State: AFuF++lZTh2gyT2Nt+bXrnxNhgEeQUGzgnZF4MWjVXoT1fLWicAlnD+F
	svSADbmuOfI2XZm8NnV6HfBzfxTH9rNifQQqlTvXvyPqyPZNRHm5nOAB
X-Gm-Gg: AYBFou2Fu//8ZT+6iQtk/4er11/cpWYZR9nKZ4g0koNLfUk0XrscYn7QVMMtkAcqfWL
	Y9Z/UOCZaF1+ZI17jhOFLF8peJGogZFSyCb5uOaKBjUdC16gl4QquV6wWEbwqaJlC5lTw3R897B
	zOmfdeXpW+x+vDoDkf95oIzFBDeeIBFLZ7cd/8+TAlwpLkgv3slr9Tqm9TArI8cPVr7JslCskko
	E3MpXVfAPP6SMmueyM+plO4TitRDct4XsEawws8HUHI+JEECbJzS7U0ngZfZYM2hz2LG0lPguZZ
	b5r9rqa7cPozd26PP6vWWIJMr7koh1jUuRlKlKyYGFpvBceoGdxCldV1YZ9cKqeF/+Cp3jG2b7b
	lEzqkg0jQVdRtfGcj3KYgP4cbRUZVimfKQkf8vuZUFv7jaEWWE1moOK12UBilhkpoDQUoLq2l9M
	Jm0xyRmjsKULgFldr7Uj5Edtaf53klHAlnpQJSZghMqo9CzptnHnaTgDp/gWNhza6Fi/1/HKJ6d
	Tntbg==
X-Received: by 2002:a05:600c:3b8e:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-49fc57144aamr185348875e9.8.1789990765124;
        Mon, 21 Sep 2026 04:39:25 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm244273865e9.3.2026.09.21.04.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:39:24 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] Add support for the mt8167 display pipeline
Date: Mon, 21 Sep 2026 13:38:54 +0200
Message-ID: <20260921113914.779393-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_043927_361081_B1DC606A 
X-CRM114-Status: GOOD (  15.63  )
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

This series adds support for (almost) all display blocks of mt8167.
This SoC supports a DSI or DPI display and has HDMI output via a second
DPI block wired to the HDMI phy.

All the hard work was already upstreamed in the past, now all that's left
is some glue. In the first two patches we add support for the DPI output
blocks. In the third one we describe all the possible combinations of the
SoC display pipeline and in the last one we add the required nodes to the
SoC dtsi.

The final outputs of the display pipeline in the SoC dtsi are
intentionally left not connected to allow board dts to specify their
own output node.

I said almost all display blocks because HDMI output is not included in
this patch. I have it tested and working at all supported resolutions, but
since it needs some fixes in clocks and a new phy driver, I will send it
in a separate series.

The series has been tested on a Lenovo Smart Clock 2 (DSI), a Xiaomi Mi
Smart Clock 2 (DSI), and a Sony Playstation Classic Mini (HDMI via DPI).
Unfortunately I couldn't find an actual device using a DPI display, but
since DPI1-HDMI works, I feel confident saying that the clocks divisors
are correct.

Changes in v2:
- Fixed some copy-and-paste error in MMSYS routes spotted by Sashiko [2].

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260918175736.355305-1-l.scorcia@gmail.com/
[2] https://sashiko.dev/#/message/20260918180358.81A1D1F000FF%40smtp.kernel.org

Luca Leonardo Scorcia (4):
  dt-bindings: display: mediatek: dpi: Add compatible for mt8167
  drm/mediatek: Add support for mt8167 Digital Parallel Interface
  soc: mediatek: mt8167-mmsys: add routes for all display paths
  arm64: dts: mediatek: mt8167: Add DRM nodes

 .../display/mediatek/mediatek,dpi.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 369 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  23 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 drivers/soc/mediatek/mt8167-mmsys.h           | 193 ++++++++-
 5 files changed, 579 insertions(+), 9 deletions(-)

-- 
2.43.0


