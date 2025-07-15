Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337F3C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DopAyANq/WYEvQWfTKkMX++nCpW1mxDbfBw9ivkP0ps=; b=v2EMvSPVlj07AXB/qrS1aWQ42E
	gpglU9TQx2WAEZ1yjX1HN7l8/F2GPv8n4eSnHQihr77tiRMT0t9Z7BzP8Dnw9UIlPHQ98POZwFgyI
	OlSLKDIL+a73cx1Ygrya4PhlBA5WLGl7K7Lgsn9mejA28ceMjqL9TJhMUJ/H+BMqUa9i0r9WYtnCA
	KDD2Ni4S+V+/zzZqZECw1PDEm0wKzrq2fir/SKgeFuMqhim0p32dGZVe9h1HLnIPWpw036IBd0unL
	aBo/AsgK0i2aVSPAWe5bl2KHebF0rWw6EVmDsTJspLmIa9xel5I6AX3XyTIZP4/vxDgut1hVMl885
	n5J35/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBY-000000061Yz-3NYf;
	Tue, 15 Jul 2025 19:19:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubigC-00000005lRp-2ity
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 16:38:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9EC2D5C5BDB;
	Tue, 15 Jul 2025 16:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF71C4CEE3;
	Tue, 15 Jul 2025 16:38:55 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id E6B9C5FD47;
	Wed, 16 Jul 2025 00:38:51 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.or>, iuncuim <iuncuim@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20250711035730.17507-1-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
Subject: Re: (subset) [PATCH v2 0/3] arm64: sunxi: a523: Enable Mali GPU
Message-Id: <175259753193.2390274.13790626107731920728.b4-ty@csie.org>
Date: Wed, 16 Jul 2025 00:38:51 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_093856_734853_7D8B6645 
X-CRM114-Status: UNSURE (   8.50  )
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

On Fri, 11 Jul 2025 11:57:26 +0800, iuncuim wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> This patch adds gpu support on devices with a523 processor.
> 
> $ dmesg | grep panfrost
> [    3.826968] panfrost 1800000.gpu: clock rate = 432000000
> [    3.832305] panfrost 1800000.gpu: bus_clock rate = 200000000
> [    3.838353] panfrost 1800000.gpu: mali-g57 id 0x9091 major 0x0 minor 0x1
>                status 0x0
> [    3.846050] panfrost 1800000.gpu: features: 00000000,000019f7, issues:
>                00000001,80000400
> [    3.854134] panfrost 1800000.gpu: Features: L2:0x07110206 Shader:0x00000000
>                Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [    3.866011] panfrost 1800000.gpu: shader_present=0x1 l2_present=0x1
> [    3.874108] [drm] Initialized panfrost 1.3.0 for 1800000.gpu on minor 0
> 
> [...]

Applied to sunxi/dt-for-6.17 in local tree, thanks!

[2/3] arm64: dts: allwinner: a523: add Mali GPU node
      commit: 3d99e0dc888727a21b45ca64ff7b0cddbd17dd16
[3/3] arm64: dts: allwinner: a523: enable Mali GPU for all boards
      commit: d96d9ac8d2f197f31ea3de931dde1a217950f4ad

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


