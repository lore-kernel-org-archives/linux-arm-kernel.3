Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5E2F8A146
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 09:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkhT0SJSXNUabO8sjsvBTtSy3/Xnqv7M3gz/N6ysxEk=; b=rZvHyfW8xmOsZpe62onC0NL958
	eLCn8sMXAHrSd/1KdAcUtxBX8Duun//rmzN/WZIvAfNRdo6ZvUbODXRB/ItILklb76i0NPgJKc2rr
	aQmUl+I1AkymRKvaRZSOH3cdsqB2k6FCkYkM4jMbk+6+/c7xW1+pJ+X0h59KhCF7r8F6s5antb91w
	yyojK8TPFHX5uuE3Ac+gcRLtw1xgxbDzO/H6MGU7gNNISKNJwFbBAkvghGOi3i9V9+Cay1LHj2H57
	KTbG7OSGpX8G5huK2wo+imZvgfC/PuvyJi83pI6wLAfYTS5rPL6oYqi/88sUiOAe82TIHFn2a98Ba
	EYOjndfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIgX-00000002Die-1EL7;
	Thu, 16 Apr 2026 09:06:53 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIgU-00000002DhK-1f2M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 09:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=OkhT0SJSXNUabO8sjsvBTtSy3/Xnqv7M3gz/N6ysxEk=; 
	b=m8rWVK+PwBbAdMiq6WjvcnjUrVYIDVYXKcOy6mTtCJlAEJtwJkBCJdxz5RIU3kMXpU3ZhfEUcZb
	wn4/cNzbPVSr//Y2ZQrtBGlimJj9XABAoSoXVJQzosGBT4Ngh8R+D8hMqPZjdTboLmXAYrkGiPZXA
	QXK91HiP8IEkJg6THPulcf+ph0ylUPrW0iKa3F2X0Jc63OR7XgppS0SX/MJNpqimYsqkqr6jhULuc
	5A5OQxZZY3HDdl/n1n8Lgkf92BnXyNzZw8Cd2Ssan69gOQX8TdWxDSWreNQfMkIEn0L5R64Dw0BDv
	ZtbD1uAdACjTfvGsLTgAXT1HLotOKDT/eQOg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wDIg7-006VCE-2a;
	Thu, 16 Apr 2026 17:06:28 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 16 Apr 2026 17:06:27 +0800
Date: Thu, 16 Apr 2026 17:06:27 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Cc: linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jeff Barnes <jeffbarnes@linux.microsoft.com>,
	Paul Monson <paul.monson@capgemini.com>
Subject: Re: [PATCH] crypto: tstmgr - guard xxhash tests
Message-ID: <aeCmk6LbLFT4Keo2@gondor.apana.org.au>
References: <20260407192859.270745-1-hamzamahfooz@linux.microsoft.com>
 <adYNClYB6RY820Xl@gondor.apana.org.au>
 <adffSYxKIuaDLZit@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adffSYxKIuaDLZit@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_020650_432339_E58D9AB8 
X-CRM114-Status: UNSURE (   8.21  )
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

On Thu, Apr 09, 2026 at 10:18:01AM -0700, Hamza Mahfooz wrote:
> 
> alg: hash: failed to allocate transform for xxhash64: -2
> Kernel panic - not syncing: alg: self-tests for xxhash64 (xxhash64) failed in fips mode!
> CPU: 0 PID: 425 Comm: modprobe Not tainted 6.6.130.2-2.azl3 #1
> Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS Hyper-V UEFI Release v4.1 01/08/2026
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x4c/0x70
>  dump_stack+0x14/0x20
>  panic+0x179/0x330
>  alg_test+0x678/0x680
>  ? __alloc_pages+0x1e2/0x340
>  do_test+0x26f8/0x7670 [tcrypt]

So the error is coming from tcrypt.  I think that's where the ifdef
should be added.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

