Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582F0FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vO5iuPARPBHlJ6G8aiSTUn1sOPHT2OcXMvj14NtRS+E=; b=Yhaa0PFE8wYCyPXda3fut+zEeF
	Hkx3v2L4rLTMpMb/JQAupM0Ou4BlU2Q0v5c05jxBBoWNoGSptZ5wkYaSs2FdGlbDoOQYt2x2Qbu6M
	DQaIZJpAeUo5V3x433Hxz+R9Y5XahFiYmP1InJaU+M/FUS/WJoY8PPX337nkMFYKUHe0XXLWRzNcF
	ddufR0l6NxGF9pMiXWYD7R0qlhlZUmRZbXQ8kZDYzSJwo62+YuyN5dVTANV6DIUSkPR+8A8llmwBt
	lxF4zuAmB/7Hdzptpyn2VJ1TjKTeLVnHONsuguSK+9YfSNWhxeQ4OHYQDH4tCASSF2BpJXIRZMxCv
	Pw06WKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdEu-00000000oiH-0g7Y;
	Tue, 28 Apr 2026 07:52:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdEr-00000000ohv-0CYi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEF954480B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 428CBC2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777362729;
	bh=vO5iuPARPBHlJ6G8aiSTUn1sOPHT2OcXMvj14NtRS+E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=nJ5bcMezxpRhVdnOQ1ZIzVJCCAs4mT1gXO2e/96+wx00hBqqGbqF8oHUyKDqraJYn
	 uq9ZhihNeBjaI6arIcL6+iUSHyL8+M0R/WUAeeIwHfKk09lmDK8P7nmNERcU8ulC2Q
	 bLvO52Nr1jQ5vVbsN24WJPHMU4Cp4P7JlWmtirbNnIhjYHL4dQVpLHeCKYaAbLf/ou
	 lzJ9Yn1JZ5o23PNm1PoxKeTkCgHHdfowJjk4vCqqLyihUlO5e6usyu9hqkaCxYP0ze
	 EPtXO9l8q2W1U+PZ9yTwjkJWN0v2IgEWQrkaITQpXEOlI5OgDvbVy8YHJReIv6pg+o
	 LFlvlqjd8peKA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a283c44478so17506670e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+qfIyEWC6OJH3Fj4keXE+wEPT/lAGu+cGN6XpiGgPdh1pKb7+YoAGGiNZBtfpoiFonXw3jZy4zI+BbcjZ0kAPr@lists.infradead.org
X-Gm-Message-State: AOJu0YzR37+sagF+NksgV2404UAJDYDKAAafa0PZ8oaKXl7YoiZu2Od4
	qKFiARpo22nDfrx1bywMQxPI+nScHmorvAvrU2DB2FyffscjpS4iVx/OFpwme7Xh6NXGQwS2g4O
	hUjGykQALVbx+9oUkti9Jp45xuza9nEYUp0STT/BIhQ==
X-Received: by 2002:a05:6512:33c9:b0:5a2:a355:aa4e with SMTP id
 2adb3069b0e04-5a74662a809mr744576e87.31.1777362727843; Tue, 28 Apr 2026
 00:52:07 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:52:05 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:52:05 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-5-dcf937775e73@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-5-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 00:52:05 -0700
X-Gmail-Original-Message-ID: <CAMRc=MezLiWcFvY2Qr35p0k8DU1kwo40HmLnuYqCQz848m5ZBQ@mail.gmail.com>
X-Gm-Features: AVHnY4I9O30DLFnNY2LxEIaLNfI7TLSIX2zIHmZ9_yxAyEIE-ruCmhEnjgWZz0I
Message-ID: <CAMRc=MezLiWcFvY2Qr35p0k8DU1kwo40HmLnuYqCQz848m5ZBQ@mail.gmail.com>
Subject: Re: [PATCH v21 05/13] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_005213_309099_B6F1ED8A 
X-CRM114-Status: GOOD (  12.51  )
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

On Mon, 27 Apr 2026 19:34:45 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to several
> drivers attached to a single device node.
>
> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
> PSCI child cells. As the first user, register cpuidle-psci-domain as a
> child cell.
>
> Update cpuidle-psci-domain to probe as an MFD child and use the parent
> PSCI node for power-domain traversal.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Shamelessly taking credit for the idea. :) Looks short and sweet LGTM.

Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

