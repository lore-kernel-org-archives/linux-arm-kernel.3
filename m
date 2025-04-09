Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC31FC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 14:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7VsV0PqKf9SBvU0XB0pow5s5JsU85BsKA//O5NkjmE=; b=3XR/jZJTdD/tSpXtrSiM9JW4jN
	2KSm46t0W0WYyQtCtGXYTRnK4TNcVqYQ96SZxZWXFbRmn3gqZ+N2cEOyfQAoqxGlTdInYtxn+iNAo
	ZYu1pBIgs1wZzVeZd5UTO8OhbRRpNhMLUB4iy6ssp+RvJVcYcPtuT1vvgcuvEt/eA/EWFlDoQgWn1
	KgYXwFXDEc1Kg069EHbL3vCp7JEKjNkhyLzlMsWooOXR7TWKXMPpiK7ZpE7l4WmBXZb6woyCylEXh
	WHs7lN6KEBhxENY1UZr6K4u1YPta0XYmlDGIfgS1JaeyZUE2RIz/urCWpCdWjod89quzruHjOQQoi
	5FTQtdqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WES-00000007Q8h-0gxL;
	Wed, 09 Apr 2025 14:16:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VN1-00000007HWI-1QEc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 13:21:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1541B15A1;
	Wed,  9 Apr 2025 06:21:35 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCFAE3F694;
	Wed,  9 Apr 2025 06:21:32 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:21:30 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Henry Martin <bsdhenrymartin@gmail.com>, arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [v2 0/2] cpufreq: scmi/scpi: Fix NULL pointer dereference in
 get_rate()
Message-ID: <20250409-glistening-hasty-ape-c9c7e9@sudeepholla>
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
 <0558b7f7-8c69-4664-afc6-bae4fdc6f071@web.de>
 <20250409-merry-gay-lemur-8288cf@sudeepholla>
 <52aa52a5-7081-41ee-872e-f1728c06daf1@web.de>
 <Z_Zhp38o9KiicPVw@pluto>
 <3f5662dc-7547-4585-a396-4546fa98d34f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f5662dc-7547-4585-a396-4546fa98d34f@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_062135_418465_3EE3BB59 
X-CRM114-Status: GOOD (  15.56  )
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

On Wed, Apr 09, 2025 at 02:25:52PM +0200, Markus Elfring wrote:
> >>>> Can any other summary phrase variants become more desirable accordingly?
> >
> > I agree with Sudeep, the above sentence is completely incomprehensible
> > to me
> 
> Can any suggestions gain acceptance also for better summary phrases?
> 
> 
> 
> >>> This is meaningless, sorry can't parse. Ignoring it as others in the
> >>> community are doing already.
> >> Do you care if the term “null pointer dereference” would be used in consistent ways?
> >
> > ...this is more comprehensible,
> 
> Thanks for another bit of constructive information.
> 
> 
> >                                 but again I cannot grasp what's yor advice
> > specifically on this commit message.
> May the usage of abbreviations be reconsidered once more also for such messages
> (in presented update steps)?
> 

Still can't understand you. Sorry for that. Alternatively, you can do what
I sometimes do: just write the whole commit log as you would expect and see
if that helps. I am sure that helps, so please do that.

-- 
Regards,
Sudeep

