Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE09610D148A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 03:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q9pf6rDD3Pf4B9hD1p/Du2NAfmBkH3pJ3Ae9Sl7/2GY=; b=V5JG4E2Sok3WEuO2efi4ZtMU7Y
	odPkEoHOvu6TQvFPpHsXBeIIUdFPfha2AaaDoSf0F015aWX3zZMQYSdBkgT5TQPXe6d8vHVBqVH9j
	c7OuW3yGP1lqNfd4wv1Vo/T1EZnKS3qjZXjPcCqZI5SYlOzUKiAKP828JVbCw1yaHApQLqYqdWvhz
	cicAttvs6gpusi3mJBAqqO6YivoQXF0UzPkG1pEM/LWuGxmg1JyA1uCebxBU/pV8unRabPTR/+vP6
	6Q+5pDd5K3kj+gbAiLVGNucxwP8yQDZzWof8zH4l3llgLpopP5Ri+gilUxK0OgjBDkKEYIFuv9TYU
	JeBtofSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6gXF-00000009Vfl-1tSQ;
	Sun, 29 Mar 2026 03:09:57 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6gXB-00000009Ved-2lk6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 03:09:56 +0000
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowABXAW36l8hpmOd8Cw--.810S2;
	Sun, 29 Mar 2026 11:09:46 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH] ARM: rpc: ecard: bound variable-length chunk reads
Date: Sun, 29 Mar 2026 11:09:46 +0800
Message-ID: <20260329030946.32386-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABXAW36l8hpmOd8Cw--.810S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZry7Aw48Ww48AFWDKF4xCrg_yoWDurb_Ar
	92y3WDW340yFnFvw1YkrWrKryjgw18GF1DWrW7Aw15Ka98XryxZa93trnIy34UJrW09F43
	ta1fJayYyw13CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbwAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUkKsUUUUUU=
X-Originating-IP: [111.196.245.197]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_200954_086641_40DBEE15 
X-CRM114-Status: UNSURE (   8.78  )
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

ecard_readchunk() reads variable-length string chunk payloads into a fixed 256-byte local buffer without checking whether the encoded chunk length actually fits.

Treat overlong string chunks as invalid and terminate accepted ones before copying them into the exported chunk directory buffer.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm/mach-rpc/ecard.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mach-rpc/ecard.c b/arch/arm/mach-rpc/ecard.c
index 972465840548..1340ef0364f8 100644
--- a/arch/arm/mach-rpc/ecard.c
+++ b/arch/arm/mach-rpc/ecard.c
@@ -367,9 +367,12 @@ int ecard_readchunk(struct in_chunk_dir *cd, ecard_t *ec, int id, int num)
 	if (c_id(&excd) & 0x80) {
 		switch (c_id(&excd) & 0x70) {
 		case 0x70:
+			if (c_len(&excd) >= sizeof(excd.d.string))
+				return 0;
 			ecard_readbytes((unsigned char *)excd.d.string, ec,
 					(int)c_start(&excd), c_len(&excd),
 					useld);
+			excd.d.string[c_len(&excd)] = '\0';
 			break;
 		case 0x00:
 			break;
-- 
2.50.1 (Apple Git-155)


