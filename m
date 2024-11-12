Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2039BD42BBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvAxizT0+2LKEZU/zIXU+c9h1QMoetzSlOQ8t234HzM=; b=dg+x79FxzXzh/5kRxKYy1bSQ9y
	7yZGS5BjS8KLGkF67TZD4qZNI/eUqQrrvmpXcyZNFsAa0Ny6coUF4OP4oy9+8CEDp/+m8/1X6XLLs
	WZ2OwhzfZ0ARnYzMD/CpUEOFR7t7U53b+5jiGymmEbWcasAGZ2326V0FiuBkLNtJtG+vsh1DvGsJJ
	y7UJd8qScUDrjASrDa6T36SLrw9fqYV0bE6da+rcOG0QXFvwmbBaZMfhvQI3JspaCWA6UM+SQCPio
	N0qrqi/WDKPf2lP14HR4tE31YwzAYFu0ahw8G0O4BYyBUvQ8OhV6jju/LJzy957epFff5o+P0xHdr
	h+pJnfrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvst-00000004bHf-0QAT;
	Tue, 12 Nov 2024 18:45:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvr5-00000004axJ-0Ip3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 18:43:12 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20e576dbc42so64320145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 10:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731436990; x=1732041790; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bvAxizT0+2LKEZU/zIXU+c9h1QMoetzSlOQ8t234HzM=;
        b=wsNt7BVh51Pf/0BjfnBkHE4EN9fmhZjym0Zm1YRDL3ANnKkVPhELDFGWw9fHE/pdMM
         dJjatwR6s6hLf1hO5GIAttVY25KnU5or7w6iVK6e9h1kObTX8GE6skOzg1p7wQQvJxfa
         87uiZzLY6o0aEblZUwn2mLhP7zzjCPYmZNKZLk12G5qP2fbKWR4yGFB9eZ2WOYT3P8P3
         F1IndgYQfj/mHBnPUWrYjkM8Qndyt6Bc8AbRpvT52X8PwjL1cMvM1R4GK8K6fWJHTONh
         U9V5DLtc4Y2KfhrfOPpyBZZ7+GH3IOrd637hI6GhptjoJHcReWQj8pD4orY0qlN4/fQv
         RpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731436990; x=1732041790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvAxizT0+2LKEZU/zIXU+c9h1QMoetzSlOQ8t234HzM=;
        b=i7BPBTf7ECyOkvu1yDis8xKFVolpQz7V/bfk2jXLBJHNRwXq5pMPtnTVur2W9JsN+P
         b05YdRuJVvplNWRCgNXIwIJxlBqndMuNG56WDrTLJeSD+FhNBXw2K/cH+eOf0aEkRCXN
         rjmFB8HQxkf6yVwRSM1qGbx9w2bcVi6/wHJVCIJNAguH4uO9FDXG32iWzRPnprVm0YMt
         0wFE8N8fS74pJmEWP1U+ThYtk1/7iISGYCvyqshBldLfrn+kjHmy97M3h1Wg84KivTvJ
         vHyAzfKnIlQe6DNhp9NGYoQuvLaVkQvfL1mGEzuN4P/YcRjw9jPGz8eZj3V9iXavuAxe
         TxEg==
X-Forwarded-Encrypted: i=1; AJvYcCWbTsZV2H4cjyU71vIhrguaJHwohpYNB+dxiiE3lfYAX8XtmFMWNJakQ3jLdo5X5cmTxO6+kdspHJgt0MSB5YpU@lists.infradead.org
X-Gm-Message-State: AOJu0YyyAdfU+J+HfWJh6aLtAnMKt6d43PyjymXQoPpwXLFV5v5uKDUG
	WfpGJDtcT7o4HY1zoy+G70/DkZJtCnqK+ewCa+FwZVTZpGx+nMR/GOujSi+X8w==
X-Google-Smtp-Source: AGHT+IHW7hcorvi/Z4pW7Liu6vMe0qflJ4S1oTRxHJ48MkfOjV9pPI2tf+xCe4vxHYzdvw7/e7DzaA==
X-Received: by 2002:a17:902:f651:b0:20c:aed1:813a with SMTP id d9443c01a7336-211834fcd5bmr269519355ad.14.1731436989357;
        Tue, 12 Nov 2024 10:43:09 -0800 (PST)
