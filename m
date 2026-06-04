Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12F5CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWfW0hKJr7V2QHw5t2GqWFv/XZ92T8o2+LvBF+8aRiQ=; b=naB42iWV0YTfjvEPCSymGYp6eV
	kqCoL6/L6JY5P7YMU4AyIJvJMt1qLNXk5jMIPn1kkH6PCv/ohykhK+lNoFgqyV935gOF+XzH30AzH
	GtnLxly9Dil3MebCPnHMhIlQGXfDB19xn1d8LClZSTguQU1mhQPPz85b5xERLuXcVdpCWBsmLmA8k
	J8WAGQqo8/cYQ2QETglVBIKDX1UWkamhLffx2vh+U9IbHA+5ko8jpjmxMg5h+LcU3LYzQts5cEVlW
	7KcbNxK+3b2D8huQkARIZhdET1xr0mSJ98AmllqLR0thh4in2t5lkMFDh+samfImLVgoZl2NbptDE
	2SAA6DwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9xR-0000000GzXV-0Eg5;
	Thu, 04 Jun 2026 15:26:09 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9xO-0000000GzWs-1dsZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:26:07 +0000
Date: Thu, 4 Jun 2026 17:25:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780586760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NWfW0hKJr7V2QHw5t2GqWFv/XZ92T8o2+LvBF+8aRiQ=;
	b=u77s7L9lvDcDngWoCERRvAK3Aq4diy97hg0nomLMQ3iC49BY78r3gj0FTkVsaGowxEwFkK
	QImcgY+Cs49udcGD0eE/38RSMGT2aoX5Ivq+gQ8k75uFPV/5LrmyMLMSlwRZCpVjzAmo6R
	iUmEo1tdchC8aPc3LBxRJEnIh7dgzGE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] stm class: remove unnecessary local variable in
 stm_write
Message-ID: <aiGY109NSk8TWV0F@linux.dev>
References: <20260508144705.3940-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508144705.3940-3-thorsten.blum@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_082606_573654_5B7029A1 
X-CRM114-Status: GOOD (  15.69  )
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

Gentle ping?

On Fri, May 08, 2026 at 04:47:06PM +0200, Thorsten Blum wrote:
> The local error variable and the corresponding if check in stm_write()
> are unnecessary. Remove them.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/hwtracing/stm/core.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
> index f48c6a8a0654..edf3d69a84a9 100644
> --- a/drivers/hwtracing/stm/core.c
> +++ b/drivers/hwtracing/stm/core.c
> @@ -602,17 +602,11 @@ static ssize_t notrace
>  stm_write(struct stm_device *stm, struct stm_output *output,
>  	  unsigned int chan, const char *buf, size_t count, struct stm_source_data *source)
>  {
> -	int err;
> -
>  	/* stm->pdrv is serialized against policy_mutex */
>  	if (!stm->pdrv)
>  		return -ENODEV;
>  
> -	err = stm->pdrv->write(stm->data, output, chan, buf, count, source);
> -	if (err < 0)
> -		return err;
> -
> -	return err;
> +	return stm->pdrv->write(stm->data, output, chan, buf, count, source);
>  }
>  
>  static ssize_t stm_char_write(struct file *file, const char __user *buf,

