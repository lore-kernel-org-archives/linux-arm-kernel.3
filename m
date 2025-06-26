Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2C3C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGtkFajgBy5udwP1+SQyc/+NPUr1gDTyvaO2eS3ihj0=; b=A87OSzjusJlP3rd5sXh7BLxlal
	aMEjHAnDt5ezdqlo+RxwyjBfgcNd1SCVkC7xIqUPR4UC3mSCGkHYkx2jRTAEduH1PpVKsHeQnQ20e
	R+BJhNNfS34XTngsNHFvltUiM+oFW1yvA5V2FlochxROxKR77F2RztP22Hu4H3k4FrUjHLmznAoGu
	f0aVGb6d9wAza0sHAH7y7w/f534I6ozb1xY5tk2JZMf//W15ZPPzVX9yMKh4qK1LdSsk0ZiS7tosI
	nXMcIt59mxR/r++dAv0WQEvt2MnqTHcvDYmbT0Av6QB6RG6cH7kzbk+Y6ltPDKocyy4dowBQh8U1F
	kdyoIt1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoxK-0000000CCLH-1Bay;
	Thu, 26 Jun 2025 15:56:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUo0r-0000000C13x-3bws
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 14:55:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B58B613AB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 14:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BA8C4CEED
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750949740;
	bh=DGtkFajgBy5udwP1+SQyc/+NPUr1gDTyvaO2eS3ihj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jyhnMc5xGPJLn4P++dosbLXQZL4QxAEJQFmfUbIMqSzy0FvPUi+6N1DOVcEIMaq3D
	 JdEUiNQVPspb1ONVd8CT9FvuvS+6i2kqVrHonm3vHTNu44T/brpEgZ4q4putsdyxtf
	 42hNI77Zq39eLT3+PSOoln71KoyXT3a4iarDzBslzjKEJtNYjluXDPMHeZ0R+SVh95
	 RpF5I+ECH+LxJiC00K+VEgKF9MwcNyhUL7rtVlQwmNPETqlnXWjf1jPxjnLZ+SeTWn
	 1qmMl+H3jdMepSJTDjnubu/chnM4ivRXz3GNandS1osIQQz/Z8+d8oX5qawzfLK7pH
	 A67HxDSr/jr3g==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d20f799fe9so118004885a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 07:55:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULvafZsjm80X6IgxjkBJePfPy2qPNKTqHU3VjJXuCC+sQ+eMggVCpf+P/RKqYHTb1wLWjOFfOpoN26nxHaSQ/i@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd5UHxGuOVBxalfxyUvA38xljafHD4pRe3/vD4EYLQDgoO2PIE
	QJUfldIWLN0onFjHr1DFj1sG4G8zywKt3XptLqYgGNL5DqCUfkiwa4RV2jC1odZlHLF+ge8v71f
	Cm9svjlivJuz048PdaQiEBymsEQApcvw=
X-Google-Smtp-Source: AGHT+IG453uIeIzNK1RT8uSCLSfYk4hwSyRjXLdI0t8DLEoiD5sm9itRUfxIKnFH0+C76uoY1IsM9oGAI70wauAlivY=
X-Received: by 2002:a05:620a:1657:b0:7d3:e97a:bb10 with SMTP id
 af79cd13be357-7d43ba6ef0amr449772085a.3.1750949739641; Thu, 26 Jun 2025
 07:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250617173734.651611-1-song@kernel.org> <aF1JShCkslGkch26@willie-the-truck>
In-Reply-To: <aF1JShCkslGkch26@willie-the-truck>
From: Song Liu <song@kernel.org>
Date: Thu, 26 Jun 2025 07:55:28 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7WY54jYDBtApRRw4mnjM0cZu4GBUZQ58ZHAV+zd79uXw@mail.gmail.com>
X-Gm-Features: Ac12FXx0pE4VqQoOzbDrAh5sYwqSYnsX3wO2PeWjT7CUcSzqsHYdzfhwvDBdOyE
Message-ID: <CAPhsuW7WY54jYDBtApRRw4mnjM0cZu4GBUZQ58ZHAV+zd79uXw@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: Implement HAVE_LIVEPATCH
To: Will Deacon <will@kernel.org>
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, jpoimboe@kernel.org, jikos@kernel.org, 
	mbenes@suse.cz, pmladek@suse.com, joe.lawrence@redhat.com, 
	catalin.marinas@arm.com, dylanbhatch@google.com, fj6611ie@aa.jp.fujitsu.com, 
	mark.rutland@arm.com, kernel-team@meta.com, 
	Suraj Jitindar Singh <surajjs@amazon.com>, Torsten Duwe <duwe@suse.de>, Breno Leitao <leitao@debian.org>, 
	Andrea della Porta <andrea.porta@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Will,

Thanks for your kind review!

On Thu, Jun 26, 2025 at 6:21=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Jun 17, 2025 at 10:37:34AM -0700, Song Liu wrote:
> > This is largely based on [1] by Suraj Jitindar Singh.
>
> I think it would be useful to preserve at least some parts of the
> original commit message here so that folks don't have to pull it out
> of the list archives if they want to see more about the rationale.

The relevant message from the original commit message is:

Allocate a task flag used to represent the patch pending state for the
task.

Shall I respin this patch to add this? Or maybe Catalin can add
this while applying the patch?

Thanks,
Song

