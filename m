Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BA1D5B165
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 20:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpKsTV4yXA5u/SkFKOKBOuP2IgqdoWYY+IPPDVhaA1c=; b=HMa/EGqfQ+t6k5WUbeZ9ZBdRin
	2WvMK8/UIpz+rsaAPZFgFR9O58o4Fw2xVaPst5sR8ThcpldKaIyoT090TZk0Bt/+FqdE92SiM6KeN
	swt/yyOHjJId/O8ixaTP0fl+3L2SEhtO3FuULjdI125VhPKTasuurJg1V0xNAgawKxaPedajS3l7H
	89ETgZHH0M86kRIhm1s4ix7g4R8coqDyE72ptw2hcXjksfTo+NcIGiJX2oSdxbqTAUMYVcuqDNDCZ
	+fFZ06t06RypRml020g/ehsJrjwHasZn3WvuNjobJ9225Z6pk6+5oQ8MD7O30E38zVrgduEy7QT8B
	liOvgV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUWiV-00000001vE9-4904;
	Sat, 13 Dec 2025 20:59:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUWiS-00000001vDm-2p0u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 20:59:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D8564012C;
	Sat, 13 Dec 2025 20:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E020FC4CEF7;
	Sat, 13 Dec 2025 20:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765659584;
	bh=4ziXibIHYyfqql44UUvXn1ymq5E2NexyepJD8Pd1laE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rdyeb0DWM28Op2Vww55c3/UZaIdhcuBLlJ5tFX8j1lx0g2W+LlNZAPckx7251PlV0
	 SYfp8lYABmoysqW6x0rGv7h88pDq7cLQbhUEz+f9YCrPbomMNYgx4OLxFIDVB7c2jS
	 afVGDPtUI0BJ2USHJ0IHbMeMrdCVPbYpZ/5lC7zmR1xQqMOurzZYMgRhhmeRKvLQ8M
	 6wAPCgz6xrttntuwRRDVPeEnWvzCWaTOv9WrY8ffPJacgXR0g9xXUf5DKMF73PFXYQ
	 sC/m2TTaUeCLsGI6kI3EaxBJ1+SNCsprv2BA4/1h3a42VpHJFot0uNW0BDZdQucM8C
	 5jfVQgRAovKpg==
Date: Fri, 12 Dec 2025 20:09:31 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	J =?iso-8859-1?Q?=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/6] scripts/make_fit: Compress dtbs in parallel
Message-ID: <aTxoa9ghRIMqAMrO@levanger>
References: <20251211140309.1910613-1-sjg@chromium.org>
 <20251211140309.1910613-7-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211140309.1910613-7-sjg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_125949_017881_A868CCF1 
X-CRM114-Status: UNSURE (   8.09  )
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

On Thu, Dec 11, 2025 at 07:03:03AM -0700, Simon Glass wrote:
> When there are 1500 device tree files it takes quite a while to compress
> them. Do it in parallel.
> 

> kbuild: Allow adding modules into the FIT ramdisk

This line sneaked in somehow?

Kind regards,
Nicolas

