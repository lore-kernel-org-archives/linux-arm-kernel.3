Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B33CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 17:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bzs9IYw1SID7rciZ9EeOSJjI2nTRXRe5o4FzwS6yTxM=; b=JN93r2FWciC1kme7xnw/jDHEPe
	gCJBkKF2TJebYO5r6fQwq9InEpd7wetxYO2peQJp58jzoB9dmtPrNzAdlj2Ax7U5G+w3y2IgjLB5I
	gRcCaiT9YuHRJJRmF0aYQUxQWcKqflRrD+O4krcbEzXCtO1WI/5Ed+Mp508LZ/Tk1Nk78EwUSj992
	YJ9Mkw4mvvDuTRCp+xa+jyOp1mPKpkGxU/JMm7lQQTwDM2v+UmAU/iHfTjx415cBun4qV4k5AB24a
	m2lFCagR9uQgcf8Ap1kdDAnY3FeR0s4siEjiS0h76sWxKPpSpwenbGKrmV7l/EM93P9ygrQLGdaSY
	h+DaXRTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaAt-00000006Esg-3XwP;
	Thu, 14 May 2026 17:48:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNaAs-00000006EsN-0jCk;
	Thu, 14 May 2026 17:48:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E524360008;
	Thu, 14 May 2026 17:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8BAECC2BCB3;
	Thu, 14 May 2026 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778780920;
	bh=SpC0Q2FuxRUJkqZhyltOgdHrXLX0XT2Kl77zMRud2Rg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cqXStCPZefM/4HVlY65OqWQEFYCtuY5dih7LDuVI6CVgR7b7glkM7rD7SpeGtT2WZ
	 +81T+kUJLGoWRSEENd7NJW7hS8zZUgxSqCxqrTm5Zi8qqi/B7zrTp0+kO+Z/x2NXAf
	 AJWjPOrs7KnxKV6xEvJWrnUaTvLJO4f3RYcU6bwaYoRQ83ngAktiGDj3x8Jhb+v2DP
	 ee53vKgTKR2Coz//T78didhhs/zzxJy5XB2vppXZZcJHdetoq0JWmYnNHl965Wro1i
	 G1Azyg7RHvfBR111A4cHwxoyXm6X443kchfC3SJCJCr+te4aM1mVYLca8BjR9cuR85
	 o8tV94wVv5pgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67082CD37AC;
	Thu, 14 May 2026 17:48:40 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamkalra98.zohomail.in@kernel.org>
Date: Thu, 14 May 2026 23:18:13 +0530
Subject: [PATCH] Bluetooth: btmtk: Fix FUNC_CTRL parsing for devices with
 zero-length payloads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-bluetooh-fix-mt7922-v1-1-499c878af1e5@zohomail.in>
X-B4-Tracking: v=1; b=H4sIANwKBmoC/yXMQQqDMBCF4avIrB3QwSrpVYoLx050RE1JohTEu
 zfW5cfj/QcE8SoBntkBXnYN6taEMs+gH7t1ENR3MlBBdfEoK+R5k+jciFa/uMTGEKEhZhZriQx
 Den68pPVffbW3w8aT9PFKwXn+AIppPYt3AAAA
X-Change-ID: 20260514-bluetooh-fix-mt7922-92bbbeff229b
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Tristan Madani <tristan@talencesecurity.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 stable@vger.kernel.org, Shivam Kalra <shivamkalra98@zohomail.in>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778780918; l=3281;
 i=shivamkalra98@zohomail.in; s=20260402; h=from:subject:message-id;
 bh=bcjmkVn6V3NtLKEjGgmZqORTUn19c/SPpadc1fesit4=;
 b=/01nuKC6TNTxIJytg/c6BI11qqo/OIDmX6XK3217Rpx6jibl/qWUCcWwasbS3GKv892fZ2oGI
 SPlPJOfwOb7Bb7mBGJhTkzaJRnWAUswPzEcElVilQ2/qgwkjMgJeW7S
