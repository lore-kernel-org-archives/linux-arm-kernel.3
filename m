Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E071061B22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LxOtrocUMtC7SyG6AlCBBZ09vR2cpqAEYyB5tQHvoU=; b=DxyjQ1oklZcLtl56L4QlpeJkB7
	bB8MCqiBsGbYDJA6kgwyJ1CeJyVHa8GPh59SaEsL9Wwf5QzkfBsNOenQVwvSPTCXjpfj0Z804Q/0T
	puoY08FQPF+SH7SSe68AaZCLdnKxdDl9XG/MzTn6QgYZDnQ6TKj0bJSRsR9MuI5uldMq9ZsRKa5x3
	zz+Hrk+VSjOKILbJi9EXQig5F4nzHad2TAZNQfbKaUddakOxvYknoVOHSj5aReUHSR34Xov35rVI2
	0kKlnYdNKB7sjeyPILLrLrwiQz0c19GaoEz2Fch32CoVMab+p8i0iMZsEVcyi7jSrifEX9CzVooQ0
	ErdLjT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KYy-0000000Bw4H-1MA6;
	Mon, 30 Mar 2026 21:54:24 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KYv-0000000Bw3G-267H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:54:22 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 9B841C0000E6;
	Mon, 30 Mar 2026 14:54:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 9B841C0000E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1774907655;
	bh=/uadks1dsiOsNhUK+urucMaI/bkV4H7sZ48l6oMKc24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FKSr9zDaK9FRy3aqIAj6UX0dejFyR6c0HdTAputIMBS80N2YRsaDZMV/aNos61nuX
	 Sixs1IWS60Sr8YnCYVCCTfUkU5a7NN1KRW6NJgYuVLpalsddnC9L4SSQcXkK8jWrrS
	 hhcYTIECer2ZBjocXsiQpS4aT8WYDvaOMIfHokYU=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 7AC07B6B;
	Mon, 30 Mar 2026 14:54:15 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	justin.chen@broadcom.com,
	linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	kees@kernel.org,
	florian.fainelli@broadcom.com
Subject: Re: [PATCH] soc: brcmstb: consolidate initcall functions
Date: Mon, 30 Mar 2026 14:54:15 -0700
Message-ID: <20260330215415.2497080-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325174619.3761964-1-justin.chen@broadcom.com>
References: <20260325174619.3761964-1-justin.chen@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_145421_716467_FC10CC5B 
X-CRM114-Status: GOOD (  10.51  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Wed, 25 Mar 2026 10:46:19 -0700, justin.chen@broadcom.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> Merge the separate early_initcall and arch_initcall functions into a
> single early_initcall. This is possible thanks to commit 6e12db376b60
> ("base: soc: Allow early registration of a single SoC device"), which
> allows soc_device_register() to be called during early_initcall by
> deferring the actual registration until the soc_bus is ready.
> 
> Replace static family_id/product_id variables with a dynamically
> allocated brcmstb_soc_info structure.
> 
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

