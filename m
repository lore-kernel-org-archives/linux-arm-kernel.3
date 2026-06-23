Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6768ACD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 08:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2PkEy5u/GL603lnFnZZuJh+bWGAaKDSaHX9lX4UrfI=; b=1U+eF13FTFKj3sFPdrlwt3o9YF
	hMiDIXAoqqjucPQpzpqLr1bZscS/rYEZb6Gha5EjBKfYmI2w0A/xrU2jRR2kxdOnYlyLqiB4ceZze
	t8DEasAA7okMxjHKMcpcbGO34bvZKxMpAkPHqWdoc7U2R7muOijOJlACl5CKBtI2T3p38JWCP1s38
	qO3SDEnmBgZbnH2gs9esn8lT5Khkorn+OUGaH/TABgSQQLniApL48Zg1EZR06KjlVlmOVhzd8c0vq
	/Fp23NMz3y6Yg8I+/6CjcAqDFZguHsu+Et6VHHgemFC1sTF95zw7FQvO7lZtrCfMOGYj7QlhvrNkj
	tu8PmPnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwmw-00000005vom-0RMa;
	Tue, 23 Jun 2026 08:47:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwmv-00000005voa-1h1q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 08:47:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CE0D6020B;
	Tue, 23 Jun 2026 08:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980DD1F000E9;
	Tue, 23 Jun 2026 08:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782204440;
	bh=x2PkEy5u/GL603lnFnZZuJh+bWGAaKDSaHX9lX4UrfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QI+SsjlKPe4aJthGKAM/stCcBEtoubIOH6yFA9R5C4+UCYVxFviilxQUd4kWlfT1Z
	 T74WwPIUlP4xvFHEpyeGxVWwdi6ttVXmPpqmoUnzb1lxpkpGYgGNSFWiQGq6Izp2+U
	 UwFKWtRxuVqHe6Psz3A3CRvsKjEPmnH+sVLABvwWtrIJjekXGAWjP9rGsj3zZnXq5z
	 1FaTnVuklEumZbbGSwkXQdsFVqOwv6g040J7mG00POXmjeulffeqE+kJXjqlIucd9L
	 cftdTGOKsfAKPKEanKLoM/k5XrOZSxjG5O/A/Lo6tFrFAj26K+Lz7z32WeO88o4LEW
	 XdsA60OtvyJNg==
Date: Tue, 23 Jun 2026 09:47:14 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Amir Vajid <amir.vajid@oss.qualcomm.com>,
	Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
Subject: Re: [PATCH RFC v7 0/9] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
Message-ID: <20260623-busy-beautiful-trout-8cc2ea@sudeepholla>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
 <8725caf9-cebb-49ce-b2c8-4960a6073322@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8725caf9-cebb-49ce-b2c8-4960a6073322@oss.qualcomm.com>
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

On Fri, Jun 19, 2026 at 06:01:23PM +0530, Pragnesh Papaniya wrote:
> 
> On 16-Jun-26 1:57 PM, Sudeep Holla wrote:
> 
> > Not sure if it was discussed in the previous versions or not, it would be
> > good if you can capture why some of bus scaling doesn't work with the existing
> > SCMI performance protocol and the monitors don't fit the MPAM mode.
> > 
> > Please capture them in 1/9 as a motivation for this vendor protocol. It will
> > then help to understand it better as I am still struggling to. Sorry for that.
> 
> Thanks for the input!
> 
> SCMI perf protocol exports perf domains to kernel where kernel can set
> the frequency but here the scaling governor runs on the SCP while kernel
> just observes frequency changes made by remote governor.

OK if it is sort of read-only w.r.t kernel, why not perf domain notifications
work to consume the change done by the SCMI platform.

And why do you have set operations in the vendor protocol being proposed then.
It all looks like something just cooked up to make things work. I need
detailed reasoning as why the existing perf protocol can't work considering
all the existing notifications in place.

> While MPAM is not enabled/supported on all hardware (Hamoa).

Fair enough but I still don't fully understand to rule that out yet.

-- 
Regards,
Sudeep

