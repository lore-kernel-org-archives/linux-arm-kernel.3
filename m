Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586D5E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 22:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iWljdfDg3g+D5iIiXDqxOZ4rem1A8lN0WdaL+z0dg4=; b=3VhndK5RyiCRVpp+N+TWVCaela
	Nj2O7ob0fgfcLkR/sAUSN57s7tyG/uoJ5NXE7DhH9AENfa5toAqOIkeDzCl39mCQWMbYHOc/dG+fZ
	O3BkynCoQ/a/bq+rImWZLnWzJTSVTNL2SG5psGq48jl4fhCgE1AbKsc1v9Eop7nwR5KE1XoO1cLIs
	dhpRfBLt6lOv/NLak7D6ykL+JPnt2CX+SszIWKaKUlogDHOJJ8D6/ZxVipwHNjTPAFCTR7u90WyMk
	TTqlNcVKrw8AgC0/ssuFs/UPPouePHXVhaayVa4EvcWnVgY7FLbCTbBBsSwSvmnSu2L/Hn+rExXm1
	pEgfQfSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQaGP-0000000EQkQ-37Yw;
	Wed, 25 Dec 2024 22:54:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQaFD-0000000EQUo-1dXs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 22:52:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 193EDA40460;
	Wed, 25 Dec 2024 22:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF40C4CECD;
	Wed, 25 Dec 2024 22:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735167165;
	bh=nubzzPhGve0/s0biOhKXPj+keSPBoyokkW6/wjH4feA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVfuuWlzerb6qv9akpsWm9tlGYrcY4D4blMrqIibhULjbB7gyCjmeGiYGc7hwlZB6
	 bGX8QdaRR5fEQUA1LiANzegLxR6jUPlrvXNSyUtGRXe/lbJtccUGGQkJWrsZXBoKI+
	 fBJu4A+TlGhV3CiTlZYh0qSSqOFTm5bt31LIOB0FbiAFLKtjMdeoVQ/0Wq9piry2jA
	 ldLlfWW8jVxoKs3VbqkVAEbo+7wnUQCKJbTIa763vPV/hfc7aEtR/bs+f0tlKVohJ2
	 aedGgXgmlGPGb0G2dRBTBgnUWdMboY+5YkLun6mtLgQglauqf+IHtLpit5XgoQXh8h
	 4DGj2Ekvl7jPA==
Date: Wed, 25 Dec 2024 23:52:39 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3] i2c: imx: switch different pinctrl state in different
 system power status
Message-ID: <inrb2afgefwxc2n4dqooj7cixkpr7vm3ub2osj7qotgt6brx5d@fifvmmp5mkay>
References: <20241223034343.544002-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223034343.544002-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_145247_511260_A613E410 
X-CRM114-Status: UNSURE (   6.71  )
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

Hi Carlos,

On Mon, Dec 23, 2024 at 11:43:43AM +0800, Carlos Song wrote:
> Switch different pinctrl state in different system power status.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