Received: from thinkpad ([117.213.103.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e86e30sm94690045ad.281.2024.11.12.10.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 10:43:08 -0800 (PST)
Date: Wed, 13 Nov 2024 00:13:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konradybcio@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 0/3] Allow specifying an S2RAM sleep on
 pre-SYSTEM_SUSPEND PSCI impls
Message-ID: <20241112184301.6mlwpfzzowut36pn@thinkpad>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241112180118.pcn7sf6r3mswwwxf@thinkpad>
 <ce1d2196-cf09-4d27-8b41-372948a59e89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce1d2196-cf09-4d27-8b41-372948a59e89@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_104311_148787_8F229467 
X-CRM114-Status: GOOD (  39.06  )
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

On Tue, Nov 12, 2024 at 07:32:36PM +0100, Konrad Dybcio wrote:
> 
> 
> On 11/12/24 19:01, Manivannan Sadhasivam wrote:
> > On Mon, Oct 28, 2024 at 03:22:56PM +0100, Konrad Dybcio wrote:
> > > Certain firmwares expose exactly what PSCI_SYSTEM_SUSPEND does through
> > > CPU_SUSPEND instead. Inform Linux about that.
> > > Please see the commit messages for a more detailed explanation.
> > > 
> > 
> > It is still not PSCI_SYSTEM_SUSPEND though...
> 
> It *literally* does the same thing on devices where it's exposed.
> 

But still...

> > 
> > > This is effectively a more educated follow-up to [1].
> > > 
> > > The ultimate goal is to stop making Linux think that certain states
> > > only concern cores/clusters, and consequently setting
> > > pm_set_suspend/resume_via_firmware(), so that client drivers (such as
> > > NVMe, see related discussion over at [2]) can make informed decisions
> > > about assuming the power state of the device they govern.
> > > 
> > > If this series gets green light, I'll push a follow-up one that wires
> > > up said sleep state on Qualcomm SoCs across the board.
> > > 
> > 
> > Sorry. I don't think PSCI is the right place for this. Qcom SoCs have a common
> > firmware across all segments (mostly),
> 
> This ^
> 
> > so there is no S2R involved and only S2Idle.
> 
> is not at all related to this ^, the "so" makes no sense.
> 
> (also you're wrong, this *is* S2RAM)
> 

What? Qcom SoCs supporting S2R? I'm unheard of.

> > If you use PSCI to implement suspend_via_firmware(), then all the SoCs
> > making use of the PSCI implementation will have the same behavior. I don't think
> > we would want that.
> 
> This is an issue with the NVMe framework that is totally unrelated to this
> change, see below. Also, the code only sets that on targets where such state
> exists and is described.
> 

Well, you are doing it just because you want the NVMe device to learn about the
platform requirement.

> > For instance, if a Qcom SoC is used in an android tablet with the same firmware,
> > then this would allow the NVMe device to be turned off during system suspend all
> > the time when user presses the lock button. And this will cause NVMe device to
> > wear out faster. The said approach will work fine for non-android usecases
> > though.
> 
> The NVMe framework doesn't make a distinction between "phone screen off" and
> "laptop lid closed & thrown in a bag" on *any* platform. The usecase you're
> describing is not supported as of today since nobody *actually* has NVMe on a
> phone that also happens to run upstream Linux.
> I'm not going to solve imaginary problems.
> 

Not just phone, NVMe device could be running on an android tablet. I'm not
talking about an imaginary problem, but a real problem that is in a forseeable
future (that is also the reason why NVMe developers doesn't want to put the
device into power down mode always during system suspend).

And with this change, you are just going to make the NVMe lifetime miserable on
those platforms.

- Mani

> Besides, userspace already has sysfs to tune device power state knobs. Which
> Android uses very extensively on market devices.
> 
> Konrad

-- 
மணிவண்ணன் சதாசிவம்

