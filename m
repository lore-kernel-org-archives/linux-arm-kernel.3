Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEBEC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 05:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sw7t6rEqkTZXH92Wz/4+gNz4tFU3pvCeEiYAUtl7Rbc=; b=JBGOfRt8msznW/iQ0+fv4J0tU4
	kaW6NYEQnQ65TpdeM/p4eJg8MU3EF5qKWaCNdDzxGo0j/JZBR5rvI/HQ0h5LFAo/LGDoTkhYqgMmJ
	/oTPj5dIObJSGGsxCxhtw1bwt81UFKZ+31W+yhc/RmxtaxMlMI6vcCqx62jayUzYqKXRiCV4JR8NJ
	gt9et5Gm7yl4C17k07DsUVke+sD4mruyZirW43X/FALNka/zKiDvnh/Mnr0awUo2PlUXNXtXKxCC+
	/QuzTpSoSc1K1WGx6M2cydK7MmogasyZ2wMS7AyOkmh3602ZvmWb262nJJF8/Kg0E9C/XCO/N9rJm
	z/HQVUQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkct0-0000000Awav-0UBL;
	Wed, 19 Feb 2025 05:44:42 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkcqb-0000000AwKu-2lpr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 05:42:14 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-220c8eb195aso128267025ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 21:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739943732; x=1740548532; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sw7t6rEqkTZXH92Wz/4+gNz4tFU3pvCeEiYAUtl7Rbc=;
        b=bd/sNsWNG+dHUhzT50cnKpZ/0miwHYIkn41wfadY054KOr0L5cUzc3iDp2gBQYR4If
         4VOMgfE9/OuRYRge/+NhH/plqKWVnIUSUaSb9ctd+8GU2D465tL+2uU8ANNkZ4fQz+dl
         D6T0qKdNHmp+dCu7kyKSW1adW0deCGY1c2CwLipyjNEq7mzPrhBKfRXSrKhscl8MFtZx
         lQIZgM/gECgh9TeETKXUV7IJQTXnSGZRfPTaeUJ0EcAmj8vl7QVUPrUcpCSJG+lEeUND
         mxWOJ2hN7CdzcoMM6gkdiCL47ZDydd8QhTW4ObeuQu4SX9HJbyYYDKmtjvfR7lZ4GFnl
         XXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739943732; x=1740548532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sw7t6rEqkTZXH92Wz/4+gNz4tFU3pvCeEiYAUtl7Rbc=;
        b=cer0UKiy5qPomK9AwJcEGo7M5DRbZsgNR/ATBNV/6WFpm/OMgvJ+3/7Ph6R7tMfFBX
         uM5y5sOE54hVKSSmBfRX9WwdqwmOFUN9VZhfYSvISWTTVeNRWaBydZ/v+w6sp8ZPqvQJ
         basr2yzwDn2gQAQjtObV+urihVH/vkO9QceKCW3SYgOUpmQ8r2KDVo43sljYNNFxh78h
         fwarqtbsjfeQnkzxd6gMFHWNIB9tG/v2i7gFvXMHkIVlIUjBCjRmOJNn2L+6KtyFoZ0L
         1HvDJw0+bU5jaxfI4IBT4AKFEHRf27bCjm3OGmqi83iOv4T6VMhYSd4XmWvwVey9D0Pe
         RaOA==
X-Forwarded-Encrypted: i=1; AJvYcCXQUW1aTjRM9w27fATxO1y5+1Kwzh2yU/StBx0PG78281Pt4YsiBD8AtqoiKg975wI8XsDk4j1h3jQ0w2pXxbd1@lists.infradead.org
X-Gm-Message-State: AOJu0YySxEs/i2kQDzOs7A3qxfRUpRLkmrH5AvoKNRd++Biqe4MBir/y
	ZNDAYS4DJdNxahQv7vDWNDq+k45FACx5GZvkkrMWpy4qfEks3wd/ZqhoF3dSs8k=
X-Gm-Gg: ASbGncsn40BHPUZEZduRPBmGECb41pnExtXdOHUWfEk+Rq1WrGjdDQMTEYFRFjZNtKn
	lqQ6z28KvkD1G6PR3z8VnCdn2jF0O9NzHfEx/LQiiYnAnrIhLsKJAdDNEf74Hu/mbznTlCOmWml
	7YJ4OJDPG9V8XO4IPmdOfqmrcYd+LllvxP8KJ9ltEFE00cRQT021x11cu6ewP/HAjKWMRskfJQj
	s2pC6y5HyFQr7bL/a9QUs5McddpP/8I0UzQa3sLAA91yb55kfzSZLxXRQGPODzs6XVKkTTb5N/i
	mCMRPzmYJbmbmPzJEQ==
X-Google-Smtp-Source: AGHT+IFmJl4t7FAw0hGuv5yC3n7fuRs/TbAcabQxCpBJfvULJjAbDJAYajm1qYLNhiNrv4hZgm/Tjg==
X-Received: by 2002:a05:6a20:7491:b0:1ee:d3ac:56f7 with SMTP id adf61e73a8af0-1eed4fb2369mr3887537637.33.1739943732560;
        Tue, 18 Feb 2025 21:42:12 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242568adasm11461609b3a.52.2025.02.18.21.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 21:42:11 -0800 (PST)
Date: Wed, 19 Feb 2025 11:12:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race
 condition
Message-ID: <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_214213_711371_23C9B6C8 
X-CRM114-Status: GOOD (  12.78  )
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

On 14-02-25, 15:43, Mark Tseng wrote:
> In mtk_cpufreq_set_target() is re-enter function but the mutex lock
> decalre in mtk_cpu_dvfs_info structure for each policy. It should
> change to global variable for critical session avoid race condition
> with 2 or more policy.

And what exactly is the race condition here ? Can you please explain that ?
Since the struct mtk_cpu_dvfs_info instance is per-policy, I don't think there
is any race here.

The lock was introduced earlier to avoid a potential race with notifiers, but it
has nothing to do with calling target simultaneously.

commit c210063b40ac ("cpufreq: mediatek: Add opp notification support")

-- 
viresh

