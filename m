Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FF6C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQWzU2idhtJFEfGoc824MA5NHjwICFqfWvq6sgVbqeQ=; b=VW+cUoHVg6K+8XBAvCQO3Cvwzr
	ztfbDaLtQMzzj97HiSroYQU4dPAm/YrNydjS/eEACPvae/F2cveIMpzUN9gvThx31W3PIZ3r7b7tE
	EARTqDBB5dJ69xjn65oN22dFp1Yi7F2cIfbxhacELO44VlpnQ6/yvfLgxoPou6RhBntttrb4c543A
	Ob1bUuoI5AnWJnjg9AdkDgOOQ//CnE4Y+rOXW2gQwrjH5EthfbrR55gTp6OsZCIQDYrqDLzmshjxO
	Q34xnp+XmMa3a21cklKCAEr57I1HS5dIWEGLeeE7hNOZn9kPUKnM6LvxfpocEr3tdQueESmqq50sj
	CBOj3Q3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV8s-00000000hu8-2ZMi;
	Thu, 13 Aug 2026 13:06:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuV8r-00000000htl-38lf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 13:06:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E64644057
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 13:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CD11F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786626401;
	bh=yQWzU2idhtJFEfGoc824MA5NHjwICFqfWvq6sgVbqeQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=UXZVJtg/2Rx9ZJDFRk0rV1flaUPuLIwsFB15lmMdTdhvITsZVwhmJRtAnjke2dcPM
	 EyRKKSNQ46Dic9or1D5n8yp3ruC6CRTB/JD/ODBDLgVK7E1aiovyORp16hMh26KRV0
	 vSTog3v+nnYt16PpUwy45UrNG4GHKDhwZraJe/dAxnXBz/2P+sZXENL5cs7QkxnZkm
	 L9pyu9aXIFzSOlfUJrzqIAtd4pkKh4llCsHlijG4RoUesbzNt1DjM706dqp4X6MGYv
	 Aw2HVGG/ig688WXvWgyVx0jbQPESHqofU2l5ysylFdNzHOHIx9rVqGavvn1L0wQjwM
	 npFITTaSA+U4A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b29599b81cso891110e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 06:06:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpo0sEuaFaJtM7akZWN7OPFeea4kjfA2m2w3apawrSBRt+OqMVdl1vi0NNCmWpdNRIhylVywjftmpfGR0ogI8Vb@lists.infradead.org
X-Gm-Message-State: AOJu0YxL0bhn6CCY0w5D0WdlE7lDJmBsiFtX/hHhL8Fh5xwYODz8YKzy
	kj0QVxtlSXeozN36QS+2VXHMevi79JX8T6m8buBVYTYA82ypJ1JYFdKhYXROXa/CPdx+jOt8eD9
	UvQZi3Ii47uz4HX2vLqdReLCCKSxDSgkVCwq9quZdHA==
X-Received: by 2002:a05:651c:31cd:b0:39c:7859:a2d8 with SMTP id
 38308e7fff4ca-3a11a819760mr7294241fa.27.1786626399530; Thu, 13 Aug 2026
 06:06:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 13:06:38 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 13:06:38 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260813123841.GC1820248@google.com>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <20260813123841.GC1820248@google.com>
Date: Thu, 13 Aug 2026 13:06:38 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdA_zM_pHCmk7dd7kosqvNmFgA+iXvHS4qpNs9bdsUMCg@mail.gmail.com>
X-Gm-Features: AUfX_mxLcl-KphrvU6gLOMupiRghMpmm1J92bVQek0OJwjAsSLdXf3P9i5s9MC4
Message-ID: <CAMRc=MdA_zM_pHCmk7dd7kosqvNmFgA+iXvHS4qpNs9bdsUMCg@mail.gmail.com>
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
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

On Thu, 13 Aug 2026 14:38:41 +0200, Lee Jones <lee@kernel.org> said:
> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>
>> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
>> Currently, both the PSCI core driver and cpuidle-psci-domain bind
>> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
>> introduced, would also need to bind in the same way, leading to several
>> drivers attached to a single device node.
>>
>> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
>> PSCI child cells. As the first user, register cpuidle-psci-domain as a
>> child cell.
>>
>> Update cpuidle-psci-domain to probe as an MFD child and use the parent
>> PSCI node for power-domain traversal.
>>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>  MAINTAINERS                           |  1 +
>>  drivers/cpuidle/Kconfig.arm           |  1 +
>>  drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>>  drivers/mfd/Kconfig                   | 12 ++++++++++
>>  drivers/mfd/Makefile                  |  2 ++
>>  drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
>
> We don't usually allow the use of the term MFD in devices.
>
> What does this do?  Is it a mux?  psci-mux?
>
> If not, think about what it is and call it that instead.
>

My two cents: I'd call it drivers/mfd/arm-psci.c

Bartosz

