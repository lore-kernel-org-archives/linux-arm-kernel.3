Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA2CC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 09:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CW23LQEB4WoxPcN9t72NgpaNRCQygSurIOdrvN/ogho=; b=RECJWyg+czJrmu5GaXlJpls10C
	jxj8WgAD4Z76f5GJ6+EIwLtEf90/7/4WOEpXxrn7J2fQj5DmjnTutnlIHu0XhYPVOblU4FA7c5ghl
	VnQ2khUuI+zI1lt11QQxV2EV2h3Tt8lQvHK2j/utU4394xGNIR9vE2PSbFUwcsHNrOKkcAU0oTC4t
	eYcqxyipJNfz/niKDtmoKf3T2oHzlvyIBLoa688ktAkgVG5NTfm3Q/cBw0RNd/1UaqWj4UJdRwkIj
	G8IzJizvEPdSfrISFW3a+gX61ALA8nmdU3o6sWvkt4yfJEU+PoB6JVP4bTIQbGCHYoiIGqxvlA2gE
	c/bhDhRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yTD-0000000925N-3o8q;
	Mon, 31 Aug 2026 09:38:27 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0yTA-0000000924d-33gJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 09:38:25 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c96c92c0980so2121435a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 02:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788169103; x=1788773903; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CW23LQEB4WoxPcN9t72NgpaNRCQygSurIOdrvN/ogho=;
        b=O7b6kyAe0eG9t++POdPZ96NRloxgWVY1Z5oX11esC4ZsgbAmMxjVOuBDE8d1vWLM7O
         YCBqc3DGoVkFkamKymOQlB5yx+zQopt3e4roCrN/CN3RZCdjZ08KTASKbOvImzY+QR+J
         VK6W7f8EFey/PXeivM3qOxOBMU+AgxL4rFWdlyGC+3SE4DNdz8AOUNbQ4BBQ74et+smw
         hE6dfY01O1mywOsOgkSh0cYFkwQL5mH3SQnV0xTEXq8WNOSIU4a+5it64ylO865sNdGs
         V9U5+jqUMAwV55IwKOMzuvcIu9HsoYl6n9BpB5eT07jkZgorFOOi0OYRU7iN/S7Dj7Y9
         KyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169103; x=1788773903;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CW23LQEB4WoxPcN9t72NgpaNRCQygSurIOdrvN/ogho=;
        b=Y1VWOlFNA59E4iPZ5i8960QgIjVMUTh4e21b8cnmNKhAlWOJLIMXcFTV6RyJGClNBT
         oiayRxHyecLSVulmMVE+R3Z6wZAXLCQjElWY1IL3ylQNTCzzshKIl3hehY1n7Bue9k+S
         PcI5cMusyi9v2hoa18oN1WR7onduSmcYWwLznl85IFiI8p8Snlpd+BXD1CCC9jacjIDN
         AW7RzokKBqjt51Rt5b66QfeIkVsWwg1NUezczaUCHhBcfyt7xWYv875Cv6+5qzyHErmz
         aWcftUARKpidahBou9UKRqmpQihRlyIRQqQn0+9TmWDurJo6ik4gEt+Qj5nbXJ4EcczI
         IXyA==
X-Forwarded-Encrypted: i=1; AKwUvByaQO1E3dVUM5Xt0plgil7KcJlhEBw1G+iez7z+tbSCIVBcy7bMD9yVt1QtYeboNKVsRyXaqCX1c0c2aeUiTOqU@lists.infradead.org
X-Gm-Message-State: AFuF++mAKqr1I122AkGJDeHWCEWXRp15Jr+b0N8LkeJAS/YyahED7b0X
	FE0lMbaMQl2GOMxEO0KRcH7O4KxU/lfwD8yiB3jlfOqZdMivoRzXLIbOwlPwaOqDP7A=
X-Gm-Gg: AYBFou1sIq14qQNveBsKeJmgmLJd7/wdahdxdPOppZJqa0leWjAJcaC5tqC8XZpV2rs
	Hr5EfQdmQCPYajdpzMsL85gygqix/meZiQ401HAkLjt1LiNbKHjHGJf5vPKK5/baqxt87c6Opnc
	Zd3NSoz5sNc3HKR2a+rBBLNuZzm7BEbjrRV65a0ezbOE1o4dMGFguJcv2kKW2KM798pRLNOT3Xj
	MPR75tuP3WzIla3mHvz7JqyXoLH7k+Qb/sXor2adXS1TrrDZL6FUcmUQVRyAVsqzbosfjJG1eI9
	MZDrUdht/F6sncuzIEp7MB8BLY/6eTez2E/7Grh+bhiUXO/e6QLVqNWPPeshGsU4LhkHrVlU3ux
	0WmdVezgxKz60a6OG3a1cwqROtjiUk5ezbGwwYmSVqgXADi51AWc+QlzNlOvEgSL73uKsBvkICx
	WFsOMRltkj9jtDKAkhar/I4jxNbcBrHuhBJB26C0M31o2EB4k7TsE8RPTOXAAFsCE=
X-Received: by 2002:a17:90b:5287:b0:398:9c07:8907 with SMTP id 98e67ed59e1d1-3989c0797c7mr26090507a91.24.1788169103218;
        Mon, 31 Aug 2026 02:38:23 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm32786117eec.7.2026.08.31.02.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:38:22 -0700 (PDT)
Date: Mon, 31 Aug 2026 15:08:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Xueqin Luo <luoxueqin@kylinos.cn>
Cc: patrice.chotard@foss.st.com, rafael@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: sti: avoid NULL dereference in dev_err()
Message-ID: <apVLi1Lej-5lwkqd@vireshk-B250M-D3H>
References: <20260831091159.3906287-1-luoxueqin@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831091159.3906287-1-luoxueqin@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_023824_779297_9EE4C6AD 
X-CRM114-Status: GOOD (  11.71  )
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

On 31-08-26, 17:11, Xueqin Luo wrote:
> ddata.cpu is NULL-checked, then immediately passed to dev_err().
> Replace with pr_err() to avoid dereferencing NULL.
> 
> Fixes: ab0ea257fc58 ("cpufreq: st: Provide runtime initialised driver for ST's platforms")
> Signed-off-by: Xueqin Luo <luoxueqin@kylinos.cn>
> ---
>  drivers/cpufreq/sti-cpufreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied. Thanks.

-- 
viresh

