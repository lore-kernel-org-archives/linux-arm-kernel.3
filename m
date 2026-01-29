Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983FAD358D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ud1kwbo2TTb09xnzJowRyz9ffr5UfqML65uVgn7ikkc=; b=Dh2+K4iOFYWQ82nGBGQD94Wizy
	HE5t3RmglGU86t6rHfscUdNJjdmSxDpDove0bUkx2UZYmpRM4zGrjAMqo40Pmw3XarBI78lXafVkX
	MGlMTimLn1yXx5UEvHz9HxH5XJwC4gKmtUJi6vOZq0PthxQt5p7oGBbddDf+u2q0nxWaWn38pjnHg
	VKh2a6i7djLE7I/3o/W1YByI8c2F+0AhDBFAvrd0naFo8Oe6RCI0byQVz0ZQyuCorTamrYRGGfRfX
	8aN/EGXDTv6S+BeWdch7BsiWkfRCJxeyxwiGTusbiMcLzEhIlYmidLAeyipDRTEAhecuAXfQQ+juF
	RQ8HezHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVi1-00000000Q5r-3f5z;
	Thu, 29 Jan 2026 17:21:33 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVhz-00000000Q5T-1wjX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:21:32 +0000
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 3A3D61BCF2;
	Thu, 29 Jan 2026 17:21:28 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 943DA2000E;
	Thu, 29 Jan 2026 17:21:24 +0000 (UTC)
Date: Thu, 29 Jan 2026 12:21:36 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 17/30] tracing: load/unload page callbacks for
 simple_ring_buffer
Message-ID: <20260129122136.69873587@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-18-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-18-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: jtfheu8shqoipi9u5yzt3fkgzru6j7dw
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 943DA2000E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+P5mzFd4ZWUvDj9SmD6phcMvBMATTT8U8=
X-HE-Tag: 1769707284-904358
X-HE-Meta: U2FsdGVkX1/oZ8BY+DTHEu7zvzBJzXR5GM/i1Uvhm0/GmhlbTOg04hWfxm7niWNweDUchAXGe3ZhEeezDlxl79OtF6b3lHBrpu5STLNTc2w6s1ILrFX8De22XyjnNCZ/4Dc1J5+aV6iKd0M6OEXA9Y0wsbGw/MfCfhwyuzcR2ilW687CSNKk9fY9uVhYx3NLMJJIBYgLGDW6G5mVk5CAPkBlVKq0E/pMnY87yUFzDj48l1Rcu10wsuV2ZAN+HRYdPTYLLOjYVRdDXEp7fpr4Ulx1vkR+WpnIUA/Ctd5bb1h51HmM2GhYFt1WntUckszQJ7ReqfKeRmylxjapYjyYNvYNkJ9HvDBW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_092131_559666_29219871 
X-CRM114-Status: GOOD (  12.59  )
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

On Mon, 26 Jan 2026 10:44:06 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Add load/unload callback used for each admitted page in the ring-buffer.
> This will be later useful for the pKVM hypervisor which uses a different
> VA space and need to dynamically map/unmap the ring-buffer pages.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/include/linux/simple_ring_buffer.h b/include/linux/simple_ring_buffer.h
> index f324df2f875b..ecd0e988c699 100644
> --- a/include/linux/simple_ring_buffer.h
> +++ b/include/linux/simple_ring_buffer.h
> @@ -110,4 +110,11 @@ int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer);
>   */
>  int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer);
>  
> +int __simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer,
> +			      struct simple_buffer_page *bpages,
> +			      const struct ring_buffer_desc *desc,
> +			      void *(*load_page)(unsigned long va),
> +			      void (*unload_page)(void *va));
> +void __simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer,
> +				 void (*unload_page)(void *));

Underscored functions are for internally used functions and I rather not
have them for generic use (in include/linux).

Perhaps rename them as:

 int simple_ring_buffer_init_va()
 void simple_ring_buffer_init_va()

Or maybe "_mm()" would be better?

-- Steve


