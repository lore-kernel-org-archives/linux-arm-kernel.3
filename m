Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA96F31E21
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p+HP2NPOCwSfxfjXKB1IjPCNrMct9KR3awrP+o31EZQ=; b=b8HCvQ2gnNYIH7vthxiKdNXvTd
	P27eWztxGc3jKDlJ6XYD+Bh6WJ1kb9Oa41fFYMkDXV5rlEAkW3JVxi9Z7d7XVigWoll56IR+4t89f
	3kVWm9OhJ2vXR888NYSWyX204Ic6fIX6T/HJ0sggL4XZaFkMRgTA7LAuebUZIU26dr7vEUrjnF0DJ
	pOrzrBneCuPPHoAjZCVu1Zm/LmdarJ6fu3jKpo0cNe39s5Ze3wNP2nmMu+Le069hrddIHGXouG7O5
	aVT5+2mrDHG9RMbCVB7tY6TKmCuXSxN/fdWyP5m49NUapWCNXPt9KsZkvFFrqHeBp+ZZPqA+tLO8U
	+4/Or7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAr12-0000000AlfE-3zmC;
	Thu, 09 Apr 2026 15:09:56 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAr10-0000000Aleo-2kmI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 15:09:55 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so1077584e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 08:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775747392; x=1776352192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+HP2NPOCwSfxfjXKB1IjPCNrMct9KR3awrP+o31EZQ=;
        b=W06kZ0fau64EqsuoaAYG1k8mOF0fNh0pxwrPLHkUCSHIEy+rVc5BHYV3/COblAvdLC
         WpB5VW8LQ2jMuHxIVTIU+vlBQHASeTILH2Bd91FKXdn84Ot2YLbdEBsbbUXazDO45DBh
         j62erIshAsNyTT1IEIpTp//GkiF6bwmLVCFr6EdwfMsHub6OneGoFEDka9MFRCvCecj9
         43Dlwdb0ps+tqwJ3KP7ocLib6gIeBQ/3kOA8wNY1P52Cqqve6dLU9Ho7OukJto2DVkib
         zfbj6399RUjS9X5gh0DoGrP/3KW9qrCSkr2trLahcP6f66bFfAErSYk/vVO3QL7IsR4n
         MW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775747392; x=1776352192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+HP2NPOCwSfxfjXKB1IjPCNrMct9KR3awrP+o31EZQ=;
        b=dzjRpQTWlwpHoVW1rKqaXidezwjATbKVBuanpqu8Hv4+f85Czj3Ay3gqttLwfPB/RT
         53QtAlgpfeashb4VaB/LR5rl/jSrflpluaySWOBILU2NjbhbdIaEV731W36ZwhrCxTO3
         +WQAXEoILv3ZurzzQj8tajmDk7xjiVjPmAl4rzZ6T9cZ8af5dVd+ez3QnuVrnNIWKxx4
         K/0EIIKQ5G6LUXJNII7KkUTgZj3Nb6UMNMRco+5L3nJ0sa5nUmdtXJH0FTVaAV0NzPSH
         L7YPpNtuUxpkMdhHJxsXSHU3f2S04IuCNsvShoY9WeqiPkD4wRqTg8PhdmzxMvqr59Pc
         7gsw==
X-Forwarded-Encrypted: i=1; AJvYcCV5KuNT2ebOGJfkHgpLTuZXJd6mEnCNqMAv4IMWWWM05+SJNcSnuCwJQ0LQaIH6FAFL5MahPSy1Yk//0Jg1in4w@lists.infradead.org
X-Gm-Message-State: AOJu0YxhUwc9172ZiFBCv8AbPdXfaoRwWiC1sKh0TlyfT+bLUQHbUD/i
	HxXN69faDXfUsxQ8lJoNzNHbYaV1viaAhfXcjaK8U5QET4eAaZ5zWUUWDlU3YSrsIUY=
X-Gm-Gg: AeBDietgoYRfGUe5rKKfN8whKwzsvEOxBheoRc1EyYHoHbujy3Ft1HdF0frt7TWbugo
	VBy8ZUwR5UnIeJp6yfcupb2/uBbOxsOESOWelc9pyBn+rcTOrlwq242FKupbgQzoNzXUb2ST8r8
	s00SdwX1oWvp2BXtPUvTU/hxpr3qOO3aJwpeZZ44tJJt4W5nrxvdBTg3rsexyGHTANBLD0q/n0f
	intfLk0qdsXuvCkhzxAfOEDBt7KZynkReeosdUJxwo3Qo58M+reLite9el1rJ63Ec/wYkxNoBJS
	6zNQup/IVcBH0O0Q1zLxQJip6X8Hl2dOdStyx3i3IDqtW4CVgtYPPnUWzvJeUc5qfxkSlOp+k5a
	azviuNSJsPTbUFcHaMLdmlG7b2M7Aa9j1WIUvb0O5UCgYYWDmJK2xW36MD9Q8tT9pFyn3VISURl
	u+AzbuGGv82U/otk8Fx5u5GR0aRiinLwACNgaibrqTEZoLgLkpVwxISXgbM+92xQP10BdQhGHT
X-Received: by 2002:a05:6512:1283:b0:5a2:7c1c:74a with SMTP id 2adb3069b0e04-5a3375847e9mr9439536e87.29.1775747391581;
        Thu, 09 Apr 2026 08:09:51 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95288sm5643977e87.14.2026.04.09.08.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:09:51 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v7.0-rc8
Date: Thu,  9 Apr 2026 17:09:50 +0200
Message-ID: <20260409150950.28527-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_080954_720443_EA017BB9 
X-CRM114-Status: UNSURE (   8.76  )
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

Here's a pull-request with a couple of pmdomain/firmware fixes intended for
v7.0-rc8. I have also included a patch to update my email in MAINTAINERS and
mailmap. Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 7aaa8047eafd0bd628065b15757d9b48c5f9c07d:

  Linux 7.0-rc6 (2026-03-29 15:40:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.0-rc6

for you to fetch changes up to c2812c0cb909211a1d2e7cec862406e32833b9de:

  MAINTAINERS, mailmap: Change Ulf Hansson's email (2026-04-07 14:17:48 +0200)

----------------------------------------------------------------
pmdomain providers:
 - imx: Prevent hang at power down for imx8mp-blk-ctrl

firmware:
 - thead: Fix buffer overflow for TH1520 AON driver

MAINTAINERS, mailmap:
 - Change Ulf Hansson's email

----------------------------------------------------------------
Jacky Bai (1):
      pmdomain: imx8mp-blk-ctrl: Keep the NOC_HDCP clock enabled

Michal Wilczynski (1):
      firmware: thead: Fix buffer overflow and use standard endian macros

Ulf Hansson (1):
      MAINTAINERS, mailmap: Change Ulf Hansson's email

 .mailmap                                        |  2 +
 MAINTAINERS                                     | 14 ++---
 drivers/firmware/thead,th1520-aon.c             |  7 +--
 drivers/pmdomain/imx/imx8mp-blk-ctrl.c          |  8 +--
 include/linux/firmware/thead/thead,th1520-aon.h | 74 -------------------------
 5 files changed, 13 insertions(+), 92 deletions(-)

