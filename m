Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42526C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TScqo80eZaMMPIBH9WFVBR21I1NfztlTIn/vGVlXWc=; b=Bjvhg7FH8psG4RD3VzBcKlT6h8
	gSkMHpLG2wU5KYe115/ax45QmtSSiHD11j+zv2W/zXZlYsDwPjjy4V9cb2rbBo71kSaHS1CIRYubM
	jLi8L8T3GCif452puBsroLCajYEeScG+V2u5KW2rZDk+uKxWJAiWlphTMa1DZaAuxPZoTOCPz2coe
	hzImjBlb10TedrCECTnvwGYM4Gt441MYOFN6sCe9vexsnt712VhLu53G/1p08MhsI1LZvbePPxnWU
	+w1yJu4epOcYr4rx+HSuDbfXyMb+mLG3bLsSBllfuj8nrDFeeFzZ30WUIcskXG00C+bBif8Q7uTnL
	UZt82WFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TVk-00000006z2y-1rH1;
	Wed, 09 Apr 2025 11:22:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TTy-00000006yn1-1bCz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 11:20:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 548221595;
	Wed,  9 Apr 2025 04:20:36 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 202F63F694;
	Wed,  9 Apr 2025 04:20:33 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:20:31 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Henry Martin <bsdhenrymartin@gmail.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 0/2] cpufreq: scmi/scpi: Fix NULL pointer dereference
 in get_rate()
Message-ID: <20250409-merry-gay-lemur-8288cf@sudeepholla>
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
 <0558b7f7-8c69-4664-afc6-bae4fdc6f071@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0558b7f7-8c69-4664-afc6-bae4fdc6f071@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_042038_517183_468BBDBF 
X-CRM114-Status: UNSURE (   8.85  )
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

On Tue, Apr 08, 2025 at 09:23:35PM +0200, Markus Elfring wrote:
> > This series fixes potential NULL pointer dereferences in scmi_cpufreq_get_rate()
> > and scpi_cpufreq_get_rate() when cpufreq_cpu_get_raw() returns NULL.
> >
> > Henry Martin (2):
> >   cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
> >   cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
> 
> Can any other summary phrase variants become more desirable accordingly?
> 

This is meaningless, sorry can't parse. Ignoring it as others in the
community are doing already.

-- 
Regards,
Sudeep

