Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BEDC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 02:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fTVD9mhjVGVNu76WgrWlRxCFOQNPlvAmlBjEqJWVdA=; b=agVkhZ3Hzu5k6XdAabXbvugN2C
	tF5JUHmmj+vSI1FBMiZ8urHp/LsE36tW92CQBHKnibIh41Vr8XHOfOplsxyrYfvHhJtZJmtMkO07u
	4Pyz7Yl0ETguRh2QftYBAkFvt+1TG4rxoxkpm+eeZTuPnUqX0/Eyg4FBqDvhf76mqkZM0fTSPkMMB
	eD88kCSQoo8LGA9/rL7KmvzIWY75MahYYy31s7sMgSPY5HBBlWzYaGwADcX6QDKEotOFH4xX7Bsnd
	SG/0BS3LIWBbxNE5EQE2KLdIVSmLyFklG+jW7cK6HmijG+MXbAkWX8KjuVUSbAwkWTWxRbIYzO1u/
	8HWJBZ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8BI-00000009nDo-1kRe;
	Tue, 06 May 2025 02:37:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4mh-00000008vOT-3YdA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 05 May 2025 22:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7fTVD9mhjVGVNu76WgrWlRxCFOQNPlvAmlBjEqJWVdA=; b=CIoBG/LYifEncneo388KFPL0Mz
	H0ERAaVaug7TP2pdc47Wzq563CTijwm+5pzXL3MHAsHofH7yg2YpHRAcCV/d5xOB1IEuyhAbCD+HB
	ZfbFviTmWj5iLmyyDAuXdpLFBkf/A+yZ43n9SbODkhCb7ZIdyI/MLBs3JFqsMoQHwLc44AjiKVOc4
	eI+BNpKchcYRNbkrAUbECYol5h01Cwuu8s98sddwlTIJMiivLjN65U0zF7R4q1WzBLeEL6Pr+Aj5/
	Pxduia36mTEMvLmlB1myGcTm5/Kk5wbwVKsGI3ujCyioz/BGC9sLNeG7Scr2BO5DFVIjIvTVA8+PZ
	+AUJKR9w==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uC4kW-0000000FZ2k-0OOK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:59:35 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff68033070so4539254a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 15:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746485839; x=1747090639; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7fTVD9mhjVGVNu76WgrWlRxCFOQNPlvAmlBjEqJWVdA=;
        b=dDz35SQM4fpqTHluNK+ulHAytDceKyjq46SQH6zjWfInF5OV2/Z5XFNhL1lvELjZdw
         xUlZKtnLMYPo8/r2cJrtLbP66tpb21nfjtiO0JYfiPo6QexCR5pmKK13k8gFAmDfJ8p6
         zdGkaMKDhXZXIMvRhx8Y+Hs3HuZLMEgGHH96aFpEUCjZ+aGdV1OAUASnt5G0BNDZnc8a
         ZmKWxIr/qM4XgyH7LDknrI8tIoeWADnwElP+svRnBgSzIKDLyuveB0/EVv9Z/4infx+9
         mdxKvlzJMS8QP/11RFfe9AMx5cFvo9sC+BDK9FIfqJXg9SGSegejTXNF9+jRv/U84tiL
         7pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746485839; x=1747090639;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fTVD9mhjVGVNu76WgrWlRxCFOQNPlvAmlBjEqJWVdA=;
        b=T8aSKfu7J8jHj1uO5QuzwnQOPCPN5C6T5SaVtEj7Jg2nSuf2ER1DN+zhuUiHfvRbI4
         +iIQZf7Le3h2QYA6kNsMlHJ2/AVlRv0UZAwEs5oayB+ayyj+0ONJSr4UjTBsCuDJuhhz
         l9PfgER68gNRN9HvP5PNMOJ+OL26A8CA85dcS3sPVMFrOH9nz/z53NIfwqfNb0qp3bl6
         epHuCHD11VzDq+VdI3HQwIew8xBJQLSQc/u871FUZ+t6//tXj0VINIHQdlrLHe3c9F+t
         1JtFHzswm/PSh9y4IxpJDQVtDNiU315HLEAi0wIhDdX9P4Tzxc6Tusuf9gElQsBh+fJG
         7vLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxBvMLXwtJtdCXstapGAejmr5fEJ3hDBSCnSNLYGu4MFZgcOxe7+TiSMeYBz9HFq969/xlNekXMLWDaBFSO/ce@lists.infradead.org
