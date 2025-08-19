Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECF3CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 05:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHADKkUG74H8DgiMJwyJ3n8CdyNUxQbiZqR+ru3KJ5g=; b=P5/ygj7zTIZUzGJfc6jp+jGwo3
	JLoSHsUihmBzZmllem1+7xnKCG7Zwq9d93xFfR/9izwxVCWV6p4UTwNhJO1C5UP2JkMdxEbJ41TS/
	f5Bu13oLmFg2argg03xUEZYJ64VWKbPehdnZ4SU9fOBxygLMY8OlU8i61GCuNVzkSbReSYwVqxqxF
	D1Tr8o8jA3CRxWtLhTM4ZhO991CfdlwrPg2WEG/FX+2ZFdRrztT8BDCkTDFy6vXynO4j+6y4Xfl7K
	QYVxSsZpU1vKlvJ4LZHcogw5Tzx50JPM4VHW9WHUQRb8TqBH0GqwEvBkvxXUI3+PbGHmwt3mG68ZE
	jYwvogDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoF3U-00000009Rnl-1q21;
	Tue, 19 Aug 2025 05:38:44 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoEvs-00000009R3X-0YdY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 05:30:53 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b472fd93b4aso2970812a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 22:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755581451; x=1756186251; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NHADKkUG74H8DgiMJwyJ3n8CdyNUxQbiZqR+ru3KJ5g=;
        b=giBiGwP/Wya7V6ctJalSMq6/FSa8ojiGJAkEEp5n0m7+x0twNzfnklGd0MOOhgBJHM
         HEoEQS6dFbUSGxxdDPLmCPC2Ih0Pc58gOYzAuLuq+KRzcoUkrtVewYEEJytVT+H+YBGy
         izl2PAqWb8qKIPr4304K7Pzi4f2Ab3YVrOgvJUXC2eIhEl6SJf7W+h8b9aa4jBUlDuZY
         E8WrapO8mhWu8bgNFLY2hgI+KcrOY501/zHqsoL4+KAEaS+SmABb2ZxhZxIc4lm1lclq
         d8m9wHtw+fPCIZNd88kvSC9Fghqx+z/4eadJQcjD1FzDu0Rp5is+8pBytjhtFjw9X7hT
         NJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755581451; x=1756186251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHADKkUG74H8DgiMJwyJ3n8CdyNUxQbiZqR+ru3KJ5g=;
        b=LksJoadaSN6IHpib4sBQ1La0LFa+xauVWHxw3UIAh+yC45RfDxhNfpzye1ZRQAbF/n
         xM9AIN3FpnFz01zDzh074zD06RniWQIlKubtiv6jPy/Sxc94ikirAdwG2C7xy98H4riQ
         IeBxrflkd62YmyFC7Eq1wMjoaQe0amWNkD7ml1qaie0jy27WkwONfmcOPjYmQletC7w2
         MNNPOfR91XH9lJHOK+VwPJFa15vgj6TECCtlAf64Tn/mFPwJL0h6PRFrdL/2XyDdMVly
         T2zlPv7b40tWBfyVD9RNHvOB3+oHibQ4MKIQdvIwp5cSjThRfDr42//j2PNMigKXOaGa
         ZgsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkHR5aqUcwkJxJwYvkdsBCff5y8/7kuPQZeKLcUsumhwyXq8kTEjRpbRsBvIiZtYIySSy+UiC0wKEIWdS+74i7@lists.infradead.org
X-Gm-Message-State: AOJu0YxAR2+wK8SqMn1KKR08fpqRoPY59kQcCTTXQKFc+xJdSAlboTH2
	7slgb+IUv35oOlaFNDwLLjq2PlMmMAE5znZQPbDGFzMmMaSKMk/jXgTXKVsSJZTXtMo=
X-Gm-Gg: ASbGncsC1oXK37U/IQlI2AEBICHFUsQvX95Kqtox55J2fV6XrWIE98AXG13ng3Qj6Hj
	ZqhOeRWtezTnidzm1WHpH50pQyAJYljeFDeafL/JJMi5cAJmjLsosltuysbIKhLHJfWemMeblNJ
	L2cpYHUYwOp4xqURheEE/TcdS7YIIFYaaqspWxn6WSzMB2DdmeBWjX56vdeskP3FPi5gE7L+chy
	RDHRTCeQ4DAToQGIXAg75bTevNNCy7ClM8ZpmvCYbRic97M0o2idyO09ZQV6xvuTGrq40/o1nJ6
	MjQeyZLlf7giFJ+uGq3sbeIrFQRfxuEpsIJ4scDrvDmdX3WArRmeVYLoMO69pScKX62giPziB7m
	B7tgJvvcBnEyAyRPpu5uXQhYgjtMQ5fvNkUU=
X-Google-Smtp-Source: AGHT+IERt6oCE4RMNflHw7TCKFgdRx6IB0LQJLR9mIihyCp5VdPHl033jFifzhuL917Po4PZMKKnDg==
X-Received: by 2002:a17:903:290:b0:243:38d:b3c5 with SMTP id d9443c01a7336-245e04ca7bfmr18923145ad.47.1755581451291;
        Mon, 18 Aug 2025 22:30:51 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d50f55esm97139685ad.82.2025.08.18.22.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:30:50 -0700 (PDT)
Date: Tue, 19 Aug 2025 11:00:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3] cpufreq: scmi: Account for malformed DT in
 scmi_dev_used_by_cpus()
Message-ID: <20250819053048.t3dfmyu2xqd4ypef@vireshk-i7>
References: <20250818155048.551054-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818155048.551054-1-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_223052_182117_12523450 
X-CRM114-Status: GOOD (  13.90  )
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

On 18-08-25, 08:50, Florian Fainelli wrote:
> Broadcom STB platforms were early adopters (2017) of the SCMI framework and as
> a result, not all deployed systems have a Device Tree entry where SCMI
> protocol 0x13 (PERFORMANCE) is declared as a clock provider, nor are the
> CPU Device Tree node(s) referencing protocol 0x13 as their clock
> provider. This was clarified in commit e11c480b6df1 ("dt-bindings:
> firmware: arm,scmi: Extend bindings for protocol@13") in 2023.
> 
> For those platforms, we allow the checks done by scmi_dev_used_by_cpus()
> to continue, and in the event of not having done an early return, we key
> off the documented compatible string and give them a pass to continue to
> use scmi-cpufreq.
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied. Thanks.

-- 
viresh

