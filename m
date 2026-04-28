Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB942FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 14:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsYz9EF0cuVmErnqDejVSwtFx0hR3j24m1rjRwretrw=; b=Q4ETzWn0asOVDaXtkTKLaF25q0
	CG/PxPFgHrNgz4rVB8asTf0ZGHnDxNZMa+vNJylBTBJFPe7WFEevy8e6PbsvReaZtoUYZ+RgBRbTz
	ez3RoNcXwEML658MkkkcZs25S0oWtAr4pc0UanpSpmiBpGewoocIgoIVrHVxFvHQbUrA/sqn6rNLP
	69YRR207whVH1/hC+oKRieIY9GAbpkFat87lR92208uXttYmooAa6nlInrCULA1qf1eUk3cdsDWsM
	9YLTCtYyFXQHFbou47FPg7M4gAchJtgvwiYPa/Hgonoa7Rf1R83Ui+VvIlnO9DXG2xznasH7G6HEb
	DxH3fblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjSK-00000001eyb-0xKM;
	Tue, 28 Apr 2026 14:30:32 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHjSH-00000001eyE-0Bwf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 14:30:30 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82f431c0ab6so5321484b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777386628; x=1777991428; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FsYz9EF0cuVmErnqDejVSwtFx0hR3j24m1rjRwretrw=;
        b=Of9Gc2IIMhQzU9fXJx7NGGMQXtdmfRv1ZlL4pkGREDCy3KzNvf1A2XhTrL6xpZ4Dn8
         ckQ1lrq5fu48Yc2GLNC9sP0fJkETfHHVWKj5lRyirPtvyd7H4SJZNxqf+2SKwhSUJxGd
         G5AK08hqS2YDNOM06S32/GtSwvwinDsFSZNs22CrWYenrPf3W+FDn/ZvsKUgbPhPxBSW
         OAjUtAN4/mUYsiaLRSHDe+1r4qpwlvpQ7BpwJWZiEFT/LqeKDYrWsWiW93+2RjXDR8lE
         yb8KHuc8yYsG0Zo6ph3eEzwfaxWBITA4s+jtlw5JfjAXXf69HjDIQRGA9oIKOlteFsma
         ylLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777386628; x=1777991428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsYz9EF0cuVmErnqDejVSwtFx0hR3j24m1rjRwretrw=;
        b=f61zxRwq41w8m1FmsgwSGioyeqFkKpaHpfqC81vMwLkT7VPqc+hC95WSGKQ1QA4IKV
         uIiR/MlUnwCJYJ66c4OlZsW6uIzl5GtmTVeznEBE+tKdtI1KTcuWGaayxrXIpKAmdqQ4
         +4cMPPpShyhXV+e+g2rlb4q51K1+wG+YZBKVao/0xoKHHd86dRmBTqyYvGH5T5QGdjLm
         ucqaLmZ+MBbLeM2mygW79bJ3aaWq1u3+uKU2kDVU1VHRuuhYB1vi5whujhAEIiM5F71h
         UvNPt6gCmZ4MrRIOkqK6bdv1/GmsBTOMpXrJUKeRZYiszOI7+vRTdW7BZCPWpwllKnry
         dpdg==
X-Forwarded-Encrypted: i=1; AFNElJ8rDyx27XX7rmNtumC7F/9CbmcEWWZD1DQYrB/oBb49D4xzrsQ1TdVqCrSg/FqJYCcpe4uhOAhI/nn0bKPravH2@lists.infradead.org
X-Gm-Message-State: AOJu0YyR+/yrHRtE+QsyWCnAHNcTu5OrOSuco1kUh/LJKguwP4VN0YBk
	Vae5NBp4w4VE1jGAUosIK43KOmknbsBZFd/sWRfjM1x0EFT2x0Lo7p7e/Pkf6E3OiW/gzCRpvyT
	rx6kL
X-Gm-Gg: AeBDievuGg/IUwnZ/0S+BkixF4GNw7owB4k24VwuDqZRGhN1gzQcM2hTs9DqAeI6B8S
	URksJjs1roTHseeizVnlfLx0q4a62S+DDnYePrn66wuWHrpfsPIvcKQhuGu6ETdaySUxrmlqWs2
	ovZY56/No7gJfZLjUdURYZ7ACdVsogXQX6LHnWoZfQKXYYPPh9gm7eoBefEGYfe+dBOgwgTy83M
	a/QgpXBonPZvWFKUqMwLGWsfJ9CpDGcQGSUjWG7Hx1tFDRqLxR0/fCeelSdsALseodq9eHLF+nu
	tr+oHrugHJua2Mdf4wn7Feqr/IketZSVejGj9Lx23Q6SWxI9DKY1o3JwsfW9aJxgSEajEnDOVcM
	qSLdv0vgFDPqcXh0STdwM1uODwrsjzPJAqrGO2sZZi+I7kqvPJQXtaXiY/7Wp6VW0Tp49iAOp4Z
	H4HCX7YOXb0J/8XVJT96vetxDUeFQy7WSzeVyBhYKfruzLMr3x
