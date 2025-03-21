Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6F5C35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 04:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ozUpcCEWntr3v7+jvGD7rSS3mGlFfqxCVTsgZ2wgtA=; b=ErP/xsoIVHy88RAlxSWpbDP1H1
	tuoIIS7UoUkYhQqf8x8JLD/CO1L2zQkBBb2gxANCuXOZijWmSMDV0/9YeAk7p3Np0KjjNKjjSzzrM
	GRROdSUGL2XDQe1/x5YN96ysEro7axuzpmvTQZUV2IUyxQhbVIPzfxsvrPlYXyYG4nE5oHqW9sw/v
	czqGUiBNKeKZ3MgSX8uzeBz1ADSXaDA0xDSJkkMJ5vVZ1K3miGRCOD5tHDT3bRPVSHWDiKbyy6kch
	R+UJF95MpNQHwIWttKyek7hy+ChWW7Qe5nQ7djCBMT1+6piOzbUYAJu/X2S9DQQC6AGHvQcZmnJv+
	JqALXYBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvUSV-0000000Dqdv-1ZPM;
	Fri, 21 Mar 2025 04:58:15 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvUQm-0000000DqQL-2v1W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 04:56:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223f4c06e9fso26149205ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 21:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742532987; x=1743137787; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ozUpcCEWntr3v7+jvGD7rSS3mGlFfqxCVTsgZ2wgtA=;
        b=y+ggMIIA02TPGvHXq5SwK7nM5LDZ4he5Zz6yajzu6hvbmuken4/uFnJT6nmw71ky3A
         2tWbIR3atZ1kOds8nWy1+Xj9sFRFypl0gR4FxpN9xjvjb2hyz6E5RT0p9rwkUAMTfOAi
         //u5mMdttwaQylAm24xLPU6faC1uXVHXmBhHnj5XdJ7LIgnT/N9JoHANo2snqGAR+qx9
         TVVgAfHOhfxWn4QtcKGs0ysX3+SOK6lN8D2kf3sd9eWvA7dl16BZDLCTeD0M+DkEvrrz
         0N9xm2pf0In71Xj9zgt+eUrnl4MFxoGsbZYkfRxTINhlgj4snEma4+IsIaqnTJjJ2K4f
         NLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742532987; x=1743137787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ozUpcCEWntr3v7+jvGD7rSS3mGlFfqxCVTsgZ2wgtA=;
        b=B0yhRV7X/mohcc3VRvDgom4ecWm1Iiz9jxWGq1IZcGEm+h1L6pwiBEFwH5YcBIsI3i
         K14iWPgXKX6NooyH3zoGVzs3VwWc4TY7pwV849B8hEcvIVn+z/a/NihV5VgV7kqxL7m/
         Vct91+eGBL0WRfy5aFd5krq6n1VOKucMTZMFjshaylTBC/KCZWYjiad02PNUYmC/kHiY
         wpwK3JrwTST8g8QXtyrxXLleYK2zyp8+KvBhpG7LwCAyL2bQlt7oF+oPCL+y94jRjg0I
         rFICDbY+m6sA1Kbvy21CRE9Vu6nEDsVgO2wRTIm1erMssrcNmRtdYs4wKmdOb7XJj2Ew
         bw3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRWWNfldKNYSqdF6Ubcc3Hg7Ne3Nt5pNuIrQS700BhUzhM96Ef8NPWPAXxRinbO46ri/8Wj6kQS+nx8OcttY9M@lists.infradead.org
X-Gm-Message-State: AOJu0YzhBidzE/QJotTEr+q06YlmY5DdF2I5prXPjTNcLNujFLAuVtxN
	0+tG2SjU19Av5plsWidqXahzFWP0G8HyIFylAyXnr9gFQUSvbjddgUQBURXSq7Q=
X-Gm-Gg: ASbGncv+N18ZlCmdJvrQmmGSPxDSLNNNEhUTJLq/2ahJsjZz055MZqjq23hwpuLhf5v
	BVvho9yKzV3kgP8bmXZvHadi/24VMjRWqXBlr1sukFEYUt5PSfQz8kNcIJG7ZW7ihMkBTcRR0g2
	Tyfif7txCh05vzFvbqtb6Y/Sx5LZl4v3cijqVbl4QJbBFIT3RAlvu5+063oYFSsmvYrYmS8OMW+
	SPZfro7KN7wjaKWfNa3o4MdQuDQNFLO8GTQvHeOYNVMwPErIM4N7lSpn1/TCwpRvgk18kdZp859
	r/xbMKXIkNqzGhN0bV2dAcYuqV5pCCUndzMnYuJTYbHTZw==
X-Google-Smtp-Source: AGHT+IEfZE88rs+io7iiRT/X8wJSM3aPVySwMLCiKFphdme5Nr2cI1Z/rOArrzthb1zZgjhHnKW+8w==
X-Received: by 2002:a17:902:f646:b0:223:807f:7f92 with SMTP id d9443c01a7336-2265e743880mr104023345ad.20.1742532987264;
        Thu, 20 Mar 2025 21:56:27 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4d5f5sm7225665ad.79.2025.03.20.21.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 21:56:26 -0700 (PDT)
Date: Fri, 21 Mar 2025 10:26:24 +0530
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
Message-ID: <20250321045624.mwm2mnkqeow5uids@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
 <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
 <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_215628_735430_700308B8 
X-CRM114-Status: GOOD (  11.18  )
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

On 20-03-25, 08:22, Chun-Jen Tseng (曾俊仁) wrote:
> The struct mtk_cpu_dvfs_info instance is per-policy and the reg_lock is
> also in this structure. when I have two "policy-0" and "policy-6" use
> the same mtk_cpufreq_set_target() function but the info->reg_lock 
> is from 2 instance(policy-0 and policy-6). when the policy-0 and
> policy-6 call set_target target, the mutex_lock is locked by per-
> policy. So, I change to global lock avoid per-policy lock.

Yes, that's what you are doing. I am asking why a global lock is required here ?
I think the per-policy lock is all you need.

-- 
viresh

