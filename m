Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630CBCA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTxZ+klB136xs6I0MMZhqHlNICco77bBlWVNW3ulhsk=; b=1lKjJUYP4/EKKW0fEuCFOtho0Y
	LPhcQ4cddGbiiku1E6KWZ8x1q8QtuDYQ//c+k+2wOShfcWMunl/fQdivrqT59fh1ypRdmI+FeqR1b
	aOJbRY3zmj6Yi8wYskvInxbzzq1QxUHxWhvSgpOAGvExuUF39gcgjdlSSVUyQ9oxEmiU56URJPrHR
	uQ6HpQ5wcBhSVKFcED7ET3HWrNqqjMRN/jO9TLWFFri7SDkXUZSpzWWu9cJ1IiH2oouDf8zpLx7yX
	VI9khJmKBQWSu3zPn09cts+kWYPJCVEeQOMh47RO4FNrrlXIgOpZdP5uZZm+Q52UasaNwIiipNFeu
	SSmua3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6LP-00000000xuH-1uCX;
	Tue, 06 Oct 2026 14:40:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6LK-00000000xtl-1PWN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 14:40:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A92D1516;
	Tue,  6 Oct 2026 07:40:26 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3F6E3F66F;
	Tue,  6 Oct 2026 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791297629; bh=yU78SAbfJlRqMOCIss0Z37pf6Gz3agoTMIRQf9pHTGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYTWwYvYfIsSmzz7Bqt1lsM+9W49mjsFntYVzHXBzeH+Igy14f0OdSkgGa8Hkkxxv
	 owd38Rzp+bk+ptY4ljz9FinMm5HeVwlBvxlQ/824XQsY0/2mCxAWZRhCEdmDLm4mSg
	 08Oav9Xn3IDOhPDYtTScv3YwrI7+ytjapr0qzo0g=
Date: Tue, 6 Oct 2026 15:40:26 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Bill Roberts <bill.roberts@foss.arm.com>
Subject: Re: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented
 by locking
Message-ID: <asUIWgHk3hdaLEu5@arm.com>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_074035_454335_71F90E83 
X-CRM114-Status: GOOD (  10.31  )
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

On Thu, Sep 10, 2026 at 08:00:39PM +0100, Mark Brown wrote:
> When we refuse to change the GCS configuraiton due to locking we
> currently return -EBUSY which is an odd choice.  The only userspace I
> found that relies on this value at present is the kselftest and other
> architectures are using the more obvious -EPERM here let's switch.

IIUC, riscv is returning -EINVAL. Should we get an overall consistent
value? Personally I find -EBUSY quite descriptive but I don't mind
aligning the architectures (before user space starts making use of the
return value).

-- 
Catalin

