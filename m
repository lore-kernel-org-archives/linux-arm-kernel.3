Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2EFC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 06:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmB3zEarsAJrwCcZCi/AJVx4uS/XYfMGLk5IAPZ3kC0=; b=CGubYxO5KaPB4BLiTfdaGPZuMw
	qHrODDcR6QVATE0p2cyoDD4XRkxkVrUSPSMCcSBZGEnO+H4k9PhgBN2+hpSh96c14XZLnqITGPB1R
	q5/E8Ed1N50Ee7HlDEgF4UZagrlKGmF0Ka7dBo5sxe+4o0DO2pwr31FuhV5PpV2qIP/kEyfERK9Hd
	brvhR0D/ZOWxN2byjOtoMujcmYOWlWBbdh4pRB/m+w1yXFjcQ3FM0sd4yplWi74wZyHly4MISymC4
	Spzes0vui5tUiu5xmeUoTPxvzSQ1B85o4Odj8kEh7TGlhaCwPYKUCaBATk1grIBjlWwepkIfCE1QM
	Xn7WAfrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvVTk-0000000DwXN-2Yzj;
	Fri, 21 Mar 2025 06:03:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvVS4-0000000DwNE-0sch
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 06:01:53 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-223f4c06e9fso26700625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 23:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742536911; x=1743141711; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zmB3zEarsAJrwCcZCi/AJVx4uS/XYfMGLk5IAPZ3kC0=;
        b=BN0HQa2IaCfrfhfCJcFRGyK5zEV6H3ERcBoitR8SOLvMdPVwASWxif45x5MCXZHp9a
         dnaB8xW9TQbGImieP2XX/8GP+yu8ixsyUbm6ohsCJiq9SBKOhVvkOLfNjo6nwsB2d5Tf
         PklXWUv/yLjyEfIlNJZA/PBEP30ZTExuAiitewhzw65Ecx6GP/YuLvJxYZM7I89rZus6
         o8IulCJ+Pg46mSzHKqX76IiDw/OceuIwiw48mhiXzoHfiX2kA1sX43/d/lKaszCIc1p1
         s6cjBKxrpAZmm8Bxj4rXiiT82x+H/zXXcJUJdSDXMX6eMzHOGQr2mOCVEPrTW2GI0qHN
         bkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742536911; x=1743141711;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmB3zEarsAJrwCcZCi/AJVx4uS/XYfMGLk5IAPZ3kC0=;
        b=e2o7bNAuAaF7pkXBZAXrqtbVYuAUL8ac06LqKbnjLBFCR8HN55yviskcvpFLNe6rkf
         ryaWuSmYSSyx5pYuRIDuw3T+EvchP55BnA7P8ROcUwqUWcq/+OJJTeW7ciyTJOd0K7RB
         g4pp9JGLWw5qsDu9I3FCxabgm1hShvXTiFppmuJPRvfeuc1OZ2jbziKPKQtATD9TB+jE
         rON8rhINKfelIxDUivRbQ+plY6chjMWUK1+/HBSMgtPViO7gcGlR3jbSYwLhU3yrcVyT
         RF9pBwyvzsgN5r5gq14qYDsdXOeEX5wuJiuhUCbuh+SlHxMLx4jD8TRzNaeMPqYMQwzh
         jCpw==
X-Forwarded-Encrypted: i=1; AJvYcCWUQNupgyQUHt2Ibc5Nime/Uos8Kx0EyTmioSL0jRL4oUJ3oCw3zBkeaqMjtOnDlXdz87lLr0+Z/aTdJvdxzc7v@lists.infradead.org
X-Gm-Message-State: AOJu0YxvCr+Qd3DgxDCa/Dw9KJNL/yZdnuHEYhd7L+CFDOukPu/M3kaT
	r8+R3suvFqHsmdyXwlroG3EXFm79mjGczo0snVFJPaWFKW7jtQ3Z2jaJ119nZHg=
X-Gm-Gg: ASbGnctHKGD3Qcia4OmK1ADXZx5HRs9/Tmp0vWa5WSG/8n711XBRS1jBZaGNQIAkWsQ
	qqoNsbSJ/4vf53L67vFR/1VE6SDShAHaJQosJwVPWejl1vbunvi8xAsm92cZIhXu0os8lZ6AZJm
	x3jR2L9JeTAewTVsoq1cceyXHGmas750azpTP9ow/j0vKGsO5ruVyLo5PRV9BDAQKXsi3I76SJL
	FbopH76GzzrjZ6DMEnaB7oKpXyB0ue7J1ZFTyhSrfDgZGpdgvQq6Z2bPryM7HdjRhVe33funY4o
	8dhpK8bjCJbi3Zt/VoB6UIEQFpqHR8ExP1D8zKlON4x4WT2gbEywzXrA
X-Google-Smtp-Source: AGHT+IFtVqF1ORKmDSsfR3TArM9faGSxKWG+5TBHlY+RPgM/7ilFPFIlu4kDkXwHLe/srNdTiQnoFw==
X-Received: by 2002:a17:902:ceca:b0:215:58be:334e with SMTP id d9443c01a7336-227806b8e47mr42530375ad.10.1742536911081;
        Thu, 20 Mar 2025 23:01:51 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811da89csm8204645ad.193.2025.03.20.23.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 23:01:50 -0700 (PDT)
Date: Fri, 21 Mar 2025 11:31:48 +0530
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
Message-ID: <20250321060148.adhxjexpnm4dkpnt@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
 <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
 <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
 <20250321045624.mwm2mnkqeow5uids@vireshk-i7>
 <2a73b5ca35692c8ffa68c9ff0df73e24a592967d.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a73b5ca35692c8ffa68c9ff0df73e24a592967d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_230152_253427_67ED6A41 
X-CRM114-Status: GOOD (  13.40  )
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

On 21-03-25, 05:32, Chun-Jen Tseng (曾俊仁) wrote:
> I add a global lock related to the CCI driver.
> 
> This is because the CCI needs to obtain the frequencies of policy-0 and
> policy-6 to determine its own frequency.
> 
> If policy-0 and policy-6 are set simultaneously, it may cause the CCI
> to select the wrong frequency.
> 
> Therefore, I hope to change the setting flow to the following:
>    policy-0 or policy-6 -> set frequency -> CCI receives notification -
> set CCI frequency

Can you please point to the code where this race exists ? I am not
sure I fully understand it as of now. If the race is present in
another driver, CCI ?, then shouldn't it be fixed there instead ?

-- 
viresh

