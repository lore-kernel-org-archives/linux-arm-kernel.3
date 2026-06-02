Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433FBC5DF71
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/vF6niAxj8StveMYwYJHQgVKFlI6Za8BIoyv7YEfBo=; b=bJYa5CSm4t+wrc22+jZLkQ8NnC
	THkMto7FRjDckw8n/eECAJVEgPipBGDm8m6lhqdmNS8/o0jMx821TIpOP/kiHWdoVPYrIKsRmjiZd
	YVaaOtYRZ4xU/P75H9nNESxXKnsAfvrCnpO3Uk/QdCIYBzpmMfEUNtLGDEPCxqKGNAFp/so6yl5at
	ffK7gDNO09h3RoZYSfobkP542fUMFE7C9Psrp6DOgfG4aAujY8238VXGDZ0ps/2UOU46YNEoYZ3kO
	Fv+ANr0aCZ9fWrTURon4id1YAsUw/qrzyZHbnzG0oQoSxiSbchcAUhvQhH4/0KV/gmdoRjdXdWIvG
	aWY5IgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKk9-0000000Catc-177G;
	Tue, 02 Jun 2026 08:45:01 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUKk6-0000000Casx-34IU;
	Tue, 02 Jun 2026 08:45:00 +0000
Received: from 8bytes.org (p200300f6af4fc500cd665649150e3ae5.dip0.t-ipconnect.de [IPv6:2003:f6:af4f:c500:cd66:5649:150e:3ae5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E1F941C6983;
	Tue,  2 Jun 2026 10:44:53 +0200 (CEST)
Date: Tue, 2 Jun 2026 10:44:52 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Simon Xue <xxm@rock-chips.com>, 
	kernel@pengutronix.de
Subject: Re: [PATCH v2] iommu/rockchip: disable fetch dte time limit
Message-ID: <ah6X68serZREQxJn@8bytes.org>
References: <20260428-spu-iommudtefix-v2-1-f592f579e508@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260428-spu-iommudtefix-v2-1-f592f579e508@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_014458_955102_85B672CE 
X-CRM114-Status: UNSURE (   7.08  )
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

On Tue, Apr 28, 2026 at 06:05:31PM +0200, Sven Püschel wrote:
>  drivers/iommu/rockchip-iommu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied, thanks.

