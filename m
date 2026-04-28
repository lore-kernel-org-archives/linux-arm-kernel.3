Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9500FFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gakvkReg0fVWUJryauTzFRkfayEeCg9clm8BNqJgejI=; b=iIe8Bi9BJaXa98hX5lvNhe+UMC
	ti6VeStw9wC8Yx08lYJaYma+KeSOqpTb9ObOFB/y8Wv8JqZbc5gY2jkW4w2AzPc5/A1VU3bGfzNgl
	qYubVp/MwHaOjO0XxuO7D1HFl1kUb97KKFmyK8C89j+gzDP1gFEMYawMRdapnshI9DYFpDH/NdDfX
	4ALBho+zP4pkCLq3Pim03oJ5ffNp4eu+7u5wY98zgDrHYMz4F/UHG+4K4Kyp71vmNyNMTCZlKWkSQ
	d3rZZ2rxCiRIkwSFcxJ5OQ2smACkUY30JswPQGzR1ui9MkN+vLOdU0a3OUc0xpxVZVXo587ndXkj4
	dSoxuZRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdPe-00000000pwY-1IEl;
	Tue, 28 Apr 2026 08:03:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdPY-00000000pvF-2xbc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:03:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2EB844858
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A7AC2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363391;
	bh=gakvkReg0fVWUJryauTzFRkfayEeCg9clm8BNqJgejI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=gCiU8DcVwQEowwEAwYG3MsLXklegyS09HYA2QCs3e6rYJLLSuDu4SxCyVK/2W3YTQ
	 c4OVu/MwPcLnaGuDdakQNX9jF3K7FgFpCtLxeCgZnYxexquRWElzbN8IiTVf7h3/sH
	 TjWwKhJ/vwNqnh6wMoUt0GXPslR3z+122nus16tJ8Oq2oSQUCzPvY6MNSq66TFLH6w
	 BLy/DF4wCtHjzGSaqjiuGe9opjrUvHVnP2yqkgtQTkjWx8vCcSVtfqr6BHlCNqgF1X
	 Jruz9Ja+u7JLPvVfJwGOu45gIIwSAx7oq8uVWzzStz7fIu2YHagpL4xuwlYEGrDnKV
	 T06kp866Vry+Q==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38be5e86918so122472081fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:03:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ919TxTnzi9Zx0KHIZM8ezmB0qHbW8vGYKWMQ+MWE7l1P3dBnOPDbiTTwbs+u4bqsbDPhlhe4ABwgrlMKvqLdZ7@lists.infradead.org
X-Gm-Message-State: AOJu0YwUvY7k8CsMGWCyHt/9wPYa5e7m3jL/WVFRk1daXUpiYTnHuTBp
	5bcQMDw/TuKNIFPJ5Fj/ude7AbaseCHIKqXCvFixTfGLt8M/SShzwD2Y7vgA3mms9tXdoSRluCd
	VbUd/xp1CQKJP0DsrjlxrxW9bORofTMm4LmfDf59bzA==
X-Received: by 2002:a05:651c:b13:b0:38a:8199:1b60 with SMTP id
 38308e7fff4ca-39240e2f97fmr6452871fa.6.1777363389951; Tue, 28 Apr 2026
 01:03:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:03:06 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:03:06 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-8-dcf937775e73@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 01:03:06 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
X-Gm-Features: AVHnY4KzpDYlkP_BmYQb8Tu_NftXGx0jC5UQCJ6_82FV8dMIjk5ibCMQsX_dXwo
Message-ID: <CAMRc=Mf+-04Zr7jjRoaxTzO3LKSMyQ7DzxJc=dHNSyThEUiq_Q@mail.gmail.com>
Subject: Re: [PATCH v21 08/13] mfd: core: Add firmware-node support to MFD cells
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
X-CRM114-CacheID: sfid-20260428_010316_815281_A3EA9732 
X-CRM114-Status: GOOD (  14.19  )
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

On Mon, 27 Apr 2026 19:34:48 +0200, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> said:
> MFD core has no way to register a child device using an explicit firmware
> node. This prevents drivers from registering child nodes when those nodes
> do not define a compatible string. One such example is the PSCI
> "reboot-mode" node, which omits a compatible string as it describes
> boot-states provided by the underlying firmware.
>
> Extend struct mfd_cell with an optional fwnode pointer and attach it to the
> child device during registration when no firmware node is already assigned.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

In the following patch you use this and violate the supposed constness of
MFD cells. This also mean you need to modify the mfd_cell at run-time. I would
prefer introducing a field in mfd_cell: bool use_parent_fwnode which would
indicate to MFD core that - in case no fwnode was assigned from other sources:
DT or software node - it should reuse the parent MFD device's node.

How about that?

Bart

