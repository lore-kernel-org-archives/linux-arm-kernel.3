Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE72CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 12:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnoK284wC9IBvGY8v6wVkknfTGfHO/sFr+t4M3yGJFM=; b=JGNyAA5qZuBKE5veg01XOKjbBt
	WyafmL3S9tXHpfzD2bOkKRJA3uaxIvLGct77Z/Wy62QzPCmJhMpRwEbXgeiH9I9w0vJc02QtP4Lek
	MdwpNgssGvrXzH9npnpYtImzsQheez/aocmE0n+fhk1+/2kLFoqpTTCe0CRj32+GPKA/epJWuHCDp
	ql1+Aof9gp7d0qdOybEjWKlpluYDFcD1RDkH51HFPpXeUgxFXmrdgvfdp+8DsZmtoOlbKcd7Z+ZPK
	YlrfUbsZDbWBEjXgACPuThgxAZXSYj6TldozpJUsbSpRDKifEFPf5BEv2vCQtYCxFyfKeSErP9y8Y
	H8YstiCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0fUf-0000000AIpi-1Qz1;
	Mon, 22 Sep 2025 12:18:09 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0fUb-0000000AIoi-1Avf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 12:18:08 +0000
X-UUID: 293a636a97ae11f08b9f7d2eb6caa7cf-20250922
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:820a0db1-d8aa-4ccd-a29a-d5a8403565fe,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-40,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-25
X-CID-INFO: VERSION:1.1.45,REQID:820a0db1-d8aa-4ccd-a29a-d5a8403565fe,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-40,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:6493067,CLOUDID:a01a001bb6b5825328af111a4ef35bfd,BulkI
	D:250922201752257MKIUF,BulkQuantity:0,Recheck:0,SF:10|24|38|44|64|66|78|80
	|81|82|83|102|841|850,TC:nil,Content:-10|0|50,EDM:-3,IP:-2,URL:0,File:nil,
	RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,D
	KP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|UOG
X-CID-BAS: 1,FCT|UOG,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSI
X-UUID: 293a636a97ae11f08b9f7d2eb6caa7cf-20250922
X-User: pengcan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <pengcan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1686138324; Mon, 22 Sep 2025 20:17:52 +0800
From: Can Peng <pengcan@kylinos.cn>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm/syscalls: mark syscall invocation as
Date: Mon, 22 Sep 2025 20:17:30 +0800
Message-Id: <20250922121730.986761-1-pengcan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aM1BSZV43DB_l5OU@willie-the-truck>
References: <aM1BSZV43DB_l5OU@willie-the-truck>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_051805_688659_AC5B0BCC 
X-CRM114-Status: UNSURE (   7.33  )
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

Hello,

>> The invoke_syscall() function is overwhelmingly called for
>> valid system call entries. Annotate the main path with likely()
>> to help the compiler generate better branch prediction hints,
>> reducing CPU pipeline stalls due to mispredictions.
>> 
>> This is a micro-optimization targeting syscall-heavy workloads.
>
>Does it actually make a measurable difference?

This change implements a micro-optimization. Benchmark results
from the Kunpeng 920 machine are as follows:

before:
- lat_syscall result 
write call      0.2332  0.2337  0.2341
read call       0.2501  0.2493  0.2506

after:
- lat_syscall result
write call      0.2301  0.2316  0.2307
read call       0.2492  0.2498  0.2491


Best regards,
Can Peng

