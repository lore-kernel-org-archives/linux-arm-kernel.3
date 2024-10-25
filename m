Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBFDD116F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 06:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dafrAS7mWtYzr7LttuBBIbNqQDmpOjzk4+u3c2ZQq4=; b=njPpkj1+/gzzVC4tw6vdzWGd/L
	BiJ436h7mXdNDJSoljzdmdq/5YnusMaILTkClcTbTr4lA+/+P2u6HEsxw2QdSt7MLjll3a8C+ZlAo
	/9mD+KGfF0ikI/ey6+nu/vrPoOESscPNOmlRVyMxUKCWSFyAG2dMO/muKGOivLafMcZWJMlo32w3i
	D5+/rkDhaEPDdZFtp6v8NQCLTj3gnuAgOdErZT8lrOB5j74H7kPnqBgk+A/J00TN0By6yFrvsdt56
	kQ9EkT8uXR4lB5XWo6rCe7yDOySY6ftz5q9tWnyshteC0quC4NU3hGo0OdcKLaOTPKTo0ubOlqzbK
	ZV4wQGdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4De7-00000002f7X-28qN;
	Fri, 25 Oct 2024 06:18:03 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4DbD-00000002ego-2cFY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 06:15:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539f7606199so2106857e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 23:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729836901; x=1730441701; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6dafrAS7mWtYzr7LttuBBIbNqQDmpOjzk4+u3c2ZQq4=;
        b=c6ka/UL6OB2TSzxHNr1DM/dgbfJil8+UWnbJ2dFQQKxW0juXr7kznXFYHFMbEEdmvY
         RdMN25TpGSI+RNoM2XM+Xy2uVYx3W4AT5NEjGQX5wKl2cCO2b11wBihHan/fMInUyNM2
         du39JXXwCKVEVAGQHaE8xsX9b/5n3EuQCY6bSJdhZHaJOx+RqWeGamMrSNY0/WDbN4iq
         8kack6JOxvNKuqg1Du2QPapoB6yI5Hbyc2t9Q3IfOW3FbOl+C9j72ru7u9MlSRJKO2g7
         /EvmMwksmZslsnc5JLoA91jjWXsmd5xSE2o69GaPPCqLTbxEUsbuB6JC6zO18dSOYMBG
         dNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729836901; x=1730441701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dafrAS7mWtYzr7LttuBBIbNqQDmpOjzk4+u3c2ZQq4=;
        b=rqreVB/NUmlKZk6I/c3E5d/UhLudUsFQfAjwDXRW5nJBE7qNs5Ll1+OYUH+XboHh+W
         mV+aHBPPVotI9bgwiCnThBoBvyV5ZQd2LvViGmNXOSjtxi7zSjiP5l90F8G5Nhpm30rI
         GxJhxrj4vyp7l2OO58aBys3GKoC8oFicxpYwP5tLnBQSZYiwZa8/9QDDsF4KK7EgxNuI
         3BD+D9vkpbotrkvNo4YhUovyTWjT5R8oNTEFsAJ6+K9s7r7IvG/q5RwOPfOGkYidXxtI
         /OXnyp/fwRr96WDMAkUXa+835aFiJf5Fo1JaLt7E8zL4AityKQLDFasJhEm+nD6Z8/aN
         sCqw==
X-Forwarded-Encrypted: i=1; AJvYcCVsaYejHcAXMetXRvgGM+FA61FkQlOXrWHiuveXaL1RZX+cE+sUe73CgdjdFb/u+BHAWb8bPgPMHUmIhxFWBfNA@lists.infradead.org
X-Gm-Message-State: AOJu0YzD6BTIwn60Ob5cDp9E+Q6XBv0S8Pm6YcWuoPdWm2rTxsdWaVSx
	swQr1vJp86C6UpszANii3jaKIA9jLuECLb6fOXHENJkgAFXHesMOL4Ysx+818Mo=
