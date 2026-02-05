Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ED3ECD992
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 17:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVuoVlOttulRwXmLRw/7kZtGhL1YHMyexJuZoVbtFZc=; b=sJpljvRRjUIK1yOOwbZR9DZWd+
	69xV51ghgzJgUnzInRMEIgtYgNhaYeYszDYH2i1LaguGpIWHJK8loyunAPhZXXWuOUIGGRXj31eKl
	GlGlX1M3Orq3d9fxIUOxt0MWL96KEK3eJKDa45dMuEjNGHouqRzq1dB23+mgC9WLt5yo+1lmme0x+
	h5yp5+diMhBieEu6+9K+D6YBY29RAPzT2aGXSOO5Xe7KgAbL2mR1TEPPATgKsV1l7jSG0fOZpty1U
	tvBmheb4uVbr09kXEHtVWPADtBhxBxr/6gTJ6XRdlQVL00RAP3Mo7cAuYabtMirAVj7ZUrM+rwU2B
	qdWKfR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3VE-0000000AKKP-37ut;
	Thu, 05 Feb 2026 17:50:54 +0000
Received: from smtprelay0014.hostedemail.com ([216.40.44.14] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3VA-0000000AKK4-3dK4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 17:50:51 +0000
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id C80D51A0171;
	Thu,  5 Feb 2026 17:50:45 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 169DA1D;
	Thu,  5 Feb 2026 17:50:42 +0000 (UTC)
Date: Thu, 5 Feb 2026 12:51:17 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 00/30] Tracefs support for pKVM
Message-ID: <20260205125117.0b79f6e3@gandalf.local.home>
In-Reply-To: <20260204174502.06d6e02e@gandalf.local.home>
References: <20260131132848.254084-1-vdonnefort@google.com>
	<20260204174502.06d6e02e@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 169DA1D
X-Stat-Signature: h9e84gj8nf46jc5d1eypqiymijg5xeeh
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX193k99BonF8qsoA8POq9JGR6cSJ934+zxw=
X-HE-Tag: 1770313842-595241
X-HE-Meta: U2FsdGVkX1+jZ4cuHM+xa8vsrI/HeqIYZp+GIogIontNWqx6b8Nc2SH3bzCsJym1usl2Bl71T4qZrhWh9OUl9ZUEfsuK05tTdFjMvOlS8EbrCKUBr9uDcMrPm9wXXjZ1ZvVJkUDjDXLa5XG7I2Ta+E0QpwjAWfJlC8MufFM87HbwT0wXTNwzu/zgl5Qz+qGVM988+R+tnoYux7Xs1wjUqzsJHwNR1K8oUNU4coEfFeOtoXeQD4KujjFrlVefAN0dKTkpYsIly3g7Kuo062Gk9m1idIqRDzpE0FbZPdxe/T5SfkvdHKflxRezraVw370uNQuyiTXMa9uH8ftD/AL0fLwqGCHQwCLFy+bc3AFe/BGjdTEfSnnwvBzes3VlEi7Pyi3w7zsa+pkib7sXwjRnStTQqYYgHaSO0e7yJLOvuyc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_095048_967096_C0C0749B 
X-CRM114-Status: UNSURE (   9.53  )
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

On Wed, 4 Feb 2026 17:45:02 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> > changes since v10  
> 
> BTW, it's always nice to add a link to the previous version here. That way
> it makes it easy to backtrace from one version to the next (and reviewers
> to see what they said the last time).
> 
> Changes since v10: https://lore.kernel.org/all/20260126104419.1649811-1-vdonnefort@google.com/

So I finished my review of v11. Still some with comments, and the ones I
didn't have comments for I added my Reviewed-by tags.

-- Steve

