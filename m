Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D56C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bqpGTNMd8TqcbYCtsvpSlgp4CVclXOhzVAiMwS/Zs8w=; b=DYxsoNRa8dnF1NfCgeXFnmOz+J
	vplNnUc4O+gWIw63ueG2KcRG+dYm9Bd2VWb6PZbfqlsqQPJcj2YZoGLtEs+mI3gRUNraR7SkfCAjW
	eW9rj8Jgoin1wH2tdbHz+UK0wGiaZWQAAb6jJC3UwTm91Vd/G5YliihDAzOTRbDFQp7rz8v0T+gHU
	Pk/30vhZQivNUhsjyW0iv9phBjiuB+sCwbme3NLiWSArfU/zGv2AKTbRU3PcPpx++25ctRhU/Q+gW
	GfSRMS54MS3gr/TFbVMgZdYA7zUg3fIyh0qX51zt1ZBDzUjY2Xi07M1CtngS96UblgYYKOKXtw7/C
	zjfV+2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oDC-0000000FJV0-3tbt;
	Wed, 02 Sep 2026 16:53:22 +0000
Received: from out-245.mta0.migadu.com ([2001:41d0:1004:224b::f5] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oD8-0000000FJTo-476C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 16:53:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=iHvZqKrXE7zNfYJuUPYEjllsfLjqNrNtwxd1pFBCEOI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788367995; v=1; x=1788972795;
 b=U1GrSfFBnHdhZ158PJrFBB13z+t//fAG3f9LpCksZwrzOxvjBQHdGG1AgLVzkUAAxxM30GQM
 scWVWwa9L0yooRBLO6FO2azA9U63OBGaXrof38+fHJSjamE+T+rhCTflanUHjq3Vt6c9VMjxDMb
 KF/orzS+kcN3ZFIgy0a5SguU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 9188a3c33d52887f;
	Wed, 02 Sep 2026 16:53:15 +0000
X-Mizu-Trace-ID: 9188a3c33d52887f
X-Migadu-Flow: FLOW_OUT
Date: Wed, 2 Sep 2026 18:53:13 +0200
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Pramod Gurav <pramod.gurav@smartplayin.com>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel-tdes - zero-initialize device state
Message-ID: <aphUecsl_R3Jc6og@linux.dev>
References: <20260829035821.67220-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829035821.67220-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_095319_220212_C81702EC 
X-CRM114-Status: GOOD (  15.78  )
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

On Sat, Aug 29, 2026 at 05:58:21AM +0200, Karl Mehltretter wrote:
> Commit c659d07f11a3 ("crypto: atmel-tdes - Switch to managed version of
> kzalloc") accidentally replaced kzalloc() with devm_kmalloc(), so the
> device state is no longer zeroed.
> 
> atmel_tdes_hw_init() tests dd->flags during probe: a stale TDES_FLAGS_INIT
> skips the hardware reset, and a stale TDES_FLAGS_BUSY makes
> atmel_tdes_handle_queue() treat the engine as permanently busy, leaving
> every request queued and never dispatched.
> 
> Seen on a SAM9X75 Curiosity: the first TDES request after boot never
> completes and the TDES interrupt count stays at zero, while the AES and
> SHA engines on the same SoC work normally.
> 
> Switch to devm_kzalloc(), matching the Atmel AES and SHA drivers.
> 
> Fixes: c659d07f11a3 ("crypto: atmel-tdes - Switch to managed version of kzalloc")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/crypto/atmel-tdes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

LGTM, thanks.

Reviewed-by: Thorsten Blum <blum@kernel.org>

