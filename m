Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF23C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 07:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNyMNq0Sztwv4vKDhGfFbMXIy/g1nHUCGUIykQmuxWc=; b=DuDcYKuAWTzvvvEflJ6d/qQVDy
	V3xgfbqRSm9S7nZL15LXWQEImSS764MTO7v8oeXKNdvHuMwNTTgtAbf78odS4VLCs+XC255NtGsp0
	yhs/8D9sVMH/KJZLlw2q2SrgxDMIdQ/VpYKq+JJ/B86fO56vWtF+Ffbxfgl94gRxS4HM7J8J2P6bT
	kfe+gBkh/p/tr8euvhk9LSRrlGo/+RhZfZdYf6be15rxh+aUsemsD3tkJtHz02Im8fgS4VKLw7bp7
	N0aX6iGOzzzMTAW7etyaiw6sSirGOVX1R9t/4aNyzZWd/sl14/J7xvSxYX5ooQ8Yyrpk8tA8GOA4b
	5T+4r2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpLI-0000000GC6o-35lo;
	Tue, 25 Feb 2025 07:27:00 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpJl-0000000GBwd-3Vfx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 07:25:28 +0000
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 72696114016E;
	Tue, 25 Feb 2025 02:25:23 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 02:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740468323;
	 x=1740554723; bh=iNyMNq0Sztwv4vKDhGfFbMXIy/g1nHUCGUIykQmuxWc=; b=
	Crrc19jdVh7/XBZAtR/NMXS4XDxP15gWTLHCfBDvQS676Lg8rynDp3eHsGxkQzOL
	NA6+6MAjUiLoPQmu2RiInQC2bPTzaEHZhxFhtAxG2nKrgD7yJhCiJ8Mt9IiufWsV
	fPYYYk3p5Lcd5wsAIlI2JQk1MLZqu4oPDJasJheax161IJ46K91fFfPtJDj5SbM9
	T0hntAh8i6J0zAFYKwdj1gkrvLFe4deGMjOv2P5WVvP4N4BSrELOBLc708mfUPHI
	43UjhAa34yyhwVHf7ypmWXQX7TAxCgyOweBC5H7/+C7Gg2vuf7hs7iJekp2//I2n
	Jvica6vniO0L8eUGctctwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740468323; x=
	1740554723; bh=iNyMNq0Sztwv4vKDhGfFbMXIy/g1nHUCGUIykQmuxWc=; b=w
	hzV6Y3hj5gWp/iDMqIx98JPoZOcwRLI9d1i8zlOU/RAUy+7IN5uPMPBjab2NCQyd
	LMkj8W6q1/gHgLHDo98I6REoWQ/IUlycP4gdzmxqrs5rcWd4rE0QTrqe/Qq7ipcR
	1TukjGbHToX6OBLGcTfynSUtg3pNqUrMJsH86ZMon4tgVd+2U1H1kYo2UhyvUMtK
	CQVql3lLJY9IZSvDdmpfF/B6UYL6tVYb1VwSb36/JmunHby+rrqYNWFvnfPklsV9
	W3GQb+SCgqfTcQp6qF5/y02gx4enLl5etsFLUDfQEOKg7vDo/I3wk5qWMiRSnz2E
	A1qzcH81WGbVu17pqlUyw==
X-ME-Sender: <xms:YnC9Z5OsvGdCkLa8wabjaJTLcmVWPy5Wdd2Ke6lK7Dgz_iTRXyrtyw>
    <xme:YnC9Z7-o24c8cmpv9z2zXbEtBtMS6U1bIeklSCOAeb2rH1Aw6X5r2okyM9s4a7b1D
    i42G82D6MsV7ZDpwpI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekuddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddv
    geejvdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeef
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpd
    hrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphht
    thhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhrtghpthhtoheptghonhhorh
    doughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlphhivghrrghlihhsiheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifvghirdhl
    ihhusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorh
    hg
X-ME-Proxy: <xmx:YnC9Z4TLllvXzTwlowYa5Jl6FRZHwh6ru6z9sep9rQhEYu4E3BZ9YQ>
    <xmx:YnC9Z1uroNTLiTE5A1YAFBUh0k6-cPSW_lmVz7j_174A7gOMX1F-pA>
    <xmx:YnC9Zxd8hAA5ROl-8MVUO9kMTxx065-aCcG2Kcv_6QaygErRfoifPA>
    <xmx:YnC9Zx0cABgPWS_vwgD1TtiRl_Bgj3jIOVHMSFv_zLyLLtjt_krAXw>
    <xmx:Y3C9Z3G9Q7Jowr_Z_hgrXH8Sz7iSue9CIWALq-YXJHQQDGYgj76VkLzo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 16C1B2220072; Tue, 25 Feb 2025 02:25:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 08:24:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Roman Kisel" <romank@linux.microsoft.com>
