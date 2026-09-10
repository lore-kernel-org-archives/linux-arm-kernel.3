Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BC8C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4NZ9nNqE+pb8sFgTxYUMCE97tLV2sG+CG+J95kQTKcM=; b=sHqujfJtfL/zXI/t1c1UN/tEAy
	n82i+Cja5kDsD7a4JyMz9I+VrYSapn6UeD8/11wI1VTqx8afu3t+mNNN71zlXZWowCzHeEY4VvC6M
	W/sdgex3MO0vTimhLd68zi9PwiTwuzUWcbFOP4FN6XN9OunXTfuJXyTgTsOP1s0+qJD/dxZhwjZqe
	7AqlpV2K6kZOvWO7UVGMAUt+3oigyf/5WgQnk9RNql87jKb3FUne84oekvm/9TEGAGLD0kcFNC4zm
	zwWr88yskHwGWWyouFMPEHpw/LaiPnSQUBR7uwLwqlSbQBjEbMI46CGYJ3Gr1p/8bb+3EF5YxK5z5
	3//AkY6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eLv-0000000EOL6-1xKr;
	Thu, 10 Sep 2026 12:58:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eLt-0000000EOJl-1mpk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=4NZ9nNqE+pb8sFgTxYUMCE97tLV2sG+CG+J95kQTKcM=; b=LteWYa5K4y0zooqPbx4nLO/pk5
	HX5hkh5bjoN4dVeouUxRJAlENa9mCEQeyzzbkrdX9JRMQkGrLtLWslMOZh8WOP85OGcPHnNNspC+z
	UY0M0HZogXwamxWNXy8UPlTM/9r1yP59sw5CQQnMVMS9/zv5KFGKu82OCdkIsLj5uIkYJ0YqCKsT9
	BUNS/WwBwmbQ5XgALKg5lLmYI1NtzhH1BXY+m+TgP9GlQ8DiE3APPUScmU0PhH+CEJlxIexyhU84W
	B1hDyptFUCVyUkGhP0Vw/r2GPxaHRrgTCJJkNYXtuK3eEYaqDJJcBDpIIdjASMz3ZK2trXg2lG9EB
	ZogyorCw==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eLq-00000002UwS-2aIg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:58:04 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso2057367a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045080; x=1789649880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4NZ9nNqE+pb8sFgTxYUMCE97tLV2sG+CG+J95kQTKcM=;
        b=KizNr/Rr3qWYvK7Rf5p9XpAppKxY4iPHjFlDb2ukDV9WI+M3H67MwZcAIVV6rtNEU+
         Fx9GHG4VpYCy+6oa80hnJbVFVKXkcI2JESTwUd1pVd8XFGDaTr2C0f5HE8ix6M7ATMt/
         kwI+hBqvMWCZxwfIA9hP0ai9Pf4ItKBKqzNfa5nuH0p+ZNZiNWdMt+bZCTYFr0X+gKPo
         PAx7t0FToFtmw0CnvtS2rxcGlR6/wLGOctVzHC5IFxoPK1hCSN8X/50UO2zpj5J8p0sZ
         nCwLP6XnYI8+8Q57z9sXqMtNmZFkquhII1Fqfya2Db9WignDjzsH3veGdUpzo5nHdC/i
         7crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045080; x=1789649880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NZ9nNqE+pb8sFgTxYUMCE97tLV2sG+CG+J95kQTKcM=;
        b=KGZtvO3oTy3UuXauiExgOnTMTsYlb4/RFfHVyhdUkHJ1uIirf5kluTfINHhvUPF78x
         3jpN3bQBjD6iMW2D5xabytZ3Qo4JjsvgWfBzPjyiRqzAlbpR3JYfqkFkkbq5x9kxdMLC
         WVbTylT+VmFpH68o8wf5VPanPbiImjC3Pbv7Tho42mPYv2zEzH/o1A4Z2zv2SS7RgBWe
         it7nMbO4SN0+oTwcZxxzSjaJRGtyydGgk2PwXlEXh/FBwKjbUhXlJzy6qGcD5rX5wHPT
         nKSs2asZXPH10dlGYU+N0iRb6/ahxR5ApJ/yoQsbaK23/1jFZR8DMh/xHmNyRoeardtj
         F7PA==
