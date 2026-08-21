Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51891C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xJG5qITotgQ4r/8yEzCbVy01AHxnXQ29q5xOCfnqmk4=; b=D3VjbIpkLSZbgfDkpDsjaHj9t3
	gIzC2zw0IrP0e4YpreKGK0jmf/tRhiNtLF0dBiNld5pVAZSo3ixe9PELzY0kpTU2Uugf3IMAO/pSM
	IBD239PzNFPHTqoUNly7dN6tOM9ollZIJE5HLJ3iEJ8kGlsTU3Wp3gkT8NOim6ajtYWgh5z6qd39V
	s15DEgRHyISn/Wh4kACX1BunG8r9nWIpxMz3c3ujMT9JSxLa/VZnLobVtPxNTw9vLLx/FQWM9pUPe
	YYX1TdMQ+7RPT/kROxRJ7LQOkeZ9j25o6AVooGDcE0sY5byw64QGGBZvXSCKJAJoD0uoL7njlftDo
	NDQ7JATA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMi-0000000DItw-4APt;
	Fri, 21 Aug 2026 12:28:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMh-0000000DIsP-0WIx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:28:56 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2d5cad1a6baso8673735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315334; x=1787920134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xJG5qITotgQ4r/8yEzCbVy01AHxnXQ29q5xOCfnqmk4=;
        b=R0Y67kCuiKWl8HqKhfOaGnX04Hfiltfj9KDYy8O5rGkD1z1NQ7yX/g/Ev2S35ShAlg
         326PpN7Vf8Z5Y6YC2OVsJK6m8DdtR4szi3O858TJAJUL12Im3K8m+wh4CHM6ArQEkOsm
         AYtrS5vOcMnZJMeeN9TvIt6qR9DtEk9M8akNmnGIOb7sWUibZ1aBFiF6f9c1WMIjwgvi
         j6Qj1SXJ336Ox8U3YlNEDZ21yNFGel6INkhD8MKU4NA2NvE0qA3blFkf1UvlJsu+VZy/
         d4xlWWLF/cdAYo7N9vTnfq1iPuP1uksIxrWFMrVs48Megke6sMznagjVSmjDNjR1P2mh
         4sEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315334; x=1787920134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJG5qITotgQ4r/8yEzCbVy01AHxnXQ29q5xOCfnqmk4=;
        b=Ymuga7rwmSiTlp25BcQ72kBI89JABItPesXd5bON/9G5nLVJojfB/TvTC02UEu/pmX
         DYXJRrm3jKbF9Ie3qye6BXDvrc6z/BQfOnzOl6+On/aMInS4lwia3rAzt5RKgrVLHFX7
         5yZ2ucJvvHGqUubxtMIoXceAYWiAI9b58JqgPEzfY6fPoKw8LZWXkZceiJm0iGU6oYjO
         gTbiycf9utji4WTAQ/APD8V0UOoPsYyI8jnAOIgL75Ztfx/vSQjvIhvzk/+n2ytn6CX0
         seqqZ2DgBsmCMFc+mU+6TXS89INLsC7WrEX6NAaH7yn7Q244DPPFa5+hTv7oHpOnCjaI
         kthw==
X-Forwarded-Encrypted: i=1; AHgh+RqVcRPMXGjtakEhKJd72FARQrgja76TGgNWZctasUIqj7Z7f/GOv8MLVIm/03QNbjawb0D3rZ1oh5lzBLRF2Jl8@lists.infradead.org
X-Gm-Message-State: AFuF++mPCb3LNA8D2mddhkXRvMJW/SlQcNOHNPME1NUe7DjtmKC+8Xj6
	GZ09Mmb7Ho+YGpB/TbC95S9kLxz/R3bnxrKDlKky1BGtXQof7ZYEB57H
X-Gm-Gg: AR+sD12lP9uYzrcVjVziVC/eaPo0n/hccsRSnJ0d0gKhFxqpcTJpkSHeB+BIjiirnMH
	65LTodmw22v2hPbZ627Ylls6tQQSgdJthngUnvgVOEjmkWUGemcwbhVcrJcwZBV69hl/Rpnoe9W
	yyii0WqN9q82XJ3cG6zdRa829E7w+SZBI37798jkt8AVNzXGOuNr4wjcBjPHj7+Iw7UvK2IveYa
	l/fCiRTwuAKBSnZdbk0/U/QEJ6x0lB4ULIyNVxmmUsXchJcqc1xl9gTzHLXlqyva/Yc/5zIPB99
	hK5yQUzJVb3ORaUXBGZhQphxqRaerlcrdpzDVDVDk9fpP9TEbWBxdbaK+xoE2YpD35J1yt4/ulL
	aGCnx7GejenolTNPklTq7A++0c2G66YcvN9W9IGpMNKsR/+zY6daUH4a1oHuNr9+piCPxAAOllM
	jNoUqdN5kNhJNNArcOucHpkXsrrBarywHZRySOXGJY45IdDglAE91rPaOQH3XJ8p+4xIcJ0Lheg
	rwzm6UfRumIeban7IqfPhspdacQ25NV18PrCdZ4d1GHCJvOyYGPQky1/sDtDPBR+EEoRJvXViDq
	yV3B
X-Received: by 2002:a17:903:b07:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d64afe960dmr114112305ad.11.1787315333606;
        Fri, 21 Aug 2026 05:28:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554450sm18134515ad.2.2026.08.21.05.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 0/3] ASoC: mediatek: mt6797: Fix error handling
Date: Fri, 21 Aug 2026 19:28:37 +0700
Message-ID: <20260821122840.41266-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052855_237743_CA537741 
X-CRM114-Status: UNSURE (   9.68  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes and cleans up error handling in the MT6797 ASoC driver.

Compile tested only.

Changes in v2:
 - Update the subject prefix from ASoC: mt6797: to ASoC: mediatek: mt6797:.

Changes in v3:
 - Add a cover letter.
 - Add Fixes tags.
 - Add Reviewed-by tags.

 
Thanks,
Phuc

bui duc phuc (3):
  ASoC: mediatek: mt6797: fix wrong unwind order and error code in
    enable_clock
  ASoC: mediatek: mt6797: Use dev_err_probe() for error handling
  ASoC: mediatek: mt6797: Drop redundant probe error messages

 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 23 +++++++++-------------
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c |  8 ++------
 2 files changed, 11 insertions(+), 20 deletions(-)

-- 
2.43.0


