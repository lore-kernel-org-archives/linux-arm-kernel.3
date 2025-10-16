Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D159FCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 21:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aT+pmwTjSjW4uQiF1fXwgxBTMN3Tu+wRmYbRwOylwxA=; b=V4JUiySk1ODQsiAR6xPt9sbO2E
	U5SbnBEdbKktfAXByEegfloeFRlrXsg0RDC4FtvMGKqSJD7K/bKwDqRAad37c7RtkaPBut9IWftwy
	77P5ffVvuZjkN274O+RFgtnEqJRS4ckxNgdr0nk+vW7BE7xNkmL045PlqHbzSv/HOSugHHHFInvTl
	GY0G/erB9L/IKYYT6AS1yckTte5wtnoLB4gns8ywvoforZ3L7vgw8ibg2Ft0LnTmHMTtD5OB8jxHF
	rNGKxYTQzVpgc1l/229nz6Zr1Iu3SH4W5zE3mfl3MF6h33psvzoLNLnEZwJe7UAawatF0Uv8siMpx
	EvD8GSEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9VBM-00000005xAX-279V;
	Thu, 16 Oct 2025 21:06:44 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9VBK-00000005x9r-1vD7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 21:06:43 +0000
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 1ED2AC03EC;
	Thu, 16 Oct 2025 21:06:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf18.hostedemail.com (Postfix) with ESMTPA id DC7AE2E;
	Thu, 16 Oct 2025 21:06:34 +0000 (UTC)
Date: Thu, 16 Oct 2025 17:06:45 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 14/28] tracing: Add a trace remote module for testing
Message-ID: <20251016170645.15416c8a@gandalf.local.home>
In-Reply-To: <20251003133825.2068970-15-vdonnefort@google.com>
References: <20251003133825.2068970-1-vdonnefort@google.com>
	<20251003133825.2068970-15-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: 171ecfdbssy8jndycq7xaujpdryuex7e
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: DC7AE2E
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/ZbvkePVWCGmToWBQLaaIP5VqhZo9jobY=
X-HE-Tag: 1760648794-186997
X-HE-Meta: U2FsdGVkX1+eCdST38Wg1ReLdZGNRZsCZYYH7m4AKdZaxOPM6jlfN1mdmRXhxBU1VJTVpWkj9A2ZkC4XzBBqjVn2xgmz9jqaGNfP/MVEaUcUqFsyArxWf4Zon8ocjQUcrHXPHlaG7hRC2p/C500ofrn+Ska0QyZ1UL4BX84tY07aCUosGlwrK264F71UDkljgxVSZX9es3SQ3l2o9PpqN7ZQqbnlO8s05NLTLmvKriB16vplXurmGcrmMTaGIuXvXW7RNibnhslg9/L0o3wPh9Ho9tO0wAGA1JZIVH1XyW203hsY+7imQdJ/Qe/twW+S9pm40Ff2eePzyLCyWSDJ4DFaOGuoIsLG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_140642_557894_DBCBDFF6 
X-CRM114-Status: GOOD (  10.95  )
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

On Fri,  3 Oct 2025 14:38:11 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index 918afcc1fcaf..52131d89993c 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -1244,4 +1244,12 @@ config TRACE_REMOTE
>  config SIMPLE_RING_BUFFER
>  	bool
>  
> +config TRACE_REMOTE_TEST
> +	tristate "Test module for remote tracing"
> +	select TRACE_REMOTE
> +	select SIMPLE_RING_BUFFER
> +	help
> +	  This trace remote includes a ring-buffer writer implementation using
> +	  "simple_ring_buffer". This is solely intending for testing.
> +

Nit, this should go up a few places so that it's with the other "test module" selections.

-- Steve

