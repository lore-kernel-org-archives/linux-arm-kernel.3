Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4A5C8303A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJrmIk2z+Rrtkh4IbHoBo0gKummKxnEbbwGlNIEjEhc=; b=btzQUpXx+MA5KCVPlc9S9FHGlg
	IpaFF66iajxoDOP7rR+JOy6SxeHnB152Bt4O0+5EdVooa4307PvN8mAVKb1EirPa74iHas5BsIX+x
	qKR+TpGbylbp3H8CY+LmKCEtq6Adk3F1+mOEhdswQ3mUaWCFKbtxDVaVEAL+Kd7ZFji/UIAoliOdU
	AOqlezaMFEbu5PjVwP1tMHO4sbERk7QZ8JpVTu9Msev1sSrQ5tXU/DBsgDUvc3FAPryykjdWy3+hi
	5ISBpiua8Lmcm+LoFkoLn6JQbK3t2bdoaInLIKkIrkz5h0NNe3/ePS2Tvx10SoIpCLNHnybA5O/X5
	AQZc19Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ1X-000000039eh-1Bwl;
	Mon, 30 Jun 2025 18:14:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWI7k-000000033Df-1L06
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 17:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5413145C6B;
	Mon, 30 Jun 2025 17:16:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B07C4CEE3;
	Mon, 30 Jun 2025 17:16:49 +0000 (UTC)
Date: Mon, 30 Jun 2025 18:16:47 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Song Liu <song@kernel.org>
Cc: Will Deacon <will@kernel.org>, live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz,
	pmladek@suse.com, joe.lawrence@redhat.com, dylanbhatch@google.com,
	fj6611ie@aa.jp.fujitsu.com, mark.rutland@arm.com,
	kernel-team@meta.com, Suraj Jitindar Singh <surajjs@amazon.com>,
	Torsten Duwe <duwe@suse.de>, Breno Leitao <leitao@debian.org>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH v4] arm64: Implement HAVE_LIVEPATCH
Message-ID: <aGLGf5feF4gT-dgR@arm.com>
References: <20250617173734.651611-1-song@kernel.org>
 <aF1JShCkslGkch26@willie-the-truck>
 <CAPhsuW7WY54jYDBtApRRw4mnjM0cZu4GBUZQ58ZHAV+zd79uXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW7WY54jYDBtApRRw4mnjM0cZu4GBUZQ58ZHAV+zd79uXw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_101656_374689_058FBD9C 
X-CRM114-Status: GOOD (  16.17  )
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

On Thu, Jun 26, 2025 at 07:55:28AM -0700, Song Liu wrote:
> On Thu, Jun 26, 2025 at 6:21 AM Will Deacon <will@kernel.org> wrote:
> > On Tue, Jun 17, 2025 at 10:37:34AM -0700, Song Liu wrote:
> > > This is largely based on [1] by Suraj Jitindar Singh.
> >
> > I think it would be useful to preserve at least some parts of the
> > original commit message here so that folks don't have to pull it out
> > of the list archives if they want to see more about the rationale.
> 
> The relevant message from the original commit message is:
> 
> Allocate a task flag used to represent the patch pending state for the
> task.
> 
> Shall I respin this patch to add this? Or maybe Catalin can add
> this while applying the patch?

Please repost with a more meaningful description and a justification why
a new thread flag is needed.

Thanks.

-- 
Catalin

