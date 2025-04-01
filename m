Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A5CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/jxYKlKQRl4c7LYaZU1HrJfBEil5P4qm108AVZro4c=; b=Dw7SbIbEGzKeFOyaWxU9v6PWut
	izbnufQnkOpTxaesy/YzLUwKPSuUN7Hnr/nJ1omlmGN9LPSoymCVhasVFYOvM+S9kU2dsHr2sWkvs
	JFq9DSloX73sKUE5oXHqtleta5sO49sSz35zfBO9Dy5hOxb5BrFOsiNWNRTbohUxwx6a7YpftOxGI
	RvKOZ/mTSTLrRRu9ZXFoyBsfNeUpUC7T8Sgw2kzUo9qG5Lvm/4+VJCnmTEn9I3f4Js+g0tORdMvAg
	KKFjXdsKv7YVKhFScE6yVlxkh0z/i+SY04IIGjoLrMeg43dJtd+IX6eWfQNaaPVbrKgy3nmH/vxgb
	5zC6WdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzaDm-00000002rCj-1pB7;
	Tue, 01 Apr 2025 11:55:58 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tza5N-00000002pqH-1eEf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 11:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1743508034;
	bh=5/jxYKlKQRl4c7LYaZU1HrJfBEil5P4qm108AVZro4c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jrqAPSFGUOl7yO3IyeVgKnRyb+WDsH7EooDU/YsAm6ehn8X8Wq1gC/TZsxhnWuN+E
	 xzCoPI3JGbNHt7mU4N5udwE51U7FetigFLHAxfobOOLtzmC+CQiXj/F3K9cY1tYwlu
	 efaa4DmfymAwFm0BJRwCpEV1Ip07b/9Oxnxs6McA=
Received: from [IPv6:240e:454:8310:8bd:3bd7:3f9c:6187:a52a] (unknown [IPv6:240e:454:8310:8bd:3bd7:3f9c:6187:a52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id EFC28659C8;
	Tue,  1 Apr 2025 07:47:09 -0400 (EDT)
Message-ID: <46ed31b37b4b92720b26be66f3e6366a714024cf.camel@xry111.site>
Subject: Re: [PATCH] arm64: Add overrride for MPAM
From: Xi Ruoyao <xry111@xry111.site>
To: Anshuman Khandual <anshuman.khandual@arm.com>, James Morse
	 <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Mingcong Bai
 <jeffbai@aosc.io>
Date: Tue, 01 Apr 2025 19:47:03 +0800
In-Reply-To: <409f6d27-3efe-4c45-8319-d360ded80f16@arm.com>
References: <20250401055650.22542-1-xry111@xry111.site>
	 <409f6d27-3efe-4c45-8319-d360ded80f16@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_044717_460565_CF9DD03E 
X-CRM114-Status: GOOD (  16.74  )
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

On Tue, 2025-04-01 at 14:04 +0530, Anshuman Khandual wrote:
> On 4/1/25 11:26, Xi Ruoyao wrote:
> > As the message of the commit 09e6b306f3ba ("arm64: cpufeature: discover
> > CPU support for MPAM") already states, if a buggy firmware fails to
> > either enable MPAM or emulate the trap as if it were disabled, the
> > kernel will just fail to boot.=C2=A0 While upgrading the firmware shoul=
d be
> > the best solution, we have some hardware of which the vender have made
> > no response 2 months after we requested a firmware update.=C2=A0 Allow
> > overriding it so our devices don't become some e-waste.
>=20
> There could be similar problems, where firmware might not enable arch
> features as required. Just wondering if there is a platform policy in
> place for enabling id-reg overrides for working around such scenarios
> to prevent a kernel crash etc ?

In https://lore.kernel.org/all/87jzcfsuep.wl-maz@kernel.org/:

   > For such cases, when MPAM is incorrectly advertised, can we have kerne=
l
   > command line parameter like mpam=3D0 to override it's detection?
  =20
   We could, but only when we can confirm what the problem is.

And there was prior arts like:

commit 892f7237b3ffb090f1b1f1e55fe7c50664405aed
Author: Marc Zyngier <maz@kernel.org>
Date:   Wed Jul 20 11:52:19 2022 +0100

    arm64: Delay initialisation of cpuinfo_arm64::reg_{zcr,smcr}
   =20
    Even if we are now able to tell the kernel to avoid exposing SVE/SME
    from the command line, we still have a couple of places where we
    unconditionally access the ZCR_EL1 (resp. SMCR_EL1) registers.
   =20
    On systems with broken firmwares, this results in a crash even if
    arm64.nosve (resp. arm64.nosme) was passed on the command-line.
   =20
    To avoid this, only update cpuinfo_arm64::reg_{zcr,smcr} once
    we have computed the sanitised version for the corresponding
    feature registers (ID_AA64PFR0 for SVE, and ID_AA64PFR1 for
    SME). This results in some minor refactoring.

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

