Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A08C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPUV8FgJegitXiVQUTfiLM1o0/uBOnP4q0gwO7/J0sw=; b=HyAUjr3wfnmC9jC4PZqynI2o+M
	NO5tuIanMo5XoqPqp2r553u7rKphIy3Vg25tc/CFqmSpb0tj15pRAvHLacDtN2KPFOH8TuE3aOfNJ
	L0YWMHQsMyUg5h9nbCL/1QqhP6lOe5r6TxQmPy30usytWwXJ3B4wkhohKAz3RyYnouatVM3unvBl8
	pYUwdh/y/j0k8M4SU8BA+2e8zamYiksX53N2AY37u3dcYjjGZP4b7dCLq++xjjO/5KyHsEPjolOA5
	bna6DahKmhM/fV11ZVy5+Qi1v8CMYEqlwCji3d+h2AknIs/9vLcOhGWE+Vrh4xHpUlSzWp2aFQFE8
	TGL6IwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2U9k-000000075Aw-329i;
	Wed, 09 Apr 2025 12:03:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2U7y-000000074yF-0SIY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:01:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B351715A1;
	Wed,  9 Apr 2025 05:01:57 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81AC03F59E;
	Wed,  9 Apr 2025 05:01:55 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:01:43 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Henry Martin <bsdhenrymartin@gmail.com>, arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 0/2] cpufreq: scmi/scpi: Fix NULL pointer dereference
 in get_rate()
Message-ID: <Z_Zhp38o9KiicPVw@pluto>
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
 <0558b7f7-8c69-4664-afc6-bae4fdc6f071@web.de>
 <20250409-merry-gay-lemur-8288cf@sudeepholla>
 <52aa52a5-7081-41ee-872e-f1728c06daf1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52aa52a5-7081-41ee-872e-f1728c06daf1@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_050158_185008_825A7EB3 
X-CRM114-Status: GOOD (  10.21  )
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

On Wed, Apr 09, 2025 at 01:48:33PM +0200, Markus Elfring wrote:
> >> Can any other summary phrase variants become more desirable accordingly?

I agree with Sudeep, the above sentence is completely incomprehensible
to me

> >
> > This is meaningless, sorry can't parse. Ignoring it as others in the
> > community are doing already.
> Do you care if the term “null pointer dereference” would be used in consistent ways?
>

...this is more comprehensible, but again I cannot grasp what's yor advice
specifically on this commit message.

Thanks,
Cristian

