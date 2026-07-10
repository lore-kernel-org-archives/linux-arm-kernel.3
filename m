Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F187EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ep8OkwxVAkZzrs1SxYAMiw1vCFAjJuusyYqhfb+2ko8=; b=X9rFHu215AQ1cymrxHwmH4eh+r
	oxG82+AlpyiWhs1qRb3j9HUGZm7w7L2ksv74452fNVOfQtCCFTzGkgkpDneTzlEacKlg7bbebb14J
	DAB+SZqlPKmGbRqdNUOD1wqrMZEWW6TfVLenMTEjGwedGvzbgrYqVXIziymwR6VoaNboWtuFa37OI
	3KqlNYQBiTItNeDbqa4bUhmcUvnPtE+vClHsU43MgG5yhB8ihunrhjdTAAiKUQMhxIU1RFBJx5Kb1
	g6I86oVe/cueVSMWmNinYAP8iZNFDC9RBFZgvxjKNa81sg/Csr/QoevCI0o2tEGpuEQtiuGFAZPyO
	rduf4RIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Nr-000000047Sc-3LB3;
	Fri, 10 Jul 2026 05:02:43 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Nq-000000047Rx-0G5o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:02:43 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so280871a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659761; x=1784264561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ep8OkwxVAkZzrs1SxYAMiw1vCFAjJuusyYqhfb+2ko8=;
        b=lD9h4q3IipcmVCzqxlAwoNPJRUvcaH7QXuZcZhwYSLxxZ7d6koNyEMj89Kf7CvLuOT
         pu3/fmsYBuRUCc2eg+AmSvQACVZRy9ruAYYJLVVk1S6+k3VZ6pEbmLPeOLuJMr39kwdi
         6q03OJ5SV0IOj1nOayd/m3y5zQuDBXf1j4fg+XO7+CBVIDBxeZPrj9vXMtJXKuNbo3Zh
         802pucgUOYD5EGFKdk7DAvhQjy3DRoLudXHsnT9tVqBsFJKZmmRUag8JECSRJOL3Rewg
         T3K2kGki3+wFf+qEDXp3LjhjCYD7n2k6fzvftJ/PKhRD/LNWFB8L6aRBcrz1oq8W2YmR
         oYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659761; x=1784264561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ep8OkwxVAkZzrs1SxYAMiw1vCFAjJuusyYqhfb+2ko8=;
        b=I7AayE/NfA6lqp2PoL+a2GGWMPsmR7b9WsL8HavOfP+MAWdOv+/LGBAfpu7qAZyggM
         stjvROO5OxV72HmUELbzAUu5bL8nnl3lOdpdzQkAqhJlOxaLlNN0dFA6aX3dW14WnZYt
         MHTttTVtzIUKhZyQdfuxJD+/IxI1GIJ6bnJF7yDEFdBOXd0sI1+ui2enusXponqJNMWc
         Yqzihq3j57yPgCEwQHLpP7z1XQqAbP1l9axaa0FXFU4gEy8tLZiXypOiiEcZfM2/VVk7
         LQmDXlAIPCYUqAjSmDRwC63mnmWK9kQw04nUThTF+Dk4R0N9fTiUL0BL2XAXjv6dEH/z
         GIlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpq5mo4HjmJhbkWgkAd8fE3kVcEyXAQyy7giMQsXHgJ4kSLj+fueEzhyqUYkz66tRY361qxqmCdkDECBldt6+Wm@lists.infradead.org
X-Gm-Message-State: AOJu0YyDj7jEAq/x6bTI1m4QNbE8NOVidkngb9IqqSaioZ0DBssVn6Xm
	sIudL8D1OLWsYN5SLOmjZcHR4iQPYfUKHfeqGV/N0/hMM9dvJ5pdbjJO
X-Gm-Gg: AfdE7cmFKyRYkcR0hlk70FD093F5Ndvp1LGj8+q/H2FIJVglJY1aLnf+EPTkDv2teeJ
	vmPLPnEkPxpLCKiaWQg16bqppjPFMjMNMdpCup9LU4rntzKbn3L5FKdqJmI08VyTrVoP5m9ka7N
	Fs0nCsdbfdtCoIKBFm4W+8KhP72aHPuYVGmO7My2InVw5N+fD7JxYRK3hnv+hGElzcHKKhHa539
	oeNbql/yzJPG6toXcdT/GrdVThz3GgRVpUdUB8DyAZH/eO7ZFr2VjJVYtJuuUGTp1TrMwOZ5FZW
	2e2pX7oS4lCwmXGkBIZ0QwT4A561GAPu8ftp2V0cWxUTpjURnfWcw1eh+mpc6nWnI3E8Z1ZzsWW
	A0i+OjYLQ2LMCDE8afUEPnDAZyh6T4GwxTujDSfFYc3Id1QX2U/GgY8yycuWk53jqMcfa3JF0J4
	BHiMyFB7ZW+OlM5Xqejp7Mj5ovVpEmh05S4WStKr+PqsjCwoI=
X-Received: by 2002:a17:90b:17c4:b0:381:5ab5:b667 with SMTP id 98e67ed59e1d1-38942493f10mr10078915a91.31.1783659761030;
        Thu, 09 Jul 2026 22:02:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516ad85sm2139647a91.2.2026.07.09.22.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:02:40 -0700 (PDT)
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
Subject: [PATCH 0/2] ASoC: xilinx: Use dev_err_probe() and drop redundant error handling
Date: Fri, 10 Jul 2026 12:02:21 +0700
Message-ID: <20260710050223.14266-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220242_103596_C017528C 
X-CRM114-Status: UNSURE (   8.13  )
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

Best regards,
Phuc

bui duc phuc (2):
  ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop redundant error
    handling
  ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and drop redundant error
    handling

 sound/soc/xilinx/xlnx_i2s.c   | 18 +++++++-----------
 sound/soc/xilinx/xlnx_spdif.c | 30 ++++++++++--------------------
 2 files changed, 17 insertions(+), 31 deletions(-)

-- 
2.43.0


