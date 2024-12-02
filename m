Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5A5D49795
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 03:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vh9tD9SrY2g72tru/wF+GzXI2rvH2WwAaYCCUwc+uu4=; b=Sc+pPk6SsFTNaaiIoJ7hL3GJ17
	XTcSj0wLq1r0B7qZQP4WB2pYcYgYvGXvfMoaMcfbrNkWn4HzUJs94tV4TYuSQ0DP6Th+Mb8FsRXh2
	fEKqNAEJ09GJ+MONaQYRkbsr8gtEqd0Evw4y6r22v6pHEOekHpoWg3jgRrjMQHc17WzE8U+R13rhF
	dKefiE2GPkG9KOmpjxxw2XXtrcV2uwW48+lsn+Fo+G1qOQtjZB0huBKxpV+Rzc/BP6Fz+M8PgHu/N
	PNhTn5sPM+JKujh1IjoBir67b1MOaYlO6giLJ3c3MwVyYiXHDmCUOykiUMMgW890ze/C3SKsRYFOu
	L96aN+Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx2x-00000004vlr-1mB7;
	Mon, 02 Dec 2024 03:24:27 +0000
Received: from mail-pj1-f68.google.com ([209.85.216.68])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHwyB-00000004ukt-1KTd;
	Mon, 02 Dec 2024 03:19:32 +0000
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so1842603a91.0;
        Sun, 01 Dec 2024 19:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733109570; x=1733714370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vh9tD9SrY2g72tru/wF+GzXI2rvH2WwAaYCCUwc+uu4=;
        b=Zzi/56GEjOH3l9kIRxQo7eJSAULiIJdjTq0plojxCCN4cgWKvPNjaTT9IiX+xW2UWD
         zs+etmMQdrL5wsKiQyh7zfjAGRrnMUJ6bKW/wGRtIu1cCysjTgz/KCaB16dcM5DagWnH
         EDbWU1dLputNOZjwVt3FqFlIUe+lGO3lmoUpGuMLh1KanlgX8xw01oEE4IaUrNvt2MM4
         hFMvPoQKErKrQ+PKEmyG3CqaU9cE5ApMcCbPrzGsk4/S5c8bl1r46csUOKx6wZxoTAOB
         GOIR6a8pJh+OO7a8GqzFnVN4N2IIS8qfE5SBB4+kXBAzcjBhxgW5GWyaIz6DyywoGMV3
         2f8A==
X-Forwarded-Encrypted: i=1; AJvYcCUKAdxWZFEkWuI8GXIyrallgoqKBBCBNlXYXIQSg1zmYOc5bVI929ZQHnKm7ZKd5FUQzJhkq/0JmcZki2itXpk=@lists.infradead.org, AJvYcCV4LKfmRud+POzIRPg4vX3u245YEQ9zNv6rZwJsgkgk8rWyoIMKneawCzSd7momzeAOZywPBfcSIQ9H5RFXTLYQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3+u2M7aR4Zs8TPJMAuqCFyoozp03X2nwnocsooZJIfjcZDfmM
	C3k5oKMRqw367WWmqVm09sQ3gsyq90ENfQWVpwZOxqod4loggSFLHeEHkyvASR9UcA==
X-Gm-Gg: ASbGnctESwVgb2gvTqp5Wi2fADLuAliKszqdFSyAuzGfPI32M2yBdGqexc1ZVBREPco
	/hgurWcaiLq94lu/IQdO4LIi8f/WupbOI5he7HN2QHgcCrBcNVq1bNQXxjwEjBZEG9JhvU/z9AL
	NCtTuSicgEdqeLXhTSIftzgFjm6zg91hVlhjZVKel2RDDxMPKFTqApvHvUBwa+Fko+co6Yc83fM
	bzGzEdm/xMLJOqDk9p2wzU0jhHHamuqoEEgOqrzu1ZCeo59GyEx36fqqY5iSMiGmkKAWY7rng==
X-Google-Smtp-Source: AGHT+IH7C1NY/qRNbiAs+CizDGqF/VvpgeXetIUzpHeXj6J4+ZGypzWJxzoRraQ19KSnD28F1l8fQg==
X-Received: by 2002:a17:90a:17e6:b0:2ee:6900:1439 with SMTP id 98e67ed59e1d1-2ee690014b1mr15752762a91.9.1733109569845;
        Sun, 01 Dec 2024 19:19:29 -0800 (PST)
Received: from kylin-ThinkBook-15-G2-ITL.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eed19aa971sm540723a91.1.2024.12.01.19.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 19:19:29 -0800 (PST)
From: xueqin Luo <luoxueqin@kylinos.cn>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: howard-yh.hsu@mediatek.com,
	benjamin-jw.lin@mediatek.com,
	StanleyYP.Wang@mediatek.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	chui-hao.chiu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	make24@iscas.ac.cn,
	xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH -next 0/2] *** fix overflows seen when writing limit attributes ***
Date: Mon,  2 Dec 2024 11:19:15 +0800
Message-Id: <20241202031917.23741-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_191931_358116_28CD838C 
X-CRM114-Status: UNSURE (   7.63  )
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

DIV_ROUND_CLOSEST() after kstrtoul() results in an overflow if a large
number such as 18446744073709551615 is provided by the user.
Fix it by reordering clamp_val() and DIV_ROUND_CLOSEST() operations.
This commit was inspired by commit: 57ee12b6c514.

xueqin Luo (2):
  wifi: mt76: mt7996: fix overflows seen when writing limit attributes
  mt76: mt7915: fix overflows seen when writing limit attributes

 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1


