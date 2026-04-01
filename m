Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BB010F6FDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FK7OAZJnMRvfLsIQNwvSj1elKc0MV4FPgcgTqTFOq0=; b=fyfNzZJTheDwl7kHUGpqkSrmm9
	CmmMxW82MpLvpL418ON9BINc55uAEBHgIwI1lOIaY5CkYWc9bWf1gsSaozpohz9YxrUKqfseuy8Vb
	q3aW6eJwGrVZOXwZupCslZxaepNGZ82U+WMnqo/5axmhZLemYSC1Br633PTNp7G0sVvPdY9zflBm9
	7yaXBbsSZcPD7fOc1mFS7mByu14knFWu3oLNP0aoi3mqgMnqECdgCWYu0Z5RYjmN0aK4yDkRTfUv8
	wveKOXnVYFXXnNpAjsQfqMspUrKof0rO4OOhtCtzhnUPmGR0X2RMKMrIyJAZOOaSf/8ZtNntL2kxV
	mEtnPx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zGc-0000000Fq8Q-42fD;
	Wed, 01 Apr 2026 17:22:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zGb-0000000Fq8G-48t2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 17:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8FK7OAZJnMRvfLsIQNwvSj1elKc0MV4FPgcgTqTFOq0=; b=fi1PEGfXS5pSWO7HRXIUzKiGwb
	XCO03nYh93giyuQLfn5H2/mUvGSW4AFPliuKz0pWIvneiL/M7rzY8FEV0NiHLLMh6cKCD019Teh78
	e1MTxQrPK6gj0hLUZ6gJJE3vlBto81C43GAn7ExoKVPWHIcImhsycQz08vW5wUCYRgZbUFiN07rGk
	hjMLx7wClThvKH8dhLMT7p7GgqiZybuhlOwxRRTfq4fUSShuSKiAD0hWPT1T6xGSmg9qnVME+IED2
	2+gQz6S44v8rjhfdKNySDmChxxIV5nAn1RMG9dMwsXrq/zhT5+qlNZ8GxmPzip1Z8z5E6RBPMfd56
	aufHvBYw==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zGZ-00000000zyg-0GN9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 17:22:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488879dcbc3so6255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 10:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775064125; x=1775668925; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8FK7OAZJnMRvfLsIQNwvSj1elKc0MV4FPgcgTqTFOq0=;
        b=GIV+t3Q+UtWB9t0Uj8Gh9d8LWIicoKwzj26ltGLAnCb4r/w4rIePRPab4XVfFh4AY+
         3PnltCWWD1VUMZVCXVV+2eZvf9CGETcdZ4nGC2uZPIVr8dPzOomGhBui/S5U3LFKyZiI
         jO1BXS59+YUzTJ8fHGCYOcNsQ5twnVSC/vx9CuFB3BoA/hnDaSnBrmNdQ65gesk0Ui4H
         1Wmn/p3LnM0rWv+9LmPs+NHcng8MyS4mfEdL6kKouqCcZFyALIjRjCiEeCUNb4jTfGZB
         xYHO09BEu0zmKhM30uNbKW/9r5Dfv/KCF16T1f8V44YhkOF3bJM2DLtPNnbL/oGDGA/5
         6NsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775064125; x=1775668925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FK7OAZJnMRvfLsIQNwvSj1elKc0MV4FPgcgTqTFOq0=;
        b=Hq9ptGt9/UC/UiUreTIOADq1XEtgzPZAZq9L/nivi/oxOaMC8404vOAnVJwMzWGS1C
         rWFvcvktrsbsf2KaN11rJiCM+5Fllp0zGO9s4s55SJQXzhd8oQMAgXvOej5wGA/bPa+T
         A3aHPB7Mrfx4rTg4xiCgj2W6bsukMuJ0KA72izpvZojuQ71RofIwdn6weSmy3EGYaUN9
         zS5yLVNGGJOt3FrFeW3ZexhIdENlMHF43uHiXg8vPqVjUY/vnTQNr1XjJmU8vJa0xU/y
         5T0uEuOiHoTd64sHMbGmsWtptFM4l4SV/LK2eEXkPp3jG2BfFmbVU7f6YeloouTBXmEv
         9Vag==
