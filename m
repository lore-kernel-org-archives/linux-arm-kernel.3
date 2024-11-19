Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466F2D591D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 07:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBeJh21HJZOCDVfM7Nr1yowrhAnMZKyjCkeStKypIic=; b=dN//pl3UVP4Hl6S6KrHQ87cyHs
	/+LmwEJaxFkO4m9jx6roa+yE+Aw6RaLjD3lDtL01Wcde65rEWUAjKG6XyzXQBmh0JELBuJ7srTAoW
	lQ2RvKAw9NhSXTvt+SI2EiCeTOOWFgNAqVsNd7cdcX1I5rNDMxK1uVRQC0eP7DqUaaqp9rVld5Rhd
	bMuCBfOlHRthPPTOiHY8JeTBORcyeMQ5/di8UGjE+foyIRhUb7BlSu97aDDm31NDs8n6HV7SglBRR
	BwaoqOICZ2B/d2XHGJ6Rq8lIg2fuirPv1f21IQMKS3JR1CeXVB4Jj29tFzgh2BouO0O9UMSe/9hF0
	rXPDWEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDIfV-0000000Bdpg-43jw;
	Tue, 19 Nov 2024 07:29:01 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDIea-0000000BdgR-04l9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 07:28:05 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7ea8de14848so2242388a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 23:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732001282; x=1732606082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NBeJh21HJZOCDVfM7Nr1yowrhAnMZKyjCkeStKypIic=;
        b=Wjcgc6uqhzu1kZGKEkWbb4AnNTDyCOKw8ZSc0EAsFdKrQcMOQAtjSpCGZ13qOSqTfA
         kyG+WH8YAn377sQ/sqX4sOSVBGkR3JBPeyZOwRrc724Vne4WWuYYDaJR5KxIpC2l5hyB
         00cADApEvC/EQw/rNVPg6Pra7qFSKsiMQIR7pJyUdGjUhvFg0mIdIvG9MuO2k9/wgrLP
         rMzYGs0XXjwxCJ1MVM6bRDlSpAVxx0GY6nDdi0QoZJC4Ot28S4kGhQXck0tYR3U4lPkB
         Eh6hbR2MPQAgS7VOJPU0uKSePzDrTUhgegryfaErwskwO6T4XEylWuIPcEd3DPf8yf9t
         PC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732001282; x=1732606082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBeJh21HJZOCDVfM7Nr1yowrhAnMZKyjCkeStKypIic=;
        b=Q2K9eyPdlHXBzvxNnCdgBlhmsm+tUmzRpoj/PfF7ZNVOYjbbGcdNzV5y1M4nrISXIl
         6xCFyy1uzMy5POQSXaujMj97VUxAZ9AyygsydNTaZOjJqC1/cJcK2QzquaRqMNJViXoo
         1X3aL2/BzzgVZpddF0AxVVg825mui+V0TV1Jf+5hwnjQ0LVSqRm3AvRGGMasVfgi6bTW
         7NP/UUj0Wbf+W77nj+h7oj6IRIM3dWyuBmeFwz3rkiDlL9hr2xwCLn/Xy1HFKqpCDoko
         YyhRpdtnMqhUlamP+JgXqbMidIkNae5/CxZWHicH9SfjuICNBExf76+yZq6vJSMZB7Kx
         KpBw==
X-Forwarded-Encrypted: i=1; AJvYcCWtr+/zsXrK6f057OHOPtninQgte1odeZYny9X3BHU2y5gBomJBI3s3mZ6//sptgjGWeeHCSnCUIRzjgj3lQ/IR@lists.infradead.org
X-Gm-Message-State: AOJu0YxllqysoH+SdJWTH2tZFRRwEl1RMRNsYqNxviClGMhRHpgBV2Bc
	JYklN2HtMUGdPrfxMSMxszb8P7lBbPSMtVgB+iHNfLlsLn6eXjHcHK5iM2LDhLE=
X-Google-Smtp-Source: AGHT+IHJLqekCPLYaEe2knpfsDc5XMeTEXIH1fs/KtZQN/FHVFGvisg2UrHDymaT4m7kHPqSN5aAOA==
X-Received: by 2002:a05:6a20:9150:b0:1db:d8a5:7c82 with SMTP id adf61e73a8af0-1dc90b09f48mr21189048637.5.1732001282254;
        Mon, 18 Nov 2024 23:28:02 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1dc7a3esm7125129a12.76.2024.11.18.23.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 23:28:01 -0800 (PST)
Date: Tue, 19 Nov 2024 12:57:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	morten.rasmussen@arm.com, dietmar.eggemann@arm.com,
	lukasz.luba@arm.com, pierre.gondois@arm.com,
	vincent.guittot@linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_mdtipton@quicinc.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V8 1/1] cpufreq: scmi: Register for limit change
 notifications
Message-ID: <20241119072759.oi75cdqrw4vl4fsc@vireshk-i7>
References: <20241114022916.644899-1-quic_sibis@quicinc.com>
 <20241114022916.644899-2-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114022916.644899-2-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_232804_074725_D47664C3 
X-CRM114-Status: GOOD (  12.71  )
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

On 14-11-24, 07:59, Sibi Sankar wrote:
> Register for limit change notifications if supported and use the throttled
> frequency from the notification to apply HW pressure.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Tested-by: Mike Tipton <quic_mdtipton@quicinc.com>
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
> 
> v8:
> * Drop patch 1 since it was picked up by Viresh
> * Leave policy->max update to the cpufreq_qos notifier [Vincent]
> * We sanitized the range_max from V3 since we dealt with
>   policy->max, now we can drop the check and policy member
>   from scmi_data.
> 
>  drivers/cpufreq/scmi-cpufreq.c | 45 ++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)

Applied. Thanks.

-- 
viresh

