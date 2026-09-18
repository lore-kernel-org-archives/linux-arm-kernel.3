Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9AEC982E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KZ+diBnRwvvx/QAv5fV0vhwZgR/V1YndVVm09y5mFBQ=; b=F2HdIUDlBFcBzwLPsOeasafBDv
	S3Dib5nEBjl9Nr6MDq0QaQgACqQ7wjgf/lSe4tNndxqVwryiN2bGdJPCsj6xQN+pcn9N8k2uC7EM5
	/RPTKyGJNODXZWk7x6YMgdcztUQfCUBHKfmVWxhSRN7eJ7ikAjlEAbMPK12uDUi1TMy2VFX2bHGMw
	rUYZf/Xan+26EUhMCVyHBn8S8unXkVopWmbp15s8CsOwajL1cjYymhu0BwdqZcDC/SsMRVkcPXnyc
	79R0B8Xcv/RvnHPRT0hOdi0GEqv3uinwdVzHQJZVAbLVX2iHf1E/v0cwgwSRcJ2NHee+joQtr6+bn
	scdd81wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zjy-0000000Ek74-3YDs;
	Fri, 18 Sep 2026 14:39:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zjx-0000000Ek6V-210J;
	Fri, 18 Sep 2026 14:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KZ+diBnRwvvx/QAv5fV0vhwZgR/V1YndVVm09y5mFBQ=; b=AoFM3CfoSKwVMZAhW5XDVK6Lwi
	Z0aeRFXoD8RubOXf78ndRlY4S7jFOK911h1fSpupc7B6UR224mmtUwUxNuS37cS81ujhcfKuwNbye
	hGMZgPwo2uSunuCGdeSbOIcf6NNJMszgtpZqEENKifiE+VY7Yx9ricFpAdWaQgBGGi1j4lG+uSS8D
	l56aEzNFRb3oELWAmje83fGj2OR2TAwIe2sMkNnjNBoHbVgw/4KqouN1RPTgfRIN7faEpsnPQJIaf
	zOH11VyuLwTopNS8uw7FEeDmWvO4EBJ8oO7+7hRob4J8iUXgQ+5OK2ihKg3E5zQzGsbM2K5jMmY4k
	IHT6Vzdw==;
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7Zju-0000000ADSJ-1owV;
	Fri, 18 Sep 2026 14:39:00 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 136151007AE;
	Fri, 18 Sep 2026 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789742334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KZ+diBnRwvvx/QAv5fV0vhwZgR/V1YndVVm09y5mFBQ=;
	b=MWxHikQk7TWnftNJ4LNPpq9sCMIRdLC4KhoVBF3IUdNOlnrX+aJIaqS9OIqI5tkvylZH2R
	PyDu+fBVYs6vN6ezjTnJlBD3JfkeHPbeIHZIKFakfGfQGF4zAf1BEhvqXFTBHAMDJj4tVc
	7Cu1X8PezihDC1qFH3YQjWg+JpVaXf0=
Received: from frank-G5-5590 (fttx-pool-80.245.73.6.bambit.de [80.245.73.6])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id C2F021200CB;
	Fri, 18 Sep 2026 14:38:53 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] Add gpio labels for R4Pro
Date: Fri, 18 Sep 2026 16:38:41 +0200
Message-ID: <20260918143846.30458-1-linux@fw-web.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_153858_690818_0795C88A 
X-CRM114-Status: UNSURE (   6.60  )
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

From: Frank Wunderlich <frank-w@public-files.de>

This Series adds line-names for i2c-gpio adapter and pcie hogs
for easier debugging via /sys/kernel/debug/gpio.

Frank Wunderlich (2):
  arm64: dts: mediatek: mt7988a-bpi-r4pro: add names for i2c-to-gpio
    chip
  arm64: dts: mediatek: mt7988a-bpi-r4pro: label gpio-hogs

 .../mt7988a-bananapi-bpi-r4-pro-cn13.dtso      |  1 +
 .../mt7988a-bananapi-bpi-r4-pro-cn14.dtso      |  1 +
 .../mt7988a-bananapi-bpi-r4-pro-cn15.dtso      |  1 +
 .../mt7988a-bananapi-bpi-r4-pro-cn18.dtso      |  1 +
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi  | 18 ++++++++++++++++++
 5 files changed, 22 insertions(+)

-- 
2.53.0


