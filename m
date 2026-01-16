Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DE0D47CDE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uz8SRiw4IfjOx53ckfZ2h9xJeTMYhUuFqjQyqdesaBE=; b=iPgBIlp5MlaTKzTT96Cl19hGI0
	rd6ANWCW/bcUBRhO5ZQF5WblVMgccS1GzJOtjTcKtK2P+KIar4cXurBoMmlPqAQFifCw6RJ2ZaKi0
	n0asHl8TnFjrfbZGTUF8mn0hybCEgaKT1RFqwrTZcpUgmtqsPn4yGETsbrcPxhKqENu/0RPR2DYRc
	aZDimKteaRoZ9G30ItaWRRcSRLVk2v+Uc1bRqp+niSM6tE68vlkrAqvKkbH4niSfctKWmQjoq04VM
	zWtxVYLDpnpBM0alOqstMvV6yNZHfoBoD1P5h7gove5sREAAEiX/iw4oVCPmNPw24hsfc/VuCfikh
	jF/xXWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjC2-0000000E7cu-3UdC;
	Fri, 16 Jan 2026 12:44:46 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjC0-0000000E7cJ-1d6W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 12:44:45 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2b6a93d15ddso1487501eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 04:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768567483; x=1769172283; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uz8SRiw4IfjOx53ckfZ2h9xJeTMYhUuFqjQyqdesaBE=;
        b=OGE9pmOd7urs3W4jUfCaY01yEb8suTmTkUFm4agpb0+hc2dNsV3pM/xN5ue8uEN52h
         UhKdUepXJLjRcXQ9qo0C8dPcJZ4c0luQoCV8k5GHzzLYkwHfFtL59L4YxRK5q/OtuTEU
         NGzeYIOgQaA8Mp9Blp2nfjsV8P3gzRU6XUg4JpI+dN/yunKs3lDLyMcJAFLQYsdtFoyT
         aYQNAAG7mlEctQDBEfeP44FGe5Fr54fFxWO6HK3sBLvndKe1rbbpkalH6t4pBO/gQEIL
         1e+b/yaXtgJf6roN+WU4m1WvvgFLKYyaFVEkFBWYytBcULrr5yGXn+E5d+jOGxatTxQ3
         uqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768567483; x=1769172283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uz8SRiw4IfjOx53ckfZ2h9xJeTMYhUuFqjQyqdesaBE=;
        b=iBVGFdrLDO4DvQVoA6bwpDcATNPIQdiApIjDNUnM1QB5HOpqxWNVBqymlSecyN/0jx
         B8fHDAYZtsyDGpk+2Y78xLonSYrcLNY4zOny63AEhi2D7K7Ew+GSSGwB67BpiaoAh+mO
         tWXcICWnEtYfGxXcsuDmMjk8mJm2eQcF4oyzEkSkYE42sZd9gMuV8aqeg2UYlabdwCO/
         nTW97l3dga4v1fhFRvAyVq2M/PNVW9A6bkxc67EqSHcrU6bEtnQLaq0M7X7HMq++H8BT
         ah/IrrZ1qpzacJqjg4WktuH+amvDA2so67dedAlQqW4z8sSl2KCGu8MnlQz6OVX/0NWD
         izHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg7NLwXqW/f7gUvWwJ0hLmJZ+zEcQYZyy1gM+jZXUyw12CYdAqM0RobtUdLDnT5QMp7z4u46jwN87wemmJ8KYI@lists.infradead.org
X-Gm-Message-State: AOJu0YwVw6ZqFvTnH064jD1f4TxOpHgr8ekqDCL7WUAdXmXxblWeoum7
	GWDYLBdlDG5xeyyyovElutpC00NNRhBTy37veT7vbUua4Y16tKhcKJrUrCzgn8DV
X-Gm-Gg: AY/fxX7hoNp6AKGfZEul5pAYF1OcogNgCqqQ7yZXuFqje18hUT7qtP31qvMDuwEU9XD
	LbRW7fkW4racOSDq6Ph2aDYV/Q/uPmnwS2ci4DJoEtMLiliumN18R1h2b2ddGgdBDwUt9k9BCkI
	nh7+0E3YCH+WLO3eZ4JSE10TJLuCbvOrk1fISW5IEpVYkSt3DMPRzu8r15z8mMAv1kB5/vhfqGR
	q3KhCgzV1OeAf6k9D4JwKDdWA2ME23VnSCCE5/Dbcy3oLKdppOlAxWGYMFrZxBt1cGklQaEYmHI
	0oZwC6IEOuzoFcEkPH+Q3snh3pPLpX3vLwbjm/4pxQypvvKotOoR3KPyU5t+mnxbKJeYJNXr51G
	+/Z9QQdJULfqueWWF6acCjFjiMY1m/o1jsQH56A2XL92e7gTsIBgHKWf8vRddPxZ8eWlQuig5vX
	YZJZOxO5OYDBdBWtO9rVUqPrtgBDjWRnxg6ik2Lj67jFGqSXSk5KBYewNgTtEqHJYRyEzZg9kw5
	w==
