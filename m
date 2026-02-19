Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1852DE9A055
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 17:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2nwEc0amxmvspErybeoJMi8CjW2qJvF4iBm0royAQ8=; b=L1zfAYsr332GauCN5u+f9w0irM
	faVkG1HTBhesyGaVBQGux1MpYCdDn3ud8hx2mEzbRSkDASv8zK2oa/e7faXbTkujNdil2iP7CZFlF
	nlWgnj+EQHGoQ9Ii6Wrvs/+U3ek+ckv8wcfWUw8i8sU7pr3jSomT6g1cPuZjpeHOxmD34vfiV+wh9
	EkB4rqVVpQim1z+NTBrgy3QCHz2s9Oq5fviHkA4ps2QsiXaxzoEVbn3BOUrwXs/bEZGs/55850DzF
	2jd20n60CdxQlHJBu+Qu9Psl1CZaJYB5vGY3MDmnGOE0qbCjvQsbiNiI9xfsXIz3DIOdpCRcx6ek9
	xv2/vk7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8FO-0000000Bjqb-37Ib;
	Thu, 19 Feb 2026 17:55:30 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8FL-0000000BjqG-1x19
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 17:55:29 +0000
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id D4C8A160672;
	Thu, 19 Feb 2026 17:55:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id 70B362E;
	Thu, 19 Feb 2026 17:55:19 +0000 (UTC)
Date: Thu, 19 Feb 2026 12:55:25 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 05/30] tracing: Introduce trace remotes
Message-ID: <20260219125525.12afbcfb@gandalf.local.home>
In-Reply-To: <20260219150307.14538-6-vdonnefort@google.com>
References: <20260219150307.14538-1-vdonnefort@google.com>
	<20260219150307.14538-6-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 70B362E
X-Stat-Signature: u1he8b9g4za14gbwiygmi6hbhxy3z4a6
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+WMo3F+bs2zk/Y4yoqF8XVhVwxseeWyj8=
X-HE-Tag: 1771523719-921131
X-HE-Meta: U2FsdGVkX1/LrJvJg4Wy78/u4/54AVEg1GJ5/mPuHr184EDrrqbRAapQiOKf1wx/fZLKN9iKRYe7XUwEmWB99Jo1BUX+JwLqRCR1mB6OKIhrZRTp2AdWwply1KIgOUEvvCSe35AwcfN+ktt5BlnYkneOlwAgds9O2H04tY3J+Mie/F5gCQrBAoukRUvzZ70v9jSsVY9wD8fUJ4ocO/oL9m40P91q8gNGt66xvjt1fKhnc5zqXNVQk6EIsmNbU1aqj8l8N1+t0ebr46WcAN/brlqaQOlxxl6SzgzAnRO8fpgORzlMhzyHmqEuZJgStuNN6+Z1t6u97wytW8IM5mDrMxGi22eUnN1nkSkkN/WaTfLRbQME+WLTRFEmgbEIYi5U1sLw0qQ7yJG1eMFmvq5Pvw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_095527_570305_24485596 
X-CRM114-Status: UNSURE (   9.65  )
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

On Thu, 19 Feb 2026 15:02:42 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> A trace remote relies on ring-buffer remotes to read and control
> compatible tracing buffers, written by entity such as firmware or
> hypervisor.
> 
> Add a Tracefs directory remotes/ that contains all instances of trace
> remotes. Each instance follows the same hierarchy as any other to ease
> the support by existing user-space tools.
> 
> This currently does not provide any event support, which will come
> later.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

