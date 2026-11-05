Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D89606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pAQDRUZV;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MqS68onA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F9GcNTDieh7QxkZrb/eoI09mZxtvLJXvzF3NFjQWsTM=; b=pAQDRUZVfTgFkI
	DVu28sxEU12tJ3Ku7r81IxV6CV3bpkkkOlAPzsNeU4lxi83A8AqR3P9N21FjpCHyc/q/1nmVc/VgC
	9u1RFEvWxRL47mMj5u2/+V6MDriY0JhLUBpxRIfMCeUQ5B6zNKHvogcRiyDy2a3ygpxs9eOnhdjAA
	mNVOtvCcToJfjtuLbj7px/A2vdLi8wBYE1yKJipTU+xo1Xxm6YFeO12ku3e+cyN8PsILE1PBcTqF/
	rvQMfGWneR/cvDlPN9ie3+SgS4fI/B69ZY//4GYYlSKsDpz0GTW6FTZthGGopVxjSH4Z4uGqihB3b
	xS9QkZ5FFMNrEkx6CNEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP09C-00000009Z3S-0sjh;
	Thu, 05 Nov 2026 16:17:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP099-00000009Z31-3uLr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 16:17:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F10AA601DE;
	Thu,  5 Nov 2026 16:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AE51F00A02;
	Thu,  5 Nov 2026 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793895422;
	bh=F9GcNTDieh7QxkZrb/eoI09mZxtvLJXvzF3NFjQWsTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MqS68onAEUCKLcBvYVt5QBRjA/8e9X/XYU5cabedf1Ungg9ErA00cRtuvD/IRALK9
	 8Fan7/i7wd/knDNt7dPpATW0Bb2YI1oU6LpxhUUoLA6RiQeNLYQMxLkBknljJxuim0
	 HIXYdD6JNDj2c2fNmhWQIcPTJp8NIahTrGDaTdDCwpTUbCuL9Bcn3+5i9yklBAmCbf
	 mTJpCmFnfO55/mbfaa61I9EKQxYYYCcmPs1Bv+rC5TSqwweLeLfim4mQMn+PqI03Hs
	 PQtX+ba7+F6pL/ISGWfnXxhlF5vKlZD6QKmjykd0+fz+kowAUNFMiRHuxnKWhjMEhn
	 GZYmLwTg2XIcQ==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sven Peter <sven@kernel.org>
Cc: Joshua Peisach <jpeisach@ubuntu.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/3] Apple SoC CIO (USB4/Thunderbolt) reset controller
Date: Thu,  5 Nov 2026 17:16:47 +0100
Message-ID: <179389539199.15122.3605196731930502187.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
References: <20261003-b4-cio-reset-v3-0-e605f9e5c8a4@kernel.org>
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
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, 03 Oct 2026 22:50:59 +0200, Sven Peter wrote:
> The CIO blocks used for USB4/Thunderbolt on Apple Silicon SoCs have a
> reset inside the power manager that has to be deasserted before their
> co-processor can be booted. On t8103 and t8112 each port comes with a
> dedicated register page while t600x and t602x use a single register
> with one request bit per port shared by all ports of a die in the
> middle of the PMGR MMIO region.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.5), thanks!

[3/3] arm64: dts: apple: Add CIO reset controllers
      https://github.com/AsahiLinux/linux/commit/9055977102a4

Best regards,
-- 
Sven Peter <sven@kernel.org>


