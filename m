Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55DFCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mARY3xOYQh4uKhHgWSMpXzOKQHEe30Fmz/3A8KJzfvc=; b=FFIQD0l69oB1E+Cm6kUJ6yNPKE
	nAIrSU2tZR6h1bxwGGva8BfM/Kztl7LseU2R84KhKmyqSwOpszbCetsfdGtCE08VG/Bj84YsaUXgq
	tFciBr/w/yTImtp2ld2tG1cJdP5b6FILwBSmPkpdGp2vChXd3VNEv/OcBD/KvEf2qgZqfudwnvnIr
	gKWnd5JqvYuyuA1fykbHt2E/FuQLdWghKclwdMLIrgi3sGE+amEmk9UnbD/EYF0jhKEviGfMJBJ0H
	2l2o2X1QEWilYlUTCXD1KnzzjRoZFSEw77Si0CWkwPZUlaZCDs/s2UA0KRiSxuJgU6s02PAsPyoUq
	KrGOJC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14Ac-0000000DqI4-34gA;
	Tue, 23 Sep 2025 14:39:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14Ab-0000000DqGp-2ALf;
	Tue, 23 Sep 2025 14:39:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E404F60052;
	Tue, 23 Sep 2025 14:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B57EC113CF;
	Tue, 23 Sep 2025 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758638344;
	bh=7y7/yuACkZLW79g5K5sIcU1j82Ksu2UcLf91irlmAcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANjomnT7tvAlSvx7jeHkZqzpLc2fb96iYwhxRZrRaCXSqjMjrkqllXf6P0ALKVP0y
	 s3nI2y2MQxTpYk9losq0G3Q33MJWvh5B0X+KRd15ayCOGw7tSLWqycG7rpRmiscHYX
	 QeM2U4ZvQ00/Atfe6dDO8CRnKqR57PwxmPEmDfdrX6VAQ3dFDl6CpmKGZVf3+4nu6F
	 SHU/jZjtyWZrtTpXbmECEy7ut43ONk0H6gbinCYk4DvAIeTuqKZBRgRYXNP+lKDiXW
	 qmBk652g99F7+dxUQaGQfWmNpJA7bUnqgJtqSukaC24NAlPfYv9fwAoLjwl/MnpwOi
	 nbQ5VWDe9aXpg==
Date: Tue, 23 Sep 2025 09:39:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Simona Vetter <simona@ffwll.ch>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chia-I Wu <olvaffe@gmail.com>, Steven Price <steven.price@arm.com>,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, Kees Cook <kees@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	David Airlie <airlied@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-pm@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4 4/8] dt-bindings: mailbox: Add MT8196 GPUEB Mailbox
Message-ID: <175863834028.3197589.1266826496329321064.robh@kernel.org>
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
 <20250923-mt8196-gpufreq-v4-4-6cd63ade73d6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-mt8196-gpufreq-v4-4-6cd63ade73d6@collabora.com>
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


On Tue, 23 Sep 2025 13:39:57 +0200, Nicolas Frattaroli wrote:
> The MediaTek MT8196 SoC includes an embedded MCU referred to as "GPUEB",
> acting as glue logic to control power and frequency of the Mali GPU.
> This MCU runs special-purpose firmware for this use, and the main
> application processor communicates with it through a mailbox.
> 
> Add a binding that describes this mailbox.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../mailbox/mediatek,mt8196-gpueb-mbox.yaml        | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


