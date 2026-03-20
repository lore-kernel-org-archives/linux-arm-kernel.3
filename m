Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E85108B8F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 11:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lO9Lmv98MRpCJZv2Mn3Kteip86atAMewwUBvtPiPUSA=; b=ReIM0SqbX04EIGkDYOETcp2yL6
	qR19QS1ELuxTF35uSb1pOQLtJmrorsjnQY2UGpyHROwIJEsDZnRdJu5GbuaTEQPqOEXAOvJFSb/vN
	xQ2IOAVEu3XS5KwYC68WrKPfugrfAcqGolLOfgjYI/IKhL+SuLJK60Ios1L6WY8/Np8Cam3j7FIHI
	o/Q3PpIU+f26BMgIDI5xbr+qV4q/4+tvhkqx9ktsPYbUeb9DDlDIrXtrZ1f7H02wdyYhT+7JzneM4
	nCQB+IbftkIw1W8qxnRnLvHVQSTvq/Pb0gXFgnGmuQrFWpx6TrIoWOCcTgyT5OYz1h/0Kr6qC26hp
	kRbKbzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XfT-0000000CfWn-0lqA;
	Fri, 20 Mar 2026 11:05:27 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XfR-0000000CfWI-0QfV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 11:05:26 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so1865261e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 04:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774004722; x=1774609522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lO9Lmv98MRpCJZv2Mn3Kteip86atAMewwUBvtPiPUSA=;
        b=XnaZ8pg3ewbxkuq5EO5sIE/ZyOcElpvJCZU8ojI2HNbNa5BJvpx9C9zEfbfX2bdN1a
         C5WZABkm3Ww5NkO71UvzbylufLC5QULMJ+LnEovMp2FiNPGCV3OyZy9f+gOBBfEUctsf
         8yDTMCT08HxViAwxiXngE8tW075QSgHFZ/+k5DAN3hmLZnd7r5QvZ5u9sZh1gUG71/KJ
         1qSXyshVYjQg+Mtsn8AIACQJHkG5hwMgE2wQkNopIVLjzJFs40JZMg30kcjyVIvf9Hl/
         OXbdkj92Dmlu4OMSDSJ3pruAXinjLvQTcrE7nWnXEvXbM6XAwvAuPzopRY8x39Kn39NG
         lqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774004722; x=1774609522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lO9Lmv98MRpCJZv2Mn3Kteip86atAMewwUBvtPiPUSA=;
        b=d41IW2IWMTUXmXBLVP+ZjZus35aOXTPV0Oc/+p0JkKwZwCzRtWZKMGlvJwa2aDzkl+
         fsTcs9OTO4kK79b4jSUgsA6gmzNZallocrqUTmgYI4vRZTNA45MEaWSO745XqrmiKw9L
         iS1aLm8k99qfRGZ+hvGSP3fbB9h3btxnfNKLE0Jp0xgxiS16Ra7OcDX69D4Wb2/B2yve
         MCXDBllm2Ab49tDmAEAPjln4DUlvy9sPsXVgBdn7TOh7mUCeXSs3+m/1/PXeByESq2b+
         ny6pWw+4zD+xr7bQvlfWJVQ2+JmZ8h2+dDxNLJF1103moj2HQB/2p8EcxD2Va3Rn088C
         DtFw==
X-Forwarded-Encrypted: i=1; AJvYcCXQEYuceWphowgSj/4iFf17B0kVQ/gbMyWRyxzVuGBpOZX8tt699KXJDvZRBS538P5OCHLzVkUvOXXbvS9pypu7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8lZuAkbcd9fyDnOxp/vRnodx4L/TZmd/P5xmIvLSCIfMxYkWj
	LLPZ8VkQo0szkdZomch4bfM6urUYXl6uzKLhc8062YwJenGDT+d5CnkY6eezGDrouxw=
X-Gm-Gg: ATEYQzx0ZnmCMkhi7w6lAFrGYTp1tMvpejn+MBD6riHx1uICqH3nuOTjRFyNJbkN+5W
	Ia31GeDx6U1Fh+7tk1aP+UUtyI03YySckxxODgYVHh4LZ9Q7MPVKk3GBt1Ae1Y2Me9xU7q7UelD
	DVujpbiRw58/m3gfjh0jmXzvF2LTO+86v2/kMWmPj3UCCNwyUM7JGCCNPkmm4+bN36lxbkQmFhN
	5J8Rc0GOU/Hqtbzee8aUBE5d5nfZJ7fmwWnFWjNJrgjv1zKNz3pNN2BONPDmKGe6tLVu3rvTwgg
	/TtiBdKFKRusGRq/XcbZezkX1RNI9kF8HReT+44jpUAba1/q/H7meElwqSQSZUWaaHZVHP0Ysvj
	zjtBCWpBxQeEKg1FY+fzDCeoF/XuIcxp1fVqNGMPgDolYeCUSGpCaout6iT+oDCVah/QGu+18Ld
	YITy21boxpRg/5iQFA3/N/OjyFO7VsAL24Mxe21RlYiiSvmSdp0QG0Q+84wO5GS63g8aZBOkYk
X-Received: by 2002:a05:6512:3c86:b0:5a1:4440:2c48 with SMTP id 2adb3069b0e04-5a285af6dbfmr874480e87.12.1774004722396;
        Fri, 20 Mar 2026 04:05:22 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28510559bsm474295e87.0.2026.03.20.04.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:05:21 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v7.0-rc5
Date: Fri, 20 Mar 2026 12:05:08 +0100
Message-ID: <20260320110521.2044803-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_040525_256947_E629A34B 
X-CRM114-Status: UNSURE (   8.90  )
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

Here's a pull-request with a couple of pmdomain fixes intended for v7.0-rc5.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 0fb59eaca18f1254ecdce34354eec3cb1b3b5e10:

  pmdomain: rockchip: Fix PD_VCODEC for RK3588 (2026-03-04 11:22:36 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.0-rc1-2

for you to fetch changes up to b826d2c0b0ecb844c84431ba6b502e744f5d919a:

  pmdomain: bcm: bcm2835-power: Increase ASB control timeout (2026-03-18 19:15:34 +0100)

----------------------------------------------------------------
pmdomain providers:
 - bcm: Increase ASB control timeout for bcm2835
 - mediatek: Fix power domain count

----------------------------------------------------------------
Adam Ford (1):
      pmdomain: mediatek: Fix power domain count

Maíra Canal (1):
      pmdomain: bcm: bcm2835-power: Increase ASB control timeout

 drivers/pmdomain/bcm/bcm2835-power.c       | 12 ++++--------
 drivers/pmdomain/mediatek/mtk-pm-domains.c |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)

