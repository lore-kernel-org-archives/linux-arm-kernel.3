Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C422CC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4P4xEM9InT1ACkFaSbk9oo50Oi4Re2PcJ8ZK5DAW0k=; b=43/hqkdLp4hLCSUnia7mfBSFTr
	Oe8JMMkJbLsloXzjQBCXntBnY38hsYihSfUzn2rPGo5Z1g/ocNNBUnv+VY4VDC0xG9KN11jrAxS+d
	Nd8YCAUh3FgQTiyLgJhiSA4d+9uw/yPm+ZsYXCU5hRzOjcLzfpReo1ckWE6Wj0u5lL2ITIvV6TC93
	qhUHgh1CI9To4dQhqIoMqzaFveC8nwlCcK6KN4GUZiJNWdTtkvHZiSPcYd0Dik+TLS3xLXMrfTPfT
	qaZppp9zRecd3cxRCagB9YfOXcLxR/IzUvqkKggyVRhRcw3yBYi+t0hKoxTfXWOryQybYIACnfJBj
	wggVxDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQ1L-0000000GCZy-0V7s;
	Mon, 24 Aug 2026 08:27:07 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQ1I-0000000GCYC-0poV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 08:27:05 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2667051a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 01:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787560023; x=1788164823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4P4xEM9InT1ACkFaSbk9oo50Oi4Re2PcJ8ZK5DAW0k=;
        b=IsTjCejUOLRTwNqsKajZshrjNql028j4Rxv6GgbQtucDjmZKVxnDrjp6z0tTAW7KIM
         nkhs5Lc7jmAKwy462ILeRzqAF3SjJoDosyOYcjsBLgT1w9I2iDY2i42blNWuFGdnHkQs
         tgbU28148LWBvGP1W4S2xfw8WB7GFh2UdPdWcd7LB5anEWMbvXSE3DhpxcGyTO2WWEeN
         Bp3R1HMbW5olKZpTCa48kbZZMHTP7oPVjXYZTxcBlmlrufEkYRxtXkSqbfyewKtNzFYn
         PL36kKuQbm0t4/y4TciEZxMGy86BZbidAziuPZN507NOxt4GGNTAFMkW/38gH44iNFk1
         Y01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560023; x=1788164823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v4P4xEM9InT1ACkFaSbk9oo50Oi4Re2PcJ8ZK5DAW0k=;
        b=dxI6TGkGo8d0f6FZJDvoJGi8HY0iRvXGtdZmSB7seyzaz94n/Wlj/E/nAAlsjAFEJZ
         UuEOovGGlzRQ3omSWk9HaQQYm1tZvSsfdFURUSCVG7AiWSO+JVF/tvfcdoBLnqf/hlxf
         GWwL5bGgFxyl/4JQJVbiPBANxuji/xwEfwnQfN0tiabMdbh7+bhf4IWWan0STu8lVhxl
         9t6AhrsTI3cRBHKoneDZiKg9V1RTOHsgdSlmAaUsUV6bk6CCu0XE/19CvjokDda6mtNI
         zgPVMv94SqplIeuN1CgbHjDB1o1lU4CA9D2dZT6nN2rYhAc82dYcaR3RxgOFyxMShS0l
         FGzw==
X-Forwarded-Encrypted: i=1; AHgh+RoW1w0QLLBdM7wk3lpNx9fUMJv3jftjkcM3Wo0k/dR2TBJJodb89fseRxX6O2v/uCGvgdhNldPCSC8ms9XmRMjX@lists.infradead.org
X-Gm-Message-State: AFuF++nKKr/oQXV0s2xKmO/p5I3Q2FuygqqnQdj5rHBXjiGIcqQQaT0J
	1c0E5ebgvKGBhX9ubVrOxDcNMGCH4stU0Oz1rqpMU0raIxex3kbIa2LN
X-Gm-Gg: AR+sD103GdO+ZJ+1bOO4Ppn8AdIR7JTEOKoSOmWUOzu29vhs7PpEeBC/fkXrGfsqwBe
	y+KAY9Mdy9k5HMonwUzXJMaN/ivUzyLH9nKivjoTlcrmPhAdf5T3gaujcMbOyDOvVkuOJjhApOu
	2u3LIqV+DFJtpkpghyGSlfRpr+IVBY32ZRdliPSB4b4R+prlY9OdzGGfmWI5jj2rcPwymxP57CW
	6SggFS7k8HRPWoMmjRwXLWSsyXkljZnBv2ZadoURCYH1jiZGGHyqv0Xg1RJDDJZbqAaHkndT8NW
	X//PX5D0W3OFuKI80OfUmfSdU4yolp4p37ctuIIroBYIW8J2ZCOAIOLMt5QWQkZsC+orSRbUG0j
	H6MGXDx5qrB9UBka/Jz3qWOo6C+4Kor64CE8kIlOvnvQNEnW2X8yb/aGJch0hEMq8WW2GLv7iCH
	qQhIBZm10AiQxT8K8239K4pdg7MMagIL6vk3B300AhR4klrb34fbZwUaS6q9g0/016YlQG4/v8V
	U9SrwwMYA06jwOQhWLkiNdcfrQv/GSsuzeRmg0yn2QoYc2u+HTYdxq7VQSiX+qr2i6T0hvOttkS
	pmiqGj12FOWFukZ+MuEFlWNOw0aAQpuDdNTLnrP9YGhAp83KG8orJx2c6rjPmLw2axwY4pJyDze
	q1NDTcrp/oVWL4JfTUaL78/anfmUj20hADbnAZ+RsSTUPA6k=
X-Received: by 2002:a17:90b:3d8a:b0:395:4de9:b30 with SMTP id 98e67ed59e1d1-395c353e28dmr45053163a91.5.1787560023127;
        Mon, 24 Aug 2026 01:27:03 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm25994595eec.7.2026.08.24.01.26.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 01:27:02 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] soc: apple: rtkit: reject syslog indices outside the entry count
Date: Mon, 24 Aug 2026 14:11:39 +0545
Message-ID: <930eb129c35cdffb877b8fd16662a3250a0e2ecf.1787559303.git.acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1787559303.git.acharyalaxman8848@gmail.com>
References: <cover.1787559303.git.acharyalaxman8848@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_012704_244200_60ACD3EA 
X-CRM114-Status: GOOD (  12.76  )
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

syslog_n_entries is a count, so valid indices range from zero through
syslog_n_entries - 1. The current check also accepts syslog_n_entries
itself.

Reject that index before deriving the shared-buffer offset. The shared
copy bounds check remains the final protection against inconsistent
firmware-provided layouts.

Fixes: 9bd1d9a0d8bb ("soc: apple: Add RTKit IPC library")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/soc/apple/rtkit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 2e62f9b3c948..da766df5a6d7 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -481,7 +481,7 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 			"RTKit: received syslog message but no syslog_buffer.buffer or syslog_buffer.iomem\n");
 		goto done;
 	}
-	if (idx > rtk->syslog_n_entries) {
+	if (idx >= rtk->syslog_n_entries) {
 		dev_warn(rtk->dev, "RTKit: syslog index %d out of range\n",
 			 idx);
 		goto done;
-- 
2.51.2


