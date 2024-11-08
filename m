Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B07D64078
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFhrTTpiQ0I2IodQiHI+ZaiAC6+TEUbpNWIml06w79Y=; b=DdDhNjihaPG7rVgfpVSvvYVgmS
	ONSmrUd1SxPdl7b1XO7As40aWmzwqkgGJ0hHXo/S+lL96TryXpVoc4QaHE5Do1nxGegQarqA5t+ap
	wTnCXP1JDJbgFJJ/lpdO64g6mwjdxiFLpKC2VU8rCUmsQXt2BNDH+ZWjtGSI7SBGe7fssyo1/ld8o
	EFz18TvG09IJ3L7ee9GehJqlgrFYbVzGvYMjaaH/fjubCpK3JtRVIGWkhB6YagNGedZFKfd/CvH+v
	MgKiaqGWxgD4bRkH+evQuHypzXe0+Ot6ZmwVTUIJUPPFYwSE2eeEA4TwCBwivKPtP0NeL5aeDJ8UY
	rDwwhbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UGL-0000000Bgis-3Su0;
	Fri, 08 Nov 2024 19:03:18 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UAa-0000000Bfka-1CSK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 18:57:21 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-6ea11b32ab4so17983267b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 10:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731092238; x=1731697038; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFhrTTpiQ0I2IodQiHI+ZaiAC6+TEUbpNWIml06w79Y=;
        b=NFZvQ3HutgpIZAmSc+X6f9RTM54KurIkpO5Dr+4egX0ZpYKAmis8el+ue4kG5JNr3V
         uwt2K8m4DGQ8DO50fIFITmSAvDRcPsrdfUt0yY9OaeSSvTrr1YyaosjCpclejgMXhIKL
         NAB6dsBz0D68Sxx8d2o0IyexnsrPMTP+4XyUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731092238; x=1731697038;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFhrTTpiQ0I2IodQiHI+ZaiAC6+TEUbpNWIml06w79Y=;
        b=k3//bGm1604kGBlp5y28oM4fFAeK5rUh9wOF9Jpyi6YyOg5U0BSf/Svk7vfr6O5w0n
         omZTzLG4pk7/gaeuVbqrJYYI0uWr28FbnftftCqvaPt/qVpZ3NGpkQqIavKMX7wX2sHo
         IOtX4dOP9ZfSpuV6+snIOPg/TmBQ77LjgF8hx7ZpI/gT6o81a/BN39bWPveUk9hP21fj
         mjqUR9JffuG5ApZu84eKAEjEPeCOXlLU4dyQ7IUbkKwQ7N7OUXe/BjaxO9cFtrndeHqY
         x9X4bHQnZI0RdD974D03poKNx43cIwlY9xGBE5oOFrYNfm/kckpIq7VTRY2/uQFE3k4M
         X//A==
X-Forwarded-Encrypted: i=1; AJvYcCWvAZRx2gKLXV0DcAiSwQJPgJwwuBySnuCr+DZx3QmHniPDPoJxt539PbOlRcgHba98jXs4gt8I97b6ReILA/lf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5AgNFwtiLEUUeZPrD627FvUVdok79AfaZZartApD1m/rX6mDx
	8q2VH3zUKaGxZg59q9puDYX82gvj5P+4S39B140fSDqZ/6QbdNnR8UkhJBObHWOC20hXleXAfma
	jOnNZtb5rgusBCy/yIyS/qDVaLF1OXKvVsiU3
X-Google-Smtp-Source: AGHT+IHfC5tJ6whbDS7S3SlhCnoJBwUgDNoRBmtsYN3YKtsv214Yxvv3stXcgF9ZacsGjD0iMrYs07O4YZn2INdER/w=
X-Received: by 2002:a05:690c:d8f:b0:6e3:ceb:9e5c with SMTP id
 00721157ae682-6eade52f876mr34629017b3.17.1731092238352; Fri, 08 Nov 2024
 10:57:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Nov 2024 10:57:17 -0800
MIME-Version: 1.0
In-Reply-To: <20241107-arm-psci-system_reset2-vendor-reboots-v8-3-e8715fa65cb5@quicinc.com>
References: <20241107-arm-psci-system_reset2-vendor-reboots-v8-0-e8715fa65cb5@quicinc.com>
 <20241107-arm-psci-system_reset2-vendor-reboots-v8-3-e8715fa65cb5@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 8 Nov 2024 10:57:17 -0800
Message-ID: <CAE-0n50-h_h=oWt7BZ5ncX8JYfXmEpN7-HrZeC8wHrHZnGsJMA@mail.gmail.com>
Subject: Re: [PATCH v8 3/6] firmware: psci: Read and use vendor reset types
To: Andy Yan <andy.yan@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org
Cc: Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Melody Olvera <quic_molvera@quicinc.com>, 
	Shivendra Pratap <quic_spratap@quicinc.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_105720_385922_6697A8BD 
X-CRM114-Status: GOOD (  16.80  )
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

Quoting Elliot Berman (2024-11-07 15:38:27)
> SoC vendors have different types of resets and are controlled through
> various registers. For instance, Qualcomm chipsets can reboot to a
> "download mode" that allows a RAM dump to be collected. Another example
> is they also support writing a cookie that can be read by bootloader
> during next boot. PSCI offers a mechanism, SYSTEM_RESET2, for these
> vendor reset types to be implemented without requiring drivers for every
> register/cookie.
>
> Add support in PSCI to statically map reboot mode commands from
> userspace to a vendor reset and cookie value using the device tree.
>
> A separate initcall is needed to parse the devicetree, instead of using
> psci_dt_init because mm isn't sufficiently set up to allocate memory.
>
> Reboot mode framework is close but doesn't quite fit with the
> design and requirements for PSCI SYSTEM_RESET2. Some of these issues can
> be solved but doesn't seem reasonable in sum:
>  1. reboot mode registers against the reboot_notifier_list, which is too
>     early to call SYSTEM_RESET2. PSCI would need to remember the reset
>     type from the reboot-mode framework callback and use it
>     psci_sys_reset.
>  2. reboot mode assumes only one cookie/parameter is described in the
>     device tree. SYSTEM_RESET2 uses 2: one for the type and one for
>     cookie.
>  3. psci cpuidle driver already registers a driver against the
>     arm,psci-1.0 compatible. Refactoring would be needed to have both a
>     cpuidle and reboot-mode driver.
>
> Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

