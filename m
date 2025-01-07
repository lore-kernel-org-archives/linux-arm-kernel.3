Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC623E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5dWVUsjgYCfyghVbl/aVOvjNHhBfWKNBo9KEyUYVOsQ=; b=OClZVzG4TYtGOp0Sp256YVkD4N
	E9m7MqxMN8gedSqgMxCbzv6lDQlKr6+KLIX5ZdGzm+OFpRF89Tn6cz32o/0zITdnjtH+TPEhEH8iw
	T4Q6wRHxKKI6HUobZ/jTVg4xZVNxQgvdAm077HExG8AhlbOZ6YAu0Ku5LHHgWG2kx/sI2lSAvdMq6
	qF5PC5OusFJUffFjA6o8Piu1klr9E8imeTYmYfWYeKXMMx/tBGoOr94hKvphnKCebqMaBmYwgUzJg
	7/OXCMm3HF4uZ2UID84JzS3F06LYmMh5+ltfrv+/zEkwi0s6PRY0lcPTppaJ3SFKuNGmfpGlcv7ew
	Qey8MPtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVABM-0000000562I-398U;
	Tue, 07 Jan 2025 14:03:44 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVA94-000000055Sx-3rzX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736258482; x=1767794482;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5dWVUsjgYCfyghVbl/aVOvjNHhBfWKNBo9KEyUYVOsQ=;
  b=AMbnaIkcQZq+irCxgTSvRpeE0oNUdT7vYY+relinCeRd7yS8wFPrL+MS
   +Tikj3G8njxDEOdCUXkIbKKILor9FT7tocQ/uVXd255eLCSi5pJu0w7be
   SIZUNscS5Vpr6ZU1oi89UUrDTQtYyt39ipbXjd1y5OeI6rYR/i8+CUvV/
   gaRB6h6OMg7hITJgKjEHFsL17PRp3IxILp+1VlJjG2L6/Ud+08SQFgS6W
   lqTFcwr5i1RLBR2EU6oYVCLBURn2bPEpM1aJ6jKc9LeF9pUVejZtmLYW/
   J4lyc77as9CoUz0btP2e2/GeFvKxVmf8nenu/1mIu/ZnFlxvQAbXzMXs7
   Q==;
X-CSE-ConnectionGUID: K0rj5RPgSYezIE56GMO7qw==
X-CSE-MsgGUID: nS7yo3ndQ/eDyIYEfEslOQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896215"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:01:20 +0100
X-CheckPoint: {677D33B0-43-1D00F64B-E6C57517}
X-MAIL-CPID: 4747FB3F406B0D7ACCA7EA030A363758_3
X-Control-Analysis: str=0001.0A682F17.677D33B0.00C5,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A175160B22;
	Tue,  7 Jan 2025 15:01:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736258476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5dWVUsjgYCfyghVbl/aVOvjNHhBfWKNBo9KEyUYVOsQ=;
	b=KO5rrJF5ND2e3Vm/STvtn6q9zoYW4P/7BzrdeT/Qd+0L1Q7ZXHYujXmtek1qVz4PjQ7N2x
	/f+vlBucbloVM0GZAEuwtkTwjDsQv9qHUGt6JzCDbgFM9ucWDSlZkmogPX0UpduXDq+mzX
	8/iG9NMYTRYGIEG2H1qxnsTJln23WfBa7NSzAV+hmR4GhEtSeIkqY4owP3lBcMysCND+i6
	cqnLhGpoWha0UitJUOs5XR5omKAYClplKo3EOP0voavmW1YP35lurZG8zC3PPbaXVlxKtb
	NjFSu7zqDt8nnzc5PDLnMwyY26Ei/z7QqTgKLmpUaASNoByk/8L71O5icKhYLw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/5] TQMa8Xx update
Date: Tue,  7 Jan 2025 15:01:05 +0100
Message-Id: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_060123_305723_4524E478 
X-CRM114-Status: UNSURE (   8.97  )
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

this small series updates the TQMa8Xx support:
* Add vcc-supply for spi-nor
* Enable JPEG decoder/encoder
* Remove obsolete TODO
* Add PCIe support on Mini-PCIe slot

The first patch is not necessary for PCIe support, but fixes the warning
> imx6q-pcie 5f010000.pcie: Invalid eDMA IRQs found

Best regards,
Alexander

Alexander Stein (5):
  arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
  arm64: dts: tqma8xx: Add vcc-supply for spi-nor
  arm64: dts: tqma8xx: enable jpeg encode and decode
  arm64: dts: tqma8xx: Remove GPU TODO
  arm64: dts: mba8xx: Add PCIe support

 .../boot/dts/freescale/imx8-ss-hsio.dtsi      |  5 +--
 arch/arm64/boot/dts/freescale/mba8xx.dtsi     | 32 ++++++++++++++++---
 arch/arm64/boot/dts/freescale/tqma8xx.dtsi    | 12 +++++--
 3 files changed, 40 insertions(+), 9 deletions(-)

-- 
2.34.1


