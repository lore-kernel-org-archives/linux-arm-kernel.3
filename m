Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D65CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJ9dEuHA7QP47k8+mFjKN7aiDkO2eEnpi3eRdL/AdNc=; b=2qrE6C3AiybedmjjFO4hYHrIl8
	kTk/Q4ibLXStNvm0y+OKR+vdQfVgQXfnsy9Ll56/s5y7bOM9hAmOnvjDV8Db0lQ+xrqXVFf5yJMCr
	PQg8Z3AjyKN1o45VSG4IQSijWqS8foUdiTwTu9LbrTs7jI2UDET49repCMW8gsVwusWxqDazHC2Em
	J3urTM2hflm5nruD0dvwA6EUtQFGxT9uMohDYTzAVuFUrP/6r2ZlcwVet6datlGXGS5HRTeBeaBko
	JbJuLb0GOsPQpYoBLdwbs4WWh7mWMoeDQaUS+jjdSIVh6KkKUKwQVH56D/0M7atQWB6UUa7lAeZtH
	wIymxjGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRfp-00000005Sv9-2JOB;
	Mon, 10 Nov 2025 13:11:09 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIRfn-00000005Suf-32uj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 13:11:08 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b7277324204so514750366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 05:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762780265; x=1763385065; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qJ9dEuHA7QP47k8+mFjKN7aiDkO2eEnpi3eRdL/AdNc=;
        b=q6mWB1QGfjzv43G6kPmjdymPoRqSnei87FkAwSsBdwcNW6PcPvZeRVAQHgh3EKGSEe
         hzDiLKoE4oXUQ+omq1YOwgnW4s6WqTdvFuK+p/EEQFsvjU5BSi/Awjf88f8vWmPAkXL0
         AMnoNTFt/gfV65cT7fhxSRVGuj2jxcSpq97ojS/InHohNV/YWP50XfK2duL0BuRxacwe
         flL+FtWSc5Y1RvtxLNEvjEqUlmtKc+8dUQaWXqTqMU/ptfmz48gPlVzq9CRc+YDUkHf1
         Ju7qOmtBwbwtUAqPTZd9DVYEin6haZ9yi6t0wMKRA+mfebksUlHnhuNRbZlmzyhwq98a
         l4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780265; x=1763385065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJ9dEuHA7QP47k8+mFjKN7aiDkO2eEnpi3eRdL/AdNc=;
        b=CIvqqu+PXvZgOtd+5Bjkq9P+1nvhijTbkm+s4RD9UIT/51IAxWmbrKeWI1LfwjmfWB
         07hK8DVbGGxLW5vnzOjg0tecWxLYLI4gUcWcqYfzRraFztFdCeyR8czf+N4ve7SDM3xu
         tBiWjStCPWd99xK5BUxCd2XPUUdbHhWJsgKHbNM+4495TIzs7ZKkhacH6myeaxiOYZVb
         z8RbOjGnxpMX3zMu96nqsXu5EBI7C0vtQJNyI4wyd8xoY/c64uCNpfcpD1pvm5lpvH+G
         OpJYTKcFKMwaZJeYtx2kTwVA8T41g8Hr3Sr21lzhQdep5J6RRlHqR2BtHrPuGsEh+Xa8
         Cg1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9jgiyWr+X3GgyREmo0jK6Ix3nO6Fm9wdthMBRbOgdEJjfe7z1ABD8UkjuHwdf44+5VgH63Fmi6s8tRxCF/n5K@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8n/bE/iNfbYI81hfmv6NLDQYACcIAPjtlTnV1qeVye87Qgqdz
	dgKTBiUdljK02Ha8r4EVkjIz4B7uKIzrzZaYqP04XcQWBmXtUFZMyUQmR5QgdS8sGyYwV8VSznV
	LQAqqqjT433z3jKE93bKB13Tk7hU4tF80gRibD4xcPw==
X-Gm-Gg: ASbGnctvS4UTrKc8CDN/o1en2p8k4n8mm/2qop7PWQOWM5rZF/3GEm+eSITrnyFH4ry
	iHQPvcp7xE4coiHnr5XC7I2J64C9c8jKJwW/dLRg0VhYnlLKt1Q3fJaS3gZO0nSy44gXBE189iZ
	eIRde0okwPY57AS8e6j5ItL5QwT110XaRUmKMenV3jzrUAYzYCsWWWquMWiORUG2Gk3IE+yUxk1
	m5+sVLHtUCsGIYqSRbqOf6kUNtO9hRP9Ye2JadF35QnnjLMePBGY41FIN2r0rp+StQ+nVpOHFZf
	GNIbRAjX2deDYlfh
X-Google-Smtp-Source: AGHT+IGPitg7K5XoZgRQkP9FaImCQLO1InXFpXMUt4u6tDzxq2I7G9KRZEGJLJgmks99vhYut7CnjxNMlDxBUQ3PjRE=
X-Received: by 2002:a17:907:3f26:b0:b3d:9261:ff1b with SMTP id
 a640c23a62f3a-b72e029316emr763218866b.5.1762780265467; Mon, 10 Nov 2025
 05:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-1-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-1-46e085bca4cc@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 10 Nov 2025 14:10:53 +0100
X-Gm-Features: AWmQ_blKnASBsaS7hJ2XpHrQ-4sRSj2u5D16heHa45ya298_aUcuoaggfc-rRk8
Message-ID: <CACMJSevoC3xYoeodGYnY4_EFSexqbNLqT_7UbRu9DxDRx8_gzA@mail.gmail.com>
Subject: Re: [PATCH v17 01/12] power: reset: reboot-mode: Remove devres based allocations
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Moritz Fischer <moritz.fischer@ettus.com>, John Stultz <john.stultz@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Xin Liu <xin.liu@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_051107_788433_84868B27 
X-CRM114-Status: GOOD (  12.19  )
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

On Sun, 9 Nov 2025 at 15:38, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> Devres APIs are intended for use in drivers, and they should be
> avoided in shared subsystem code which is being used by multiple
> drivers. Avoid using devres based allocations in the reboot-mode
> subsystem and manually free the resources.
>

You're making it sound as if there's some race condition going on.
That's not the reason. They should be avoided in subsystem code
because you have no guarantee that the function will be called after
the driver is attached to the device nor that it will not be
referenced after the managed resources were released after a driver
detach. It's about life-times not synchronization.

Bart