X-Google-Smtp-Source: AGHT+IEj1g8Dwn/22dB4VOnNssyoLCJf860JbkqpJsBfmXzprn8TQfRv4vuKdN8e3pyTKN/OTDF1oA==
X-Received: by 2002:a05:6512:1256:b0:536:55ef:69e8 with SMTP id 2adb3069b0e04-53b1a2430a2mr4964368e87.0.1729836900985;
        Thu, 24 Oct 2024 23:15:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1de058sm66320e87.240.2024.10.24.23.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:14:59 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:14:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, sudeep.holla@arm.com, 
	cristian.marussi@arm.com, ulf.hansson@linaro.org, jassisinghbrar@gmail.com, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org, linux-pm@vger.kernel.org, 
	tstrudel@google.com, rafael@kernel.org
Subject: Re: [PATCH V3 0/4] firmware: arm_scmi: Misc Fixes
Message-ID: <ik4dyfbphm7lkeipm2dbr7cmdfxewxd4jtuz2jfnscfwcyo2r4@lrin5hnsqvyd>
References: <20241007060642.1978049-1-quic_sibis@quicinc.com>
 <ZwfsmqInJlqkQD_3@hovoldconsulting.com>
 <ae5eaef9-301f-7d3f-c973-faa22ae780ee@quicinc.com>
 <ZxkjqEmkBAsC6UkL@hovoldconsulting.com>
 <c8e7420b-a7b4-89cd-1b6e-c1f6693c062d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8e7420b-a7b4-89cd-1b6e-c1f6693c062d@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_231503_707792_521949EA 
X-CRM114-Status: GOOD (  31.65  )
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

On Fri, Oct 25, 2024 at 11:38:36AM +0530, Sibi Sankar wrote:
> 
> 
> On 10/23/24 21:56, Johan Hovold wrote:
> > On Wed, Oct 23, 2024 at 01:16:47PM +0530, Sibi Sankar wrote:
> > > On 10/10/24 20:32, Johan Hovold wrote:
> > > > On Mon, Oct 07, 2024 at 11:36:38AM +0530, Sibi Sankar wrote:
> > > > > The series addresses the kernel warnings reported by Johan at [1] and are
> > > > > are required to X1E cpufreq device tree changes [2] to land.
> > > > > 
> > > > > [1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
> > > > > [2] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/
> > > > > 
> > > > > The following warnings remain unadressed:
> > > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > > arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > > > 
> > > > Are there any plans for how to address these?
> > 
> > > Sorry missed replying to this. The error implies that duplicate
> > > opps are reported by the SCP firmware and appear once during probe.
> > 
> > I only see it at boot, but it shows up four times here with the CRD:
> 
> https://lore.kernel.org/lkml/d54f6851-d479-a136-f747-4c0180904a5e@quicinc.com/
> 
> As explained ^^, we see duplicates for max sustainable performance twice
> for each domain.

If existing products were shipped with the firmware that lists single
freq twice, please filter the frequencies like qcom-cpufreq-hw does.

> 
> > 
> > [    8.098452] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > [    8.109647] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > [    8.128970] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > [    8.142455] arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
> > 
> > > This particular error can be fixed only by a firmware update and you
> > > should be able to test it out soon on the CRD first.
> > 
> > Can you explain why this can only be fixed by a firmware update? Why
> > can't we suppress these warnings as well, like we did for the other
> > warnings related to the duplicate entries?
> > 
> > IIUC the firmware is not really broken, but rather describes a feature
> > that Linux does not (yet) support, right?
> 
> We keep saying it's a buggy firmware because the SCP firmware reports
> identical perf and power levels for the additional two opps and the
> kernel has no way of treating it otherwise and we shouldn't suppress
> them. Out of the two duplicate opps reported one is a artifact from how
> Qualcomm usually show a transition to boost frequencies. The second opp
> which you say is a feature should be treated as a boost opp i.e. one
> core can run at max at a lower power when other cores are at idle but
> we can start marking them as such once they start advertising their
> correct power requirements. So I maintain that this is the best we
> can do and need a firmware update for us to address anything more.

Will existing shipping products get these firmware updates?

-- 
With best wishes
Dmitry

