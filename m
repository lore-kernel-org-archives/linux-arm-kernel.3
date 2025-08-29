Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B87CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jsV1N2Fv4ulkghbhFeFEUAmQKbYOfVE+WQSv/kSC5Q=; b=CwdJNvjcdwepQZgbsMFjD7JkZp
	40Z2caQMCh+HBSw6ldYBGTnyLR+AP3KJ0g82pnDrhF4JdR5XgAqfiHvHQhUPjAhBeBPXP7x4q5GHY
	Q/6EJ810AGDuDO0lY/yxDuY2Mc4v9hHmItWREzO+lR6w6E0kE5Aex9DZUbrc7Y9vVhCCJj+Cs1BBC
	H4jCUCeArZR9s6gZ4+MCsMf4NxBpYKIpnAZvQqvG7bcjFqT0B+ou4IS0PB+74XfirkQ4ki8tuFYdn
	b8pcebQunaowTrTEffAI4Yvp/MPz9VY4pcipUgVcHG/zaHtXB+O5o4LcJ26FbOaVl+mWSUAuMrQcc
	t4aO+oCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oP-00000007CNu-05dM;
	Sat, 30 Aug 2025 00:51:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us6Pp-00000006sq4-0XHR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 21:13:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87DE51BA8;
	Fri, 29 Aug 2025 14:13:33 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBAF63F738;
	Fri, 29 Aug 2025 14:13:39 -0700 (PDT)
Date: Fri, 29 Aug 2025 22:13:29 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: quirk: fix write to string constant
Message-ID: <aLIX-XAYE--byaue@pluto>
References: <20250829132152.28218-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829132152.28218-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_141345_208043_C35419DA 
X-CRM114-Status: GOOD (  12.06  )
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

On Fri, Aug 29, 2025 at 03:21:52PM +0200, Johan Hovold wrote:
> The quirk version range is typically a string constant and must not be
> modified (e.g. as it may be stored in read-only memory):
> 
> 	Unable to handle kernel write to read-only memory at virtual
> 	address ffffc036d998a947
> 
> Fix the range parsing so that it operates on a copy of the version range
> string, and mark all the quirk strings as const to reduce the risk of
> introducing similar future issues.

Hi,

indeed when implementing this I was a bit doubtful about the in-place
overwrite approach that I used during the ranges parsing...but since
each quirk was indeed initialized once and its range parsed once, it
seemed fair to use the string itself as a sort of scratch area while
parsing it into integers and avoid the local copy...just I haven't
considered the possibility that such strings could be stored in a RO
segment...and I got no error on my setup....

Anyway, good catch, it is certainly better to operate on a copy.

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

