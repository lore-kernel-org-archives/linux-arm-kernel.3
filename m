Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDB3C44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7QjVN0B7Sf4bom6cy6/CS1jzJRC2l2ZaheSobQTYPio=; b=zza/3QenTtbyF+/J22PApd4kvF
	dRRJd1fosMUB2I8AS6Oavfhbwb/4CrsuYMLVSLZDo99mQNt6tQmviEAhyMeELIrN6vZt7lg2elv+h
	V2TZqfFIwW44qR9RvdVYcPTwfxrEl4Gz6NeXRip5+3GAnBt9h5AXwvIVrD0xCEgpVF9xQ90NO61EI
	qvzMjRKGnSarRR3WgiTmOdsOmpvWNs2igsLVsbOgAe1YNuRj8GL3gP3/OvGCz3MxHiXP8KfKsznhG
	CgzBbcl8wDU5EUILLaOE/3t6wPGSjBonfuZWwQm/Iz1tZsbpAgho7P8xCAaI3FgG82Wl9IAhGs/92
	rB1a2nkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOtr-000000009Om-1iVZ;
	Thu, 16 Jul 2026 16:25:27 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOtn-000000009Mz-0Uq6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:25:25 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3277312a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 09:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784219122; x=1784823922; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7QjVN0B7Sf4bom6cy6/CS1jzJRC2l2ZaheSobQTYPio=;
        b=g2lpZzkmjLh0H3rAPEi4DlaeoG0ovp4bz9mp0luwRoQeEKvMg/s3fsSypur1qenC70
         j1j7vTvfghUdHyrhqHCncmwReag6gy1Ybg9pErUw7q0e4uND2rj3kFNWtr0H3l7IarYD
         IRobhbC97WMFAoW1zOuDuqzDiKfByh9KY4Gd8EuU1+ykL+TOfKa8UZykrFW6ubXdDYBF
         JtuhR1GHGsGR85VfBSlKyODe2DNOpWM90Ww41HG9sdgTY81nPvUptnjsepat0prUV728
         ZviBS98aWlHlmxanHoVnvGTLghfxhdL4RcF8P9uPMfjYa/GFv0ZZjq4PgGFREMlBRwZV
         bX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219122; x=1784823922;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7QjVN0B7Sf4bom6cy6/CS1jzJRC2l2ZaheSobQTYPio=;
        b=bvVeMhFLTvX1roEbiD5pk2v752gOSO/qWGckQj3nXDV579vrgmf6ShfkYXykhJGDZb
         HPDdKWKK/XXvNEJs7MvVKNVkkBsC/SS6fDQGUf0yFvCkjnia0vQUTsP9NTKMyGCHURCI
         tQPMMyxb5rINFUJzlhcDQ41/CfVor3bd6H4qEy06IGA3LiIFzj7FI86cUBUD8/v7OV4f
         ecTZ88Yv/J/XFYN/20fbr1fUYE5hi7uQTtXYWUUW4uQ3NAGRjgGFW4lu95efAMHtncIE
         UgO8QD3eD8hyorunLdruDuLr4gfznuupT7pWy7WhB78kuisE/rvIBDTZh+p4346XlqJi
         xyQg==
X-Forwarded-Encrypted: i=1; AHgh+RrRi/zgj6K7QoOyIvvLjEXA7tQGQdv7yMB2LxFinQnu9YGoTFlWInMCtZQWgU0scQP8Dplpc+WZXqDXSqqvao7v@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf132x/x+xiBGCRqD5mP1PXYK1rOsEhLibMZSn+xD8eY6YOlMu
	uCTkyBLrFbn+y//o63qKIXYep+u/rhwzj1lTxx4vrmq8ASR5xWRiD8kF
X-Gm-Gg: AfdE7cmBnhRTdpfRxcWLR3Pntd339gbCOFwuJ+D/B/o5+JWouwVJUN75zk7m4l6EDhc
	+bw2qMchRfNOSogsR4B6clb/JLqroJ2LyOlRMztBzDM49HaaW52Y0HolmJ8+PcTmshtnewNAEqF
	vFW/L/2cwVXbtOaM7St3+ZuoHbaXc41L8b5vHExD8AMVt1y6IsZOboodGpzbH6IIR84eNPPYrqi
	eeteEpjesVpj2rw94N8w9TQttE9jdUyWd/bLCTfGGcYvuEGtiyV5RW+N6NpIZZQIZkhVbjpAutq
	U+Y2LC3/Ib0jCsDoOVzvZ8341wQFaAPehX6fn31wETCZmgR1EkXZNCZaG7sMjSukkdHIuqwaPAD
	dXqXuZWRmG5O9Vo5Sbga6MDcI3pFeeh6q2SP09vd7kpQX5TDDuL8ijpM3JGgjHl2j/jcuCgp6nD
	rq1m9wEiUS0H30sL/IY/J99JcmaGfr6TEVaonok7QOtBlGwNEK0qQBfFzMVfSLbo0vG0RsNBSyA
	3lYX84Rlbk=
