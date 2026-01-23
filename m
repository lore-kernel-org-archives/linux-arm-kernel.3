Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB63D6CFBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 05:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9Yo3/ql7MbFKqpUVZCOelnBMGGWc4CKq7+A5r+Gd3Q=; b=OGYKCcfxhPiv1cwbNB0gwKA4Fo
	owmodbPW5kr/VRRbb9Jk1et12ztKaO4zwJ+JvJB/sCZuPlLHYC8h3zEdkcdgnL6IdJfYPQbRn9rCx
	I9DNyC4kk06vubweaY6YV8MVxLRZmKMbgsWYc9Y3RiLK0MNyVJuw02fNyeMTskvnzfYSvZ1nDw4/o
	P9XHamgfcvXzg+c7PWxP+UOxhWlTJD6u9oAeVU9s3ktlUnbo7zjPZgpYlFVxcSGfr4y6T/94VHuBm
	3t4yBTQlBvff5kIqaGKST6ZdxfVYykUQTjBwNpbbZw4Qc7Tj4he1Qy5DK80R1qcL5LZMBnyBNcKFb
	bsv09+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjA7v-00000008FGt-1neO;
	Fri, 23 Jan 2026 05:54:35 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjA7s-00000008FGV-3iAj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 05:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=s9Yo3/ql7MbFKqpUVZCOelnBMGGWc4CKq7+A5r+Gd3Q=; 
	b=LZqoBSxjmLw6HD6QWrPdaqNVmk1MJXohNAYRDQEjzYEYO3iqK2rPZzxdPGqrS+7ZeyhablJWXR2
	nOPCScPAXIihazyabNAbilexhMWCRulqrFmfRNKKfftG+KwvSOjxEjDxVX6nJDj9gK86NtOmm99K5
	aHzgbJu2RIgwVZUAW34CwZEofmvrGatQESIguvfdR+bepcGtUVmiFeUQ/wLtjxa/q7PICp1gdqcjZ
	5glNeCuEPJ8vapDXbKshGMY1aAKfgda5yOmPU7MK4mSFrAcZon6TxWBsaLjs77+GWQYXHqSq2Gp4R
	P+fg4si2+aAOr1EEdQ2D57/7U1CoKu/7ayZA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vjA7T-001VLc-2x;
	Fri, 23 Jan 2026 13:54:08 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 23 Jan 2026 13:54:07 +0800
Date: Fri, 23 Jan 2026 13:54:07 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Harsh Jain <h.jain@amd.com>
Cc: davem@davemloft.net, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mounika.botcha@amd.com,
	sarat.chand.savitala@amd.com, michal.simek@amd.com,
	linux-arm-kernel@lists.infradead.org, jay.buddhabhatti@amd.com
Subject: Re: [PATCH v2 00/14] crypto: zynqmp-aes-gcm: Bug fixes and aes-gcm
 support for Versal
Message-ID: <aXMM_zaGqzlNMtL7@gondor.apana.org.au>
References: <20251220155905.346790-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220155905.346790-1-h.jain@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_215432_928753_F456CD63 
X-CRM114-Status: GOOD (  13.92  )
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

On Sat, Dec 20, 2025 at 09:28:51PM +0530, Harsh Jain wrote:
> This series includes bug fixes and adds aes-gcm support for Versal device.
> It is based on cryptodev-2.6 tree.
> 
> Changes in V2:
> - Rebase series to cryptodev-2.6
> - Register H/W keys with gcm(paes) 
> 
> Harsh Jain (14):
>   firmware: zynqmp: Move crypto API's to separate file
>   crypto: zynqmp-aes-gcm: cleanup: Remove union from zynqmp_aead_drv_ctx
>   firmware: zynqmp: Add helper API to self discovery the device
>   dt-bindings: crypto: Mark zynqmp-aes as Deprecated
>   crypto: zynqmp-aes-gcm: Update probe to self discover the device
>   crypto: zynqmp-aes-gcm: Return linux error code instead of firmware
>     error code
>   crypto: zynqmp-aes-gcm: Avoid Encrypt request to fallback for authsize
>     < 16
>   crypto: zynqmp-aes-gcm: Avoid submitting fallback requests to engine
>   crypto: zynqmp-aes-gcm: Register H/W key support with paes
>   crypto: xilinx: Replace zynqmp prefix with xilinx
>   crypto: zynqmp-aes-gcm: Change coherent DMA to streaming DMA API
>   firmware: xilinx: Add firmware API's to support aes-gcm in Versal
>     device
>   crypto: xilinx: cleanup: Remove un-necessary typecast operation
>   crypto: xilinx: Add gcm(aes) support for AMD/Xilinx Versal device
> 
>  .../bindings/crypto/xlnx,zynqmp-aes.yaml      |    2 +
>  .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |    1 +
>  drivers/crypto/xilinx/zynqmp-aes-gcm.c        | 1007 +++++++++++++----
>  drivers/firmware/xilinx/Makefile              |    2 +-
>  drivers/firmware/xilinx/zynqmp-crypto.c       |  239 ++++
>  drivers/firmware/xilinx/zynqmp.c              |   49 -
>  include/linux/firmware/xlnx-zynqmp-crypto.h   |  119 ++
>  include/linux/firmware/xlnx-zynqmp.h          |   14 +-
>  8 files changed, 1155 insertions(+), 278 deletions(-)
>  create mode 100644 drivers/firmware/xilinx/zynqmp-crypto.c
>  create mode 100644 include/linux/firmware/xlnx-zynqmp-crypto.h
> 
> -- 
> 2.49.1

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

