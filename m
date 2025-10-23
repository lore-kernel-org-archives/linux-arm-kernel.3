Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8395CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qK5aw0ySKCWWtM8T+Ckc0U2FXVFfBi7RX+UnHhpIFyk=; b=pXAZQti4GzhPw2EtbUYD5REEQ9
	t1RMfytmZOqH6uhWmNdh15z0Z2+9tDOySkq1pV1my7kLUBpCAnA9rnCv72epZqQppQx346+dd0+Me
	6DsX7BYYuAAL3cR95NEbcLW0Jypx96T+dsrW8vjtaXneVyf8gvu25KJJURo+FInMUT0LS23E/Gilb
	Sms4hpUtSCMlLQE0UFwQq74B9UgRVJyYUAgbsqdyv17K8wx2T7aj2yZKatVW03VXvpswH1LRsrZr+
	VimDZK07J1AmRsVgmIeTG+ejWQWZR618mf1eXOp9jJrqJGVlCXgrPJwfUtCCgoBaIMqjXYu+9lHLJ
	jn3tJDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwq9-00000006gra-3eOR;
	Thu, 23 Oct 2025 15:02:57 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwq7-00000006gqj-1yA0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 15:02:56 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b6d5c59f2b6so107463566b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 08:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761231773; x=1761836573; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qK5aw0ySKCWWtM8T+Ckc0U2FXVFfBi7RX+UnHhpIFyk=;
        b=UIYGJ3YJ44uZzbypFH3Bu30c86nUC25vuDkhlZ1UJ+1h191NfcCduOKmxC25Xx2Al1
         JyjXANkhzYzdcAsNwzKkBPIqQp1fWBozjVomvzV8av98HnqeosU3Da0dFbHfnO4TcTOW
         W4CyfSaqUJan4UtGy0Sz4Qt9VhXUgpmWcrXKghZTJZRJbaMtH6jWB5dQcet0zWw0be3o
         MBohCzqtzpZjGHPkelnBpamFIDlpd0Tw6sdTNHOWyhrpNeiX8j3Kf8dhalfIHO1buvpm
         AeCG3G5oE4nvG1PGuv28xCJabpmL3jeUtZ6txrzFxARRnpr66iJU+8wWqnjNkXhmrTWo
         ZpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761231773; x=1761836573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qK5aw0ySKCWWtM8T+Ckc0U2FXVFfBi7RX+UnHhpIFyk=;
        b=MOE2JanZ0xwR1O83sT+rxv7Kt429VzcPMkKhXGdJQ6pIIWCNG4/S6fia/Oq/OHyD9Z
         DTA3iNFyqz4lBqGwyqaxt5JT1nLAoQnqk+SwYy9as7biDmogd+j2arAg/ePM5B6vYs86
         pbnPv7w+zSK9DDcmHjTnSLN3dCpWADVzBBO1e331UUBrsvcvZYCjHjcAlrLiS80DloEd
         UI7U4Iv9832HaQuZpqfoAWci1CaS3P3GN1fk8pvIxL8KyFBuwYEofu/oWupoSNveO8/B
         VbiKnTwLGc/JZXZPZ8ufsag8ZnX96fSDpVphx0f+dpClpEMQco3vn7vwiIDeGAQDoWuE
         lxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKnZ9FgyytVUzt0DMkcJApAYigaPKv5GKQrUbTBJwOZZD7I5nl/2+mX84Eh8YEyntwn3UpX7oTXYYbuSlCNMvc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx96Z6cuMhmsBtjS/RuAPy2ZhvnZcjWSa3HTmCEr4d4jqPeRw77
	qAlOh6F+sqr2RUfRqY+qclM8UjfrDfGaULEEeUA0npRZGXnraP7duyrzUspa/N08edAGjUEeUEp
	TwO73cvuSAp/DxbxzjL0ffR8oHYxFvZouIe/DO/SswQ==
X-Gm-Gg: ASbGncvWYvPF7LcMiWhBXv64CNKH/B618tDtwhOA5nVHzhtC8eZkNVkojobbPskY2PJ
	VMVUiPlJFEEvmNKksjF9pdoZ7P9McuYrVVqYD3T65ExIRvpWqPcuQIWZLuyO8DTJnzDlYbm1568
	wVivfrYW29qoWDDPHSBilF0Ggyu6SmNC8V8YQj2vXCwfTLnLPJ6/gRT5yL/s1g22LSX2573XB2x
	WS2Z1NCM59mkXesMDATigA8za3kEnsxuh1E+CEs4FM3J4IrO6Ek5egrS56f2H5eEuqVT93f00ql
	HQUdd49xNcnmsa0=
