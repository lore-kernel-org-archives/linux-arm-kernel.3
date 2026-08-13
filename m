Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A096C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hvNjOb0PYgKb5i1b3A7SCqBWH5+crd0NIVMjDXNl+Sw=; b=jORXQuyRW6rRA1
	p20WoW1kVNiAIdPQb0wwRHtoQuHsXAEjHw7pr0RSVRaT+v0HnC6xFY6t2UZEcsW7wOgVuBKNGUID+
	0ov4iS7o6duP+hY2akMACXVmYke4r7nObHuWXVoq/yuHW7Sh0GeO/p6ezt0f3PZZK/iD3kUQLmSaa
	p7rodmFp09c+OTPTyD5lVnM2REZ9uH23kIpeGBor/9cSNeYSzAiMxzFwjLq2kdN+I3Uz5vvDTLUxH
	L/5iDAdK1GC1yGWZlmiCag0TqH3YjfFidD3vZo4f6vdwMoFjCWyvTF0av35CkticQB+e47eMbJHio
	cfcqXOyZ+hwldZ40vfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQCR-000000002ig-01QY;
	Thu, 13 Aug 2026 07:50:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQCO-000000002gy-1lN5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:50:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so2954335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 00:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786607398; x=1787212198; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hvNjOb0PYgKb5i1b3A7SCqBWH5+crd0NIVMjDXNl+Sw=;
        b=Q+0QI32309htQ39C+hzV71rdCYGfXYx9J6sA0j9hiIZWWeWe2molB5qyt8V+TOwX2u
         wVMTC1tYF9EWEWoUBpke+EyYPk/CVA1vh8GLj42H80J0bKs6KLPcZxns8mjwTDk6OtWf
         lNTrlyVXIOdsjtWSnxpUuH1gI+uSGRb9+VQcwTRYjoTALXwOFWouGlN6x2PTGD5TJXL8
         rKn0FwzA8HajzbmcT+98torxK9+E86nlgaXQOp74OWUCoZR6x1Dgi51rOaw7DktVmRBy
         f7al+ZyE6ObLFW+N3iI1quK7hrDN7jbY1ftV2udCWrnKPKpjsflxYMy30OEKYEDYmgpE
         g59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607398; x=1787212198;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hvNjOb0PYgKb5i1b3A7SCqBWH5+crd0NIVMjDXNl+Sw=;
        b=HUSlbMZMbm8Bl7rwYQZLSJgdrzNdUblKGCDT0as4ZSVQkNbGFfyqdJ4jeFjzIh3pyC
         HT3WqiLVWgUoQhk65IjQtZKOZ9mbZwDTCLuJc3f/Wgbm8nr5jkjoUyBem38fN9a0Fk5j
         kkzm9b5GkfM6sql2yX2oqWbQAyTqgEl2WbzlHPs6DizxlJ5i0Spk1AZheL/wKgemTH2x
         ankbZ02/ITSUuuS4gpObzvPCt2QrnV3cw923yPnG8DEB2lscy0/YftyKZZbQnHSwUQEa
         QKRYrgCYKojWeyc/kcrQwdxiYPrVt8LbsJlmRpqp8xQb3kjMDBS762x5Bil3x9ZM8m30
         EUyA==
X-Forwarded-Encrypted: i=1; AHgh+RpMmu+UYKhlJ00lNtMdkIJxtk6I6TX4LRbVXLWZCk0nsgt7IDbJHpya66s11z3mJ97pFJQDUPga6m4arGgDyTmu@lists.infradead.org
X-Gm-Message-State: AOJu0YygaQfXW/E9dq0LFhPtJbbViPYPoGl1VoVcrgXJRabcm9XoCqjY
	bY48JX/WaOtpeEmURcLVZ5NF0elpMvfq6zI4+1Z3BopC5zrCrd2Tpxlf
