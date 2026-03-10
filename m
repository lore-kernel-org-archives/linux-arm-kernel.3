Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7968EFCC9DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6mbdjmVIwUUAco7q5KTIV1hgiOZLKIqNBms+EgWnbs=; b=m0eT1fMmOkO6GVeUje6/ox4+QC
	SJ7GlRFDNlf8ZI9qzg4Fv4R6VcUIIo7WZfBYXpcE1lZ/+EinbTiZgL3P/I7saia1ZSnvOgz8K3wN1
	flitMOkNZ/Vx1LXubd+z2VnnCOhIaM6K34jKItYy+zERNktzS8J2QdWO7T8DrdNxUkBSjT97uFKVg
	iAULENaS2VCyr4M1Ddbid2ofx/U7WqIbFgr4XbWBUTe/DcDJVCO5WlVvsUDKOuzzxXT3czC70a7zg
	SSI9mxLHp23Z7fSdbsO7gUqHGHr3DeWWHMoOoTUVrxdaCRxjokzw6UIwdUndJpTXK7SIpEgqhLyrZ
	iBqzP80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztNR-000000095Ow-0zBu;
	Tue, 10 Mar 2026 09:27:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztNO-000000095O8-3wNS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:27:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-439b78b638eso9890766f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773134861; x=1773739661; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n6mbdjmVIwUUAco7q5KTIV1hgiOZLKIqNBms+EgWnbs=;
        b=F4HSVWH1wZUD+VLjlOtUzqZ9Wpk8p3l85jowGnsWBRaUNEeVkPrqIk+rt6RDAxjkz3
         M1bFqDzvn060MeV/65HI/x3YpmT0c4r/887T0LLh2Y+vHk2H6QCcUwI1YhHfQX20nOIy
         PLsqUzeg16QxUAv+ZMy5xLV0MdCMLE9gJaqKEFqakBOmdjnK4pDAxC8mp2LSjPwUs/bx
         udktcBzV+q4rMnK6h6w1hCkJY/bBW1c0dNmesZOhWa+MgSx7/NzgbWG3D4SO1NwvAWY2
         OCul781ZjGQ8fpYoP5jg9TPSOCcJTSJ1PVAaK0r++ECH/xD/WPvOqlechKry1N6OP5qb
         vu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134861; x=1773739661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6mbdjmVIwUUAco7q5KTIV1hgiOZLKIqNBms+EgWnbs=;
        b=Rbuw9SCTfG8PV0dicmTb84FZ1U8xTXDcj7c2u/vz0U3t4bw2t5c/UcwDCCBcfMsfFH
         I6nVf4e3tAkmOs7Pa/jyvModoFavFXGJx1lCeSzFkv7/TEuaeZIad385GQZ/8yGV8MEI
         oHhfOoMmjcTaGggmG60LHlxQtf9YkCh1fiT5+dPSpVQZo3f/z7YiELqLfjHJDsKFoEaH
         j1H1geazIed1zBpxCe0+Z92pmoRJyjO7pZSa4eUqeyYN7b4XM6xQz+7XB3+xw6cFArcA
         tdT+yBp2S+tLSGMAxAczZNbWoEAfoP45llbM+gzr6GeInJjaO24zWW7LWefRyCBYEHOz
         rlbA==
X-Forwarded-Encrypted: i=1; AJvYcCUnqcQblO/I/wlNt/Z2WMBNN8DstlHJKMBriCtJbyulg2xwsQwHgyo6TQnm3RJWrI9pAPReSqKwa70R4suJ/t8G@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9DzdBtIZnLkNAccSqrfTVQbq/+NU8kJZEBJttsqfVfno4uw7R
	ftfuxFl3FzGilMKdQ5DwSCp9bOhhib7AoF/zCcfhs3hoMeVMK10nFVknB9mHhdbmeQ==
