Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15C9CA5FE2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mz9iUP0v4DTEP90FdhR7m5iuHGwHG/WevtKBp9xCmIA=; b=Mi/WVG1cTP0N4dHGC5JwXTx8or
	dRpknDHv49m/z4myETD8e90i6zNMTBKKezn1XR4F9sPt3ZfRErVGXeXnqMAvU8gsXb8CXsUh2kivH
	Uj69xRuH7TFajIKll8O40770D8DKK6Ph0pB6457BtEEoB7LP2/xGEv5MkXBZrct+kx6AxnidSaa9q
	Xj6gSpuRCS+WxGGBYhDBsqx6P9jCJtmPuOZPu6pvp0I3sgNMknS9LN78F5nOY+6l9zS6PUwdkIiJl
	YvRAvwl8HfxYgB56zQSISFkQv9GtWmfboGBQLl21BkBIkbyWziYOlKKmWaA/jUbsJlWZM/UwmhFKb
	kPk6+dyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdKY-0000000BfIn-1tQG;
	Fri, 02 Oct 2026 13:29:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdKW-0000000BfIc-37Ke
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:29:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F4C6447F0
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 13:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176881F0089C
	for <linux-arm-kernel@lists.infradead.org>; Fri,  2 Oct 2026 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790947780;
	bh=mz9iUP0v4DTEP90FdhR7m5iuHGwHG/WevtKBp9xCmIA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=livCC1MDTQ5Id6BwLdMVyG+stt67wEjABOfFWONZOehPgwCiQJ6Re3u7ajcFpPlGd
	 WeUQ4APnE57AZCi9m/01fRARPAddxhZFEVfGf4K225b7G3sfyW4bA8Y7AgQrLktzoY
	 tb0Lj2o/e7qlgkiNm9jstFv5H2IpG3iBSDF1ZVsbgDDuxFhxOZ5ZgxkV83YupXiokp
	 Qa6o2t36yiBAw/a8AQkvzGyViLPehvcYYVcFeC9XsH6EdOL2e31cEb02A30OlWRWr8
	 9rEabtslmeYTaYXOV1/nWvz2LvucFZvNmWsi1QptQ/nTkM4s1SreDdP+ehVpJjKnsS
	 kMi74Np+/6l5Q==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a779b23f05so22642401fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 06:29:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzCpyUJPXlhU5INn8B6r9HyVCpDhZku/nmelZbaALwVcmS08gMg+tX2nxA2nxByn5GUaFgAWfx4Rc7eFnC62BTU@lists.infradead.org
X-Gm-Message-State: AFq9FYKpjsKj3gucls0EGnhg9RQKseyiKdlWc5P9JzgRcOqeS2VhBZNI
	yk8NYdgoukAfx1NkBJ37m1txPxb/vy309x3G0WcsbeUNGSTR6TzJ6KB1jC9cnpBg6eA5yX8esIV
	oC+3Q+LG2kjU/VsLA92tC/LVdMUYeUZPJditTzz7qLg==
X-Received: by 2002:a2e:be8c:0:b0:3a6:4452:bff1 with SMTP id
 38308e7fff4ca-3a8877b37dcmr7461191fa.16.1790947778657; Fri, 02 Oct 2026
 06:29:38 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 16:29:36 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 16:29:36 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-4-b24e2348e8e1@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
 <20260928-arm-psci-system_reset2-vendor-reboots-v26-4-b24e2348e8e1@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 16:29:36 +0300
X-Gmail-Original-Message-ID: <CAMRc=Mchn4YHX3p+Y1f+mpW2DW0Vv5Z5xngxWJt8rczY23Fp5g@mail.gmail.com>
X-Gm-Features: AclHuK-Ef5zXTasgvfxWkin_hCN8CWI4Y3M6MqXWqh3YH1TDztK4qUV84kA9Flw
Message-ID: <CAMRc=Mchn4YHX3p+Y1f+mpW2DW0Vv5Z5xngxWJt8rczY23Fp5g@mail.gmail.com>
Subject: Re: [PATCH v26 04/10] firmware: psci: Add support for PSCI auxiliary devices
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulf.hansson@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 28 Sep 2026 08:09:16 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to multiple
> drivers attached to a single device node.
>
> Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
> and registers PSCI child devices on the auxiliary bus. As the first
> user, register cpuidle-psci-domain as an auxiliary device.
>
> Update cpuidle-psci-domain to probe as an auxiliary driver and use
> the PSCI device node for power-domain traversal. Allow the probe to
> succeed if at least one auxiliary device is created.
>
> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

