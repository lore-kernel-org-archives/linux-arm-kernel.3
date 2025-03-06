Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9A0C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gI6MH74pu/dRhk5X72FUXHDVuktiWcOf6ajc9zt5WpA=; b=QrNfA6CqWEOByIollFUkh+OP/5
	yiDnxOhvJnXVFMxurH4rfpZDX68kS0mqW1zVp47m4kV8UuQm1Aas0GBpUfWHc1xIK1epfT4qrwTh3
	1Yc0uCn/BdsNEXFcCyaJfmce3CS5bFOnNvQWkMflBXykkDotmCP3+o0/qkBO0O/uOSgxrcYI1584r
	YX8DUSviDoLuoxJ+qFug0k6UP+LdpSXTX1Y7zCm60AlMjKpDeXhCse736lI/rYGClZxxos1KrEVle
	EgSUlZpw9vWH6z27mySRmo9tUdX6KWNuyWnEzfWDGIcSRdWY9r9r6AhXmcQdufFOFRHvUEwkiyav/
	sGfSkmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIIv-0000000CBt9-0dFd;
	Thu, 06 Mar 2025 20:58:53 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqICp-0000000CAde-1MTM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 20:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741294355; x=1772830355;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=9/k5vAQPlllkqeoVC6KPl7jGub6QSCj8r/sPKoAFx1g=;
  b=f/8EM43Z96l6d9i2Ni3p5VPnKMkH/LM2+klpareB/MseZ9iYPf5umpH1
   SjrOpl3grg/dSRgp1TehLpzFuS3i6tZJfaO0ZRTWQQzezIKvLhbJ5ACZs
   kVkffT9QRfwmXqvRsfwVHfzZNVOK+g4+ie60993rOXfrqpfl7esagz69M
   nmRBBhTp07bWuxRRQKwS1D6nAlxnxPSGrow2J/FdNAlgcotrgSN8Fw7tZ
   IZxFC4rNWbCxyXq8BSidQSh5LxT19cFj9+gsfsQEeYDzzyWfmwUjAobjl
   fvxDAOAY2JzQMaqLqAaOA5f8ZURKTEtFhJim96CgJwePkOqhdUho9/mpo
   A==;
X-CSE-ConnectionGUID: LAelcqvKQ+WeQ78Etuysgg==
X-CSE-MsgGUID: eERh5fY2TZaZIoBHdnN+iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="45135678"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="45135678"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 12:52:32 -0800
X-CSE-ConnectionGUID: NWY+K21hQYiBE5DOFr55fw==
X-CSE-MsgGUID: sBEcyVq0Q/OUlTi1Db5nYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="156354902"
Received: from linux.intel.com ([10.54.29.200])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 12:52:32 -0800
Received: from [10.54.75.34] (debox1-desk1.jf.intel.com [10.54.75.34])
	by linux.intel.com (Postfix) with ESMTP id 455C920B5736;
	Thu,  6 Mar 2025 12:52:31 -0800 (PST)
Message-ID: <257769403908de3ac6271059e1febee88654fbdc.camel@linux.intel.com>
Subject: Re: [PATCH net-next v9 5/6] net: stmmac: configure SerDes according
 to the interface mode
From: "David E. Box" <david.e.box@linux.intel.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>, Andy Shevchenko
	 <andy.shevchenko@gmail.com>
Cc: Simon Horman <horms@kernel.org>, Jose Abreu <joabreu@synopsys.com>, Jose
 Abreu <Jose.Abreu@synopsys.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, Rajneesh
 Bhardwaj <irenic.rajneesh@gmail.com>, David E Box <david.e.box@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Richard Cochran
 <richardcochran@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,  netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 06 Mar 2025 12:52:31 -0800
In-Reply-To: <d7c0094e-7fd3-4113-8d00-91b7a83ffd1f@linux.intel.com>
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
	 <20250227121522.1802832-6-yong.liang.choong@linux.intel.com>
	 <Z8lLm9Ze9VAx3cE_@surfacebook.localdomain>
	 <601c88fb-8ec8-4866-a45d-f28dea6d9625@linux.intel.com>
	 <CAHp75VeOKbAsvSuf5+VQnGFmUcN92TNnR2eF1+70h3PjaMdMqA@mail.gmail.com>
	 <d7c0094e-7fd3-4113-8d00-91b7a83ffd1f@linux.intel.com>