X-Gm-Gg: AR+sD12eabfUc/lcegIHMZynr7995hwJQTUIJY28Rvv1ALMFss2KB3cC5ib3basb4SA
	rsHwlzUueBdnvElb2A5Fm34OzypG2PvOvYVe24+tQE8ej6IKjA/076OfNZpjgLHWqVBL3oECtlP
	SEzzAzwyNqIj1hbw1Pnv3aN7s7Rz/lhBRr9cnihJ4biCMNqWW61ppSxMbbCqqSEQ3M1htL1hbGA
	tWHCsUqoEdsdn8QNZfgd+eUcDdAk4LlCIjamAZ2qXUf/43f23dOuGlV7Gs9q6EVRfvI2hyH0SIv
	vmL4UFsuz5sA+vIdeDIy+CK4KabIflWnfIRr3z+Pi4DpGUL/tnNQF38g7js9+aAY13GmP4i8JFV
	SsCVTodI/LS9t16i7/X5j9bT53dWwzoWtNea6nF+5fb9brgZBMyEVJlHZleDi1GBMrZbrM1+UKv
	L5m1nMxLt5G+KLzIGkCr58Mkvv75ZOqSSNC1gLPa4lizB38D7tPrivnoSUw/QG8lI+GvpM9S6Hn
	SBevrnvSfNuulMz4n/8PvLrv831f3jmsxGZ5KdU
X-Received: by 2002:a05:600c:3556:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49982154908mr48444985e9.3.1786607398055;
        Thu, 13 Aug 2026 00:49:58 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com (bba-86-96-6-50.alshamil.net.ae. [86.96.6.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b62894sm41936365e9.13.2026.08.13.00.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 00:49:57 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
Subject: [PATCH v3 0/3] fix the MTL fifo and DMA race condition
Date: Thu, 13 Aug 2026 07:49:26 +0000
Message-Id: <20260813-stmmac-rx-fifo-block-v3-0-738acbee55d9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAZ3fWoC/4XNSw6CMBSF4a2Qjr2mDyjgyH0YB31CI1DTkgZD2
 LuFERPj8D/J/e6KognORHQrVhRMctH5KQe7FEj1YuoMOJ0bUUw5rimHOI+jUBAWsM56kINXLzC
 2alrFGttyifLpOxjrloN9PHP3Ls4+fI4viezrHzARIFBWQuK2lFxheu9G4Yar8iPawUTPSP0Do
 TuiFSurWjOi8RnZtu0LADHXff0AAAA=
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Qingfang Deng <qingfang.deng@linux.dev>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abid Ali <dev.taqnialabs@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786607395; l=2551;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=Z7PZv7lkF2f/2APsSytzL4xAa8qnNQPmEwjqQXtITU8=;
 b=A/i3S1pHv+HZqfpzdWOkimYcHvIeLijiOg8jpxRANLAXbZaYQ+CFCLDTpOyt3sDYOrIBHwBqq
 EdOnHUba2wtD4BaIprh0cCIrSDmD3rBdzL5cH6s2lE0GTfbjO4DLIvi
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_005000_489288_5E0D290F 
X-CRM114-Status: GOOD (  12.64  )
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

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Russell King <linux@armlinux.org.uk>
To: Qingfang Deng <qingfang.deng@linux.dev>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>

Changes in v3:
- v2 tried to fix the ordering in teardown path, but it still would
  not follow the ideal flow mentioned in the databook. So have
  seperated the patches to deal with the teardown and some findings
  from sashiko.

- "net: stmmac: enable MAC rx/tx after DMA start": reduced in scope,
  now only moves the MAC enable after stmmac_start_all_dma() in
  stmmac_hw_setup() and stmmac_xdp_open().
  This is to handle the overflow scenario during bootup causing hang.
  The teardown side in __stmmac_release() is no longer touched here.
  This change could go independently fix the overflow hang at bootup.

- Added "net: stmmac: xgmac: tear the datapath down in the documented
  order": for ensuring ordered sequence is followed for teardown.

- Added "net: stmmac: xgmac: decouple the MAC Rx/Tx enables from the
  DMA ops": drops the global TE/RE writes from the per-channel XGMAC
  DMA start/stop ops.

- Link to v2: https://lore.kernel.org/r/20260727-stmmac-rx-fifo-block-v2-1-4dc3457d31d0@gmail.com

Changes in v2:
- Corrected the ordering in teardown for xdp at stmmac_xdp_release().
- Link to v1: https://lore.kernel.org/r/20260726-stmmac-rx-fifo-block-v1-1-45ab094b6c02@gmail.com

---
Abid Ali (3):
      net: stmmac: enable MAC rx/tx after DMA start
      net: stmmac: xgmac: tear the datapath down in the documented order
      net: stmmac: xgmac: decouple the MAC Rx/Tx enables from the DMA ops

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |  8 ++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 94 +++++++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/hwif.h         | 17 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 85 ++++++++++++++-----
 4 files changed, 170 insertions(+), 34 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260726-stmmac-rx-fifo-block-ef589c38f96b

Best regards,
-- 
Abid Ali <dev.taqnialabs@gmail.com>


