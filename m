Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C15CA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 14:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysNHmMEub3nXV2fVbbKoB7BvmncFWa+ykTnACh3vKVY=; b=3VooEjhXx556KnE5Ru8cQdS9lf
	suBkSu09OewkT9GzqA545hVojJm4jAktrDQWI1xHea8B/YkQioZ5bOGvwULgucGEyBjDq/NCBf3lc
	p0oAR7v+zLpGRadyY2ajLovf2x9snyTl2agJ4dDuysFZFnTpwH99hZPpUSoLo5GHOfU3XH0RHIuP/
	D3xLfeRrkYhm7uWKaZg+iiMluKOSMQeRZ8IL+DEBvupUFSbC0uin8P9cOr7eUNdl3yEw0/zpT/Rxs
	ujQWd44uOCsRtwI6XnWdZxuGpzxdd/cITzDd96BSjVBwa9J2x8x96j1b0yVTwMpVDMnStuVADxVmV
	7A5pSPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFC16-00000006V43-01iz;
	Fri, 09 Oct 2026 14:56:12 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFC12-00000006V3F-0wQj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 14:56:11 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 9F0FEEC0927
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 10:56:01 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 09 Oct 2026 10:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791557753;
	 x=1791644153; bh=ysNHmMEub3nXV2fVbbKoB7BvmncFWa+ykTnACh3vKVY=; b=
	XSpv85FwVpj6f/Q123Ku5snZB6f6DXKHLcLllrg1WVIjIXtmJX63Bu6IlYbPwcZR
	rD1SAuDyR6CFQILJzzy/EpD4lYPmvXL7thwvaRNDfUgZkr9IyNx6Fe06VqGEr+W4
	IiDC4hTulQAj65rDWX/mDnVx1L2/A2rAmpNjp2RtSDwvKmpVuTVcx83cKDINlgo7
	FWrJSLc/+yHFw9uEGvvhN+n4/FtSps2JJAG+9xDCnv2cbgFfqbYf14oMBbLj/KTj
	HBdpgaaYGDoLbe1k78F55mQk/52CIXWeL+n9VK7Sdbkg7x4pjzEc3vO7ddDu/G81
	8yioTfhBtUQJKutKaWgP5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791557753; x=
	1791644153; bh=ysNHmMEub3nXV2fVbbKoB7BvmncFWa+ykTnACh3vKVY=; b=H
	usQy3kkp3yHPLp8UUYQm4okPWAy7mOFAPRsxDi2xsT2QJXudvfxPg3aBpxzV8L7k
	F22+CD42He7CO+FbOjHn4vfOaQVFhVIfIc44FDqR947J6a6mj6IJbnUpXv/K+Ped
	ZchWQk3HWUf9qQZpyBPley5llnWA7XSiL/e9xgPbfN+406nEFpw3R/aou9L6MY4R
	IHin8/ETQ94yyp8kvB3YzNvdMNVDXTLjSysljJb/pWj0v+8NzwKTXoNgwSHVd3HK
	f62ZucmfyUI078es9FcKgToOI3lqhEF62VseGVzNF0+PxLcmqfQc4vWufjPgQ3/O
	kM2fvZkQjFZ1rrZEJ+Dhw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791557753; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:VdlXvYW84KHhl24AcuzmijIO9N/dKTEtuKXQJOgTNmLi0FL
	2W5/NKdABc7qpLn68K7OnAwH3LHKo+hdMa4P5gOUeKZ/Q9seZzvfIyXgaaKFRGx7
	tedTcw/vOxCDDSUAA8ohEsHRgCibMBvWPltMJk9Ka90OlfO2+WxAqjmYzqd1favY
	scwhBB/6qjSj9NXF59p4TDj0AO69pqEWe9D/nlNHn68LiGCqiCv5WI30J2Sv2dR9
	6OjTSj78gKvBk7pZm2wOs5kDwEDEXipOkjXyhfSnpzSePSRNqJAv9iSeY7l55lBF
	sGsnPR6BXJ8W5B0pIcFUdBcePbFJdu3m/8fOUdQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:XXGpeO/YmQwCKf7M0XVPtgOpG83veHWzCgaYuUnnDhk=:YofAd0oLdISy5ffEbw6L2vXkCkMZJJQFjD9dwQ/xgDE=;
X-ME-Sender: <xms:bADJakCZIqprAk-Cfkgd8oKVpTmcXORv_0L0iSLeZZBYxIepxqPnnQ>
    <xme:bADJahWU-SgG_CUcigw6KQAtRJ5oPXyyQN-bPFk_H4EQ4vQNiavjBVQ_SaOLHUVm5
    US1addiYFR-qdCd9CjNqAsQSg6CSemYH4VwvzH6fnHu_vGtWV74Ge50>
