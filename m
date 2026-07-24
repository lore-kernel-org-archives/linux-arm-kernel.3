Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A48C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfHLq2po8UI/y28qstFvUK43HAU86pkJ/YHd7F60yAk=; b=UnndP/Guy3/4JpbfkBLc6P0g6M
	TwIwkaVnXrYKvNoBEXvw+pPkTXjxGuLdLSSAG6B0Fz+CvPQe9mTBcr+RKfdA1IT32uJSsUHwSJCWl
	GenaGTOGJ/nglytCUOaxtaBcEaSPjM9iCjtogT47PPNRYDiJZhMSC9BCIzB/NwMgX9Sh+Vuae+bid
	4qYheKwpADBDpYL0fvOrXIkKtxeNgoZRSQr1jAtI/OPISem2yg5x2QqP8roUeI8jrkBMi+7+rXrSp
	XQwTthhWhgxsR9UVcVQwc1esdYG8UdR+0muDqZpAqNdCHsvkumxsQOMCTqIyXd+ZUr4li8EDcAkz5
	lV3FEbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBSq-0000000FprG-3GmU;
	Fri, 24 Jul 2026 08:41:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBSp-0000000Fpqz-2msr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:41:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21FF9600AA;
	Fri, 24 Jul 2026 08:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE961F000E9;
	Fri, 24 Jul 2026 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784882462;
	bh=nfHLq2po8UI/y28qstFvUK43HAU86pkJ/YHd7F60yAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ViZwD3+kuJ69SGRGL+83J9kVDA3tz0DMI2DievgGbJvH1/EUkk8zG4wTrsDk3avPB
	 NMf9Y0eeb42glJQXjXoJkS9vOsaF0KFrWrfiQQspYJ2r0xfA+my7j+M32kGSvFl0+n
	 t9gDvintI0Apxmzu4XuYkF2OnKtEWIVpCUJjOhB4e0FYubhDRctVJPxN/KknFDNzkX
	 RlQz/jLO7YUBcqaltEbtncM5Ui66zI0MVu500Hty4NChP+KW53aBWCNcRNG8kA64PG
	 9SR3I2rmAKTwGWlrDG7XNl6sTM8TPnAXovSVidTer0WtzMtKtz18GaLUkSzxBgizG9
	 8b9M5QxQp9kTg==
Date: Fri, 24 Jul 2026 09:40:56 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
	Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>,
	Jia Yang <jia.yang@oss.qualcomm.com>
Subject: Re: [PATCH RFC 00/10] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
Message-ID: <20260724-space-magpie-of-promise-b71ead@sudeepholla>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
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

On Fri, Jul 24, 2026 at 12:48:05PM +0530, Pragnesh Papaniya wrote:

[...]

> 
> Changes in v8:

Yet the patches are labelled as if they are RFC and/or v1, so it gets really
hard to track.

-- 
Regards,
Sudeep

