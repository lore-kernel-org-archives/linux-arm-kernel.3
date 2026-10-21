Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6FC60A261F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 12:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BAcExYSh;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LU8cB6vn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1n1hBWFrb7+3IcENFJ0R4sSlfudB755zznR4XrxZXc=; b=BAcExYShhrHk7HUNMNH+x8NMjP
	8OPspVdoien4ynMsDk4KwGU6TwOkPIu5/s8z/wYonzxl7HxPSityHYeX7PM50RiafzmUy9Dqk7QCZ
	nk5spYBij8kOfDI8GqBeyNC4UoJ8xjunyC0r7TQ+SwxuBYqQs3PEgV+qO/kXVA40JA1/Y453KUooA
	fdezzCQ0manQVmHdrsul1cf/JU3LmfTS2iyilbaYkVtlFlQyAPottfAA0LvKAFgkAh7hNgUpKIqdz
	bg4sjl9meQQzuH5Cz9AwyP9hwNYPJxVu2h0fohVfa6Sd2cRWUyZKgd0dmEJ47fiX6LrCGS/Cmkn16
	AyCyGnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVF5-0000000Bmhl-0NNW;
	Wed, 21 Oct 2026 12:16:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVF3-0000000BmhU-3lxA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 12:16:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A70C5437FD;
	Wed, 21 Oct 2026 12:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94E81F000C4;
	Wed, 21 Oct 2026 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792584985;
	bh=M1n1hBWFrb7+3IcENFJ0R4sSlfudB755zznR4XrxZXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LU8cB6vne4L6Qq8Oej/VmD3BuW0L+pIt+q5mkY8vUOpDTS0Q9Hptwta18nA5MivL/
	 8yg30K55p4JIjEgUvHh1xCY+wmXU08M17tag6LFiBMvqbG6Maltu8FV+8Vt6BZOWhb
	 10gPGk6rM6UFB2u20yZo+pTx+PjKS8JjFWTbm6ezdMWu2OOh+/o0VHTxp/ag4d/2qA
	 mYsrTR4yz6kZXz31SPJuC/tSev5QPq1LonDxBM19fb+Q7EOcz0rZS8loZbMCLnz/3W
	 t4jyjo97Zz23Ve0R5fEMnpfsLGdya+Ksge7l6SFZWNcFWBPAV0jK+06PBBt5JqyIw9
	 /yXPuuEf27LTA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
	Rabin Vincent <rabin.vincent@stericsson.com>,
	Mattias Wallin <mattias.wallin@stericsson.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 23/28] mfd: ab8500-core: Register sysfs attribute groups via devm_device_add_group()
Date: Wed, 21 Oct 2026 12:09:45 +0000
Message-ID: <20261021121245.3111563-23-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021121245.3111563-1-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ab8500_probe() registers up to two sysfs attribute groups with
sysfs_create_group().  On AB8505 and AB9540 (cut 2.0 and later), the
second sysfs_create_group() call unconditionally overwrites the return
value of the first, and if the second call fails, ab8500_probe() returns
an error without removing the first group.  Because the driver context
is freed and driver data is cleared on probe failure, reading any leaked
sysfs attribute dereferences a NULL ab8500 pointer in
get_register_interruptible().

Register the attribute groups via devm_device_add_group() and only
register the second group when the first succeeds so that devres
automatically cleans up registered sysfs attributes on probe failure.

Fixes: 93ff722e8853 ("ab8500-fg: Add power cut feature for ab8505 and ab8540")
Closes: https://sashiko.dev/#/bug/linux-a9ac1a9d-5a97-4ad3-b4c5-c7775c24a333
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/ab8500-core.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 86fa99022cb3..408bad2f577a 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1232,16 +1232,13 @@ static int ab8500_probe(struct platform_device *pdev)
 
 	if (((is_ab8505(ab8500) || is_ab9540(ab8500)) &&
 			ab8500->chip_id >= AB8500_CUT2P0) || is_ab8540(ab8500))
-		ret = sysfs_create_group(&ab8500->dev->kobj,
-					&ab9540_attr_group);
+		ret = devm_device_add_group(ab8500->dev, &ab9540_attr_group);
 	else
-		ret = sysfs_create_group(&ab8500->dev->kobj,
-					&ab8500_attr_group);
+		ret = devm_device_add_group(ab8500->dev, &ab8500_attr_group);
 
 	if ((is_ab8505(ab8500) || is_ab9540(ab8500)) &&
-			ab8500->chip_id >= AB8500_CUT2P0)
-		ret = sysfs_create_group(&ab8500->dev->kobj,
-					 &ab8505_attr_group);
+			ab8500->chip_id >= AB8500_CUT2P0 && !ret)
+		ret = devm_device_add_group(ab8500->dev, &ab8505_attr_group);
 
 	if (ret)
 		dev_err(ab8500->dev, "error creating sysfs entries\n");
-- 
2.56.0.218.g1ec904b173-goog


