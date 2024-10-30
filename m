Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B43D74951
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BV0pONGAO/O8kIOEvHPUytGYVxoUgCUB8GW7f5tMBZM=; b=MND+qtvVQiqFD1sFUxTKeO8j9Q
	2sgaTflsPMiDk7IYbPm7zJlUKlvmMCO2fIji6E7kcc5I56Bw3FDzgKEb9Y55d2+6ZsEcBqx81yWo9
	bjsxwHkutaUMk7QmxKkfEaZdeZrsLBXdyJE1yQqjFMXna8gz0q2LOOmnF/SktoZbkF49keR/4djLE
	h9I1M9+guRYuquL5pSZ1E4j23lpDHyS3+E3TaLvU2zp1IPzh/ph8HWd5UHMINsOt/HRjjGT0PiMY/
	XGFxGcjKwvp2WiLg6yOkEr4rGxUoypa85qVUR0In7hY7rvl8EVktnKXZFO4zU4TNHp/UtobGTzmH8
	pzcRX7yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62kY-0000000H4VX-2Lec;
	Wed, 30 Oct 2024 07:04:14 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62is-0000000H46G-1Df3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 07:02:32 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7ee386ce3dfso9205a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 00:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730271749; x=1730876549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BV0pONGAO/O8kIOEvHPUytGYVxoUgCUB8GW7f5tMBZM=;
        b=VwdicZn4/JlM0I4ipQadUkkDLSaCT0GeFA4knXnEpfn1LjPh8+03+7OrckBMdj3ANY
         +TZdrDz6Z67jSIGs/lwTvW8mcRtqDwYbyXenM1GivV038TbpJDE52ZWwSNUroLhk6P1v
         gskbjCKj5FaXecnY/UaWJNBrkDH10IMZWUfHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271749; x=1730876549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BV0pONGAO/O8kIOEvHPUytGYVxoUgCUB8GW7f5tMBZM=;
        b=IZrzqgp10xAa29lrIynZLJh8fM7aa+hc2l0k2xuho/p1JZcvM471138ucQCiBpbitm
         v9PFSd+izFhJFNPqg0vRlJ70g/bBZe2fqD+OZQXvJM/mEME+EhllPSwP/CHVHdV7zvBP
         2yPdYzJmJGXdKia3yBUziQkrr1P/d1cFZuVUZoHdoSdxLIKR17bKAHGjygqca9MIM3v3
         s99jDkrj7EbpMOUYe+AKkGsysMlLWJtYy64FxYg3q5z0XEcMw0QQc2iodBFfYZk10jdN
         fv5BKNlIvPMHR+k/7qEYSf2Wr6s1xUENNoXkQYr27FkIGFfZk7UoBURgUQ3NY5YUtBZU
         nimg==
X-Forwarded-Encrypted: i=1; AJvYcCUjpepWRd3gGcojGfAk2tQgdsgxQ2/LdO8ri5s1RnSOznsbJbxajxOvr0zYGfZnhAsUIHMmensTiCPzpLFjxPK8@lists.infradead.org
X-Gm-Message-State: AOJu0YywAyLpADPK+V4VbTE24IJlDAxMJ/RFa+wCZC2ouBGaxB7Eg5E5
	hebLb4ls8oPMqAnUZWmOwjqQe6tU4jPKwjre+qjc1GW4VE/isr5qnmJePflOHg==
X-Google-Smtp-Source: AGHT+IFgLrEbx+kS1NBOY+/5ITRlJ0i45ZBe6U9Y810ez1geYrM3koM48+/nM72kFTZaQ+a23lBHdw==
X-Received: by 2002:a05:6a21:3a82:b0:1d9:13da:db15 with SMTP id adf61e73a8af0-1d9e1fcaaf3mr6026755637.24.1730271749027;
        Wed, 30 Oct 2024 00:02:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057931a94sm8635848b3a.68.2024.10.30.00.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:02:28 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: mediatek: mt8183 cleanups
Date: Wed, 30 Oct 2024 15:02:19 +0800
Message-ID: <20241030070224.1006331-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_000230_385663_AE04E4D0 
X-CRM114-Status: UNSURE (   9.89  )
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

Here are some cleanups for the MT8183 Kukui and Jacuzzi device trees.
These just fix up some names, add missing supplies, and drop redundant
regulators.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (4):
  arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop pp3300_panel voltage
    settings
  arm64: dts: mediatek: mt8183-kukui-jacuzzi: Fix DP bridge supply names
  arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add supplies for fixed
    regulators
  arm64: dts: mediatek: mt8183-kukui: Drop bogus fixed regulators

 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    | 32 +++++++++++--------
 .../dts/mediatek/mt8183-kukui-katsu-sku32.dts |  2 +-
 .../dts/mediatek/mt8183-kukui-katsu-sku38.dts |  2 +-
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 25 ++-------------
 4 files changed, 22 insertions(+), 39 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