X-ME-Proxy-Cause: dmFkZTEJayRhQxc0vKpBsdIsSAVWjFwdChche+mtH1Jx0kOIH/5Zr/HdLbAB+GR5Gedxcf
    vLt+01ODtHppZjY4Rzuf2BnBd9wb7qZwkArWQjyrPorOQQBCvxKONcF9Fo9bmV31/oecRk
    gzALbeQ7+yrnzGNRMw2MH1yC4RWP6fa6dtPxV2Joc7KnIVHMNyOpalAsWMsmX6ETwYGwd6
    AndjR8ne3hlxTHDCay9AW5D9D/PCdYRBca6upRYxRXRBMGgZmsBWk0UvYJl8ejSjRiDtIn
    kgWN61zC4V4v0W2r7ZypxB+9vuznUpUgHnQXtSeaVqgodADkAeMWwCpXIrQ14KAREl5Eaz
    QhkS0wymOQFto9XhzbJEiAsaJrYVDbyIRf66e5gURh+fOVSv9oFTgncmR6D8IhUPc/WqUh
    YvNYf2uttdcZ6w+nmSL7NyDT3Wf2IVzbE+3DdmdjjfqH8vgBnq6GL8pVYNqVLQjdqWz2Zp
    RJRNiTCmzEbxS/ownyPb2XHnKm4Hjfips/Qzs0qt6Q5dwv3blGmEFEYdeHGTPjZxEF7opB
    frh+GEATn0Thv8xRSyLwWIY7bMOvjY5RPZZW/W22KlUiwa/QpxGtUp9DPqwn+SwjuBEUwV
    3PGb4hyeYjZprznkD5hESsD101g/qRsDLmBhhmEKLJCO5uxDrP3yCH+mUjPA
X-ME-Proxy: <xmx:cQDJajmB0Wm94rXyVUq-HO27gEdKVAOQoF_YYPsy3_XslvuWHByLxw>
    <xmx:cQDJaoea6BqZtZ7PzR42N9GIyzoECk1C_nwdRZH4Mqq2rv1J_UQm1g>
    <xmx:cQDJaoW_RJpIfJeZYSTZnWC0ZhVMZnGVfn5_8V7vN5jonGOH_GeICA>
    <xmx:cQDJakFh6g9dtce22r8K4rMHk97EvLg5OU-37cxkPJgoWBH5eN6cgQ>
    <xmx:eQDJaraZnKcjGo9k3CHjRLLST4BziwMhZO_yWxaLrHvknhv6syFIWZrv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C6CF732A008E; Fri,  9 Oct 2026 10:55:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AKEFTclLsUFV
Date: Fri, 09 Oct 2026 16:55:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: soc@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andi Shyti" <andi.shyti@kernel.org>, "Andrew Lunn" <andrew@lunn.ch>,
 "Daniel Baluta" <daniel.baluta@nxp.com>,
 "Daniel Mack" <daniel@zonque.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Giulio Benetti" <giulio.benetti@benettiengineering.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Linus Walleij" <linusw@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Nicolas Pitre" <nico@fluxnic.net>,
 "Vladimir Murzin" <vladimir.murzin@arm.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>,
 "Dario Binacchi" <dario.binacchi@amarulasolutions.com>,
 "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Ralph Siemsen" <ralphs@netwinder.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Stefan Agner" <stefan@agner.ch>, "Tony Lindgren" <tony@atomide.com>
Message-Id: <e4da2f9d-d3b9-4267-9b64-b0f2cb43402a@app.fastmail.com>
In-Reply-To: <2afd5f78-0174-4955-8c1b-be18aea3800b@app.fastmail.com>
References: <2afd5f78-0174-4955-8c1b-be18aea3800b@app.fastmail.com>
Subject: Re: [GIT PULL] soc: deprecated platform removal
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_075608_805569_76ADF715 
X-CRM114-Status: GOOD (  13.01  )
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

On Mon, Sep 28, 2026, at 23:46, Arnd Bergmann wrote:
> The following changes since commit df2908090cda368b01ff43709f51890076c56157:
>
>   Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git 
> tags/board-remove-for-7.4
>
> for you to fetch changes up to 1b200c44654d654bd0d04cbf55823b9e275b2a56:
>
>   ARM: axxia: remove entire platform (2026-09-28 21:43:31 +0200)
>
> ----------------------------------------------------------------
> soc: deprecated platform removal
>
> In the 7.3 kernel, I marked a number of platforms and features as
> deprecated, with the plan to keep these around for the LTS kernel, but
> remove them in 7.4, see [1].

It was pointed out to me at LPC in Prague this week that 7.3 is most
likely not the LTS release after all, so we should wait another
release before actually removing the code in order to keep it all
alive in the 7.4LTS kernel.

I'll rebase this on top of 7.4-rc1 and resubmit for 7.5.

      Arnd

