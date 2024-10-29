Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55CBD1356B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 06:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxdqxmWJXdXU8AUeRm4skNzTB6cELoVffMjUmz4VZV4=; b=KV4CtLxNxuEM4T27s19gErnPRd
	g5IrdqyCYrmAxFxx8A87mIAyqfoptYNWNOfAIv0ZkFOxXkCVCaLitkqUlMvg5D/1q0EA2ZAlXkTM4
	1tdNqtK3Ulro5BmSrKe95TH473BSLpf06IhK0fHloaU08bcj3tWLyxktJMkYqsyz52NdBiwh0QxtN
	VB98duj0JduDt006kVZj444UERJpcIjXc+ux6xWIkr+suTrHUmTKk0ynfLwoUmAxTZC3iE+5bS77u
	YpnPaRBlf2/mWoDczC2+zGqHfkWjuokvM+8jrXM6TIMhJ+epIMGr76mtomfBJSiMZq1ognYjO5M1m
	96fP8Fqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5g87-0000000DPzV-2bFD;
	Tue, 29 Oct 2024 06:55:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5g6V-0000000DPq0-1FsZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 06:53:24 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20e6981ca77so54678665ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 23:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730184802; x=1730789602; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gxdqxmWJXdXU8AUeRm4skNzTB6cELoVffMjUmz4VZV4=;
        b=JTYjlp2O2wFQnShkAJf4kgivf4+3N/HbgT9wqYLzVkUuQES8DQ7oEEkwGO6aa4GqPB
         a5hDDMc6pdb/H5TpobhtLb9FgiTSSHBqmrqYy+ktcMU/FEv+nzBEJn7gy4Q1Vo5Gm1Ts
         NHotDU4elwmnitHks1dyPayv6B2VFp2nsvBZSDR1ijmKLMi70b8KjqMSps/9Z3hQs1Zw
         Y3vExlUpk1IHULN3+UhjTdr+M5DEVoMW6L+A04/4k6GWubfy7laVuS1AugGQ05jg4/+t
         52E4UYKjk2o9JXbunNhYnkw1Z7ZkZ646PZIyVdmx4Wyhzzi86jtZsNhiyo/pKkFy0ymi
         2xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730184802; x=1730789602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxdqxmWJXdXU8AUeRm4skNzTB6cELoVffMjUmz4VZV4=;
        b=oDB4QBRyZDUWrkrz71rvX0sFyqD4LNRpEqwoIWx1VNuuoKsxuX8EGHjDCaNRUDb2Ku
         aaafebRmxRXEJu3W3DFoK2CD8uxkgNgG5gzFYZdgWRZaY3xMU6tipzU2ZJoG4i/i/kr7
         MBYanMv4+cyLC16CvB9uJ6N4QywLfzVZe2AWYtiVDM42MaSIB4PEsK6FeKnKxHPcrdmI
         7ijKokbZItnXn6q9NbKZWiwyU+1vmyKTspYvKYEDR35URCB8ZdK31a2eNseeNAMFlo3C
         6FqUROjZMma5lQM8A5zhHEdfX1W1M0iSV8ch2+6dJVYBGjTsj8dkAIkhMPb9P6hqtUO/
         mF8w==
X-Forwarded-Encrypted: i=1; AJvYcCVgAUI0FG+ed+820ExfUazljNvZfwjG1uwWjioct2gso6eSG1qWhCMPT8+X9pvb6YwvNdr9Wg44Sk8aSuZySQ4k@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/nunXkRzkeBHI5xVc7G/lZfnpcxI+PPUv7yakmbn8cyF39F6e
	F1qoCBmbbNjbvwii5thimx/1ywYeQmWf5q//kKDcPLyfVRXW6P4+svbflrtvRog=
X-Google-Smtp-Source: AGHT+IFmnh6BfWm9u00lcdmwhUncv3sqpOQIn0HAENF9MSk8JtP1yLm3zPeUH5AL8E7LPGeuXgJA4A==
X-Received: by 2002:a05:6a21:3a4a:b0:1d9:1d2d:b656 with SMTP id adf61e73a8af0-1d9a83d9f36mr13743238637.15.1730184801978;
        Mon, 28 Oct 2024 23:53:21 -0700 (PDT)
Received: from localhost ([122.172.85.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921daasm6909172b3a.37.2024.10.28.23.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 23:53:21 -0700 (PDT)
Date: Tue, 29 Oct 2024 12:23:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
	Sumit Gupta <sumitg@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	ionela.voinescu@arm.com, sudeep.holla@arm.com, will@kernel.org,
	catalin.marinas@arm.com, rafael@kernel.org,
	yang@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, linux-tegra <linux-tegra@vger.kernel.org>,
	Bibek Basu <bbasu@nvidia.com>
Subject: Re: [PATCH v7 3/4] arm64: Provide an AMU-based version of
 arch_freq_avg_get_on_cpu
Message-ID: <20241029065319.zto3wlvceec3fjym@vireshk-i7>
References: <20240913132944.1880703-1-beata.michalska@arm.com>
 <20240913132944.1880703-4-beata.michalska@arm.com>
 <aa254516-968e-4665-bb5b-981c296ffc35@nvidia.com>
 <ZvU4mR_FZa7jXUgk@arm.com>
 <ylcfqw4swz6xjxxfoyljyifs4ibbueywogqxusxfz3a3fgh3du@cfaajchbwgvn>
 <Zv8PKlr_PJgxazro@arm.com>
 <5y3yz2ct2o42c53dc6rwpse3andstjx74lowt2b3hohj4ogbct@nu2szdnxvxid>
 <Zwe1p0La_AFknglf@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zwe1p0La_AFknglf@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_235323_363176_FE61E7C3 
X-CRM114-Status: GOOD (  11.25  )
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

On 10-10-24, 13:08, Beata Michalska wrote:
> That is a fair point but I am not entirely convinced using '0' instead makes
> things any more clearer as this is in no way a valid CPU frequency.
> As long as we document the expected behaviour keeping the interface well
> defined,  both options should be fine I guess.
> 
> @Viresh: what is your opinion on that one ?

Failing to get frequency for the CPU shouldn't be represented by 0,
even if it is confusing for the user.

-- 
viresh

