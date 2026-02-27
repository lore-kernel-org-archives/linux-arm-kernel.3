Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3F8FEFB6C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1kwbnfNOHC2589geLnERLCn6Au69Eq2BR8V45ix5tXE=; b=OC+KnZSbnoVomq1/ZqYGURGnt/
	p7UChAMPoKRvFsLfw+3XF0XSyXo7kwTChXsyI90/3u0dwcsOdULgSg54ymlqssJyQdM/CLwjaibp2
	szG0SEtDJbi8oxrDYqnZT4DyWiKNwoybTplQWZUofE71Ipkr7+ihjTEjSva3AP+DGyrj7rixunnrL
	02kLRGV2cA+eXoGLE1sfcwwlC4jzE2X6J8ZXzKeXXl68xGVd7DcjHTHMeSHP4COkWu7tqZTnwAATJ
	tNtOapR7EHETFm98ZTG0EuzyaWqpI8GH2FQQMIcgak3c3Idxw6TJtZ0H4/6T6x/r4R+3XdqM1vuvY
	sFplgLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0EF-00000008h32-38rn;
	Fri, 27 Feb 2026 15:58:11 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0ED-00000008h2h-1ISL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:58:10 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2ba895adfeaso2114268eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772207888; x=1772812688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kwbnfNOHC2589geLnERLCn6Au69Eq2BR8V45ix5tXE=;
        b=fTRDsEejjmyLIcAQt/uHeUmi9pHk5eBsIz6L3Mrdn4vecYx3kgpUY0+aJbFlgkGJup
         OyVg43VMPNcWvHqjwczZGCNCVK52l5u6yjAeQ4C4+rwQ5aWnNV+UrImmIa5xAj7bg+lc
         ieD65W2u8FRk60FLv1hGx7ja+z0e0pcjEV0/zv+t1M/uLmzizeQ5k8Oq3fm22nRW8tXg
         5xX/WEx91hwfdIJYv7Pt+YHR//sdsP3yrdmvKAKBuddnMTc6JE07Z5CqFa7utZ2YEv0u
         K+nUop63+gqFxU/0RSmF25xf1L+fF1+NqPXSDnYzpBIXll3XeSCBUjPUalxDSVePmtIX
         2vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772207888; x=1772812688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kwbnfNOHC2589geLnERLCn6Au69Eq2BR8V45ix5tXE=;
        b=geTv9+SV0oER/pEz0RwpdMg/pz/gAwNufaYJ1JFSarlHptx/Kd6QnNSllcqmi7d9Mo
         7PTN0UUHbJjkIxssazA1rw2EnYO6tUW6+KT0sLc79kdFieHNH+Pv0LZPVwvh17TQoOko
         iOgPKXJKc3Jg1Y5e29Zk+6IXAE8JPTiX03phZOQgwV2ywPAIIGgC2mZqo/DmaPLTSxam
         bItKPzvZl0TMCxp6TEZJVqehl1estGFj8tHYejWWI+39JHDkzxCbwG3N1pSK9uavV8DM
         XrHTwi74B544Gsrju601KgLe4fZw1Jm0xI6tul+vLuyP4eq+5E3ZfpQxb5OuI0vReGDS
         UN7w==
X-Forwarded-Encrypted: i=1; AJvYcCU4VxX/VaxFRDliDjmzuyr9OViOkzTyPhzFbiWxmmpJbrCWnPpdqgkLLuT+TcG0rxaZMBsHxKWuqJuPUr4MvJoA@lists.infradead.org
X-Gm-Message-State: AOJu0YzG3ZrFEuTAd2CNNxK/+EMH7UzwrGtGRtfy1E6EzHXn91lvEgVa
	MkESiMgW40ukcbgFnpEFF2i0Mr6hsS7Q8waepPmJNFqSvczJTYSl6dx0
X-Gm-Gg: ATEYQzzUqhdEuiZY2Nooatwmlve8RbwzehxI+61nvqWiDmqt6PqHiMR/4bep/IKQUZ2
	kN1oGyfRU4zFUe4HUJdIuke/4PUrF0T8y4fplA2IyzXBrA+7281M2lMhk6D7x1bdRf7hl2NS78j
	VAangPjuLYaukbhJjwYdq9Xs15H+lkM51GKhkz7TiNuq3Q7NhPnW4g5LGNU6lPM0itlxwqdTIzW
	7UCwd3i4sOcI9qYuXrkdnLBlQChua0KDQLHUq5cyd6zPHkfha/WOfCrbj28TiQolkfeGqtr6k23
	AKvnILjxtLJ9IONE3oGDrZgUzKNNEZmDaY12zsmuHWCsAvOPIqk946hAxBh07CkMMF15B0orcJW
	eODJ585IleC3AmjfvuqSBR6t1r+7a9nvykZZmvzEiQZT8BnDT7rfuVy40/s/KbOQz2rEwKD4MSW
	5ZafBAR1VfeYxvL95qcDx2rN71vjD9d9K+dzVc0ZwHBixkdeCiCTsEvhVy2laj4aYAJ6q9lcoe
X-Received: by 2002:a05:693c:290d:b0:2bd:d04c:a433 with SMTP id 5a478bee46e88-2bde1c94f64mr1123968eec.15.1772207888214;
        Fri, 27 Feb 2026 07:58:08 -0800 (PST)
Received: from arch.localdomain ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1cf0115sm3833508eec.8.2026.02.27.07.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:58:07 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v2 0/3] board: sunxi: Add TaiqiCat (TQC) A01
Date: Fri, 27 Feb 2026 23:57:57 +0800
Message-ID: <20260227155801.211376-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_075809_348013_8806E5D6 
X-CRM114-Status: UNSURE (   9.64  )
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

This series adds support for the TaiqiCat (TQC) A01 — 
a set-top box based on the Allwinner H6 SoC. 
Originally released by Ultrapower(UQSoft) as a blockchain terminal, 
the device has been discontinued and is no longer officially
supported.
  
  https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html

Jun Yan (3):
  dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co.,
    Ltd.
  dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
  arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
 4 files changed, 369 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts

-- 
2.53.0


