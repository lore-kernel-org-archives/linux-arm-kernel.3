Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A586CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3vdcIG6wZtSxe+VtpnO2RW9SAO9uWsgPhoe8i1hM24s=; b=xAN85loXofTliHCTmGB3my+TsK
	gEf3I3jeE3E5LEqLEnAB/Wim9XB2Rp6KbwrIzjlr0mLphc0hYpXg1+LKhpkhxKM+U/5Fcfz07SAqm
	pbMBYtoO8OwcY8FbwkeDFWvViANbvk1+FyK/bd7y5cFbjQO28LZ+SVi5cAuAbtkbIXaSl/+q12//1
	KiOG2gCfF1n+Lu4fWJwxhv3cMbs6n8RwfSo3xkTN70hdKBZn/SELYx9ykwRX8O24Y6oz0kaUC5Mza
	nALx03af450s2jYD428EdDr6WbNw9FqVUP1xBjawD/hQ1RFKa3X+HqCRp2QROrdOe7tj1c61hC4ky
	3Dyf/VqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT3z-000000059kH-3Eme;
	Thu, 14 May 2026 10:13:07 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT3w-000000059iR-2dY2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:13:06 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c80167f56cdso3263159a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 03:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753584; x=1779358384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3vdcIG6wZtSxe+VtpnO2RW9SAO9uWsgPhoe8i1hM24s=;
        b=OCRez0uaWULDoftLWrFY3DrTEppxuPr74BxoTsmqTtAXbo7aGQB757TY6F77pGB03L
         AIWTqvAUXgq5N4JaoLWuvLE3WT1q+jmxOPXn3vuY7sq4B1bAVBedOC3R4A/7cGGdbwXS
         yxue/BMM1TPwzvNLTc1kSo95J/PavrKZxVX3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753584; x=1779358384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vdcIG6wZtSxe+VtpnO2RW9SAO9uWsgPhoe8i1hM24s=;
        b=sCtbD7FYCx/WhJ9IgdtPjLRhym5YdbfL/3Szrm2lWvW0F4cW4cTySo85qBSh8qySDd
         uom1JnXnhG0UPV0sooM27gsCxOzswNelHeBMFbYS+Ar+ExRBWU4Xa5oJhukM1TX3w9rM
         w1E05vPiQN6yx4edqwICxjQ/GANTujteIdToa9+yRiSoyBgNfpTs2BoTD8Y47mlDjJ5/
         OmYUhLOZMiBVZ+zoZxpcrRKl9AowT87X65pNMSJp9JR9eCNR4o1l5jHOENrgwoS2EEei
         Dp+sTn+b5Hc+oyoAsNTy+cpapVbwrpfOHJjVdzy5J0uvEuNsx8ieYpi6goK4vHasoNe6
         azPw==
X-Forwarded-Encrypted: i=1; AFNElJ/1uVAZ2f2Jhs1chG16R5TM7G1kOUjFAE2eT48R2Lx8cr0ezKXgPuxFtLOSjmcAy4Wwv5yxuGx/+L15aQPY/6I4@lists.infradead.org
X-Gm-Message-State: AOJu0YwbB274H74Vv+AG89tNHRN3BiV/lFBJrt7vXV+xmpr4yu69xNnb
	ZwN+/WjYJslrQvy2eAvlV5OMwnnJO6E23dtCoH3IoVphxZvzBLdreBuo4qvHqZ0QYQ==
X-Gm-Gg: Acq92OHj+f4A9f2hqfawN7qC28LQKNxi+yizE204Oi+eQhf/qSe9VrQkKe1GofOKbwi
	FKJHILklixyXVp/7cLyKv3qKq5At06gZ2pZrO3WL9tAysgrFdn4ye8FxTtcoq+VlglxeRbzfA0A
	xc9xQKNEqzhUFDXfn4h/5Tiis5YOFeD3ZIjbN+J7ChhMPg8WBIBcPcmd0n2/gzoh3oR9/XaCVmu
	6VP7IDP3+W+YGso0pncDzaQivzPMjntBd6lFcSDaAgM24IZKja1FLBBJUSShPQBg9P0ctMAM0nY
	Uy9VP7YgSsDwRofSJd1y6z33AuOyQ8W5jcKPTDP+HxZS8vW8jiCVS+0vKx3bkTpQzPBgNLEK8Nk
	4+apaDaPU99mhPngHW+uZkdiYh2AKBJdaWVW+wjs8rHSYHvIKijPyTlqwOP+2lXgj82zN4RsT+q
	t4HK9eTTqhA0keEqX1pJ8GviOn/V4hnt2X0zPGfQ5/46+ypnOspuM/7L4nPjCoHb57mmCaj9862
	DBBrjRj71o13090eEA=
X-Received: by 2002:a05:6a00:4409:b0:83d:6c12:a632 with SMTP id d2e1a72fcca58-83f05d82260mr6553294b3a.50.1778753583619;
        Thu, 14 May 2026 03:13:03 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:03 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: mediatek: random Chromebook cleanups
Date: Thu, 14 May 2026 18:12:48 +0800
Message-ID: <20260514101254.2749300-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031304_697619_9099076A 
X-CRM114-Status: UNSURE (   8.71  )
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

Hi,

Here are some random DT cleanups that are not directly related to other
topics I'm working on, but came up when checking for warnings.

The regulator related changes overlap with my other "Regulator cleanup
for Chromebooks" series [1].

Please have a look.


Thanks
ChenYu


[1] https://lore.kernel.org/all/20260505101408.1796563-1-wenst@chromium.org/

Chen-Yu Tsai (4):
  arm64: dts: mediatek: mt8192-asurada: Fix SPI-NOR flash compatible
  arm64: dts: mediatek: mt8192-asurada: Add (BT|WIFI)_KILL_1V8_L GPIO
    line names
  arm64: dts: mediatek: mt8195-cherry: Fix names for EC controlled
    regulators
  arm64: dts: mediatek: mt8195-cherry: Sort top level nodes correctly

 .../boot/dts/mediatek/mt8192-asurada.dtsi     |   6 +-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 106 +++++++++---------
 2 files changed, 56 insertions(+), 56 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog


