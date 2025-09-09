Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261CBCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 22:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14ykBfRJ1geuE3cE3c65lfGGgb4uNInRfYO/VJCEWHA=; b=JOzNnwJwxpeum+VLpUMn8q9PSg
	zJT68Ewc3fxwpdO9Gt07Q9yhh5r29kWVpB3kbr2Fzfi/f7RcRrtMFZl6vWEVP+JRM8jTdkaSx9DrU
	y9/aU6S8jsD8KC71JUWlyKhvi977CxmhXqfhPrQUmxDoPMrMoYFd/tTH3EbyJTsUUlXN3g7fKdlLa
	hnoC94SUMWZ5eOvD580tTmMsATY5ZOV4mAn5dUoF05XJu6vbBEzRjw0Wl6/Ia+jwdBHO/VbK65Tpz
	D9FKwSLSbCFJRssncSa4ukTj+iiJBcAxVTNpHWLnukfeTQvoHCq4UFlUXZnTYt5XSPj7rBlHRHNRz
	JM7rhNpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6kf-0000000Adap-0KAt;
	Tue, 09 Sep 2025 22:23:49 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw6kc-0000000AdZq-2i7c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 22:23:48 +0000
Received: from omf06.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id EB4215A424;
	Tue,  9 Sep 2025 22:23:42 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id 663D320013;
	Tue,  9 Sep 2025 22:23:39 +0000 (UTC)
Date: Tue, 9 Sep 2025 18:24:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 06/24] tracing: Add events to trace remotes
Message-ID: <20250909182427.711d2915@gandalf.local.home>
In-Reply-To: <20250909174750.72be9bbc@gandalf.local.home>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-7-vdonnefort@google.com>
	<20250909174750.72be9bbc@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: oy166uftup53oqxzi6gdnzpyd9g5yr6b
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 663D320013
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+c18lJAA4FCi9ZnqCLxVscRpbdr51n5oM=
X-HE-Tag: 1757456619-137741
X-HE-Meta: U2FsdGVkX1+TJJFJ97IrGgRByHl23s45JciDfMCRsTB9AxoeD68Gc6N74Z1sMF6z+Z+y2y6mpD3LRTcKFNPyCtMUXePkIvddOih2DBzuZ/CuM/vxJdiQLLiU/4j6LQO96UKjt3NIs2pqH0mPV/Hm/XP2QiTC0Dgv1V8yaEF53iPKnYmsObPOsFFzmqeeZyKr8a8Up8DWE5dN3nDoMDOLVVZjb4Qd5Win7b0Kwiz+gVDRkJct8+AFyIrBanyFSwddri13LqWKywLTPou1QNIuklZQ/A8a8IroKq0DGX208FZQPwqeo1xCCJVoiDYqeHayGCfCwlFCrV74pICFjyWzlhbyybI5kWBEJlpEPsaAjBuCRaMe9GNOg26v21t2DPxk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_152346_746407_7AD374A2 
X-CRM114-Status: GOOD (  10.82  )
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

On Tue, 9 Sep 2025 17:47:50 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> >  		iter->evt_cpu = cpu;
> > +		iter->evt = (struct remote_event_hdr *)&rb_evt->array[1];  
> 
> Hmm, shouldn't this use ring_buffer_event_data(rb_evt) instead?
> 
> If the events get big, then it would be array[2]. But the
> ring_buffer_event_data() hides that detail.

Ahh, looking at the patch 10, it is always array[1].

Still should use a helper function instead of exposing the internals like
this.

-- Steve

