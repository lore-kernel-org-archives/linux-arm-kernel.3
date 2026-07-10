Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA857C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TTtR6zb7RY5US4QxCqQbjVg6WYnuwA1xwAvwueuuMcQ=; b=cRoIwCN9492gM+hjI4MAF+lZQe
	YbOokBj3Yhc7nHlZgbofTeZfZ5Z04rzh7C7y2+oiQYNl4she1EA6mVwb1jb0PvrFMfspTzqS9wJsw
	l0rfn+t3arAZlbjq7tj04p9+HRI6LAgZ2uVDKebF2YtR6ohKfY6AFEPP0AYijXnq2IujmemL67mTR
	xHYpYSCmcrwP6r6ffxUds0m7HKevTfAP9ZI7O75XxPc6IerNNyDavrw5TI+0Dipa1le5UIRzte22q
	WCrJEMjdoLYdVZnHYQVkFbw6Trb575J0PuM69uekkDl9RVSNc+qki/P6QBu82U5wKJzC88BRBLCPx
	cDYGxgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Mr-00000004gvJ-0uDZ;
	Fri, 10 Jul 2026 10:22:01 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Mn-00000004guC-38Y6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:22:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-383adaa461fso512976a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678917; x=1784283717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TTtR6zb7RY5US4QxCqQbjVg6WYnuwA1xwAvwueuuMcQ=;
        b=h65kqARB/Lh16YtoggzeZk58m9TQTmdYSYn37bPNixfy0snj30a0sTByN885LhRb0c
         Ycz/i3/F/iJ15jPsfgFvbJWImOlDbVYQ05ur3HHui9hojCtwZVtKOIAlasupCeJmK0TW
         c8KclakW27PJAP7e/zCdTjCF5rtwUSguj1v/oaeZquY4Q142Fjyxd9v4zvX6LYBlRiYa
         dq6vEA7NB5pHPuBtVr97i6RyPiZuX8PuZVWUFFCuDCFVAeujcm5mmRlZvQPlxtYt6WVx
         mxj3Cg6nQNJlBAGExVzdkvzEU9NZkh3pwHhNOA97OMXLQUUTCpvs6i0CYjoXIUme9+v8
         Rjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678917; x=1784283717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TTtR6zb7RY5US4QxCqQbjVg6WYnuwA1xwAvwueuuMcQ=;
        b=Bibdss6Y4khaztuR0k65D/GviaooAsAfWXv2qM9YYYzz/FqbhFd3MTlgaMXX7D4oka
         RcB+Do321q6DvCgzOcPS5HErszneygG3F4qmuFd3LZZR79zcwUgZ7FM/LD30QveGJQ2J
         uQQ0bkcPaaCgH9+dbiNxvnWpwUulzJVStzMH2ouxtQ2EJXksbWTENY6Wb71u4MESdINg
         ItdHj3Nskbom+Kbf9GzazOQaG6XdF1yy5O2++mufW36IoXKzKK8Q7GMYexKRBHfCkJJv
         b2uJIngJaX5BJCo3MvAnX3G5dKtOGP5pDD6efmZ6HPU7FJWZOuF/15JmkZDZcwDaaqT1
         NCkA==
X-Forwarded-Encrypted: i=1; AHgh+RpmkdHpzuGdUddttMyEZrB7OOiVABjMZ0dEh5WNeVG9yQGxlrKZjv/T8Qe15/O6Un0LeaWO+bikIqE0+m5gUXin@lists.infradead.org
X-Gm-Message-State: AOJu0YxeHvWhLLzJbOC6AHmGADtRmToGCbZEyIm+z7oPCW74/hi+nfcH
	emrCFxQZz8jsWuezepsJoEx/sHB8We73ekd2O/m1PipFrSoTpn/+GFqV
X-Gm-Gg: AfdE7cmtUDl/jsecixO/yTXJ/uM+C7QtrMyqmAORmuBXaYqVso7nOJtshjlHQEPZSWP
	RIYWSREJjq3Mve1Mxkr2pewnwGZ/Ru0X706PDPVeP45vuGYVpw8LEVfqc2VdoAqZ/rIFEaKNey8
	aXyS+JkudkTQ+KGtzwyLQ35Uvlu2jG71noQ3OoPkeR4F6Pr8hKFDTy+0GC2//ODbUad1UAuarPu
	dIV4esxL/fjSaSUv7DtUdM+gdJ+qBSwjg1r63lmA3lj02xVFAJ0mTkd7ejr+IX2qJjBzYVYArqS
	acqBneVrnscXCVvyAovxb7aTzdwcK1blKuHXTH6qYUgS7UxNrvlUsX+70Mb+SUEsmFC0eVabZsn
	aK4udjlSgPInPkUe91UNoEWRH0G88IBRhJuSyQXDkTi6QKTiSEnONc7TkZoo1WJg7tlLEcTHuVk
	Jy13bdIYKtrZBaE9h5X1cgEeZgHkwZmiTFUdg5kBfJGulkSCY=
X-Received: by 2002:a17:90b:4d0c:b0:37f:9cdf:f038 with SMTP id 98e67ed59e1d1-389417e5081mr9744825a91.27.1783678916723;
        Fri, 10 Jul 2026 03:21:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516abffsm2490240a91.4.2026.07.10.03.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:21:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/3] ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error handling
Date: Fri, 10 Jul 2026 17:21:35 +0700
Message-ID: <20260710102138.29347-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_032157_785147_57D53ADB 
X-CRM114-Status: UNSURE (   9.46  )
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

This series cleans up error handling in the Xilinx ASoC drivers.
It replaces dev_err() followed by return with dev_err_probe() where
appropriate in probe paths, allowing deferred probe to be handled
correctly while simplifying the code.
It also removes redundant dev_err() calls after helper functions that
already report failures, avoiding duplicate error messages.

Changes in v2:
 - Split out a separate patch to preserve devm_request_irq() error codes.
 - Adjust line wrapping.
 - Add the Reviewed-by tag.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error
    handling
  ASoC: xilinx: xlnx_spdif: Preserve devm_request_irq() error codes
  ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and drop redundant error
    handling

 sound/soc/xilinx/xlnx_i2s.c   | 18 +++++++-----------
 sound/soc/xilinx/xlnx_spdif.c | 31 +++++++++++--------------------
 2 files changed, 18 insertions(+), 31 deletions(-)

-- 
2.43.0