X-Received: by 2002:a17:90b:268a:b0:38d:e442:901e with SMTP id 98e67ed59e1d1-38e4676edcemr252375a91.27.1784219121817;
        Thu, 16 Jul 2026 09:25:21 -0700 (PDT)
Received: from [192.168.1.45] ([45.64.226.73])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6f0fcdsm13401269eec.30.2026.07.16.09.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:25:21 -0700 (PDT)
From: Prashant Rahul <prashantrahul23@gmail.com>
Date: Thu, 16 Jul 2026 21:55:10 +0530
Subject: [PATCH] wifi: mt76: mt7921: fix memory leak when skb_linearize
 fails in mcu rx event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-mt7921-mem-leak-v1-1-6e9c0ea19f63@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ5AMBBA0avIrE3SqURxFbGoGkwo0opIxN01l
 m/x/wORg3CEJnsg8CVR9i2B8gzcbLeJUYZk0EqXylCJ/jS1JvTscWW7oC0q1zsaKio0pOoIPMr
 9H9vufT+KAS/7YQAAAA==
X-Change-ID: 20260716-mt7921-mem-leak-a38cbc1d8132
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Prashant Rahul <prashantrahul23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673;
 i=prashantrahul23@gmail.com; h=from:subject:message-id;
 bh=4CPW5b7K7pWIDEETkd1lpdofQroaGErs1xlq/gmjxWI=;
 b=owEBbQKS/ZANAwAKAWw+kajX8DhtAcsmYgBqWQXsV/w68cO9EKUlxqIpVZZtXkCX80D6dDxmD
 aGf8enZNumJAjMEAAEKAB0WIQRS5esR6MP3hQs0SsxsPpGo1/A4bQUCalkF7AAKCRBsPpGo1/A4
 bdceD/9HRbFIUqlRohA+MNVpogcl2J0qVq6PkEnpD+GkH7o7uXwvTr5omWzmRqdNb33V5b4Fe2K
 c7OJF/5NoVkMxl6Qpc35kmyjgwc6XTpUewiJRb79q3tPiZV0GG8QuRVtllKz831mDYmPk+Redck
 4H5KTYrsr8LIf9Xso8dlfOJN0ERKdNUzEwDPcyLSuH+m/xuIDs3ez5Y5IKNCanUcpVK5onVkMFk
 0hudLISYFa8W/s9wIKM6pSuqHZ5JqWA5SYbsh6Wvq8H9DLcMa9uYgDbd7cN1rUF9ZfOWg7BLDXY
 z616o9dBYz8yUev0+lQAM2omnXDbaKRnEOoF+FKv21HScW3bH8AGZJLoAPJgoeMGHIysFEtpdEI
 +85iKhG2ybdPp5FL+I+AteyRTxrnH+O1mpS5AoFksYcv/qEQaIM2R8LePjvtSwTPk13dGVwdm3P
 3MY/2bz9TLpgdi51R4hn89CJiCZ48nVMUKABUTky/G80vg4b/pyYsa6jNuT5wEhVgYOFXqz3qko
 GfYjZThToIzvU+crLj4s49Zh7/ceI//3hrH84W6MAL3FM2jjNXBihLDv077WFmv4/AXOEWbVsHs
 qtnO5CTz3MKT9+K0Dq36YNx07UYI1d6sNTiBka3HlCEkxRXgRR3zbIId2eZH3SiKscIsUTumMjr
 pli4IGgKPuxzQxA==
X-Developer-Key: i=prashantrahul23@gmail.com; a=openpgp;
 fpr=52E5EB11E8C3F7850B344ACC6C3E91A8D7F0386D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_092523_175432_B4462EA4 
X-CRM114-Status: GOOD (  13.30  )
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

The ownership of sk_buff skb is passed to mt7921_queue_rx_skb, each
path inside it under the switch case handles cleaning of skb and it
is true for mt7921_mcu_rx_event as well.

mt7921_mcu_rx_event, on a success path, either queues skb via
mt76_mcu_rx_event or cleans it immediately inside
mt7921_mcu_uni_rx_unsolicited_event.

However inside mt7921_mcu_rx_event, if skb_linearize fails, the function
returns immediately and never bothers cleaning skb which leaks skb.

Since skb is fully owned at this point, it is safe to call
dev_kfree_skb which fixes the leak.

Granted, the skb_linearize failure is rare as it can only fail under
heavy memory usage, but at the same time, leaking memory under heavy
memory usage can worsen the OOM condition.

Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 25b9437250f7b..fb18d3b4e27ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -351,8 +351,10 @@ void mt7921_mcu_rx_event(struct mt792x_dev *dev, struct sk_buff *skb)
 {
 	struct mt76_connac2_mcu_rxd *rxd;
 
-	if (skb_linearize(skb))
+	if (skb_linearize(skb)) {
+		dev_kfree_skb(skb);
 		return;
+	}
 
 	rxd = (struct mt76_connac2_mcu_rxd *)skb->data;
 

---
base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
change-id: 20260716-mt7921-mem-leak-a38cbc1d8132

Best regards,
-- 
Prashant Rahul <prashantrahul23@gmail.com>


