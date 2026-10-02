Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D178DCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngc+Dc6mG5eMUNtbuXMSrmBLpP8pJzc9TOtXps7kTTo=; b=EPz8zcJUiqcy6BpN/nqi2m3TWb
	WIRf+Vf8hLbg2EHTXG5tgmMTohq11ncIhChFsCDNBbV5QnZw5Gv34FlQ6qPLkDcyMYSkpxknOh4MT
	pm8M4rvs1JJxw6AO4+ZKD8Kxc9yGJ764UNpIbT0qAralAMwRguHg7dTriJgM4hCXpc0j0haYIb5u0
	mFMxtnj0hefEtrrkQkSC8WLo9W/15BeXpNKTBTubOKlXWdWjbJDZsV8VU+Jv9CxdkVLHKMfWc6xwV
	7R843IT8BwsyxN5VowK6weQ9JAWOt7ECNScS5GGFHP7xI2rIpJEwJq96GjO74KnonA4XYFj9+miUj
	Zm8bL9Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeOM-0000000BnHP-3HQx;
	Fri, 02 Oct 2026 14:37:44 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeOJ-0000000BnGD-2E9l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:37:41 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5ba3d1ea20cso8044e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 07:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790951857; cv=none;
        d=google.com; s=arc-20260327;
        b=fsP7Bi1TeabGHZ/ENTmq4wK6o7s8jARy7seVJD3WCF8A1klCbRP32NVA9DrKPMGGAH
         LwBXVLy+/zuX/1vbkPGguoH2DNuMJrWj/AlBIO9ZwRFiOOcxgwwT+djQ4tKAmmVXZFWt
         tdQgTtUiyVaAsVckaKArVvZYlozNGZp/eA41QtSkP3CWGK+tuqdvSJWxxYsnu1HL7X6w
         pZ6nDnq3eeAPiqCNGd56nIPmlpg8hlut7e8XijkRrsLUGP+3e8SczJoXDqmW1sMKcXZf
         fPgpH/Mngs3rUWifQKyI7GHYvEMvmMm3EPNk5GJhw8QaQjtxT2T0KtFt41gfT5rgkZWO
         /gYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ngc+Dc6mG5eMUNtbuXMSrmBLpP8pJzc9TOtXps7kTTo=;
        fh=5zR9wh5EIiGu/kUMw2HTy32nf7vkISjXjssh26cNp38=;
        b=KSRz06BwHU/qmFnrftR4NZOL6o7WF/ItSLF1r5Mren7SSQktixNwD10XgBj5fpPvhV
         VANs660PxBG73OFuafWKHdB4ejoPMTdJO6tFWIrhgPv2ogmC8n4HTZj6Tqojeg5+gj0K
         wxOzlI4zXLLO3XFXd4D/PAwJB2lDNi4zT5W5gdL7r3ODbEb0vcmjnZTBkEeIthYxelhY
         /8YZlXWW3SE/4jnu0Mtrf3m1yxfYkgHG6oLdhuS04D5yGl34eqy2P+AVyTSf6A26DNqf
         BRNCzoVmVfReEldpIOpUSrtvKvSqEzC+zLOhCdAGdojuno4ULU+87eyXkswI0DYBCxV5
         0gow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790951857; x=1791556657; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngc+Dc6mG5eMUNtbuXMSrmBLpP8pJzc9TOtXps7kTTo=;
        b=Ew3EEK8kZtFIQoNXHXUiZHj232o119fofgZKvPfJ3CZ2lYNquIuHq+Vb4/XGy0pDHK
         Z5DZWwhdWW/wM9Sy3+RDc9jvOQahmehe4zHnEvI3gwJrLGiQy4Gyg+9QpMTnrbEUxkbS
         egHYorzURIrL3DihE20nhFhZS1XN0hrOd4gmwbYEG/oheTN34jTY8ho1xY2S7IXeAdMD
         LMjkSXqXWHdgk6l2eCEwm6rB85nmUqJRDzffs7SbqRcnkFFKFBiWK+eNsU7AZqtD8T/V
         piCK4zupgSABLbNneg4D6uieMW+U0S8RnizDN/Rh1tB7GV/EkSL6MNMTVRCA/VjVqTxY
         nO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951857; x=1791556657;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ngc+Dc6mG5eMUNtbuXMSrmBLpP8pJzc9TOtXps7kTTo=;
        b=FeYtTa0ffNjRcL1YrIlQ+zCc63DuyI9dW/QM3ioUGY65R6g1n1UbaU+kjCQVrfdNif
         F06+hBJKNO0WGyU6BFiMIxe7m6YzwUz0gl+gNsZ9/Of/3FqAmJ5QZd5fNE1GuCw4Xa5R
         yxgR5Qg93JBwK/EMFRSczeyq36FqM+oBHr29W3pwgrvWajVfyaJz+YgG7Ugg0u3zBt2J
         jwdl3vTeFMX0jS7Yw1ar8g5vorsaZZg87hQSXsFyGwcL+da9Cplom86FobPTi2yx/8Db
         U48nWLKPHIk3nH5xnUYpFAF8cLgXMSOVpn4HlQF6vaVKZty8a2kFpcD8vOFMrVGR/bl6
         6LvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6a6SeK5SvFjo1Nb/1xyQ2Y21mU3m0kMCJJsV08UQHLxU19PxjU8DzpvQdSm3mnr9+9IfxC+hk1xSkXoAITeWU@lists.infradead.org