X-Received: by 2002:a05:7301:3f16:b0:2ae:55f2:ad57 with SMTP id 5a478bee46e88-2b6b40f01e5mr2028389eec.29.1768567482726;
        Fri, 16 Jan 2026 04:44:42 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b36564ffsm1810021eec.28.2026.01.16.04.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:44:41 -0800 (PST)
Date: Fri, 16 Jan 2026 13:44:35 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Ashish Mhetre <amhetre@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nicolinc@nvidia.com, 
	jonathanh@nvidia.com, vdumpa@nvidia.com, jgg@ziepe.ca, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH V8 4/4] arm64: dts: nvidia: Add nodes for CMDQV
Message-ID: <aWoymh04hKXsADa-@orome>
References: <20260113054935.1945785-1-amhetre@nvidia.com>
 <20260113054935.1945785-5-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4oau3igknnhri5c2"
Content-Disposition: inline
In-Reply-To: <20260113054935.1945785-5-amhetre@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_044444_428869_DA7829C1 
X-CRM114-Status: GOOD (  16.19  )
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


--4oau3igknnhri5c2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V8 4/4] arm64: dts: nvidia: Add nodes for CMDQV
MIME-Version: 1.0

On Tue, Jan 13, 2026 at 05:49:35AM +0000, Ashish Mhetre wrote:
> The Command Queue Virtualization (CMDQV) hardware is part of the
> SMMUv3 implementation on NVIDIA Tegra SoCs. It assists in
> virtualizing the command queue for the SMMU.
>=20
> Update SMMU compatible strings to use nvidia,tegra264-smmu to enable
> CMDQV support. Add device tree nodes for the CMDQV hardware and enable
> them on the tegra264-p3834 platform where SMMUs are enabled. Each SMMU
> instance is paired with its corresponding CMDQV instance via the
> nvidia,cmdqv property.
>=20
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  8 +++
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 50 +++++++++++++++++--
>  2 files changed, 53 insertions(+), 5 deletions(-)

Applied, with the tags rearranged and the subject prefix fixed.

Thanks,
Thierry

--4oau3igknnhri5c2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqMrMACgkQ3SOs138+
s6GZWw/+PsfThyygUX03IXSU8Jsrup/oODhWPhvKjNgijz6nnSVFBhA0BA5ikMoH
FCIWEVLZKqW3QA6ftDE8V3MnYh+JPY1qW0g55q5jFthi1qtwtbL+WlMvvGPqulGx
8XYCYkYrtzg/PEx+UJi/0DP0i0BNCCCSSx4fTNDxUqpNdre3oGyD0Ac8eF0xkp90
JLv76ggCT7UX4MNuXEGGs4ndCBYlcOeO1wDkkDd8ZfkdZU8qAaOnvM4TNRocSZIU
imgVHUIRNXnaMOB29ykaxvAjah65rbv//4inrVutVTLepKoH/rT/p2ahSUHG3JIZ
DAssTp4AUCO2Ovc4CGqPBw5ORMs3TdKnKFGqyQN718EnSGmJkzwbWZ0Z1Q+FJrdN
s2RQXxLdL9ZGcu3tBm3/5j5If5VRvNo5aTc2IDhjeKsrVRPttCw6FBZfbxHcHj0M
UZls4LAAes/RnZ3XQDrUdf6mIgoOZnx70Dy5BfulONNoVf7SxE3yZGR0h02q9EVp
kJlCh9VuoS0aza6CpWY8mv6Gam171pC0VJABduWXeCfxKW0uqDIce7EOrppXT1/w
7XMvcfiSfopGB83vO4ulQ3rTPvot2fbJnm9JHrYPdnYwkDPFRs+zDeDSr3Ub/iZ/
U5J/FD1YV4AsdQfuwEDWkE8URTqex7eqUWg3i2yKHe2wZBYHb50=
=R6HJ
-----END PGP SIGNATURE-----

--4oau3igknnhri5c2--

