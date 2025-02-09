Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D22C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iBm607sBxcA6KdkZ1ibPdZIisFBHiGLsffWZjG6130=; b=Dus5r39qo361Zz+n6GYQGlGlV+
	ZqDdPkT5PdRm9NDl0AOZuiNajK4XKS22FmxL69trK4+PyiaYMI4tzB6uWu+SpkbJ6dW8avhHzVeXz
	WBKisejgJVG9SP6j+Yc3lGdgPvv1u5mrFobjSePQlPiCs+KUfc4RB9oF3ueugzvMEQbKEPuuj01gD
	PMtblO8iTZYhmPzydmLMhJB3kRX+ky349lr48Y0a4hkHTwz6PWVXzWqRqcXnVru3TxUDlxL0jHi8v
	v3hU3bJtwe25ZLA4BEDIWyWQXx8hGmANXyuLro5l4MLMCuCh5zgZ5KQt+y47CQnsup579dsH4QI/e
	iafuUcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th4Wp-0000000EVH1-2xZo;
	Sun, 09 Feb 2025 10:27:07 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th4VR-0000000EUwC-1p0n
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Feb 2025 10:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1iBm607sBxcA6KdkZ1ibPdZIisFBHiGLsffWZjG6130=; b=O3p3Jg4OPyqL2e3J+baquR0gL/
	JdgazGqX94YfNiEpSOt0/1NJBX1KVhhD1XVSo4CBlkaeQIFwEkTpUXkDkM3xxAWlvHQ3OM7+/IHKt
	WUy+KJ7J4GpRjKOMDGPhREj7t2qZwuoQ1BSxHicAIcd1vkTokZTRJp1sfScV//bCs/DXxDVYofSKx
	uwnVEFPyZC4HQ/JbUc4fGBh+Y9WV6wQu1f/tMl4KLuUji8U4RX6wIajyo1pSEpXs2PaygzqplTn/k
	sWak4NBN3qDcJmtyVMTLVIHBXviJ3BZxyaoC4kyQC18PbL8HwJq/ZlNmDqeRJuyj1+lzxUycfQoQK
	kGdwts7w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1th4IR-00GIsF-0Y;
	Sun, 09 Feb 2025 18:25:36 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 09 Feb 2025 18:25:35 +0800
Date: Sun, 9 Feb 2025 18:25:35 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Martin Kaiser <martin@kaiser.cx>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Kamlesh Gurudasani <kamlesh@ti.com>
Subject: Re: [PATCH v2] hwrng: imx-rngc - add runtime pm
Message-ID: <Z6iCn97oKQuXZd-Y@gondor.apana.org.au>
References: <20250118160701.32624-1-martin@kaiser.cx>
 <20250201183907.82570-1-martin@kaiser.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201183907.82570-1-martin@kaiser.cx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_022541_469539_305E0F7D 
X-CRM114-Status: GOOD (  13.81  )
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

On Sat, Feb 01, 2025 at 07:39:07PM +0100, Martin Kaiser wrote:
> Add runtime power management to the imx-rngc driver. Disable the
> peripheral clock when the rngc is idle.
> 
> The callback functions from struct hwrng wake the rngc up when they're
> called and set it to idle on exit. Helper functions which are invoked
> from the callbacks assume that the rngc is active.
> 
> Device init and probe are done before runtime pm is enabled. The
> peripheral clock will be handled manually during these steps. Do not use
> devres any more to enable/disable the peripheral clock, this conflicts
> with runtime pm.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
> v2:
>  - remove unnecessary err = 0; assignment
> 
>  drivers/char/hw_random/imx-rngc.c | 69 +++++++++++++++++++++++--------
>  1 file changed, 52 insertions(+), 17 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