X-Google-Smtp-Source: AGHT+IFiT0IsifyoC4o9f6+8ie2I7nihSahQgM48GLh9H5e00zMiqsl4ryTGE/fKqLxHLO2ruCiUMTfjNs7pKOpZ3u8=
X-Received: by 2002:a17:907:868f:b0:b6d:5b0a:bc3f with SMTP id
 a640c23a62f3a-b6d5b0ad244mr179348466b.24.1761231772916; Thu, 23 Oct 2025
 08:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
 <CACMJSetWthCcJo8v7EuUK-aDKhf5KTNG5WQQ9aTQu62B+E=DMA@mail.gmail.com>
 <8fb6e8e0-cdca-0bd5-d0fe-56b5f6d27a5c@oss.qualcomm.com> <CACMJSetTrze028iXmH3i=JguJy=aNOMcnkLhO1ewYNiusvVmgA@mail.gmail.com>
 <efc84b92-43f9-ba25-1259-ae3907273af4@oss.qualcomm.com>
In-Reply-To: <efc84b92-43f9-ba25-1259-ae3907273af4@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 23 Oct 2025 17:02:41 +0200
X-Gm-Features: AS18NWDhrwCWj5OatrU3wL3rcQVr8s37dYpX7bYhPrL9Oq2ex-mSUqkHzN71als
Message-ID: <CACMJSetctEH4K58R9JvSYNzzYgE0NGMsAr5JxiZ4RH_3T08x-A@mail.gmail.com>
Subject: Re: [PATCH v16 05/14] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_080255_568935_C3BABC68 
X-CRM114-Status: GOOD (  29.23  )
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

On Wed, 22 Oct 2025 at 16:21, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
>
>
> On 10/20/2025 1:10 PM, Bartosz Golaszewski wrote:
> > On Fri, 17 Oct 2025 at 21:40, Shivendra Pratap
> > <shivendra.pratap@oss.qualcomm.com> wrote:
> >>
> >>>
> >>> If you're using devres here - at least make it obvious by adding the
> >>> devm_ prefix to the function name and make it take an explicit struct
> >>> device * parameter so that it's clear who owns the managed resource.
> >>>
> >>
> >> sure. we can add devm_ prefix to the function name.
> >> reboot->reboot_dev is an internal member of struct reboot_mode_driver *reboot.
> >> The struct reboot_mode_driver *reboot is owned by the calling driver.
> >> If we want to PASS reboot->reboot_dev to the devm_ prefixed function call, we
> >> will need to kind of split create_reboot_mode_device into two calls - device_create
> >> in a separate function and then call the devm_ prefix function where we add the devres_alloc.
> >> Can you suggest a bit more on this?
> >>
> >
> > Ah, ok I missed the broken logic here. Devres should only be used in
> > devices already *attached* to a driver as all managed resources will
> > get released on driver *detach*. What you have here may "work" by
> > accident but that's not correct and is very fragile as soon as you
> > have some non-standard behavior or error paths. Devres won't fly here,
> > please just use regular allocation and free whatever you need in the
> > corresponding release/free/whatever routine.
>
> Thanks, got the problem here. Was using devres to associate the reboot_mode struct
> with the driver, so that it could be retrieved later when reboot_modes_show is called.
>
> When reboot_modes_show is invoked, there's no direct way to identify which reboot_mode
> instance is tied to the current driver, as multiple drivers can register with the reboot-mode
> framework at the same time. Without devres, will need to maintain a global list of mapping for
> all device driver structs and their corresponding reboot_mode struct. Then reboot_modes_show
> would have to look up the correct reboot_mode struct using the device driver's pointer.
>
> Hope its ok to maintain that separate logic here?
>

Why can't you just do:

device_create(rb_class, NULL, 0, data reboot->driver_name);

Where data is whatever driver data you want to associate with the new
class device? You can then retrieve it with dev_get_drvdata() in
callbacks.

Bartosz

