Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ED110BA436
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTRkfcsT7jjQ0+9rTtyPU4l8DSKUFxIt1C7J6rqYS8w=; b=AG6rddS1PxNnwisg48Yzj7Xi3K
	2WZI8WS5jj82b9fM8dCBjjl3/5iJ9Kpz4CjRTu1UnQWsCDDVCesnOC6SAFxeWxMZpXujtEzdCuM+N
	c5mzhg3Zw62c6ChCyJBG4a/neUi93MIpEfMJI6HNdYHMs7p56tbzXch0dVHf3cAZIJFI7XzfUVY9n
	doZO/NKHE8jNg8hXs8B23nQg5v9D674LcuPFmWOBlXdIjoPxn+YdMJsPjX/urHg0v1CVUu7K9lEWf
	9OGxeaI0tgQbOaQr5cK5kWGabzqv3F27ERhYUYKVvd04ko6nA2AYz1zcoo2Z2HH84e2xskRp3ZCw3
	BW47VlDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w628u-00000006vfQ-3pwA;
	Fri, 27 Mar 2026 08:02:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w628t-00000006veQ-3xK3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eTRkfcsT7jjQ0+9rTtyPU4l8DSKUFxIt1C7J6rqYS8w=; b=fM+rQm5V671Ppgitp5jQJtywrX
	5cbqrm8Locnq2Jw7Q8HsQ5qRBqc2dNm/4CdQytiCg0cvnVlJqCxVis+ez8/XCuJwrEUYy22XjoavI
	Rv9PGi0T29ZiJFFRmZuYE5mFoLwnPCnd8NUzt7ZKu8jL8ETMIf+PmZRkdFRgNpT0J84ZP6vMuPiNZ
	IZNevtwBwghF0AM7JCsPcQ2w49zlwQgODL0MMSz911/WEzBn1IHF9UttPV/wsU1l0q/gy6fxaR6Kc
	q+jvgPySfpHyTKeLZCNtnCDlgotxuJRxM6AqHC+Q5rScV2vve6Fq5cYz/BtxPFSLc5wyVJ335/HFo
	DYlQHGCQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w628p-00000009vSZ-1KhO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:02:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 254D540C21;
	Fri, 27 Mar 2026 08:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C60C19423;
	Fri, 27 Mar 2026 08:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774598519;
	bh=zL1tzQ8Jn+sA4lHQNs41A0FQn6vC45xOTefrpy+bc8o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=smsy1RdBcwzuc1O2+WRN+wfApxWKuc5ww9DJIcjS9S7y8vVNifX2GQ5Qfj5o+UvSS
	 9eDgy8V2hz6igFh0tbnSqKq33RftgNNdS8Y2UW83y80v7rtgbiohZz0Xe/IIXm9NOK
	 cvLQlJyX8XRt7OCwMAZAWE2ffrtk4DN8O/HWAUBDrW/h6/r48rqGiWtqchnEIJEvin
	 ybiuIZ50YQGuSoP/nd+4vHy1ede7MHmXI7MAYU9RD1KAWlwqPXaYx6A5HsdBjv9mfo
	 d+BuWQW95mh/tbcs6xGfIDiRpwRc5KHj0nxOorYp+ACevS+m2yj8Hr0UAqCYbFnpeE
	 UU/gYYXuNCcZA==
Message-ID: <31bfba49-2cc8-439c-b08c-f75b853fe993@kernel.org>
Date: Fri, 27 Mar 2026 09:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v7.0
To: Bjorn Andersson <andersson@kernel.org>, arm@kernel.org, soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Daniel J Blueman <daniel@quora.org>, Ravi Hothi <ravi.hothi@oss.qualcomm.com>
References: <20260326133845.66761-1-andersson@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260326133845.66761-1-andersson@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_080203_856926_D5122C4C 
X-CRM114-Status: UNSURE (   6.02  )
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

On 26/03/2026 14:38, Bjorn Andersson wrote:
> 
> ----------------------------------------------------------------
> Daniel J Blueman (1):
>       arm64: dts: qcom: hamoa/x1: fix idle exit latency
> 
> Loic Poulain (2):
>       arm64: dts: qcom: monaco: Fix UART10 pinconf
>       arm64: dts: qcom: monaco: Reserve full Gunyah metadata region
> 
> Ravi Hothi (1):
>       arm64: dts: qcom: qcm6490-idp: Fix WCD9370 reset GPIO polarity
> 
> Sumit Garg (3):
>       dt-bindings: display: msm: qcm2290-mdss: Fix iommus property

This introduces a known warning, which I already reported and pinged you
TWICE on IRC, including yesterday. I did not indicate that my fix is for
current cycle, because I did not know that troubling commit is part of
the fixes branch.

No, I am not taking a known warning without fix, especially that the fix
is right there.

Best regards,
Krzysztof

