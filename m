Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90983C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NewX5OVmm2gpjaInbsHi4XyyPQGo9HpOPHicrR4WUc=; b=eIhQGeQAa4NrrzRMd2RIECaZEl
	CbLw/7doaJUZ2IV3AGkU1MDi4D+Cf2bRM71BBFRf3eW0dhbL/Y3YxrpnoO6qotuBcLTKWGRSvgFb/
	HZxjbImWT4vKcIbs9TKPT4G49D9bbVcy+1dkWjTb3NQlBwIHquZLdgGI/bmaotPM8+rHaaL4tnnTv
	M2lXKf1C848WrczIDM/5XB8Khd6EVCVcrJrdhW4QsBKzg77T8AKYb+nMa6HpPIhw0AQkMgDAENa6O
	Zse/u77BLzRmkyUF2MlVYMhk66efnXyQwzh7xzGAPs26mGhidHmLu93W92cw+VILqsQoCREEfWk8C
	9RXvargQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRv8-00000006dA1-2m52;
	Tue, 17 Jun 2025 08:43:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRf4-00000006bAr-46qw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:27:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0331F629FC;
	Tue, 17 Jun 2025 08:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B566C4CEED;
	Tue, 17 Jun 2025 08:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750148837;
	bh=wFWNddruW+kvHK/NOURMNgfhmqAjINHuhoKUoDLtdD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g/QB2ICSsqBe4u9VRM1R1/6wN38bWi3oSH/ONJztU5yH5nKrJkBMlmGqo25o9w41u
	 xvwiZLIaAghu1czqfHoCtxoOSotW0Twmj8KjqJsvdCSxVrjZagZIIPmQW+YvkDYJWV
	 MW/qAhf9m3t3KxDDljBMRJny7SxfxpPtMWZoCvRRwbG6EmMPShXsyclP30RcIQPSlD
	 GtoO7tPTbX9eRIrJLvb1e6WfvLVr6TQVrBmqJxvSXaLyBpJIaVI7JMRNdAojw2/wrw
	 FsiY9doFsvRjVN+LfmKq8l2o6ut5rtORUYeTYgW+x0QgZVBQH6+FqALahoL3SuwMzj
	 GYYvoiH00GwgQ==
Date: Tue, 17 Jun 2025 10:27:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: opp: adreno: Update regex of OPP
 entry
Message-ID: <20250617-ambrosial-amphibian-oyster-ae7cae@kuoka>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <20250611-x1p-adreno-v2-1-5074907bebbd@oss.qualcomm.com>
 <492417fe-c086-4980-b108-0487bad08155@kernel.org>
 <d482653e-5c0e-4b03-98d6-2c898b445917@quicinc.com>
 <750da319-d25f-454d-b376-ebbc194e0e41@kernel.org>
 <31c50188-986a-44e8-8765-c1fce6ad3c2c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <31c50188-986a-44e8-8765-c1fce6ad3c2c@oss.qualcomm.com>
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

On Mon, Jun 16, 2025 at 10:18:24PM GMT, Akhil P Oommen wrote:
> On 6/12/2025 4:59 PM, Krzysztof Kozlowski wrote:
> > On 11/06/2025 14:24, Akhil P Oommen wrote:
> >>>>  
> >>>>  patternProperties:
> >>>> -  '^opp-[0-9]+$':
> >>>> +  '^opp(-?[0-9]+)*$':
> >>>
> >>> Not correct regex. You allow "opp", "opp1" and all other unusual
> >>> variants. Commit does not explain what problem you are solving, so I
> >>> have no clue what you want here, but for sure opp1 is wrong.
> >>
> >> Just to confirm, would this be fine for the requirement I mentioned above?
> >>
> >> "'^opp(-[0-9]+)*$'"
> > 
> > No, You did not solve half of the problems - still allows "opp" and
> > commit msg does not explain why "opp" is now correct. Describe the
> > actual problem and then write the regex solving it in specific way, not
> > causing other effects.
> 
> Gotcha. If we want to be super strict, the regex should be:
> ^opp(-[0-9]+){1,2}$
> 

Yes, looks good.

Best regards,
Krzysztof


