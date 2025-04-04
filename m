Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B05C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRKOkfd6qLJFQE7R23p8Xc/vjAtr8M2K9QIPcFzV9Ag=; b=J/X2pQVnIDpQKnjEkbXQKdub0j
	9xTaaQ4HgWWSonpAfLfhDe/OXWDY2AvBYkHHF3Q5UP5htjk/a1h3dZNjZ+IezhI9hlVAGIDcBwJxb
	n02rLjGg4HhEOKz+EHQ6MZvz6chbAflRGeK7+SzFpz85HBdwI+iH3gC8YX8X1V14OIqkJ4BcNFUWc
	Fp/WGbkl/cw8Kk5e6dSoTmi3H9KlwoYkCK7No3l3Q5Jls5DHNCL7unPYbCYkQ3XBGnML93qMb6eJ/
	N/t9IFo2f+pcfRJFMqGnr0NpFDIcvpjbDQaqWPaFAk4QrqNAjVdRunspp1jA4GG3rIh1F5K84tA1R
	7rsTC48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jTl-0000000CFIe-4Bzd;
	Fri, 04 Apr 2025 16:01:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jR1-0000000CEhL-0F6u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 15:58:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAFF644BC3;
	Fri,  4 Apr 2025 15:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D617EC4CEDD;
	Fri,  4 Apr 2025 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743782302;
	bh=tRKOkfd6qLJFQE7R23p8Xc/vjAtr8M2K9QIPcFzV9Ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PhqJS6CB9ljx49n4bTwoc+W4UoiVPaXAHlrw0XMHrE+ZQfoNuNTgGE6REnb11MSsh
	 jjJd7dGrHDC1gBnJhb+Gst5w7SXVInNzlrzJoroXgszPdR9qJSDGa1aNXd0FM+Lrc3
	 B1ZFOhfLwpxMEybw3P/j7znRIJ/Irt+5bLn2a+l6jkjxG5IfZnJw+yhdlk9qPzbsIz
	 GqM5oOpTK+N0MWzXR51dZ9UGQlaaW0LOKFX17mBiLrbYn8iRKkQl369Tgkx1BgrR/5
	 iGXTzAxzjOH/hzM17W8FsHfhQeBDYZrBnDDarQvle1HlFySurbhnJ0suvqyhFXYo7P
	 9SFJ+qsMESBoA==
Date: Fri, 4 Apr 2025 16:58:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v2 4/4] tools/kselftest: add MTE_STORE_ONLY feature hwcap
 test
Message-ID: <8cd07b7b-0795-485a-86f1-bc3a68be7820@sirena.org.uk>
References: <20250403174701.74312-1-yeoreum.yun@arm.com>
 <20250403174701.74312-5-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PMkyeU5nDe5fyzdI"
Content-Disposition: inline
In-Reply-To: <20250403174701.74312-5-yeoreum.yun@arm.com>
X-Cookie: You will soon forget this.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_085823_120654_4F9947C6 
X-CRM114-Status: UNSURE (   8.24  )
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


--PMkyeU5nDe5fyzdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 03, 2025 at 06:47:01PM +0100, Yeoreum Yun wrote:
> add MTE_STORE_ONLY feature hwcap test.

Reviewed-by: Mark Brown <broonie@kernel.org>

Usually the subject would be kselftest/arm64 BTW.

--PMkyeU5nDe5fyzdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwAZUACgkQJNaLcl1U
h9BWowf/R3vl/2tkx4iIVwMuzIG9MRQHR602mNzSvNgq8KueHzVfm1Oy4T7LMc5a
sMSfEZ9vr+fBe8oRVtOSZjY53YzxvTjonEIB6bxOn11g5ylY57TFb2GmLBusWrg8
/BVsagQj8qQR2t+blKH8h9lKz69LRpENjYhOFNeDoUHmBb3R4DtyCXJeN3bvIYWy
1tOmOLooMSvfyWOzOZFt6jRAvzA1Zk1GcE9sM0m/WZiTVOoPudGmnfsU/gGSqa9E
1I9yteqyNTciwAFdvvq6D3ADwhIUkKSF2/4a5IBVcd32OXzF2OZmpuPM0xYy6tEK
QBo1DMuuW4YYtpKVMLHE94JWq7rZvg==
=WmZg
-----END PGP SIGNATURE-----

--PMkyeU5nDe5fyzdI--