X-Gm-Message-State: AFq9FYK3lnWRWaOmBTGH4qFPbBdEo6Ow0nE1kPkTAngP2DqxBAqPyzTf
	9GKgKmzCMiugx5HMzHKNMhMtsMMQbyIj1ECBUKuRlt+fYTpml4rwdpRcgRvVB8KZxWp431a+qXd
	cZsEUP3RuVQCwRGJQvp4PPwVwpOkiS33Bbjfpm6Zh
X-Gm-Gg: AYBFou36pXa7Hc/O47OW52ksnCOYgAuF5Sp4KXKpGURZMZSl7cmbfJsO0ajdi4OWoHD
	zPOjsqOnoyXSFqK/TNh2KiRc3CxJgo4CoLhk5FKaVY8lFd9J9ukFQoCOiCIA+pldq9Z7pA7WUqA
	OKYmPdnw6Za3KBe8+sRYfbpMsVngxbpoOnInYht+Y/sfUe+fyo5js1LnkZjgKkTUsHLknK9Boh1
	Fs7Hp9Qcbk4oJCr1W+GaAItGF6SkzLeCfdyETxl9NVAxIWvHfNnpBEcHzS7xWabH1BeMi3uVfcs
	bbgzqC2W4HloUx6TvauJNHwuzVmcd2gSZSzZur9fAhz/7yzsHJKGmEElW5KnyAFJePJpP3/xQeR
	zsTlCGYHgDweAdA==
X-Received: by 2002:a05:6512:3da9:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bbe07ff87fmr127412e87.8.1790951856416; Fri, 02 Oct 2026
 07:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20261001210703.1597150-1-suzuki.poulose@arm.com>
 <20261001210703.1597150-6-suzuki.poulose@arm.com> <CA+EHjTxtatPyGcyvEyR129cqUiAYcO_cxRVtwZO0ckZsOnD7TA@mail.gmail.com>
 <86se2o2rbs.wl-maz@kernel.org> <CA+EHjTwHuJ0u_TTP46zNFKFmBP124XHHLUVhkAUSyfhe92=41w@mail.gmail.com>
 <86pkxs2npx.wl-maz@kernel.org>
In-Reply-To: <86pkxs2npx.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 2 Oct 2026 15:37:00 +0100
X-Gm-Features: AclHuK_ts2oonb5gFFEThD7Rzb_QZk1ok5N5MoHVdkKoZ33EulrV9BUtxD17tPM
Message-ID: <CA+EHjTy4rb+6z0bqh7sPqACES0EDpURdeoyiFGmdw3p0PENcOQ@mail.gmail.com>
Subject: Re: [PATCH v21 05/23] KVM: arm64: Track the type of VM in kvm_arch
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_073740_213020_A6C3E1EE 
X-CRM114-Status: GOOD (  11.47  )
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

Hi Marc,

On Fri, 02 Oct 2026 15:15:06 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Honestly, we introduce the flavor stuff to make it easy to match
> things on a particular VM type in a readable way. So why isn't this
> reading:
>
>         if (vcpu->kvm->arch.vm_flavor != VM_PROTECTED_PKVM)
>                 return;

I know this is a sketch, but just in case: that's inverted. The sync
only applies to non-protected pKVM VMs (EL2 ignores it for protected
ones), so it would be != VM_PKVM.

Otherwise, looks good to me.

Cheers,
/fuad

