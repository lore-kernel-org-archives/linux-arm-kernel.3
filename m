Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE84EC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 16:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mr9R/vZWzqwYTjCnEi+TnE43sdFKQDE+DCRlrW5kI6w=; b=L4PuLQWJrq/wYWjytuSAnqYoRJ
	Y/5F4wfbF6TYckbQBbomOV50g8uKgug6dcvQInYa6oIy8BUyEMGRj1EnIshnWIgaukzOyZd1t2fTj
	AQk8SudjG+dYM1iB0OvNsPpKlu5Wvqns3wFiNtWt0rDNZBPY0gDPAFv1BjW8CiplTV7tqb49WkfFK
	qvR33ZiztzBaXCH5MfFZlXCabQHCUppaodForrM66O4Pr7epQVi/fJ7rEPsg6n6NSL4w9GVqAUlRl
	7AERjIcLW7VOpSr60OT1WRfK0T8EcoiTsjM4awG5KSv16e3fv0PFdrrTrDIg2LwrDqy0kzPTUyT6N
	UaS3hxbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNI0-00000008PXN-32Lk;
	Fri, 07 Aug 2026 16:19:20 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNHy-00000008PWV-2SK9;
	Fri, 07 Aug 2026 16:19:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786119544; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K0GKjJZQNPnOHDjePSuGREZI05FJypSOLeHZgpMKQyRR1NgTC60dOneQUW4Xll63zonEwVeazpiOXVz9/LISKOji9T961WqHfvETLEnSmznC+PxAL3D4DN/tFwjxykBXNaGJ/j6JVvKw/X5wX1qL2f3nJaMV7bnGiwZY9hs/TVo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786119544; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mr9R/vZWzqwYTjCnEi+TnE43sdFKQDE+DCRlrW5kI6w=; 
	b=TD2n7Opj4uQb5hmxfJ+rsqx7q/8SLYN62zrG1qyT9kmyIJei2N8uIJwvuH71kfUU+Wd58K+G8Ov3WWPpa1NVf4txnn+H+TTQx84nlIeWqRZN1nNTExyL8n61cj3VQBLca3kr+G0b55PGA0eHTjJzKLyEtpggirpzJ3kTCJRADm0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786119544;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=mr9R/vZWzqwYTjCnEi+TnE43sdFKQDE+DCRlrW5kI6w=;
	b=kHQpO1Uj89RaOq+NSlmkxU8+Cc8cPLnyWx4chvrDmpZiXbYvxD+tmrhIio6CKu41
	MHfTCxUngxdYTHBMJTWJ9+2d2st3kf/jw7NuetcMyIAC0oRdZ18PIiz5IvmZa0kqVxb
	5NtbrkMXC8GbR3a2vtSx4bU6Cyxccb8iYvaaxb6I=
Received: by mx.zohomail.com with SMTPS id 1786119540982740.1421283012713;
	Fri, 7 Aug 2026 09:19:00 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id ECAFC180895; Fri, 07 Aug 2026 18:18:56 +0200 (CEST)
Date: Fri, 7 Aug 2026 18:18:56 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Michael Riesch <michael.riesch@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 4/4] arm64: defconfig: enable Rockchip NPU support
Message-ID: <anXy1u7n-OFcQok0@venus>
References: <20260806-rockchip-defconfig-additions-v1-0-6b1d8baa0bf5@collabora.com>
 <20260806-rockchip-defconfig-additions-v1-4-6b1d8baa0bf5@collabora.com>
 <c28f33bc-bab4-4d64-9e53-007bceb4d321@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tycb5hee5jq7unt4"
Content-Disposition: inline
In-Reply-To: <c28f33bc-bab4-4d64-9e53-007bceb4d321@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/286.110.97
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091918_671906_7FD5CD19 
X-CRM114-Status: GOOD (  15.70  )
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


--tycb5hee5jq7unt4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/4] arm64: defconfig: enable Rockchip NPU support
MIME-Version: 1.0

Hi,

On Fri, Aug 07, 2026 at 07:58:51AM +0200, Krzysztof Kozlowski wrote:
> On 06/08/2026 19:24, Sebastian Reichel wrote:
> > Enable support for the Rockchip NPU, which can be used with upstream
> > mesa on many RK3588 boards, such as the Radxa Rock 5 family or the
> > Orange Pis.
> >=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
>=20
> This should be squashed with the previous ones. Do not enable item by
> item. All your three last patches do the same logical thing: enable
> multimedia drivers for Radxa Rock 5 (+ others).

IMHO this is as much one logical thing as sending a camera driver
and a video decoder as one patch would be, but I can send a v2 with
all patches squashed together of course.

Greetings,

-- Sebastian

--tycb5hee5jq7unt4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmp2BW0ACgkQ2O7X88g7
+ppnaA//VH8Rl33oLLJq04KuJNBdH+PYwHjyV0qG9cDm276Icv0hV6RpXdDaqyZS
A2qHC4C1DMN4Cu5tVbrhu6TqizeencqELehIDv+JMJSZWh0cftn7BvzY1rUWgapK
quOF4zUj7KRAJ06qyS17m4WL4oniFQ8Uk3zdf7gQAqCroympQdmo426R+RZip0ip
BNJyqEmGZnNVq4o/OComPRV3ulZjxCEj+7T7az7ddMve59+XGHMmrzQG/iFHOJwB
dDl1b7rABdMo27LPSM1VDs8/TJHdwyq4sLZGBCySUeWBVVK5Hrx6MNmPq9Jj6Ml0
BZeuyoKUASuyiHnVNW3GZBrr8USSHwxmt64TCKftJhHgGurUEHEN4n0iNzLrOha3
UznHEcguvw3PHHbAg29DlqOtksMtC/zlbTI6pmpbTeS3MflSGFkdWQ3pi7zQXPRL
M8eJqfEwgcWdKTSnaW4q99W1RHkgxt0b3zDIy2/jpb6AzwrrYjAi+ftPjjXRMSuJ
Di9vwlwbSnBNSQP4YT/SPQ8EItgjFElX/2bG/20Tf6wrQB7u3TfhV3U/MtqrakGe
nPOBpbZs8PYNs/7/+G7i2AFCWL6ts3HZ2e7S0kpa6lscRudVsQ6mFU/A2Jh5XUPK
5TnzS5TZ64FhMn6v7NXNUbCEo7akHJHTmG76M3osA17gHkPA6kU=
=jKaS
-----END PGP SIGNATURE-----

--tycb5hee5jq7unt4--

