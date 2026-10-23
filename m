Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0C6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 12:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L2Rl2b0g;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kY8onrcd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=aIxvLYvvoUL7OvCfdr7iSMSSaShaZh2ySdQska9fu10=; b=L2Rl2b0gjuudeDv7H9XxFw1nyX
	v/GzqCfLBkZbIi37aLG52ZtAFoOjbMynhhRgdwUvocUY2iMp7PDzeTxd9v4iDUe27hJbDcp331H+E
	08LEYz6+oizydUW1cVNSFDuzcdzUs7vIkXbCPld5GFpuTF3CHEKEVU3XO32OdKawePI0DS46LpXZ8
	CGyrw8X/CYfMPwWKSUbRD7g+UiPZLomjDEBrdMOG3wkxLG2u+U6rS8U7i6OX1hxP4UUh6zSQObkY8
	sc1hdOpKdxcduzYHj4HuzXsYgbq0u8V9JrvuxPNY3l+/RnJePKXLM21nz6G3Dx+78aAhdeSJwdMlk
	PJqTAFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEnc-0000000GKAu-0yYZ;
	Fri, 23 Oct 2026 12:55:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEna-0000000GKAC-1ODh;
	Fri, 23 Oct 2026 12:55:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B149842DF9;
	Fri, 23 Oct 2026 12:55:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792760105;
	b=cBzTtrhnhE/86Lw5KEeX8tDWajmKA7xoWCuwU2mFCPbvWjiMRQePwIGj7o9hRFCsDiKU
	 cMG1H0DovuTHHs/mXDNdC+FTxHXD4NwNnISRkndE3ND/SpNfsqq0FGIVmf1mNmMj6/o4M
	 GIP5bwENFPwGh3it/xzkXn4UdNziTe3SDhj+450o2aH9Q7S5rfLoUes6h+VIq8vB94QYB
	 iH+9sbipE+rInhAJnZzWQAZn0DmJFnvTCbJ2G+IyDgdXyhuk+wsu6PH3PH39iAurqBXE3
	 jS38bn7kzeycsX3uAT/40js/OCUKgxhFXylpAXyxzJ/hm6KUHVTkZxCeiDjhkhjdRNw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792760105;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=aIxvLYvvoUL7OvCfdr7iSMSSaShaZh2ySdQska9fu10=;
	b=wKQwQ2Y9S3po6kHqgC/KSrCPf+4/O04T8aIKDjgglo+BWKxGMByVrECu0Z70sDWzKZnF
	 +h1BY4dJa5S35WiywIimAsZNgAzvGBocIJj1s/ERrXEyHZtKbTENmx1Zn02NR0xNinb5b
	 DsZXUo7vdpJjf/rrLKTXqcnuGiT32tVmIf3AuUS3iTd1eaJUAdiThoD8FdnkNZDabVka3
	 BZh1k1y+7oMSI8DEdZa3QvZCY6jZyQ4AWueItfrJ4nDqHG31V/METbpKdiNtmDhXJHvZb
	 psKGXW/Atg0bHf3jm8iwk4wfSB37n2CkS8UZIJaQUnQjwM1E+cqoUeh72RpRL7EMomw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EE6421F031E0;
	Fri, 23 Oct 2026 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792760105;
	bh=aIxvLYvvoUL7OvCfdr7iSMSSaShaZh2ySdQska9fu10=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=kY8onrcdqt5iGxVJX3h0FyOPkSlxKwMTtl1wP1mF1Xvdlf1YLTlyMiw2iAxG65hO2
	 ZagitQjlrd8jfDmabDYKTg89yS7zdRCwzm6iTgGXh9xyarVpG6PMmoM40QFNup/cOu
	 vuqClnU8j8SMOBHNV5+I9CAuejRWbLK0cKE7a0Q7Mwu8Gs03CA7R0ggRb+nE1x2L/m
	 aCaSQtAszC4N4Tv6wzbArOs9is9LtqoaVusvOCJeANvOtJS6objIt/KL8fdy9uT4sm
	 chxfLVMx5+tHhloxhtwJQPXl4Wk1e9xplbPNDWEhbHIoS3yKDI/Oe94w7a4G+xGXxr
	 goKPUaHIfTD9g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 49E6544525;
	Fri, 23 Oct 2026 12:55:04 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH v2 0/3] clk: meson: g12a: fix a few clock definition errors
Date: Fri, 23 Oct 2026 14:53:50 +0200
Message-Id: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN5Y22oC/3WMQQ6CQAxFr0K6tmZaAzGuvIdhMUALjQTMDJloy
 Nzdkb3L93/e2yFKMIlwq3YIkizauhTgUwX95JdR0IbCwI4bcsyo9saR2GM/P5G0q7mjulffQFF
 eQcp/5B5t4cnitobPUU/0W/+EEqFD4W646kXJq7/72WQ+a4A25/wFfY3+bKcAAAA=
X-Change-ID: 20261022-fix-g12a-clk-1fb52b15cfa6
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=YTsDBLMNkEFFewGfzypfNHgAfzd07DIYOGxGlQ1uYps=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9btSFn1d0cXbz6SYcGbvXD+7roPc84mBahK/JP7qPLvt
 KCAhIh8RykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjCRL96MDFtmRFtvVblYxbak
 7K268h+ljRHzfosxe57f9y+T5fkBKy9Ghhe+KUdbFq4LPNE0S4Sn/fqNjXeTmX+e/Za7+ej5BH/
 zFH4A
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While reviewing the G12A clock controller, I noticed mistakes in
the clock definitions:

 - CLKID_VID_PLL and CLKID_VID_PLL_DIV are swapped in the hw_onecell_data
   tables.

The fix is split per SoC (g12a, g12b, sm1) since each table was
introduced by a different commit so I provide different Fixes: tag.

I do not see any consumer today, so nobody should be affected.
I don't think there is any values in backporting them btw.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v2:
- Drop the first patch as it would introduce a bug due to misreading..
- Link to v1: https://patch.msgid.link/20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr

---
Ronald Claveau (3):
      clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids
      clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for g12b
      clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for sm1

 drivers/clk/meson/g12a.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20261022-fix-g12a-clk-1fb52b15cfa6

Best regards,
--  
Ronald Claveau <linux-kernel-dev@aliel.fr>



