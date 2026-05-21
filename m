Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61BBCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJiYGSKR2Xooa6md+cNozvBYHksgw4v8W3oMC6Zadps=; b=1LR75A6C+hPr8eHyI+j26GWU2f
	8BJJtbQlbk/nGyjEnH1RNNR1fwXfOte9OtkS+WI64gJaa4Fav9WOjZ3wlItim68FB8pgIEA3d+yqx
	5xHoxHVS3rlFg7e/CZWHCDYxZ4jW/BEl+1Z0Fa+p+rYxWfe033VQAcddpMJaTXf3MyKrkg5dWGoY4
	65QpBkGI1YCyxrDscJLTe/zVkktLhHQHcx3PL+LBzxiQ2SgFrVTukb1DGIyGnc3Fp4Dv6313KGwd1
	Pr1cxonL4sW/8hvDetXJMr7mO7A9ZyQAxnMrRfGRoW5TkXCe9BX+/9fIvSzQjYs2+FovwPOmszCyW
	j2WoL7rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ59A-00000008Ha7-3zCM;
	Thu, 21 May 2026 15:17:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ598-00000008HZZ-38g0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:17:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3038742D86;
	Thu, 21 May 2026 15:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFB51F000E9;
	Thu, 21 May 2026 15:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779376634;
	bh=MJiYGSKR2Xooa6md+cNozvBYHksgw4v8W3oMC6Zadps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ggBnNLigs+MYrxcu3lkCl0NI75vfveOsqe4q67/PhDS1RaXR4+2Zv3GULwDgmR7pb
	 BdTOtrlx5wp0bS3CRX3bydNnTPl01m16gQ8/vQsgCZ3+XJjvcgD+4fVOe6s+DBeF9y
	 ZWhgzPOy5g0VUrJJzGemtXk5IKlKEX/1y8Il2sa/6vVpK+oskajCWBR6/v0Y67RHmo
	 jGBZdODmOBVw4hszRgTDNBL9jHeO27Qs39KrV9s/+JFnsnDWld9FBZqi03a1LxBEtO
	 kEdRmpypvICqFDlrqvVzlwF9Q0InHB5D14eiorpUW1ivnacAuMd21zXtvg/rNjtET8
	 qYjid3+pNnDNw==
Date: Thu, 21 May 2026 16:17:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
	Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 19/30] KVM: arm64: Provide assembly for SME register
 access
Message-ID: <a5226b77-636d-4e6d-acb6-b26f6276f6bd@sirena.org.uk>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-19-43f7683a0fb7@kernel.org>
 <ag8b7oq4SFpdmlP_@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XnCLFiWrG4EBMfBq"
Content-Disposition: inline
In-Reply-To: <ag8b7oq4SFpdmlP_@J2N7QTR9R3>
X-Cookie: No shirt, no shoes, no service.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_081714_806359_F6072157 
X-CRM114-Status: GOOD (  14.14  )
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


--XnCLFiWrG4EBMfBq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 03:51:26PM +0100, Mark Rutland wrote:

> While this specific instance is simple enough, I don't think we should
> continue to duplicate the low level save/restore routines between the
> main kernel and KVM hyp code.

> I've sent a series that avoids the need for this, and cleans up some
> other bits):

>   https://lore.kernel.org/linux-arm-kernel/20260521132556.584676-1-mark.rutland@arm.com/

> Assuming Marc and Oliver are on board, I'd prefer that we do that
> cleanup first, and build the KVM SME support atop.

Yeah, I've got a laundry list of things that I want to improve with both
the main kernel and KVM but the latency on getting anything reviewed
with both sides and sometimes obscure implementation decisions means
I've been waiting until this is landed first.

--XnCLFiWrG4EBMfBq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoPIfIACgkQJNaLcl1U
h9CJpwf+PVTKcbGobSIt2V1nPmtForFYSfILfE++Ovngx/OIzlSmVFC52be0sVWq
kOnhNIA8nT6/F4EXTWuc1tbEkCuxa2iPJ7VTwNvtKU35QL7roJNU4Cap+A3yHPkL
0C/+LQIXheQka+i6fCoqMXIWTz625keaedSH5XBMS2ktxjK+Oyka5XiUJqPmyVeQ
YSbd87c6rzpbn+C7p4RPZX+FwVm05w/yUoAloztHmd5GqsAr8NgEJoe8uOFd4Fe4
hoGcpIgfvhM/oqMQAXtLvCEmyPSKuDc70RM7Y3KDnvyiWQfnXh/ftNYqspba9Oic
Ii8HVtxvR6JE450ekIq13Rx4A9d0Ug==
=JOnr
-----END PGP SIGNATURE-----

--XnCLFiWrG4EBMfBq--

