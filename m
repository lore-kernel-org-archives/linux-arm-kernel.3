Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDB3C36001
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 05:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZYqBd8vEY+viBvNer60WQXhZvWLjiw6xgE86uO2OEU=; b=F8XsHnAjAsvHgevcy9vJZtDK0m
	HM+5h+HTWmp+LiTvTUQh4xi53hlpZrt9cGdzYTgR34ZSf6Mbb1VLt+GwIvoyC3M+h9K502Dzy0zZD
	lzqeTQyUHX9+96ZJtK4W6exTPwMyVW75TE7xKtg962u4l1xncg947qWm16+mkUGZFpdGZnNLMvk3Y
	6SLDFuD8TjK5vGEhBPRfib/2tf68y7XEZeUlV6tRGK94lg4ljM+SOulwL93SuK2Iqw1uBMZ/6fdXC
	/cCOIoVga2C8NNFrEzLJSVabJwiImPYykDf8+915LqnXR+5OwP6W/TiesheGBxemSsCCXtH5L2yCx
	18pyngGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twacv-00000002G8x-3xwi;
	Mon, 24 Mar 2025 05:45:33 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twab8-00000002Fs4-1WgX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 05:43:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2279915e06eso18510615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 22:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742795021; x=1743399821; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XZYqBd8vEY+viBvNer60WQXhZvWLjiw6xgE86uO2OEU=;
        b=i6xZRmivkYRP+cqB2LO6mUl8TUvPjkA35mYn++HblMpRDFyWe7Z8jaHzAwotu3SlCI
         jLusZpOAmP96uNzBgQgRa08VSwVcmrhGu/a0sp+zLzpNNYHGBJ8N3YDTrXp/pG9s4vZT
         krAJgAjJxgF3GzuYJL2fLvHWM2uLX2eLCdXqXWVgd2R2t6iH1znQ+LmZFKnIjHwHpAy2
         PQpUMxLOkKlTSLqaYGErhij6D+9tNTn/u0ek1rQUYFl1QW/NclgXiAo/dV+SqHnIVOaK
         i3A1gkvPF/dC3nicTPqBsyOI15qo5xCKXRfSnlQE7RbpHcy7o6EucbS7DxhJ4ANNbkVT
         DGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742795021; x=1743399821;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZYqBd8vEY+viBvNer60WQXhZvWLjiw6xgE86uO2OEU=;
        b=Cw8BAw7ouzYNk3iMXn7GNzcohRsqKpku+aim2lhFDPU5Gcuvi5RlwUmvh+kYmHOqYV
         mmBRzVtYJLgt0qNT7G1pH52PkHBdBNle8rFHJt920byyzHnmg3hIYI2J+5vXor9WNPBh
         bQxus2PAYoOi/d0jOlrSk0C0o906ZQ8AVmZTZtmmkCNXybS0Dl+NQ/WU0C0/qp9QF5qn
         74N8/VghXRpFSIecp9dt5l8JsVg7iPOtt913wm06/YWGKRP13kc/rlSohHXx1IZsRaKt
         Jiva+6IZzkSvjR2bkKF50xj5izhMGvClDZ9FPVJGJ8OC7f0sO/dKzA2NatTnAK3RT8yf
         Vo9w==
X-Forwarded-Encrypted: i=1; AJvYcCW9rPks1tfd6bd5LWerF1j4VSBQ9TejqIOt3qcS/QDRDKYkoYZjBz1o07v4WqFSa9e82Z8LVtgB8uPIhzbTONlP@lists.infradead.org
X-Gm-Message-State: AOJu0YzESKsASSC64fusx5iHEq0JrXFTxGZOS0jPDMlvCTp7meffPaTP
	W8Zsee4psSblOPZIZJmT9NUPTSjz+m+JH5ricMWXVTlEEmtZk5ljD+cZbHPMpj4=
X-Gm-Gg: ASbGncvVmzFbu0NAcx5BsPk8NlkxHGwA33jQNW4wwnjntXW0xWjm46YnzG5u7nHxblc
	crbypBstFQMEDflKW+ykNQHaJzCU38BCfDELdnn3HXbDsqovnMALrm+QBtzNXR9OrqAs4w/ncRB
	r0SeJfC18h/2pIkHo2WW2M2HQIPtcvF1iBDjQhBl+Kq7x5fA4feiohDL7sY/4mi1nQ0Uc4KU9BI
	rHKkI7JXWyxatDoyCJGrk+Mt0hw9xdK0zDBXdpQG1QOEOCbtmvQaFpHDupXfnZYlfhm8M4Mkt7D
	5flVcOPv+ZlKnQMHuG+D5VcxvQBIOxk3NhO0efZdcFE1EQ==
X-Google-Smtp-Source: AGHT+IG7ucfZiFRoh0M2V5ggHMX64UITYEnNDz5nQP04P/WihSFxf9WsMLMFop+iaLC/4c9SxWUzIQ==
X-Received: by 2002:a17:902:ec82:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-22780d8bfe0mr197243365ad.27.1742795020544;
        Sun, 23 Mar 2025 22:43:40 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3a846sm61958045ad.51.2025.03.23.22.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 22:43:39 -0700 (PDT)
Date: Mon, 24 Mar 2025 11:13:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chun-Jen Tseng =?utf-8?B?KOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>
Cc: "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race
 condition
Message-ID: <20250324054333.sgwwksawnybx3lp4@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
 <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
 <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
 <20250321045624.mwm2mnkqeow5uids@vireshk-i7>
 <2a73b5ca35692c8ffa68c9ff0df73e24a592967d.camel@mediatek.com>
 <20250321060148.adhxjexpnm4dkpnt@vireshk-i7>
 <e1c2c12bace22d1803d16ecbfb32129518d87157.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1c2c12bace22d1803d16ecbfb32129518d87157.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_224342_395119_B7CD841C 
X-CRM114-Status: GOOD (  18.42  )
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

Hi,

Thanks for sharing the details this time, it makes it much clearer
now.

On 24-03-25, 03:21, Chun-Jen Tseng (曾俊仁) wrote:
> I think the best configuration sequence is as follows:
>   cpufreq policy -> set frequency -> CCI governor get
> CPUFREQ_POSTCHANGE NB -> choose CCI frequency -> set CCI frequency
> 
> However, in drivers/devfreq/governor_passive.c#L77,
> get_target_freq_with_cpufreq() retrieves the current frequency of each
> policy,
> and it determines the CCI frequency based on the frequency of each
> policy.
> 
> But if policy-0 and policy-6 enter simultaneously, the CCI governor
> might get an incorrect frequency.

Yes it may fetch the current frequency (or last known one), but that
shouldn't be a problem as the postchange notification for policy-6
should get called right after and should fix the issue. Right ?

I don't think this is a race and if this requires fixing. clk_get()
for any device, will always return the last configured value, while
the clock might be changing at the same time.

What's important is that you don't get an incorrect frequency (as in
based on intermediate values of registers, etc). Note that the last
configured frequency isn't an incorrect frequency.

> cpufreq policy-0 -> set frequency -> CCI governor get
> CPUFREQ_POSTCHANGE NB -> choose CCI frequency -> set CCI frequency
> => during this time, the CCI governor gets policy-0 and policy-6, BUT
> policy-6 may change frequency by cpufreq driver at the same time.

Sure, and I don't see a problem with that. The issue is there only if
we can reach a state where CCI is left configured in the wrong state.
Which I don't think would happen here as the postchange notifier will
get called again, forcing a switch of frequency again.

-- 
viresh

