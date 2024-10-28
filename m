Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B997FD5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKuNSIYTBR1rDIPTuHwqfwMTGhTV2i8TmyskVsFOfO4=; b=mqZR1UCaIikKIDuuR9TEPeVnnN
	UPwIKWX/6efTmrNKrk3sSzcRMiURP9tCauHGwjLEml1QsvOKunyxxHNjwfKN2M6SSXP69F0+5liBc
	1je2FNBdn94BkOuErRlLs409nGAd5EOjQithuFnt1BFWlde9/jIL9uu4GqxcR4a008nKFpGNJdQNp
	9VZE9Uo7PacZy9iUR4/63GpfPFFAmrCWgZqz/MilIKllcD01/JvQnSQoqx7jc1iaAEgbe8sAXNPTx
	/N2K4p+dC+Wu6J72A3FzLk3JGyk8utVfhWrGr45wNNcabJJVwolWEwTzAliqSoi8IcKBaMCDof2XB
	wUvy9B+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XK0-0000000CLA5-1Oo2;
	Mon, 28 Oct 2024 21:30:44 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5WcJ-0000000CEgG-11BN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 20:45:37 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e30859e1580so3130015276.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 13:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730148334; x=1730753134; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xKuNSIYTBR1rDIPTuHwqfwMTGhTV2i8TmyskVsFOfO4=;
        b=eBnsKg9XBfkTrkWWjbxIBvHTj/lDG5/JitSsYUUn99uhVbG73yE3ct0n47O+EEBfvy
         +bgW/YxvzCc0ZJ3wYdVhqllCvYqXkDLQIm3+4tyatOQNk4TQZYAd9+gXo9nnIDKNnuR1
         J7v/Aa74Mie0USnGI62PTr/5OhOJAcFQz9TzWMNXYik0a1WbzNQwhnk7pF59/NAijHBE
         H8uUAmw1pZPrAQSVIJGF90J7wo+iUcN7MRf/qtnznuEvlaCsSe2M/RF/y7FNtsof2VMw
         yw+lbWQrRN7+MlJzt2kQ0dloEJ0qZKjc7yYjGTjSqIWCpWkbyA0Q0HgRxeRGMJtuZ6MW
         nqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730148334; x=1730753134;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xKuNSIYTBR1rDIPTuHwqfwMTGhTV2i8TmyskVsFOfO4=;
        b=cFFDLCZaF1Ag75ZxyWL60/+TZyCLeQE7GEc/0KDuRQzga2zmFsv1qy8J0q9vlGziGG
         eZ8+2DVakiuhkftkgMdmVbSQ1cWleVqOFkDUzldNRaWhVI5L/DbjrpBM9Ai70J/6E42J
         GFDGh1AzgSfZ1jec7mMdUjGjbpPToD1hOVyMT5H+aLVy/oOBbHRHyPJmpuiz6vAqntgr
         z8Do51ZdrilD2dBqMn7HElYymWM8B1dB5ywjpANbcByuk0t1Vk6J239EahwXQPb+QNN8
         q5wjH//jFYcXPgcYO6Q2xY8SKQB22+h51exrbgvfLGUnZr3ITbo4P2dVPlaB1oA+8Jv+
         VVug==
X-Gm-Message-State: AOJu0YyY8r4fg2bRELt9Va6jvK8noL2RndutE+HPSHhbnywzAFXQ3bOW
	7W+fPseKkBhZgwAYsR1X6aeFlp31eIN4BiENKTcRgCMBPqS49wsauUXHv3S/UjESR9aUoYKI3wK
	SjQ==
X-Google-Smtp-Source: AGHT+IHUv/Dlq02qbqz0gjBFFfL25anLHCsRNYQi4mL1loTc7X5gbHLuxRGm93NhBDNRsTac4zgpo4TCt0s=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:d43:0:b0:e29:7454:a4da with SMTP id
 3f1490d57ef6-e3087a705fcmr7090276.4.1730148333867; Mon, 28 Oct 2024 13:45:33
 -0700 (PDT)
Date: Mon, 28 Oct 2024 20:45:32 +0000
In-Reply-To: <CADrL8HUEwnP8e700y2XYDgVhhUJuj1UEJmd2NLdtZ1dV845DNw@mail.gmail.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-10-seanjc@google.com>
 <CADrL8HUEwnP8e700y2XYDgVhhUJuj1UEJmd2NLdtZ1dV845DNw@mail.gmail.com>
Message-ID: <Zx_37E9QY_PfBaTB@google.com>
Subject: Re: [PATCH v3 09/14] KVM: sefltests: Explicitly include
 ucall_common.h in mmu_stress_test.c
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_134535_317276_9DB3F807 
X-CRM114-Status: UNSURE (   8.25  )
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

+lists

Unless there is a good reason for off-list communication, please keep the Cc
list intact when responding, even for trivialities.

On Mon, Oct 28, 2024, James Houghton wrote:
> BTW, there is a typo in the shortlog: "sefltests". Guessing you've
> noticed that already.

I had not.  Thanks for the eyeballs!

