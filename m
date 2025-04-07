Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE166C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V0lfouGxb5UozP7FtMEYe9s2GtpCHTjoBx36GD2Qlk=; b=X/vv5oInE74NZy1tz534wxPbgY
	+5rKTixlh5Qx3SrOx5qFQKwtG31jIJZUdHKxMLmtu7r7+HPt3Qf5BhVEUpMkL7qE0QL5MZdvJLDkV
	zZ81ULfS5Eoes7gMzmWD4AZtSbW/8H5BjegZF961EoEF4Wj8fSmv0/tlAQck+js8AentTcaOBpe6p
	4gc4XnNjuwGzsj7ptiV6PWGYkRpL2jxvbErcz6PxCET60osUAzmUxD/h8wCqaIzTLKpXfBj4PcUzc
	FveThKIWOSpMmsQcC+tBwDrOwBAnk51LyWpVNBQcxMAGyjLR0FQL6DZi5w5dLH8FwNb53lIpV8w6M
	viTc+jYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZ6-00000001eFR-3VUo;
	Mon, 07 Apr 2025 18:51:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pvC-00000001K1P-19Nt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 17:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9V0lfouGxb5UozP7FtMEYe9s2GtpCHTjoBx36GD2Qlk=; b=khoVxJkHtSeftNbFREHk0ALocp
	M3Xp2QgBfGCKJ2JaoIsHdafvqe7HhYwwlKqNTTaFQUpVDsbcH3+HBzYKhwtaevOeKpN1p8Y7JnWDg
	+tB/xYxQOeIkkNbmqp3icBEumyGcglMwgRv8NVK6Wb8trb6OcS0R4403a74KTTddoC6Wu/hcySpUb
	LLLpe5MgzKkZPVvrqJKRY9rLkmDcV1zncF0S4yacJO59kNoLrN1k1iPDzIp2poKo+asVrB91obs9d
	UIWxIrC90xKbPA3DNbi602Z9+Fc8/Cao1Zi51N0bZQG2UoHClJAHtK/5ItCFqI2Erw2TmKkM6Kkbu
	HiJDqAUw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pv9-0000000854j-0qc3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:06:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55B71A47E1F;
	Mon,  7 Apr 2025 17:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA755C4CEDD;
	Mon,  7 Apr 2025 17:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744045561;
	bh=9V0lfouGxb5UozP7FtMEYe9s2GtpCHTjoBx36GD2Qlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/+VevJbO6nXb6efJ/NAN8+sUvGwif2YsuAM6CyluJIekZnpnuFSQKSQ55EjvFo20
	 VJs9EUREZwI+SJ4razifPQTTg2vZb9EBpNRt3udJ9uQ+Q6H7kLXG8ykCCHBBe76/SP
	 lVG76iCG5gXA7UdNCh0QMAVb2rUHoFYYZu7O9vRij4LoqvI9Bc8BVtjmUh6KU3nDxc
	 fjWEYcJHqUvKekC2qi44aLG3mWpnyRsw5lvGsoRSNAaVKY2DdvZ0/qX0wQtl9pveq9
	 CItszg5yvM4xn9Qw7KNYGjZa2185La6hrjeYs7vVie6wMhS1VnYiX+oYVzjjQSChyM
	 3NCfzjhBou3jw==
Date: Mon, 7 Apr 2025 18:05:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	yury.khrustalev@arm.com, kristina.martsenko@arm.com,
	liaochang1@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] arm64/gcs: task_gcs_el0_enable() should use
 passed task
Message-ID: <e786824f-c339-4ebc-bdda-11c240b0e4de@sirena.org.uk>
References: <20250407161951.560865-1-jeremy.linton@arm.com>
 <20250407161951.560865-2-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dpNB0fpoEEl2bnSN"
Content-Disposition: inline
In-Reply-To: <20250407161951.560865-2-jeremy.linton@arm.com>
X-Cookie: Meester, do you vant to buy a duck?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_180603_481704_C9BD5B5E 
X-CRM114-Status: GOOD (  11.71  )
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


--dpNB0fpoEEl2bnSN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 07, 2025 at 11:19:46AM -0500, Jeremy Linton wrote:
> Mark Rutland noticed that the task parameter is ignored and
> 'current' is being used instead. Since this is usually
> what its passed, it hasn't yet been causing problems but likely
> will as the code gets more testing.

Reviewed-by: Mark Brown <broonie@kernel.org>

--dpNB0fpoEEl2bnSN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf0BfIACgkQJNaLcl1U
h9CBHgf+PvE8MD+KytGjnYRLpCcxcNcm3+mVrqBbfnyr/Jwxx/PfLhkgt5YGCuAH
spQ5q/5j0j3MjBPvdBP1xen3M3vFvsnlz1RAGK9vpbe67lLaGKioUv+5SbuepvJg
cW7KGtZINGAJRJx6OnVojBgdbCx4CY10+uLap1B0XW/wH9xadMK8o7RsmfHGwYiQ
dIGjCH2nZY128IluiEtdI7lUduVZOcvV3+ZYNypRzeHpDT7xWNlSw9InZK6W5LJg
oKGsNFEPQ3it8kKOzyhZ8yYA2YiEceXtQf3NOZlee91Zjr4JE2z3l/f6uqAEtWdx
q+yHWxpyDdVUs0gEg+xmUUQ86KwPcg==
=hlgQ
-----END PGP SIGNATURE-----

--dpNB0fpoEEl2bnSN--

