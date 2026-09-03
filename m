Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62ADAC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 04:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ESwlNjvZs7Wa/B2Z+WZbhnploP2cGr2N9OS4nSRjKU8=; b=GTu2gTvX4AhB31r5txtXxiKOR1
	iqILm65Pk5nEP2yuwXVVMHWSYl7/XAxtLfyu54w1vYTBbWeZyTHlyCrtZjOXfhLmQzCLl/em8/m63
	m09FOlny1VT5Ie7icmxZ1XK1oVMamGYVzWwDx6cN7iFGzdYxM85E2Y21zeff6l8anB9pewiqkR2fV
	kw05F25Yl9sXMa8K34LnZiWSQvo+aXUygBGzN9zFIicnyA5SZHu6DW3bL2iYAQDSbamTXWbpWeUm6
	RP6zrtDUKTKtLfukvFEIFATDEuHSuc/r8jiYVCYs34Pwr+nNfYdzH1j/te6qtt2UtFkapvOcNu6SL
	aS4EbHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRP-0000000GLWz-3Y06;
	Thu, 03 Sep 2026 04:52:47 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRN-0000000GLW9-3YrY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 04:52:47 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso2264531a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 21:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411165; x=1789015965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ESwlNjvZs7Wa/B2Z+WZbhnploP2cGr2N9OS4nSRjKU8=;
        b=sYrm27thMMcxTb1Su+vsTtzH7yZz2+yMEhMYH+gvqFHwd6eyB5u3NK+n3SgDO0/cPA
         dUGD2zGCN4iak6KDb491glL1HF1Bxq2OcIN7Lg8rb8QiarbTIG2Y4Km6qk0V3WRy4fEH
         v3WsW8UQcIniLB9sWmJ1Eiy3KWxe8AXIpLH/CaRZ+zd956D8b0J0uFi2oWcXxSpaICok
         a+zfWbKqvfKyT+f5H+Bex1ocIfgZZFAaRdYBhwz7WsCqmX6dTfXPX9jU0aeLAZwf3tjw
         /EHx+DenXygp6DDZKu0km9WKAJPWFwW0rg3SYLyytyz7VcKDMIdho2YbwEyiPbKMe7vi
         wFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411165; x=1789015965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESwlNjvZs7Wa/B2Z+WZbhnploP2cGr2N9OS4nSRjKU8=;
        b=qvtMhu0QqfE0tDkmgcTXIWxTwx5h+1bFSqcj0mybOxblIULDXnhmtqrsVxk/IIn+5/
         dVj0XJF27RZBvlwMGJadg5w1jcLG5MDzpboO+RKGox9jMg7C4AZ+Oxe1Juqq9S2nPg6P
         wwd+hrE/vT4B6CE/UaQStti1MuXYtc03ddgfmm3adFJSUNgQLHqi/sIhppXo/ruqfOxa
         7VLibpMF2hRVDF6QuRS6bbhnyz4b1sFJmM7V/MO/79VoP3nj8X53GIo9yPUmu9uCCbkW
         lq8/kZRDVrbRfWck1aYLQijMyN5Fb/04pJhFnU6qaNXVE9EQ0fw76KeY3ANfSiOPJpJ5
         MlgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxR/qttQC9E6QWexoasRU+HHhtnZalDE2QSy0Dp8/86j+OU2u1uHUJ9jVNnEVRmG65T35zZyrkkFMytCtXcwMd@lists.infradead.org
X-Gm-Message-State: AFuF++kYSuMUVcwqSoZDNZ031uPiF8bqk8h+LBPCzoXsjL5ji08Vmi8I
	1mYAS+AP3VHn0gEKjxfjrc3RLddfqW35m6RgWkZH/mqwKPbPB6FLtaCg
X-Gm-Gg: AYBFou1r3iAhLzBLs+vqh9kzMCvr5dTx/HwouYS1rIxqTj0aFOsEgbnJpI+hyS2fG0s
	GmuLZESIVzPfp4Pot+LnKQD1GnCsvW95lgo2xkHEA6Mk6axGQKPGa8NT/Ka+H9Uf0ZI0PswdPF4
	8nILNLCrXKAzEMqo4sxAxXtaYk8fGmBstQhnbKwsfXN4C6JIAhzrE0OPX8eQN/GP0Q9H4NLWHQF
	Hxj01azcw1ox1o9aC53lAawmEXL1GcA0GVyx/xXpQHLnwIdxXRblmGTP0KW3jIW9eqVZ71Y+e26
	0m7lIPKb3fhHPkMxub5ihErUr2vgIqdQyjqxWrmGq/I5045J42aKtpQWD6yl/Jj93SSBKS1TF0S
	/++qyVLHf1/VDvNAVgVlSh5Xu53P7PWk1L6AHB2SDpHhfsuD/CNhrDIAg+FqYRLK2LXtUsmLjsA
	sKCemeis5WgsTmkbqq7rOb05zip3iD0M916z/iduj2qfg1jmdXc796hk6rU3bYKFHPIj9F9ZrP6
	Czp/GJWEQz9tn0kxLMyg5TWoCg0uckJ+LLuVONX7K5wxneUIFQ+ZycAM16t7+7ZCJjxgWAtXnUo
	Zd9Y
X-Received: by 2002:a17:90b:17cd:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39aededf539mr13392201a91.6.1788411165011;
        Wed, 02 Sep 2026 21:52:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 0/5] ASoC: mediatek: mt8183: Fix clock error handling
Date: Thu,  3 Sep 2026 11:51:58 +0700
Message-ID: <20260903045203.175337-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_215245_890510_7D109A41 
X-CRM114-Status: GOOD (  11.42  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes and cleans up clock error handling in the MT8183 ASoC 
driver.

Compile tested only.

Link v2:
https://lore.kernel.org/all/20260821122928.41343-1-phucduc.bui@gmail.com/

Link v3:
https://lore.kernel.org/all/20260828050526.590761-1-phucduc.bui@gmail.com/

Changes in v2:
 - Remove the redundant error log for apll1_mux_setting error handling.
 - Add Fixes tags.
 - Add a cover letter.
Changes in v3:
 - Add a patch to fix clock handling in the mux disable path, 
   as suggested by Cezary. 
 - Return directly from apllx_mux_setting() instead of using a goto label, 
   as suggested by Cezary.
 - Add a Reviewed-by tag.
Changes in v4:
 - Add a Reviewed-by tag from Cezary.
 - In the mux disable path, remove the goto labels so that all teardown 
   steps are attempted and any errors are only reported.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent()
    failure
  ASoC: mediatek: mt8183: Fix clock handling in mux disable path
  ASoC: mediatek: mt8183: Fix APLL enable error handling
  ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
  ASoC: mediatek: mt8183: Drop redundant probe error messages

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 31 +++++++++++-----------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c |  8 ++----
 2 files changed, 17 insertions(+), 22 deletions(-)

-- 
2.43.0


