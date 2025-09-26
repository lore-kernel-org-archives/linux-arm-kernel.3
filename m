Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A6ECAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 11:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgfeYWAxei3FO5Y9wJFrVf+vZ1amgQoeFdKCanHQzA0=; b=COsTNooN+WdsHzetG1isEW1pLi
	LZeeaHTZ4E+Vz+OyxIjcAa5UD99T7r+bthmV37053EGqYJ1jtn0/IPalSFaZx7wU76hDYdBrgKdou
	4qupwOxa0Ub8xEUGuvGHmSM8vD78+2A7r2EpTPOm8Sm92L+Ps7OOkg7EzHK/7KzelBwbs5DKT/P1k
	NaQnn5mvg6bVVyj5dKAvCcEbv2r3HCaZxhE8VFqu4Jz5F5ndkADzxTDuDLQnLfQ1khh1XDXlxeBWd
	xEOFHMAcpeMHnPHHn8HUixwf3wv5BrxDxY2mmd8CrBU+Hc49od/+mlJp0YBU+4d/eRaA2imAMwBvV
	oyhdcd8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26lt-00000000qRS-3mOd;
	Fri, 26 Sep 2025 11:37:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26lr-00000000qPj-2LG7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 11:37:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED38D419DA;
	Fri, 26 Sep 2025 11:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3EDC4CEF4;
	Fri, 26 Sep 2025 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758886670;
	bh=meuVtUA1LPUH2heOJSuuknADu9bGrGrTvWW+pcoXU94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BjZWBx2d0lMQf6lujW5938UHnDj0Dy7zGpTf3KFTc+I13iL2OHwl/ZT09wCl46Z3k
	 s/nPJmK/qp/JrHwW7L4R4yL0evyZX+3UykrlIhrnaapgyTugcVSYPJseMt1vLyDDm7
	 ro7deMBvlkhMTs6N6D6WGqN+vSvg1ojkGuq4SVnWgPBnQUIzQa/6gNmp/4hW7kfPDP
	 1o2vKEL/0XFrJLVIDlmV8Kx0LDpFSypMU/GLf3p8zOVZBMyMTYz8LIxLWHi0Z5EDPt
	 fzU0dMwHJ7zbCk12gNvVEr5tDU0jbvIVoV8wdXzSJn/RjfHEGOM6zjTxH/DHqV63c9
	 X6bmrl94+qfNQ==
Date: Fri, 26 Sep 2025 12:37:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Christian Brauner <brauner@kernel.org>,
	Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	Carlos O'Donell <codonell@redhat.com>,
	Florian Weimer <fweimer@redhat.com>, Szabolcs Nagy <nsz@port70.net>,
	Rich Felker <dalias@libc.org>, libc-alpha@sourceware.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] arm64/gcs: Support reuse of GCS for exited
 threads
Message-ID: <13c4ada9-bc32-46cc-a7b4-3def7a4e94fb@sirena.org.uk>
References: <20250921-arm64-gcs-exit-token-v1-0-45cf64e648d5@kernel.org>
 <20250921-arm64-gcs-exit-token-v1-1-45cf64e648d5@kernel.org>
 <aNVx9vlgi8t81V6Y@arm.com>
 <38d629f2-99bb-4b13-a6ed-a4126d130b1f@sirena.org.uk>
 <aNWLwkn1fJDvWUyu@arm.com>
 <41929a12-59f4-419e-9f15-eaa09f0df0f3@sirena.org.uk>
 <aNZ1jVLhc_Zg99Jb@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4ImZ3Z05RybO8Cj"
Content-Disposition: inline
In-Reply-To: <aNZ1jVLhc_Zg99Jb@arm.com>
X-Cookie: Your canceled check is your receipt.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_043751_617294_B1D73652 
X-CRM114-Status: GOOD (  16.93  )
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


--o4ImZ3Z05RybO8Cj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 26, 2025 at 12:14:21PM +0100, Catalin Marinas wrote:
> On Thu, Sep 25, 2025 at 08:00:40PM +0100, Mark Brown wrote:

> > Yeah, just I need to convince myself that we're always running the
> > exit_mm() path in the context of the exiting thread.  Like you say it
> > needs checking but hopefully you're right and the current code is more
> > correct than I had thought.

> The only path to gcs_free() is via mm_release() -> deactivate_mm().
> mm_release() is called from either exit_mm_release() or
> exec_mm_release(). These two functions are only called with current and
> current->mm.

> I guess for historical reasons, they take task and mm parameters but in
> recent mainline, they don't seem to get anything other than current.

Thanks for checking for me.  I guess some refactoring might be in
order to make all this clear.

--o4ImZ3Z05RybO8Cj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjWewgACgkQJNaLcl1U
h9CucgfzBm+/4GRXodVm5zfzNvgYFKgTeyWxa44ut0CO5vAZRgdupDDGVW7HNADQ
CRf/avO2tj4REnLqO6dOIxeFYeDJmuVAvRUleh4STLNjo58ayjUzbjW7JEpO2Thj
EgwwUhUPxwLzDEyNAu9Knt4PVzBx0hPI/AqXtS+jjEjhWMDijy7T98iJGjZ+egCr
b+cSIp/DW8wtZ9rB7JybMLCOV8ELy+rnhDXUHfcNBG1QXuw8saSsAu7GbzDRfGpa
RjEGm7vAxPJxTbmHkeThF/OMzvvjMA4qZaGrLGNpqmfGI0l8cPmG1ni+cFHv4ljm
JJXC+geWEjlK/fSO0fsXkt3SklP5
=c8l5
-----END PGP SIGNATURE-----

--o4ImZ3Z05RybO8Cj--

