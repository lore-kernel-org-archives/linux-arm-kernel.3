Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E9DCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOWoKg8bMi6Do4nzQIDEVIfSXElFBp+RZqF3L/UFCXQ=; b=jx5j82qse30iQ1yYju9jMQ8nV0
	e/iqhQ6d43KI5cOHk1XXUsNLF4so18ECr7n6KlJYnLAFJBx6GNT8TPs70IdklZUgkhmaG8ECbTt0z
	i5QWEnSjfygfw2qNrCIaK5LJ7IGQVI2Obgt1QcUXdc+qAyM5ujZGdHp0zShIDHAU0XZr4B76mKDRG
	/h0/6zhLGXebkf17lWin8tlgV014n9NzYUQVcrYnyJQiOBQEvYTvg+TM12BuAiY3fUiYNelSHtOm0
	NJ6KQEmmTRySL4mI1qUVlMncwtVqzlHONHb0JKqR4TBnmfSNar0xIUTGHa1LSM4JSbUfw2JjJX36+
	zuLAG32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdCt-000000046il-0yWy;
	Mon, 08 Jun 2026 16:52:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdCq-000000046hz-1kUL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:52:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FCB632D0;
	Mon,  8 Jun 2026 09:52:00 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D90833FD88;
	Mon,  8 Jun 2026 09:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780937525; bh=GXQqJibXtDdJXe76ihrp/1G0s+9m23d5580fR8hWzTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEQff/fbCYy8LXtoslR1up/38Nh1BCk/F9foSLQ4P4AyB1WfvP7G6VPMDdUM9M2z5
	 uL5u9WtBgSvBMszAxf3fhPq8UDsRM7giLo7btZhdkbqGDZ7WhSJiu2T0R2WHo1gODm
	 68EL/oyNuDPd3os1Scpdrz/mTgzlj9EWDoZ6vo9E=
Date: Mon, 8 Jun 2026 17:51:57 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	guomin_chen@sina.com, linux-arm-kernel@lists.infradead.org,
	peng.fan@nxp.com, quic_xinqzhan@quicinc.com, sudeep.holla@arm.com
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
Message-ID: <aibzLcZiVwtUHAgV@pluto>
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aibW10NMmzw3QnZ5@mai.linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_095208_511299_BA569D44 
X-CRM114-Status: GOOD (  15.23  )
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

On Mon, Jun 08, 2026 at 04:51:03PM +0200, Daniel Lezcano wrote:
> On Mon, Feb 03, 2025 at 10:01:54AM +0000, Cristian Marussi wrote:
> > Emit proper MODALIAS uevents when SCMI devices are created and make sure
> > all the standard protocol devices are requested when the bus is
> > initialized.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> 
> Hi Cristian,
> 

Hi Daniel,

nice to hear from you in the SCMI land :P

> what is the status of this patch ?

....I'd say forgotten/abandoned...I worked on that a bit when I realized
only part of the stack was autoloaded...then it did NOT received much
love and then I forgot it....buried by other prios....

Indeed I have still the local branch...but after a quick check I think
is the same as the RFC posted.

bbd14b0f7733 firmware: arm_scmi: Add bus support for autoloading
8d982393b505 firmware: arm_scmi: Generate aliases for SCMI modules
383c127faa97 (scmi_vendors_autoload_V2) firmware: arm_scmi: Add aliases to transport modules
00caa894bce2 firmware: arm_scmi: Add module aliases to i.MX vendor protocols
d900620c46bb firmware: arm_scmi: Support vendor protocol modules autoloading
4fe57bbeb6dc firmware: arm_scmi: Allow transport properties for multiple instances
ad236e5a7f01 Linux 6.13-rc1

...where scmi_vendors_autoload_V2 is merged already...

Thoughts ? Plans ?

Thanks,
Cristian

