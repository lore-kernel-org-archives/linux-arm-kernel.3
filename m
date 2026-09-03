Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0291EC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 15:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmHR9VMSgZvTyS5Rd9T+V8oik7z2Cr4I+UuO+iaoSDc=; b=gzk0oaQ1dLE4F72wHSMfS7gNgm
	M7W99881oAuo24BgnkYS9tN+KH3GQXxnqXqx9Z5XTo/CKVRqyZ//CjUT6c7SAy77dePdB1zdRD5GS
	3yirnhrgekLhxZIbagsAzcHhEjuBkJeMEYR/STmVVod7nv8Sj9I4arn4ONXX+6LlZI4zaRJgbx6gt
	a5BsoosuehrQreer17mnhLmeRSBQgBhjXIOHoI5h9r+VEw+R6tPA6nWfxkFDxQldba26TwrkbM48e
	yE2gJLS5qP4eONWb1KwlALL03CT85eBfM4uzxlrxfKEr4RpZ5pTug8nzbjtG1/UsGr736AET3L0LP
	QACdKGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29g7-000000003Ma-1qGq;
	Thu, 03 Sep 2026 15:48:39 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29g6-000000003MB-0WSN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 15:48:39 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2d52734fc41so45760855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 08:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788450517; x=1789055317; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmHR9VMSgZvTyS5Rd9T+V8oik7z2Cr4I+UuO+iaoSDc=;
        b=jREumQ9Vg6PfaowE3dEz4ruqAZ3Br41b0V+rl3bjVq31S0dWhs6yoY/HtpEauvkEWI
         vU1kLg1zUgPR2zdy6RGD+cAeB1pEUApPkXWXFfSLCqa5LMgTXOn5o0TQto/KNQ+6OB/4
         +vVqYeGNz5w+nToP37RgTMyypNqRLTAp1w9U//h+i1TbumAhhYRt4cqUJAvowrEZkDc9
         3DqTSqB3FErlHAhcN40JOISbdLFbnw3mjySQvN02EsRnbO5CFMe5CDYet4nIGc/vrT2Y
         2VCPfTsc8clEw6x2YVO+kZxIUw/DlYoSL5972wloNHRUyizz4FtsomPWKIHCodJPLT4u
         zd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450517; x=1789055317;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PmHR9VMSgZvTyS5Rd9T+V8oik7z2Cr4I+UuO+iaoSDc=;
        b=fWd7wyJkVoz/T43TXEUGBOZ9nYi9H9RCAkN++bNWS7wLeQC/179x6xzB+F7CrcF0+g
         w5pHEt0H7NB6aTqDFurPMpIsepPRm2kjj+QZY8NMNnQVJ95FIKRibfSSzAoENUL79ZOm
         7aU3vyQcrAXx6BojpZvxe376TTemngTNWLfDk9iKzygklJZ6A7kdD0fjmRXYoymO4sNA
         YEXr7jn0FzHMJAVK9+7iHx0EOSoCMYcwFP6nJogB9T9kG0YEdgzD1kK/M4wQRQo57ZI9
         8Tr/NUrb1lb09mygQxLinQAu53Oym6dIjp+C25u5ytguM+yz9fLuI5wPzFd7n0xXaQvr
         5GUQ==
X-Forwarded-Encrypted: i=1; AKwUvBw92Jp0dv3wcALE6HUknJDmyA0Xw0M5GU0sTo1QHpRo1MPkbyR73PSJ+D6dadQMgyBH0rDwPM9URrqCQF+uOZj3@lists.infradead.org
X-Gm-Message-State: AFuF++k3xjprW3dfRdXDYYTAR6gkXkwmIWiNAS1/qYZ5DVZENCcpQ0/g
	tWT7Mr/PDWBFOgSrEabuYyU3NA13G8BOiZVxT6fp5DxDOA+mjV4Lxy5h6zGAZBGrKc3aN4Ku1p9
	JVrrseA==
