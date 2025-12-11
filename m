Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B88D4335F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 23:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NbD172mHC2Ryq1GOWpDAGfx/N1dB3vFXjgBCreduXmM=; b=YWrKrWykTfQyF3Y83eVPQoyuiu
	7iAFR1Gm/exBoYrMlUktc41srrHTVb4iLcX0dsiJPwMi/xJ+w3V8LjsCB4CUKZO0+8Hcp8DSGOAfO
	jCGToPIHEJelhEzlPXUOeSxaQsEWBv2VYBurK75FqiWHV7FU7Ipj+nip9DWPllHA8zp3clelqGARs
	Npdf8cj2TnwGBpbym5d2BwSZdkz3jck3yYiC/V/ZekCUjWYfMnHEgj2vOZrbcLmwr+AsDR24MCcXg
	RKdGHo6J4YM/xFT00MTJfLEXUdUDetoM2mAIeR9jdQmhEJ4jxGCYR8rasIW0HnYilNzwBQZQNX1Hb
	8lNXuRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpsV-0000000HO8v-3CNJ;
	Thu, 11 Dec 2025 23:15:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTpsS-0000000HO7U-2Uxh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 23:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765494915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NbD172mHC2Ryq1GOWpDAGfx/N1dB3vFXjgBCreduXmM=;
	b=JyS6NMeicUUdVmgoLsbeTKCip8akYGv33gd2CIDfDjsEUOzagCc9rVvRMMqO8X7VeVWpCt
	8OJ+8hEVPKJlTtkpqx0WcRknJmRGP02HegiTD/iY/JkCu+V2Yo4j1iZ11AEJnUPFQRsgAj
	pL9nKfz2YS8Sko2k/AV58+bUA5l7GJs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-K4D7KKPUObuAWkIImllKsw-1; Thu, 11 Dec 2025 18:15:12 -0500
X-MC-Unique: K4D7KKPUObuAWkIImllKsw-1
X-Mimecast-MFC-AGG-ID: K4D7KKPUObuAWkIImllKsw_1765494912
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b29b4864b7so130173685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 15:15:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765494912; x=1766099712;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbD172mHC2Ryq1GOWpDAGfx/N1dB3vFXjgBCreduXmM=;
        b=waqJuEkCxrWEdexAliseJ27OjCF1VkP5XGfV0q/fwLQZ7sbFSt7WuS0xzeuJsE3fKa
         LclUn+5XABYsmYFaWhb96ehhUH8ljb4IFh7vJEC0BedGV1jXy9PalujUMN+zkvHjaGhK
         yPCKahD2FATFqlIHW9z8ogI4ooS5H5UCbwc63WG/gx/NxkFkeVN/Sqck55iJ7k05731t
         NmV1KuqKP/paYiJMqVWx9oARefjlx1hR/bfM6JQ2OIhNQluagJr1l74PH9Dvv7CAVQ4u
         m8oz3jzsUfD8WLLmjRA7znKR0EvV0GU2Z2pAGgqC2gIsnfj2dWQ8DFzXMS9wEeytnSJR
         U+6w==
X-Forwarded-Encrypted: i=1; AJvYcCUajDfMMCNCgSzhmc6teEaIHh+4jDXX/Bqae//v+SwRO3bXv7uk9e77+/Znm67v6ONwW1wu3DwqbPIcz85KBsmp@lists.infradead.org
X-Gm-Message-State: AOJu0YyUadRbqwVXcSJvj0N8TUe+2OuUY/QdAPJWXnvZe0lobD1HQYi4
	bI6os5NfY1L1tc3Sih6G308Xw5ObMd+tVoy2MNNQuPOFM3NoOE9iHHDn72OVQKK2u32geLq3/+l
	sJDIh8KEwh10WI1/Xez/174WUTUABFqrQRmrCWu8TDxX3FKb016VVemumD4sEAnIPF0/Bla7sh3
	kb
