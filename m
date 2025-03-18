Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC13BC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 19:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=19z1Kk5mXf9SmqNPxTrWbr2dcMvFexRCx2f5g7HF46k=; b=Q8qWtPbzdi8U7usOomkY+tOEn/
	wZo9/fvnW99qLsEYTTlw4VUUMzvtlsbfC4Dn3d50MKOGpchuaXNXGDoRLEXoVzkqTR+Y7pYAYoJPA
	0qNUNULSiM7tyoMnTK8ehrMzQA8edt1hfgVMBpyoacs1vpEOrVvrH3k5S88mfQcJjqIYhVTx+Rq91
	wbbYGn3SBAp1WGXK+ne+ZaaYnN8HQDfNiZP/LuwaCX5WzKtjDJqUd69y8+wFNFrDWEGGJhZkeXTSD
	1P6tPU7fImv+B/o24FNB9FgZ2Ly0kLw612ZtQz7PYULThC0k2a0IMaoDkf9LRtpoU9TCkFU6BgAIW
	jVgSrDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuci1-00000006vo5-3PTj;
	Tue, 18 Mar 2025 19:34:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tucel-00000006va0-3kus
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 19:31:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-22349bb8605so135051255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 12:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1742326279; x=1742931079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19z1Kk5mXf9SmqNPxTrWbr2dcMvFexRCx2f5g7HF46k=;
        b=eqSD333XtdfSh22Xfd9PJ4Pzi3naFJYKSqORwSjZ6IqeoB2LzhvaOtPpTuz0omgLBf
         G0Ml2H3A2EnzixA32Wg5kxsQAi0TTwNWbVSyy88Hpv68AI/su0T86wliy2/6gcnslY8O
         plabT5wfY75Lb5iPCEw3urnpvaYhgTLzwfCS2D/Lp928wjR5FDjxHeBD6WQckOcp1P6v
         k5PBcEn9m9fj79eY+HkGY5zTS46kxK8Y1x6jWfqJQq3ebarSs+1VNZqihwdS0TAGzPRb
         wEFFke+JLsvo+AVIQAVJAJ4wbRumanZqGmrg/UWaJZ3XXQErPFOPIeK+1qdysRbH3Kf7
         nlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742326279; x=1742931079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19z1Kk5mXf9SmqNPxTrWbr2dcMvFexRCx2f5g7HF46k=;
        b=v1mOoMQ5eHUCY5vi2PO5G1BKnrmiCnt//t2RtO+eg2pCF9CjhQJdKJhOIQ17Ssk669
         OeXt04Jg77Z9OjRP2d9qBBPXcC0kS8EAtAzmVz9UC2IYmcRhy6HNgdYw90reViYc37sS
         dQ3HjrdyNSB7sWjEwGkiqBfjfMfRsgUAjfROw+rzBJIDl/0dr55tkhgbUqNnuoHj07KL
         YJ+v/iAdX0hoIQg1bdKcKx0Ck+7Io4l1UTXQWbKgdr6f130gmN1QiaQX9n1CQaHU4UGK
         XmagNbg9sc5yx6HEsSnl1+J2paNUgCFuDKKh6H2V6jspSd8ErIJ/CkBSserL5f8E+yAg
         dRLA==
X-Forwarded-Encrypted: i=1; AJvYcCWoPM/yXxEjPHA3ghYv2PT3KTqynaz6/WSMWknko1fcrJ+P92EqculUa3La1excHOhkYPObMJmvLr59JT1Lbay2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb3UNM9O6CnEUSsWjf7zRhEU8tpLywHUTJw7OTYTknGIufiese
	g0EQp9Hyqf/aO7HOLxR3Vgs0aAv+Pnbw+Erge7MqZwVvnfyjHOQnuia00DgqIYY=
