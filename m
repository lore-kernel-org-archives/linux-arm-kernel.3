Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC44C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 09:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiQa2P0K09njvbQ2YQr3gPhYTEh8ecgaEVkM4ZtaZMs=; b=z3Fh5qp/zcpUzjZW4uSwEh7Pxs
	J038MRmxJ7Nr2X4rAi7Yx8oVTfpJ6nbmpipV/oySr+PsM91jdpsMOd9LIENDrp5Vav3hMwmMhLMgm
	IDh+Y1NRv6CffrEkbCtprTNIXRYc04l5jnq4NooQoJWgRwhs1aKDK2vLaCawDQmaGtE7u2pQ8LS2l
	6cXMIniiufe29oO1zTqdNFVw/tesyCUEA0T0SN1ujfStga2ZndcFXwHv5WC7e+qdQPSxxTdCK5W3l
	y+pMhgm+G4EhpoGzc2leLzYswNhQ114rmin/mDr2oH2aPTOwKfO/J8pxMrDRSlp37Tbsy7XOBgKLm
	LNYE7LsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2CQ-0000000Czgf-10HZ;
	Fri, 25 Sep 2026 09:26:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2CO-0000000CzgT-2qBW
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Sep 2026 09:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LiQa2P0K09njvbQ2YQr3gPhYTEh8ecgaEVkM4ZtaZMs=; b=PFISGUjpapQbsHDTAHBX1K2h3R
	PBoMTgIFv/Ny1rhoDUEiTlKkKyPEx+09sYCtNr5GWpi6WWD5AnKbUsjWDGxdD3OLIx4V1uLVs5mPn
	tX4x2LJxitw+j3VHJC86vQEtXmiUaslAf1YnP9hSHApggVFo+8aiir7o08jaKlpcd2TrxhES/t9HF
	P5vn+KqWFID+pNavsF+dCkPPYbqwYA9twDby7K7Gpvc9v+FqEucoUHUICZMGCuPmjfwCCod+yNPPs
	qh3gjS6xnfQOM3spXvCEWLE2dIznBalxmhSdE0xde4qJgQFzzF2snQ7gC3WQvH1QbndGFyp6+sX08
	5YdEcwew==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA2CL-0000000GlbP-0J0W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 09:26:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96F3C1688;
	Fri, 25 Sep 2026 02:26:23 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23B893F86C;
	Fri, 25 Sep 2026 02:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790328387; bh=3kjd6lZj1dIUtedJktMj1UoleqR9/JbTLWiLSRcewj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TG6UsdHMPSeGq8RWseV0KrNzFW1yYNZcoAhoPJb+pCuWrkSYVje8gJNRx200IDpVW
	 AFFAKsMlumA3VQnJEnAvDx8FX7Sjjgm2LcTqHUMe/7RhcQzVIqgB7be3ZWQudoZp4v
	 jjROSC6mVXc8ucrhayAS/kPSypertZMowkz/8mu4=
Message-ID: <e78a2a94-ab4e-4c5f-8e55-e11b273ed8ec@arm.com>
Date: Fri, 25 Sep 2026 10:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: mpam: Document when to set arm64.nompam
To: Fuad Tabba <fuad.tabba@linux.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, James Morse <james.morse@arm.com>,
 Xi Ruoyao <xry111@xry111.site>, Marc Zyngier <maz@kernel.org>,
 Bradley Morgan <brads@mainlining.org>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260908145622.2828319-1-fuad.tabba@linux.dev>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260908145622.2828319-1-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_102629_456552_3AD6B39F 
X-CRM114-Status: GOOD (  11.45  )
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

Hi Fuad,

On 08/09/2026 15:56, Fuad Tabba wrote:
> arm64.nompam skips the MPAM2_EL2 and MPAMHCR_EL2 writes in
> finalise_el2_state and leaves the ARM64_MPAM cpucap unset. Where EL3
> firmware has cleared MPAM3_EL3.TRAPLOWER, the EL2 trap controls are
> left unwritten, at reset values that are UNKNOWN, and KVM still hides
> MPAM from the guest but no longer enables the traps that stop a guest
> from using it. KVM never saves or restores MPAM0_EL1, MPAM1_EL1 and
> MPAMSM_EL1, so what one guest writes reaches the next guest and the
> host. Nor can the kernel make the EL2 writes unconditionally: they trap
> to EL3 on the firmware the option exists for, and TRAPLOWER cannot be
> read below EL3.
> 
> Say so in mpam.rst, and add the rule and a pointer to the
> kernel-parameters entry.
> 
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Link: https://lore.kernel.org/all/CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com/
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben


