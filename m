Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2813C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ayTupi2WPvTI3Popd5a6clT7WjyIKWAcMrNm4hWyGyk=; b=H+zMqS9nqu0a5yOKiTRyAMXQ2q
	3YM264N7ffXo8UwtbhrVtZ1AcHUKUSTUrP+ytfd7kTpoxlx20ffzH+zLBI7wBn8BI9FtPxkTAQBkR
	o75nzs9/GpZSqeVpjQuOudLRoE565RR5wPLXUM+eM6S1WVEQ1Mi4KFUiq7O4dEfTgfPto3WgVAfBO
	Iqq8B0YyEj1avamVC8A1h3+aHpTUZ4Yabvp3EMM10TC2dahIrIZTu+iyi5UfkPkE+qyalB9R/1YTZ
	V2J8bqczA2V2+Xm6ufihTjKKDGkeVSFOFvlD0oYICVLbe5wtKoGNtCCnrf/ADPXyYE2ql9o5E1Hk2
	9Sflyuzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJ0-000000024Jq-1fCZ;
	Mon, 07 Apr 2025 21:46:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rer-00000001iSZ-3Bxk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 18:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ayTupi2WPvTI3Popd5a6clT7WjyIKWAcMrNm4hWyGyk=; b=bXR3R7fxim5/7tOUTrqrnwgx+g
	IVCz/H1aZjiL5wdcNkQNzBW1Y3g/cNJ6kovPgAgP9WNx+6R2Nrgc/296hWeQIXw7AHVewWkt0nW9c
	CNIsWZWplGBknmrNIOsS9QVKC60uS5xUcGUWU4bdueCfgIG4qCvekr5XAaNJuci+q5SknZbeQalaU
	5ucKBxGX4dEZzmMUiZX4T7PYTE+u0HAq+zKVcGMyIrykTwF1k3NO1/Zx3Ob6VUs/hZDhNFr8Itb2o
	49d7Ymm+UMXksaoP2julxc4nXIzhuzyt6sOhU6uxXvQOEWcH1juF842V0/UgJUc6q7p+PO0eKgp4O
	J1Wqv5LQ==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1reo-000000086WU-2ft3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 18:57:20 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537Iuq0i454871
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 13:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744052212;
	bh=ayTupi2WPvTI3Popd5a6clT7WjyIKWAcMrNm4hWyGyk=;
	h=From:To:CC:Subject:Date;
	b=OX+PNp412lCc0vxhnOijlFpYYMx/tJ5YQmkV0cuMqpvpzNsm301qpxGYAg7ILwzps
	 C7Icr+4R8Ys0tWuKfbkxkqtxhSHVRKIYKSFkb3lQypD4CkIvmJkpTvE9FIDR2aukmL
	 r/TAGQJJ4Zj4Qr51qB+A5bOBnCMhBNSeZx1oMeZ0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537Iuq3q011999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 13:56:52 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 13:56:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 13:56:51 -0500
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537Iup47094348;
	Mon, 7 Apr 2025 13:56:51 -0500
From: Andrew Davis <afd@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, Andre Przywara <andre.przywara@arm.com>,
        Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik
	<robert.jarzmik@free.fr>,
        Alexey Charkov <alchark@gmail.com>,
        Krzysztof
 Kozlowski <krzk@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <xen-devel@lists.xenproject.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v5 0/5] Switch more ARM plats to sys-off handler API
Date: Mon, 7 Apr 2025 13:56:45 -0500
Message-ID: <20250407185650.411887-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_195718_914181_3D45DF33 
X-CRM114-Status: GOOD (  12.12  )
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

Hello all,

Continuing the quest to remove the legacy pm_power_off() global
function handler. Remove uses from arch/arm/ using the helper
register_platform_power_off().

These have been sent for several cycles without feedback, not
sure if there are anymore active platform maintainers who
can take these individually, maybe these remaining could
go in directly though the arm-soc tree?

Thanks,
Andrew

Changes for v5:
 - Rebase on v6.15-rc1

Changes for v4:
 - Drop already taken patches
 - Rebase on latest master

Changes for v3:
 - Rebase on v6.12-rc1

Changes for v2:
 - Collect Reviewed/Acked-bys
 - Rebase on v6.11-rc1

Andrew Davis (5):
  ARM: highbank: Switch to new sys-off handler API
  ARM: pxa: Switch to new sys-off handler API
  ARM: sa1100: Switch to new sys-off handler API
  ARM: vt8500: Switch to new sys-off handler API
  arm/xen: Switch to new sys-off handler API

 arch/arm/mach-highbank/highbank.c | 2 +-
 arch/arm/mach-pxa/spitz.c         | 2 +-
 arch/arm/mach-sa1100/generic.c    | 2 +-
 arch/arm/mach-vt8500/vt8500.c     | 2 +-
 arch/arm/xen/enlighten.c          | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.39.2


