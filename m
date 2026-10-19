Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAC4CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRAdLuUMQVLrTUQtW3xqfK+uVlZ53vZnJeL6TLJsmWc=; b=x9MhJJYl+Umn5mmWxe4XRdFYVb
	AHm/yRREhwItzjnhVRciBWaI5bXMBCzt0v7E0vaCqi3Lc3xsTNbWS6kPvzj7wtc3s8/8dJskPJNtQ
	nwrsf1cKlmUwL9ajX5Hre3tzweqBtTDDAGsWOiVgd4LicbcmiG3QeXBoAbVJhLdJVpMEwdTsXrmIB
	QgVLKfM9qfyW6EQlMYbPeEhiTeGh0qcrxWKSJ/OPn0M8uxdLm5kh4eNf+FZBXNLITxpGJ5bwHOzdY
	r6xIWTXBMtME64uXKuc75q5bVOTNWwD27jnGOwtCYVCHUxu3rZbwYubHc71mghK4w7L+I03x/pb+5
	kZxVhajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIj6p-00000006uY6-1M6s;
	Mon, 19 Oct 2026 08:52:43 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIj6e-00000006uUl-2wH9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:52:37 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id C4D931D0008E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 04:52:27 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 19 Oct 2026 04:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792399943;
	 x=1792486343; bh=cRAdLuUMQVLrTUQtW3xqfK+uVlZ53vZnJeL6TLJsmWc=; b=
	Bb51uD+zvzxGM6E0mUk8Giz3BKrGMrrYJX4x76rDnG4XXQZ4bkc+QQYo/lCgJKnw
	/YtlnW8l5Mg7zNTrkuv8QIx8Hjdp5VGbsPy9sKYWCD0qTGCufyK8sWmERvilRBC1
	suD/h/ro15Dqr3eqcbBnvQ8xJutlBScOOobxIsg/ut5JyYblIKSu9wDnH8zvsxlP
	KXQF7e6m8fTjtwEWl5yUWto9N9CbV8i0YTjeKgQzTjz4vvcVkEYVyKlAIlPOMFA8
	bugTzawWB8mC/sORP9m1z3JbxThwVxV/6MEbhhikhts6qbm8ZMASgYX6+okqfCiJ
	kJ3kS4Opy0c+UjM1O3osRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792399943; x=
	1792486343; bh=cRAdLuUMQVLrTUQtW3xqfK+uVlZ53vZnJeL6TLJsmWc=; b=j
	aGV4LybY53Wtm+1by7eCtJn0dPTnEINAUicpLQXHxV5Dpv8CaqMBPyu/aGrhq70E
	+D0eOt+0cLSqy+Ne7G9g5DCqpDVyRGo5IoCPPALX6k48HUC9TcT72rNvXv97v9ra
	WNcYVRUjWaaoyvyKdjpvs5BaIfl4NXjd76HoNFeeTC3m1zgEnjZ6bKyJMcKpQPNd
	SurClGB81XgpUnfWbXe1rrYOi3n1+rT2e/xyJjOLwRBmzNlVeZ4LtMkrKfx6nQDg
	nvtEFB68+rgvgrGIhmfwh9TDI+TsOqpBIqiiXJhmNDJ9u/+P1qyf3WSdOz1U3GDY
	ntnZ7VFRlLkcAZYCcPGxg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792399943; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:PMzcqpES2G2TTHILeyPN+oe++Qv5DI5mp8FY6kIP5b+Gqmd
	w52E/otb7QOUJuX8oJ/l4Ms7Vtb/qa/xVBorRVh6mxLemrye/DjdddjLA4F1r+R/
	oIr6uixIOXZ/KUJzH4tLcMRVT00lJK1QrfeGp6GHnv7or4qBuCTa/QAUZRsfQFv1
	XMlr9DxfvPl1AIKsSwIdYsQraHX4oYRLstCAArheYu/vYpv5FbPU5DzCbzEXXBwa
	rgRD66WV2BArx6vX7NiA+xnUC5YrIHqlErR+lNxbHqP0Kh9zKDIDqawKuMC5oBFN
	G5r5QpceO2NXdlC7fThd9rmDoIuZ288/ctKiFYg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Gs2Wjku2DTGryiiEUBBCDXcmzXgVadBUGqvHkD4nUM0=:nEANZGCZ9guMXFCy+MYGNEwKQAPuCeBUOf9W0nQu4uI=;
X-ME-Sender: <xms:Q9rVav6D3Dcxo8Dp7JWJFqt_8J5wut7N8gdYQvJz9SaLqGGLFo9Cew>
    <xme:Q9rVavs6MbXGshW82x0ZHhMokskmEBlDr_L3WY3pDTonLkGORsRJb8Lg1tZyNDm9y
    4Q8gOCHerODpEO5pp2eFtqjku720t1IBHn0U391crtu2AZA6CGjMaqu>
