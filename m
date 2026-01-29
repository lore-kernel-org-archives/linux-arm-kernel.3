Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210F9D73E8C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 21:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuuFLD2E0Oz9BYdeyyjQ2aqYMkX3G7CJ//5VT0Rpgo4=; b=gBUwNPE+smARaJbuSRJKfl9Izu
	uTaMPZX9nCN3k0nbeF7vd6kz3LZLyPDDcyubAsVNjPjLWIzKoHuRXemg2akRKvSsjsog6m50UD5OP
	U7p/vHdjeH2ZLo18McCtPpKOFA5G2xVh+aI/AL4Viv/tj9dmy1sX7qNlj64ZIQNu1iKZjqbxklkkp
	6REiiEpsoA646CWeue7a3z4z0X5ijaO4Xb1q0NYKh7cJtz+nKMdDBDJmSfGMB7vf1xUtd2+uJ/kcg
	LlZncBH48q09YMf1DTOkuwf838YkmMdYfZlkJxTjIk9w4An34nCDcuxuNlV652TxI1YUJppwh9LJr
	JjszH2Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZfD-00000000gPd-498d;
	Thu, 29 Jan 2026 21:34:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZfB-00000000gPH-0zNi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 21:34:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so11105475e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 13:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769722490; x=1770327290; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fuuFLD2E0Oz9BYdeyyjQ2aqYMkX3G7CJ//5VT0Rpgo4=;
        b=BnnJk5JUSZiSDYUpaeGnXWnDBqEfzDS2fKSPsls5RlI4PkCGYS5HbjrPPYLQayLL54
         92Hww3sPPgnuuAhmNKdBoXHVr2sxshJtZoZA4znga2XyoSXoVJdvISnBQDrfpUavUGqS
         s6A3rDNLDddZzRiYSxGer956fHkCzazoXDXdcOOKj6/n4SaONUpfgw+MkBjUAxqJuT7k
         0NZdgHowjADCLSB6Ri/mOS2gyjdk9jsKX9sWatY9KlEN+OpmVBU9/xlunTxjwFEo4YIG
         4lW2FHh60FJJ5D5bElinIccscMG+ibim8XHdc8HHthPkA7FtoiLlRmqYFthdwjOEEOti
         xgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769722490; x=1770327290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuuFLD2E0Oz9BYdeyyjQ2aqYMkX3G7CJ//5VT0Rpgo4=;
        b=vPtotR0qjQbbbnBka5xkkfHglqgOcHtvepoJqj1Mn/loNBEU1XxxkyhQSgQuGxd9AK
         TAtpOVKiAIejBGxHX8kbGlHhptfARDO2saO5/hn1oFkwUfhUYs7h5eLjN8wHzCUVZ/Bg
         zppQCzZPhzgEvySMUqHTQK+y6BG+mrYFT2gc5ZStUY6sjhT79/Jkgc2ixMirHBkyQaAJ
         fvWxNgVMTV5CHbfCH+FOc52nm5wc4dJqheBcVjVwjqrj/mplEANMUqv1Uof5Q8IVjxYv
         v6Ff9T+HJsBM9XA3Y8zPu/3S8FFl5BC+caEcKkzlHLQMvE83XENTgLnmkOH5FJTER8ah
         9zJg==
X-Forwarded-Encrypted: i=1; AJvYcCXQuN/oBuoTEA3BUfKL781kySxjw2A+4/802rBq7UnO1VwOmNKA6TyCgHiwzrbTekYtU5EN+Zct6JGPvwIZ73uV@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0w+2UaU+eStY41+S9xUxcqasNuxrOcJBuCIMiEowoop/YnzbR
	1bFY0yVwMY9CP74UtHxGJW1aM86mSfJ+8QB4z3n2pYTpvmCaYUM7rUmpsVSNuhhE5g==
X-Gm-Gg: AZuq6aJmx+5u/ubPzXdXITfY8DJB4sW71uZW2JTYlsAsJ2gnxc1kQ9bTdklnPipK9u9
	1M1v7zfh7AaVz08/QcvHdrJjHKcHaH0hSgjFRzRylThXUaLlPkjKQw0aAaWmZJlCm48lkn+Wgci
	5NEb4payNfSQXoGQ+88KUGs0xnesNRnxBX3f7fO33YNAYA/QWuL7kDpWeuVuT7cdPdMFdNi9pW/
	/gdRZIwulyoB8eSUcMoINCsrcKA+3sAq0S0e62FSzlIDDNx5XgP9h1yQplM/fojRQSbx9PMvJ0X
	8LewA45Y5O4++9E7Iu0Fl3prek2xLe6tRzV4TNjH9FK4c7cifp44tRc3wWfAZw9IrzTtm3i8dSp
	j36PcKoDexjwaMx+erEOXuaI2pn3BlQvoTOxPwW2Vo9U4/lk40DCAdcPvE6D+IrYJBilpCHPxm9
	kSpTvK3SNfLE1w6n0dPyZtXUIfrDd//8pq8S4ftG5pwwnjcK3M8w==
X-Received: by 2002:a05:600c:310f:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-482db493e6bmr6275085e9.5.1769722490186;
        Thu, 29 Jan 2026 13:34:50 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd78d3sm156950105e9.1.2026.01.29.13.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:34:49 -0800 (PST)
Date: Thu, 29 Jan 2026 21:34:46 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 00/30] Tracefs support for pKVM
Message-ID: <aXvSdljSYlartF1S@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
 <20260129123739.3c00155b@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129123739.3c00155b@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_133453_303142_C3D02ABB 
X-CRM114-Status: GOOD (  18.21  )
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

On Thu, Jan 29, 2026 at 12:37:39PM -0500, Steven Rostedt wrote:
> Hi Vincent,
> 
> I finished my review. I replied to every patch (before the KVM ones) and
> either made comments or added a Reviewed-by tag.

Thanks a lot! I will try to send an update tomorrow.

> 
> When you send the next version, if you don't modify one of the patches I
> replied with a RB tag, add the tag to the patch and it will let me know I
> don't need to look at it again.
> 
> You can use b4 or download the series from here[1] and it will automatically
> add the tags for you. Just create a new branch and apply the download via
> git am and work from there.
> 
> Thanks,
> 
> -- Steve
> 
> [1] https://patchwork.kernel.org/series/1047043/mbox/

