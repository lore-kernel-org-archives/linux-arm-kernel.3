Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0330ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+xGmBxaIsrwhsJmTSFTSbNR3poI1XoEoSNvgqP8h3X4=; b=FysDfpQeY/TWRStdmBj2mm6AO6
	7+ZM/eShmAyIkqhpCIs0HLw5oe4d9k/y/g/nnTvSjSkxN4QeKntVMJ205pm5RIW03uNZYYigOgMDc
	h2Tmu7zJPFBSEC4A92HIIcAGLjvQV5tFlYz47FjEkHznZ7xLDkJ7amdaZ0oV2rLm9IBfMuGAVDkzS
	BuMG3wKrej8cknaCSyiV+bCijmNs+5b8ByuwQ7xwDwtb1vWQcX3xLMa6rSXMFqQSVaskTTVj/k57E
	ITEIlqpO2O9aLKAJYsQxKHDhW+iWYvZ8Xt7QfgutSA++nOSZedTY7lhZLd+KTvKL0smbBnSRiu7lK
	CMOVWU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wt-0000000C0od-4BS4;
	Mon, 13 Oct 2025 01:02:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86ws-0000000C0nL-3Hwp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 01:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+xGmBxaIsrwhsJmTSFTSbNR3poI1XoEoSNvgqP8h3X4=; b=DJdDKdcNBM8TCRhq4MDHBMpdo+
	ceAQlLVX89hWqDn78CiZLL1GeiCCafCUfINphnJXqDziYQmefm6dQiylzsgU+5atqyEPdT/1QlEWQ
	GV+VdfkXsmC1kq1SGXJn8BPlRFI+n61kbZETSwMadPPjMNi9i/bx0mHiXr9ElbchfibAFl2eona9h
	BXdMJiFpPwKViFMPcZMqoWaWsjOEUizvdHXt/kBsSk7PVRHSDCWY4ykGmlGPdTWoxuOF07n/d/JgV
	gepFXq9CZukHgDsWbQRewIIK+dLveLyPkki5UpoFX+iPdTzmbbABtJd+/cksnDINftHw4VPqhulSm
	Io5jg1Uw==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wi-00000003yDy-1uBb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:01:57 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-339a7744495so396423a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317310; x=1760922110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xGmBxaIsrwhsJmTSFTSbNR3poI1XoEoSNvgqP8h3X4=;
        b=tukAza/7LD9psz7hol07gNNA4eH8MaO90KdvtRYhZw/+0yHNkdbbcJo9IhhF/Fs0YP
         Xqz6eUouBhjt33Ncaqk7gc50CKAUbtGBr9teU5/cL8tq1BRjcWQYszdiSOF9gkLzqshq
         99LBGm0nYvrL+vGNv4/qbvi93XSzOBIfbLfsAeFyP6tR7Ri55yh7UH2IO/egtOUWze8T
         tUlfSU2aw0A7OKxcD6QUZ4bUb+4SGwouSMv2VWq6P3Z7eXCyfdnvhVk0Wt0yFiCVpmYE
         NGQjWXXgC8f+GcSbThs8DSgo9noWCi0m6fdDZvzfJK4WTXZI/cS2IpDSuDcyVw+9DenE
         LshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317310; x=1760922110;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xGmBxaIsrwhsJmTSFTSbNR3poI1XoEoSNvgqP8h3X4=;
        b=qEFfBeamsn7xbGXmfFsWTvIl73p4C4Mw/T5hPttKWC18SXtXKvZruVJEITSxwZEuVn
         4jdJhGea4zzX+Jcvf8ABGyIQgog8Ksznkus7AvWll8W3zzKohYLSe5grnPpKIQilj/sr
         CjzUuTkrcnrJBq0yn5whSaF2QoJeXb504PLbQAwI74DHWTSE8hb103e7MJhPHft2zQMF
         Zwt2On8k2i1ssX2M5fCz+GeEzGn/stPz30RHfkRBNL2VaYf6311znoUC3Xqqy1z0nHig
         L2JQ1lioF3gMApuPn/N1a/Q28NawctlNvz+S4LnqS0HtyFiGkWhtdFz18nTc/jtEKgpG
         lDcA==
X-Forwarded-Encrypted: i=1; AJvYcCV6c/7/fyKw6qyf2zIu+weUNG6kEWpW4PyKy1nXD93mJTKDaYT+Q/vHVVNe3+IGZ5zE46lqS6/6ULYf0VnY/SV6@lists.infradead.org
X-Gm-Message-State: AOJu0YywGQ3Jc6AsTz3D19NLM20+cCVV91VCUoIJUGHNdEo2Uiko9XD3
	RPdgwOaGcKocDxBVqQ0xgCA+J3hjsrTr/kZkm7WOwV5tWrEnLSTy5kC9RA7RLWIlotY=
X-Gm-Gg: ASbGncslsKV7kVkRHC5v9F5ZaqEB1wu3rl/GH3sw/QNWQfZVaSg2l0mHFi5tRtG6Zt8
	Fjb1hk8pdme8u89i4r2K558Xb8g091bvjUH6uybLTuAaMVLgXHTNS+G4+PWJT7I8ETvmnaOoW8X
	GQBUBRGLqbdGdTs8UYwXeuIvo0yKL4GSZ0FEI9uHrDr8J73r+++4K8ynQmENfnSipBQHFZ9RC0B
	IJwJULI0zNUkt84iH6XP8IH0esK9SGRnhkiSF55DOxabvL2/mV00+qIBq03V3uzkSmEB1doOlXv
	pdVMpSbGgAEKPQneYb+n6bjejorM2HbF5pqWvEBLHJlNqkS3nlLxe/1tBYQIRjUrXc//7+ep/yK
	V1fk1MCXP4jmP/FFQBIQuJJ+rh8O11jSiCbE+gV+rinAuyr9bSURk7MkHng7ORv7hSQA4mY5CHY
	9KGLFrRA==
X-Google-Smtp-Source: AGHT+IEdNeiQ4wkmg3jWNQmCnD1QT61xdTtWd43pEBCPOTtLFYBI/MtFdeLT6J/Z75wGvx4fFSNIgw==
X-Received: by 2002:a17:90b:33d1:b0:330:6ce2:18d5 with SMTP id 98e67ed59e1d1-33b51395750mr14768734a91.6.1760317310483;
        Sun, 12 Oct 2025 18:01:50 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250925130457.3476803-3-raghav.s@samsung.com>
References: <20250925130457.3476803-1-raghav.s@samsung.com>
 <CGME20250925125620epcas5p359a6c18a13f2a2f895433e4dd241020e@epcas5p3.samsung.com>
 <20250925130457.3476803-3-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 2/3] clk: samsung: exynosautov920: add block
 mfc clock support
Message-Id: <176031730436.32330.1825346216693912031.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_020155_625289_1F121688 
X-CRM114-Status: UNSURE (   6.89  )
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


On Thu, 25 Sep 2025 18:34:56 +0530, Raghav Sharma wrote:
> Add support for CMU_MFC which provides clocks to MFC block, and
> register the required compatible and cmu_info for the same.
> 
> 

Applied, thanks!

[2/3] clk: samsung: exynosautov920: add block mfc clock support
      https://git.kernel.org/krzk/linux/c/25e476632cf7135aba11b27e3807a2692a3e5e13

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


