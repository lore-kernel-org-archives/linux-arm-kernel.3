Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D825AD46C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5YnpmxhuU9rKjK5EnKABw8hd9awyOePp8MRGpBJpwg=; b=CZ8APJLYCXD+2auu+fyNubfZ31
	N7JYh35BwuquZTFfDSXELOagVRy0FbsXr2ycH7BbpvG4OX4F9gY+6xBfd1ppV6UGarw5B/VcGCpME
	X6Aqz1DHw08yba04OpVwa8eIOj5yhsNpCIvZVS+8yhYEKqNXhCe5dBntFMacCMts4aG92AitVA/6O
	DgEQ6eM3Tv6MurP2gPxRphquMikYvZPcjeUiiu0D+1eyOxbPZOfeXrBupsrR3/4Vd17Ty7qMH6MFt
	1IHSr8R+T6SWUHnxgaYs8gL6AilAVpptq5dZDk4cilztOfCcJL46ZyuiEcMHyBjPy/OnGB7wa5ffJ
	hgcDgqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFsF-0000000GyPQ-3V4l;
	Thu, 29 Jan 2026 00:27:03 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFsE-0000000GyOb-0xgM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:27:03 +0000
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 25537BB28D;
	Thu, 29 Jan 2026 00:26:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id B072F2E;
	Thu, 29 Jan 2026 00:26:55 +0000 (UTC)
Date: Wed, 28 Jan 2026 19:27:05 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 06/30] tracing: Add reset to trace remotes
Message-ID: <20260128192705.197f85da@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-7-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-7-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: hx95fytmscwrpp1wo5jpp5jrfr6wftjs
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: B072F2E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/PaWGWKmzPr61am9mcBR7HtKL+iIVurNY=
X-HE-Tag: 1769646415-151747
X-HE-Meta: U2FsdGVkX18EUZivgGgaI3rGbX9lP6SRN/C0D1hJVndEwct7b0/0rTgEaRbeN3zmk2bGrbt9QF86v9HLa4nlJhBwQnxtWyUIaOb76e1UHMmHWwqod6bMm/Vzr5o9SfT3MwRRYGaXKP7i3xXnaIfXEmT+SXFEos60MO8oBF14cFsaj88X7qpwGaxq2gsus3H4WBCX4e+ruNxVpWBC9zlH4l4ys0OlQlxjClJFJAqVOwbzNsJPsAvrep6ZB8GOeL4/Cs15KosxFjEaFcBOj9NW/Dgz8cL4JyKq37F6RgRFNT2c4a7e15hJ7BXB7IxWYra//1woaLmnnXVFPryZ+0tUpOyjl0ptnHalzAHjiLQYgUii1Q/q9LUyC5I7V7hZ0AD64/8/LC5uaUeVPBZzM1T5hQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_162702_325013_840F7158 
X-CRM114-Status: UNSURE (   7.35  )
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

On Mon, 26 Jan 2026 10:43:55 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Allow to reset the trace remote buffer by writing to the Tracefs "trace"
> file. This is similar to the regular Tracefs interface.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

