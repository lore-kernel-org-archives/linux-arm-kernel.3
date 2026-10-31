Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689A7606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rwkqBuPb;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RSIuD74i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OEX1w6NcDUbMHOGr/tpCTmQO5YjPoq7wqyclJKvBe3Q=; b=rwkqBuPbaCXl4U
	0zHiJSSCTi2pCYki7rH2WKQ+x4qrZvuRqie5zdRuFUfYrC85vpsk5jlyCJL/KLHXY1i1KCOhfI1JG
	DRiB2JYryxpfRxXE4HY4euYUJerU93MCbbOt2sauXMUwBHPoxBejFM4xAX5bKo+0iOPZUinGhwWFm
	hFwusu4GEBa75GtMRLSyEfLyixXDZ94BD4LfJOe+n9gA4SnFLM29yXwwZptzyZlOW1EOOQtFgVKW9
	Ry3PT72kEuH+U+JJ+N5rz2xiJMhIlwbnAkn/NupoWw8/dz4au1+RSk58iPl+DOv6I8PVuLMwdMzBJ
	qwcQK5GtgBr/qBprTQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNAI3-0000000DPNP-1lCO;
	Sat, 31 Oct 2026 14:42:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNAI1-0000000DPNA-1x3j
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 14:42:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A2F160202;
	Sat, 31 Oct 2026 14:42:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7493F1F0093A;
	Sat, 31 Oct 2026 14:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793457756;
	bh=OEX1w6NcDUbMHOGr/tpCTmQO5YjPoq7wqyclJKvBe3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RSIuD74iMbJdg+zRyPl3toTOEJPWVCBT+HvQ/GmDkFnZlwVrGWwN6U9vmvmDV2nQ5
	 w0f44m0cyOe3aceGiZw+tocv8BmkAdxVc7Z1e6jLt2AYL5fcgUTr+4N13RB1y2q2wL
	 vFgVkv8KFLaL+Jn+XSKNT1iRI0jAMZy90i+cwYiJHXv+Q2hYz9ijCUe2VnOwKINJqV
	 f/n89qkEdR9bZCe2NqfbSGRSlRsDUkmX/W4vGybTfmQUlE1SBvwuA9GkOK2BO4SXlP
	 QdkdoyQ6n/GDIAjJ8nBoquy/28aHRgcW6M4lSb+UCxanDKfAf4mvG5RPZanJHWWWGD
	 XE1/11r7i8ASA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: stable@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261030152405.281376-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030152405.281376-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] memory: atmel-ebi: Disable SMC clock on probe
 failure
Message-Id: <179345775319.31057.10245295412977375850.b4-ty@b4>
Date: Sat, 31 Oct 2026 15:42:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Fri, 30 Oct 2026 16:24:06 +0100, Krzysztof Kozlowski wrote:
> Unprepare and drop the SMC clock reference, if probe fails to avoid
> resource leakage e.g. during probe deferral.
> 
> There is no remove() callback, presumably on purpose so only error paths
> are handled.
> 
> 
> [...]

Applied, thanks!

[1/1] memory: atmel-ebi: Disable SMC clock on probe failure
      https://git.kernel.org/krzk/linux-mem-ctrl/c/3bbb9a75ec35e77907b990ae163b596e8e67fb46

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


