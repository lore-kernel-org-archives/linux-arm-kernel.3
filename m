Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A8D606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 06:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=foLI7jAc;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W5XQ1MrM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G7dBpgXDg8IWtuGJ7pMO6Cw0uUaelzS3qcqMb/c3wUQ=; b=foLI7jAc3H5Ybe
	7yAfnn3kKPJtUuIseNtlc1ipJpooEWsxOvVm2JpWCSUcLsYr+rLi5A+RHdWmBpku/M0jv+j3MFTo9
	XzYGN4qd2g5ni+10n/LDpLy8f/eilFxU9ewJ5a4Y8bXEmEgGIYYH0uttLzFxHHW6irVytI69PgwbF
	ruqmjUsJrN47Fg9j6sFslu2SR67qnnp3aQrzesD9kDtUpV1GCgus5IfkGq/082OLrg3j+/nLndT8A
	qXwXaQ+plzE8THB6u+F24l25uvwek4Ptfpn0C5dJ9jOM1a2h/JmDzzc6U/PeFjHT7TC++LeEBVYnv
	SCJdaba1CvoDyPzKquqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7fG-00000001BHx-2VDA;
	Tue, 03 Nov 2026 06:06:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO7fE-00000001BHl-45fa;
	Tue, 03 Nov 2026 06:06:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21656600CB;
	Tue,  3 Nov 2026 06:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698671F000C1;
	Tue,  3 Nov 2026 06:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793685991;
	bh=G7dBpgXDg8IWtuGJ7pMO6Cw0uUaelzS3qcqMb/c3wUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W5XQ1MrMLmf/v9KDbp37KF4erp9rYyVMWYf4qhsjtOmpcggSNBb4TC1ry8S93ONc6
	 QN5zfcnA+fuC0KBHoUzOHZmOJLJu6RIrVX8iUsRocBOk5M3S5sxHGVfBSosyEWfQFh
	 UvsowjKfA2nw1BqS1H0kOzAuPOfzTLALDfzUbRCtvcdAECvvXs8hHT/kXO8/fc9sSC
	 b+yIi2F0CxqCvvuoENG9bhq1pb5jArRQvp7xR2njthtd6ZheQ1OU1Og5BO+/D05fgX
	 dTAWOlCa7QmqwdQ3/yDnQ5D0+wHhcfhXUHE5x7SRab+cv3dRT3mHZJNLMTgU9emTGY
	 MFxiv3lKDdh+g==
From: Sven Peter <sven@kernel.org>
To: Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	linux-nvme@lists.infradead.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	Michael Reeves <michael.reeves077@gmail.com>
Subject: Re: (subset) [PATCH 0/7] NVMe support for Apple M3, M3 Pro and M3 Max/Ultra devices
Date: Tue,  3 Nov 2026 07:06:24 +0100
Message-ID: <179368585837.109404.1193998615991501898.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925-apple-m3-nvme-v1-0-5e832e2f4aa9@jannau.net>
References: <20260925-apple-m3-nvme-v1-0-5e832e2f4aa9@jannau.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 25 Sep 2026 10:22:47 +0200, Janne Grunau wrote:
> Hej,
> 
> this series adds NVMe support to all M3, M3 Pro and M3 Max/Ultra
> devices. The hardware works the same way as T602x (M2 Pro/Max/Ultra). If
> there were changes they don't affect the way the existing Linux drivers
> use the hardware. So this series adds new per-SoC compatible strings to
> the mailbox, SART (IOMMU) and ANS (NVMe host controller) bindings and
> the device nodes.
> 
> [...]

Applied to local tree (apple-soc/dt-7.5), thanks!

[2/7] dt-bindings: mailbox: Add Apple M3 compatibles
      https://github.com/AsahiLinux/linux/commit/b96264bcbdd2
[3/7] dt-bindings: iommu: apple,sart: Add Apple M3 compatibles
      https://github.com/AsahiLinux/linux/commit/300a52ab04e4
[4/7] dt-bindings: nvme: apple,nvme-ans: Add Apple M3 compatibles
      https://github.com/AsahiLinux/linux/commit/5874c917ad89
[5/7] arm64: dts: apple: t6030: Add NVMe device nodes
      https://github.com/AsahiLinux/linux/commit/b876489f1f3a
[6/7] arm64: dts: apple: t6031: Add NVMe device nodes
      https://github.com/AsahiLinux/linux/commit/ff00db14d0f5
[7/7] arm64: dts: apple: t8122: Add NVMe device nodes
      https://github.com/AsahiLinux/linux/commit/acb925da4987

Best regards,
-- 
Sven Peter <sven@kernel.org>