X-Gm-Gg: ASbGncvjbOgc0CLh2kRbOKDEUR8nM1AduE31duHMTjYMWIhKMzafEdOpXysfsC8Pp4U
	Z6krxWb3iMDCmbTAFjBJfiRJrr69O3UdHGKj6/ebzMTEfSX85JCSkp6QSv3ObvITuXjWzofiEul
	jDGxzZB8TUv4ineZK7zHHEJ2gFgYuPT+KoRoZkn+rc3Yvj68FayGC1RgEU483yoRTXZIF8hrWVC
	kyqhKIiQAmdG752u2KpHGBkyk+SBZscgp48xzfIOVRMaECseaond+hClv7kOY2EU3JahL78lF2k
	qn/WvDoCd68Ybwsn8Ncvoyi+mWRbLH7XqlmVxH75CNsNQyY=
X-Google-Smtp-Source: AGHT+IGtg/Gus/fPA/C0wTqoGIQvSoUpP0NE5t1Cbk1OIUeB6Lmwk6dhW0m3CZ42u0xM6Wx6yXDp7A==
X-Received: by 2002:a17:90b:4c45:b0:2ee:d63f:d73 with SMTP id 98e67ed59e1d1-301b9fcbbc1mr589133a91.11.1742326278694;
        Tue, 18 Mar 2025 12:31:18 -0700 (PDT)
