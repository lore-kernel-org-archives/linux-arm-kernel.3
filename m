Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3469DC61DCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oK69mOzh/nTQyD5btplCU6IorcHxRfVNJ/HUqVvgcgs=; b=4gA7X29uEIcFzVv5roRSA1nhgZ
	m0Q0cTQSWrCZLe2XpHH3PnVYdNvBIc9sxJwJymeOM7rvM7FUIs9Li744NCPi3uXsH8GTdFdGgnB3O
	t2YdlFn9xtrP1uLLj5BbAzjMkq8AqzEAk8F9WYiFetXxuYjn77x1m0OoKvVC5UYyIHL7qH0t7cL1k
	pmrw7ws619NDZ1QiIerkDfbD7DmCC9PyVCLAiAiPwpmauvMzDDX0cvqPJFggtogRsYUcmSv3VI7c2
	jPrVwGC7mKjNlj1BVbqwqjwEPKV+JLD2/5WIkDAER0ldTv9Vkn53LCGLOd3QKSPqomuBJzT0x72d5
	JAxuo+YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsgw-00000005QFN-0vNw;
	Fri, 28 Aug 2026 09:16:06 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsgo-00000005QA0-2ISS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 09:15:59 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8568e3ecfc3so305121b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908557; x=1788513357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oK69mOzh/nTQyD5btplCU6IorcHxRfVNJ/HUqVvgcgs=;
        b=mpZtJWbEVrB4Ew7NZEt+MscrvkmJB9XmyNGvSpud4cBiuaZOhB2XivasLEEYOcPA/4
         YV5VlxYrwo94Pk32s/CXkkF/Apv306Jm/eLlRMlQIwlbWj5wn1IRPNoilUpOOW1qpxaL
         nvNLrgkay4e0BKQD7umT6Ga7EFZKIstRE8bXTlmDJaD2lfXDEhnLn1LMnbdQw3Xag3co
         Q5aJ45Bk+No8NJbK6fOH48hkjjS3PjDulq0FwE4yfyqVqrqySRk59VclfpPIwjyNwVTy
         XjY6AEXMgawQ8ZyHy1ybQ/vzLl7JCpSk7dvFAIO/VX+569Q0vla7q+VQOnNTJEttWxsL
         HHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908557; x=1788513357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oK69mOzh/nTQyD5btplCU6IorcHxRfVNJ/HUqVvgcgs=;
        b=fkiuejJsQSpFhsesumlgBP28SBDB8Edrcyu+EMrO0y2WwNI12jMRXZv/271UVi1EId
         lhGoBNUdQnNT6wZeHzOND3WfzLw5E+RrXI7lNt8zyfRrH9FQOTmOCGkA4UqBOOxaYSZs
         1A8Cxjs4+FtV/b1Ae64eNhCPrKYThX1pkKFkaqxFerPoSHdpDzl1LJP0RrTWia8tQZ7v
         THAzc1huooaX3cdqlX+gmcAjwefYVdX0vML3jJvA9csyvc5dUwoAywPZtSEPTguyh7ji
         wMhe8QFhl904QrO0YC0aJUmulzKyyH3Abky4/C3EIm0bSS1QjHugwWQ0y02ksdNKJfEv
         dfFw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6ezniHavBjoPw5kruwOlhTNDbawKxlrxK3pGf10ZQZ7RFX6ZykOWWO1mV9ZC5zF3Mx6CO+pWPgzbkmt8wPp8m@lists.infradead.org
X-Gm-Message-State: AFuF++mmejypPn42U/L7O6ZdpVntTXfUiLa0+RRrpkPNpDlD+bmV+mLX
	aUtsUYXHNeHAhf+uNlu7ZZ6Ae0OnsimUJ0R6Td2bdxZwjM1pFiy0W73N
X-Gm-Gg: AR+sD12J2rXQTyajJF4tRt1kxnTq/azYEVNj6shd2JDkRTzaYO7pFTiHu7DVCF95OeU
	J4yQ3rYKC56zJTeBH4avvKHWbPICFl9EyLpRVNPAljvqZw/ZJJrzX4b5qgMClMFVu+QPh/Lwui0
	Nq3/xkM/RdPbSSWsvUgxkvlqC0co2OFLjS4q4sNp8cP80N5aj3U7isz5LFvRqEGNdzRYl1gFmmk
	9zlZ8kmK5OMnvhQkbnt9IBCv5fRTDGWb2Q1X5uCRRkzq3mcIMDoZ9Nk1VfeeBqPUMykXtbSNyC6
	ciq39Jg1Ebbly4SJTzJ+1b1pgp55FiAnV2xSJ02iQNMrGWUUNwabD9Aw4hQm2EPJkRVOP9vqohp
	BpBKGtjOhIEzKW72RRzbI0Hl6vW2x5uutg/xRoUvRgOk3+W1XXGdwtHaf2biCyRTrc/5bKkCpzC
	3WH7niF2KK9ANmXlKafCsMapdK/RepXQdA1SnIIbIsaFbmyUtCwsPuQ19+0cmBA1MGeZzT+1Cks
	0mLr82DAVKVn8csQVRjRyWydNqzH2u2wIClI7wdqvyJdX/AWmziniex0UjUIuYuMTPOVsDO+BUc
	EI0x
X-Received: by 2002:a05:6a00:1da4:b0:847:973b:3cf6 with SMTP id d2e1a72fcca58-85625541a6emr12204502b3a.0.1787908556977;
        Fri, 28 Aug 2026 02:15:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:15:55 -0700 (PDT)
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
Subject: [PATCH v3 0/8] ASoC: mediatek: mt8186: Fix clock error handling
Date: Fri, 28 Aug 2026 16:15:24 +0700
Message-ID: <20260828091532.600047-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021558_602852_FC992653 
X-CRM114-Status: GOOD (  11.80  )
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

link v2: 
https://lore.kernel.org/all/20260821123021.41390-1-phucduc.bui@gmail.com/

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

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c  | 163 ++++++++++++--------
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c |   6 +-
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c  |  21 ++-
 3 files changed, 116 insertions(+), 74 deletions(-)

-- 
2.43.0


