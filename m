Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9400E776F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 19:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laVChJNHDMAEia3D9tY89qEJGVGUm43S0WNZqN+Tr7Q=; b=DB6rlRPbEwoFkOhKx3Mb53r+Ap
	MrZcBe9yACQJ20hbbM5c2PWSZmjQNHgaSvSgBU5rrXk373PPKxspPlDy/JPFts6Gnxt8ayPmKpgTF
	2AAs90nYmlJRZkqntyOZQK5EX1KNn+MS0NKYnZV0hZSsywHJGEdawUWWvPW+YrnWgxj9dvjOFo3OK
	2zUFE881nv6CPONY6JZRxd+ZIweCSEZfyJidhqKtVi5LCSIdj4UuXO2dMdt/vobc9Dz40KKr3hJE4
	LwPalT7dweq7/iCATKpzHbdzqZvQIMbe2a1Fz2JyhV84/QPMkyh1coUh0GUGbao9tKMqFSresoKXK
	G1sKWpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYULU-0000000HLaD-0V5Y;
	Wed, 24 Dec 2025 19:16:28 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYULM-0000000HLX0-0wtI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 19:16:24 +0000
DKIM-Signature: a=rsa-sha256; bh=laVChJNHDMAEia3D9tY89qEJGVGUm43S0WNZqN+Tr7Q=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1766603684; v=1; x=1767035684;
 b=SN+ObwVEF/zqznQv8SvkdHWJchtv4GCvgsa382pLIH7l8wzC8eYH3kBZ7/0xHo4i+qs04no5
 Il8QHjJoYawDMSXY31NNLJhoRymV94nQcxMthyZJdFRfiji+8fAIs4pMWdvvIIb8cqTtAzyQtDn
 vUL3sHnn8/6kmN5+whf+aD/Bq+XlxUnXlA14p7cRDWed9x2wDr+2eO+eMUf+lXi0p8ZNRx3Xqaa
 pv6GPsm3Vxyo0Reysvn2I6gTAcxhP3V9JwpD2nPvkZI+IZSbsiVcEzgcGkIgJVN6ptqr9EnX6O3
 P4u7mDsLoamS3zCPGSiR7GwgYHEuuy+kIRPOEngKACxVw==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id d4a10bf5; Wed, 24 Dec 2025 20:14:44 +0100
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Karel Balej <balejk@matfyz.cz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Karel Balej <balejk@matfyz.cz>
Subject: Re: [PATCH v2 2/2] pmdomain: add audio power island for Marvell PXA1908 SoC
Date: Wed, 24 Dec 2025 20:14:43 +0100
Message-ID: <5977726.DvuYhMxLoT@radijator>
In-Reply-To: <20251213084843.7491-2-balejk@matfyz.cz>
References: <20251213084843.7491-1-balejk@matfyz.cz>
 <20251213084843.7491-2-balejk@matfyz.cz>
MIME-Version: 1.0
Autocrypt: addr=duje@dujemihanovic.xyz;
 keydata=
 mDMEZokhzhYJKwYBBAHaRw8BAQdAWJZ0hsI/ytTqHGFV8x6tzd5sB596cTeeDB4CQsTf+wC0KUR
 1amUgTWloYW5vdmnEhyA8ZHVqZS5taWhhbm92aWNAc2tvbGUuaHI+iJkEMBYKAEEWIQRt/0HWDf
 MUtbdrpjCtMZNSRY+tAwUCaJ5XkSMdIEFkZHJlc3MgYm91bmNlcyBhcyBvZiB+MzEvMDgvMjAyN
 QAKCRCtMZNSRY+tA/N/AQDth3Xl3wNcETvWPqqfYfyw4BFqbOD05A/W0/G0ZIjFzgD+PZVts3sN
 p5WuEwIxUrWxwavWJQBJwhXeWdru5ol82gmImQQTFgoAQRYhBG3/QdYN8xS1t2umMK0xk1JFj60
 DBQJmiSH/AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEK0xk1JFj60Dlw
 8A/i4lPOL7NaYoYePDql8MaJaR9qoUi+D+HtD3t0Koi7ztAQCdizXbuqP3AVNxy5Gpb1ozgp9Xq
 h2MRcNmJCHA1YhWAbQoRHVqZSBNaWhhbm92acSHIDxkdWplQGR1amVtaWhhbm92aWMueHl6PoiZ
 BBMWCgBBFiEEbf9B1g3zFLW3a6YwrTGTUkWPrQMFAmaJIc4CGwMFCQlmAYAFCwkIBwICIgIGFQo
 JCAsCBBYCAwECHgcCF4AACgkQrTGTUkWPrQPUYAEAlVKitl0w6Wun+hC0JIf8bnc0TnrH8kcDxV
 f5lAF38fcA/j8RxR/p558NTFUyHZt2Sa5AqxVkaA4aJekySytWe1YGuDgEZokhzhIKKwYBBAGXV
 QEFAQEHQMRz0l4Dnk6Vl9YqC+ZGDDpr8SkFDyYOXqdBMGad3VccAwEIB4h+BBgWCgAmFiEEbf9B
 1g3zFLW3a6YwrTGTUkWPrQMFAmaJIc4CGwwFCQlmAYAACgkQrTGTUkWPrQMbkwD+K6jiXYYMRnV
 l/5dpL//wXB1cM72ceR9tXYweMXg1lfABAOugzMF0xypW9zwYAEWVNOAaPsqtEPPYfBY3IXxl6m
 sB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_111621_298229_A0C713EF 
X-CRM114-Status: GOOD (  10.15  )
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

On Saturday, 13 December 2025 09:48:13 Central European Standard Time Karel=
=20
Balej wrote:
> Define power domain which needs to be enabled in order for audio to work
> on the PXA1908-based samsung,coreprimevelte smartphone. In the
> downstream code, this power-on method is marked as specific to the ULCx
> series which is allegedly a codename of sorts with ULC1 corresponding to
> the PXA1908.
>=20
> No other audio components needed for sound to work on this phone are
> currently available mainline but some successful testing was performed
> with the vendor variants of the respective drivers and with the domain
> forced always-on.
>=20
> Signed-off-by: Karel Balej <balejk@matfyz.cz>

Reviewed-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>

Regards,
=2D-
Duje