X-Forwarded-Encrypted: i=1; AKwUvBzee80xJ2A3UMQ9B0a9IBi8FNGuscp0I9G0193/sAR24S23iWxofbEg5xp8TbAfQpI/Ps0hL8P02fz1C1cUUYyk@lists.infradead.org
X-Gm-Message-State: AFuF++nk6HlHLStxZfCCaAvl7U8xT3QCOo47Q5vA8NYrAnZv7Icn/FIv
	wQvCXvXkCQESPA5/7zD5g/hdZD8BqNNaJadvqMYIc3t4q6wkzU+Lg5hB
X-Gm-Gg: AYBFou2EXDhBnfVQi5ORdVKMocjSbYGuwvCE3rXWG6dKeIrOt23oTqE8N9F4GfvWy+9
	HnVZAOzfUWyKXwoTMT419qZOAbHXCvk5g+1lKw5++ueuLs7Yz3shxCRsmUINgPetJXk+t8zlDTC
	fr7yJu+VAvFcfMIXjUAQdprcZK61k2IMn/08SI0TqJmVbivK5qJcIF71L7Jf1IlFqVrUdZS/xqb
	U4vAGeyKZ+cNyofDbfGiemowPyDGwymD9L+x2rAU1KiBqEwWTxAbb2TaXEd/SZ8tPNNwE33Pirj
	V922elsEqkynAbuFkakw0LgHJ1E3ZIerX+3lVivXm/VP49jNTHvcYoAG8VPhdvj2Gvakr0J4Iqc
	D7kVrAj/Uq5g1NixdiGvtpr/hCWXXnLjW6jauedSfJ5J3zV5mzxNFfcyzS3Llydj1Iy9lxCRskT
	HNn9wkSudEOeuzR5VgNQPvdPl/gLlsZclTNfuXNp6NbltQZxAwl0FWLOdkXg3GQ0K3cjY4ImegW
	yhO9BvUB1JVxpSUM9GPyUvc/3dNMBc8aCDwDAoSkniPNNrV4MhhOZOM/gJ5dLWNCEEEnIPGhZY2
	hzG9hncaSPI4NP8=
X-Received: by 2002:a17:90b:1d45:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-39bac1d89b4mr18062671a91.9.1789045080229;
        Thu, 10 Sep 2026 05:58:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:57:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/13] ASoC: mediatek: mt8189: Improve error handling
Date: Thu, 10 Sep 2026 19:57:29 +0700
Message-ID: <20260910125742.150902-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135802_799145_2E7B5D10 
X-CRM114-Status: UNSURE (   7.54  )
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

This series addresses part of the error handling in the MT8189 AFE driver.

It propagates errors from clock operations and runtime resume, validates
clock parameters, and removes redundant error messages.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (13):
  ASoC: mediatek: mt8189: Return error for missing regmap
  ASoC: mediatek: mt8189: Propagate APLL enable errors
  ASoC: mediatek: mt8189: Propagate MCK enable errors
  ASoC: mediatek: mt8189: Validate MCK ID
  ASoC: mediatek: mt8189: Propagate reg_rw clock errors
  ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
  ASoC: mediatek: mt8189: Propagate runtime resume errors
  ASoC: mediatek: mt8189: Remove redundant error message
  ASoC: mediatek: mt8189: Propagate APLL errors
  ASoC: mediatek: mt8189: Propagate MCLK errors
  ASoC: mediatek: mt8189: Validate sysclk frequency
  ASoC: mediatek: mt8189: Propagate TDM clock errors
  ASoC: mediatek: mt8189: Validate TDM MCLK frequency

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 136 +++++++++++++++------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  49 +++++---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  17 ++-
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  17 ++-
 4 files changed, 155 insertions(+), 64 deletions(-)

-- 
2.43.0