X-Developer-Key: i=shivamkalra98@zohomail.in; a=ed25519;
 pk=U8kQSxcte8P8iZ6zB7phIj+Yl+i/5ntifBGuclgypx8=
X-Endpoint-Received: by B4 Relay for shivamkalra98@zohomail.in/20260402
 with auth_id=716
X-Original-From: Shivam Kalra <shivamkalra98@zohomail.in>
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
Reply-To: shivamkalra98@zohomail.in
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Shivam Kalra <shivamkalra98@zohomail.in>

Commit 634a4408c061 ("Bluetooth: btmtk: validate WMT event SKB length
before struct access") added strict SKB length checks to prevent OOB
memory reads when parsing WMT events.

However, when enabling the protocol (flag = 0), the MT7922 returns a WMT
event with a zero-length payload (skb->len == 7), omitting the 2-byte
status field entirely.

The strict sizeof() check unconditionally enforced the presence of the
status field for all BTMTK_WMT_FUNC_CTRL events. This caused the driver
to reject these payload-less responses with -EINVAL, failing Bluetooth
initialization ("Failed to send wmt func ctrl (-22)").

Fix this by making skb_pull_data() conditional: if the status payload is
present, parse it as before; if omitted, default to BTMTK_WMT_ON_UNDONE.
This restores the pre-regression initialization behavior while
maintaining the memory safety bounds of the previous patch.

Fixes: 634a4408c061 ("Bluetooth: btmtk: validate WMT event SKB length before struct access")
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221511
Cc: stable@vger.kernel.org
Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
---
Tested on a laptop with a single MediaTek MT7922 (USB ID 0489:e0e0)
Bluetooth controller. Before this patch, Bluetooth initialization failed
with "Failed to send wmt func ctrl (-22)" on every boot. After applying
this patch, initialization succeeds reliably.

This regression is also reported by other users on the kernel bug
tracker [1].

Note: btmtksdio.c and btmtkuart.c have similar FUNC_CTRL parsing code
but were not modified by the original commit 634a4408c061, so they are
not affected by this regression and do not require changes.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=221511
---
 drivers/bluetooth/btmtk.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index f70c1b0f8990..026e5a76b086 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -717,19 +717,19 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 			status = BTMTK_WMT_PATCH_DONE;
 		break;
 	case BTMTK_WMT_FUNC_CTRL:
-		if (!skb_pull_data(data->evt_skb,
-				   sizeof(wmt_evt_funcc->status))) {
-			err = -EINVAL;
-			goto err_free_skb;
-		}
-
-		wmt_evt_funcc = (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
-		if (be16_to_cpu(wmt_evt_funcc->status) == 0x404)
-			status = BTMTK_WMT_ON_DONE;
-		else if (be16_to_cpu(wmt_evt_funcc->status) == 0x420)
-			status = BTMTK_WMT_ON_PROGRESS;
-		else
+		if (skb_pull_data(data->evt_skb,
+				  sizeof(wmt_evt_funcc->status))) {
+			wmt_evt_funcc =
+				(struct btmtk_hci_wmt_evt_funcc *)wmt_evt;
+			if (be16_to_cpu(wmt_evt_funcc->status) == 0x404)
+				status = BTMTK_WMT_ON_DONE;
+			else if (be16_to_cpu(wmt_evt_funcc->status) == 0x420)
+				status = BTMTK_WMT_ON_PROGRESS;
+			else
+				status = BTMTK_WMT_ON_UNDONE;
+		} else {
 			status = BTMTK_WMT_ON_UNDONE;
+		}
 		break;
 	case BTMTK_WMT_PATCH_DWNLD:
 		if (wmt_evt->whdr.flag == 2)

---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260514-bluetooh-fix-mt7922-92bbbeff229b

Best regards,
--  
Shivam Kalra <shivamkalra98@zohomail.in>



