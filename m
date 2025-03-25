Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB1BC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nrrGGAXvdOU/6+bBe7cAYVe+CFGHogtfxkU/38B0QA=; b=la6+ZCuee77soSKFtm9dcMTiUT
	P6u6DZYbMDQVE5Dn0JM+awNstzcKl5oOH3xOh7+LTXJPY+nX/JSw/V7mDzRtixBlxFRB1b/OZbEv1
	BybrctMySfz9+C1SXfd9aC4Eyadyp7dJ9HTa8JySfMTXzxPMoLbB9k86h0M+xsEzc6R3rpezQYiNM
	RnZUa/dgxauMTXMDwbdwmG0avzJ4BHxAlui3urzIsGJaFwYO5HMhgO69c7lM5eHa67q4VNjl/aXhL
	X2XbqkXaOAftj8/L01OJOBNNB1lsSp9gAsr9hgY6sPXHtYMuI2pxE7LbWC5JWgkEap46jKvZ/EDDf
	BAYkU9wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8xb-00000006icJ-3pWm;
	Tue, 25 Mar 2025 18:25:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx8vs-00000006iU7-2iVj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 18:23:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 117D95C5DCD;
	Tue, 25 Mar 2025 18:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BDDC4CEE4;
	Tue, 25 Mar 2025 18:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742927003;
	bh=wBXyK5/v+zshiQ5AJ78U67rSVAz/Ur6ZkcGgzsmTp8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Modie2getBGH7oWwsObJBFzjFv49uLHLKNDG1G/a3eAgXCOBzRiogF11g6dYAxV4/
	 XvODcc00PjgRmLF7zSjwmm0Tpd30g+oSgZG05WokPSNbP7+2y35JjcFtcuEbU6nqZQ
	 0ILc8m0lZ0zNxr6zSU2ib+ByI33v+kIhjh9OboonFyJccND/IPWG6asVgfkH2PtaZT
	 lkYBRX6318Q8hN26hmNu8ChHVoWvrZLzFwaisA98ve70kYEN2+C/m4QJhWL9IAo90+
	 k4Y/SaeRt1nL4ZRvplFOU1/TxTwxbGxeA9RVVaDXEFcSNuHuFe7Sd0OlHR7mAT4iu9
	 u8iIJ9E6D/oPw==
Date: Tue, 25 Mar 2025 18:23:16 +0000
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
Subject: Re: [PATCH 3/7] arm64: uaccess: Add additional userspace GCS
 accessors
Message-ID: <203a89bc-75d1-4ab0-ab42-52616103ad72@sirena.org.uk>
References: <20250318204841.373116-1-jeremy.linton@arm.com>
 <20250318204841.373116-4-jeremy.linton@arm.com>
 <50a0920d-3e3d-4e96-b68a-a7a0d78c3695@sirena.org.uk>
 <e8ada81d-0e10-412b-8792-035bc63113a6@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XP2AO17pHJsMVVJY"
Content-Disposition: inline
In-Reply-To: <e8ada81d-0e10-412b-8792-035bc63113a6@arm.com>
X-Cookie: Visit beautiful Vergas, Minnesota.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_112324_799974_33B3613B 
X-CRM114-Status: GOOD (  31.42  )
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


--XP2AO17pHJsMVVJY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 21, 2025 at 06:43:23PM -0500, Jeremy Linton wrote:
> On 3/19/25 8:24 AM, Mark Brown wrote:

> > A GCS load done by the hardware will verify that we are loading from GCS
> > memory (the accesses are marked as AccessType_GCS in the pseudocode
> > which is then validated in for example S1CheckPermissions()).  Sadly
> > there's no equivalent of GCSSTR so we'd need to do the permission check
> > ourselves to match this behaviour.

> Right, except that if I grab the VMA as a placeholder for the page, check to
> see if its a VM_SHADOW_STACK under any of
> map_read_lock()/lock_vma_under_rcu()/etc and then perform the access, the
> resulting possible fault will have problems with vma locking. Otherwise
> there ends up being a few different races that at the moment I've not yet
> figured out how to fix without making a big mess. For example, we can reduce
> that possible window, by reading the value/locking and checking shadow stack
> state/dropping the lock/rereading the value, or some other construct but it
> seems pointless because the suggested problem is that we might be creating a
> way to bypass some of the shadow stack security. In which case, leaving a
> little race is likely the same as leaving it wide open.

Yeah, it's messy.  The "nicest" thing I could think of was doing a GCS
store of the value we just read to validate the GCS permission but that
has very obvious ick and is in it's own way incorrect.  Since the GCS
permission is always read/write I'm not sure what would notice without
an incredibly dodgy race but it's wrong.

> Otherwise, maybe we can ignore the problem, or just refuse to allow probes
> on 'RET' instructions which seems to be the main problematic case. Although,
> given we don't really know if GCS is enabled until the probe is hit,
> SIGSEG'ing the target process is a big hammer.

Yeah, that doesn't feel like the solution.

> Ignoring it might be a valid option. I guess it could to be one of those "if
> the user puts a uprobe on a RET some of the shadow stack security is
> reduced" footguns. If an attacker can also manipulate the address space in a
> way to exploit it then its probably game over anyway. Ideally, the kernel
> would warn on this, but per the conversation around patch 6/7 that seems to
> be off the table.

I'm not completely opposed to just not doing the validation given the
pain with implementing it, it's hard to be enthusiastic about any of the
options really.  If we are going to do something other than fully
and accurately emulate then we should acknowledge what's missing and
why, at least in the changelog and probably also in the code.

--XP2AO17pHJsMVVJY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfi9JMACgkQJNaLcl1U
h9BVLgf9EGjIyA/yyo9Zc1l0VBnDeFJuL1QxPKsgq61Al37wBaxFi6YFTJp6uGYG
0frvA6r4/tMT4Tb1MTCwqp4BrIC9Iow8m17C16HRSDdG8yLxkIJgsH9nWGBZX55w
yLANK/H3BBc06kKKOYJqojJ2kjgFj+0JuD8JoKY4VUxEeUVFgv66n/LNb0+wWw5c
iRdolRJg/KGnQhYBpaWU8+A/HUEO14I/Te0DQCBe3q7DLLJhzruAW5SttcTElZDp
S4SjdGtbN3ES8fUObvqPKXq0KX/3YrsWlRmSQP9K6+PfbbmpksndRfyoNHZU8gkk
FY5l02qmP5eNnHNn3MFJ9m7WbyIcRw==
=agKn
-----END PGP SIGNATURE-----

--XP2AO17pHJsMVVJY--

