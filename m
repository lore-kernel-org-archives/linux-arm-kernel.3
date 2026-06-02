Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4ACCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 11:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yMMmEmjYZwsBNnBuWQ83+blc3WIchW2nd/w7lmU2Wns=; b=W70aGdnC8CP4QrasgytwMVohJh
	XzyXJgopc8VN3q3AcLb2VrB4WvdMKSe9mexWlcBfhOPdQ5cyOqyYU3jRS0uLuf3x2mBeRix1R2w32
	jAecIyIdnZOBLUiJDncHa3DTNBCjcq4Tes/++ABM4DtJiqNVWoVzE5kB61slAdA9JQl1jgg3hBzO1
	UtPGpWuWPPDD7TUf9O84A/8ud21VnvV5C7u0cWC17p9ZTpJ1tPRwSkr03ld6ytstB6nN0Yg5qK7Hl
	S+KKu9WqehZlt2wsFqRgFv0dxjT85ZrniLIzTajwgaRBosL60yGJKx5WVopEEmzZ5SYkFG3A4/PHa
	bLVgSTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNYI-0000000Cu7j-2fNC;
	Tue, 02 Jun 2026 11:44:58 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNYF-0000000Cu77-2J64
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 11:44:57 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8423f236418so1060130b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 04:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400695; x=1781005495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yMMmEmjYZwsBNnBuWQ83+blc3WIchW2nd/w7lmU2Wns=;
        b=M7AIravKHXOhfwnHFmvCqkjrxMnpQUQgEB0qXfnjm0gScJd+qqR0hOGJ3bURAsF6Ww
         qjkUl0+/ESlMFUNhGcf5EG8QK8lJah8nhTreT/fEabrCWpJoAg6pS8kz64eJrH8+kRnx
         o3lIJHGxzGGyJ//InE84aNbV0Jy7Ma53fg5Q8k+uH16BYGw0P3pswmdR+LlRZ04HahSS
         gfCFd/hZlzW7QEWa6iTVEwpMLFt7Ej4OqViTqKbbVJSV57yXIIARyFwVn7SDehMl9vvr
         eRuoSsXOoEwo7xTFb8dqxeLd92OuFsowjWTbUoccykvwCj3govZ9KJzE7RjPsweKy1RH
         qzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400695; x=1781005495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMMmEmjYZwsBNnBuWQ83+blc3WIchW2nd/w7lmU2Wns=;
        b=TKAe+pCCfjOU88ZLbhcNOODkdVVQ+2zIsG7yfmRQr2gL5tc7DGz+Y7Lrkf0nMzzxgn
         5zEh6mYSND/965huJkABnuQ9efPRjsff7G8YedReFB53b2XXhe/GuuX6A8d3XMGWz7US
         Vf4G+qQc/IsjdbuqP2mse6rjmYvuw9JCDGU5T6Rm/0lcthKUPcoTrNEZdoaRlFQ8VkXj
         RRezxBdZYbW5IEkVitdaCFbgF8/4BXojPbLQkpZPckIwm0DB64rWse61SE0HdkKjRP+n
         GfsZiYLo2JMAi6pUWD85sFuLvmiYXfq1+Xca3mS1noz5YnYTKsLnTT9UYRZ0FGSreCWU
         9VeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8yGCRPa0iKzbQv25oVIc13aEvRLtqUaO9uu0ywhucfq+2AYdCDrnWybEicKAL156MQLD+elnP7dI9p1G7F4bR5@lists.infradead.org
X-Gm-Message-State: AOJu0YyVrDYdw467AVan3ZqyWpkQscZ0D+4/jlQv3rGMg9bXGo44aL5b
	qLF3S+CGaL26KDNRGLV/xBSK2ofcrlkXSNKg8w49iQp273AgA8ncCh3a
X-Gm-Gg: Acq92OFpqr1hyOv0qo0bnVhF+E8iUgzuk84iBbKxpRXL+q6RFtdHrAhiEIupkX3mBzL
	AoGcoQ67tBX7XvsYRUpiseS9p2aghwArMvHtXLbhRUoUmTaBogw5O6JZwsxscErUp4rdXcWCgsi
	D2Y/0bb5sr8EAzTpFnQo+UteME0+8VwtBrT0avJpZySflQI+4V7zVPbdI9G6KLFpYVXEckjtJwh
	QOEKN9cQeJe/vgIoOJIGqbWEzl3Te21ydf9w6koPQmD26j9oH7iFwj/VdFJwPT1JcOydI4btXTk
	iUbDo/22n8EuWf//Yrp+doDEKfUD9whwU3gpwZAcUo9/C7++gmWhnPjfDevgHvu8yXpC6uE2gB7
	+S/IqAEx/fRUPehZFU/PHwxDepSHhiFza3t5Zye5W74YiZpS+Zo3pz00rMx7DtcaHeyf4xxylqm
	fO810CqBfapTQcHsf3WN3vM8np7G7IpltPc0KY5RS3hHP0QmGRp3cBwxQn8zsdqTz+KuB7
X-Received: by 2002:a05:6a00:3762:b0:842:2f3d:dff2 with SMTP id d2e1a72fcca58-8422f3de52amr9540311b3a.34.1780400694676;
        Tue, 02 Jun 2026 04:44:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm12025224b3a.44.2026.06.02.04.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:44:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 0/3] ASoC: sunxi: sun4i-spdif: Cleanup and runtime PM improvements
Date: Tue,  2 Jun 2026 18:44:34 +0700
Message-ID: <20260602114437.50324-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_044455_593330_B7E81BEF 
X-CRM114-Status: UNSURE (   9.32  )
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

Hi,

This series contains a few improvements for the sun4i-spdif driver,
including guard() conversions and ensuring the device is resumed
via runtime PM before kcontrol register accesses.


Link v1:
https://lore.kernel.org/all/20260513105003.81880-1-phucduc.bui@gmail.com/

Link v2:
https://lore.kernel.org/all/20260522095401.72915-1-phucduc.bui@gmail.com/

Change in v2:
 - Switched from using guard() to scoped_guard()
 - Added runtime PM handling for kcontrol register accesses.
Change in v3:
 - Clarify in the commit message that the resume sequence becomes the
   reverse of the suspend sequence.
 - Add Reported-by tag from Sashiko AI review.


Best Regards,
Phuc


bui duc phuc (3):
  ASoC: sunxi: sun4i-spdif: Use guard() for spin locks
  ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register
    access
  ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence

 sound/soc/sunxi/sun4i-spdif.c | 76 +++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 34 deletions(-)

-- 
2.43.0


