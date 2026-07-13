Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4606CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 06:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5DuBYLMmVuyNVqyuWFYcjB12jP9JwOPGMRdlqI4bM0=; b=2mq5PMT4cq+3zxaZd0Z9RFQl66
	tqYS86aRRKjqqoHVAN+CyY5KBTxY9t6eohohszNp+NabbwKn/ZNj/ZxQPpcKNx7SwCKpYE1GkJp5Y
	9mAoVa2Cnft0/1oc0mFs+wIyd4XdhdrUERoQ0spVGvSYZKd9yYYi7hyqVChXuVFZIKLiUqhOD1Fv7
	bxE7P3SEzn/vWtW8zu2kL1cTW4ZtVKrLou8zc8FkGCm8Iq+itNUOxE+d0b8uU/8PCJV7wX9f9S6an
	f1Dl9ya1qVuYEHsOBh9JWepWycDAzYWWgSJuK9acWX9gFFYJVa8EXFcfFKj0omtAAGYa3s9o/VVbP
	nA0OKgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9pt-00000008CHk-2Lru;
	Mon, 13 Jul 2026 06:08:13 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9pq-00000008CGA-2wWV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 06:08:12 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so2006971b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 23:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783922890; x=1784527690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S5DuBYLMmVuyNVqyuWFYcjB12jP9JwOPGMRdlqI4bM0=;
        b=I91pqJ9w5YWnUPfntrhSpDL1wMo6ENXUr8+mIbBT7ctEHSNqLUH6bAgLIAe3NGphZB
         prqoams05OgwxU250alYptG0hv2vgrCSpXkh5v7Q4KDNwc+yCpEzYtwzrsVsYXh2dVHl
         0xw6zURZWD36unB6G5rLfd5fhbMpUykUdpnyf/+xvpJVadKFe8MmpRW3W3YE6qgSQ6mJ
         pjQLgzXNmPf+sqvU0rc4e9CBSwgr6cSTbvSSkBK1NPrT7TbiiJXtcZ3Z3jeA69aiTATb
         kxd7U96Z4wYwslh2T7qy9NgDNInHxMRu/zpnFjUzE94bto37UQAO9qAUlBmfYrds74Yw
         1+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922890; x=1784527690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S5DuBYLMmVuyNVqyuWFYcjB12jP9JwOPGMRdlqI4bM0=;
        b=MV99nHUeOPvcRy9nfI3TChuJ90hMtcoNtJkWwJTKDd+Xc8t/MNSOBzPjHDZsXIhi5H
         Njv7+BEXK4mF7CeK+S3f7y1B7SV4wt3IGAAs4ODqWmhNHwr5VV+Qhav15vC6bHE6HCO8
         ga/r2zpn3DOHG3FvHMLfWSzC+oXGLA9Z+BGKYC7hkRGUEtlneAlRhG/9qW9O4+s3uzL0
         PpCZR06tol+pf+hUOq6q396ZJJuB0F227hNK/QO8nOTrLVcUeJDpC3OI0mZw0HdTvd9V
         spMRIZ7NDRpvIHeX/gOv1mgsVnkWanfZk8ZdS37DysjAlIVIAH1Ws48Ls133G+lFJrjV
         XVcA==
X-Forwarded-Encrypted: i=1; AHgh+RpjKN0ZcXWqLJgZH4eyIRIoFed0ajdSXHnDISioTpp6A/7tc0h/W4MtcC7xIzDzIS3OUGMa7/qBFGVMS278sap9@lists.infradead.org
X-Gm-Message-State: AOJu0YzkxDeOvbaLwFH4+HUQIjjCvO17CoOvvPHxOTlFVkk4qZl1gtyS
	QfMx1LGxQT3/XgA/4iLExmYnzacnyX/pSDyomSHCtFwM6cDyyet4EeKy
