Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F6DCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GnnlHMFRbVrpcnyBkNDcSZjt6llB0RXl0xQOlvsDe5c=; b=E6pBLIpcnbPKkdUK14bDfMtKd9
	MJGIr9XUUeDqFDGFgRcwtJLk5AunHJF/8oZgAeJLmbF4s42qoLswVV21QwZl3dHHbD18b9r54KyCQ
	v03hSdRuxGEifj9kXcqe/PsmBW1mnjjZ1h/4gJvkSXp6h2oILRgI+ueG9eBaMcrP4Zh7rWT2cbwC3
	nhGaLcOPRkk9WPTVVeQC6mLNjEbYkafaPiru26Ig5zNujvsAA37+LfrC4hxdYoBJeQNxsuo0hqrW+
	Dt/K2+q/hCv/fsdaQFH7/SXo+jMqtnbjb65ey0Y3Y7NcC3SA9UweGI0dJMm9aD27ZsGod1T32vPpn
	dJOlQQvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE81j-00000001mIT-00LH;
	Wed, 29 Oct 2025 15:23:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE81g-00000001mHS-1Zaf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:23:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4298b49f103so2647171f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 08:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761751430; x=1762356230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnnlHMFRbVrpcnyBkNDcSZjt6llB0RXl0xQOlvsDe5c=;
        b=Did7JH2jKM8I2Q/woXRM1wU0fHqKYofvIFZZ4utetUvvpF8MmWcflVBT2aSS9uK7L7
         UI5NuZ3oiK84bvcAAOZOuryvDsnsEQGRsw6whfqsQ34EnxILB2FltQ7OlU7r+FNJRG4g
         lpa3tQyCPgGYIYWJujpz9osegYUrMNGvozGAOtYLaFCN8v1J6W7HfTcmbukDwX5oeALD
         OPuk9YgZeOMupsTsnUcbWt6+0y6jIXfdQfSPcXQ9MkrP8i8M9/9RVPjt6xOnN8bgscS3
         0JCs3usNaYuHJ9+682/DDw94AGwuethSJJx9Ox1MDm74bvKcC5En2pIBrBftwoMQ74+i
         4yNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761751430; x=1762356230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GnnlHMFRbVrpcnyBkNDcSZjt6llB0RXl0xQOlvsDe5c=;
        b=EAuauYgEg4tiec1MXUyvnkM+yqUcMe+uBZeuuwo92HL3lHvIcq1EkfCe3TIkfsjzlZ
         agN/kfPgDOMAEL5hxA3QqphyXTO/g5IJOVtYV89jeXMrw9JpsTiL3Ydtn5r9N3goHi/I
         LmYJkegmhDmLaL0dudcoadExGLvTHHdPwN8Ur4hYNxfgOJ4CJCcLGoSqr5yiVwm+rJOl
         V6Yhpzpf9imXQHFRkya5DDegAaDz+VidmaURcRjjD9DMiBDERDfU4ga0etrfbT83nl6H
         RZ50JRudRfpiVGCEjsnhuHI0IN1FVF7uKiDiozXRyatsWGJ+ttNqBBwiU7pFW7Lhr4Lk
         I38w==
X-Forwarded-Encrypted: i=1; AJvYcCVj1l+7KWjm83ZyeZDZuwPWOZ+kPuXPKWc3YzaGsnjLcwjjO/I+McSdnww0aWh6OAKU5obKqEY6AULmvoRWNVdx@lists.infradead.org
X-Gm-Message-State: AOJu0YzXcs8dU0i18gRXzwbTPmuH6yQrE/S+aV0s+g1qZ8febcvUD9IO
	aa+uya4dIWuBMh9reXVr6tM+VMpvuNMrLMO54rv99xpMLeczNLhb7WPuL5rfUrLkWR8=
X-Gm-Gg: ASbGncsYSxDkwEn8tjP0kJ5cw639aYjEvhB670sSksNu4UG0QUfYsxe33cnaoFY1CIa
	o22XrSroJEdvHN8Sx7I2SxxPecyEXxrVy8b9Glo1gZ2UwiWUPp75qnHqmnuzCvtB6OJNoB3zLC7
	LGtgEqitgl6i1KsqNvQMPd3aYfALVVc00oQY5PevKJbWreJ2fgA1xhMJ6uPq7XeT9wOsJv2HW7D
	tH8UarM9/z2TqPlvQTnxZrMFN13Jd9nVecWvYErLly+e+BJeoQMRc3vOnB01ycbM3UYGgfIhFU2
	vN7jK53zDrV0DGZ3JbpnPEIYun31Vy2ILqn9IwdtA60IbSqaVAkoR4gGnQSuplxq3CKph1s/udY
	2uzATsGXiZ2xH2h/1jDIemJKTv/iy7Yox1lEL2uCwbY/TmsBvwiSdxO2fnP2x2nZulqPbrWwmWJ
	RHmeH57j31J11FPtM=
X-Google-Smtp-Source: AGHT+IF3kypRXz+lbNGUUJZxGE/9fLgsZ6x2lXzXuM2CaCBPkYTwY5pskZrBjx2J28zmiWA3+gROqw==
X-Received: by 2002:a05:6000:2308:b0:426:d54d:224d with SMTP id ffacd0b85a97d-429aef8b88bmr2958293f8f.27.1761751425212;
        Wed, 29 Oct 2025 08:23:45 -0700 (PDT)
Received: from e125016.powerhub ([2a0a:ef40:e8d:4a01:29a9:3ab3:ba86:f8fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952e3201sm26823811f8f.47.2025.10.29.08.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:23:44 -0700 (PDT)
From: David Spickett <david.spickett@linaro.org>
To: broonie@kernel.org
Cc: catalin.marinas@arm.com,
	corbet@lwn.net,
	david.spickett@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	luis.machado.foss@gmail.com,
	mark.rutland@arm.com,
	oleg@redhat.com,
	shuah@kernel.org,
	thiago.bauermann@linaro.org,
	will@kernel.org,
	David Spickett <david.spickett@linaro.org>
Subject: Re: [PATCH v2 1/3] arm64/sme: Support disabling streaming mode via ptrace on SME only systems
Date: Wed, 29 Oct 2025 15:23:30 +0000
Message-Id: <20251029152330.155394-1-david.spickett@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015-arm64-sme-ptrace-sme-only-v2-1-33c7b2f27cbf@kernel.org>
References: <20251015-arm64-sme-ptrace-sme-only-v2-1-33c7b2f27cbf@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_082352_438260_3904DBB7 
X-CRM114-Status: GOOD (  11.62  )
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

I have put the LLDB changes for this into review.
We are tracking SME only support in this issue:
https://github.com/llvm/llvm-project/issues/138717

The PRs that relate to these kernel changes are
listed in this comment:
https://github.com/llvm/llvm-project/issues/138717#issuecomment-3456979166

LLDB's use case for this new ptrace feature is to restore
process state after expression evaluation takes a process
from non-streaming to streaming mode. We have a specific
code path to handle that restoration, and it was not a
problem to integrate this new ptrace feature.

I have proven with testcases that LLDB can restore
any streaming mode/ZA/streaming vector length
combination, starting from any other combination.

The LLDB changes will remain in review until if/when
these kernel changes are accepted. I expect LLDB
reviewers will be ok approving changes on the condition
that I wait for the kernel side before merging.

I expect LLDB review to take some time, likely a month,
due to the availability of reviewers at this time.

Reviewed-by: David Spickett <david.spickett@linaro.org>

