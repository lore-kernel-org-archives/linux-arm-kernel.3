Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CC1C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 01:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4KBPezujvLEYZQIAy6LZrHJ3s9IZRdJuUtkvZnlNOc=; b=SG1Y7DREhLJmsNoCiFefhDHxWN
	2vbQzd9lGo5YqrjMh2/143rAzx1HUjEuVwothOe4Pdn8wnZAkw7wgamAPKA/TbXhIBNd4INHps3KN
	vE7T6ntorc+VedisVO2RyqUD8ATvPaCOGd42QYPrzOIQE6RunHaXceg8eg/0qR90cp5DEiPJpiF7l
	1ScMo5zGQX/l7QzyhDHY0xzQcaQTRzl8w8AxmcbxJl6eNOouue+qD7m7IYQpcSv3lyVXLvsEEyZB2
	JkoziZ0wV2YyyfjtmXGKTFkxIzuB1bW94JHkJw6ZX91xQMXBSwz2OF9jY1T0SWladLU4rO9yNeMOB
	vkCET/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxDts-0000000CPJy-0p3A;
	Fri, 21 Aug 2026 01:18:28 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxDti-0000000CPIv-3y38;
	Fri, 21 Aug 2026 01:18:21 +0000
X-UUID: 2c4fd48a9cfe11f19a56ed5b684f684d-20260821
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:67fda1e7-4a35-475c-a916-95bdb6d448d3,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:086a8dca4aae43578162ead21d663c29,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|850|865|898|915,TC:nil,Content:0|1
	5|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2c4fd48a9cfe11f19a56ed5b684f684d-20260821
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 70470155; Fri, 21 Aug 2026 09:18:10 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	kernel-list@raspberrypi.com,
	linux-input@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Input: raspberrypi-ts - reject out-of-range point counts and slot IDs
Date: Fri, 21 Aug 2026 09:18:07 +0800
Message-Id: <20260821011807.2909700-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAPY8ntBO5Rk6dEcRc9SgYKpgF6=KBxg7STpLT02whQ8pY-BW0w@mail.gmail.com>
References: <20260820065340.3765457-1-gonglinkai@kylinos.cn> <CAPY8ntBO5Rk6dEcRc9SgYKpgF6=KBxg7STpLT02whQ8pY-BW0w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_181819_981045_79485A1B 
X-CRM114-Status: GOOD (  10.26  )
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

Hi Dave

On Thu, 20 Aug 2026 18:43:05 +0100, Dave Stevenson wrote:
> TBH I'd support dropping this driver entirely. Will anyone object if I
> send a patch to do that?

Fine by me. If it goes, this patch doesn't need to land.

> Can you just abort here?
> If this was with i > 0 then there has already been 1 or more
> input_mt_slot(), input_mt_report_slot_state(), and
> touchscreen_report_pos() calls which update the device state.

Yeah, that's a fair point. Returning in the middle of the loop
leaves the earlier slots already updated.

If the driver stays I'll send a v2 that checks all the IDs first.

Thanks,
Linkai

