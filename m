Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8047C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 20:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfuOGyOWUUq/N7DdSSsipIf5/Rfcf9wzgqQTSgIOlAI=; b=q/OAqW0tpia3x/7UI2MWw3cgVz
	MUtJ8QZnVc2s22xcIYNMRWhugpT5Orr5WKfx8ZH7CfXkKIsQ+wDBrtBl/3Yb9mxPW75SXfkMQfsmc
	fTXPUCxuMKxlbj+cvuxbHqi27IMR5SNPW9amBcAc1FTBIy9FyZLicXYIRW7gWqvYoD2TmV9D7+Y/e
	BxGZloMs74l9SwJkO+gYxY21CvTHC6JIXn8Pj3aUT5mKqfL3bm7rFEuEtPe2MamFT4cYJTtHSLwtD
	fzgHiVcDhI/btcmdBIhaUC6AzfuVT1q/uRHtsdw2hj1tiQNaipqUyZbjxUP30y9Kd5OTNURP3umXx
	r2D5142g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQLP-00000008dGA-390P;
	Tue, 18 Aug 2026 20:23:35 +0000
Received: from out-234.mta1.migadu.com ([2001:41d0:203:375::ea] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQLM-00000008dFO-1rWE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 20:23:34 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AqJeH+5LKRNmRQzJ4ZHVSBjhlvotk7eHnatQlagjm3E=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787084609; v=1; x=1787689409;
 b=EuV0Ut8m3bx+Jytvwzqdg2h8IEQsQw453LdXkbQtrC3ORpOre07Tbei7lUgOTZi3qUtj+JsH
 fYOYY6vJhb8ocWkfupU9xrzbw38FuQ4QVsFVN5SKzhuQv4fvzlggrAK1iDo6Ki3inl5TDlsAsPr
 FsWizV7G/i8RuUEXHSVYaI17hehjI0H+qjZq2Ti9V1D5BHj6/NMsM0XkrD3tdiBASUL2494i4V2
 LAOlenuPwemcftck0H1udTkgnPxgDl7zpA6kc6TFyqBbnrEjAOiu4gjs6wn2g/zxHznh9X4cglb
 EAQ07jyqXAA93/F7oOkavbjtWiwqcIcYsxhsi4yl8E4+g==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from localhost (92.254.112.55)
	by smtp.migadu.com with ESMTPS id 00a65aeb1c26adae;
	Tue, 18 Aug 2026 20:23:19 +0000
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 22:23:18 +0200
Message-Id: <DKSCMAUXS10I.2AB9KERO16FRG@cknow-tech.com>
Cc: "Dawid Olesinski" <dawidro@gmail.com>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Corentin Labbe" <clabbe@baylibre.com>,
 <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] crypto: rockchip: Add RK356x/RK3588
 cryptographic offloader
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Eric Biggers" <ebiggers@kernel.org>, "Diederik de Haas"
 <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260708175837.1718437-1-dawidro@gmail.com>
 <DKF8V3IHKTL2.1PUA8O5IVIRYC@cknow-tech.com> <20260818185810.GA7030@quark>
 <DKSBIH29Z9DE.1OR442P0XUSCS@cknow-tech.com>
 <20260818200454.GA2718123@google.com>
In-Reply-To: <20260818200454.GA2718123@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_132332_688553_4C6769E3 
X-CRM114-Status: UNSURE (   8.15  )
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

On Tue Aug 18, 2026 at 10:04 PM CEST, Eric Biggers wrote:
> tcrypt.c reports cycle counts from get_cycles(), which has an
> architecture-dependent meaning.  On x86_64 it is something approximating
> the CPU cycles (3-5 GHz) whereas on arm64 it is the ARM Generic Timer
> which tends to be around 24 MHz or so, over 100 times slower than the
> actual CPU.  So 9044 vs 115 "cycles" for x86_64 vs arm64 sounds about
> expected, and they suggest the real times are likely similar but
> slightly faster on x86_64 as expected.

Phew, thanks for the explanation :-)

> This sort of thing is why benchmarks usually should measure real time.
> The legacy module tcrypt.c unfortunately uses get_cycles() instead.

What would be a better/non-legacy way to test crypto performance?
Is that documented somewhere?

Cheers,
  Diederik

