Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C731EB1054
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 14:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xcyvy0hY9QeImFtkFkXgzm9/GiU96F/MAFJKt+yYvBI=; b=b4hAbr/chuCIdkXkp9DzQA6hgY
	npELKUkJPTB3EnpvIVDH2FIre1MoWjJBksGaJPj5o/wbF/YoPF81Uhxrg5TWEFjOI1m0+IQ0YaIfh
	lYCRTdDZa7xmhFl4/NnfSxGvPVDwfpH8xOFXh0FgLckjDhDD6PH8C/FJbIq19OvjV5DY3EePIMagF
	o15CNmy2yeIKnJUn0qg0MJVTwEXQwezOx/Aw7qZrcTPS4EjlIYC7WRtsp+2zC0z5Q50SOQCuOr8sm
	2cqJ5olmJZyqXxaAeB+pJYuUCdVncUeXCfGSXtLeNHPGMnqbWOJDUMo4RgY4uoz4FuK1Tr57cYlzn
	QywMiKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyIW-00000009ikw-32iy;
	Tue, 10 Mar 2026 14:43:00 +0000
Received: from smtprelay0014.hostedemail.com ([216.40.44.14] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyIU-00000009ikb-2722
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 14:42:59 +0000
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 0E62B1B6C86;
	Tue, 10 Mar 2026 14:42:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id B501E40;
	Tue, 10 Mar 2026 14:42:51 +0000 (UTC)
Date: Tue, 10 Mar 2026 10:43:01 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 00/30] Tracefs support for pKVM
Message-ID: <20260310104301.665bc684@gandalf.local.home>
In-Reply-To: <20260309162516.2623589-1-vdonnefort@google.com>
References: <20260309162516.2623589-1-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 4dz8tkqbqdur7t1oxrqypc1fny4f8est
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: B501E40
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+DNCjV7dq3BIMgJPb6chTxzLYz8EtnyHM=
X-HE-Tag: 1773153771-423745
X-HE-Meta: U2FsdGVkX18n6LeKxHu/K8lrNosbg33R7MUM0BYl15C/a6ynYReUnFyq+jAHHl9dj4LFnQshyXL7OLItBj+Eouj8fvPWaNp+LBnrNYZf3jEjjzX+E9q+iYmzFNgGYC4oM2qcAfvLkzMgpczH6srVhwqHNl5YyzW763zKc+lvNjlXGgELd3NCBbMrEf0wcGQyDbN5iiU6Djv/+CTyk9l5zNAjc5aqNh0vIjGFmfr0g7FOAfXUk1swp0mgBxbCpDyO2NX3K6xUbTxq8kf1UPQ4lWjplk2N71zu7idjH6ZMuBi6XoGA/QJ1Vj612bYcVTPm/l0TqqB0xWcxDSOvK/OipdOWZhpsceIVikH36Jz2YobqoPOoKsqmGQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_074258_604056_CC3AF127 
X-CRM114-Status: GOOD (  12.60  )
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

On Mon,  9 Mar 2026 16:24:46 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:


> 5. pKVM
> -------
> 
> The pKVM support simply creates a "hypervisor" trace_remote on the
> kernel side and inherits from simple-ring-buffer.c on the hypervisor
> side.
> 
> A new event macro is created HYP_EVENT() that is under the hood re-using
> REMOTE_EVENT() (defined in the previous paragaph) as well as generate
> hypervisor specific struct and trace_<event>() functions.

I pulled in all the tracing related patches (1-18) and pushed it to my repo:

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git  ring-buffer/for-next

It's based on top of v7.0-rc3. I'm not going to rebase that branch,
although I may built on top of it, but for now, feel free to merge it into
the arm tree and put the rest of the patches on top of it.

-- Steve

