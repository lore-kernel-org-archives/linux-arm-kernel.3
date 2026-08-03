Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D593C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xejlBMo45WLuRAy/dsFHC7xCFuVwpUREVKu0zwhd9DY=; b=dO86Li6V2Uq5NE96XuwGARaLmj
	w47+vGa8ALOhvsvHxgKSZ+0Mg3mAVcwVT8GPescOL8Lw4Zw7ds59cmawvRcJbLkMzwZqu+m62K4wt
	jnoE6GcaSw9kSKagR3cdL+ZAWT1UtFb9rNxtMkqavRT46vQjAg0Qy2WO05FGh9smfi6VE3H1trzzk
	dJ+wTGqhVeoO0Pk4w8okvWSHfyOfJM9VRyo2inE1WkF2NsVVmEA4GB9kBSY8HiyrdYWd2WRYH1AON
	X4ADoiFXCW1WJYD1sZJ2Yewur6nSvu+7dIDI2e7nWGU7qfRcZtDmHEobNFfrnyYIxHOF5HT+kYSyr
	box6nZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquwG-0000000Ha0C-0f7Y;
	Mon, 03 Aug 2026 15:50:52 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquwE-0000000HZzY-0XS7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:50:51 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cace91f112so39438665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785772249; x=1786377049; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xejlBMo45WLuRAy/dsFHC7xCFuVwpUREVKu0zwhd9DY=;
        b=bJoE6KsS5b9QTJiY5v//KMxpKRz4ZhcJI1QVMbXFYyFyQqxRd9ayEmeGfzhMQDB2og
         77Ilzikemv9VC6CCxs+uhkbplMmc6XDX3QVhg4k11heMavQ2HDvTz8shwfmLQWORePw1
         UISsXoyjyskCHCeTrh3cUC6IAxdP8h+CuU/3DA1hkARGZmkgxH5u0+Q/3DBSxDjSDkEe
         85MgBRxlXZ2H6X8UG9Gtsa8XAfbfFCThTvDnEybYos8IEpi+nXzrlpwD1dtz8pm7gNbJ
         g05pX0OLHwiYF5TQ8RWLh8WYzXPYPgWRsItCjg+ujMyj4M6xMBZ0+kYcaWnAlw3azXhu
         95Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772249; x=1786377049;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xejlBMo45WLuRAy/dsFHC7xCFuVwpUREVKu0zwhd9DY=;
        b=BBPr4rociDGm6CeuXmgO3JhzX+SAMmbcV/aYzK8Qt3PGhAxGNggYu4cj09jBAfHsxj
         8DoSrkDfi4hA0nAqprbFID49a5o4I6QmoVEUsLHcWbVeVcqQOFgNVDgDLyJ71Qb8Aon8
         m19fb9M0f9PQdzZwonVnA3ru3aHoxiTo6GsIH6PpdN497js+6YRjEXKyTj0xOdMcCFyT
         iDiq4sWMNASYjb15t5/Gz5WG0EJpUzITrp7fVHqW040t99sGQTyGxvj69jz/7lgrqL4b
         910jDdcuPpL7AD2HXVA565U2PWNXy10TyYct3dcDR3TpO9Q0tA1RNeD6W0yZEtQPc2+j
         QwzQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro696t16hAh55N/KBzal1/732Qywvoa6v1BqUTmdt7oGjJ38ARaHdnjj88YztHXdOV4hFL3vZY3Kzu0whFhGxMY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8SXnUzdSzGcp9z/zxd9TZ9zBf3iRKKQ7WSwJqSlc8LB2DFwP3
	rQrhaRLbDc2Pa50T9sdb5BKFnlwomoR8Xy7X4I+DOadIDJViInoNmyNi3nLWzVkeMPg=
X-Gm-Gg: AR+sD10vxE/HZBWxolmJfNVq3VFeAQ4hu7L8nkPUJFs/GFKJk/2x84duw6aas1WdUoP
	Kf3zPLx5RP503CoU71ND8kr5zYK80u9ufgqqUCINUx5TDy1hrYmTg8d0XZ+AROjy+RaBqWoj0FO
	8lrzS3tpCHkxK3ab8KAWtguDgElTglbR4HdCKkyRN29jxxoxPF2Nk+99N3dj2e+aqMHY2bmqhnm
	X8oOMkc29YwWqft78RCQvdYGOE0TdPesFaFAPXMbuQC1mRXbc3O+AWpMAIQA3iaHO8ul+suP67S
	z4xqeDKcbDCbRgjoCtcdFNONd0QBYyCphVwyJtb/Im5/3GklVdbznu0d8sOJ9zPxN4yc00oFhvy
	YNCYz2eIkScRcAEKEEsVHzc29Gs2xeDcFOCizIw9lkPdscNSTMIcz/4kEHKCwgC9FXu0rNg6TbU
	aXBV65tBIKuncjr3aPFOqHIgrUjQ4ne0u7+mtMSDNk30pqMhqp97llutE7Qg==
X-Received: by 2002:a17:902:e543:b0:2ca:329:3da1 with SMTP id d9443c01a7336-2d052215bb2mr105382375ad.16.1785772248620;
        Mon, 03 Aug 2026 08:50:48 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d04b0ea863sm39573495ad.38.2026.08.03.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:50:48 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm/omap: defconfig updates for v7.3
Date: Mon, 03 Aug 2026 08:50:47 -0700
Message-ID: <7hh5lbjj8o.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_085050_177286_722D436D 
X-CRM114-Status: UNSURE (   6.44  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/defconfig-signed

for you to fetch changes up to d091917c23668cebb0ad23b18f5a9f6665150054:

  arm: omap2plus_defconfig: Enable multi-LED (2026-07-06 11:41:09 -0700)

----------------------------------------------------------------
arm/omap: defconfig updates for v7.3
- omap2plus_defconfig: Enable multi-LED
- omap2plus_defconfig: enable things required by iwd
- multi_v7_defconfig: Enable BRIDGE and DP83848_PHY for TI AM57xx, AM437x and AM335x

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: omap2plus_defconfig: enable things required by iwd
      arm: omap2plus_defconfig: Enable multi-LED

Parvathi Pudi (1):
      arm: multi_v7_defconfig: Enable BRIDGE and DP83848_PHY for TI AM57xx, AM437x and AM335x

 arch/arm/configs/multi_v7_defconfig  |  2 ++
 arch/arm/configs/omap2plus_defconfig | 13 +++++++++++++
 2 files changed, 15 insertions(+)

