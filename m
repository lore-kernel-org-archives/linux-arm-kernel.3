Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB065C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rH6JM28W2HcqC5yVdmwj3iVAQeOpLq92KlaDNOyUtDE=; b=Q3Vg5Amt8uap1klgUwOnM55RJ+
	0JhISfly3UbjoudsJLetW8otwyuH8BYKUicLERoDh25SkU9ByOlscEMXrlBgEj/m8DdGz9IWeyA/e
	NPErUqA0YfKnuCLq/PuaRA8e+4vngTjGViS047LUxklC9tiHXzbvb+WNcEVUenRWY1JumRHBXXlv/
	RrlzYaRDi5xicVr71w1VJcO+Wm8T5o42Rtcu6jf3NVJFOxNHmDZ++QewusPXVdoV8FQgjqfenJlNF
	RMF6C5ZzHLBfOM644jjilLbM4yM2CrdoXK8iKs370LO0e98taKzs6x/KdFjirN2DsJyZ18trfj8h0
	DLFg10og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Yu-0000000Gum8-066q;
	Thu, 03 Sep 2026 09:16:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Yt-0000000Gult-1Bo7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:16:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D0C7601FB
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Sep 2026 09:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83AE1F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Sep 2026 09:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788427005;
	bh=rH6JM28W2HcqC5yVdmwj3iVAQeOpLq92KlaDNOyUtDE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZI561hLAsKeZjb8PwSTQvhj81RvIClKwgG26jzHzWhxR+U+9qhAqSPugwM3OqDhEd
	 zJp+dyFosP7c0PLCtcjj9IB/xcKH/UMfy+BPNNPhLDopy1zIa1BdaT08CwDBAbk4FT
	 BE614Pwfom/CZhtPRr3a1uR4+ZuHDr4BWJE99H0CgmR+N6LyqWVvi4PkL0OZkHwjUC
	 WS0rTk+o+2kUONumd6rUpC4hvOtVl34O3lZTvywQgiiM1j4CTH3uKF5n4ZC/jJ3oft
	 M806RJ/ABNYn8YFdGYCOdFvr4mXFf/FSMB+JYjapt587r1N2dmNnZ7JWpYOPcrXJcC
	 ekHqH0Wg/j1sw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so1122196e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 02:16:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxMXV+CZo+PU+aKXoLPi4iO2dIibfDovO13iiDWXkYoqY7zwmhnMuedmw30NuRRWFjOaSlxL1cQaYsRMCnyyNtC@lists.infradead.org
X-Gm-Message-State: AFuF++l85SvRXzRcIJm0Out/lECgdroUxa/AEKv/wcexRJjMPZG6M524
	W0xgncLPDHczees2LhWethMRxsMaPAcykrfXq+TdwhX92HGWYhshpy/KIyc9X9ps5AQwY+NzDW9
	7Vx4XUEF+h7J1Do7YHbd1MvVsd/jLAq7E2sSJTq0ngg==
X-Received: by 2002:a05:6512:68e:b0:5b6:10bc:b867 with SMTP id
 2adb3069b0e04-5b610c4a488mr479716e87.21.1788427004407; Thu, 03 Sep 2026
 02:16:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 02:16:42 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 02:16:42 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260902162642.000008d9@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
 <20260813-acpi_scmi_pcc-v3-1-cb6b88b4ebb3@kernel.org> <20260824095121.00001b9c@oss.qualcomm.com>
 <20260902-tireless-steadfast-mongoose-cccac7@sudeepholla> <20260902162642.000008d9@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 02:16:42 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdsNTnZr7wdif_u2Pc_cBaU+qNO=sb-PgNO7brX4cfs_A@mail.gmail.com>
X-Gm-Features: AcwNN1XJDmdY61Sl0xKdzpCkqFP9MoYPrwivu2XvBWuGWUsj1mtmR24GRCfT5fE
Message-ID: <CAMRc=MdsNTnZr7wdif_u2Pc_cBaU+qNO=sb-PgNO7brX4cfs_A@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] firmware: arm_scmi: Set fwnode for the generated
 SCMI platform device
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>, 
	Breno Leitao <leitao@debian.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?4oCcUmFmYWVsIEouIFd5c29ja2nigJ0=?= <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>
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

On Thu, 3 Sep 2026 01:26:42 +0200, Jonathan Cameron
<jonathan.cameron@oss.qualcomm.com> said:
>>
>> How about something like this instead of above 2 lines:
>>
>> if (is_of_node(dev_fwnode(dev)))
>> 	platform_device_set_of_node_from_dev(spdev, dev);
>> else
>> 	platform_device_set_fwnode(spdev, dev_fwnode(dev));
>>
>
> To me, if the reference counting is useful (and I'm a bit doubtful about that)
> platform_device_set_fwnode() should be doing it. +CC those who might have
> more insight on this.
>

I should have that insight. platform_device_set_fwnode() *does* the reference
counting but it should be used for platform devices created with
platform_device_alloc().

Bart

