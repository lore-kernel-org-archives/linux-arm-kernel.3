Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B980C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SLoYBfY0wfOAGpSNCqGysKXGELddvDZ9oGBQRdtl5uQ=; b=BwqDALz4pIZOh1olEbaJyYbn+O
	yB/EtvR0XKZ/qcPLmlduGq16Hi7LnJ9RgES5IMeFwlI4f/yKgVU3zqSvb5tp4JMujP99sew8ZYq03
	OYRD7jmnortgP4vqIykUtIYCD4mE429vSXpbZtg0NLjKbmEOIwKHzuz9BoPH4TjKrzdtwVwrO7Atu
	c8P3vyUlkUlG0aJZhc8xlq6v5HzlUE7ETWQX5vqfnjlY56Zwk7QhBaaLgrsbi8qPAfTYl3NbhXJ5n
	m4kpvn84828LQ/6RF9Na0cnNdD40ysA60wEXkLCoYy72S5RmPbRoCEgQlWeibwbsw6Pe04XHtC6Li
	aEswElXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SCC-00000001pnt-0KnM;
	Fri, 04 Sep 2026 11:35:00 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SC8-00000001pmc-0Z5J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:34:57 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6b1a0d75a4fso517451eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 04:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521695; x=1789126495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SLoYBfY0wfOAGpSNCqGysKXGELddvDZ9oGBQRdtl5uQ=;
        b=MitoFyEkHR3i+A3p5F+H3l9bVjNaguy+5wF1wVOIUDfG4W9GEwroT/P7elUQvSSrLj
         u1vZJ9KoG6HDaKs+1zlK3FXGJZb1qCxl1kIPfNumrFK2eRy+LCzekBzr9fIuqaOqTa+4
         rbv/fOdb4/0d9Za+lNiH5SBn21AjP8vEg3gPpaHlW7MWtowraz/ILLxzX9v6L74Vd83P
         8W8Cvxos4vQazyTI4jdPRvLHczfVdw2RzuQ8wYC7xh/QcQwYs+l68TW9XmIfSYv4uHxJ
         bjJl8Fd0mhcKSIiEd6K1t75xCGL7q+XZb0LnE/mq/kAWBoBBRAgUN+SFtu/jlKR30QPH
         kA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521695; x=1789126495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SLoYBfY0wfOAGpSNCqGysKXGELddvDZ9oGBQRdtl5uQ=;
        b=MORHQBp3Q9Qo44waW7heRjItQeKj8GR79frGfnAFVpNEHXnNyEzn4xraSI91aPSKXr
         bDcxKZJyS9SElUwz23wSwCg5NgjC+cG6Ud3mO33WHVg6jSqAEQdkvDN+/4+BgPRkZofe
         22qn9XF3+Z0sgw1kL7GwLqv9pC1/5GMB9ApneEnKkEy1Cz3m2HxGDACMZhZtNv/9I+4Y
         00Xhg3nxX7FPl48MWxwrCNXE2sMa7IA1F0OtUJjnbG+pufSxMhyXJArbSp/yxfzjh3R5
         tH6pDdVh3Z4udJP1lVBEIZtM4LfvtWu0AU0Nw6eb56Nm3Hslph/pAXMuWoE7IDw6pMkX
         aBew==
X-Forwarded-Encrypted: i=1; AKwUvBzvgMBHPd17FN4DTaJjzS2tf/WP3CWFe2pHTmaBh/UE+Mz6wF74Lh4EoDLW+WxMNRQigwSgTTfCeZVNwqBA1t8Y@lists.infradead.org
X-Gm-Message-State: AFuF++mhkxcNIXD+fHYkicQIOV8G7awp6EiGykwSSLkrktkL8NNfbmM4
	z6O6KfxNm28MQ78sM48qsRsXZ21Qxld2aoB3pH+RLobEdJjivsrObRdeloAF/7fXDZ0=
X-Gm-Gg: AYBFou3gmQmvqT4ukGC56pJp9Lt5WF1Hk0CsvUtBTAZwxs9XcInq+s8GHCenGOjFYA5
	FvBRzFa0Xz5B2LTz5zNKH7CFNtZGmoIAtNRk3thk6S6S+Gibuy8k9T7259CoOwB8MMRiOzMfHgI
	bL9riszsrm/jy9WzKudJpmGnRqbo3/jIOnRxVXL248LbbPFUw1kg1CPFd/ccpPVeeDCOwQ/wyeV
	ZLr1kNG/jj9bXABH7YfKWLMZuPIT5IAravin12vdL1s08VTUhkBLZ6lT0S8KntUhNoaXR9zzFRB
	EjHIdbYDVLOF0IN6t5ZPelRgPh7qDgbzsY9Ixfi/kswoUEKUkhLnEslk4G3J7iTos6CX9a/6d5Q
	+y0zhe5eseNNPaHqutLN2VFw0dU64uIXpd0ZM7lsKymp5HhWB3j3I2wW/xgsm5C3EmpexOltSeE
	kqrxNhuXa4pbEtalSISZTdvdL0VNz/iqBn1pS+TS3ljl6oPapqPRbwilkHQXLFmxVmsCAQ15ZcE
	f9KuvOp8U5mCIs=
X-Received: by 2002:a05:6820:162a:b0:6b3:6444:46e with SMTP id 006d021491bc7-6b6facde170mr3929160eaf.8.1788521694939;
        Fri, 04 Sep 2026 04:34:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243a9388sm6054536c88.10.2026.09.04.04.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:34:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] media: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:04:41 +0530
Message-ID: <20260904113450.15838-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_043456_176583_9085AE12 
X-CRM114-Status: GOOD (  13.23  )
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

This corrects 3 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (3):
  media: fix typos in comments
  media: fix repeated words in comments
  media: pci: fix repeated word in log message

 drivers/media/dvb-frontends/drxd_map_firm.h                   | 4 ++--
 drivers/media/i2c/adv7175.c                                   | 2 +-
 drivers/media/i2c/ccs/ccs-data.h                              | 4 ++--
 drivers/media/i2c/hi847.c                                     | 2 +-
 drivers/media/i2c/ov772x.c                                    | 2 +-
 drivers/media/i2c/wm8739.c                                    | 2 +-
 drivers/media/pci/cx18/cx23418.h                              | 2 +-
 drivers/media/pci/saa7146/mxb.c                               | 4 ++--
 drivers/media/pci/saa7164/saa7164-core.c                      | 2 +-
 drivers/media/platform/mediatek/mdp/mtk_mdp_ipi.h             | 2 +-
 drivers/media/platform/mediatek/vcodec/decoder/vdec_ipi_msg.h | 4 ++--
 drivers/media/platform/renesas/rcar_drif.c                    | 2 +-
 drivers/media/platform/renesas/vsp1/vsp1_dl.c                 | 2 +-
 drivers/media/radio/si4713/si4713.c                           | 2 +-
 drivers/media/usb/dvb-usb/dib0700_core.c                      | 2 +-
 drivers/media/usb/gspca/ov519.c                               | 2 +-
 drivers/media/usb/gspca/w996Xcf.c                             | 2 +-
 .../atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h    | 4 ++--
 drivers/staging/media/av7110/av7110.c                         | 2 +-
 19 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.48.1


