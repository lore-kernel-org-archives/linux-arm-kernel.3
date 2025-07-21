Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73236C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 08:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPXELs5NvkX+PM7JY9uaPhAOXWpOOKXEuN/iIGPovgU=; b=RYRKYDm+HYrplcz6FwvgokKMV5
	JaQ2hNOvCKqifv65tQL3E2mAnGJnxQqF5HRFsH/3sw2ciEp0m15CU0nUX1wKBXHd5uzCAfSG+nXH3
	jXur9vLL1C5r5+qLviEMzS9/B9l1y4QlhaIEsodiI2YLYpYnuHSbH6+aU3hjDLVsXsgWaJJ4ATTdF
	ftlCBiYtDuPHoa0ftzx7ZjgeH1JMjiefV6T2C6yJ4g/Dul2PuwerdRYTREMSOykKcLzKH0/j2G2Pe
	yjWnuAzqFrEqPOfodknCq0jayQx4Qmj8pm4EC+7FAst2qtYIja/TOPRJIIPSNMydW6bAILaW/MyW7
	Goyvcr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udm7N-0000000GhAJ-02ZC;
	Mon, 21 Jul 2025 08:43:29 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlip-0000000GcO7-1sfD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 08:18:08 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-607247169c0so635327a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753085886; x=1753690686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPXELs5NvkX+PM7JY9uaPhAOXWpOOKXEuN/iIGPovgU=;
        b=gc7zi/htDmVdXPq41atjnjB7m85PeuNSCTHaNGSN+wlZFPdMev2cosKTMUwCTWFd1B
         GYHdjBt27a69kXYlQBIVHKqd4nUPBc0nePyOrIhD2XZ8p0MQGqQ6h1ZL1JwanzVUDoEE
         4Zss582nZYYgU6OVm+fLXGsQF82g3oVEmaMBBqcUE/m/g8FILr+x5nQwEitLPLrHy9pu
         okMN6f39LwUp+xvgZSltaebHoPuuei1t67IXhUHW+EIxjF7eFC9al8CawJSDf66UF3hf
         EvGPbaOnetzixn93n4ajr1zBdx+mUhEYAEWK0nFnkKRdVpRgDUn0yk//LfWoZmkPAqk6
         Yt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753085886; x=1753690686;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPXELs5NvkX+PM7JY9uaPhAOXWpOOKXEuN/iIGPovgU=;
        b=CIakcLjZdCt5MJt38m1lqDi5JidVght0DrHzJHVl6VGK8uFfhj61sq7YQyh/xfI+TK
         p7IkzSL2hqb3UxKu78gDPe17OqweP6hg877tQuvdGkcuEGfoKM0Zm0tbNqeM+4JmceXN
         geycScU2WvDAvtXS0IBNSRdB6ZIacmO0VlnOPVsiycxngH05PBpKurvMVRNB9PavQL7+
         liav+eeTrp5LbdNLv/jNovYhvL2Q/bmdVg8UpwMw6FcuGqMv9vb+WWKFpBLjMLeMRbl+
         Mhws/+qie+YdPaVRct3tC+SK+C+ArYAD0K5LHgYXhEELP2P0x2gfK5yCYjPt/b63D8Ex
         VZjg==
X-Forwarded-Encrypted: i=1; AJvYcCXluVLxTdDnpR1ETa0/idGCRbh2UxG/Z74piUdYe56vahwiWi653YxHCLSpUcLrkfm2FEhWkV7gys4e51eAgSlC@lists.infradead.org
X-Gm-Message-State: AOJu0Yye+3Pv2TIdBzbVfp9w9Huf7gTbyBwVY9QtanA/guJsyw5FE0hD
	JQXVRdRTx50BCjYFR1YHhvaCyeYa2TBYlV/BImAXcsDY8z+RuE13qOKQySi3J0Cs7UI=
X-Gm-Gg: ASbGncuUjgCGMFxwQBePt5+mTDKZyPvMZYd9Y3Lu2BLIBu+AcC2ndjy8ySAPjAybtvL
	AnLDu8CGvcfUw4LoH8ng5fHVqXV9nqIM2LWa8NT0hhQeNaXayMsZtsopJILBfjlkh9q36nN3uB6
	qxToQHsRfHYFpGxjC/2OKvJbiofb7D3VznOBFMxf1iGNbIsZAlw4Va3UqQ2QxcnCAn4u7Cym8hi
	iLXZiEbrZLHW7yBCClOYT1nGF3zgVO1/DN1UrwDFxUW22QcyiS3unShIRKs5nyyeX/Zok5DojGd
	UihKZu6ArFR5WMz59QzpJ0Rm8JJAX5zt/fKaOqpsSikncnr/F8v/ws0EEfHqXWRtA6CMoLnHKkH
	fn4GiXRnl52yNcv67PzR/vyM8ldj9LQg3T9M88WIMUd95FJlx
X-Google-Smtp-Source: AGHT+IEwTbfpXXMQ3S49s4PgHyCV/u6H0Q8oR8adAG+0t/NE/c8sQ0/0zI+RNG/o7SXdvdd/cnUXsg==
X-Received: by 2002:a17:907:7f20:b0:ad8:a282:1c2f with SMTP id a640c23a62f3a-ae9c9b2153cmr688926866b.12.1753085885643;
        Mon, 21 Jul 2025 01:18:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d524asm633642366b.45.2025.07.21.01.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 01:18:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, sudeep.holla@arm.com
In-Reply-To: <20250717-gs101-cpuidle-v7-1-33d51770114b@linaro.org>
References: <20250717-gs101-cpuidle-v7-1-33d51770114b@linaro.org>
Subject: Re: [PATCH v7] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
Message-Id: <175308588382.28993.16370211179082448125.b4-ty@linaro.org>
Date: Mon, 21 Jul 2025 10:18:03 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_011807_520288_586DFB19 
X-CRM114-Status: GOOD (  12.26  )
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


On Thu, 17 Jul 2025 17:22:36 +0100, Peter Griffin wrote:
> Register cpu pm notifiers for gs101 which call the
> gs101_cpu_pmu_online/offline callbacks which in turn program the ACPM
> C2 hint. This hint is required to actually enter the C2 idle state in
> addition to the PSCI calls due to limitations in the el3mon/ACPM firmware.
> 
> A couple of corner cases are handled, namely when the system is rebooting
> or suspending we ignore the request. Additionally the request is ignored if
> the CPU is in CPU hot plug. Some common code is refactored so that it can
> be called from both the CPU hot plug callbacks and CPU PM notifier taking
> into account that CPU PM notifiers are called with IRQs disabled whereas
> CPU hotplug callbacks are not.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: exynos-pmu: Enable CPU Idle for gs101
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


