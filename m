Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EFFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 22:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSOm2Kh2rkS5d+lmSEnUMMcuVe69gg8OFGGjyBmcc20=; b=Zvc4/GaSs5jhXWQt5bMRhGSycy
	LiKGY4tSfhm2QGrBcn6IulYGbX+E1aQ/3JOil8Tvo8HLZ8bu+BY4VXMfev6FHv+47INP/x7Shkl5R
	oBTeTo5enaQzS/gqlmaiSYyYwosrAKa28/mUhHuvTOnn/3nLnSm22pBQLHalaXzf+R44Bb6KHRsMQ
	4464TXkWdjAoijSuOYjbgBWgEZX3pzd8n6Mm72dZWG5F/ygFmumYGs/QXzKLt8WGpDV+Tw2K+cgw6
	AWWltNvp+f0kjBH34WJ+VxUkgu2SbNwTZd9/5JRRj9fKRDU8Jufg52P7prHF7/UJp+uVNzeAktERI
	V4QphoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlnv-0000000DPzQ-039B;
	Tue, 14 Jul 2026 22:40:43 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlnr-0000000DPya-20W1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 22:40:40 +0000
Received: from omf09.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 17EC9C04A6;
	Tue, 14 Jul 2026 22:40:36 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id 68F5B20028;
	Tue, 14 Jul 2026 22:40:33 +0000 (UTC)
Date: Tue, 14 Jul 2026 18:40:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kernel-team@android.com, qperret@google.com,
 tabba@google.com, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] tracing/remotes: Add
 REMOTE_EVENT_CUSTOM_PRINTK() helper
Message-ID: <20260714184037.2daf3246@gandalf.local.home>
In-Reply-To: <20260708075435.47419-4-vdonnefort@google.com>
References: <20260708075435.47419-1-vdonnefort@google.com>
	<20260708075435.47419-4-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ux4411ip4e8gupicefg384teix9wtjo9
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 68F5B20028
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19AI8xridY/1XYZQXkip1JQIP3/WAuCU/M=
X-HE-Tag: 1784068833-43235
X-HE-Meta: U2FsdGVkX18wrqZpiGZBLOb8lhHF/GZHPknmYHAe4VYwZ0no09tBevZMCXc2iSsoPbmS2y9T4taShAi2StnD5BWdS1taTJMCKlfsYfgp/BE6pKmA2fk1rfbczZ7ukY9K/xaAYC6UnreC9jrKK3I2c987LInX4fGjvAejfBHBFWjp4mDp9HQRJhuseBRcfrwISkYSmR9RA1yNf6EoVCud6Up4bI9Rx3KDFn4GABKoRaTmWC8bV9sCd0vAfXWCJwnvMQR5HP14TibnEJC1q1YL8WqLMc0IPwCEYpMFHthwTB+pS8SiOtHas6+QrnoenYYBKb5PW0Hi2rOKUpT7o39XqeVjLmKTYCrRhnpT6CjlzduS9ljYyteuFDxPjr2t2f1wOUC6F4yJWOZ4oHCn/tmcDw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_154039_605378_3F2FD28B 
X-CRM114-Status: GOOD (  10.61  )
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

On Wed,  8 Jul 2026 08:54:34 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> The current REMOTE_EVENT() takes as a __printk argument a string format
> and a list of arguments, such as RE_STRUCT("foo=%d bar=%d", foo, bar).
> Add a REMOTE_EVENT_CUSTOM_PRINTK() where the __printk argument can be a
> function. This intends to support the creation of a "printk" event for
> the arm64 nVHE/pKVM hypervisor with a dynamic prototype and by extension
> a dynamic print format.
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

I'm assuming this goes in via the arm64 or KVM trees?

Acked-by: Steven Rostedt <rostedt@goodmis.org>

-- Steve

