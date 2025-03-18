Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A36CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rf5qZHxtK3mCKSr6NpOLubF8ArBJB08AFgLuR4bU4a4=; b=mibrnsTQgf/WVeDq9N4wlZydpw
	CVW+AIPE50VCtn6yRasJ333hSHX3J6gfC1VsU18Z8Bp9drWAtWB9OpqXsVZ3Noj197wSkQ0UmfHad
	rIlgwpw79XijQ11AYJqrYhJCx9Vbb/424/3lVecO2Lb6ETPgeChS5KFc5erTSgQPPG18fwbBg5wnE
	KBP5jFW53PBm7G0/lQrzlsb3r1azkibToT29DOsGMg1owtSxhsYl71HQMU7tc7fESj/rbuR/qlWtg
	QsmobEKGZSpPh22N0F98M+5v+m4eXEtAlrL9ZpnuReDOBBMPi4UJRJOxHWNb2dd/e6Q2r7c3R4gt8
	Z3IOU2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRi1-000000052CK-2Div;
	Tue, 18 Mar 2025 07:49:57 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuRfy-000000051Sh-0mLW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 07:47:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742284066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rf5qZHxtK3mCKSr6NpOLubF8ArBJB08AFgLuR4bU4a4=;
	b=idJSt6aL5RAJe0a7zDM+Ky/FAFqk8PDtJOrD9qwYXfp2wHIiLaoRkaFaAJBUQbyBuxF1jl
	t3nKzAOtAxb6dM2QJ5pnAw3RxGjfI9EPjFUlLdMPAvvOHa6cOgTjV09Nvmyqnva57ch8RN
	tA85gUndW9J8a4bZz7CcO60t4iV8Txg=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	Will Deacon <will@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: Re: [PATCH] KVM: arm64: Tear down vGIC on failed vCPU creation
Date: Tue, 18 Mar 2025 00:47:36 -0700
Message-Id: <174228404857.1652170.4192050516109561246.b4-ty@linux.dev>
In-Reply-To: <20250314133409.9123-1-will@kernel.org>
References: <20250314133409.9123-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_004750_647341_3CC498E4 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

On Fri, 14 Mar 2025 13:34:09 +0000, Will Deacon wrote:
> If kvm_arch_vcpu_create() fails to share the vCPU page with the
> hypervisor, we propagate the error back to the ioctl but leave the
> vGIC vCPU data initialised. Note only does this leak the corresponding
> memory when the vCPU is destroyed but it can also lead to use-after-free
> if the redistributor device handling tries to walk into the vCPU.
> 
> Add the missing cleanup to kvm_arch_vcpu_create(), ensuring that the
> vGIC vCPU structures are destroyed on error.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: Tear down vGIC on failed vCPU creation
      https://git.kernel.org/kvmarm/kvmarm/c/250f25367b58

--
Best,
Oliver

