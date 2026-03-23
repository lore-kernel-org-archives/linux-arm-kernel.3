Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7D7F483DD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 18:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMxInCPRWzotOXJMn2ltFilIAzrwSwjYzhNo9kN9svk=; b=HW1ynoGm/VNEB7d8j6/W807Wqj
	XgzuhZVVT3z8UHSJHwq/mn9/B5NHtyEhH+GUuwAt4B+U7/MZDEZdstPqsCNvQx1rbHeANXIjUfgHn
	tMMucVs9ht3zXwTnFl10NjP5K4SCgLX8LuJM4WvxOy8zTe1mFzb6fShtCpbkQ9lgThe/CNyaWNcVg
	aVEEDpo4S4b7l+ozSHEvmkOhxa+uS8wvg7SwR0rRA0DDBH1lNeuGYZO7K+c5GVthPlcaNNLlKDFrB
	aN0UyqVNLMMv8xbQbqyuWrtf5Xz3mHEEP/SPM/gQ3CJbVuBB2Quw0XaJaos0VDaOznb9eOBdb5Ohm
	8+wU36hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jbm-0000000HIWa-3xqj;
	Mon, 23 Mar 2026 18:02:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jbk-0000000HIVv-2Ga1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 18:02:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DC711476;
	Mon, 23 Mar 2026 11:02:24 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 669563F694;
	Mon, 23 Mar 2026 11:02:26 -0700 (PDT)
Date: Mon, 23 Mar 2026 18:02:18 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] firmware: arm_scmi: Lazy clock rates and bound
 iterator fixes
Message-ID: <acGAKmPkfdmxvMR_@pluto>
References: <cover.1774283748.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774283748.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_110232_613047_1715C84C 
X-CRM114-Status: GOOD (  16.58  )
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

On Mon, Mar 23, 2026 at 05:56:09PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,

Hi Geert,

> 
> This patch series:
>   - Fixes an out-of-bound access in lazy clock rate handling,
>   - Synchronizes bound-iterator cleanup naming between documentation and
>     code.

thanks for this !

I was just chasing down exactly the same issue, since it was flagged by
our CI on a rockchip board (together with some KASAN splat...)...but I had
still to manage to get my hands directly on that board to start
debugging properly ... so ...

... very happy that you beat me at this:P !

While waiting for the board and trying to figure out what could cause
the fatal issue I spotted something more to be rectified in the core of
the iterators, BUT I dont think it would have solved the issue like your
fixes.

In a nutshell, it was the possibility of an integer undeflow due to an
unchecked subtraction between unsigned.

---8<---
commit 65bd4a11333098fbf4c60f3bc59c971be1cd259d (mygitlab/scmi_dev, scmi_dev)
Author: Cristian Marussi <cristian.marussi@arm.com>
Date:   Mon Mar 23 08:19:32 2026 +0000

    [TODO] FIX Iterator boundary checking
    
    [TODO] FIX Iterator boundary checking
    
    Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 8b5f477758a0..562977438e60 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1845,7 +1845,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
                if (ret)
                        return ret;
 
-               if (st->num_returned > st->max_resources - st->desc_index) {
+               if (st->num_returned + st->desc_index > st->max_resources) {
                        dev_err(ph->dev,
                                "No. of resources can't exceed %d\n",
                                st->max_resources);
---8<----

Anyway, next dsys I will test all of this with your series, but since my
original series indeed was on hold now due to these issues AND because still
lacking clock-MAINTs acks, I am not sure if:
 
 - we'll merge your fixes into my series while maintaining of course your
   authorship (instead of applying the series on top)

 - Sudeep will still queue any of this for this cycle

Thanks a lot for the debug and fixes to my cr...y stuff :P

Cristian

