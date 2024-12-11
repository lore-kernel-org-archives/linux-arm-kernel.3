Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29888E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 08:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uG2zljt/qHOjxH52ocGMOmYm70qQ6Jm1vSHHeh/qu3s=; b=3KOjWSNCsQE/u29+d56w/ffTVm
	hiYS0maXO7x2mhyUlBc6dSq6ixB6Da4TtkrtVCwpLAn5bJe6orRe5Wjv1az7Z15gNsoA4NaF212WC
	R4rvBZsyJ+MVaK3OTGEOu/RaIN7XoqEf6c6x8woyrZy7RhCa5ZKbX6fiQUodjbfB+yD8HjcsNpQ/e
	2aNxxo8Ic9r3yT/zfkSsFvP5CudUCsKhDIcq2ckvi1d24MIYGQWzrxdCNducNPXA+IXRkmbDJt9jE
	ok136L/SpeckoGPTGlZdz2KRcZqIosJATW6LFi9bzNKNV16ujnmw5E3CX3YtH8TEGagmXhu6sbiqM
	RmL5MGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIO5-0000000EH71-2k8Y;
	Wed, 11 Dec 2024 08:48:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIN1-0000000EGpu-29JL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 08:47:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51942A41F88;
	Wed, 11 Dec 2024 08:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B37E6C4CED2;
	Wed, 11 Dec 2024 08:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733906818;
	bh=u8rE7HesJK8eF5rDPer2tx63YrHUDJD+InQWPlIuiJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QT+Yv2qqqJhSilnfM65d4CMKFJnqvOBRkF2DD3rjqRZa61MnzFLQ3NCrLj1DlS7Dr
	 qH+lwJr/qaUS7a+GRf/CIH/+nZDZORnBlnDNoLdUld05XDGNyDyi9MzBzNbRUR4At7
	 sFxXAlerQgzcPc6J5G+Oqy3ffV6clGOj4dNcwH53OPd2c4kO7xlo7o42hupYPJtxeN
	 i6lRTKIZy8XXW/5PHq9bw5ELxLUTcjRK6YvVgGwZhuA5z3wdgHBS8Nq4Nlzo8w9oDF
	 SWiGsYL8wpvTk+C6TvrABsFYs13N9ZkTdTLxG0tJ9i6sduul9sc1Bgsam3AaWRcA9e
	 XbSSL3r6iVO6g==
Date: Wed, 11 Dec 2024 09:46:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 0/2] coresight: Add label sysfs node support
Message-ID: <avimk3fdjal6ohezktrexnbguxf6wj5tv6jbcqy5r4bnuww6kz@3xjt3mutne7n>
References: <20241210122253.31926-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210122253.31926-1-quic_jinlmao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_004659_612342_226F8525 
X-CRM114-Status: GOOD (  11.68  )
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

On Tue, Dec 10, 2024 at 08:22:51PM +0800, Mao Jinlong wrote:
> With current design, the name of the non-cpu bounded coresight
> component is the device type with the number. And with 'ls' command
> we can get the register address of the component. But from these
> information, we can't know what the HW or system the component belongs
> to. Add label in DT and show the hw information by reading label sysfs
> node.
> 
> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> tpdm0 -> ../../../devices/platform/soc@0/10b0d000.tpdm/tpdm0
> tpdm1 -> ../../../devices/platform/soc@0/10c28000.tpdm/tpdm1
> tpdm2 -> ../../../devices/platform/soc@0/10c29000.tpdm/tpdm2
> 
> /sys/bus/coresight/devices # cat cti*/label
> cti_dlct_0
> cti_dlct_1
> cti_apss_0
> cti_apss_1
> cti_apss_2
> 
> Change since V4:
> 1. Add label in DT and add label sysfs node for each coresight device. 

This is v5, no links to previous versions (I really suggest to start
using b4 if you want to make your process easier for you), no other
changes so subject is obviously the same and looking for this patchset
previous versions gives me 0 results:

https://lore.kernel.org/all/?q=%22coresight%3A+Add+label+sysfs+node+support%22

OK, let's try b4 diff:

b4 diff '20241210122253.31926-1-quic_jinlmao@quicinc.com'
Grabbing thread from lore.kernel.org/all/20241210122253.31926-1-quic_jinlmao@quicinc.com/t.mbox.gz
Checking for older revisions
Grabbing search results from lore.kernel.org
Nothing matching that query.
---
Analyzing 3 messages in the thread
Could not find lower series to compare against.


So how do you expect us to do any meaningful review?

Best regards,
Krzysztof