X-Gm-Message-State: AOJu0YwDmSg8xm85Ol/PJlgxFl9qSHpnWeHVzCcKUCT0UH0uyksSV6gl
	Gjrsz4+Hyeoypnb69T3nflgBdzvEJPCMYD2DugX5TRtUXr1f61USJjRYz9br46aV/f+lEyF16K/
	y8A==
X-Google-Smtp-Source: AGHT+IG+bLbnRwKacBdwKEqb+ZlVouYwYu6ROj9LxnI6DWLtn5iDtn6cjFYO/W3uF1RtCR2hFz2sG6ty2pQ=
X-Received: from pjbqn16.prod.google.com ([2002:a17:90b:3d50:b0:2f9:dc36:b11])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e4f:b0:2f9:c139:b61f
 with SMTP id 98e67ed59e1d1-30a4e5a608cmr23836495a91.14.1746485839174; Mon, 05
 May 2025 15:57:19 -0700 (PDT)
Date: Mon, 5 May 2025 15:57:17 -0700
In-Reply-To: <20250505190538.GA1168139.vipinsh@google.com>
Mime-Version: 1.0
References: <20250222005943.3348627-1-vipinsh@google.com> <20250222005943.3348627-2-vipinsh@google.com>
 <aBJXabTuiJyRZb-O@google.com> <20250505190538.GA1168139.vipinsh@google.com>
Message-ID: <aBlCTfAlKOWG5orI@google.com>
Subject: Re: [PATCH 1/2] KVM: selftests: Add default testfiles for KVM
 selftests runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_235735_056283_7B615D7A 
X-CRM114-Status: GOOD (  25.53  )
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

On Mon, May 05, 2025, Vipin Sharma wrote:
> On 2025-04-30 10:01:29, Sean Christopherson wrote:
> > But, I do think we should commit the default.test files to the repository.  If
> > they're ephemeral, then several problems arise:
> > 
> >  1. For out-of-tree builds, the default.test files should arguably be placed in
> >     the OUTPUT directory.  But if/when we add curated testcases/, then we'll either
> >     end up with multiple testcases/ directories (source and output), or we'll have
> >     to copy testcases/ from the source to the output on a normal build, which is
> >     rather gross.  Or we'd need e.g. "make testcases", which is also gross, e.g.
> >     I don't want to have to run yet more commands just to execute tests.
> > 
> >  2. Generating default.test could overwrite a user-defined file.  That's firmly
> >     a user error, but at least if they default.test files are commited, the user
> >     will get a hint or three that they're doing things wrong.
> > 
> >  3. If the files aren't committed, then they probably should removed on "clean",
> >     which isn't the end of the world since they're trivially easy to generate,
> >     but it's kinda funky. 
> > 
> > So, what if we add this to auto-generate the files?  It's obviously wasteful since
> > the files will exist 99.9999999% of the time, but the overhead is completely
> > negligible.  The only concern I have is if this will do the wrong thing for some
> > build environments, i.e. shove the files in the wrong location.
> 
> We can get the current path of the Makefile.kvm by writing this at the top
> of the Makefile.kvm:
> 	MAKEFILE_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
> 
> Then MAKEFILE_DIR will have the source directory of Makfile.kvm and
> testcase will be in the same directory.
> 
> With this we can modify the below foreach you wrote by prefixing
> MAKEFILE_DIR to "testcases".
> 
> Does this alleviate concern regaring build environment?

Yeah, I think so.  FWIW, "concern" probably isn't the right word, more like "the
only thing I haven't thought much about".

