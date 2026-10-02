Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF3BCA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 12:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LynaPcEemc8Fvi0pdqSvue8XBTJnHlD/bhr/8DNTDJE=; b=apfquu3W4xi8NhuxwOy66xYWt8
	lrAXjnD0M9HUtmm1qib5nIliRDBZVqpcBGvdoD0qF536uqmR1sQEE2+JcChF9dY4KW1AUkOslVByn
	pNSsjxqrahmPK7xM37VkqsiGjzn8poUic6yH2gDTCbd7wmrAxMLXirvwkpL3AiSJs4zxpD5tfv6+w
	r0pPNei3Os9u9e3VqyBhFN7ewoNcFf9VaKfuFSmkXGX2IBqREPIhsxji/0+oT9UW3q61NbHJiCL7Y
	hnQpfheKTO683VnxlWgzf4GodmuVrIbHz+kJms+BQuCWcWSqCe+qgBGMViQTW147yc/fVQoscv7ah
	kw+59nMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcd9-0000000BbVK-2kk0;
	Fri, 02 Oct 2026 12:44:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcd8-0000000BbUy-3jm9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 12:44:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F392760A93;
	Fri,  2 Oct 2026 12:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CCC1F000FF;
	Fri,  2 Oct 2026 12:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790945089;
	bh=LynaPcEemc8Fvi0pdqSvue8XBTJnHlD/bhr/8DNTDJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mnoG2iSMabxxw+PTv5TXCr8x8UA2J9i6P8AwYTSdEEaEC8q9g0s9oV4VZF0e1bZLM
	 t4Qf5KI06OubB1qzyD088zZe4hkWta82J91l67s1whCwbU57Z5VSNtuzsszxEtpwAL
	 RNB564Ra2u29j8JUN/1Eec9Z7owo5I6eRm3qBu7XsJRO8XFI069xrOpzrb28S5ZLSJ
	 bThxaW8o5WHZUvufJ2WVney2gc7xEE2UGnWu7CvQZvFkUm2+xfk5QPK0u+DdcvtFLZ
	 phluqkj9PH0AViV2udz5FuUGCoVRpOrF71yzEf31tZYkWcDOJ6bFkCg7ggKLXT2Qh4
	 zKeR3PQ4+mICA==
Date: Fri, 2 Oct 2026 13:44:44 +0100
From: Will Deacon <will@kernel.org>
To: Tomohiro Misono <misono.tomohiro@fujitsu.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Kohei Enju <enju.kohei@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 3/4] perf: arm_pmu: Add workaround for FUJITSU-MONAKA
 Erratum E#030002
Message-ID: <ar-nPJyVzPcvbICa@willie-the-truck>
References: <20261002-monaka-fix-for-upstream-v1-0-4aec0b0cbe34@fujitsu.com>
 <20261002-monaka-fix-for-upstream-v1-3-4aec0b0cbe34@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-monaka-fix-for-upstream-v1-3-4aec0b0cbe34@fujitsu.com>
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

On Fri, Oct 02, 2026 at 07:26:51PM +0900, Tomohiro Misono wrote:
> FUJITSU-MONAKA Erratum E#030002 affects FUJITSU-MONAKA CPU.
> 
> On affected FUJITSU-MONAKA CPUs, after a PMU event counter is
> stopped at a value just before overflow, an overflow might still
> be incorrectly detected, resulting interrupt storm in some case.
> 
> Work around the erratum by avoiding programming PMU event counters
> with values within five counts of overflow.

What's the user-visible behaviour of this erratum? It's not entirely clear
to me why we need to do anything at all.

Will

