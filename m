Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D815C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 06:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r/zXGRLIz4Gqh+3fWrcMyrCUW1b5XnY6IMEL3+xJGM=; b=YNck6t6PDq0aYEYIXgUpf3rf07
	oBZkuJxIOTMlNchZvqm0g3cXn3IW5vKK4EiOWIIXLozHxQDKnCihdKOMYpzIj0QKm4apxz5AMDaB8
	m2+Uqg4JYpiKQFUSci7FiDD/ek7Z/ObgkWTnHIhO5HWyWlAxhdQoIXuVowLv+/+0cRdvXZzXehbfg
	P4qZDKzs7kk1VIAIiCIcUzrqhwW3Rk7cYlp5YCW1xAgrbCXrLVODYHx0J+/VNHhA3IbRkGlst+xql
	Zxa0cIknV0o6Q1zW64ml0FQBv7DeqbKay/9RTBvydOdVp98YP4ulsCOHamya2tb+Wk3+AS+6Dm8Q8
	XhH6YggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HQ7-00000000aGM-1JeL;
	Sat, 12 Sep 2026 06:41:03 +0000
Received: from mail-oo2-x01.google.com ([2607:f8b0:4864:31::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5HQ2-00000000aCg-2eHj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 06:41:00 +0000
Received: by mail-oo2-x01.google.com with SMTP id 46e09a7af769-7ff1e112113so259037a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 23:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789195258; x=1789800058; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2r/zXGRLIz4Gqh+3fWrcMyrCUW1b5XnY6IMEL3+xJGM=;
        b=QiL/kbGRcMD5sM+g0ST6oa3BmyrDzKn01JRS9e/ckMmUr+9JvhFb4Yoqjxmy/Q0L0O
         BnaxZu3g9oLQzf70LeCDkFdRLcbiTjqQEJDRA+WyXl4XMd67zRkTJvkveB2CUDP/iIeC
         tUkQyKWKxf4rh1bm55Bh+neLgHHiV8O/MvrixP0FT5Oa5Qqw4SWTtb1zR9rV6yGRg8u9
         ZzXyiFmSIi0SFp+xTs7rTpx/gklmshpPJa4CEm1VpcMtd5TttGtOCbKanKttdx6eKKLr
         zgv9GAGi36kKSorx21xXWA0vpfDFAqpsZKfD73/uh6c3mfOS6NBWXbNYonj5557k66aS
         u8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789195258; x=1789800058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r/zXGRLIz4Gqh+3fWrcMyrCUW1b5XnY6IMEL3+xJGM=;
        b=Af3WiRcs2mg4mhduspxCYTvBlkSGrANe6YLYaX4vpzCJmsiJUwGKmw1LnPx3CcBA+v
         90Sv44Xispt1A97/HIYyH6+Y+K1IIjCi/YFR2Wnc4tygS5UEPbaE4r+LL8eQEK6FhGO2
         GYNZm0Qj9kAluaTzVhJpjS2z15ArjkyI/sSJzVYBNZXTHWy7eDoi1N4/LI4KR412+kFI
         KPwc9QkqjDlF7+LGgk00IQ2Rqpmd6ztKS+m67jhhH4iWKVdCuNO28Xg0wE3GqR3mRaoS
         uNNhHmkC9sFf7kEH5Uu9yjZsDD/F8rKGQNyayM+Wiq8OKgSq1fmRfaWxe5zIeE5R3DUr
         FoJA==
X-Forwarded-Encrypted: i=1; AKwUvBwYPCdbIYo8PiLFP5G5VTNKX4EXxx8LCmbzHAfvZQKRcljIECOa8zEIgFwrjsin+ec3hVWU/YxA1Ghwnc6qTGSH@lists.infradead.org
X-Gm-Message-State: AFuF++nwgcUgpoahHAlLpKKHwwd665V6vGuXSy0SY6WLr0oaR0sEGJXS
	GcNH2l+kSSJ9XqZ+AmSrwzV/VzAgzOJ0GdJriTZ/M+hJ1xowvWUDfACN
X-Gm-Gg: AYBFou3+97a1dOL9LN9H+DbTn2beT8JvNsp1wnFhReM9sbVhoTZ2Rk/KPbVpZIkLD0z
	9qcYIdYrmBxoeeV8rFNkvaRq/xk7WPWGUuUsUrfEK1jf82zb1KbENhLPerafatGH2JUuVofBqYv
	bppskT016GuHtsPXcqlJDa/04opdwbuP7wnWGg9q3mEij7IBnUXwF4MsYZNJDhfzkz9wMHDmAa9
	wprwESzFyxWx35OrR8VojhWScH4Q8rwDHWv8ksqqJY2lbLZne3dM4jC9am6nqL2CHv3eLJ5qmD6
	VUpGbzQYx/wl4pUGVchtyI+lpgQZnPQ+K6WTp4CsbpSBFVI0kmoOzDdWY79Pba9McWkr7E0u9mZ
	2Rqfld6i0ZWCDmVnOw6reji2GjgAfGQiu1Ok179H5LZiBacw0uBVuRvy6JdJVIGhYbL5e4G0kiA
	WWXEeX6EPklZEgSA0XGL0JoqYDb9Wsa47yDuQs/1DoNiM0RenlTLv3Wdn8nbuBCMXDhlg=
X-Received: by 2002:a05:6830:dc6:b0:7fb:547f:98bc with SMTP id 46e09a7af769-8059e14b758mr1096817a34.5.1789195257717;
        Fri, 11 Sep 2026 23:40:57 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f670ec82sm4932735a34.20.2026.09.11.23.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:40:56 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sat, 12 Sep 2026 01:40:37 -0500
Subject: [PATCH 1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask width
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-mt8173-fix-dds-mask-width-v1-1-3d0c0292c85c@gmail.com>
References: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
In-Reply-To: <20260912-mt8173-fix-dds-mask-width-v1-0-3d0c0292c85c@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789195251; l=1697;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=rK3LI6EEJl+1gc/J0Nqb7f1MnKq7lREyQo2mSnW3Hpw=;
 b=aEEsL7VWo3CfcnRgQNR4pSp2BW0HTS7IMmCb+Oc21O48+SIoUTLwp4mzW8r7juB7bII0JxlDE
 J6mym376UJXBuM4QPyxPLfo+9VhIWv/sGKsTw5ZFgYRdJ6Q1/Kq1x2Y
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_234058_679645_49C038EF 
X-CRM114-Status: GOOD (  14.28  )
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

MT8173's hoppable PLLs have pcwbits = 21, so the FHCTL DDS field is bits
20:0, but FH() declares .dds_mask = GENMASK(21, 0). Bit 21 of FHCTL_MON is
a status bit that comes up once a hop has settled, and new_dds from
mtk_pll_calc_values() is always 21-bit, so the poll in hopping_hw_flow()
never matches and every hop runs to the 1000 us timeout. The PLL does reach
the requested rate and clk_change_rate() discards the error, so the cost is
1 ms of atomic polling plus a warning and a register dump on each rate
change.

Six MMPLL rate changes on an Amazon Fire HD 10 (2017) all time out with
GENMASK(21, 0), MON reading the requested DDS with bit 21 set, and all pass
with GENMASK(20, 0).

mt8186, mt8192 and mt8195 share the constant but are correct, as their
hoppable PLLs really are 22-bit. mt6795 is fixed in the next patch.

Fixes: 45a5cbe05d1f ("clk: mediatek: mt8173: Add support for frequency hopping through FHCTL")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..327240cd34fb 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -100,7 +100,7 @@ enum fh_pll_id {
 			.fh_id = _fhid,					\
 			.fh_ver = FHCTL_PLLFH_V1,			\
 			.fhx_offset = _offset,				\
-			.dds_mask = GENMASK(21, 0),			\
+			.dds_mask = GENMASK(20, 0),			\
 			.slope0_value = 0x6003c97,			\
 			.slope1_value = 0x6003c97,			\
 			.sfstrx_en = BIT(2),				\

-- 
2.55.0