Cc: benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com,
 bhelgaas@google.com, "Borislav Petkov" <bp@alien8.de>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Dexuan Cui" <decui@microsoft.com>,
 "Haiyang Zhang" <haiyangz@microsoft.com>,
 "H. Peter Anvin" <hpa@zytor.com>, krzk+dt@kernel.org,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Rob Herring" <robh@kernel.org>,
 ssengar@linux.microsoft.com, "Thomas Gleixner" <tglx@linutronix.de>,
 "Wei Liu" <wei.liu@kernel.org>, "Will Deacon" <will@kernel.org>,
 devicetree@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, x86@kernel.org
Message-Id: <55b65ba6-4abe-478c-a173-4622c30ddd7b@app.fastmail.com>
In-Reply-To: <14a199d8-1cf3-49bc-8e0d-92d9c8407b4f@linux.microsoft.com>
References: <20250212014321.1108840-1-romank@linux.microsoft.com>
 <20250212014321.1108840-2-romank@linux.microsoft.com>
 <1b14e3de-4d3e-420c-819c-31ffb2d448bd@app.fastmail.com>
 <593c22ca-6544-423d-84ee-7a06c6b8b5b9@linux.microsoft.com>
 <97887849-faa8-429b-862b-daf6faf89481@app.fastmail.com>
 <6e4685fe-68e9-43bd-96c5-b871edb1b971@linux.microsoft.com>
 <14a199d8-1cf3-49bc-8e0d-92d9c8407b4f@linux.microsoft.com>
Subject: Re: [PATCH hyperv-next v4 1/6] arm64: hyperv: Use SMCCC to detect hypervisor
 presence
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_232526_785920_30B559A1 
X-CRM114-Status: GOOD (  22.93  )
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

On Tue, Feb 25, 2025, at 00:22, Roman Kisel wrote:
> Hi Arnd,
>
> [...]
>
>>> I would suggest moving the UUID values into a variable next
>>> to the caller like
>>>
>>> #define ARM_SMCCC_VENDOR_HYP_UID_KVM \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 UUID_INIT(0x28b46fb6, 0x2ec5, 0x11e9, 0xa9,=
 0xca, 0x4b, 0x56,=20
>>> 0x4d, 0x00, 0x3a, 0x74)
>>>
>>> and then just pass that into arm_smccc_hyp_present(). (please
>>> double-check the endianess of the definition here, I probably
>>> got it wrong myself).
>
> I worked out a variation [1] of the change that you said looked good.
>
> Here, there is a helper macro for creating uuid_t's when checking
> for the hypervisor running via SMCCC to avoid using the bare UUID_INIT=
.=20
> Valiadted with KVM/arm64 and Hyper-V/arm64. Do you think this is a
> better approach than converting by hand?
>
> If that looks too heavy, maybe could leave out converting the expected
> register values to UUID, and pass the expected register values to
> arm_smccc_hyp_present directly. That way, instead of
>
> bool arm_smccc_hyp_present(const uuid_t *hyp_uuid);
>
> we'd have
>
> bool arm_smccc_hyp_present(u32 reg0, u32 reg1, u32 reg2, u32 reg2);
>
>
> Please let me know what you think!

The patch looks correct to me, but I agree it's a little silly
to convert register values into uuid format on both sides.

>   static bool hyperv_detect_via_smccc(void)
>   {
> -	struct arm_smccc_res res =3D {};
> +	uuid_t hyperv_uuid =3D HYP_UUID_INIT(ARM_SMCCC_VENDOR_HYP_UID_HYPERV=
_REG_0,
> +		ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_1,
> +		ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_2,
> +		ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_3);

If you want to declare a uuid here, I think you should remove the
ARM_SMCCC_VENDOR_HYP_UID_HYPERV_REG_{0,1,2,3} macros and just
have UUID in normal UUID_INIT() notation as we do for
other UUIDs.

If you want to keep the four 32-bit values and pass them into
arm_smccc_hyp_present() directly, I think that is also fine,
but in that case, I would try to avoid calling it a UUID.

How are the kvm and hyperv values specified originally?
From the SMCCC document it seems like they are meant to be
UUIDs, so I would expect them to be in canonical form rather
than the smccc return values, but I could not find a document
for them.

     Arnd

