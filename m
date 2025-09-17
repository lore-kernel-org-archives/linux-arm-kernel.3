Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75E5CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 22:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znX0wfJrHVXZiPMAukCX4OIy8l6PjtgaOLRfY5RPUME=; b=zxNqt8Y5N+rO8HYrYwiadXiDpV
	QrNXVGRxQgo5fluxstSQQ0bMRaWAQA5+xOcyWsuo604GUQqJAE6Ccr4yg/6sfzMeCutKw1ID+EdKY
	8eovVWk66KgmCfhdDN6vpLzARR7XMXdW0M1TaUalCCYg/l5SPuKuSj+kg24Nl3mST3TbNf+LaWHmq
	veNuTDxFM3dqKNqzkHdKew6+8QMEW4qIGRIj+Lv7h5NCvMcbeJTGzAPohxaa1hpT6CICixrSD3Wl9
	ehWmMSo0fTwt+qvhGJpDwkdePoyYNjBzt9Dc8V9ANWNS4jvi23NuGUWYjihn+2ghj2MErcw4Qr5Wt
	r73cOUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0hh-0000000FHB0-0oRM;
	Wed, 17 Sep 2025 22:32:45 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0he-0000000FH9a-0Hp6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 22:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758148355; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bCxyIqp89NV/9zp2f1W2doyMdsW5a/oS4lHZ6EeW7CIVSZJR3aIjv2fT5j5HFR8e+Et+ze+qKPlgEeI8dLsFenFbRliSQ7DUrQbxbm1gqtdlUvLn6kmtTB6O9ynP3CeL7eBdbmf1+GQ233o+OLAkNSoOYO4HxwihjbCUPtDUdY8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758148355; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=znX0wfJrHVXZiPMAukCX4OIy8l6PjtgaOLRfY5RPUME=; 
	b=D4vjkZ13IGJMfMK1SzTSj2iqAyRlwmI8BPfBRAEf9du6ZXpwTx3GD8VlYyupTwad9Xtet9GvovcjsfLEeX/pjW/PVLpPlFgC+WvsH8WlrvaTLGVobapLof7wgFswAeGHaaiEHqkIdi+XzM0sjdfL3mcmM3dUVUsxxWhHI9JZYr4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758148354;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=znX0wfJrHVXZiPMAukCX4OIy8l6PjtgaOLRfY5RPUME=;
	b=f1wkZLCFtAO+8kdrY433OzA3P2THDnewPONSmGOqI3YoNAs84dlGmmgdtHy0XGy6
	fL/yaQn62HWHREgrRFovuT3orQmII9a8V+VEqJx8EqjsIVAjPgiip48sSZyrN9yUs3E
	CgSkItHQ3t+73NpUDSqDeITKX78KN6n7AnDUqOCw=
Received: by mx.zohomail.com with SMTPS id 1758148351679297.874876738947;
	Wed, 17 Sep 2025 15:32:31 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 9E3BF18067C; Thu, 18 Sep 2025 00:32:24 +0200 (CEST)
Date: Thu, 18 Sep 2025 00:32:24 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Stephen Boyd <swboyd@chromium.org>, Andre Draszik <andre.draszik@linaro.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v14 02/10] power: reset: reboot-mode: Add device tree
 node-based registration
Message-ID: <wsig6dm7jbnx2pzt5l3uhhgywsa4jsdyunmd5aqn43bbciqiov@4y6mnd25pbeg>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-2-37d29f59ac9a@oss.qualcomm.com>
 <in6bqvemnscvuxbumpxogxiiav7odmsc3iazktifninh6iqen7@qwhrhdidcx7y>
 <3c56cd00-770f-019a-d93b-5ebaa6b9374d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="luhwbfkc5nm4f2sl"
Content-Disposition: inline
In-Reply-To: <3c56cd00-770f-019a-d93b-5ebaa6b9374d@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/258.96.42
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_153242_176111_A1FD177E 
X-CRM114-Status: GOOD (  26.62  )
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


--luhwbfkc5nm4f2sl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v14 02/10] power: reset: reboot-mode: Add device tree
 node-based registration
MIME-Version: 1.0

Hi,

On Wed, Sep 17, 2025 at 09:59:44PM +0530, Shivendra Pratap wrote:
> On 9/17/2025 12:18 AM, Sebastian Reichel wrote:
> > On Fri, Aug 15, 2025 at 08:05:07PM +0530, Shivendra Pratap wrote:
> >> The reboot-mode driver does not have a strict requirement for
> >> device-based registration. It primarily uses the device's of_node
> >> to read mode-<cmd> properties and the device pointer for logging.
> >>
> >> Remove the dependency on struct device and introduce support for
> >> Device Tree (DT) node-based registration. This enables drivers
> >> that are not associated with a struct device to leverage the
> >> reboot-mode framework.
> >>
> >> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> >> ---
> >=20
> > Please use fwnode instead of device_node, so that the same thing
> > can be used with non DT setups, if that becomes necessary. Otherwise
> > LGTM.
>=20
> To be more clear on this, have one question: the current unmodified
> design of reboot-mode is dt based:
>=20
> struct device_node *np =3D reboot->dev->of_node;
> and then parses the node using for_each_property_of_node(np, prop).
>=20
> We want to refactor reboot-mode to support non-DT setups by adding
> support for fwnode-based approach (struct fwnode_handle *fwnode)?
>=20
> Can you please explain a bit? Some more details would be helpful to
> make the change.

It's fine to keep using of_node internally. But the external API
(include/linux/reboot-mode.h) should use fwnode. Just like the
current external API is not DT specific as it just gets a struct
device. This keeps the external API somewhat ready for non-DT users
and avoids having to change all API users again in the future.

Greetings,

-- Sebastian

--luhwbfkc5nm4f2sl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmjLNvEACgkQ2O7X88g7
+poQJA//S0EEioAN/VF4J/lYtmOcBv99Crrgs/3l9I46szqCWPOAqla+K3ns0A8U
3djWdGcDMNenrYhJ3ZjC0xgGi1YGTN4Q6IjfwWqOP9oo44mFt7A8QxoautbyjIs+
8z0yFHFroRs2jYwHGKT1fygXnRIlqjQ/k9xyeCU588/TLKXON/fZFt2B659i0Jg4
bkZGhdngcA7xp5rcXzgf7MfdvawEGJF5psr31yfb6KyB0qUffc8R6tEy/l0VJdSW
HPA2cp8+f2/9V9MIMHLANsy7BP4giRS8K7Iwh5cFLIVPpVcGk6HOjcoF4qIRk4NF
xYQmK9MS1U84txNiagtw9viFMKdQVd4xxJa3zMZPsQLBOh8rD06y7MLbAz2StI+7
cFvDgoClE8QeFphHAAL6I38JSFKp2PIbqJNZReetSiN9yg9DZusxR0uwHyCcuIA3
AVQricmFanjiTPKekGMU56Va6Bnfo13APfYCrhgZhobpi+JBq560TCZJ/kFCB79L
6hKEuUw42eKIzjYdvRgr16ElQMZ2WFQsHPH3vVPDp/gxV8nycR6eMhokGm9VgguA
0ma/I1zagFBmThPhlA5EGGKMVsFKUpKIeqMBk0eY4D3ZbiJtap+Ypd9uyGCoPBtg
OS57Q5OEWiEqUdw6WxSRb5btgwEuXF/+uJP3DXxJuw8cziP3coc=
=iDeP
-----END PGP SIGNATURE-----

--luhwbfkc5nm4f2sl--

