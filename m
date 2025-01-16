Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0452C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 09:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RZyjga8YE+JF6r9CHWE9YkcyRRFHjYSGtXXb64aa1E=; b=b6baScGyqfBzTgnXIJxVkQ8FLL
	3PAuOAeQ22e7VNjCzE10zaVpp8vhk9XhyYsvrg73BW15CaKfaOpoGmxD4/pc0L87//LMUBgYPGtyM
	D8eOGoB7YW3dOg9QEQo+qdSslrneltgVKaH6Kp6XFQ9VnIA8Pm/w4NrwkClvEWtXfnaqYbgbgAbaF
	SRcIFJXQRRAdTzAGL75akBvvrK2NccpdMaZua7PFtKMHTUdNB67YqVOUs7HFpMZgv6fBfk6C702cK
	MOrUEM+Hdma0LVEcivL3a30q69tnZ5md0I6g7jTulI7hABvitkbb3ypBih+q2n4IwoSM0riQC/5Ti
	V5sNxtcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMZD-0000000EQ1g-41JI;
	Thu, 16 Jan 2025 09:53:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYMXx-0000000EPoo-2t8s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 09:52:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C144A13D5;
	Thu, 16 Jan 2025 01:52:43 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71A483F77D;
	Thu, 16 Jan 2025 01:52:14 -0800 (PST)
Date: Thu, 16 Jan 2025 09:52:12 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Add ffa_add_partition_info()
Message-ID: <Z4jWzF46QpZsjuD-@bogus>
References: <9967e35eb1cbdb8d0c0bae3f54401d806700e6b6.1732255888.git.viresh.kumar@linaro.org>
 <20250116065841.g3okyvm7se5vcc2m@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116065841.g3okyvm7se5vcc2m@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_015217_767906_0DB34C58 
X-CRM114-Status: UNSURE (   9.78  )
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

On Thu, Jan 16, 2025 at 12:28:41PM +0530, Viresh Kumar wrote:
> On 22-11-24, 11:41, Viresh Kumar wrote:
> > Move common code to a new routine. No functional change.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  drivers/firmware/arm_ffa/driver.c | 53 ++++++++++++++-----------------
> >  1 file changed, 23 insertions(+), 30 deletions(-)
> 
> Ping.
>

Sorry, this slipped through the cracks I was on holidays. I will queue it
for v6.15, too late for v6.14.

I will add it at v6.14-rc1.

-- 
Regards,
Sudeep

