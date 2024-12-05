Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521E8E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KIDC3qcWfMKcz6d3c6ytjMEzqjSJwAXK2JJVWX96Zw=; b=GaMwul//IG8V+4xkmiDSoA4mPY
	V93HzDtiDPcQfvIpP07JSfzy6V3VhPgshdYffr4b2Nb5aqRk81iejUEZF2rvGsrwOE0FNd1jPXoeT
	6/IUM2kVSjuvIxFBe3+cw1fosf4I5wQ7Ut7Bo2yA6bQUkZs2FGM6vDgafDqWOQDr6NCx4exyBHbYT
	dcajoOQbZtrV4rRtAhea/Nvk7h22DAJBnMlrcojjBWhTsq+S3gGxukE+15nn6WyvuqjOTSRrTrLzQ
	sjOi+6TznKGMEqxXtmI8YOlHK7AFwwnIWImrPMTwWhhzcV2GSUsanOZeT4V+YMHLH3YXZCZr/V12P
	YtPN5mwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVj-0000000FpfI-0qX3;
	Thu, 05 Dec 2024 11:59:11 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9JB-0000000FZRT-1Fgr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:42:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385efcbb523so19557f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 02:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733395327; x=1734000127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KIDC3qcWfMKcz6d3c6ytjMEzqjSJwAXK2JJVWX96Zw=;
        b=id43P/DIZKJ074fYARRCNwyyrzW/PVDOck/nz/Kne0aD0M2isq41VuNCM5tVZjPAUH
         kKAiY8t6yPgg3dfJ+2q8wUyunuvMQcacrsAUE+Mj4H/+/1rpPyHwv47o5e4QgVkWsosC
         UNYAsB0Q1Yz2ATp+5JrzQ3pzYNFfd6SrgYbKLFWZleXXbsOijDEmpD3boIXvHF4vo66J
         d9hv9aoT5bvyrU0cI5hECbPehPLKPcgEEoG0mM99UQuB9BJCE2Q8iuL47didpbVKorli
         HpAZ0C3hU+Na6mJhxtTCcwdRAM6qhGmip48HAG1jS4Ymbo1Xtqk9slxEEo0FC2jVvzSX
         s+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395327; x=1734000127;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KIDC3qcWfMKcz6d3c6ytjMEzqjSJwAXK2JJVWX96Zw=;
        b=d+AEveo4u1gUYmaTVj85B53GH/RUr0UvGkmZyHBI74JqVkpoo6LPxZYFKOmrbzP9yq
         wQ8UDjv0+1VlBre+AfLFb9EZFZRGigKPAw7ooL4wUC2ZS3Az7qPyGymR8VOUQ14kXRLa
         oPicHX0fBppE/MAdiikB9bQ1HA3N52XxGjkqoaLOmkxeEbmmEvJ4RaxvmQO5PcJPrvWn
         jmp9PWjoG816x9noJbdWfVq4z/ls1sK/C+axCvTRcyiqeFhzP42o+xHmA919Pk49uHUX
         KFLrRnysSzUcFjSJEV8CN4E/FC5LnqB86jaCFlZlZHoDaEBv79dI8dsZwoJsyhRgrJB6
         uGKw==
X-Forwarded-Encrypted: i=1; AJvYcCVfYBC0MWxZQKA0JxExdx0s/K+fqQ/UvuZ22DdFcdYH2OG4Ag08zietWRmWjewGRbY0f2Rm3KG//sk977HHof+S@lists.infradead.org
X-Gm-Message-State: AOJu0YziaI0cJ6AaiBJ1hDCETFIyvC7dHPUv/fMM+tSWn+CnTXISWE7o
	zFfJ+4+QuNBXScR6lNN1ertwHmuQAm0hdKbjiFYGod5HxD3mJ/4vt7GcRXPGwcg=
X-Gm-Gg: ASbGnctPQRRBGSXyjo2DhI3JrqpNtk9O8VgWzFmvbm1HtfjcP9jNjvquD8rlZK+iOWk
	PUaFRW1HeytJMqrHDLU0CdoG5K1KULgoL3OVEFNl9l5TjVEfl3bQD98CqUlIWNrovOSmHx1gGVJ
	vf4+W/AkEVW2QSAvA8DnwWUejMjAcVCfIV203tSktTAS4k4hDkHZEmiWqx3/qbVa8//H95cb/QW
	BG12+VFVKj87A6Zy9PtQPnhO1FR04dj60IoOX4IC6eCdTFKpQg0S6aQkd50/PrlhQ==
X-Google-Smtp-Source: AGHT+IEIGJejMyX78O7Y5nPwUxTR92b8MmG1gEAzs8vepMTJTKVucanlx+rtoPz82m9AIVr178e/lg==
X-Received: by 2002:a5d:6d02:0:b0:382:41ad:d8e1 with SMTP id ffacd0b85a97d-385fd42b9ddmr3240841f8f.14.1733395327461;
        Thu, 05 Dec 2024 02:42:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf406csm1662701f8f.3.2024.12.05.02.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 02:42:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1730918663.git.stano.jakubek@gmail.com>
References: <cover.1730918663.git.stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 0/5] Cleanup Spreadtrum/Unisoc ARM64 DT (part 2)
Message-Id: <173339532634.70936.15343238064427564768.b4-ty@linaro.org>
Date: Thu, 05 Dec 2024 11:42:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_024209_343333_84CACDF2 
X-CRM114-Status: UNSURE (   9.14  )
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


On Wed, 06 Nov 2024 20:05:19 +0100, Stanislav Jakubek wrote:
> This series continues cleaning up various issues with the Spreadtrum/Unisoc
> ARM64 DeviceTrees.
> 
> Changes in V2:
> - dropped original patch 2, as it was split off into its own series [1]
> - new patches 2, 4 and 5 which fix some issues found by Rob's bot
>   and/or CHECK_DTBS=y
> - rebase on next-20241106
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: sprd: sp9860g-1h10: fix constant-charge-voltage-max-microvolt property
      https://git.kernel.org/krzk/linux-dt/c/367d31471c3272b87a7e842355b2aa4bc688add8
[2/5] arm64: dts: sprd: sp9860g-1h10: fix factory-internal-resistance-micro-ohms property
      https://git.kernel.org/krzk/linux-dt/c/e864e215ce2197cd5d5c0e9229b4bb83379a5186
[3/5] arm64: dts: sprd: sc2731: move fuel-gauge monitored-battery to device DTS
      https://git.kernel.org/krzk/linux-dt/c/ec87fd9f66bb8196ce4c80b6f9a02a8fdb452821
[4/5] arm64: dts: sprd: sc9863a: fix in-ports property
      https://git.kernel.org/krzk/linux-dt/c/a34907f484949e3a550a54a19d71e8616d812d7e
[5/5] arm64: dts: sprd: sc9863a: reorder clocks, clock-names per bindings
      https://git.kernel.org/krzk/linux-dt/c/49f4ad82f031ac390ea4571a5bf7d58ee27ce4f2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


