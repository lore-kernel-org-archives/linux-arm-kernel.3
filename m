Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EDBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 19:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6C+R+OmaQSfBiSVs1fcov+OgwEH54XQE839GPqKNBcg=; b=nlVORwRIVnVPnCn2EA3UR2KcN0
	UT8EoMsNZqW8rMx0dG4EDU3QE3gai1VFuqtZvKC9wlgcs4eWr8/kdqZ1dM9y+NKnTnSmKEqvCDkp+
	5E7NZo+b1vdgsoYXSchnQo/sQ6TWc+Ybxym3KTZf+2IEiXwcleDKtuM8Fp8/kldrPZBYfuostAMfq
	QdfkwqSCpkyg3lJQDtw7Rdl2GFMIFstJFXyFDq0/7sRYFLj9mXtw9ivWtCL6XEMQd/qc8tvs+z3E6
	cGeA12KSpq4Y8BMzan1gKrNwzzn6xFaDxn3YdSBJwqQtvBSiSui5AYYDFCSh1/iVkKEv11ZsDkyHO
	/QybSUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL650-0000000CXeN-3hTa;
	Tue, 10 Dec 2024 19:39:34 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL63y-0000000CXXt-3Uw0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 19:38:31 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso7011854a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 11:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733859509; x=1734464309; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6C+R+OmaQSfBiSVs1fcov+OgwEH54XQE839GPqKNBcg=;
        b=IhquNo1F/ZoYSOr0YdnSJCMy39+4e2tkdZM3vQmJBiZZcoAGfn3A4Cqkqh6b4PVLHP
         unJ0SsJtkZ/Tp7Hz0fNm0ZAi4xy6FY2y3M92lYNmuv+BrvreJaHIffBZjRrmCStZevR2
         f+GQriecbFCgfMusI10ehS7ecWQftSCODooCYNUFpY4mG1YFNCZYsWzDVTKhZ+ZvyXrj
         t2tKz/wVa6zSM87PwnwB8fLFDCZPqQG4mgQxHm5vpcGywtP5JZCHZCLxSpdJY4O/Thet
         C/sHE3hY0UsVaSQ9cwUY1aI9qWxig3W7/CRQgkLncfjSA24M8goL7UM16Uc7PGCcKzVx
         BUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733859509; x=1734464309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6C+R+OmaQSfBiSVs1fcov+OgwEH54XQE839GPqKNBcg=;
        b=LJi5ArIRqD2CDTLYJKhv8h70TcUHs0d6OXCKj+q7VIbwq7lkcoqt1gyrqJs3I3bJ28
         WJ+8f5l+/FqAKAURw0i55Qu0Sk1xMUwJVuRlcnfRjwBzRITNrt0dcD1UJcjh2pVGcee+
         tYNGlFuNLHqmGguvhvi2LZHsVvh1Tc5L30WL8kn88an/3QonljutqtFie1tNphq6P5ry
         /Mb8Shoni4GrOjasnGembGuPVpsLqNiWigAdZUjF8V/jWMEIhHU2mKdFDcC0UhaKOcdR
         PpQNXQ+uRYxLV9feLJF5l9doIV5R1T+YBxocyfD92GBGQ39EQ97yetK851V7H6cnGmKJ
         Vl4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXo73K9qSadCkzL9Dii9AeArN1iZMAb/Onih4Nh03eLVfCOPJS6qhfphYujTN+fF7I+LSHt46twFhY6m/AFB8Bn@lists.infradead.org
X-Gm-Message-State: AOJu0YzV3Siyw3qlvdVnhPcVXmfyXWYvtv5wH+7CUWHLI0HfiWGEzy8j
	xKtm5Bp2AWb2hv9mILLrStXfnxppTv1rapIt2cf4JdlDXiPLu9drexlVx/iUfw==
X-Gm-Gg: ASbGnct9B20KdHUqGNCMFtjZw4QRqDtXsHzRbc18Rwzl7galX5lNhLbCsQZ6+L4rnlQ
	IT/a1xSZ7kjNPwPeCm1PQcf7w47l0kjuKbmAotfUhbW9I0r4voa7yY/KR7WR9Fe367cojZrtSQq
	wSjgHJS+8CPZUfzQanCjHmzMn/J8lS3B3tCOW6vWpH3WlgcMbF10amm4RjEBjpl8liDHcUXzoHG
	R9I6QmulvNlpMXJA9WlXJyGjZOF3YKH/rcv442E9AuVg3mCyECN5xu6WK12VHYcgN0T6fLAs39X
	h59gqCJW9ByO
X-Google-Smtp-Source: AGHT+IEIqsQNTEuyN6pw6/E5dLWj8qHZRilsuJXfDr6drx/4L726HT8V897DbxQWUpXL/uP7eRX+MQ==
X-Received: by 2002:a05:6402:2712:b0:5d0:9054:b119 with SMTP id 4fb4d7f45d1cf-5d43314cfd3mr23651a12.21.1733859508811;
        Tue, 10 Dec 2024 11:38:28 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3c1f99b84sm6775290a12.11.2024.12.10.11.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:38:28 -0800 (PST)
Date: Tue, 10 Dec 2024 19:38:25 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/18] KVM: arm64: Introduce
 __pkvm_host_wrprotect_guest()
Message-ID: <Z1iYsVFgs1Cjwp2x@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-14-qperret@google.com>
 <CA+EHjTx-MZHKwkGYPU+yN-CDkNh1kxTXN8FWTeaPfM95OSkjcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx-MZHKwkGYPU+yN-CDkNh1kxTXN8FWTeaPfM95OSkjcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_113830_888231_0FF04E74 
X-CRM114-Status: GOOD (  12.83  )
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

On Tuesday 10 Dec 2024 at 15:06:53 (+0000), Fuad Tabba wrote:
> > +static void handle___pkvm_host_wrprotect_guest(struct kvm_cpu_context *host_ctxt)
> > +{
> > +       DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
> > +       DECLARE_REG(u64, gfn, host_ctxt, 2);
> > +       struct pkvm_hyp_vm *hyp_vm;
> > +       int ret = -EINVAL;
> > +
> > +       if (!is_protected_kvm_enabled())
> > +               goto out;
> > +
> > +       hyp_vm = get_pkvm_hyp_vm(handle);
> > +       if (!hyp_vm)
> > +               goto out;
> > +       if (pkvm_hyp_vm_is_protected(hyp_vm))
> > +               goto put_hyp_vm;
> 
> These checks are (unsurprisingly) the same for all these functions.
> Does it make sense to have a helper do these checks?

Yup, that makes sense and should simplify the error handling on all the
call sites. I'll probably call that get_np_pkvm_hyp_vm() or something
along those lines and shove in pkvm.c in v3.

