Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274E3D41C04
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KImKDqWq4s21FhX0T9TYJY9R8T8zry6WhOX4TLZUuNk=; b=18dIPIDzhyefw+ZBfllXs+cA0H
	VXhuGYZqY8shj7/DZntY4EoLvGCJNSPF4ig3lCyI2prYQgMGmRPUK+GrFUeqm5GQrQ2airJp4URbb
	nr6xsDvfGXpQx5UiDWVFM/g1tkhcCX+7q06Okq41pKLUV5+87FMfACMAhOrdYSF6iLmxnNhn9Mz7G
	qQvS9XN48nsVkbnPcSzDfl9Ei8TIGS44qXCo2FGygkv0cZb46v8ASRMGZCKP1i9hCwRDzi0upfSd1
	qWTJCrYvNFaKhT7jpc467g00gOBuzjgzA7C9400VFwln28DABg1OIIMKbKKPRX6YWDxiENo+xnInJ
	3Uk7iybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCXR-00000006m6p-18Hs;
	Wed, 13 Nov 2024 12:32:01 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBCTW-00000006lVj-1TI8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 12:27:59 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6eca7391be2so21151277b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 04:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731500877; x=1732105677; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KImKDqWq4s21FhX0T9TYJY9R8T8zry6WhOX4TLZUuNk=;
        b=Vm9f/IncL/hniiW6e6XUSCRakvV9vIrnQi7rVHI9XP/rg3/MtkYrJnq4etTdg96MC/
         TqmNJfCj4Uc9iO+MPBwe+YCOhGxgNAjpg4J5EFjTrqaD5XhkZSodg2e7vYKsrXiP8rjd
         2nqAYoqk2mh6Jkb66nmlASR+ait6MdR0by3/1p97kddZpw2M0HOyyowG2jjChaV0mwHH
         C45pWsPLVCLUwB+EcE3oy3jAN4mG81qkYUWJpWGlZZe6vGk9zOq/oUJ9nKMIh7JxYpLW
         Wh+PNovnlXK+PB5KDcAz30fMyRLrXpUOhSX5ounekjVVfAJM/ulTljqo8PXSNrKYCGCw
         2nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731500877; x=1732105677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KImKDqWq4s21FhX0T9TYJY9R8T8zry6WhOX4TLZUuNk=;
        b=X2VACujKTKDqUHdKXh8SdJtR9p3bDeJL8P8E1Lmo3vDC0oPjGHkkPl51S4WSD67hcj
         sbRw8Klb++8WEmEXQxU6DzmnPC5Q4rO1CV9WrgMcqiSY47ZYHMksDfDQFe4mK4SwlmvV
         YzrIRcvrovnSp+UPRS+DaVubOYvO5Iwaw57Bi9IbEobK8fOcqF6zp9YfB7ak0rJfawVd
         kXrETTs2kgdHkGxSP0PEYHV+8X02+nQNEFFt73zvoU2J3FGrBuCaFK5A2BeAvMFn9J0F
         pTzDbdjTMrY+YHAtSR4wtf3wV9bKldb8TO9De6p3H+41osX2gB629CcCRsJxMFE4MB1K
         U6RA==
X-Forwarded-Encrypted: i=1; AJvYcCXnLc057BKwxII2ThOju8FF78fv+AIToYCl8khgZnGjDtFCva5erEx37e4IyTkypYv4x6G/eU+urJ6wQ5q28xeE@lists.infradead.org
X-Gm-Message-State: AOJu0YxGWhMTSS58NmOtGS8FvLDJFoYuJ+R7NGJcZXkYGX9xuKcwaMqg
	FA/7IVw6Tbn9RDEg7c3wDX6ioPZROg8Vl2Jrb9fNMx3ABR+r6p1XGLWHBSaO/vQqmMQy7bqe8e1
	82PHi5YlSk1PmsSlSEiMQDRvqfMo6mU/0QEQg9g==
X-Google-Smtp-Source: AGHT+IHaAWOdAgML2ba4DzOA4z4U2wezC3VkawX20A2dPxMskv1IqJdFG+uwKU9K7bhxa9QyXticQbkM331fssKDcLk=
X-Received: by 2002:a05:690c:30b:b0:6e3:16da:e74 with SMTP id
 00721157ae682-6eaddd9418emr194176117b3.16.1731500876873; Wed, 13 Nov 2024
 04:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-8-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-8-2873eb6fb869@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Nov 2024 14:27:45 +0200
Message-ID: <CAA8EJprBxL0KuOm4f1peRCw9Y=bzXo=Vt-QEv37RzJ62zJriNw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
	Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_042758_484785_9248B76B 
X-CRM114-Status: GOOD (  12.61  )
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

On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>
> From: Li Liu <quic_lliu6@quicinc.com>
>
> Add display MDSS and DSI configuration for QCS615.
> QCS615 has a DP port, and DP support will be added in a later patch.
>
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 109 +++++++++++++++++++++++++++++++
>  1 file changed, 109 insertions(+)


This patch has even more feedback that was ignored at v1. Please go to
the v1 discussion, respond to _all_ the items, so that we can actually
see what got ignored and why. Usually I don't require this (we can all
make a mistake and miss an item or two), but with this patchset the
number of the comments that were ignored is extremely high.

-- 
With best wishes
Dmitry

