Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CA9C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1sBKmOIevGi+6n8iHRw7aDQ4iSU3hQcgvE0ZLGu7yXg=; b=4QnruyC1HHQiVTy4iri0CWycVF
	mZus1Rwmrsoo/6T6KqklTuTEgdrOkDAiMqqI+mw+7pRMUzdFZaHHkwZH/qhFOxwK384OLfJkUPsEw
	EC36JBXGUNvpvSdXmXouq1gsceEnFFp9Kvfd8NNZRidvLVpGlLTQkSl7Qo3+SH7V26fEYfBNQaQxl
	MTx/P+1YnpglkdyY7eTxFzgr/nP360mvxTy3Aren6NepN9YjT8iWHCU3xjPNIYhG4pKWB336fisK7
	B9p6K8ienNEq/28naqnN9uIpHsYccRIhUM/p9SxLuE6DgfU4F0Oxj2GvyGlzoQCKRAsGSLYwQPXHn
	x8BG9Tkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnqv-0000000EJZg-2pMW;
	Thu, 12 Jun 2025 19:44:45 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjoi-0000000DmaL-1sRf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:26:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4531898b208so1097375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 08:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749741971; x=1750346771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sBKmOIevGi+6n8iHRw7aDQ4iSU3hQcgvE0ZLGu7yXg=;
        b=mq64XGAYHBRuVYg4OyXeLYhJzY/6uOYcwutnywtGqY1Fs0Qt+w3yh1D/Vpl/o1mFfQ
         SMFiAAYvCyld56p4uiUIGA6hP69wrrM4mSNZqPaITW7pACSOpCHvHRjATvGZMGLhIaQS
         LcDGwcm7/Iv7UjmJMNE1LgBMaehxpFGflgFL6X23hNRFRNVJjBVVsrsWXLsfPVBizWCc
         uWY5p4TpzHS5f9yFjhM2joksvfzJEFWbq3aXqiPOQa9QhLCeGpzu8KtItv5/R/zrKn44
         +5lGbG/C/Z0HBpUUdJGvhVW874/kfRMxd7HP/a8j/w951OG3dYPYx+gchVoKCHfMpz83
         4Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749741971; x=1750346771;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sBKmOIevGi+6n8iHRw7aDQ4iSU3hQcgvE0ZLGu7yXg=;
        b=PMlg4UFsTEPZJawUcgas5GVZuR5A4OsiWj59KW247W/wCKF61n/8KI5t9FPHWhPiPg
         JPWgXNPzNebT9YyMQiDl3qVEBFPJGK0MQfjiuST5wxUprh9Hsz/t8yLktVbs05QDW8TR
         iaVzIP8zj+769qYrKeuWemKJ0YPsn8xsrZdgYMIquPGjSz5rc+WhZ6+cFEMQv2L2Sr3i
         52sUSgoVwDOlpZwJ4U8Il1fVfmONXDHMJn/PVFBTniqBtW3OS1/mZzlikmjOqx8V6OHa
         7ogmf2yGDBIjWXUgG9xntdcsVY0bosgSnre8ZSfuTLx+GbUCDoCt+M2EbRSvHRJSJbsI
         l73Q==
X-Gm-Message-State: AOJu0YzLKC74hMxCH7jfOPQdrvdjsUFYdsCOs/Q/7F6PzgxXQROSTocH
	w1Nd6UgTh5v413GYjlzmYA3Hp1CiULz/tQUBqDq/O21drCJDeFzyIpPnVp7yoJlzkRaMrDrutHK
	sTMUg
X-Gm-Gg: ASbGncszFMnh98D9Q9/gXj9de2KUgrpHGewCuuQNFx54OApAPHH++kS7Okv1k1Ud5G4
	qye2h6uWgYNB/wv823SXsBJInMrinPwSz2Lk3KnE7T/ZcAFBqyRAgLlM4GG2329hMXQ3wjCgE9r
	af77yO9HxBKDTgJEdhuBUqZYs5VIG0wXggCCDDv7oqzAKW+dI9rtAqk08yiwSMnBpVsd/rVIvdl
	2My6AQIbPqhyEYko2S5cefIIpyhtxPCeWASnGCNFO+YosXgkqcxUbWCVJ0ph3ZzrFpCPeUXtrlb
	CptTLRg/Fuhls0RCU0sY2uGxkLnBqeQ8PEf8HGk/4/NxE3ecvGDU7AUjErhI+IUlGtQ7U/6uoTh
	W3Ekyrf0=
X-Google-Smtp-Source: AGHT+IFwsXsRYXgrfKWCfKNi+TTveszbMKXHntYaq5wTQetC41r6t1yJqHS2kPZNjw4WdDHEMJSJmg==
X-Received: by 2002:a05:600c:3f86:b0:441:d244:1463 with SMTP id 5b1f17b1804b1-453247e681bmr29156945e9.0.1749741970845;
        Thu, 12 Jun 2025 08:26:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a56198cc12sm2244629f8f.25.2025.06.12.08.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:26:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexey Charkov <alchark@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: dts: vt8500: Minor fixups and L2 cache on
 WM8850
Message-Id: <174974196751.110269.9543855041154753417.b4-ty@linaro.org>
Date: Thu, 12 Jun 2025 17:26:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082612_493517_B26D1C2C 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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


On Thu, 15 May 2025 22:38:39 +0300, Alexey Charkov wrote:
> Small fixups for VT8500 related device trees to improve correctness in
> light of current guidelines.
> 
> While at that, also include a DT node for the PL310 cache controller
> present in WM8850/WM8950.
> 
> 
> [...]

Applied, thanks!

[1/5] ARM: dts: vt8500: Add node address and reg in CPU nodes
      https://git.kernel.org/krzk/linux-dt/c/4ce310e733d8e520e52772099ebeb980fd491cec
[2/5] ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
      https://git.kernel.org/krzk/linux-dt/c/ab46710603aba03ec6881152219ee7de27d20eff
[3/5] ARM: dts: vt8500: Use generic node name for the SD/MMC controller
      https://git.kernel.org/krzk/linux-dt/c/8b37e3c425c3fa8439ec2e100521cb1e9651741e
[4/5] ARM: dts: vt8500: Fix the unit address of the VT8500 LCD controller
      https://git.kernel.org/krzk/linux-dt/c/1918e51321c0c34341397644512568ac3451e416
[5/5] ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950
      https://git.kernel.org/krzk/linux-dt/c/6cd594ed969d5cfc7f97029f8ca0d240637ebb8d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


