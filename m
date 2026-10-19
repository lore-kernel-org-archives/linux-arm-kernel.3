Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3449CCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 06:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uq/eCA2xlzkcjJfv8K+X7WPkfV3LE8Yc8SBQ/q5ZR7o=; b=4a4ZGvivL8Bq+nCmqK1hG3xC94
	UnW2MY+DolUzGMGIe749ZKqYgtVvrwCzFnxyJd8VDiUdki26aVomz5QjKqQKtezK1oPRxoKGwbbRI
	Y+m2/SjZi3wthxwok2TuTNwjKIyKNH2aHrkjVJeQz8f/ywOpHTBRffzPUDpGoYRQ7YwgdUixj6MIy
	k8OHhGfLb7RFYRoRuXQmz6jrna91T1f5qQ3AK6M6WD4OJ4JwAIAVbYt7YdUeNotXZC6UZQjistYIy
	K4cWeQ6zoouxAVlf6CnMoL+NBIx7xihwnywchpeS5k1okmKVLeAJGfe+zPyvoec8cWO2wjwa6YVlS
	uQ7+LH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgYH-00000006fqy-1FaD;
	Mon, 19 Oct 2026 06:08:53 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgYF-00000006fq0-26GV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 06:08:52 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-14394530ec6so490340c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 23:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792390130; x=1792994930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uq/eCA2xlzkcjJfv8K+X7WPkfV3LE8Yc8SBQ/q5ZR7o=;
        b=DmwTyHIpVsaBobyk76puoGf/UEaKGTzEAmovEfl+omjypOEsb5RME+QFEytRzA3kR6
         u9yogh3/R7chWhBdG2z0n6aOQ2KgUQEG3llqTMgEZUZkKvbmy52nJt43G159i0kuCZnU
         6E0TN0F7pRNbrnwTrh6uMMSt0bA+FuKhoYyMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390130; x=1792994930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq/eCA2xlzkcjJfv8K+X7WPkfV3LE8Yc8SBQ/q5ZR7o=;
        b=QLo0rXSBqwzPHPp5tvvEyjhAvTcXBWH412fvelHAlCApn+C9NECu2Ejf6w5LFVJD2l
         6TAgxsT/KXohkWtK1ZZFlkggrhB6XArvBb2fiVZzhJPL3wdjePhyFntOPbHU9Ug08eul
         HGhGIH9IX0NMu+C7veLqFVKmK+BBJCGwzzS8iPFdzozGG1Pa25dhUexIeuNEIhcLybFR
         U5cLMlKym9KU8KZ7NGComoT1A1f1lo1VORqEgxqhgcwrjiZqdPbzRVTIHuXRH13FgT9Z
         Wr2YNkpBB1nwkNu9J9+L7/rCI0q8Lxe4z+C0QAEbep3dHTxJ/qY9a6ba6YE9TfCGiNd4
         WgTA==
X-Forwarded-Encrypted: i=1; AKwUvBw4HN8M14gdMnXrkB09Wa58hjb8mzWL6JljWqyRMKens2ORk6X7pLPI24VyZhoY6Jk1mIP+sWnDQNGKKOpGfv2J@lists.infradead.org
X-Gm-Message-State: AFq9FYLpL3/5bJIkmvIcu+txQNlPOt9hpkZugsNDe0sem0q9/A9jb7WR
	0L88dplUy8gTz/0HfaMM8nhvZ4he2XOi6D91hke/uQiNw1frvvz+Wr4fPMGYynG/ow==
X-Gm-Gg: AYBFou3WTfC1M0CccluQhEhyHPswx0jaHg2Bk33E48gd0fVDJf2hB6ZulDl6Wfi1dQd
	phvUjm8oHfp6UNJxIYZ4YS4KwdLxQI700Eo9jB/k2wVGadD89WY+DVioqHhF6lwG/ijL3ZzKRwT
	eZOEjB6pFvtjKKg3PQQ1h+lkabTcMEH09ovJNx8co4Z3/8Ctv0h3VzfFu/G44wAgnqMmf2TCA1x
	vDBGlhegwwD3CR9RzD5mDdNWhiC43x+qeEHk/9r0xEw/aUp4cvqGt5Y3KTM55VieV5OpGqNORec
	O0XQ1htJPjoDjgAx5uQo9vtU72QFRexiuhA9psdPG8AEz/1B4UVY62XCrVxlMWJQU1ZXovTMFpV
	Nlvrp4uEfQvCPlR0NdvUpYKpQ9bqYo0uzTO65ZBYXuvxHMmd/ynSpBltZgKzwyA4PUjl7kjnMCP
	uW7oZmMaZn4wC8je/gFfweO5+jenuFseq810Ld0LiReR40L0lne5muGRz+oOFnMwVOhou9nwzPR
	Q9t7UkenrK0+9Cnu9UP5Nl71H8PzxHlaX3zimBeLaOkUfBYu39XWbxFWw==
X-Received: by 2002:a05:7022:170d:b0:154:d06c:e70a with SMTP id a92af1059eb24-1851285ca17mr9287698c88.23.1792390129597;
        Sun, 18 Oct 2026 23:08:49 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:b024:9aa2:76e6:57d4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm23281190c88.8.2026.10.18.23.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:08:49 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] media: mediatek: vcodec: Fix NULL source address handling in decoders
Date: Mon, 19 Oct 2026 14:06:18 +0800
Message-ID: <20261019060825.4163770-1-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_230851_554034_2ED5F92C 
X-CRM114-Status: UNSURE (   9.79  )
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

Both the stateful and the stateless decoder workers peek the source
buffer and, if vb2_plane_vaddr() returns NULL, finish the m2m job without
returning the buffer. The buffer stays at the head of the ready list, so
the same job is scheduled again and fails the same way. In the stateless
decoder the media request is also never completed.

The two fixes are split because they fix different commits, and the
stateless fix also has to complete the media request.


Fei Shao (2):
  media: mediatek: vcodec: Return source buffer on NULL va in stateful
    decoder
  media: mediatek: vcodec: Complete request on NULL va in stateless
    decoder

 .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  4 +++-
 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.56.0.176.g3575e65682-goog


