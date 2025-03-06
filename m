Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD820C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7N77zWHP/4CxDIiJFIAtlhGNMG8C5FJY+uFF2kpMaQ=; b=NpR+5cwsiZ3dEDbpIBEDWVYadz
	jwGs+W+sdAYTlQWZBjWVWjbwOBPgKjJKKy3qCKAvKA/fST3eVy0NntMR7oW1FLHA1AHwg1loe222/
	6q4aGe3oRCgyGNUjmVfshpp+38Wu+BP3aP/WA9ubg8OyE2UBz/R3da6OXiL/7QPQHuoCepbIYLsAg
	Nqkg2u+I38TygXBi1qUH18Wiqj5TdTfSIQQD/esx3CBfqMXdV8RfMlifXAqY5pvCfZuks8FfhIdk6
	YP9NUXN3hnD1kFjInxfrg3GSJ3f/+0M0RC+t8oaruFj2o3pcUSdiTYi7rDrp8WExQg4aRF5mqnkBJ
	H84b97+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJqg-0000000COHL-1ekF;
	Thu, 06 Mar 2025 22:37:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJo3-0000000CO0W-3dFm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 22:35:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FF7EA45224;
	Thu,  6 Mar 2025 22:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C275C4CEE0;
	Thu,  6 Mar 2025 22:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741300506;
	bh=9tOUqspPzeq+F0GQa+rMAGCm66NYRjg83C8QJNrxPck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ry/ziY7u8lB46ueKJnolwAQkIdAkcTyrwQcNcUbydYGg1m6WjwI3DxBIMvCPcknzu
	 cpHCUaZaGZ4fQhhUyuskxugOFsO7zd/kwudSNSdyW4CE63k9l4+GoLXvbue0BwmNqh
	 8A6tAC3+Qb7H9bpIBwokqB5EPz8AuqaUyUZazU70Z8WmDJjoT96QuGpfe7hgNYMsES
	 vHpzCZMTwU2tN1yunWbN9EjxnrTPn66c+v+o6h0nF1sskAFmw4WKSpF0XJ+1yZFSf5
	 etRejYq8oUPDLkynYyKYs7lgZP5ah27ScjMF/b6N487rK1y1D3y+T/gxiBTxMF8gTD
	 pgOBUlH12Bfcg==
Date: Thu, 6 Mar 2025 14:35:05 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 net-next 07/13] net: enetc: check if the RSS hfunc is
 toeplitz
Message-ID: <20250306143505.00f034e3@kernel.org>
In-Reply-To: <20250304072201.1332603-8-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
	<20250304072201.1332603-8-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_143507_993887_E0535194 
X-CRM114-Status: UNSURE (   6.33  )
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

On Tue,  4 Mar 2025 15:21:55 +0800 Wei Fang wrote:
> Both ENETC v1 and ENETC v4 only support the toeplitz algorithm for RSS,
> so add a check for RSS hfunc.

Rejecting unsupported configurations is considered a fix,
please send it to net with a Fixes tag.
-- 
pw-bot: cr

