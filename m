Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81255C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 02:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pG3d+Vv/D+c2XUQO5c2ZogKPSjLbdSoW6F95KaMEU4=; b=uKyLvBuEmcFe8hIm3WQ8AACe8b
	X5+kCoSvLEMBT3IEnBW51z0QE3xhgSbvZ6nCxSfptQ5x9dKjHsN/CKFv3ciXn7L1BADmRq6UFNQdJ
	Vv0IFd6xAaHNHY+svKzmarMNc0Yeb3w/iHz3O2stDBUg/896BdWK2IWdtHtjZ0pi5oY8ObVFm/NWs
	qeE6KCdlLGXtA6zFVBiUi2ySKmSfigtlXveKpd0uwfUhepbXTEmTEqhfnyvjozV3s2n9Yuy0CJFZ7
	z3QkeG53hRBYu3NBv1Q6QtoWxl6fLhXLx7zydZg/X/s6XTv4adu6e1bSPJq0OpAXuIBgw1BLUI57K
	OcnC5HPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMdg-0000000GxXI-0dfP;
	Fri, 06 Jun 2025 02:17:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNMWt-0000000Gwyr-0isa;
	Fri, 06 Jun 2025 02:10:00 +0000
X-UUID: 540808b4427b11f09f706fa2197c6ceb-20250605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=9pG3d+Vv/D+c2XUQO5c2ZogKPSjLbdSoW6F95KaMEU4=;
	b=n41R62xUaNPjCwODRQNRKrZ2PoaaCyWlyxoJslzY7JPrzjQYqFnmxVpql14LEHqgPfxKFVhDamUDNGQLHIi0Z0KELZKOzgFyxGUIziGePCZq717S+kUDxbH0j4F62pzu7b+pfzZ6W5f4FRH96r+QcFWT7rv9IwDCyiFLuPA9uKc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e5490905-b80f-410f-bf15-c07f30334e20,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:db47b281-ef30-4982-a001-67a9a83f2fda,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 540808b4427b11f09f706fa2197c6ceb-20250605
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kuyo.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 781749689; Thu, 05 Jun 2025 19:09:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 6 Jun 2025 10:09:47 +0800
Received: from [10.233.130.16] (10.233.130.16) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1258.39 via Frontend
 Transport; Fri, 6 Jun 2025 10:09:47 +0800
Message-ID: <16a2c47ec23a70eee085900ad3bad07d68bc87da.camel@mediatek.com>
Subject: Re: [PATCH 1/1] stop_machine: Fix migrate_swap() vs. balance_push()
 racing
From: Kuyo Chang <kuyo.chang@mediatek.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Date: Fri, 6 Jun 2025 10:09:47 +0800
In-Reply-To: <20250604160436.GL39944@noisy.programming.kicks-ass.net>
References: <20250529084614.885184-1-kuyo.chang@mediatek.com>
	 <20250604160436.GL39944@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_190959_212378_12C6BA6F 
X-CRM114-Status: UNSURE (   9.84  )
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

On Wed, 2025-06-04 at 18:04 +0200, Peter Zijlstra wrote:
>=20
> External email : Please do not click links or open attachments until
> you have verified the sender or the content.
>=20
>=20
> This and your other patch about migrate_swap() are two distinct
> problems, right?

Sorry, this patch also addresses the issue of double adding to the
list(the same problem),
but it functions more like as a error-proofing mechanism...

However, after some deeper investigation, I believe this problem should
be resolved at the root cause.

Maybe we should move to another mail thread to discuss the correct
solution:
https://lore.kernel.org/all/20250602072242.1839605-1-kuyo.chang@mediatek.co=
m/