X-Gm-Gg: ATEYQzzsYF9nm/e553PEf4wwz8Ep/Gxr63ZxFufd4h8XhB1ihbZTl1uhbJ1u8rM+crw
	snk/8lDn69SeRN1+lJq/6ruoCJBjKl8zdKgIAGcGx9dsP8Jm9T6c0ogcDaZllq1GadwhWaWOK9D
	Ae5fjBABFw5uQfdhcvmvlPsvmqeND0Fi7JG4CwgkcL/G7FXkqV4mFh5G8xshOqJyiDCWTKP8oq6
	3nIaWCWRIeqcS9huWUyo1v+NgfRbZyLrrL2hHgS8aUD4lYyvCNgQ+u/YduCcGfryXjuHrbMpiTw
	Lagko6KBzug5YZ/vFSHAqWQz6vwbwkxHSojlLMC+AZKsvs5Zd96sjtMBH3RnpFDTM6gIDWYTMOa
	fObqD7NBY2XmfjbErlMBtRVXuEypqiRIz3VCKFjHFLREA9bb/RTT9RTYWKWH+mVpsdfh/7S6Jni
	zYfXIDbNLE2RMo3k461w5p2nISiX+WXCuLCyY4l5PySrrST7mzMgNh/uXLTU2+givdQc9T621G2
	ZI/Ew==
X-Received: by 2002:a05:600c:500d:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-4852695b9f7mr235710785e9.16.1773134860464;
        Tue, 10 Mar 2026 02:27:40 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853f8f9938sm31136055e9.23.2026.03.10.02.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:27:39 -0700 (PDT)
Date: Tue, 10 Mar 2026 09:27:35 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: pkvm: Don't reprobe for ICH_VTR_EL2.TDS on
 CPU hotplug
Message-ID: <aa_kBwF3dv8L6TD8@google.com>
References: <20260310085433.3936742-1-maz@kernel.org>
 <5a5afd0a-de2d-4697-a5ba-0e470ddb20f2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a5afd0a-de2d-4697-a5ba-0e470ddb20f2@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_022743_000117_323ED0A9 
X-CRM114-Status: GOOD (  21.86  )
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

On Tue, Mar 10, 2026 at 09:17:43AM +0000, Suzuki K Poulose wrote:
> On 10/03/2026 08:54, Marc Zyngier wrote:
> > Hotplugging a CPU off and back on fails with pKVM, as we try to
> > probe for ICH_VTR_EL2.TDS. In a non-VHE setup, this is achieved
> > by using an EL2 stub helper. However, the stubs are out of reach
> > once pKVM has deprivileged the kernel. The CPU never boots.
> > 
> > Since pKVM doesn't allow late onlining of CPUs, we can detect
> > that protected mode is enforced early on, and return the current
> > state of the capability.
> > 
> > Fixes: 2a28810cbb8b2 ("KVM: arm64: GICv3: Detect and work around the lack of ICV_DIR_EL1 trapping")
> > Reported-by: Vincent Donnefort <vdonnefort@google.com>
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > Cc: stable@vger.kernel.org
> > ---
> >   arch/arm64/kernel/cpufeature.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index c31f8e17732a3..947ff71b3b66b 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2345,6 +2345,9 @@ static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
> >   	    !is_midr_in_range_list(has_vgic_v3))
> >   		return false;
> > +	if (system_capabilities_finalized() && is_protected_kvm_enabled())
> > +		return cpus_have_final_cap(ARM64_HAS_ICH_HCR_EL2_TDIR);
> 
> Is it a worth adding a comment here ? Otherwise this looks very odd -
> Returning the system state of a capability for a "hotplugged" CPU.
> 
> Otherwise
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


Tested-by: Vincent Donnefort <vdonnefort@google.com>

> 
> 
> > +
> >   	if (is_kernel_in_hyp_mode())
> >   		res.a1 = read_sysreg_s(SYS_ICH_VTR_EL2);
> >   	else
> 

