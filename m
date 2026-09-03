Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83CDC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cBr8HRxr2IvFH9jg6UhnzrGvkPEyPmptbNqlHpdb1vQ=; b=FbeXK68D9u4oRLgbr+tyrKfeZb
	skGoIk2cLREOTGJ+cAMMXQH1ZLn7mzyOOF9yVrzRmvAHIaUxii7K55XxHwpd0jGI0whmfp/3nn7v1
	ug+AeHWwIfhN3k30NztUdEcHjbCnF9JkrMhGJaxO7gIAmzzTZNr4nEONtQM6IhsY6jb8aid6RQZTg
	G1YIZhJ4xS6nJ4fwIRCWqngIjCaA/HWhkHIn1fIiTGr8+RaRRlJmuHFR8Tas8VoxM2oA3yWqp6LmI
	eFH2wHEuiG+6VcVgGevU+lBc8oFa+JcBnp3p8v/El4JtCLhJkm6TSDdIfN8dEs2L1MoEvvpDhRoOr
	j+VoaCKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkD-0000000GMm2-0i0B;
	Thu, 03 Sep 2026 05:12:13 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zkA-0000000GMky-1Qlc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:12:11 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso2278250a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 22:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412329; x=1789017129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBr8HRxr2IvFH9jg6UhnzrGvkPEyPmptbNqlHpdb1vQ=;
        b=o0NAJA7+C16A9LRMfEXFB6OS9FDJaFbPF1WrzLsjhCL/drVeJaECQ3GnAlemDywd6X
         TGnNZ4sYO0iQFACC03lQ7CQli2wQ5/iAHUNFeclqeWTfV3zNg5SBFDvClbabjhOjXdV2
         YrT40Aea8tEOrveR7eT11Kq/KAaNcXcy1qA75p/YmhPvGuM4x65VFbz+l6KD01QFgRGs
         PWfCx09DSTEkV7GUWYk7DgB+irEptdieFPUohroCEr9oJnBNFRK629IusEjY3hQvCVGl
         zfh0YvSjDaf2BCzuGkEhiZ7iZokJ6obBZxjTPL30Mbtng8qDhY37pUhKOIz1340sjpZJ
         g+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412329; x=1789017129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBr8HRxr2IvFH9jg6UhnzrGvkPEyPmptbNqlHpdb1vQ=;
        b=DTOAI3Kq2LEjWLXyQElq7mdOfhMFHMRT6g6l95QSxLAx5sq6nUnX0lPgAQ0RyKG1Jo
         kStqfSz2AjnkWTPyEawFO2CBYQX5Qek/uhRayjxivfsmpUcf+zxkWlxwRhDE0y/5qyjU
         QmgrLsdm1YTMH/2BSRQfadZqvTVMONi7cafRwV3tga3US4cjgjET4Wl3W0/rxKbQam/b
         DUfgKnQSXtUWYWkqk/0YeGu5C7gqYIQ+/3khP4PDRrjY/sAhWcO8nSHZ6T2985D5xk/1
         83fUl/EO2DRj+UdQRKzQrEDajxWKtH3H6SEJLa5BGGv7NR9HarVmsZJYHZiFw8DJNfgl
         kOEg==
X-Forwarded-Encrypted: i=1; AKwUvBxoBrlm2QoJLqsmBqZWN2c8Ua6J+CoCnOcldAblpWXvexWr1RkkNeXtuGlKmqOh5Xjyzt22QRYh5MCjf234Y51X@lists.infradead.org
X-Gm-Message-State: AFuF++m9TyXO0G1oTZALOE/Ej+Y1m8UNZFEl7OyVzvmfmsLx9UKPy9d+
	o7xe5bOC8OrBpZpOgfymow0Hiuv0du+I+vKjuhNwHdwuC2XC836JBi7S
X-Gm-Gg: AYBFou0oimTqJ/ufq2PaVGZs7GUcCodPRjHUu0InxP/ZOMtE5pp5hPGlx4yVgfXhS3/
	lUbYNtuJx+s6Sl4aZSKbxSiCWF2PsG9/+pcHtVJHBpDbY8xVEraZDrN5SOfrHBIdMRaHRSsZgtM
	btIAMiM1TRRssCDZatpwQn9ED45ero05QTnkPpO9tB7YMo7aFiviJe5VyFMih2TdRYkd7rVhtww
	nozZuP+2QPrXY3KCyIXzXLIQ5iU8KVYcNXmz/zWLYXO6RN1DUz0O68doSzJkUeqlse+m/UA2c8f
	cHndOUPFgotFbU0QllZi/Oh37DFArMKtrTdI1o4fbOY48/cCqA0GtpeTXlZUifWH9LmnOqCOpV4
	UzeddsT9WO5WPuH/lkOipkmk/sPVFWQh2scPYcvUluXl2rUuDZ0gisGsOeGgrUZnUe7827L2o2x
	DnF9MjFiWsx6v7xh3A99EE8wt+ULF+LQeSur5ZE9kbBQnNbjzkbSDvt7a40MQ5BfwmbuhnSL9xh
	gb1SUd1rI1lOAbg3Z9VaJRlPQZ5CNA9lz5ixVLTp/DR3npdcQTvnG2Zw11WP/s7JW+AKYnv1ZWF
	nvYb
X-Received: by 2002:a17:90a:ec8c:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-39aee04ace5mr16394737a91.16.1788412328628;
        Wed, 02 Sep 2026 22:12:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 0/8] ASoC: mediatek: mt8186: Fix clock error handling
Date: Thu,  3 Sep 2026 12:11:42 +0700
Message-ID: <20260903051150.178057-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_221210_435799_494E8B02 
X-CRM114-Status: GOOD (  12.46  )
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

This series fixes several error handling issues in the mt8186 ASoC driver.

The patches mainly address failures during APLL/mux, clock, MCK, GPIO,
and regcache operations. In particular, they make sure that partial
failures are handled correctly and that resources are left in a
consistent state.

The series also removes redundant probe error messages where the errors
are already reported by the called functions.

The changes were found by manual code inspection and compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260820111253.97866-1-phucduc.bui@gmail.com/

Link v2: 
https://lore.kernel.org/all/20260821123021.41390-1-phucduc.bui@gmail.com/

Link v3:
https://lore.kernel.org/all/20260828091532.600047-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the cover letter.
 - Drop patch 5 from v1.
 - Add Fixes tags.
Changes in v3:
 - Add a patch to fix clock handling in the mux disable path
 - Return directly from apllx_mux_setting() instead of using a goto label
 - Add GPIO rollback handling for partial failures in ADDA DL/UL.
 - Add Handle failures from regcache_sync().
 - Add a patch to remove redundant error messages from the probe path.
 - Update the cover letter.
Changes in v4:
 - In the mux disable path, remove the goto labels so that all teardown
   steps are attempted and any errors are only reported.

Best regards,
Phuc

bui duc phuc (8):
  ASoC: mediatek: mt8186: Fix APLL mux setting error handling
  ASoC: mediatek: mt8186: Fix clock handling in mux disable path
  ASoC: mediatek: mt8186: Fix AFE clock error handling
  ASoC: mediatek: mt8186: Fix APLL enable error handling
  ASoC: mediatek: mt8186: Fix MCK error handling
  ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial
    failure
  ASoC: mediatek: mt8186: Handle regcache sync failure
  ASoC: mediatek: mt8186: Drop redundant probe error messages

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c  | 95 ++++++++++++++-------
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c |  6 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c  | 21 +++--
 3 files changed, 78 insertions(+), 44 deletions(-)

-- 
2.43.0


