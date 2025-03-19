Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA87C36000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 21:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+rvv/CD9vxLz7lV/reT4sf6e2D22+QxuR3L49Wvlok=; b=d8tmCA7vARAIxU0snJ7E7pG3sf
	hCPiCh444831VchbP0vW0H5fiw87QKZpWGHX0tSRLcVZPDtnG9YqS/uG18FFE7nwi82vyxsNXMrDO
	l4RrEy0BUwbUxVdhxbya8wD8dDi9I3e7hqrwiAZGdTN5UF+YyMeX7t+xADvr//E1BSf+/eRSn/wJ0
	qipvhZ6wvEVwnGX5BVXhWo7eofVbd+6yteaeWN12UVNl5brOZ9EsM0dMFnbekSgisWOUvz67Wbfy4
	jZEw35s3UYTqibC0sf9mFXhZ4hTXIJ43dEjSlY8ixdVoogrtLgqmsstkgg8Ft82V0VL5RB6raZQm4
	OrhmDMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0k5-0000000A81e-0dIK;
	Wed, 19 Mar 2025 21:14:25 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0hm-0000000A7kk-26vU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:12:03 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id A598011400E4;
	Wed, 19 Mar 2025 17:12:01 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 19 Mar 2025 17:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742418721;
	 x=1742505121; bh=W+rvv/CD9vxLz7lV/reT4sf6e2D22+QxuR3L49Wvlok=; b=
	CVMaodeoCrj9PJuR/Fn7jstiwU0oDDK4F07puUGNRMN3FsD/+Usnx6DUpzs+qVT0
	ffTf4tnjQ6ojHHQFr3aMk6MTnimJdCM+H/z/1j9IQ+ePE3BO2Blg9nh6YFFvZXs4
	WyrAJTGRjEfJkdaaIh1G4Oe0KznzP/nz7ASjuVt3kl3qT0vdNsa1bd60TsCy3/1d
	aDdlDVNa3x7vFHcAdwgZJJE58ygDR5ZQF0GIBFqHedgjT7+OGXi0Hd7DykDxW1dF
	j3mPRLSD0/4ZA4afCF7zUvI1K5dpAINIkNbZvfMNuPEPnHatH5iARuuq/tBKZ7O8
	l8txlm5B8fp70wMFi4uRBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742418721; x=
	1742505121; bh=W+rvv/CD9vxLz7lV/reT4sf6e2D22+QxuR3L49Wvlok=; b=Z
	oaMtmrsjcpU/JSQ2BB4JFcVkE78+aCeNBpZbP7KA+mwwWcf8VNQdjwuix7sCFUsV
	ck8YwhaS+WzMc5SgnKrgN7shVxlkkKs9oWFOUKUMiCud2u1gBg4QkBcn4pgsTo1A
	VLFp2a6Y9NGHcERFG80SLyjnqp1Em9+q58ZRlCdOJi5ZeW2I83RdboQtpfJ2Ewbw
	uIM2Q9Mn2S/a/cxrN+t0qIh0RDIMUf3TWLlzTXsAH8yARcVmhQmOlpgLNySyonFv
	UCRHmjOoUv1Zj+f7WmIIFBqxjancnE4JcFFPlpLwmBcNkptXlGa04JYtc3LG+D3E
	4C3Em/gUtaJGRD/SDTLjw==
X-ME-Sender: <xms:ITPbZ9Jzs85nCNESZ2qdgR0JP32GmPT47YfEh7RIKCgZ9lL0z3p7BA>
    <xme:ITPbZ5IYBWZm0JmnCon87fJ9bTx4m-RW1070wOj2qI2Sm_EuP6nyenbXh1S6XVyw7
    CjJPHXSeeUXp_CT7kE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeeifeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    jedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnuggvrhhsshhonheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepshhotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiithhofhdrkh
    hoiihlohifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    epqhhuihgtpggtkhgrnhhtihgshhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehl
    ihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ITPbZ1v6Nj6qRgtdx62zADek5hLjortgoTmChHNRlt5EYY0XEK3bBw>
    <xmx:ITPbZ-bGHd1BcWZa3HZS2lnGezc1oMlqeLienbaf8FDvNHJhU324tA>
    <xmx:ITPbZ0YYrPIUhuPTY_F3M3l_PDBxVcRF3dkdRryRgLDHeXP0UJxVVw>
    <xmx:ITPbZyDWg4bCf4b0hEkAAPG4cCluN3OQJudocg554wP6mejhQ7bfEA>
    <xmx:ITPbZ5NxDck9wB0wRFkTwR-pS_ds0AdxuwbyppQmCmmzOteK9NVggMfP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1BF412220072; Wed, 19 Mar 2025 17:12:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T49c643150bbb3781
Date: Wed, 19 Mar 2025 22:11:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bjorn Andersson" <andersson@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Sanjay Chitroda" <quic_ckantibh@quicinc.com>
Message-Id: <e817e828-7ffa-4114-b957-35552cb16cc3@app.fastmail.com>
In-Reply-To: <20250317213630.2029212-1-andersson@kernel.org>
References: <20250317213630.2029212-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.15
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_141202_604834_776FE1D1 
X-CRM114-Status: UNSURE (   7.34  )
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

On Mon, Mar 17, 2025, at 22:36, Bjorn Andersson wrote:
> ----------------------------------------------------------------
> Qualcomm Arm32 DeviceTree updates for v6.15
>
> Cleanup indentation issues and a deprecated WiFi property.
>
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-variant

Same as for the arm64 changes, let's skip this one for 6.15 and
do it properly next time. The branch in its current form is
clearly broken as it removes the properties that the driver expects.

     Arnd