X-Received: from plce19.prod.google.com ([2002:a17:902:f1d3:b0:2d9:2fc7:bb3d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f78c:b0:2c9:df1b:e948
 with SMTP id d9443c01a7336-2daec5dfa20mr199165855ad.4.1788450516176; Thu, 03
 Sep 2026 08:48:36 -0700 (PDT)
Date: Thu, 3 Sep 2026 08:48:35 -0700
In-Reply-To: <20260903114241.33034-C-seiden@linux.ibm.com>
Mime-Version: 1.0
References: <20260831144802.834315-1-seiden@linux.ibm.com> <20260831144802.834315-3-seiden@linux.ibm.com>
 <apdweRfqt4dTxcU9@google.com> <20260902075028.231001-D-seiden@linux.ibm.com>
 <aphLXQL1H2zYZgTi@google.com> <20260903114241.33034-C-seiden@linux.ibm.com>
Message-ID: <apmW0xFe7zgzheGe@google.com>
Subject: Re: [PATCH v7 02/23] KVM: Make device name configurable
From: Sean Christopherson <seanjc@google.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
	Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>, 
	Gautam Gala <ggala@linux.ibm.com>, Hariharan Mari <hari55@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>, 
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ulrich Weigand <Ulrich.Weigand@de.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_084838_172626_17A1C45A 
X-CRM114-Status: GOOD (  30.86  )
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

On Thu, Sep 03, 2026, Steffen Eiden wrote:
> On Wed, Sep 02, 2026 at 09:14:21AM -0700, Sean Christopherson wrote:
> > On Wed, Sep 02, 2026, Steffen Eiden wrote:
> > > On Tue, Sep 01, 2026 at 05:40:25PM -0700, Sean Christopherson wrote:
> > > > On Mon, Aug 31, 2026, Steffen Eiden wrote:
> > > > > Allow KVM implementations to choose alternative device names. This is
> > > > > especially useful for architectures providing multiple KVM
> > > > > implementations simultaneously. Architectures providing multiple KVM
> > > > > implementations must compile the KVM common code once per
> > > > > implementation and mange symbols.
> > > > 
> > > > What about tracepoints?  Or do those show up as "kvm" and "kvm-arm64"?
> > > 
> > > Yes, I want them to show up as kvm and  kvm-arm64.
> > > 
> > > Thanks for pointing that out - I just noticed that I forgot to switch
> > > the trace system to kvm-arm64 for the common tracepoints in
> > > trace/events/kvm.h
> > > I only did it for the arch-local traces in PATCH 21.
> > > 
> > > I would just do the following:
> > > 
> > > diff --git a/include/trace/events/kvm.h b/include/trace/events/kvm.h
> > > index b282e3a86769..5d4f8a0693a3 100644
> > > --- a/include/trace/events/kvm.h
> > > +++ b/include/trace/events/kvm.h
> > > @@ -5,7 +5,11 @@
> > >  #include <linux/tracepoint.h>
> > > 
> > >  #undef TRACE_SYSTEM
> > > +#ifdef KVM_S390_ARM64
> > 
> > Side topic, I recommend choosing a macro name that doesn't have a near-collision
> > with CONFIG_KVM_S390_ARM64.  This *looks* like a typo, i.e. it looks like you
> > forgot the CONFIG_ prefix.  Especially since the macro is defined in the Makefile
> > and won't show up with e.g. "git grep -w KVM_S390_ARM64". E.g. KVM_S390_BUILD_ARM64
> > or something?
> 
> Interesting. The name was deliberately chosen to be similar. But I
> see that it could be confusing.
> 
> I am not totally happy with KVM_S390_BUILD_ARM64 but I cannot find a
> better name either.

Y'all need to pick *one* method.  KVM_S390_MANAGES_S390_GUEST was already added
by a07276d5d188 ("KVM: s390: gmap: Make storage keys optional"), and then this
series effectively adds another macro to provide the inversion of that, except
they're not even tied together.

