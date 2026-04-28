Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C4FFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7A9hGMrCf5qj6wp/qYnO4QPp5VlOkW3o6k4/MWiEsk=; b=Emj1IfJJ/XlIfwgRWYwYWmIGwd
	RJ4NThuwZyqYwWs/mrVyF1vrFIvpUIPFW28Af9VZOhhxcPtZTHCTxoXIrcFxW4mh6A0QIwfAL5rCK
	lhYKmpc+1etdX3OjD/4lDhWOJqOnkUoTN1qZfHuGNTAjwECQyslRFtYhkaMoqSd87tdX9IlfVwUYB
	V6fMOk7Jk2NofHbb7q7F32mBbIDBYLmAKEVjpoF1baaKnrrjdUY6Q0KNCbmHhO711jEbMnS9bm1FW
	/ieHxG9aIOFsv+PH3u+vzEtn0urzmnpX/Q0nl3fvRscR8IDzar+8Vg2lbOSOex7ccoSK8E2IuRRkK
	8sbtj2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdF3-00000000olL-45Jf;
	Tue, 28 Apr 2026 07:52:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdF1-00000000okb-3cFU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 07:52:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB7FD40115
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B97CC2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777362742;
	bh=+7A9hGMrCf5qj6wp/qYnO4QPp5VlOkW3o6k4/MWiEsk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=eoCIMMKyYiSuRzdor/l71p2rAcsfpB1EMt2reKfrgJ37j66rMJrcHhumrZfx0cX9w
	 9daLWO4AojV60ZG0IjWFR+RpTaHOa620GJEG9R3HNc6NFS1KCLVSFLNWZvFXrwmxLL
	 Xxc5TZ4dv0HFeiO+Mpi5KADFwCz2RVuyVe35A+kPcMydsmj8NByQomBljV5WX+ddIh
	 Ep+r/wCH5NbNfs+I8YUEcYe/utYM0cF9p/7NToAXjvkrZTfe5wEydHPYFrab0P1EMt
	 EeYIlXo/lT6mYPxOstcplZg32cduJrX+1ZZvVI8t61SVylhJzMJ2JkE2tdPmq4hPdz
	 8buYBICbFrAvg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so11202212e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 00:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/HmFlALVFqKVk4bzxwsTEwRmmPz9GX3q9JKV3+zRYTWgtnReq4ObI+2d810GSpZghpZblteeNqVmYYQptYzu0v@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3pOZFEWucfs40BhZtJGvRolE6RG5XwO2KLc3BGsCiU6BEyK7b
	/Z/A/XSovINUjGOCJL2O3zPA3Qqr/jMKWjMFYSz1Xbd64br+UceTmbP4HXtz31EkU0uEKgghgm4
	EYqfS2j199f/chfNcchBbwFkMHHKFVTvDz+r2wkT2JA==
X-Received: by 2002:a05:6512:398c:b0:5a4:1145:ce6b with SMTP id
 2adb3069b0e04-5a746610247mr877281e87.28.1777362741261; Tue, 28 Apr 2026
 00:52:21 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:52:18 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 00:52:18 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-6-dcf937775e73@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-6-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 00:52:18 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc-1CbmdkcpK+GO42zA91JD1bn4uty2Q67LCfdWZSjd6w@mail.gmail.com>
X-Gm-Features: AVHnY4IAeEz9DOJDqUcpSkV3z45GTKftIgb7vtFP5IquBk4MzrXKdkX87mZcNa0
Message-ID: <CAMRc=Mc-1CbmdkcpK+GO42zA91JD1bn4uty2Q67LCfdWZSjd6w@mail.gmail.com>
Subject: Re: [PATCH v21 06/13] dt-bindings: arm: Document reboot mode magic
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
X-CRM114-CacheID: sfid-20260428_005223_943345_F50CD335 
X-CRM114-Status: UNSURE (   8.07  )
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

On Mon, 27 Apr 2026 19:34:46 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> Add bindings to describe vendor-specific reboot modes. Values here
> correspond to valid parameters to vendor-specific reset types in PSCI
> SYSTEM_RESET2 call.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

