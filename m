Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3B0D29C43
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQWG2HKTXRlYlj1nWNlXrh/UtqyothTKCprgHuC7xy4=; b=VTTyK/0XAA6vwT/t3Y/m93l6EF
	QnJ6Y1CbOIlu9gyYo9YF6dMT1KhJtht75HAPrtcciS1GNxJpfGBQyJGbp8otaUQELI+V9jvwwjzlC
	N88o3S083XdsNoc1kQzvY61dKbmoI9EEyljpv3Y76rBsSqG5HSLDFrtGJDXbAgo+T9m/TH93an839
	A0i+HKa9JXGpNz2Yu+S6eGLISs/P9yWBGEqxXec+fnNHWN0tL6z5iEBuzyvt6f1pYcWfGM9H0sJTg
	LF2RyGOo7FO7+qvN7bGtN5eruEsYNcQJ6h/4xp4yRpDJe+C2XxybXQEIQuq+HloZMQ3ZVtqH295lV
	Upb8ns7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYY-00000002ZXz-20Uz;
	Mon, 19 Jan 2026 16:56:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYU-00000002ZWG-3tKv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 16:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zQWG2HKTXRlYlj1nWNlXrh/UtqyothTKCprgHuC7xy4=; b=nyvdKjPqqXnAtylpFxnifZMmNJ
	38E6MCreq2EUQkn3X0oiEEDFU1hiTp+c7Gu0gwrBrxAo7jAXzo74L0YveIEvIBm0GciQwiEh0XT+a
	Tw55DP/KuQQUbxwvIIuhN/v2wi08ltqHuJxhN+wcDKTCsJ8gtUxAH16MI8PWZj9l6mbsIRk0JGB33
	RhdsCaW2AuAaSVa9J6uec+q/eGpqnIqoQCgU1hbS1uVulpi3nPSB/QXh1KDGQzlm28IOyrCqpXBc9
	vj0Qn5ORQfRjjwBDZZWqtqaAJ+GNO1VjmRo/hBN8lZVWdshFQJtlH0qqVOnvU5fzP4bMwKdvaLue4
	/Zatlpog==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsYS-0000000CbWe-0FDk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:56:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07BD2497;
	Mon, 19 Jan 2026 08:56:31 -0800 (PST)
Received: from bogus (e124108.arm.com [10.1.32.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C3153F632;
	Mon, 19 Jan 2026 08:56:35 -0800 (PST)
Date: Mon, 19 Jan 2026 16:56:32 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <aW5iQABCRukZXpZH@bogus>
References: <86331062-301b-40b1-9df1-78f7751508b4@oss.qualcomm.com>
 <aWgEDAlglnGrzdR4@bogus>
 <4fab824f-8067-49d7-8e6c-dedd67a8454d@oss.qualcomm.com>
 <aWoVR4oNdIHnksJQ@bogus>
 <92d90a1e-e993-4044-b152-83a8700f7b63@oss.qualcomm.com>
 <cb7326b9-91d9-44a3-b9f0-9d2e6ab5fa42@oss.qualcomm.com>
 <aWzuuwQi_nsHoj_5@bogus>
 <mzs5vq2jsrmb6kdriuxawbamyim6dhgy34ne6tucnhlalt5y3w@ghckxur3cn6m>
 <aW5Fdjag_w7i0zWN@bogus>
 <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vvvq5rnbzs7ngtahqrar4iqinizthyrv3ipqnjp6ln34di365j@bbwdyda6gw3u>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_165640_280896_2AC567D9 
X-CRM114-Status: GOOD (  18.93  )
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

On Mon, Jan 19, 2026 at 06:44:23PM +0200, Dmitry Baryshkov wrote:
> On Mon, Jan 19, 2026 at 02:53:42PM +0000, Sudeep Holla wrote:
> > On Sun, Jan 18, 2026 at 03:16:50PM -0600, Bjorn Andersson wrote:
> > > On Sun, Jan 18, 2026 at 02:31:23PM +0000, Sudeep Holla wrote:
> > > 
> > > To me, when you decided to add a second caller to soc_device_register()
> > > you created a regression in the userspace interface. If nothing else
> > > it's a leaky abstraction.
> > > 
> > 
> > In that case, shouldn't soc_device_register() made to give error when an
> > attempt to call it more that one time then ? Also should be change the
> > ABI documents to refer it as soc0 and not socX ?
> 
> Then the whole SoC bus is an overkill. But I have a strange question
> here. Consider the device having the "BT / WiFi SoC" next to the main
> SoC. Is that SoC a legit target to export informaiton through sysfs /
> soc bus?
> 

Just for clarity, I agree with you and there could be duplication of
information if there are multiple source for that information. E.g.,
the setup in this discussion where the EL3 firmware provides SOC_ID
information via SMCCC SOC_ID and DT providing vendor specific information
about the platform. Both are getting exported via sysfs but the problem
here is SOC_ID has displaced vendor specific DT info from soc0 to soc1.

We are exploring ways to see how user space can survive this.

-- 
Regards,
Sudeep

