Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162C8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 16:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOW2A9X67pJiFypuasGaNCH5S7wfwdO9WUzAegDlmvc=; b=S/F3InXRzrLlRe3Obe8+QU2psH
	wmqPA6pCfPbLVTLmyyZtkfoU5DhKf0d+DMMDHak52yDNFzf3Im9JUl273lJdaOqZ1e9uSLXTBbAe1
	LBLNFRt7X2pJwfHTJmMAb30oY9bn3LPFDqdbO+PV+8S6U/9u09iInXYleahst115AXgH/KLMD4zmt
	8k2esQM1F5WmGrTdzG+JmC+nQgffPtJwfqZqfOgScO3sJV1xmuBj8bWDaOpS09qs9VZ1+rhEDkfPK
	TMJQsY3D1gT7si7J1Rt34wPoDd9/07Zmxf0knOueBYtb2Ex+36sJa0SBmxZp+nUyxVL6s8SgDW23s
	27eTTPZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdW0P-0000000Cdn7-3zjG;
	Sat, 27 Jun 2026 16:35:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdW0P-0000000Cdn1-08cM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 16:35:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D5B143DB8;
	Sat, 27 Jun 2026 16:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CEB1F00A3E;
	Sat, 27 Jun 2026 16:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782578144;
	bh=SOW2A9X67pJiFypuasGaNCH5S7wfwdO9WUzAegDlmvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YJ0CwFGrY75wg3xZLjVyVQhxHTkb3fhfKRct0ivNmrNFrYyyQvNf5riwxB6wwH2Ue
	 W72naKrfmuEgZdFDNE9Vk0of5zYsV7BL/Ny6v1oakUHd2hClfVC2V/xG/NTEn0cw5s
	 5bVyvEhZH2vX7y+6mxKeKWS7zPoP+pB4SYDlN0a7NFGXytC2LNEql+4I8bNj7dCg9K
	 DjaQyIe0FDVG66MWQ1yNBBhLlpevkDtXFwjdrBAVtlGj+ciJmKPjzM6wbMoma2PhDp
	 qscKxgBwkE8hRgwC74qfR66X/xsx9gTJNnuvq3YCR/3xRO1WFpnY2YK7J6M60KQ5jT
	 GeGPRbDPGHF0g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: Sasha Levin <sashal@kernel.org>,
	andre.przywara@arm.com,
	linux-kernel@vger.kernel.org,
	cristian.marussi@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	broonie@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yijia Wang <wangyijia.yeah@bytedance.com>
Subject: Re: [PATCH v2 5.15.y] kselftest/arm64: signal: Skip SVE signal test if not enough VLs supported
Date: Sat, 27 Jun 2026 12:35:31 -0400
Message-ID: <stable-reply-item016-arm64-sve-515-20260627162226@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627032259.2086191-1-wangyijia.yeah@bytedance.com>
References: <20260627032259.2086191-1-wangyijia.yeah@bytedance.com>
MIME-Version: 1.0
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

On Sat, 27 Jun 2026 11:22 +0800, Yijia Wang <wangyijia.yeah@bytedance.com> wrote:
> [PATCH v2 5.15.y] kselftest/arm64: signal: Skip SVE signal test if not enough VLs supported

Queued for 5.15.

-- 
Thanks,
Sasha