X-Gm-Gg: AY/fxX6RTHnT84tC8P2KEgEda3YuTCwHtcoyDnKm5kYMNxOpw6IIJ8PApKvj1nnSq8u
	ycq8Rm6nkdbjmlAHEpdkaiWX+a/YJcixCme2TtSOilr2uIfHYfks7/IALE6HxlZugJfVc1azjue
	iyxxURDPNqpiud8FP1rF5KwpKBIyLlMNSWgXnmzlnSNT2t1s3XkNx2YKNPycLOaOodO5TbbMyT+
	0d+Lf4IH8D9IECHNLuCeJTDO2Io3U+BqEwL1MTTTx98hRKYZ/bvibb8de8rfX6vkI4Zy0NwaJZX
	tG2hAkFzdpD4wX4Umcd7Tx9avU4N3sacFUp+vlJ7rfyxJq+gQiuqyCVWuQ7+D1tGWj5q3dMQZ4w
	3E7EWtWqGnpmHUyrwPOxuidtEKcsU1SIg+7xaunnHRsKhwvgAQQlkyg==
X-Received: by 2002:a05:620a:4508:b0:891:bcdf:83dc with SMTP id af79cd13be357-8bb398e1c4cmr33951585a.34.1765494911899;
        Thu, 11 Dec 2025 15:15:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEhR+rl7YR1fq3Jbq9SD391TPQFkBJmfXp3Gj+BgCY0CdZmgYTQ1v2SmnRHgiTWvmPBSjsfQ==
X-Received: by 2002:a05:620a:4508:b0:891:bcdf:83dc with SMTP id af79cd13be357-8bb398e1c4cmr33948785a.34.1765494911456;
        Thu, 11 Dec 2025 15:15:11 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5c3bd3fsm325234885a.28.2025.12.11.15.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:15:10 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v3 0/9] phy: convert from clk round_rate() to
 determine_rate()
Date: Fri, 12 Dec 2025 08:14:44 +0900
Message-Id: <20251212-phy-clk-round-rate-v3-0-4fa18b61f521@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7ZhSEcSV9zAsSpnaRm3JFBsJ4
 e5W3Lp8L/nvLxCJHUU4FwswJRdd8BkOuwK0Vf5G6IbMIIU8iqYUONoZ9eOOHF5+QFYTYaVUQ6a
 shaEW8nBkMu69Ra9dZuviFHjePpL82l/u9D+XJApsy1pWjej71sgL02DVtNfhCd26rh9mQSQJt
 QAAAA==
X-Change-ID: 20250710-phy-clk-round-rate-4aa7ef160fe9
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6172; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ZY0h85yve8h09n3VMoGeby1rYSEr9a4xEaJTa8s51lM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAypM8tRDs5f99Dnw7UrK3fyLqyJ5o95+0VNQaXf/L
 vMt2ka+o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgInM6GNkWDfVdAPLEoGHB3Wf
 /ruVEL2MtYB33TEOs++bZKfsvnTtcw3DX4n32/fVbF4oOCf65uN1s3MuXTnI/nT7mq071x8O9ut
 KnMMJAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UhjIN3PtlLvDjWV_8-rP_b5aqZ34GaFxnyYamSqis8E_1765494912
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151516_699222_13AE9D70 
X-CRM114-Status: GOOD (  16.26  )
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

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the phy subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Changes since v2:
- Patch 8 (phy-rockchip-samsung-hdptx): fixed merge conflict so this now
  applies against next-20251211. Cristian / Heiko: I kept your
  Reviewed-by since structurally the code is still the same as before.
- Link to v2: https://lore.kernel.org/r/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com

Changes since v1:
- Patch 8 (phy-rockchip-samsung-hdptx): fix returning error code
  (Cristian)

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (9):
      phy: freescale: phy-fsl-samsung-hdmi: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt2701: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt8173: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt8195: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert from round_rate() to determine_rate()
      phy: rockchip: phy-rockchip-inno-hdmi: convert from round_rate() to determine_rate()
      phy: rockchip: phy-rockchip-samsung-hdptx: convert from round_rate() to determine_rate()
      phy: ti: phy-j721e-wiz: convert from round_rate() to determine_rate()

 drivers/phy/freescale/phy-fsl-samsung-hdmi.c      | 13 ++++++----
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c        |  8 +++---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c        | 16 ++++++------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c        | 10 ++++----
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c    | 10 +++++---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c    | 10 +++++---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c     | 30 ++++++++++++-----------
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 15 +++++++-----
 drivers/phy/ti/phy-j721e-wiz.c                    | 11 ++++++---
 9 files changed, 69 insertions(+), 54 deletions(-)
---
base-commit: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
change-id: 20250710-phy-clk-round-rate-4aa7ef160fe9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


