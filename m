Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F1D106ACCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 17:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmtlnhSTjgOoQaF3XdzpaQYVg6I7U+e/byYCHILShjg=; b=wmTpqkp0TYBrvfsSxbdN+I6SFO
	eInv7eW742J7l/Yd9rEhbeCkDXG7Ymvj4kOPB3SAUmj+9mfjMRAYML9Eq8lUPf+mtbddfKgu3e0i8
	s6fTmEc4Eh9fE+aQJh0VJH3Yw7zi/A46t/Z9dEovaleowR0xloq9YBIsDIBf+N5eHb3JZdel8c3zg
	98DVZKtRj7f8EMHacDyBYtQpGjKIgZQAcgVkMVQkeKEGTSmPD5yQ7EwMlLXZnWq3g97dY2ZB0dFmE
	JPDIqaG9cvwnQCMytnTyi2I1LXPCEONfcN+4XMBqY/tE0cfXGv19/0hK9luMtewJbFlTmoThB49GU
	LUDambRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jvd-0000000EjU1-33qr;
	Thu, 12 Mar 2026 17:34:33 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jvZ-0000000EjRr-2RNC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 17:34:32 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5909322831;
	Thu, 12 Mar 2026 18:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1773336863;
	bh=fmtlnhSTjgOoQaF3XdzpaQYVg6I7U+e/byYCHILShjg=; h=From:To:Subject;
	b=Z+0B417l9p71c9g2467dWy9UgcuD70ES35DaANtN0imwURTZU/GPr25LH+b5eQ6ym
	 0hVsZhSnAJUU+RVHvGSUx+CMOWrr9b2F4DVMWTVphdX0DP/GRwUn61FTHAp9jUl6tC
	 oCNGIxNG1N0CODjGoX0qFYW4Q+SeYau8/Ta3jzwoE9eiOyI0Ggn54oBoF9nA2/5qCQ
	 zyNIj16+riOjZYIm70/XvM2xZAF6ZIW67O49FwbCDgCphk2melEEoB9awSAIKjGRIM
	 yMc9HpZiPhvaMcw5R9TguGnDUDO2I3fUxmwPrQil1l7fnVLrsiN7+2OySDqguMHfTM
	 zACt1/KiYryLg==
Date: Thu, 12 Mar 2026 18:34:18 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: ming.qian@oss.nxp.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
	benjamin.gaignard@collabora.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	sebastian.fricke@collabora.com, shawnguo@kernel.org,
	ulf.hansson@linaro.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, m.felsch@pengutronix.de,
	fra.schnyder@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de,
	Frank.li@nxp.com, peng.fan@nxp.com, eagle.zhou@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH v4] media: verisilicon: Fix kernel panic due to
 __initconst misuse
Message-ID: <20260312173349.GA137045@francesco-nb>
References: <20260306031059.801-1-ming.qian@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306031059.801-1-ming.qian@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_103430_664610_0C5C7497 
X-CRM114-Status: GOOD (  13.23  )
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

Hello,

On Fri, Mar 06, 2026 at 11:10:57AM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
> 
> Fix a kernel panic when probing the driver as a module:
> 
>   Unable to handle kernel paging request at virtual address
>   ffffd9c18eb05000
>   of_find_matching_node_and_match+0x5c/0x1a0
>   hantro_probe+0x2f4/0x7d0 [hantro_vpu]
> 
> The imx8mq_vpu_shared_resources array is referenced by variant
> structures through their shared_devices field. When built as a
> module, __initconst causes this data to be freed after module
> init, but it's later accessed during probe, causing a page fault.
> 
> The imx8mq_vpu_shared_resources is referenced from non-init code,
> so keeping __initconst or __initconst_or_module here is wrong.
> 
> Drop the __initconst annotation and let it live in the normal .rodata
> section.
> 
> A bug of __initconst called from regular non-init probe code
> leading to bugs during probe deferrals or during unbind-bind cycles.
> 
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Closes: https://lore.kernel.org/all/68ef934f-baa0-4bf6-93d8-834bbc441e66@kernel.org/
> Reported-by: Franz Schnyder <franz.schnyder@toradex.com>
> Closes: https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
> Fixes: e0203ddf9af7 ("media: verisilicon: Avoid G2 bus error while decoding H.264 and HEVC")
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

What's the plan to merge this? It fixes a quite severe regression,
a boot failure.

#regzbot introduced: e0203ddf9af7

Thanks,
Francesco