Received: from mozart.vkv.me ([2001:5a8:4680:a100:1c4a:720d:c0fa:efac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3015363217dsm8638407a91.32.2025.03.18.12.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 12:31:18 -0700 (PDT)
From: Calvin Owens <calvin@wbinvd.org>
To: linux-kernel@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH][QUESTION] bluetooth: Remove duplicated h4_recv_buf() in header
Date: Tue, 18 Mar 2025 12:31:12 -0700
Message-ID: <2b612e2c1f4fa697b47b5dd9b72f1949d7c206f5.1742324401.git.calvin@wbinvd.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_123119_945494_C504FF97 
X-CRM114-Status: GOOD (  27.73  )
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

Hello all,

In the course of other debugging, I've discovered that h4_recv_buf() is
almost completely duplicated in an inline header definiton, and I don't
understand why.

I'd like to clean this up: see the patch below for an explanation.

Does anybody who was around at the time remember any more details about
this? Or failing that, perhaps somebody with access to the bpa10x
hardware can test it with the core function?

Thanks,
Calvin

---8<---
From: Calvin Owens <calvin@wbinvd.org>
Subject: [PATCH] bluetooth: Remove duplicated h4_recv_buf() in header

The "h4_recv.h" header contains a duplicate h4_recv_buf() that is nearly
but not quite identical to the h4_recv_buf() in hci_h4.c.

This duplicated header was added in commit 07eb96a5a7b0 ("Bluetooth:
bpa10x: Use separate h4_recv_buf helper"). Unfortunately, there was no
discussion about it on the list at the time:

    https://lore.kernel.org/all/20180320181855.37297-1-marcel@holtmann.org/
    https://lore.kernel.org/all/20180324091954.73229-2-marcel@holtmann.org/

This is the diff between the two implementations as they exist today:

    --- /home/calvinow/orig.c	2025-03-10 14:43:18.383882623 -0700
    +++ /home/calvinow/copy.c	2025-03-10 14:42:57.109953576 -0700
    @@ -1,117 +1,100 @@
     {
    -	struct hci_uart *hu = hci_get_drvdata(hdev);
    -	u8 alignment = hu->alignment ? hu->alignment : 1;
    -
     	/* Check for error from previous call */
     	if (IS_ERR(skb))
     		skb = NULL;

     	while (count) {
     		int i, len;

    -		/* remove padding bytes from buffer */
    -		for (; hu->padding && count > 0; hu->padding--) {
    -			count--;
    -			buffer++;
    -		}
    -		if (!count)
    -			break;
    -
     		if (!skb) {
     			for (i = 0; i < pkts_count; i++) {
     				if (buffer[0] != (&pkts[i])->type)
     					continue;

     				skb = bt_skb_alloc((&pkts[i])->maxlen,
     						   GFP_ATOMIC);
     				if (!skb)
     					return ERR_PTR(-ENOMEM);

     				hci_skb_pkt_type(skb) = (&pkts[i])->type;
     				hci_skb_expect(skb) = (&pkts[i])->hlen;
     				break;
     			}

     			/* Check for invalid packet type */
     			if (!skb)
     				return ERR_PTR(-EILSEQ);

     			count -= 1;
     			buffer += 1;
     		}

     		len = min_t(uint, hci_skb_expect(skb) - skb->len, count);
     		skb_put_data(skb, buffer, len);

     		count -= len;
     		buffer += len;

     		/* Check for partial packet */
     		if (skb->len < hci_skb_expect(skb))
     			continue;

     		for (i = 0; i < pkts_count; i++) {
     			if (hci_skb_pkt_type(skb) == (&pkts[i])->type)
     				break;
     		}

     		if (i >= pkts_count) {
     			kfree_skb(skb);
     			return ERR_PTR(-EILSEQ);
     		}

     		if (skb->len == (&pkts[i])->hlen) {
     			u16 dlen;

     			switch ((&pkts[i])->lsize) {
     			case 0:
     				/* No variable data length */
     				dlen = 0;
     				break;
     			case 1:
     				/* Single octet variable length */
     				dlen = skb->data[(&pkts[i])->loff];
     				hci_skb_expect(skb) += dlen;

     				if (skb_tailroom(skb) < dlen) {
     					kfree_skb(skb);
     					return ERR_PTR(-EMSGSIZE);
     				}
     				break;
     			case 2:
     				/* Double octet variable length */
     				dlen = get_unaligned_le16(skb->data +
     							  (&pkts[i])->loff);
     				hci_skb_expect(skb) += dlen;

     				if (skb_tailroom(skb) < dlen) {
     					kfree_skb(skb);
     					return ERR_PTR(-EMSGSIZE);
     				}
     				break;
     			default:
     				/* Unsupported variable length */
     				kfree_skb(skb);
     				return ERR_PTR(-EILSEQ);
     			}

     			if (!dlen) {
    -				hu->padding = (skb->len + 1) % alignment;
    -				hu->padding = (alignment - hu->padding) % alignment;
    -
     				/* No more data, complete frame */
     				(&pkts[i])->recv(hdev, skb);
     				skb = NULL;
     			}
     		} else {
    -			hu->padding = (skb->len + 1) % alignment;
    -			hu->padding = (alignment - hu->padding) % alignment;
    -
     			/* Complete frame */
     			(&pkts[i])->recv(hdev, skb);
     			skb = NULL;
     		}
     	}

     	return skb;
     }

It seems fairly obvious from the above that, if alignment is one,
hu->padding is always zero, and in that case the two functions behave
strictly identically.

Since that is the case for every driver except hci_nokia, clean this up
and let them use the core function. I've done some light testing on
btnxpuart, so far everything seems to work.

I would love to eliminate the duplicate function entirely, but I don't
have access to hardware for bpa10x. Since bpa10x breaking was the
original justification for the change, I've left it there for now. I'm
hoping somebody else can shed more light on this.

Cc: Marcel Holtmann <marcel@holtmann.org>
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 drivers/bluetooth/btmtksdio.c | 2 +-
 drivers/bluetooth/btmtkuart.c | 2 +-
 drivers/bluetooth/btnxpuart.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index bd5464bde174..47d1073fb4a4 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -29,7 +29,7 @@
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
 
-#include "h4_recv.h"
+#include "hci_uart.h"
 #include "btmtk.h"
 
 #define VERSION "0.1"
diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index c97e260fcb0c..aeb111a0f242 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -27,7 +27,7 @@
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
 
-#include "h4_recv.h"
+#include "hci_uart.h"
 #include "btmtk.h"
 
 #define VERSION "0.2"
diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index aa5ec1d444a9..e6db563088cb 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -21,7 +21,7 @@
 #include <net/bluetooth/bluetooth.h>
 #include <net/bluetooth/hci_core.h>
 
-#include "h4_recv.h"
+#include "hci_uart.h"
 
 #define MANUFACTURER_NXP		37
 
-- 
2.47.2


