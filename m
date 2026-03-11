Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349CB1049526
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ChRjhNFSIwUq/BCT+B2OsF/gxvK+pIo9qeBf2Ct4RKo=; b=PFW3e4Vw6gNFTj+bhT8SlzaYV6
	Htt03YPJSvC25gDnv0YqcbB9ikdtTNfAQyfvbB2JAnzk0Fxdl+PLRzCMCoyjY6vR9Wga3TXi9WKhB
	ST2m8LQsuC67KDLDJjOmZ9ZKB2Z5QdXiJ2oAbIx4+KZEkSDb8Y27bLyfmDWCAJ5QUkR7bdj0GRu5n
	2bIe+8YzuCWcxFRCEShnFn9DxIyXJQm5TPW55PzKsPVRsBN/GO1/xipshqJBZ1k0baInKUSF16fcv
	zFEVVTOl2HTt9m8TfJVVGCqqqtV0DZg1rgQAlJPjAjlDG331mdkf+nx3lS74ClaaVpNVbC6JiYT3+
	ql+9WZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GHi-0000000BLpn-22My;
	Wed, 11 Mar 2026 09:55:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GHg-0000000BLp2-0a4a;
	Wed, 11 Mar 2026 09:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7018440ACD;
	Wed, 11 Mar 2026 09:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C79C4CEF7;
	Wed, 11 Mar 2026 09:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773222919;
	bh=t3YWAFTGJfOXq166ei+fVp8S8uwUghjUXQoCv8h1vNQ=;
	h=From:Date:Subject:To:Cc:From;
	b=n2WwGH3Oubl+RCowhtf7QOox4ccYXoouIKknsp9xZq+3+xkBZdXAaVPo/L/W6X1KN
	 fqlk75bWVJ4DeOMQ46Zhx2NUZL4lfKoD+hseFsPo9r58cEGlhXnTQ/W9TY5ghmPZsO
	 lvGVap6Y9V8M9Rae4s7WWRLmttsf8cPuJZpD/cTN5UEde9uPM0B2C0CRMDwlVdyGmv
	 H+R3VBIFtcbEi1d+VFdXK+KjUXTAUG10C7050EoQiYwMoqapsat47H6zt9XKjGWL3Q
	 er+gUZTHTy2Eou6nArhNIcJWW30Rbu5OjuAXLZ13m3OdGAZD7DJ6hQHJVpRqcS2q1Z
	 LBSLuG9jowyYw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 11 Mar 2026 10:54:57 +0100
Subject: [PATCH net-next] net: airoha: Remove airoha_dev_stop() in
 airoha_remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-airoha-remove-ndo_stop-remove-v1-1-596fe853b2e1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zXMQQqEMAwAwK9IzhZsq674lUUkatQctpFURBD/b
 lnwOJe5IJIyRWizC5QOjiwhweYZjCuGhQxPyeAKVxfeWoOssqJR+slBJkzSx12217ZqHH7KAdF
 7SMemNPP5/7/dfT+/JnIIbwAAAA==
X-Change-ID: 20260311-airoha-remove-ndo_stop-remove-1582a74baa33
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_025520_201983_C3CE2602 
X-CRM114-Status: UNSURE (   8.69  )
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

Do not call airoha_dev_stop routine explicitly in airoha_remove()
since it is already executed by unregister_netdev() if necessary

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 3e9ec5c178f86fdd055e079078a23461edf97951..de5089e7dcd85080188641ae4c976b3d731cc3b4 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3095,7 +3095,6 @@ static void airoha_remove(struct platform_device *pdev)
 		if (!port)
 			continue;
 
-		airoha_dev_stop(port->dev);
 		unregister_netdev(port->dev);
 		airoha_metadata_dst_free(port);
 	}

---
base-commit: 482aac8b56ca21d06c588517970579474d56736e
change-id: 20260311-airoha-remove-ndo_stop-remove-1582a74baa33

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


