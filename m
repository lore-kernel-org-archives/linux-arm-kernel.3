Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CEA2C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 06:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5u5FktG9IlugroLpcsECtmu752LY+bRbkT7BdZa6KAc=; b=JIrM++jpal+Yquhs0y/27Y6RiO
	TyxwgHIJB781IxmBoSoqEhkGrmlo7Bi4BN3wpziowRs/pY7a5v6V4/aeXdz2frD1NpyOwn3T/FnBj
	krdbl0Ehb9B8F0TFAN1D9NrZ1VFs4ytVdkVsyUf4jUY6V8QCllI1LMxEFdk+cRGTkLeE01O7CTauD
	OYayd6p/+joWkL1qEjOjSOyyX8DFT0NcWAz+j4eL0K4pjrH7CJ/bxyo1jkrnUQCFA8la5J07RQ4DY
	6+STPKhnKl7s19neSVfy/QPSUk+HKIV39p7l/Qfa9u6iSmyfn1NM3+GLImnl+uYoddn4Uf2zyrJ5h
	h3f2f+Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gHY-0000000Gckb-0MEg;
	Mon, 07 Apr 2025 06:48:32 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gFm-0000000GcBC-45FG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 06:46:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3912622c9c0so438882f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 23:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744008401; x=1744613201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5u5FktG9IlugroLpcsECtmu752LY+bRbkT7BdZa6KAc=;
        b=PH/qJ29l3/yzH/bGbCp0bqG72fHZYqwNywe47Z2vAuZihi2kUVj4TAkFTAjVbow+ok
         ij6e1iEakVWZYQMIRoz0nauDR4WeJ3GquuV+FF2Cgzt66bHfISWqpffd8zB0WII5DTJf
         YcTrFL7HKSIoJLaxyn7m5yxBWEEvtYh9PUouVIqqiwgmRrAxvhyeR3F5n+2qxlRvJMMh
         +eiAOWB0vZVjqCEX5KRgi0y+9s6LfaAX0exk556ZwZ5atfK9RrzttgN11dn1ZpRptlY5
         TWVqGC4wTEyiLr/QO18i7snF8wwl4gYaKJ2Zl64t+iNhwCdE1zFfLajWdESLei71lc0t
         5ACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744008401; x=1744613201;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5u5FktG9IlugroLpcsECtmu752LY+bRbkT7BdZa6KAc=;
        b=RDrUXjxp/tWsj7hzMUsc7PlOuSyWdsGqoR/yiNern8HD5wPB0f3ZAGEriTncPG7kpt
         fq3tbca2DyZvogfGMQ6B1oIiiVzjXPrnsbslP6YJpt2eeayTI4oOz1RvgSwH7x4Z89Gq
         Fwr/u36YJA346z0U0a/BASArTEUrXQry2b2yT2c3gZJSwIB3M0eCeHDnkNNfxqMlpC79
         3208zkBA09CVU+wzT8qSdtVkRasAJMwkaU7e8gsZuwtJ9Zq6UqesXer2MLjsU/kQkACs
         Flx/Kispa7spjEFSXJ0Z0XtCJBkvNeCaQueJoQ/doMBHB0JQaWkz0254N9SeOtsrH3qj
         ZXIA==
X-Forwarded-Encrypted: i=1; AJvYcCWI2ESxd9I4DbvscXPvE8+jfHAICXjt3VAPtMYrsuvc/suwxZx9jr93nNiOHrSB2CZx60dMB+BOy3nhmLNwWFXM@lists.infradead.org
X-Gm-Message-State: AOJu0YxzTH4Z1Nw2JAtd5DJ0QN3gtbqx9jJbXqBxZnqTDJdYtSSTpans
	cZi7JYLD41OiuMlvX+BiMqz1Pg82GVuWxWkojNAubW62TdlKcKo/smAALAr+sr0=
X-Gm-Gg: ASbGncvKBtOxcq0tp2olsIl6WbS4uXJX0cSAS08GR2r2fLtf9KXdVx5Pj9ygspiF9Z+
	KFZka+0DcYKQ9/pTSRs7atmoTbwYGrzR2UkxjamaPbseZGf+uXOGcyqS3ACJRD73oU0zyQpu6N1
	zRY0dhDQc3DGexb6hqbp5C+BnfSi30e2siH7ANhGiMLQTMocqHHj3G+d4/OijDZMmXVRtZJDRTN
	wucfRdyjwTOhk5SGcdGRwj40POoRQT8drdp4mXal246mReQp/aBF/Yzb6EtyqC+rmRTPuc2sEfi
	yGi8yIwAr3omPNnE0C9N7Fq4FO0ST7PvZY0aL78c3rQj+gM6J1diSvIgFg3ksew=
X-Google-Smtp-Source: AGHT+IGqmlxqnNGM23w6BRI1UAXmI3OhloB05XrhhY8e+PLrXg++1wpTvBi0oPkEaf9kaYA6FPVh9Q==
X-Received: by 2002:a05:6000:1445:b0:39c:cc7:3d3b with SMTP id ffacd0b85a97d-39cb35aca60mr3056611f8f.8.1744008401279;
        Sun, 06 Apr 2025 23:46:41 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226a12sm11031276f8f.83.2025.04.06.23.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:46:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20250324-acpm-drained-rx-queue-v1-1-577774335151@linaro.org>
References: <20250324-acpm-drained-rx-queue-v1-1-577774335151@linaro.org>
Subject: Re: [PATCH] firmware: exynos-acpm: check saved RX before bailing
 out on empty RX queue
Message-Id: <174400839995.38188.1104536537739192922.b4-ty@linaro.org>
Date: Mon, 07 Apr 2025 08:46:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_234643_028865_4588B5F9 
X-CRM114-Status: GOOD (  10.51  )
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


On Mon, 24 Mar 2025 12:35:41 +0000, Tudor Ambarus wrote:
> When we're polling for responses and get a response that corresponds to
> another request, we save the RX data in order to drain the RX queue.
> 
> If the response for the current request is not found in the request's
> iteration of the queue, or if the queue is empty, we must check whether
> the RX data was saved by a previous request when it drained the RX queue.
> 
> [...]

Applied, thanks!

[1/1] firmware: exynos-acpm: check saved RX before bailing out on empty RX queue
      https://git.kernel.org/krzk/linux/c/2908ffa53f8ed487ab4285635c79d4911cced93c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


