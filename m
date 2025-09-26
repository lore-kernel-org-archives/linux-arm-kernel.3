Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A231CCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 12:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m3TrlPJojLwz8IDO7vEe8n5bv1r1AjxKFd90MIa952c=; b=p4nlS8so63OPT4Hloj7mHwKmo3
	nLmdCxficTl/EKwl6yBQ/0ESxX5Zjgv+ozqg3dgQLmXwIHS7zFrwS0K7g4s4mEWodmljdwt/ZqheF
	C5eGaD4EbE1/wYBoRxFYQLACmzKgxKjTQz+0wvqB50zNG8k1C/QTIVaX8XjnjXUpp7OjXxQB9GETH
	hceMuwV644tzoO/NIcRiQXujfa8JO9xfJuV0SjrHV99cdg7X71lfMLuQvIN6j84/1cu8WjB9vH9Ce
	Y6pNg/Jx7MKCVpD9dXhC68j39ux8G+za1aGRYdTkOchkOfQHA/mhs/YqQ2mbXtCADMHmvpG0iEZxp
	qOtMVp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27nR-00000001G1B-2cnL;
	Fri, 26 Sep 2025 12:43:33 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v27nO-00000001Fxy-46Ff
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 12:43:32 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so2124690e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 05:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758890609; x=1759495409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m3TrlPJojLwz8IDO7vEe8n5bv1r1AjxKFd90MIa952c=;
        b=kZ7WSaaRtYk9cCeWYhYzHb8o7PC1lMZRX3RSXujAMG6KkftbFQvMkpZ0RD50qU19BF
         A7D24ayv3BYXk8D95Y4gQIV0HLmZhUSK8ckBZxqyX6C1J+rcKkjFOoAnOIaTmtBHv4OJ
         WnXNJtp4ArSVbGyEMssV5eNdcZ/ct7PfFyL7GRHcv4Sm9AgNukI256VcsMuy5UPBc3ig
         7duPIVxOMYopSmX26ouuTb+yIj43DDU/TENpIzhpDBszU3laJMr4K7mslLMnIDGqqu6B
         yLzoB9xfCcOeOucL/hfDoXWBHA/Ag/RuR8usU6lPV0jX2OjOZ1xHZVO3yPmdljnR/AOB
         rFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758890609; x=1759495409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3TrlPJojLwz8IDO7vEe8n5bv1r1AjxKFd90MIa952c=;
        b=bBMkT/56fWWjTOjqMzt77UF5ExLPx8a5TEmTiuQmxrgywbeAFSnrTnIgXcmfvG7Cfn
         HMh9ZbVx3F/01y+zl0xv5crWhEivI7KjKeMq2im6lPSQWTNOUzOEtr62WW4w8xDMzB5F
         1Kdv4tw19Y6avqqlf921XeH6SWiUONXnHvAm8pwytBh8P5Ggl+P+XurvJrMKiXoXMj1g
         TghsLGTq0YaOnNWrtmsALf/Akf1IBsbAokBrdxWuFctlrgE83EO+56B6eloLbmf2gxnd
         6QMFdSQyhhSd8j4L1Vu4ujkUpxcehvHO7wCAoFMoV7hkr5EZRU/L3ZjZb7cj7fpGjP37
         TEjw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ3Dm2oDqTwoicV1YPIg/uhJcRkvn+0fP2E5x7FNw2HVnkvhSR5Gluuo15ewgD1f+DIf86kQTxxN00s1zBPxsE@lists.infradead.org
X-Gm-Message-State: AOJu0YxfaHFzZTYcnMcJ2wdGKrnoezyhCl3aZpw1fne1sdh2YeFRq8bO
	vFlVkHphKoL1ToiZufMpvuADjXmHLIjBCNuSLTKlXcCnH6znqePEBsK8+FO1ZEIcpiWAj/+XQFB
	PIsga
X-Gm-Gg: ASbGncvhqUkA7ryFt/ENV6PXRkzNakSfMckhlP3D+nwWQ8Mfgn7vWOqHp5g4mktf7Wi
	m32iqvLAOLewalaRW0t/V1LL8XmxJktUjip4H40XtfNyGcozcM4KjwcuE7/a/eFjOcIDmVLTQfx
	kA2sjnH5Kq8u1kR7ynu7XOlNpGCdbG5QkjL0ZWZDgJpHZcjA+IUeVqRk5E6ZmZdIZdSLCBi2tbT
	4q2tuOgRvEulxYFFnRPE5HiOCGrWNxoZEcXHaINNX7hfbxxmcqs/S9JlgrzVCpwF+aCj5qGIbbb
	+JAkk1RYIqcX1f/weDXOpRjNSyQx23AO8nbES6p4hHDx5fwYJgSMLqLNowuAq/SDw5BkWT8SD6F
	zspoO0lfLS8CR40OoK50xZQXrM21PKOz6mno9pckVmF0LbZtwA5MtYKUK/Taqz0XcU2dQ8IpL
X-Google-Smtp-Source: AGHT+IFSMUZyGErx/ATx84tcpejpRIj9agjrcxBG83lEZJRIvJ1l/sc/CKJcJP/p3DJDSM8naP+IrA==
X-Received: by 2002:a05:6512:3b20:b0:579:c694:fbd1 with SMTP id 2adb3069b0e04-582d2f27ee6mr1917262e87.29.1758890608833;
        Fri, 26 Sep 2025 05:43:28 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5831665671csm1724276e87.75.2025.09.26.05.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 05:43:28 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.17-rc8
Date: Fri, 26 Sep 2025 14:43:27 +0200
Message-ID: <20250926124327.212581-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_054331_029188_EBF80452 
X-CRM114-Status: UNSURE (   8.15  )
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

Hi Linus,

Here's a pull-request with a pmdomain fix intended for v6.17-rc8.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 303010f4658cb134eb27cee88026fb5d065a48cd:

  pmdomain: renesas: rmobile-sysc: Don't keep unused PM domains powered-on (2025-09-11 12:36:55 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.17-rc2-2

for you to fetch changes up to 5fc4ab3269dea6a0b00c7256cb6f6c0101b6a44b:

  pmdomain: mediatek: set default off flag for MT8195 AUDIO power domain (2025-09-23 16:33:34 +0200)

----------------------------------------------------------------
pmdomain providers:
 - mediatek: Make sure MT8195 AUDIO power domain isn't left powered-on

----------------------------------------------------------------
Louis-Alexis Eyraud (1):
      pmdomain: mediatek: set default off flag for MT8195 AUDIO power domain

 drivers/pmdomain/mediatek/mt8195-pm-domains.h | 1 +
 1 file changed, 1 insertion(+)

