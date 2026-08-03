Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485A1C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 04:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EDVVXgDFGwdwAJNFq0Lnv/4zVTHHlmavZdUyT2s7HFQ=; b=wTG995gncNc2k7XNnUt0OIfUjM
	onuu35OclrEtov7kBin5K19bSmFz0NIyW3eyT6mjRDeNK88hN8kqaHnUemyxsYB/QMi6w4oSvllNx
	RPWSxOZ/ez1XXbvEuQs3IIprtJWH2Q6YQZ7k+U0M7To3ogiqNADtH8qnRKhwiM4De67a182JrPXDX
	di8xwzMPu/3R6+OR6Rai30r8BdRkKdpv467lHCstQD2aKDku0DYTcT4VrIMi94FgbTAPFouVMw/64
	Jk/0jCG+MZ270QLaiqGcKe1eOH5NoPf7KYZh9VlR4Upq49otWap8Ai1RrK38i2/dEgPzgI8eRQbS0
	kACu9hOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqjzi-0000000GHYY-3kCD;
	Mon, 03 Aug 2026 04:09:42 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqjzf-0000000GHXo-2emU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 04:09:40 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-969524c1aefso944921241.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 21:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785730178; x=1786334978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EDVVXgDFGwdwAJNFq0Lnv/4zVTHHlmavZdUyT2s7HFQ=;
        b=sXmbioUvQ14HRHfeV6smBEEnoY2GG9EzRgB7xLgSWHFGDXOy8TfM1DwT29y5wHcJIM
         /NXC/1h1fx7Kq/4bo23+XGeHNRC1Ap7bn1axFowIc4lU/ogAiJJh+QSK8Yec18hDnc/r
         WuGaN5w4Ji2WdwfPKj76mnT7VS5poULZC4HG88SW3mdPeSwBRlDbHnbUVnh05dpnxZR9
         UqHzPc3me5ZI1vI6tgATyqlkufS77/KAOXFxnBo5SwzTBbOTagTwRyLtu5O3w+UJNujL
         Is7nQZRd6ceeN5RAREaCvfCDwIb3UB/UyCQ+ztJ04ftMHUvkbJtdhSejUah7WSdJiCuS
         M4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785730178; x=1786334978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDVVXgDFGwdwAJNFq0Lnv/4zVTHHlmavZdUyT2s7HFQ=;
        b=AVfESBngzRKlIefB7W1fYRPzgveS/7ofwyZBSqZ7eJFKyw3sR0Jq1u2oL8/Osghw1g
         G7zUg5pb1RCAI/JOfyXaDHKR1MLiQ2FwhCq2F+HkmmBxd9j5tcrUKqw9kfiSTIv0jG4B
         j7H0ay0kvZ1CeMJOWFA56bs8fDKRseoLYN5yEu2abU1n8y952w9tIotMbKqkZkgBSMmv
         +gX15Q0T4I70GOUsIMV5NzSauxC0rcuxxonmg1fNqLABhg0+X3yq8tz/YB5C6kA2RB3j
         G/k8tzCvCI4fotq23dpw+lUF+rbYXu/3pW3TETtzNmkqX33fYBLu2JXljT61cGSz9CJT
         EChw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5MvGQNsmot/s2o4z4qb6khNfTw3yZ6k3hydA6zlSmRf7DQM3LpRuApHFKhxzzSX9Dqw37CL7jHoXk5q5uo2Gl@lists.infradead.org
X-Gm-Message-State: AOJu0Ywpw+CjNCdgKyPt4iH75zTifRBrnqV3KRGKsPG4kyccVjeRUMkz
	9jm0Ruc8ZEG0Ty4zGi88xnLJBNu2bw0ZVdWw6J78HnUj6DQhiz7pURZ4
X-Gm-Gg: AR+sD13vmICqIpXB7PNUKqSqHjWta+9AyjgxHLKZvr8SOpOo5gOi86JFb6+/T6xRwLh
	RgloGbPZ3U1xJUbxFlT2+tQmtjWT/O0ckaj508ZOQZ6t1YSiua7T0wwquM9Y+muaRwNnClmfoyK
	Hkemlf31tUWACEiHT1jA/TpqUrq8Aqv4nknYGET+touMFvHsT44wWuHcza5K3tWsTv9mFtQBKBi
	1Hat6byCRN73TBdaCbTdJn97KOTFnfK28DyuEUkWmUAt+8MAwppfLFzWDgDPKknrb+Iln0QL4m2
	1rquf9NmLAo8fRxCzopr35PHPvAD1bW1ANqpOt9kIXpSpyrLy1TmuX0bPIFxLrVQ9O/Ok6N309J
	OijJW9LwH59OADA9JzpQPJTJd5f43QiN33Io0vqsPj4ijiZNSjSgznZD5Hbb0fFEBIJuAx+mwhP
	IJizZSiXoDKMqz72ZkD40KM6x6K9Kr/gWwp6wQIaZD9CvhqknpwdOdi5CdVe6evZ5GVhspihtN4
	L+wTfQ4Uia0S6TerXgd8qvClZ8FT4JWalojS7t+2ZE=
X-Received: by 2002:a05:6102:3e82:b0:747:4dcf:189e with SMTP id ada2fe7eead31-75b2225f8bcmr5708135137.5.1785730177794;
        Sun, 02 Aug 2026 21:09:37 -0700 (PDT)
Received: from lucas-inspiron153525.. (host110.181-12-179.telecom.net.ar. [181.12.179.110])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-759b8e1e8d5sm5366413137.6.2026.08.02.21.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 21:09:37 -0700 (PDT)
From: Lucas Jeffrey <luquijeffrey@gmail.com>
To: gregkh@linuxfoundation.org
Cc: florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Jeffrey <luquijeffrey@gmail.com>
Subject: [PATCH] staging: vc04_services: preserve bcm2835_audio_write errors
Date: Mon,  3 Aug 2026 01:09:28 -0300
Message-ID: <20260803040928.12453-1-luquijeffrey@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_210939_677156_24CC308F 
X-CRM114-Status: UNSURE (   9.85  )
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

When sending audio data in multiple packets, a successful later packet
could overwrite an earlier failure in status. This caused the function
to report success even if one packet was not queued.

Stop sending packets after the first failure to preserve the error.

Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index 3156cb8392f4..5ac23cfa7983 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -365,6 +365,9 @@ int bcm2835_audio_write(struct bcm2835_alsa_stream *alsa_stream,
 
 			status = vchiq_queue_kernel_message(vchiq_instance,
 							    instance->service_handle, src, bytes);
+			if (status)
+				break;
+
 			src += bytes;
 			count -= bytes;
 		}
-- 
2.43.0


