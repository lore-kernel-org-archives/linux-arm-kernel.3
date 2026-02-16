Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66959E83820
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 18:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+UlvlE070gUnZu1JB77SJZotSZsX9PJX8xc0lTNuM0=; b=JypPvuueaUHdTnSJ6zQWT63wgz
	EDL746TWA/BL0MaKAFfdWlxNdkDq2NQX8GnhHkJntzXBlZWkXpZ874o6VQnZXJyXkBbr2Zks4aJKV
	9RS2GywN9W95SaRZvk9vlzyP67Uu4kp9c9Z8dzAT3G2MmDntvhdW/oWVOP+fn3en8lRQYcVGlrwd/
	KKk689ncoksZfnuccsEfR6Dmg/jlcEffA2qb3k0yCik9nBBxGCIxw1vlyXhcUmDA6EhuZTfsELxNa
	5mBcR8v0w1xYT/kQ6/g9O3NMI4DUlEOOLn7pGImkf0ZMaO3Od6Oth7nWKkW/e5LNEPwcJywl6gDxl
	3lI8TfqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs34p-000000078Hd-2myi;
	Mon, 16 Feb 2026 18:12:07 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs34i-000000078Eu-0CW7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 18:12:05 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1233bc1117fso2940425c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265519; x=1771870319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+UlvlE070gUnZu1JB77SJZotSZsX9PJX8xc0lTNuM0=;
        b=FzpF3gNU3JsRWYd5c4BOlXoqrZkV11GuvY6VQ5rzavmAxGKW/6uqzeUos02b697zTy
         JMfX4QLhMfbXUyb5sEUcExi8Gv7hCwIj12ycsho3zvm9Lx2BIGOpUqWQ1k66oQm/kjA6
         M9lPyXl1DeTlv5lPcgN5/WbOcdjBY7+LbIkq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265519; x=1771870319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J+UlvlE070gUnZu1JB77SJZotSZsX9PJX8xc0lTNuM0=;
        b=uD/+lUalMiYRO3yi99i8ws1RpkUVP71tldPDHfFUGzSIB2MK2TRMeOvSZkwrkTBtDO
         1aES1SSLj5m6P/UfS0bUa0dE/rVlvHtnTxC0J6aDy2EoseVKVKvufz0XEwDCkymDxw5l
         fWcpIlbfQOO+Y1da6X2AgnoUXyTTVIXU8uhT3B6fzuhb+BQ3y+vXBdNmfGL6nXJF+Qyz
         jsREUZowZvsgaDGq24oInwZVmj9DATPO+PC1Qvj+4Won2Po5XyGZk3Qht3FIBgdAwYdf
         VPhfY7NCY9JwGwZOHqMlyPMlV05typ61xjxWqiN0UhlMSf4RfEYOQOHrEVDqdRZYdzw1
         tORw==
X-Forwarded-Encrypted: i=1; AJvYcCWK1Y9q1+bJXgp9fOjL05r6pycE0h+cLLzUI7OHtnyttQdatVlRswLABURx+fSmdc5NP3Tf2LVe6UVggjSbcQYL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfc6Z9SXWRanYmtJ7MKBVmQEWRpAIZmLboGEso6ICQiS7kKCMw
	8NXKryNmmmHWohCgzLtm4yWkIm/NhcfcEQr562+1vaITmCKKl4cdlxZfXUU3ygKkzw==
X-Gm-Gg: AZuq6aKkdQUQVPucKa/Po++NTzus8k54CJGCCG/XkxwPCWAG50kqy+lnDM/SG2BK8bY
	G4hAsMF7eZ+0ZcecK+zRbbNFvD74ANg0iH/7s2btePbT2KtZaQrO4K8BiZAs/WEx6Rk88d3itv/
	OXenDgyJgV/mscqc4sYehv/8kYkAtEkdcMAsGwQFSE9lLuJgObGJPEIhA++R7+BDmKMFZpMMLh1
	aEaMf+bl669+U8/Afx5mXKD8bMzMFwLWh5YQiL/XfjEybxpUK35EfBlDh57AmmVkGwpQ/xXbv4U
	sO1IVD1C9uhHhMjaKq99YFbjGmDT0TPRnkvj4p7Oii+xURdJm7BIPK9do7804pE6cGgXrIVk6Rq
	hYofXFx7Zr26gP0QqKMfyiR5lN/DpEw0vS4rbxypysztvrQaCkXuOTswF+366VEy3jhBuVJaB6Z
	gYPaD6MEoNtXVerKfq0a1e4aL8GnLLjHXJ6VIghcj/nEk5EG7HJ64OO56y3evL+NN62fISdkeQM
	sxxIkYnQWQ=
X-Received: by 2002:a05:7022:45aa:b0:11b:3eb7:f9d7 with SMTP id a92af1059eb24-127410150b1mr3534714c88.14.1771265519181;
        Mon, 16 Feb 2026 10:11:59 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:56 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	jay.buddhabhatti@amd.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	marco.crivellari@suse.com,
	michal.simek@amd.com
Subject: [PATCH v3 15/15] drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:52 -0800
Message-ID: <20260216100943.v3.15.Ib15a93253dc4bf021c41036096b8e289702878ba@changeid>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
References: <20260216181002.3475421-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_101204_431182_B4D12341 
X-CRM114-Status: GOOD (  13.27  )
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

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward. We can remove the call to mbox_client_txdone(). The
call didn't do anything for NULL messages and it's now officially
documented not to be called for doorbells.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/soc/xilinx/zynqmp_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index 9085db1b480a..b4e751247a35 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -144,7 +144,7 @@ static void ipi_receive_callback(struct mbox_client *cl, void *data)
 			   &zynqmp_pm_init_suspend_work->callback_work);
 
 		/* Send NULL message to mbox controller to ack the message */
-		ret = mbox_send_message(rx_chan, NULL);
+		ret = mbox_ring_doorbell(rx_chan);
 		if (ret)
 			pr_err("IPI ack failed. Error %d\n", ret);
 	}
-- 
2.53.0.273.g2a3d683680-goog


