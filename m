Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EC4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 03:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KV2UcpCXP3xjFpNUJT9QubQUi+SFkhGjluhGdlfUmis=; b=ZSiDuGaJolL3byF5dKNyzMV3UO
	La838UNzRTiZcUjJezCPpspfSTL5PqjnPlhzVe4yingV28KCqXS9zKM33Bcdei5/sHi3w89oNxLO9
	DUl78wLuZk0AF9sLxUx6NAdv5/WubxEMnjtduf/nelYfleASI4doI/lOnesYJ3plNVpYKGInOiC8j
	VAmgJlcuuuvi+Q5NUH+h5+eRygojs6diRigiFTUYP1z3vYnM9Mag4E9RF6tkpvgmNLDs+wM6dA62X
	UDeOfd8ojc9GmxkEajhIHbjkofRxp8+KeVg24zVH2itJrGCNC/Ohf8D4GsCPsXJkVaCR9Hpy3Tgt2
	R/a3Ti8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGyK-0000000DlHg-1iC4;
	Thu, 16 Jan 2025 03:55:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYGx3-0000000Dl84-4BHW;
	Thu, 16 Jan 2025 03:53:51 +0000
X-UUID: 7ac41dd0d3bd11ef9048ed6ed365623b-20250115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KV2UcpCXP3xjFpNUJT9QubQUi+SFkhGjluhGdlfUmis=;
	b=aqEClj3+WIs1VAIiI64m4KyqBPdCvlwRscqVVIG5i9c/1IbTpDlaq/PTqyg/dt+L6PW7wS6g3rtrBxVDp3x0n/LVemI1yK+EtS6x8P3JahM1fLLGNFTBEowsWR+cH7CPk0snIv4+J8t9ZinQp5+76zvaqzb84ZnAVQg0IPnoB3Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:2169da16-8326-4f0d-bd6e-be05fd1f41af,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:2743f80e-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102,TC:nil,Content:0|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7ac41dd0d3bd11ef9048ed6ed365623b-20250115
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <yenchia.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1220499376; Wed, 15 Jan 2025 20:53:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 16 Jan 2025 11:53:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 16 Jan 2025 11:53:40 +0800
From: Yenchia Chen <yenchia.chen@mediatek.com>
To: <jirislaby@kernel.org>
CC: <angelogioacchino.delregno@collabora.com>, <gregkh@linuxfoundation.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
	<matthias.bgg@gmail.com>, <tbergstrom@nvidia.com>, <treapking@chromium.org>,
	<u.kleine-koenig@baylibre.com>, <yenchia.chen@mediatek.com>,
	<yj.chiang@mediatek.com>, <yujiaoliang@vivo.com>
Subject: Re: [PATCH] serial: 8250_mtk: Add ACPI support
Date: Thu, 16 Jan 2025 11:53:38 +0800
Message-ID: <20250116035340.3838407-1-yenchia.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <ac3f0efe-c197-4279-9b73-5d7dd3f300fc@kernel.org>
References: <ac3f0efe-c197-4279-9b73-5d7dd3f300fc@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_195350_043677_2EF22402 
X-CRM114-Status: UNSURE (   8.09  )
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

> Wait, ::set_termios() is NOT optional.=0D
=0D
Got it, will put it back in next version.=0D
=0D
> This is a magic constant. Define a macro for this. Hint: 26 * HZ_PER_MHZ.=
=0D
> Is it not/cannot it be part of the acpi table? What does MTKI0511 look li=
ke?=0D
=0D
Currently clock settings are not included in ACPI table,  so using fixed cl=
ock here.=0D
=0D
We'd like to change the flow as shown below to remove the dependency on the=
 ACPI device:=0D
=0D
	uart.port.set_termios =3D mtk8250_set_termios;=0D
	uart.port.uartclk =3D clk_get_rate(data->uart_clk);=0D
+	if (!uart.port.uartclk)=0D
+		uart.port.uartclk =3D 26 * HZ_PER_MZ;=0D
=0D
> Why is this only for non-ACPI devices?=0D
=0D
In ACPI devices, these registers are inaccessible due to some related setti=
ngs not being configured.=0D
=0D

