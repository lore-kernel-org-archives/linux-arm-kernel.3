Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A1ECCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 16:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcIlGM8QvkqoaAAapVv9ARwsQ5TRUCrLXYbiIgf48X4=; b=DsbeSfMIRAzIfdH+YhyoJFWjDx
	i3kYxbxANWC9F74JapWpdYJWFpKPTdhPNGJa3bXu3UJofwLZoXJvewPUfqMRJlJLDbiJMny+HMDOI
	r0sl886x4IN9TfzDMgjmazKu/vRH3bRYTLKbbsVIk2DzCYXEMvW++DllOBTSNp39XFHqW++7VBZvn
	aUb97xO82XhVInVCgYqyUi3acJMuKlOH1MTKclcPVo2pJ5t1IF15Sb/feOtBn/p0999ulyNps1hor
	SI9VfZ04iS7honcMEmgQJgtAh5THEVB+QDCmoxa0PKOK4SQnNXVVJ2CCZKmhGjDZnkrKing/FLao9
	xYpCOPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Ayv-00000002Rst-0zpw;
	Tue, 07 Oct 2025 16:56:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Ays-00000002Rs0-0jnS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 16:56:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E89BC106F;
	Tue,  7 Oct 2025 09:55:54 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1996B3F66E;
	Tue,  7 Oct 2025 09:56:01 -0700 (PDT)
Date: Tue, 7 Oct 2025 17:55:53 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drivers: scmi: Add completion timeout handling for
 raw mode transfers
Message-ID: <aOVGGaY9NmKqUwPG@pluto>
References: <20250929142856.540590-1-a.shimko.dev@gmail.com>
 <20251003192233.1618447-1-a.shimko.dev@gmail.com_quarantine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003192233.1618447-1-a.shimko.dev@gmail.com_quarantine>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_095606_330385_A63C7052 
X-CRM114-Status: GOOD (  17.93  )
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

On Fri, Oct 03, 2025 at 10:22:33PM +0300, Artem Shimko wrote:
> Fix race conditions in SCMI raw mode implementation by adding proper
> completion timeout handling. Multiple tests in the SCMI test suite
> were failing due to early clearing of SCMI_XFER_FLAG_IS_RAW flag in
> scmi_xfer_raw_put() function.

Hi Artem,

LGTM now .... but ... now the commit message is no more describing what you
are doing, right ? ... it is no more handled with completions...

Please fix the commit message to reflect what you are doing; also it
would be good to at first explain the issue (like you are doing
already), and THEN describe the solution applied...

Following the rules in "Describe your changes" in:

	https://www.kernel.org/doc/html/v6.17/process/submitting-patches.html

(if you already know this ... just ignore me)

> 
> TRANS=raw
> PROTOCOLS=base,clock,power_domain,performance,system_power,sensor,
> voltage,reset,powercap,pin_control VERBOSE=5
> 
> The root cause:
> Tests were failing on poll() system calls with this condition:
>     if (!raw || (idx == SCMI_RAW_REPLY_QUEUE && !SCMI_XFER_IS_RAW(xfer)))
>         return;
> 
> The SCMI_XFER_FLAG_IS_RAW flag was being cleared prematurely before
> the transfer completion was properly acknowledged, causing the poll
> to return on timeout and tests to fail.
> 
> Fix ensures:
> - Proper synchronization between transfer completion and flag clearing
> - Stable test execution by maintaining correct flag states
> 
> An example of a random test failure:
>  817: Voltage get ext name for invalid domain
>      [Check 1] Get extended name for invalid domain
>        MSG HDR        : 0x04585c09
>        NUM PARAM      : 1
>        PARAMETER[00]  : 0x0000000c
>        CHECK STATUS   : PASSED [SCMI_NOT_FOUND_ERR]
>        CHECK HEADER   : PASSED [0x04585c09]
>        RETURN COUNT   : 0
>        NUM DOMAINS    : 11
>        VOLTAGE DOMAIN : 0
>      [Check 2] Get extended name for unsupp. domain
>        MSG HDR        : 0x045c5c09
>        NUM PARAM      : 1
>        PARAMETER[00]  : 0x00000000
>        CHECK STATUS   : FAILED
>            EXPECTED   : SCMI_NOT_FOUND_ERR
>            RECEIVED   : SCMI_GENERIC_ERROR  : NON CONFORMANT
> 
> After making these changes, the tests stopped failing.
> 

I think also you can trim and drop this further explanation down here...
you have described clearly enough the issue above...

> $mount -t debugfs none /sys/kernel/debug
> $scmi_test_agent
> [  127.865032] arm-scmi arm-scmi.1.auto: Resetting SCMI Raw stack.
> [  128.360503] arm-scmi arm-scmi.1.auto: Using Base channel for protocol 0x12
> $tail -n 6 arm_scmi_test_log.txt
> ****************************************************
>   TOTAL TESTS: 167    PASSED: 120    FAILED: 0    SKIPPED: 47
> ****************************************************
> 
> An ftrace log with of passed test:
> 0)               |  scmi_rx_callback()
> 0)               |    scmi_raw_message_report()
> 7)               |    scmi_xfer_raw_wait_for_message_response()
> 7) + 22.000 us   |      scmi_wait_for_reply();
> 0)               |        /* scmi_raw_message_report*/
> 7)               |    scmi_xfer_raw_put()
> 
> An ftrace log with of failed test:
> 0)               |  scmi_rx_callback() {
> 0)               |    scmi_raw_message_report()
> 5)               |    scmi_xfer_raw_wait_for_message_response()
> 5) ! 383.000 us  |      scmi_wait_for_reply();
> 5)               |    scmi_xfer_raw_put() {
> 0)               |  /* scmi_raw_message_report*/
> 
> Link [1] https://gitlab.arm.com/tests/scmi-tests/-/releases
> 
> Fixes: 3095a3e25d8f7 (firmware: arm_scmi: Add xfer helpers to provide raw access)
> Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> ---
> Hi Cristian,
> 
> Good point about CONFIG_ARM_SCMI_RAW_MODE_SUPPORT_COEX. 
> 
> I can confirm this setting doesn't impact the test failures in my environment.
> The issue reproduces consistently with COEX both enabled and disabled.
> 
> Thank you!
> 

Good...

Thanks to you
Cristian

