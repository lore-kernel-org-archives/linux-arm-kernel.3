Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A38D5D688
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjOE6fPlOtZcaKC6yQdeSPVI0KYBfYAvpsXXnNqME2k=; b=D2JAVBn/TtY938sK0XwNGeXDJp
	rH5lAHqgcoGVm+RCz3S6ZS2UZciUD2YkPxVxqq9VOhk+Jx2JiT+lWdopwRzlPYqDWC/3ADO2cxonv
	UTxSkLczp7+1dKWvXioNwYrdS0GEi478tai+M6mY1CkLJInD0Esdw5qZjdI3tbENjZaBKtwocEkhY
	FDJScBQ+os9f/sxaHd750XG1ZfPqMd0la9ZqzdOsHmTO5vu2hRUg9rr3p/WTaoBU2LA8F9U3BtjWZ
	lBfU30SV+vAuEY2RmvZIVUGes3ekhkzVS20M0aixwTZvjHeV3ComGF/cUSAs2jWAdxSoiptGOw3a6
	lfJWz/Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ABN-00000008QYe-3ZAQ;
	Thu, 07 Nov 2024 21:36:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9A99-00000008QKc-3YBx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 21:34:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D873A41BA6;
	Thu,  7 Nov 2024 21:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B35BC4CECC;
	Thu,  7 Nov 2024 21:34:28 +0000 (UTC)
Date: Thu, 7 Nov 2024 21:34:26 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, dave.hansen@linux.intel.com,
	yury.khrustalev@arm.com, will@kernel.org,
	linux-kselftest@vger.kernel.org,
	Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: Re: [PATCH] selftests/mm: Define PKEY_UNRESTRICTED for
 pkey_sighandler_tests
Message-ID: <Zy0yYo5feyJx1Y6D@arm.com>
References: <20241107131640.650703-1-kevin.brodsky@arm.com>
 <96cc8ce1-1f64-45d5-8567-eb2adba1b47a@linuxfoundation.org>
 <Zy0AQnqIWRM8s9kb@arm.com>
 <50f87b47-e326-4e87-a1d4-cc24ea70f432@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50f87b47-e326-4e87-a1d4-cc24ea70f432@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_133431_972205_43D1D3EE 
X-CRM114-Status: GOOD (  24.44  )
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

On Thu, Nov 07, 2024 at 02:26:11PM -0700, Shuah Khan wrote:
> On 11/7/24 11:00, Catalin Marinas wrote:
> > On Thu, Nov 07, 2024 at 09:50:20AM -0700, Shuah Khan wrote:
> > > On 11/7/24 06:16, Kevin Brodsky wrote:
> > > > Commit 6e182dc9f268 ("selftests/mm: Use generic pkey register
> > > > manipulation") makes use of PKEY_UNRESTRICTED in
> > > > pkey_sighandler_tests. The macro has been proposed for addition to
> > > > uapi headers [1], but the patch hasn't landed yet.
> > > > 
> > > > Define PKEY_UNRESTRICTED in pkey-helpers.h for the time being to fix
> > > > the build.
> > > 
> > > What does mean to say "time being" - can this be removed in the
> > > future. If so please add a FIXME so this define can be removed
> > > later.
> > 
> > There's a dependency on this series:
> > 
> > https://lore.kernel.org/r/20241028090715.509527-2-yury.khrustalev@arm.com/
> > 
> > Which I did not notice. Typically the uapi patches are picked by Arnd
> > but first that series needs to be reposted with the comments addressed.
> > 
> > I think for now we either merge this fix from Kevin (happy to add a
> > FIXME comment when applying), change the kselftest to use 0 instead of
> > PKEY_UNRESTRICTED or revert the top two patches here:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/pkey-signal
> > 
> > I'm fine with all options really, it's not essential that we get the
> > kselftest patches above merged in 6.13.
> 
> I am good with taking this patch as is with a FIXME to cleanup
> later.

Thanks Shuah.

-- 
Catalin

