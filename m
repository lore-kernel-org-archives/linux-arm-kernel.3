Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF97606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LbtP2sW8;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=a45A7YzR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a+lxVdcflxyH59Md6E2MblMjFZPkYamJmvZNqoXT46o=; b=LbtP2sW8KOxuhWs8vOuWH07Pwe
	+auENz/nz/S43Utby78fk7EPkQVda1nPYH31qa4kxDi7nU3OCxo8s7lgsKbMOyNrXiOvaspdeZPHi
	ANNS+gZPbQ+6JI8C/k81jicCRX9ovY4/8U1N2LUvB1sHWMWWXmh1bMzo4lA2evOz3NOtoBpWUKL4z
	Iqi3OJO2gjgU2Vq03z+APi/HGAcOyuckwUAhAe60dGLx3W7jLu/QEfeHep7xx++12skzVHHBDAeKI
	Dr/Y0o3asPVsDoDMmUdSYe/9bSPSERbpSEd2usjA7v+qbUirIPHzru6/I+phbG49bAWEc+2wuX8Kb
	ojCB2WBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqfe-0000000GPAz-0nu1;
	Mon, 02 Nov 2026 11:57:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqfc-0000000GPAC-0skT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:57:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7ACC11FC4;
	Mon,  2 Nov 2026 03:57:42 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D6C93F632;
	Mon,  2 Nov 2026 03:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793620665; bh=YqQ0EI1oDh/HUj0/mvZSV2WfYlpip86rcsjzSKEAyQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a45A7YzRxXii7hkUN4U13CFuVd5h+Xv32KParPswsRdTy/3XNv4Mo5BbONhCRZsLV
	 3pjKnI8wTLHf1EMVmfa9yvsFbTLbVtY/WusJlGGmwshkQkkh/qCiaFmxs15vf9XElP
	 2hzbFxeijAot2yJ6elFOUEkpRxLMpGtrYIBfMV8s=
Date: Mon, 2 Nov 2026 11:57:41 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dexuan Cui <DECUI@microsoft.com>
Cc: Kameron Carr <kameroncarr@linux.microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>,
	"mhklinux@outlook.com" <mhklinux@outlook.com>,
	"will@kernel.org" <will@kernel.org>,
	"Mark.Rutland" <Mark.Rutland@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"thuth@redhat.com" <thuth@redhat.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [EXTERNAL] Re: [PATCH v5 2/6] firmware: smccc: Detect hypervisor
 via RSI host call in CCA Realms
Message-ID: <auh6tWHyMU15QbRC@arm.com>
References: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
 <20261002215725.2015959-3-kameroncarr@linux.microsoft.com>
 <auPOnb_9Jfzh-oQE@arm.com>
 <CH4PPF0966F22FCAF3D8C6535743902930DBF6C2@CH4PPF0966F22FC.namprd21.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH4PPF0966F22FCAF3D8C6535743902930DBF6C2@CH4PPF0966F22FC.namprd21.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_035748_341021_B577D286 
X-CRM114-Status: GOOD (  20.54  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Dexuan,

On Sat, Oct 31, 2026 at 04:47:32AM +0000, Dexuan Cui wrote:
> > From: Catalin Marinas <catalin.marinas@arm.com>
> > Sent: Thursday, October 29, 2026 3:54 PM
> > > +#ifdef CONFIG_ARM64
> > > +	if (is_realm_world())
> > > +		arm_smccc_realm_get_hypervisor_uuid(&res);
> > > +	else
> > > +#endif
> > > + 	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID,
> > > +				     &res);
> > 
> > Is this meant to be generic? I'm not sure the trick to pass
> > ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID in gprs[0] and forward it to
> > the host is a documented ABI. I think it even confuses other realm guests
> > that don't expect this (e.g. kvm_init_hyp_services()).
> 
> Regarding the concern about passing ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID
> In gprs and forwarding it to the host via an RSI Host Call: if I read the code correctly,
> this pattern actually aligns seamlessly with the current KVM host-side
> implementation for ARM CCA (e.g., in the v16 patchset [1]).

[...]

> Because KVM deliberately unpacks the RSI Host Call structure and pushes
> it down the traditional non-CVM HVC servicing pipeline, the guest passing
> standard SMCCC Function IDs inside the gprs array of an RSI Host Call is
> exactly how the host expects to handle hypervisor services. It shouldn't
> break or confuse other standard realm implementations since this exact
> emulation block translates the RSI exception back into a generic HVC
> abstraction for the hypervisor layer.

My point is not the RSI host call itself to query the UUID but what the
Realm does afterwards. kvm_init_hyp_services() gets a positive answer
for the KVM UUID and continues with an SMCCC 1.1 invocation to query the
supported KVM features. The latter is not an RSI host call but an
ordinary SMC call, to which the RMM responds with -1 in res.a0 (all
lower 32 bits set). So we end up treating KVM hyp services as available
in a Realm but their calls still use the SMC conduit and are rejected by
the RMM.

Supporting such hyp services (e.g. KVM PTP) in a Realm would need a
separate hypervisor-service conduit using RSI_HOST_CALL. Both discovery
and subsequent calls would use the same transport without adding
Realm-specific checks to each caller. Not sure how feasible this is.

-- 
Catalin

