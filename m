Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09B4D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6eHL35aBvhp0PDWt3UZQ2yAYaMLyL5jRSPscP577/Y=; b=f5JXd4zB6YY0iOi6/yEqYyUDyd
	7wf89+lFI7ZnZ418xOdDSQ09WqSkI5v4pQexRgO+i+VKIJjevHiSTUKEyX/qzMCmIQyk0w5powZFa
	VdfjN3isj8no985ixJId/bfsj5nEarlR1GteBkN2az/UVwobBvzEzj2XdvpQxjdhrB5Azk5wNS5Za
	KSEoxdonFc9688CPn6VapCpVO4sTRsKco4iUlegzqUV4jam9LV2kbHxRKVUZNuwGOu1oIm4wzMsDe
	+oBrFVC9SF9zYBwEGLIjDsV+QEtkFsICGAbaNUZxXi6muXryy9olAvOaX+erKFCiwv/g7iXAEn0bM
	OTfgPUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0v3-00000003IZa-0Xyt;
	Mon, 01 Dec 2025 10:14:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0v1-00000003IYf-02Bt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:14:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1DBD43BC1;
	Mon,  1 Dec 2025 10:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2448BC4CEF1;
	Mon,  1 Dec 2025 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764584045;
	bh=Qx9ZtATPii3IUPLCfrpZlIGQv01IxvcYqaWUxrqqRns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yeK01qT6shJ3r9pWaj6JvAn70pI3W863TODZ0anCxyfmo1CQdhJ55lCUGRQTcSJ5y
	 Cu0+mTWBHwZp+Itb9IxKRAIuoAw/n4XSqIHs9pIh/PHNL8XEmVvM06mMRr3bngBGtN
	 yjdB2h17qkDB5HwQpLpaEIkNZMh+WHIXFAdYHu/g=
Date: Mon, 1 Dec 2025 11:14:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, mathieu.poirier@linaro.org,
	leo.yan@arm.com, Al.Grant@arm.com, jserv@ccns.ncku.edu.tw,
	marscheng@google.com, ericchancf@google.com, milesjiang@google.com,
	nickpan@google.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: etm3x: Fix cntr_val_show() to match
 cntr_val_store() behavior
Message-ID: <2025120149-broadways-upon-ad72@gregkh>
References: <20251201095228.1905489-1-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201095228.1905489-1-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_021407_109260_364002C2 
X-CRM114-Status: GOOD (  24.00  )
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

On Mon, Dec 01, 2025 at 09:52:28AM +0000, Kuan-Wei Chiu wrote:
> The cntr_val_show() function was intended to print the values of all
> counters using a loop. However, due to a buffer overwrite issue with
> sprintf(), it effectively only displayed the value of the last counter.
> 
> The companion function, cntr_val_store(), allows users to modify a
> specific counter selected by 'cntr_idx'. To maintain consistency
> between read and write operations and to align with the ETM4x driver
> behavior, modify cntr_val_show() to report only the value of the
> currently selected counter.
> 
> This change removes the loop and the "counter %d:" prefix, printing
> only the hexadecimal value. It also adopts sysfs_emit() for standard
> sysfs output formatting.
> 
> Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Build test only.
> 
> Changes in v2:
> - Redesigned the fix to match cntr_val_store() logic (display only the
>   currently selected counter) instead of attempting to list all
>   counters.
> - Removed the loop and the "counter %d:" prefix.
> - Switched from sprintf() to sysfs_emit().
> - Refactored control flow to use a single return point.
> 
> v1: https://lore.kernel.org/lkml/20251121002350.1166758-1-visitorckw@gmail.com/
> 
>  .../hwtracing/coresight/coresight-etm3x-sysfs.c   | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

