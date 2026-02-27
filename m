Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B194FD530E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHO/fLeCPUP3HEMs804iaAIlBCU4Sub5Ndxoxq5nNTc=; b=X2mO2hiogXsQNIKoW1Hnf7FOqD
	Mn0VFvuGPUYWMsHzRYf/KjaFPpFvfqOQu64oWjDVTHNxpMHtxgvmRK96PYe51vfXkIFEs48apCj1Y
	ISl2Q7ibaEcqjQrQFDRSxTzA0uIbsJBXxv5PJgCWT0NxYIp/JFXkixtwEaFqCHNh9udnBW2oaGHmS
	3HrPoNDCZS+Emc2WpJp3v3/1whHXzNT/wi/Q8mI/NVneu74tzv0o4qKe+9behh9DK+uV40zGLPJa3
	b4c3lDipbctshawHDfw/E+NJG1PhjVDYx6NdY5JO2KTm/7SofDpZ+l1MannXE7WQ8yoZ07/lbBr03
	lNmAWxUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtla-00000008363-0Jh9;
	Fri, 27 Feb 2026 09:04:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtlY-0000000835j-2wd9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:04:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CDE74451F;
	Fri, 27 Feb 2026 09:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6E0C116C6;
	Fri, 27 Feb 2026 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772183048;
	bh=ULqmscrmRYbb7GaDQ1iw2PdzZRP98XQa3VtXm4mRQjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bV3DNDdY9xhWKrvNO/Wuy+ina1DeOPshRfqwbuTvmPjwRx4yGWjfQVOgUGjL9uVMz
	 jn9nl5F9K8IhoNQLMCgFUH+GwmMQjIB5QuGp7Bt2NGg+KO+KkooOYyQUKMC14i5Hbn
	 U+rwxMtwtNNVF6xJ8KqiYPYB8xqqE5zPgytc64riiVotu95z9lGEZbQtVqXrVuOewd
	 XNCpS2TWddFXJVBwHUJe+rl3evQjIJlQSeutsmpSHggaEe8uGS62b8/FNSMNSKTmTH
	 lmoxE/xzS2yUe7U3f8TvMsax/mz/zTfFJ6W0NylHRtRMeUr05tjwISn8pY1SmERF+f
	 D83rEBW+zmhKA==
Date: Fri, 27 Feb 2026 09:04:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi <xuelin.shi@nxp.com>,
	Alexandru Taran <alexandru.taran@nxp.com>
Subject: Re: [PATCH 3/9] dt-bindings: npu: Add bindings for NXP Neutron
Message-ID: <20260227-shakable-mummified-ba7bb54e0e05@spud>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
 <20260226-neutron-v1-3-46eccb3bb50a@nxp.com>
 <20260226-unthread-reformat-92b855c4acf9@spud>
 <16172163-8aef-4d94-be62-70e159aae182@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HGUIQTmEq3BO0PCt"
Content-Disposition: inline
In-Reply-To: <16172163-8aef-4d94-be62-70e159aae182@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_010408_763543_A3F69576 
X-CRM114-Status: GOOD (  16.24  )
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


--HGUIQTmEq3BO0PCt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 08:45:29AM +0200, Daniel Baluta wrote:
> On 2/26/26 20:20, Conor Dooley wrote:
> [..]
> >> +  - |
> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +    #include <dt-bindings/interrupt-controller/irq.h>
> >> +
> >> +    bus {
> >> +      #address-cells =3D <2>;
> >> +      #size-cells =3D <2>;
> >> +
> >> +      neutron@4ab00000 {
> > "neutron" is not a generic node name. This should be something like
> > "accelerator" or similar.
> >
> The only dts nodes I could find using accel subsystem are from rockhip. A=
nd they use npu@
>=20
> e.g:
>=20
> =BB=A0 =A0 =A0 =A0rknn_core_0: npu@fdab0000 {
> =BB=A0 =A0 =A0 =A0=BB=A0 =A0 =A0 =A0compatible =3D "rockchip,rk3588-rknn-=
core";
>=20
> Also, Ethos-U64 introduced by Rob with [1] is using npu@.
>=20
> So, I think we should go wit that. I haven't seen any document to standar=
dize the naming.

accelerator, npu, makes no difference to me, so sure.

--HGUIQTmEq3BO0PCt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaFeAQAKCRB4tDGHoIJi
0jXWAQDkJ0uqFe0zBBD97N8Nc9W1uspEgrsZpTqEwgxIVIlnKwD/SKBKuEJxP5os
9i6n1nocp64AivMzqCek95MinbTDIgQ=
=lAaA
-----END PGP SIGNATURE-----

--HGUIQTmEq3BO0PCt--

