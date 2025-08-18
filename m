Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784F6CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3sUXaHvSno9vgDmRjaQ2GQLGN6kIruPOo7ESQ9XE48=; b=VrwEzPakvLSRI0WSZ+GOqB9Dd5
	de0mKXMtSnstxkaJr+De42as4vMqwDitEPN+YlvJcUtWRCh0KBRlJO5oXJfek6fCCaJaADI5dRYQV
	DayIulucQ+k4khx4JoYJBk4x7jha8UhFGrI1hgH/zw8fJcZAZ9JchF4lBZmVkYPeY2Acq7Pc3qU8c
	jzdXEhhxbSmuh31eRExIP8IQIn0K9Qgx9B5eB+KUCIGDC5HIoPEJILMfYgDpGs5wEpCnK++hD7baK
	jOJEfXDi58K5yn2nAd/omLjkKjmXL1QIfK0/g+VUV5LDDLKnZ4zfrTOF8dWyfGvCjCwWAm1yz8w9a
	DcgdP60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1AK-00000007ohY-2oZp;
	Mon, 18 Aug 2025 14:48:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwza-000000078iD-2Nu1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 10:21:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5864B1596;
	Mon, 18 Aug 2025 03:21:21 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E4E53F63F;
	Mon, 18 Aug 2025 03:21:27 -0700 (PDT)
Date: Mon, 18 Aug 2025 11:21:24 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, james.quinlan@broadcom.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: scmi: Account for malformed DT in
 scmi_dev_used_by_cpus()
Message-ID: <20250818-imposing-salamander-from-pluto-0f0eac@sudeepholla>
References: <20250815205714.1545571-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815205714.1545571-1-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_032130_650241_BD6E6833 
X-CRM114-Status: GOOD (  11.19  )
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

On Fri, Aug 15, 2025 at 01:57:14PM -0700, Florian Fainelli wrote:
> Broadcom STB platforms were early adopters of the SCMI framework and as
> a result, not all deployed systems have a Device Tree entry where SCMI
> protocol 0x13 (PERFORMANCE) is declared as a clock provider, nor are the
> CPU Device Tree node(s) referencing protocol 0x13 as their clock
> provider.
> 
> For those platforms, we allow the checks done by scmi_dev_used_by_cpus()
> to continue, and in the event of not having done an early return, we key
> off the documented compatible string and give them a pass to continue to
> use scmi-cpufreq.
> 

With the multi-line comment fixed as suggested by Viresh.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

