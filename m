Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA43CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xs93ZCtlhpIvRhJ1pOVoEwyHus2xkJgPeBnPjc7CvXw=; b=dZPweJCx6KD77mV4sZZLQGME1P
	yOw/hn+GAVMN5fQKtJppZ2RYRRQJXGIdAs3yVT/vHnKEguBmTuQDNtGqg6gEeFaPG7a7SVK23EhRT
	isOBOzKsPNuR++naz5FkWRktiZz9oFP0Opdqa/b/yYxob4aBhFklltsImQTES3gRP0I9Lj9lg35A5
	37ZnSwo6S0BHV4tI4LuQ8W/y115ZCmaxA/DQx18aFMTYnuseUzvqBCE+m4jbX6VdYaMSgtI+et2XS
	5KsvHied++fnY7V7DYjGwotqgKges1HxhFeM8Jkn7HP0NcPHAO3mewxiBgAUXgLWwOvoP+S5dZhnY
	8RHlIVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3vSp-00000007TO2-3XuA;
	Wed, 01 Oct 2025 11:57:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3vSn-00000007TM4-2Fzp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:57:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0E6F16F2;
	Wed,  1 Oct 2025 04:57:30 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 810463F66E;
	Wed,  1 Oct 2025 04:57:37 -0700 (PDT)
Date: Wed, 1 Oct 2025 12:57:27 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Artem Shimko <artyom.shimko@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>, a.shimko.dev@gmail.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: scmi: Add completion timeout handling for raw
 mode transfers
Message-ID: <aN0T0tvsL6t6R3yF@pluto>
References: <20250929142856.540590-1-a.shimko.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250929142856.540590-1-a.shimko.dev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_045741_693315_B0144C13 
X-CRM114-Status: GOOD (  19.80  )
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

On Mon, Sep 29, 2025 at 05:28:55PM +0300, Artem Shimko wrote:
> Fix race conditions in SCMI raw mode implementation by adding proper
> completion timeout handling. Multiple tests[1] in the SCMI test suite
> were failing due to early clearing of SCMI_XFER_FLAG_IS_RAW flag in
> scmi_xfer_raw_put() function.

Hi Artem, 

> 
> TRANS=raw
> PROTOCOLS=base,clock,power_domain,performance,system_power,sensor,
> voltage,reset,powercap,pin_control VERBOSE=5
> 

Glad to see that someone is using the test-suite im RAW mode out there
in the real world :P

> The root cause:
> Tests were failing on poll() system calls with this condition:
>     if (!raw || (idx == SCMI_RAW_REPLY_QUEUE && !SCMI_XFER_IS_RAW(xfer)))
>         return;
> 
> The SCMI_XFER_FLAG_IS_RAW flag was being cleared prematurely before
> the transfer completion was properly acknowledged, causing the poll
> to return on timeout and tests to fail.
> 

I have to say I had seen some anomalies, hardly reproducible, and I
think you have a point here, good catch !

The xfer flags handling is racy and it could lead to the observed
anomalies...BUT....

> Сhanges implemented:
> 1. Add completion wait with timeout in  scmi_xfer_raw_worker()
> 2. Signal completion in scmi_raw_message_report()
> 

.. I think the fix in your patch is overkill...it is really not needed
to add another layer of synchronization like you are doing, because the
bug is really around the xfer put and it is very well evident, now that
you have pointed at it...

What about, instead of your patch, this:

-----8<----
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 801d59e6b3bc..d3453130896a 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -822,6 +822,8 @@ __scmi_xfer_put(struct scmi_xfers_info *minfo, struct scmi_xfer *xfer)
 
                        scmi_dec_count(info->dbg->counters, XFERS_INFLIGHT);
                }
+               xfer->flags &= ~SCMI_XFER_FLAG_IS_RAW;
+               xfer->flags &= ~SCMI_XFER_FLAG_CHAN_SET;
                hlist_add_head(&xfer->node, &minfo->free_xfers);
        }
        spin_unlock_irqrestore(&minfo->xfer_lock, flags);
@@ -840,8 +842,6 @@ void scmi_xfer_raw_put(const struct scmi_handle *handle, struct scmi_xfer *xfer)
 {
        struct scmi_info *info = handle_to_scmi_info(handle);
 
-       xfer->flags &= ~SCMI_XFER_FLAG_IS_RAW;
-       xfer->flags &= ~SCMI_XFER_FLAG_CHAN_SET;
        return __scmi_xfer_put(&info->tx_minfo, xfer);
 }
---->8----

..because the xfer itself is refcounted properly, BUT as of now the
flags are cleared out of the block inside __scmi_xfer_put:

	if (refcount_dec_and_test(&xfer->users))

...and that is the problem.

The above patch solves for me all the observed anomalies...

... probably EVEN BETTER if you just clear all:

---8<-----
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 801d59e6b3bc..914510de3abb 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -822,6 +822,7 @@ __scmi_xfer_put(struct scmi_xfers_info *minfo, struct scmi_xfer *xfer)
 
                        scmi_dec_count(info->dbg->counters, XFERS_INFLIGHT);
                }
+               xfer->flags = 0;
                hlist_add_head(&xfer->node, &minfo->free_xfers);
        }
        spin_unlock_irqrestore(&minfo->xfer_lock, flags);
@@ -840,8 +841,6 @@ void scmi_xfer_raw_put(const struct scmi_handle *handle, struct scmi_xfer *xfer)
 {
        struct scmi_info *info = handle_to_scmi_info(handle);
 
-       xfer->flags &= ~SCMI_XFER_FLAG_IS_RAW;
-       xfer->flags &= ~SCMI_XFER_FLAG_CHAN_SET;
        return __scmi_xfer_put(&info->tx_minfo, xfer);
 }

---->8----
 
...to simply clear all flags when xfer is put...

If this solves for you too, please send a new patch with also a Fixes tag.

Last but not least, are you running the test-suite against a Kernel
configured with RAW cohexistence disabled ?

	CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX = n

...because having RAW COEX enabled when running the test-suite could lead to more
false positives even with your patch applied, due to the interference of regular
drivers..

Thanks for this !
Cristian


