Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB406CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 05:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMKDfhFuWhQebRAxT9YejjbQsAd2wDwWly97EhWdZpM=; b=MsFOI4Shn8bJNQ3XaT563ReFtZ
	6bPFH7dUGTTC4LlILlLLcLeLY3ajaJ8bouPLEZZLgbKxg6Tw69QGkaFJEByXirAeNPChCvLCmZeJj
	S1Yos9jBxT3AcUaPuqTRNoIj+D5d2X2dlAPQMcFhkpG4Wf/ZrEBGhgQMJOer7gPpblLG7mxBykr1R
	OKGhIxkIKOFZXqOiS/7k+j346twMXrJcdoikBcO4laiambNHMJcY6R8zBf0ktShvH2fe6f7FsY7SD
	dxSW61052CgG/rnPJmG0UEPfxNkCaD7LCp3ucHu/3/Ezix19FshnR91ALrfre/TYnY9uwFRf1BKiw
	NIJotdVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDc1n-0000000FEsH-2rgQ;
	Tue, 28 Oct 2025 05:13:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDc1l-0000000FErv-18Fb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 05:13:50 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-292fd52d527so55756815ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 22:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761628428; x=1762233228; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QMKDfhFuWhQebRAxT9YejjbQsAd2wDwWly97EhWdZpM=;
        b=DynfbZpM/e8mypGozda3S76VsYnqeHP6x2RBVMJ4L5FsqlQlaU0rUJLmWSKHC6N/sI
         5nxCqTSoBKxeSOTGHTSWjZPqJ6CCkpdkuSOUNiMiR8aUNWmGB9Ckv/lyhRoQCtjEZCYT
         +FtnDjY57UEPMvGyTKhDhoi5t6kwV1HXKvzE1dE1tDiO89ehgBJtZo4Z85qgjXedZ/sX
         PubRuSVA7KtVgXIBmVEyKgoKV+MlF47zf7Cw9nu6ItTHmquMwgSL19k0tILKE7Ts0G/j
         Ch/bKuurrBEF5aODXO5Aaa6g+LWaZY0QuIX3PPHbark+SHJPQ77ue2xj3sR0DkQKk5Oa
         lCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761628428; x=1762233228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMKDfhFuWhQebRAxT9YejjbQsAd2wDwWly97EhWdZpM=;
        b=ghh02dZUupCYtYQBrF1Xc5gBkSYZp9AWkz+aQyebOKPP9SU06l3zUztTSaGqzHWkzw
         IP1Q9ka8/z3meLbgCt0dEAOH9n47/w0xSBTsIFaqEvZIaLmdmVgkh9rgxevaWiICBvO4
         eUIQW6qd7j6m8AUBJW67rtwXdNnjog1jFm64yqTQYy9T0zFmbhwEh8ofpy45nvfo+Zm5
         OzXXI28NRYb48+07qzkYky4pjdPMvjC+TORwIGQuojAKOW5q2oVXPqJ5m3tiHY+7gVG7
         wFofiaO/3NLyM4/S6GYN2R79b4yMAlW3cRNidrLMJNzbtJJnlPpYkKIhlSoNZdOHxv15
         SluQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpjLt5Xbk5OX5Sz18zWOegZ3dnIC8oJ/No7HANy/qIca9F8gO1bYBK6eq4lHhQGooGoLQyINgs1GN2tBAaVs5b@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9Iq3ZCxAETFBErAHkx1S+U4HuXXINav7ndqRZdjiRQQquWizo
	V0/a7OjpbDhtaCCR7gIclJ2fkbm4Qxizd9dwpl6kjZgZMaoMhllGWIVB4MHH7Skey/g=
X-Gm-Gg: ASbGncs3vT1NVOOEoKj7PCiu6HwET+y5YhqepOdjEvbgE9oEmKI5zWxDlukCFTQFzq9
	q2hPZ9fGduVSnFsdMWCBXSyXBax35eLuaAj9C1V7QoloH199zSFeSlRj1Jvr8LVRoc2gJVW+bQg
	2FnOxRIptocNEhJ60pMa3sNV+tDoi79jJOwWstXTJ0gl2HgwlL+pM8kn/G60Sdg1RWepx4BffVT
	1sRL3oZ0scmqRIADyhXOEIGWgn3JO+O4sui2/qxctAm2QF107jmxXDuTIs5ILlC58W/SruVNiV+
	dY9wS2rcYzfGqoscOV+/6wnTjBF52Uimleh+/vVJQQZ143vSyTyWWVhDaRgdC25C7D5bV1N9ECX
	idV/YMPXX+XRKOkVwGIU0/7eg3Riz9C0lDHZ4A2Z2+SfwK1sSznx24yt5LKIoNT2AOEqFqR8J+h
	RPgw==
X-Google-Smtp-Source: AGHT+IFv8BScqO2z2oq9pmjixKfhhFY8KhLHypHI2fFhnUIb23B+PdR7UKWT6j7I/gfPQdC79UF8/A==
X-Received: by 2002:a17:902:f682:b0:27e:eb98:9a13 with SMTP id d9443c01a7336-294cb3d7202mr25628145ad.22.1761628428297;
        Mon, 27 Oct 2025 22:13:48 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42ea7sm100637885ad.101.2025.10.27.22.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 22:13:47 -0700 (PDT)
Date: Tue, 28 Oct 2025 10:43:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jie Zhan <zhanjie9@hisilicon.com>, ionela.voinescu@arm.com, 
	beata.michalska@arm.com, Sumit Gupta <sumitg@nvidia.com>, 
	Prashant Malani <pmalani@google.com>
Cc: rafael@kernel.org, zhenglifeng1@huawei.com, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, 
	jonathan.cameron@huawei.com
Subject: Re: [PATCH v2 2/2] cpufreq: CPPC: Update FIE arch_freq_scale in
 ticks for non-PCC regs
Message-ID: <xpktefok4c5vsno5fkizsjirbygsict2or2biphj3ugqbdvdq5@f67kdijo66y3>
References: <20250828110212.2108653-1-zhanjie9@hisilicon.com>
 <20250828110212.2108653-3-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828110212.2108653-3-zhanjie9@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_221349_331066_6608AB85 
X-CRM114-Status: GOOD (  15.00  )
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

On 28-08-25, 19:02, Jie Zhan wrote:
> Currently, the CPPC Frequency Invariance Engine (FIE) is invoked from the
> scheduler tick but defers the update of arch_freq_scale to a separate
> thread because cppc_get_perf_ctrs() would sleep if the CPC regs are in PCC.
> 
> However, this deferred update mechanism is unnecessary and introduces extra
> overhead for non-PCC register spaces (e.g. System Memory or FFH), where
> accessing the regs won't sleep and can be safely performed from the tick
> context.  Also, reading perf counters of a remote CPU may return 0 if it's
> in a low-power idle state, e.g. power down or reset.
> 
> Update arch_freq_scale directly in ticks for non-PCC regs and keep the
> deferred update mechanism for PCC regs.
> 
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
> ---
>  drivers/cpufreq/cppc_cpufreq.c | 52 +++++++++++++++++++++++-----------
>  1 file changed, 36 insertions(+), 16 deletions(-)

Ionela, Beata, and others.

Can someone please review this one ? This has waiting for a long time already.

-- 
viresh