X-Forwarded-Encrypted: i=1; AJvYcCX6WMoJHaJW7dJBpFWkmDi1JH10nZi0g5GRNyZUL7PcWjwgxQ2ETv/UtoDaQCVQsco0pSjnFck45xFSJAAv1dAN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz148WlOMyIa3Rqw26XX0LjQDg56uIBQV6y1aKpmYyP04WP7Arq
	ytLJwEor4/EfjG+tJZbOzAZBGTqm8tPjrJI0BAN7T5zoHqMOIheON7L0mnYGNI6tRA==
X-Gm-Gg: ATEYQzxgePLfhOpS+LORVLiHcuRVopZgchZrQ5B4rRSe1DB/fbtLLHk9s+OMqlZQSHs
	mjb8s7lPPwun/mXY2yy0C5+O5+1YapYydr6Z+kJabKphYu7YbacocHYEyDWl/tDjQxnu78ZhpKB
	1KFXdsrEz+seeb4y16WZazYN9ozh1JQ+C5L5IPSsaDsfFz8mJETPqOq6MvcZ2nCaXgJDNEywnXj
	TFoHgQPlXhpl9fY/IAKTyNqrJu2b1FfXRp4CTWP6GAQraodzj95eEcmC1zrahpyzoXTlDJjALk9
	ivRJaeEG+20YcQgjbNhAukLUucgt3PZuhCQwcpv1pfravSC1kFWXqbsXfrW2C69fxI6dh7kQa2/
	0EwxSPQgUSW24bas0dFPCLHFJ6K5ABcQGl7JGT2lbnL84/OSEZEZeV9TjeiYrHKkn70LgUASWhd
	7tiogDKbDDUNJMtDKEK5N2hKiU3ubrhiqDQcEsMUSyVg+2zqgy3SzjDCMbp9+0jrHvTS8=
X-Received: by 2002:a05:600c:d8:b0:486:fd5a:18db with SMTP id 5b1f17b1804b1-4888b7a1471mr37475e9.11.1775064124308;
        Wed, 01 Apr 2026 10:22:04 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8ee2d3sm49918275e9.32.2026.04.01.10.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 10:22:03 -0700 (PDT)
Date: Wed, 1 Apr 2026 17:21:58 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, joey.gouly@arm.com, korneld@google.com,
	mrigendra.chaubey@gmail.com, oupton@kernel.org,
	perlarsen@google.com, suzuki.poulose@arm.com, will@kernel.org,
	yuzenghui@huawei.com
Subject: Re: [PATCH] KVM: arm64: Pass a 64bit function-id in the SMC handlers
Message-ID: <ac1UNj7Z1uVL4Nf6@google.com>
References: <20260401123201.389906-1-sebastianene@google.com>
 <86341e4to0.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86341e4to0.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_182207_259708_C09A784F 
X-CRM114-Status: GOOD (  20.18  )
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

On Wed, Apr 01, 2026 at 03:55:11PM +0100, Marc Zyngier wrote:
> On Wed, 01 Apr 2026 13:32:01 +0100,
> Sebastian Ene <sebastianene@google.com> wrote:
> > 
> > Make the SMC handlers accept a 64bit value for the function-id to keep
> > it uniform with the rest of the code and prevent a u64 -> u32 -> u64
> > conversion as it currently happens when we handle PSCI.
> 
> That seems overly creative. The spec says (2.5, from ARM DEN 0028 1.6
> G):

I'm not plannig to be *overly creative*. Thanks for pointing out the ARM
spec.

> 
> "The Function Identifier is passed on W0 on every SMC and HVC
> call. Its 32-bit integer value indicates which function is being
> requested by the caller. It is always passed as the first argument to
> every SMC or HVC call in R0 or W0."
> 
> which indicates that it is *always* a 32bit value.
> 
> So if you have a 64bit value somewhere, *that* should be fixed, not
> propagated arbitrarily.

If you have a non SMCCC call that happen to have the first 32-bits of
the function-id matching either PSCI or FF-A you will end up handling
them instead of forwarding it to Trustzone because func_id is declared as:

DECLARE_REG(u64, func_id, host_ctxt, 0);

> 
> Thanks,
> 
> 	M.
>
> -- 
> Without deviation from the norm, progress is not possible.


Thanks,
Sebastian

