Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70694C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 23:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYdyl/xs9NszjtT8OQAgXzR0bFHdlz0ehH5k6XmLY04=; b=NX7AJOxbKhrA35vNNsUcqCwo8r
	oMOJLS66EOHeSU++Hx0ppgKwef8Tkdtj3TY/O57eMd4RTww3XscHYaOX5jUWpd5mGHCVGMjT9iE7A
	noXYbmJKQca/3gtvRFXRxBqVs5yaAYq+3SqatSx86kz9fA4cNP1K+g257oi1AQgKDLDgouPlAbaEz
	u/lwBJbVJ6obCT60anJ0lU2uZQwPduZ12Y6Q7lD9DjBQY/2FGk5gQzDqLHs89I6ModG2Vzmt505gf
	QNKujE+aU72tiDE/sz4L7+Y8fhA1Gd75nN+X63LjBp3n6+DE86mO4sIWEAT4fgFsANrIq4+BGBVgf
	qq5l+eHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07bN-00000007Q7L-1fPU;
	Wed, 02 Apr 2025 23:34:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07Jr-00000007Nsa-2QiY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:16:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C01F043EA2;
	Wed,  2 Apr 2025 23:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B875C4CEDD;
	Wed,  2 Apr 2025 23:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743635787;
	bh=gYdyl/xs9NszjtT8OQAgXzR0bFHdlz0ehH5k6XmLY04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgphsMYlcU3zJqkYe8q0MT4PirpI2icfW8R9/HgqJWypfnhoiMVw9jHpk3p5mxk5A
	 bbC8CC/rl6CBc/scGR3m3WoBwKScOJm8VMav0tTXImwzAWqBB9ic8vRRzwHuXd9jpU
	 v4RVxuZ3RjN9CKosudcoyLL/Mk4ZGD/kKwx8lfK9WoC1uquDYpshaGTYGzHFyo8P6H
	 6sc+89Cpb8iivDBZMw9Zdy89PIn2iwIYz6Np8axxOzJtMIYhXofbCe/t9KFR47pics
	 BeYDyQOMKIF8aF9DZTg9S30gb8YeoM7pEj14NddEndT3tZBqbXBbf0isZIDXDvzHN0
	 jwgklcXAgnpaA==
Date: Thu, 3 Apr 2025 00:16:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Florian Weimer <fweimer@redhat.com>, Fuad Tabba <tabba@google.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH 00/10] KVM: arm64: Backport of SVE fixes to v5.15
Message-ID: <1b4ce8d2-2e0e-49ef-ab91-4a831e22b8ed@sirena.org.uk>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S9KKK3S9kgEoh+0f"
Content-Disposition: inline
In-Reply-To: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
X-Cookie: To stay youthful, stay useful.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_161627_633986_A00EACD5 
X-CRM114-Status: GOOD (  11.10  )
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


--S9KKK3S9kgEoh+0f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 02, 2025 at 11:59:32PM +0100, Mark Brown wrote:
> This series backports some recent fixes for SVE/KVM interactions from
> Mark Rutland to v5.15.

*sigh* Forgot Greg and the stable list here - will resend, sorry for the
noise.

--S9KKK3S9kgEoh+0f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmftxUMACgkQJNaLcl1U
h9DEHAf+JffhKVeSblMyoIP9HGnMagF8mZmvHmPVPJTR2HwxahEyIsFeBvCEMc08
b4h5AANF8kjtAX/9YhBHwFmHQ3RpCcgVcJk/kPB6NcUTJ9hhtMluXBMp54Y59Fad
oUtxQyjK9p1x3zKh+Ub+KU651q10D0oMOA9C1QJAmococbJEMp4ELnlECoKqDqyv
+I29xOo+X7XAuyO+z0kxxCuPxz78sEjVycHKUyLKRLjHiQHMS+3qeKvblvKkBxkW
q/+vTWIPozAZHnPaTcFWRIqlGtGsvx2Z5Pchhlz114SZFYLLtoRi8mTf+R09nOWG
aW4ZoQt8JmuviREoFTfYhC//tTtJ4A==
=2GZQ
-----END PGP SIGNATURE-----

--S9KKK3S9kgEoh+0f--

