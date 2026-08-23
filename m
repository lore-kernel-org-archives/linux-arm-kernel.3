Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72343C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CN0bq2syvJ139+FXiDl4BcBzxfhMrGPXSp4/ghjML5E=; b=LzCxZuYdX9eunyjnC4SYFxYuo4
	biroa7oKzQKJFe/fFxg0dyCzu2mdJ3DUO99EKNNZvifXXf8kk20nxPZIur2DhtxtW4ihrRM7LM2TV
	DY6p2bSCkNTu38h2Rm5zH/a6ogqgXZGQd3KB5sRdxEYlCoJGH4eg50TGCJ8KaVYxaBDkfhZwpBTyE
	GS260pX1/6R2TFVahARQpd+mzY/U6g++atBHpPmHgol9jlMme9LzmXlGsYqaezjLgr0U01p5aJLpR
	DD0+VwAJxO9rgEe6bS9Rp5qfwW+Hs6eU7zzzNAqGRF0DKbYjsTka2+dmqWXq/EiM9c53LXYN7FHJU
	AxVZtd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy68G-0000000FGbb-3KdG;
	Sun, 23 Aug 2026 11:12:56 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy68E-0000000FGb9-0Uue
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 11:12:55 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1840026a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 04:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787483573; x=1788088373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CN0bq2syvJ139+FXiDl4BcBzxfhMrGPXSp4/ghjML5E=;
        b=HbgqQGfeTNAfi++x5EZvmvyRcvkaho5tt1pDLtvyx+lGWuUBbVhbyUc6grHrunouHW
         VbBmNno/8ZgViCz0yU37rT/chgvIOIrUtPAF+Pc99lro0xAcAWTBnSVjSvLgpyfVLWGh
         A43yfw8ujYB9l+H/Iokb70ssao9H8Fjom4bjX0ibuK705DYcaLrudpU9/Ya6UK6sXNgV
         gYiLAcl4tX1agiBlK+TKwrcHcfxYEmxGSo6/v5abVkz1D3QLq2Y2h9/dI5HrCCoX53Xi
         V1bxqYxjMAI3JE8gB70lNrx3PPUl0ZyZGapnk2PaVJxQ5aC96jJ9GQWEKgFlRSLAfyAy
         MUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787483573; x=1788088373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CN0bq2syvJ139+FXiDl4BcBzxfhMrGPXSp4/ghjML5E=;
        b=kBnjEAWcLYqDYIpUTCGaC5BLd4XzXUWn+Z2c19LM9qTiOC5mj86WW7/UzKhtofxp4m
         SwTHOweyFb3R1JoukCHGJMAKp5KgHOj/al3TZmVpTRw38TGQvKn8s/5OPXjaWf+XVgw+
         HZflBO+lDfiuwlHS4I9RrUwxYWIf8OnO3FiNUQfwRUvqkiLOMI3loWPkCJllGOYJ7HjX
         YT4goxaFsb/cQzbGsQSpiVG8VpCVt+O3UknoYJkjv86KNogOAaFum/8Omfc9j0rq+x3w
         qHFUPEqCodVbfpRwxNIhPz/iPIj4VlAcs48tUQ7rhgeGHlVjy20aczNN4AInsKS+kjlt
         e7cA==
X-Forwarded-Encrypted: i=1; AHgh+RorbR+a6csTPjAEj5/NFRD6xoq2AOs75l3pbkleru7HvGRdQ5mWD7Fp5asHa9DtMvxM0jhy6a/2Flo61cc43yy4@lists.infradead.org
X-Gm-Message-State: AFuF++nnTx3BuX4ONxCNiQo3SEqGX3vBbofK+VV3fMTsHvs/L7u0Dmzp
	gfCfEkfmjZqKWZDchnGxy5ckPWM4KGJKtq96wYu1fio0DL9VrSfHLm2q
X-Gm-Gg: AR+sD12tm2Y2j354hM5DYL50nOqekomzVjIiD5hXgaNiIXwNy0d4DPPTR4SdUx0x5Kk
	PC2Lb/f/nkks3/EMpjZM2Fr2WYj28Q7G+CFoh55lzB3IdUzmwLM9/cifoYHkMvqUxIvoxCW3w4X
	xGl3LW5GhVnoljKQ2HwpRyv+FiXgpfi724TNdExDnWJ+H4lTFliMRCxdKVRlUWri3pwrW5uulBt
	NRp7/7Hjh8DmGiWMaf74oDH+GE/XFgEiatiBrxwHnMV4EiA6CgQ1vUgAcMTRmM/2aSUUBMujqQr
	sZ1/CsHVUyE9Igjj+uhI8uAQopRTb5P3PIzM1aaCjxH0jgfdziPDSkpL0+Drz2FLGi1fsNYfXsh
	lN4XN6jlzkEJ9w+02pdkkETML6EuJGfTGnO3QnKUQ9ql30ELIMoX7ufFLyAo9oDJDNhdVSIHfCi
	AmvW7cldjSkLJ8KAp1hgeXuDmZzWcXfr/me+a/FzWnl++AUFz+Ji1kfh2EgxdZoH6xIdcM2Fa74
	QDXN8znQWRTW8+vuo7QGMBgeAGF1LvgVqrUa9AeXE2DAjLXUzH8oAnquz8NdWSFlhQ6yJUYJXuC
	Nixhc27STmU=
X-Received: by 2002:a17:90b:1b42:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-395c3a06ffcmr30899372a91.12.1787483572595;
        Sun, 23 Aug 2026 04:12:52 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:94:a5e3:6c88:cdf4:5469:310])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418619d6ecsm14510633c88.14.2026.08.23.04.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:12:51 -0700 (PDT)
From: manushprajwal <manushprajwal555@gmail.com>
To: sgoutham@marvell.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] net: thunder_bgx: fix fwnode leak in bgx_init_of_phy()
Date: Sun, 23 Aug 2026 16:42:31 +0530
Message-ID: <20260823111231.372-1-manushprajwal555@gmail.com>
X-Mailer: git-send-email 2.46.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_041254_157316_8FAD8B33 
X-CRM114-Status: GOOD (  12.25  )
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

If a child returned by device_for_each_child_node() is not backed by
a device_node, to_of_node() returns NULL and the loop is aborted with
a bare break, without releasing the reference on the current fwnode
that device_for_each_child_node() took. Call fwnode_handle_put()
before breaking out of the loop, mirroring the existing of_node_put()
call a few lines below for the "lmac == bgx->max_lmac" exit path.

Signed-off-by: manushprajwal <manushprajwal555@gmail.com>
---
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index b63039999..246eee327 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1479,8 +1479,10 @@ static int bgx_init_of_phy(struct bgx *bgx)
 		 * cannot handle it, so exit the loop.
 		 */
 		node = to_of_node(fwn);
-		if (!node)
+		if (!node) {
+			fwnode_handle_put(fwn);
 			break;
+		}
 
 		of_get_mac_address(node, bgx->lmac[lmac].mac);
 
-- 
2.46.2.windows.1