Autocrypt: addr=david.e.box@linux.intel.com; prefer-encrypt=mutual;
 keydata=mQENBF2w2YABCACw5TpqmFTR6SgsrNqZE8ro1q2lUgVZda26qIi8GeHmVBmu572RfPydisEpCK246rYM5YY9XAps810ZxgFlLyBqpE/rxB4Dqvh04QePD6fQNui/QCSpyZ6j9F8zl0zutOjfNTIQBkcar28hazL9I8CGnnMko21QDl4pkrq1dgLSgl2r2N1a6LJ2l8lLnQ1NJgPAev4BWo4WAwH2rZ94aukzAlkFizjZXmB/6em+lhinTR9hUeXpTwcaAvmCHmrUMxeOyhx+csO1uAPUjxL7olj2J83dv297RrpjMkDyuUOv8EJlPjvVogJF1QOd5MlkWdj+6vnVDRfO8zUwm2pqg25DABEBAAG0KkRhdmlkIEUuIEJveCA8ZGF2aWQuZS5ib3hAbGludXguaW50ZWwuY29tPokBTgQTAQgAOBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEH7Mry1gl3p/NusIAK9z1xnXphedgZMGNzifGUs2UUw/xNl91Q9qRaYGyNYATI6E7zBYmynsUL/4yNFnXK8P/I7WMffiLoMqmUvNp9pG6oYYj8ouvbCexS21jgw54I3m61M+wTokieRIO/GettVlCGhz7YHlHtGGqhzzWB3CGPSJMwsouDPvyFFE+28p5d2v9l6rXSb7T297Kh50VX9Ele8QEKngrG+Z/u2lr/bHEhvx24vI8ka22cuTaZvThYMwLTSC4kq9L9WgRv31JBSa1pcbcHLOCoUl0RaQwe6J8w9hN2uxCssHrrfhSA4YjxKNIIp3YH4IpvzuDR3AadYz1klFTnEOxIM7fvQ2iGu5AQ0EXbDZgAEIAPGbL3wvbYUDGMoBSN89GtiC6ybWo28JSiYIN5N9LhDTwfWROenkRvmTESaE5fAM24sh8S0h+F+eQ7j/E/RF3pM31gSovTKw0Pxk7GorK
	FSa25CWemxSV97zV8fVegGkgfZkBMLUId+AYCD1d2R+tndtgjrHtVq/AeN0N09xv/d3a+Xzc4ib/SQh9mM50ksqiDY70EDe8hgPddYH80jHJtXFVA7Ar1ew24TIBF2rxYZQJGLe+Mt2zAzxOYeQTCW7WumD/ZoyMm7bg46/2rtricKnpaACM7M0r7g+1gUBowFjF4gFqY0tbLVQEB/H5e9We/C2zLG9r5/Lt22dj7I8A6kAEQEAAYkBNgQYAQgAIBYhBBFoZ8DYRC+DyeuV6X7Mry1gl3p/BQJdsNmAAhsMAAoJEH7Mry1gl3p/Z/AH/Re8YwzY5I9ByPM56B3Vkrh8qihZjsF7/WB14Ygl0HFzKSkSMTJ+fvZv19bk3lPIQi5lUBuU5rNruDNowCsnvXr+sFxFyTbXw0AQXIsnX+EkMg/JO+/V/UszZiqZPkvHsQipCFVLod/3G/yig9RUO7A/1efRi0E1iJAa6qHrPqE/kJANbz/x+9wcx1VfFwraFXbdT/P2JeOcW/USW89wzMRmOo+AiBSnTI4xvb1s/TxSfoLZvtoj2MR+2PW1zBALWYUKHOzhfFKs3cMufwIIoQUPVqGVeH+u6Asun6ZpNRxdDONop+uEXHe6q6LzI/NnczqoZQLhM8d1XqokYax/IZ4=
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-3.fc39) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_125235_400883_71DC748D 
X-CRM114-Status: GOOD (  26.57  )
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
Reply-To: david.e.box@linux.intel.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 2025-03-06 at 20:56 +0800, Choong Yong Liang wrote:
>=20
>=20
> On 6/3/2025 5:05 pm, Andy Shevchenko wrote:
> > On Thu, Mar 6, 2025 at 10:39=E2=80=AFAM Choong Yong Liang
> > <yong.liang.choong@linux.intel.com> wrote:
> > > On 6/3/2025 3:15 pm, Andy Shevchenko wrote:
> > > > Thu, Feb 27, 2025 at 08:15:21PM +0800, Choong Yong Liang kirjoitti:
> > ...
> >=20
> > > > > config DWMAC_INTEL
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default X86
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on X86 && STMMAC_ETH && PC=
I
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on COMMON_CLK
> > > > > +=C2=A0=C2=A0=C2=A0 depends on ACPI
> > > > Stray and unexplained change. Please, fix it. We don't need the
> > > > dependencies
> > > > which are not realised in the compile time.
> > > The dependency on ACPI is necessary because the intel_pmc_ipc.h heade=
r
> > > relies on ACPI functionality to interact with the Intel PMC.
> > So, that header has to be fixed as ACPI here is really unneeded
> > dependency for the cases when somebody (for whatever reasons) want to
> > build a kernel without ACPI support but with the driver enabled for
> > let's say PCI device.
> >=20
> >=20
> > -- With Best Regards, Andy Shevchenko
>=20
> Hi Andy,
>=20
> Thank you for your feedback, Andy.
> I appreciate your insights regarding the ACPI dependency.
> The intel_pmc_ipc.h header is under the ownership of David E Box, who=20
> focuses on the platform code, while my focus is on the netdev.
>=20
> Hi David,
>=20
> if you could kindly look into making the ACPI dependency optional in the=
=20
> intel_pmc_ipc.h header, it would be greatly appreciated.
> I am more than willing to provide any support necessary to ensure a smoot=
h=20
> resolution.

Choong you only need put the function under a #if CONFIG_ACPI block and pro=
vide
an alternative that returns an error when the code is not build. Like this,

#if CONFIG_ACPI
static inline int intel_pmc_ipc(struct pmc_ipc_cmd *ipc_cmd, struct pmc_ipc=
_rbuf
*rbuf)
{
   ...
}
#else
static inline int intel_pmc_ipc(struct pmc_ipc_cmd *ipc_cmd, struct pmc_ipc=
_rbuf
*rbuf) { return -ENODEV; }
#endif

David

>=20
> This patch series has already been accepted, but we recognize the=20
> importance of addressing this issue in the next patch series for upstream=
.
> Our goal is to ensure that the driver can be compiled and function=20
> correctly in both ACPI and non-ACPI environments.
>=20
> Thank you both for your understanding and collaboration.


