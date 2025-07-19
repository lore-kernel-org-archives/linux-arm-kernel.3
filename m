Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA89C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 12:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZJyrU5X4NRgdYqlDXAEcz07vaRJ4+u2m/0WJjpX3hw=; b=ZKdCPJeEtLTGykGQaQhK4lv7Bt
	SkBz63z3LzQIvv1JB2XWbzkcRcZIEt0L4iGWKTjzm54q8p+4nvjCN52tHHrQyK1ogsl0NIJ2VNYyr
	csJhQoyOz6v2yMnYBDblI4rzTfsUZ4QVXtfqnYp8HvCdBiLwtS7TaG+eZbp18h3MQ+/UsOgmSbioa
	YKoi2Q6PqKkm+NVKPDlzeopUw9XhhdFIa14VX8VqYrxjOKa68liPXNgeMk5zMsf/hmqNXfptBMx/E
	xIZKbyQ0voUBQ+xqt2hnuCEna5/8hINOkpI1WQ8+L/HNkPBgkbFyP3nNQSdwMoYWCHKY7KpIFIeOS
	/P98A7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud74j-0000000EGGa-0lTV;
	Sat, 19 Jul 2025 12:54:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud6zs-0000000EFyJ-2KFF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 12:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00EEE600BB;
	Sat, 19 Jul 2025 12:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75471C4CEE7;
	Sat, 19 Jul 2025 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752929339;
	bh=5SM3JjfwPbAzhO4EKz+cDoOsvzGPzduC3NBRmt8QUZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T2TIAbnc9yVX5tqWvu1WyvfhEBGfcitOaJBAgRSppOkNESHgPzUwuhAArFTG9UqHM
	 Mu6fDoXbtqyepEITcgChTu68lB5qs2fXx7pc9tn0/8pIEg6VjMrpO9aE+WtQZ8vgNB
	 aq6ZHW1I5UWt7p2pcTVWbpNHVW+QIebPZJ54B8mJmfJtHzikoh/3+T9jE8GmAO2N1J
	 eL+ecZb6vHpA4ZE/o3/4SVONdt7+eN8DTpuS0x4bsV+cQOgoTEgSphWGpLZo8x6TLS
	 IRk53G+3q7lRdGjPWBhmKRiyifryP46VzOZMAoRGL4LRLBcthsiuYttacgE0Nat6YK
	 b4e1mHn8o1Ocg==
From: Sven Peter <sven@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/2] Extend nvmem patternProperties and then fix W=1 warnings in Apple dts
Date: Sat, 19 Jul 2025 14:48:39 +0200
Message-Id: <175292930369.11148.3364795405585687646.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
References: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 10 Jun 2025 17:17:33 +0000, Sven Peter wrote:
> This brief series fixes a W=1 warning recently introduced with the Apple
> Silicon PMIC NVMEM nodes. We have cells that are the same bytes but a
> different bit offset and these currently result in the same node name.
> The legcy layout already allows to specify the bit offset in the name as
> a suffix but this isn't possible in the new fixed-layout.
> Thus first adjust the fixed-layout cell patternProperties to the same pattern
> as the legacy one and then fix the node names in our device tree files.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/for-next), thanks!

[2/2] arm64: dts: apple: Add bit offset to PMIC NVMEM node names
      https://github.com/AsahiLinux/linux/commit/a622259af9eb

Best regards,
-- 
Sven Peter <sven@kernel.org>