X-Gm-Gg: AfdE7ck20B+9Qo4nJbsuXwN2cobhoiOhWdorh96o6sLkr3lbIkwQ/QgXK0VkJfzb/Ju
	/Ug153zuVkJbc42FkolYABAxhXAtDJAa5Gyy2SR9mE9uDdfTxorM0aeDFIihqvAuioPwpqSPWWR
	9Bh8KfxrL+osz0dm13QfVyGdpSJ3CG4YOwecPqzOCYeX2k6Q5z9flF3kQQZMSG+2/LjLg6Q6esq
	GdVHZAQlBv1HDU8nUbkkI3WyfQ1T3zmmi+Vrh3TcOsxfgKy4bzvYhxG5UVommMzWozahzi9QWZ8
	alwhO2sTSXD7zzp7knxhOMCD+lX+Zn3HR5m+bhvMKSp0eOw5ewTL8d1oTr/KVeH8nBRc0gLed+J
	BMzJVv3UNdp7VvdSfr+bt+9Du8feowvsCxwTUT8QmZUKqrTnTni+IZLFLZQmRanPS5VSDoJCPbg
	JyB165apn2tSy9
X-Received: by 2002:a05:6a00:3d4a:b0:848:2f74:1d5d with SMTP id d2e1a72fcca58-8488971cb6dmr7128041b3a.67.1783922889853;
        Sun, 12 Jul 2026 23:08:09 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a3c16d1adsm771795b3a.38.2026.07.12.23.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:08:09 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Vladimir Moravcevic <vmoravcevic@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Swark Yang <syang@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	kernel test robot <lkp@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH 1/2] spi: axiado: merge identical if/else branches in ax_transfer_one()
Date: Mon, 13 Jul 2026 06:08:06 +0000
Message-ID: <20260713060807.7-2-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713060807.7-1-bbnpreetsingh@gmail.com>
References: <20260713060807.7-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_230810_741086_B5E2786F 
X-CRM114-Status: GOOD (  14.11  )
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

The else-if arm taken for RX-only and full-duplex transfers and the
trailing else arm in the RX bookkeeping setup of ax_transfer_one()
have identical bodies, so the second condition has no effect:

  drivers/spi/spi-axiado.c:433:8-10: WARNING: possible condition with
  no effect (if == else)

The trailing else arm (neither TX nor RX buffer) is also unreachable:
the SPI core only calls the ->transfer_one() callback for transfers
that carry at least one buffer, see spi_transfer_one_message().

Merge the two arms into a single else branch and fold their comments.
No functional change. The redundant condition has been present since
the driver was added in commit e75a6b00ad79 ("spi: axiado: Add driver
for Axiado SPI DB controller").

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202607121827.djB0zLAj-lkp@intel.com/
Assisted-by: Claude:claude-fable-5 [coccinelle]
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 drivers/spi/spi-axiado.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-axiado.c b/drivers/spi/spi-axiado.c
index 649f149617ce..c4bc7a50d6c9 100644
--- a/drivers/spi/spi-axiado.c
+++ b/drivers/spi/spi-axiado.c
@@ -430,15 +430,11 @@ static int ax_transfer_one(struct spi_controller *ctlr,
 		/* TX mode: discard all received data */
 		xspi->rx_discard = transfer->len;
 		xspi->rx_copy_remaining = 0;
-	} else if ((!transfer->tx_buf && transfer->rx_buf) ||
-		   (transfer->tx_buf && transfer->rx_buf)) {
-		/* RX mode: generate clock by filling TX FIFO with dummy bytes
-		 * Full-duplex mode: generate clock by filling TX FIFO
-		 */
-		xspi->rx_discard = 0;
-		xspi->rx_copy_remaining = transfer->len;
 	} else {
-		/* No TX and RX */
+		/* RX-only or full-duplex mode: copy received data, with the
+		 * clock generated by filling the TX FIFO (with dummy bytes
+		 * in RX-only mode)
+		 */
 		xspi->rx_discard = 0;
 		xspi->rx_copy_remaining = transfer->len;
 	}

base-commit: 5f1b513690edf51727e6928b97705b6437f9a98e
-- 
2.43.0