X-ME-Proxy-Cause: dmFkZTE/dT272iY9im8e2pKUcyzfMQ8Oyk1kzzEI1f+HUy/s7LMoDoLCYPzG0mJfeS5zgO
    f0lswCnXyxAz+3erxCsMP4+vKJeE3RV3bgTCuEtU6lTcmjMBsmyugSw1uttzfjVDVBiti2
    oKBnrV4PrIs5JBpQqCsGNeblrRF+OSCnjJBycE5D6i35XNLxqa7W3RkNG6bn1Kp7rxg5Ip
    fEQBkYJ23L3N/yWyUzwJ3QLpqiA/HEtisyzb4pkcIX+IMo0Aeou+u1tGFtqCfhGevzHMZd
    oZ8vtgdi2VkY/na0up9+kUmxThyhDdk2ZOQfeZePrCRPPZSfhi7o/0QYKt05lzKu/bxIgV
    AReHGFOFOKtO2spw5zIUjzV2Mt6Vy/rb2JeooMviE+ckKOrO3+JXUWT6a431qQDP6wsZ1B
    JUCNzNfI1KtbtxDKQthKy3ro/ga2f8vCIrc12mHcukL43PJ7Sb0yoVf6WnE7lsuUcx+w58
    Kf2sKWLGCas3MfVGNk2MBnJSX/QoRwdm3EUscO/dz2rjVB+OurtIIpzt62qEaLAhGVEkKE
    c9pcKjxpuWjO+sq0+R9/Rtdq9kVa02g/2kcT7+I+UfX0l6V7CWezsZrG7j6LdTN310060G
    8XMeBKA3hQEDNFFWhRjGxTGMA3jzqme/BM0MinigfjVujLnUyW1g5aT6cz3w
X-ME-Proxy: <xmx:RdrVapdw0q3pcIo4FDKP9CjLcJ9aFpMgJEYH3YsC-_qpVAdGtBgjkQ>
    <xmx:RdrVajFt2sfTAI3F-k7Ca0awfyHj4AVnCfEo7BCBIdNnQt__wutuFQ>
    <xmx:RdrVavieEU2XyCgZuUhkL4gJ2IwJYpDzzOHFKoqLaAcpK4oqiCu9Cg>
    <xmx:RdrVan3qJP-Cv7JpPw1hwcS8aRNhqb7x5fl54a5BJ8qgeLW8JXE8-Q>
    <xmx:R9rVan-aKXJyknrQZ5T92z3Wf4yKBw289HESbAn057kGTwA5ZK8ivWH5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0244532A008F; Mon, 19 Oct 2026 04:52:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A4WN0AQLOakc
Date: Mon, 19 Oct 2026 10:51:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Hugo Villeneuve" <hvilleneuve@dimonoff.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
Message-Id: <d0d4182e-342f-4038-ad9f-e6b580c9f2e5@app.fastmail.com>
In-Reply-To: <atXLd6SdHNr0UcjI@monoceros>
References: <20261016130328.1037616-1-arnd@kernel.org>
 <atXLd6SdHNr0UcjI@monoceros>
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_015233_023567_E4C52B82 
X-CRM114-Status: GOOD (  11.69  )
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

On Mon, Oct 19, 2026, at 09:51, Uwe Kleine-K=C3=B6nig wrote:
> On Fri, Oct 16, 2026 at 02:59:47PM +0200, Arnd Bergmann wrote:
>> Link: https://mirrors.nycbug.org/pub/The_Unix_Archive/Unix_Usenet/com=
p.unix.sysv386/1990-December/007174.html
>> Fixes: a300273c458c ("serial: 8250: hub6: Add cleanup code")
>> Fixes: c526404a4a92 ("serial: 8250: Fix corner case for port matching=
")
>> Fixes: 7ab80d1e7243 ("serial: 8250: fix compile error with hub6_match=
_port() when compiled as a module")
>> Fixes: da7b5fd4e17f ("serial: 8250_hub6: add missing include for hub6=
_match_port()")
>> Fixes: 3d406299d882 ("serial: 8250_hub6: add hub6_match_port()")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Fine for me. I wonder about the amount of Fixes: lines, but don't care
> enough to check.

My first thought on this was that the hub6 support should just be a
loadable module and that it would only require inlining hub6_match_port
into its caller, but then I saw that doing this would be exactly a
revert of those five patches that each individually make sense.=20

> Acked-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Thanks,

      Arnd

