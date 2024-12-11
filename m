Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E98FE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 10:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihYDcY3LWn4CcltGS+7wcqEJGOYARfyiPsaNarrTPi4=; b=Rnq8qDPNlJRkjRQf7EMgwiYp7W
	oCRJRbnlBgLQ4ScTbYkoZsZPwBBadDGOqlwuMTB38nqBD6snZZYnKqtDmV6YxHjlI/OwObNmXPeA9
	IUPA6Z3XvlTyn0DrFAQ5z1VRlzgspzYMhC03gyJPg2LfEM399/MqwMsZZ8ngdzHPGhhWRYQ0Q2lkT
	dWd8Y3I8glVo50i8lsQCB58/+OISY9ffLN0UBaoTe2+kDK3ME1PwhXsDxzUA1hygIB6WmPs4ZNbbr
	cQ3ds2nt9n9upn/Tu8oH7thqsUaBJNKWDzuQ9IEnHVrf4son4CaYWH5R1L0oLH1O1mOenockEshv4
	HR5UNPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJsP-0000000EZ9u-1pgj;
	Wed, 11 Dec 2024 10:23:29 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJns-0000000EYG7-2wWN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 10:18:49 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aa69251292dso523666366b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 02:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733912327; x=1734517127; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ihYDcY3LWn4CcltGS+7wcqEJGOYARfyiPsaNarrTPi4=;
        b=2+eqEUJr6mKRfKYzmrdjeRDSQru2nxwVP83RQtpRY91QAKUtRGoVuGzFIcWD3Hi48H
         9Bvzpu1rFvTFHrGhi9k+TIB3g/z+NxzHxrDyP8xAsUpkqlPtK9RRL6Ir11uk4ck7N8CO
         Rn3EoO2YYcIWQoRegZ42xbwG6c7fqMn+snKh/2x+GNmqgD2I6fPbdDF1qZMkSn0C8C0y
         G+gZZIkg/6MDczsGKj1zh865Yg5C4eO/03dZb98SXQ3d3oJda4GWHPceCspthG5Clhtt
         +BrwQGyLwMO9PMzwGOCkyhTUxNF+/ZRnZtXoiqmPvoI/+JC8qlSlb+qBPwtjyJUvVFJ8
         dGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733912327; x=1734517127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihYDcY3LWn4CcltGS+7wcqEJGOYARfyiPsaNarrTPi4=;
        b=hdkJt1UmzwMh/SpXUcdrU80bcSLSmPgl1vtvC2hNiBXrmtJhE8IxYFY8bKGvQfUlfT
         rLCRL1EE86aBNajKojIIaHvRFEis5/24cyTCTyokzLWlIHOEi/E4NMezv8swb6TiEuQ6
         G+wbqy2HAOdHIdhfTXShEQwcYRNW3FL+d2o5uepgUwA3EQOa2/keVwmSF3dlBdKpvacr
         vzzQV9EbIomb0btT72d/bXW33M6U/LLTiEQc68OVgMN4HswVqc4Zh1xqNg+q+gaxVLW2
         QFjmAqeNj1YIhM+HVOXddOtZ/2UI5I802GNjLp6hfbHp9bU2cqqKCfaK874UaJkILjN2
         WFKA==
X-Forwarded-Encrypted: i=1; AJvYcCVUftm2Lok8Lx3mR/Cqc1rwOHnSDIUtmWy/+lPvLjP1Q3zOM/MNReOoBaOw4kuxhrMvOhRivK92lS2GP5bAymNi@lists.infradead.org
X-Gm-Message-State: AOJu0YwWB7ZOi6UMSBD1ckwX8rjBcrNoOjv8d+QMgIQDhQA50IqIgMJg
	XTizJMZwquGUYkBLNjtU0R2qe3n8Jy8VXSTIrP77IDaZmUDekZ1db+EWjNH13g==
X-Gm-Gg: ASbGncuRuS70zaSgd7ZkV3ojFyGw7PukiVp/Rii47o/ZyAcp63qeb+guD4fOO+4Tf+z
	QXNmXK+yvWCSt7M7kDS70C8tU42tjgrr6yfXn4Ttc/v6J+vTFxWxHFaIJN0FAGm+mJD8iyTMQZd
	vBHlWA9j4d8ILNLR+RDmbsCfMfKM/E8nQcqdMhNVD3lcAsy2jObOclPVjn8MqPSDpUM0nQwFgCs
	/AK1po4M+O+eTHrFzA0Ks4RkM2sYYrfYnoytpumYptCyEHtfHRg+z+6Eyhcoi8QYPIEdF184S6+
	q7K33sy8zuIB
X-Google-Smtp-Source: AGHT+IHm02VkP/5m/qDW5G8yxXRC3oyr+fzt3izQJU/H+8B1ChDswIr+GMq6gipyIZLTGIZO6CUeqA==
X-Received: by 2002:a17:906:3cb1:b0:aa6:66eb:9c06 with SMTP id a640c23a62f3a-aa6b1141c94mr206656266b.5.1733912327068;
        Wed, 11 Dec 2024 02:18:47 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa665119a06sm641148666b.121.2024.12.11.02.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 02:18:46 -0800 (PST)
Date: Wed, 11 Dec 2024 10:18:44 +0000
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
Subject: Re: [PATCH v2 15/18] KVM: arm64: Introduce
 __pkvm_host_mkyoung_guest()
Message-ID: <Z1lnBDBNq_PKKN4l@google.com>
References: <20241203103735.2267589-1-qperret@google.com>
 <20241203103735.2267589-16-qperret@google.com>
 <CA+EHjTzOjwNyUkS5_zSUiAbiCauLKKgkKU6TM_-+Wsh9A0FdRQ@mail.gmail.com>
 <Z1iaof2DgZfZxc4l@google.com>
 <CA+EHjTyzh_tqH-M4zSDEQ9meK_W_c-sQDvJ6H4kBd4e_MCmLfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyzh_tqH-M4zSDEQ9meK_W_c-sQDvJ6H4kBd4e_MCmLfA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_021848_741892_8ABCE824 
X-CRM114-Status: GOOD (  18.35  )
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

On Wednesday 11 Dec 2024 at 10:11:17 (+0000), Fuad Tabba wrote:
> Hi Quentin,
> 
> On Tue, 10 Dec 2024 at 19:46, Quentin Perret <qperret@google.com> wrote:
> >
> > On Tuesday 10 Dec 2024 at 15:14:03 (+0000), Fuad Tabba wrote:
> > > > +int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
> > > > +{
> > > > +       struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
> > > > +       u64 ipa = hyp_pfn_to_phys(gfn);
> > > > +       u64 phys;
> > > > +       int ret;
> > > > +
> > > > +       host_lock_component();
> > > > +       guest_lock_component(vm);
> > > > +
> > > > +       ret = __check_host_unshare_guest(vm, &phys, ipa);
> > >
> > > While I'm bikeshedding some more, does the name
> > > __check_host_unshare_guest() make sense? Should it be something like
> > > __check_host_changeperm_guest(), or something along those lines? (feel
> > > free to ignore this :) )
> >
> > I understand the comment, but not a huge fan of 'changeperm' as that
> > sounds like we're only allowing permission changes while we use this
> > all over the place. Maybe __check_host_is_shared_guest()? Naming is
> > hard, so happy to take suggestions :-)
> 
> I've gone and done it now :) I almost like that, it's the *is* part I
> don't like since it implied a boolean return. Maybe just
> __check_host_shared_guest(), no is?

Deal!

Cheers,
Quentin

