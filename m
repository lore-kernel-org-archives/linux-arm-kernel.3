Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2EDC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sa65UZo5QHwJ99/kDWQn+CX44VKbX5JZ/RDf9qrF3lM=; b=LJ+4LtEJxo644OxTkkNl8daUmw
	joLT4Cxa+ZMmcW9iTRviHLXzoLq5p1fRFQDJ2bmnvCpCduQdfbpfhbgCEtx0EGu6UHrwnYM9AEQR0
	olHeZX6e21WjZJXhMFbZlLgKUiYEbgjj4NMC/qmLlhTg546fm+gX7LrzIkYVI1thzQvTixAdZTBX3
	fOmDknbfUPjL7nj7m7x5YmfqKHJfP/ccrSdlpL0P6J/g+mFWziOHQAp+nbh1/Z7D2HV4CeAI/7N1n
	IyJ9YAXqSE4/B5+Zy5TP6Xnsyf4WbG7W2iM/CQ9eyGVsIUlSDqb/R2TuRDdl67CIUZl5koYlhketz
	I3W+am9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL47-00000003IFz-0fy8;
	Fri, 09 May 2025 10:34:51 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKAF-000000037wX-0E79
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1746783427; x=1778319427;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Sa65UZo5QHwJ99/kDWQn+CX44VKbX5JZ/RDf9qrF3lM=;
  b=AybvNqyEF0GAZVvSiJKrIxcExxQmq5ItIBVFfe3DNvoySFO7mbVqF8bA
   zHe+EBUF4KdEoY5FsdCro2sIPX/yFjA0cI38hhyNH8fbaUZp6Au0h8Qz2
   wh5MENyAkpDgYjAKlp671VLcjYqsfDY7x9L4l4+wDAvB5kn+dMMsqxnKr
   c/eUB/tIM06y2S7LOaVPPxY0TwXWt9uzCpaHYb27WH5hJdKgorUaQmgOh
   CCLyc1pNTpmqexYfgL2wYHakKAaYCdF7lPc4m/SnXFNFueVo+I6uebi6B
   c/5vgA2MRsIWyBkNMwVBJdxAwVjBNrLYxuikGQynZ6feHztUaz1BwsCpC
   A==;
X-CSE-ConnectionGUID: T4LyJ4wQQe214YuReQuUzg==
X-CSE-MsgGUID: nMKPSJZ7Ru6+ruPHa6EBhg==
X-IronPort-AV: E=Sophos;i="6.15,274,1739833200"; 
   d="scan'208";a="43982717"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 May 2025 11:37:03 +0200
X-CheckPoint: {681DCCBE-4B-45F3AE15-E90F7DFA}
X-MAIL-CPID: A167B3FE7372266156962412CDD67950_5
X-Control-Analysis: str=0001.0A006374.681DCCBA.004A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EAA9163D2A;
	Fri,  9 May 2025 11:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1746783418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Sa65UZo5QHwJ99/kDWQn+CX44VKbX5JZ/RDf9qrF3lM=;
	b=GRMwnEBz6zFlm1IXBrZJVCIOsjwp9p6s4klim27YmSXswJEmW4h1Y/NP6T80Eb7eMcsTZy
	/3Xe7ePXLWgeVfjfF3Sf5FTKmg9pyudEIeupHsCCsrOJwqdHlDbfu1q40Mi6Vf1epZAocr
	wv5U4JDv6l0suEcvX3xxI1+LJjkmv0hc2yx35ELq48dSKsdlORo0lZpr+oket9xp1HqbAC
	Xme3txGx/RLd4ZS0lZ0G656mKn6J3aTPMsoSlodESZa89bzsd9VJmNvVgGQHcKl8Kp4Mpa
	fMa6FU+jWUKQZtM3ytUAl3uTOdpnoDZ8VwuhccI+cpXMslre2/JHI3URi7aDYA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1] soc: ti: wkup_m3_ipc: Use dev_err_probe
Date: Fri,  9 May 2025 11:36:52 +0200
Message-ID: <20250509093652.1866566-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_023707_581669_B0896987 
X-CRM114-Status: GOOD (  10.28  )
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

During probe the mailbox channel might not yet be available. Use
dev_err_probe to silence this deferred probe error message:
wkup_m3_ipc 44e11324.wkup_m3_ipc: IPC Request for A8->M3 Channel failed! -517

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/soc/ti/wkup_m3_ipc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index 79dde9a7ec639..5845fc652adcf 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -644,11 +644,9 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 
 	m3_ipc->mbox = mbox_request_channel(&m3_ipc->mbox_client, 0);
 
-	if (IS_ERR(m3_ipc->mbox)) {
-		dev_err(dev, "IPC Request for A8->M3 Channel failed! %ld\n",
-			PTR_ERR(m3_ipc->mbox));
-		return PTR_ERR(m3_ipc->mbox);
-	}
+	if (IS_ERR(m3_ipc->mbox))
+		return dev_err_probe(dev, PTR_ERR(m3_ipc->mbox),
+				     "IPC Request for A8->M3 Channel failed!\n");
 
 	if (of_property_read_u32(dev->of_node, "ti,rproc", &rproc_phandle)) {
 		dev_err(&pdev->dev, "could not get rproc phandle\n");
-- 
2.43.0


