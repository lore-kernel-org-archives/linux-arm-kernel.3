Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1E1CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLd0ZSi6AYEzF6Z1S6jhxHqmJ/tVEdxhmTaij18Onuw=; b=H4B5uo05yTs/8hi9unRFq8Gocq
	wED5XEBqrMkY87dA3gzXd4Zt6zmnmFbrGXhKLFzrfVznInLl/iiSFUtmRrCIwm145tYNQE1k+owNT
	OvT/w3KtXzwXX1g1MktKzwuxTUtWqeNSuQA8MKYAfMHPYgDY5+BVII552Jh6KYkHSp9Ezb9hZSbRn
	nLY1AQsVQPcIHugKiqKbSmycVJYLpnjX2TgtwVxZHMCda2nmwgtoOH7lEZbKCAmLw3fJdUuqL3KF8
	nzvhpSLIrEexbERhcy/fctNQA8pQxbDXLsuZIeFz7SQ1y+rV9Kuyzpz7jwkVboMGY29k229dIniOL
	lAMB/gCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE75g-0000000120J-1vPr;
	Tue, 06 Oct 2026 15:28:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE75c-000000011zr-3x22
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 15:28:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B3374E410FB;
	Tue,  6 Oct 2026 15:28:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1708E60553;
	Tue,  6 Oct 2026 15:28:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A148B103303AB;
	Tue,  6 Oct 2026 17:28:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791300495; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BLd0ZSi6AYEzF6Z1S6jhxHqmJ/tVEdxhmTaij18Onuw=;
	b=Zge95CWJorrmzM4yUowmuOkxRgpEyfxGYa2/sfKipV7dd+RjsKMy/oaGCJ/mVs5Pzo0eEF
	QAvqalpkxByxwJKXE5vyKH5kFSUwYu2xwYqM4H22Gg37EqMoVQPaCoVQg1pwSTO1lx6V/3
	Vlba435uh1H4ftEgJSuP+lH4zK400PqocG4hEyzBxYsnoXtQg5EHCs8c/6zB6t0Ce/IzsS
	zc24HAe/gkebKe8qWRsgGTXAIxZzqeo6jh5cRaaxVEC8RvbhI9cXK0HSSF2/J6ZyylYtTw
	sQGayXcUHQwmPGI2afJ4QcT9d7FjSH/TXieM2eordIciOwm0Sdwh2ldqsJ84dg==
Message-ID: <72e19e46-3a14-4a07-9b50-01e5480bf1a3@bootlin.com>
Date: Tue, 6 Oct 2026 17:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini <fustini@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
 <asQcQIh56MV1OJur@lore-desk>
 <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
 <asSb3RNcityVg6ia@lore-desk>
 <CAEev2e8c6hZQQom6NV-URgdSoWiafCcRR3BtA6yxxqy7T-me8g@mail.gmail.com>
 <asUGoxyJWVcsYBWG@lore-desk>
 <CAEev2e_+Dcj60Rj2+_UD=3_kNQxLK4rmWTGK-dr-Ve9mGJBARg@mail.gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <CAEev2e_+Dcj60Rj2+_UD=3_kNQxLK4rmWTGK-dr-Ve9mGJBARg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_082825_127668_87D1A760 
X-CRM114-Status: UNSURE (   4.91  )
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

On 10/6/26 17:12, Anirudh Srinivasan wrote:

> Maybe someone more familiar with this board/has used PTP on it before
> can help out understanding why this is happening. Maybe this is some
> issue to do with clocks.

Good point, can you give us the full dmesg log of the board booting ?

Maxime