X-Received: by 2002:a05:6a00:1885:b0:831:7627:4ab7 with SMTP id d2e1a72fcca58-834ddc145f7mr3744150b3a.29.1777386627662;
        Tue, 28 Apr 2026 07:30:27 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:a4ee:17e1:59a1:f1e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834daf826eesm3066074b3a.61.2026.04.28.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:30:27 -0700 (PDT)
Date: Tue, 28 Apr 2026 08:30:24 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: tanmay.shah@amd.com
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	michal.simek@amd.com, ben.levinsky@amd.com,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: xlnx: add auto boot feature
Message-ID: <afDEgHUN8fWatC_u@p14s>
References: <20260422202558.2362971-1-tanmay.shah@amd.com>
 <20260422202558.2362971-2-tanmay.shah@amd.com>
 <20260423-stimulating-markhor-of-masquerade-aac0a7@quoll>
 <2351c698-cf08-4037-9777-0820448a14d8@amd.com>
 <eac0f387-c38a-44eb-aed4-6c4022f01777@kernel.org>
 <faef3c54-2292-4470-be6a-4c347ca65453@amd.com>
 <67f442f7-377d-46f3-82bc-86053e34c277@kernel.org>
 <09928c66-f041-479d-954f-56dcfcfa1c13@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09928c66-f041-479d-954f-56dcfcfa1c13@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_073029_093996_ADD4CB03 
X-CRM114-Status: GOOD (  41.00  )
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

On Fri, Apr 24, 2026 at 12:52:40PM -0500, Shah, Tanmay wrote:
> 
> 
> On 4/24/2026 11:53 AM, Krzysztof Kozlowski wrote:
> > On 23/04/2026 19:59, Shah, Tanmay wrote:
> >> Ack, I will rename it to xlnx,auto-boot.
> >>
> >>>>
> >>>>>> +        type: boolean
> >>>>>> +        description: remote core is either already running or ready to boot
> >>>>>
> >>>>> And why is this property of a board?
> >>>>>
> >>>>
> >>>> Not sure what indicates it is? The property is under remoteproc child
> >>>> device that is SOC level property. Remote core is on same SOC wher linux
> >>>> core is running.
> >>>
> >>> So it is implied by SoC compatible? Please provide some arguments why it
> >>> cannot be implied by the SoC compatible. I gave you one way out, but if
> >>> you disagree then no problem.
> >>>
> >>
> >> So on some SoC, the bootloader supports loading and starting of the
> >> remote processor. But it is totally user's choice. User can choose to
> >> load & start one core of a cluster via bootloader and leave another core
> >> powered-off.
> >> That is why it is not possible to decide based on SoC compatible.
> > 
> > OK. The problem is that "user" is a bit vague and usually user choice
> > goes to user-space.
> > 
> > The property will be set or unset for ALL of given boards. So all of the
> > DTS->DTB. That's why it should be clear why all such boards should
> > behave like you described. If this is truly user, as in user-space,
> > choice, then DT is not the way.
> > 
> 
> Okay 'user' may not be the right choice of word. I should say 'hardware
> configuration'. On same SoC, some cores can be configured to boot
> automatically before Linux boots, and some won't. So if device-tree is
> about hardware configuration, then we need a way to show which core is
> configured to boot before linux. This configuration is board agnostic.
> So I think auto-boot in device-tree makes sense.
> 
> The only advantage on this platform is, it has a way to detect if the
> core is running or not runtime and don't have to rely on device-tree.
> 
> > 
> >>
> >> If we don't want to make it a device-tree property then I can implement
> >> in a different way. New way will detect if the remote is running or not
> >> via EMMI/SCMI call to the firmware, and take a decision based on that.
> >> If this new way works, then I don't think we need auto-boot property at all.
> >>
> >> Let me know your thoughts.
> > 
> > This works for me and solves my questions from DT point of view, but I
> > cannot judge whether this makes sense for you.
> > 
> 
> I say I will keep it open ended for now. I will avoid introducing
> auto-boot in the device-tree for now, and send a patch without it. In
> future if for some other reason this property is needed, will send new
> patch later.
>

In light of this conversation, should I still review this patchset or it was
made obsolete by "[PATCH] remoteproc: xlnx: check remote node state" ?

 
> Thanks,
> Tanmay
> 
> > 
> > Best regards,
> > Krzysztof
> 

