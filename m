Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB53D46C16
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DDvGidagdS/EW1E2ilJvG+REEMimqY9yOwH6NLfojI=; b=zrDhdWTzYB2lTD5j6Wj/p/r3Q/
	tKjIihc4QqW3P/rg8wWSTiattwuYadlTLMbcqiW3fbeJeNTUUqA6ACdDCw5UjD9fUjI1+GUpHMQt3
	cLLYQBjgd27SeoJ4WDdcSYdc1dNQt4sX4xGewge7leurvdA1MYnK2nbzb4/VXWlHPrMiLypiwQTGz
	rgiRo6gzqmM+9oRbsEsHMm4Xr9Ap53bXya+Sae/G5n2O79VgLzmtuCYArYsI0VYBGWq3GJhH8xeOn
	P0BjVo7C/PglxF95pJx1EpGv7X2BJeBo+yoMXJgDJQrG2RTxTCPNjGcWbJuA8RMxV1h8N3wBDuV6E
	A2pFPKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFsd-0000000GyYJ-2vq1;
	Thu, 29 Jan 2026 00:27:27 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFsb-0000000GyXJ-47rq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:27:27 +0000
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 600E059E2B;
	Thu, 29 Jan 2026 00:27:23 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id B546C2001C;
	Thu, 29 Jan 2026 00:27:19 +0000 (UTC)
Date: Wed, 28 Jan 2026 19:27:29 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 08/30] tracing: Add init callback to trace remotes
Message-ID: <20260128192729.7e09c666@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-9-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-9-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B546C2001C
X-Stat-Signature: ko7jp31m83cuowy3gmbyif7tpnmo83um
X-Rspamd-Server: rspamout05
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19duKg3l6ZY2vUOvbsy0jhysLNnndHhvHc=
X-HE-Tag: 1769646439-261279
X-HE-Meta: U2FsdGVkX1/CWtB6rVpZu6SyQ2yta8IY4pPxH5RFXk05r/TLryalN45JzPtrAhUFiBqbDUsLn5r9igAHwxH/5OKRzaCKTq2lszcKSv65QJ27wZGyNgj19pzSTLW8VvSJ6nM2sNe43731HsERjpgo3AdB0JKVHQQAB83QdisBzDA4ws57SP/5KwCFjKR9yqCyc2ptojw40Na7NOYUE2OjLj44uRzdFW9O93lzFzFo+0FM62zN9MRRuZ8Q/UPMAPpHkmyXzJy3hAIEifq4hbYbbGH+zjdnicEoQROVK/tdlbOKoEZsTtKROUO9i6s4ZsqCw6J/EJEzzOPDMMUa2GlW3tgWcPPwq1I5/1bBKJmC5s5ykpPJrnxSTti/g+9dsY90WWHf+g2fdFvUg9GiOVRwJw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_162726_090668_012CA111 
X-CRM114-Status: UNSURE (   7.78  )
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

On Mon, 26 Jan 2026 10:43:57 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Add a .init call back so the trace remote callers can add entries to the
> tracefs directory.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

