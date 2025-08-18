Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1C8CA0EF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/bJqloyC3vCA6p2lfYldwlzzzsWI9Q37w9egv3XGuw=; b=LGGDKX9evvEVLWqKkO/gK6mMG5
	SinysL2TybRa6MkwlvOt1s1uEa40hawbYQLIRZMAD8z9xgVaK+JEJbb/fmo4YzN478LoE9ra9nMsc
	mJoH2waJf8va1P4ePBkSQppsJrVw1aT//mMr8T+O4nwW+rFDk1NUlArO+dZ8bSv3o2Mq2Tz32y1Mg
	Miy/vmq0A9QE7IWJpDMbIC389x5IdzttZED+4Dj2raxY8DsA25a2v82F9cQ+2Vg7q4XCnOa4puCPU
	DPyyUkhcckv7ly4dis1Xu0vgz+tp3PvjIEyuhOgaUq/PJGLzg/7RVUn69q0ZWg3GJt4Atr5a3GXpW
	DztCdLTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1AL-00000007ojB-2VJU;
	Mon, 18 Aug 2025 14:48:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unx4Y-000000079Sh-2Ybe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 10:26:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6CED1424;
	Mon, 18 Aug 2025 03:26:29 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDFDA3F63F;
	Mon, 18 Aug 2025 03:26:35 -0700 (PDT)
Date: Mon, 18 Aug 2025 11:26:33 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
	james.quinlan@broadcom.com, "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Peng Fan <peng.fan@nxp.com>,
	Mike Tipton <quic_mdtipton@quicinc.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: scmi: Add quirk to disable checks in
 scmi_dev_used_by_cpus()
Message-ID: <20250818-righteous-numbat-of-champagne-d5b71c@sudeepholla>
References: <20250814225155.3519000-1-florian.fainelli@broadcom.com>
 <aJ7rBgce5eWSkkk3@pluto>
 <79711a6c-8b59-43c9-bbbc-369be1608a49@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79711a6c-8b59-43c9-bbbc-369be1608a49@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_032638_684437_08D0C788 
X-CRM114-Status: GOOD (  11.38  )
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

On Fri, Aug 15, 2025 at 09:46:22AM -0700, Florian Fainelli wrote:

[...]

> which would be more in line with checking the Device Tree only, and it would
> also allow for unmodified backports to reach the stable trees. Contrary to
> what I suggested privately however, this check is done later, so we leave a
> chance for properly formed DT to return "true" earlier on.
>

Completely agree on keeping the backports for stable simple without the
need to backport the quirk infrastructure.

> What do you think? I am now leaning more towards that solution that
> leveraging the quirks as I agree it is somewhat unrelated.
> 

I am confused here. Do you prefer not to have SCMI quirk based solution
upstream forever ? Or are you OK to revert the fix and move to quirks
say in v6.18 and above ?

-- 
Regards,
Sudeep

