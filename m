Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70629C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=39GrJvnkpg8Y0WqMuL6o5Nxkg2xZIq2hCAlpo4jOXC0=; b=o5WRpBACPSh0xa9Ukg02NjROGp
	9uqDKZn5JdFeD+gCRSQIr0L39pyHHbX9T8O/tsyeCtz7QQKa9P5LBO82gJHar99bbO7vlUvlrSSJo
	KZmLcEmK3cX5PBSViSw6rJDiiBB6PYA3HN+aqzDDvKaPlSX7EGBi5+Ett1dJPh2LriWlq6/bzm1Ig
	yImd/+t/eFPGfsmpiOYnoWUnTljgyDpVO/LsC92+3nDlIV/x50mB95dHHa0V5rvwrhLQCE3hEdetd
	bddtVdZ0UZzb+xJxJSyvX36sbcCxxTWKDuQYcXiNww8FkCzFwMN7RmIgFI//mip3H57cqxAWAts1n
	SW+CHdww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogDI-000000056ln-2IAr;
	Tue, 28 Jul 2026 11:43:12 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogDF-000000056kb-16KJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:43:11 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ceb096e675so45284385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 04:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1785238988; x=1785843788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=39GrJvnkpg8Y0WqMuL6o5Nxkg2xZIq2hCAlpo4jOXC0=;
        b=NmDmWOp5LfdRGbdbEuIL3JbkAJmDoSwSM1WT92AaL1R4ZrOrirLYKUZQsYgHm0fbVB
         Mb/4YBXYflzOQmO/hX8DPqNMikTPLk6ko/47R8n9z73Cof8Iwpnh2GXdAJeba8b4tpVI
         4Uuy8X+FFui24Vgm02pf37aVQ+9w+bEtDBYlSjhNJeKMi/Tjv4aARrE+OGmL2RZaYG6h
         HJN+4WqGnnSWUwjG8l+KwQeVpOsfWh1RwckfXrTzF+HHbQ+sxYw+ONZkQ1JWMEgoNtTS
         V/i7pQPHBCUvYNSCSCl2XoJQFhy/1PYDkEl/SpGoYt+NYg5XKUQuOCALvk0+vgImx9Kf
         eYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785238988; x=1785843788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39GrJvnkpg8Y0WqMuL6o5Nxkg2xZIq2hCAlpo4jOXC0=;
        b=gXW3AoK14bM89yqqSuVwqWlbZeoRrzeMVF3V6Gyy8ZE2UatUKRXXZ9igIo37g7FxsZ
         DIlJ3SZM4Y81hxf+V409EDPUu2kT1GDVL8gWnUKVxtX29sEASCuOm35ptefoby528snU
         9I96UqhEDrTxSl+2FLP8qNYhkXDh1tgsGavopoQWtCvx47/EXKtcplddzKYxjEA8leEF
         o5uMwu/8rYy4un7aCUPQ9Sob35HU57I9fXBHaPSz2TYHBmwaUUR7kvUHhAGGmkimUJ87
         pV0wZX7q0uNeBBLHpD4L5NILxngmeAN6OOTfhXWZ0xyMzR4ybNbivhzTJz9SaI2YtIgr
         /pnw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+41FpkEo4HXn8XcQuARTCb5mFQ0JNhoGfN1Byng9Olg8peAg8PawqAJU7aPjSYdLluGl47g7gW2vilMTqmoyK@lists.infradead.org
X-Gm-Message-State: AOJu0YxJRZozj4W9XdqagFgXTjL3HPvcIZdPRPeAzqjzJYO1DzIKKuTg
	mwwovo37g1fCJkub2ZvZaVVc/HK9ilipjJ9NqwhSZhxmOmX0TfPexCcvx5YFWblM0gY=
X-Gm-Gg: AR+sD12lZn4sT7KgHtwD+5H21WBo5TqFe6VhUnhsKp3WW1SKBFfV14mGHLngeXoJN73
	MUSuoEb4H8TRAZR5Hs3FYFi5QboSdBNPVHJ2EV0/h+CMBrAOWntPYIBzOSnIrljZmV+koQH5lq7
	45N/kr4tymdXB8tA7P1tvQ8RSK+y7CLiJF3VCfFDadBJ6xpSv61ES1H3b1jnFlWgYeT2OFwhg+g
	A+j4Y5y7r++Z8fFwra515z/52aXAtatVlS72sUGAjtxsSK5legcw1/TXjtZzinTRdQJvYCPe2Jp
	qcSPZoExN7DDsFjcsQKENY/5Uj3kGiag9rVXsqFLCkhoALP1HN+hKaDKBSv4NNpE1uqs+DB6BJj
	EeHGbj1G1dGht6Y3E4YPWOD8kjdsTaXseIqz1m7oYdRGyLONSsmyA/hf0YGSYjFhXOanbcrlZUq
	DvZxLySsAb1ALLDezKXsssFdmhTbrXMFXvvSdie1VzqUQbXDo7INOmiUJrPNjjBCPCfdr8VfyxO
	U8kp2ZHwO6Dxv1dKrrF2kTPBspPZ2j+
X-Received: by 2002:a17:902:f64c:b0:2cc:98b4:e7d7 with SMTP id d9443c01a7336-2d01605dbe6mr24259225ad.45.1785238987907;
        Tue, 28 Jul 2026 04:43:07 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2cfde59bc5asm50642555ad.6.2026.07.28.04.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:43:07 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: Steen.Hegelund@microchip.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joe@dama.to,
	linux-arm-kernel@lists.infradead.org,
	horatiu.vultur@microchip.com,
	stable@vger.kernel.org
Subject: [PATCH net v2] net: microchip: vcap api: Fix possible memory leak in vcap_decode_rule()
Date: Tue, 28 Jul 2026 17:12:51 +0530
Message-ID: <20260728114253.196398-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_044309_434697_1C70AB4D 
X-CRM114-Status: GOOD (  10.75  )
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

The memory allocated for struct vcap_rule_internal, keyfields and
actionfields inside vcap_dup_rule() are not freed in some of the error
paths in vcap_decode_rule(). Fix that by calling vcap_free_rule().

Fixes: 610c32b2ce66 ("net: microchip: vcap: Add vcap_get_rule")
Cc: stable@vger.kernel.org
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

v1->v2:
- Convert the error labels from "err" to "out_err" to avoid confusion
  with the err variable, as suggested by Joe Damato.

Link to v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260727125757.134611-1-nihaal@cse.iitm.ac.in/

 drivers/net/ethernet/microchip/vcap/vcap_api.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net/ethernet/microchip/vcap/vcap_api.c
index ff86cde11a32..376be059d662 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
@@ -2427,18 +2427,21 @@ struct vcap_rule *vcap_decode_rule(struct vcap_rule_internal *elem)
 
 	err = vcap_read_rule(ri);
 	if (err)
-		return ERR_PTR(err);
+		goto out_err;
 
 	err = vcap_decode_keyset(ri);
 	if (err)
-		return ERR_PTR(err);
+		goto out_err;
 
 	err = vcap_decode_actionset(ri);
 	if (err)
-		return ERR_PTR(err);
+		goto out_err;
 
 out:
 	return &ri->data;
+out_err:
+	vcap_free_rule(&ri->data);
+	return ERR_PTR(err);
 }
 
 struct vcap_rule *vcap_get_rule(struct vcap_control *vctrl, u32 id)
-- 
2.43.0


