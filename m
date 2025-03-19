Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8EEC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 21:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/CPU9v6dAGBa5E9dwjyEzCj7Km+PD0nJH8uf/bu4jo=; b=4Xa0uFc2JGyygsFhcNBjnuqq0U
	BbynOBOlqrUZkgqUcogurm/A81rbJkmJDHYB9VB8CM4502IHDiEtXm+dAgKh2+0wW4qiEPLT4u+4O
	0a5wivJqj/sk4Tk8zJaEgXtLHKD325415+FK7ETARKNDAEAhbzoh3n7+OVzTFdH7/3CHTW45OAfIf
	aLbvHZqKGqvAjAQpJDl9MMu1lFtvrGi9bZ9GyXKN/hUpwMFf/HAWKjuQEkhmBNUzpK3NCAEE7VAw7
	059fn1rDmkq0uDBpsyROyejV3bpbxSKXBXcVVkwpNoWqBTVW68pgOeE92Xa8xu7eB4FkXVfrLtS7s
	5PaoxLvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0iP-0000000A7ra-1O8z;
	Wed, 19 Mar 2025 21:12:41 +0000
Received: from flow-b7-smtp.messagingengine.com ([202.12.124.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0gi-0000000A7VT-1Pt9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 21:10:57 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.stl.internal (Postfix) with ESMTP id 39ABA1D41694;
	Wed, 19 Mar 2025 17:10:54 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 19 Mar 2025 17:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742418653;
	 x=1742425853; bh=W/CPU9v6dAGBa5E9dwjyEzCj7Km+PD0nJH8uf/bu4jo=; b=
	NKKATCAn0VX7Ihv8xuf0fnvj3bsQiQRRutFV6XkWJ65/pq1IM7ThfVy33XYOSJHt
	dTDVg11aJs6+wHWPjkTwKztahAbtZfGgYI/Q9R0oVDlJb0PyuAukPh72Aw4qu0LS
	hZaCF0F5kqgavg/UgZuqAPsGuIG2dLI2E9mdvMttzItimqPxrAYFHoYQ0LLQ2yvT
	JlEZ3qmhFBW5gVKtkqca3GZ/V0qr/5gq8Zpp8U/jlRqrlSQ7KqdJskc2/3CyFA9I
	GaTaT9htC8gHzQp6n+EtcGEAEOmvdSzI2Ruzk/kdxk4FDfX8FePSP1G7kFUeyE4g
	3fy4xGqdZFDKu9ewGeyHqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742418653; x=
	1742425853; bh=W/CPU9v6dAGBa5E9dwjyEzCj7Km+PD0nJH8uf/bu4jo=; b=Z
	5NzrRAAgQzF65e6QYHOxMfnHavEdq6p0phDF1GDyt0rEeArdNaTBDLRpZrIVg2iM
	YNlJuwL6VFyQkhfyG6jyraO0G8KanVyapFXV2jxJCGDKXyVkPnJ6nYmEMEjCyHMc
	i7dvwasL11mVWV/XdMlR67/wylB1MFcO/cNEL0YrEwMxRGmARJhjbUvuLDHrrM5G
	QmOLjoZEkHWXkP2rhs4v39PbM4hrBiEau6hGWbcsxxRHyI1infxc4Qc04hY/jJib
	tbykM6tdlalgl/dki7SqjkqC/rhEIvMQNC5bhSE8+aA7TY3vt4r7J1MG/CK87RUY
	MmLkcbhcUl/JbX0AGR3fQ==
X-ME-Sender: <xms:2zLbZ8TYWBr923ILGRDI4nXzyCFBKFUI9qP2-kpihxcdNzLKPwZU0A>
    <xme:2zLbZ5x_Oh_JENN_Y10KBTs6n3d94KDEk4kWEiY1h9bwfCQBAWgZ15iSE-f8QEmHw
    _ItovvA8C-4bqbSpnE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeeifeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    fedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehluhgtrgdrfigvihhsshesfh
    grihhrphhhohhnvgdrtghomhdprhgtphhtthhopegrlhgvgidrvhhinhgrrhhskhhishes
    ghhmrghilhdrtghomhdprhgtphhtthhopehmihhtlhhtlhgrthhlthhlsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepfihojhgtihgvtghhrdhslhgvnhhskhgrsehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepuggrnhhilhgrsehjihgrgiihghgrrdgtohhmpdhrtghpthhtoh
    eprghmrgguvghushesjhhmuhdrvgguuhdrtghnpdhrtghpthhtoheprghnuggvrhhsshho
    nheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhonhhrrgguhigstghioheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:2zLbZ53Vvr2l6NIOm3qKZGZyvVj-CyCoqEwprSlhiIi_9rXNm9SFmA>
    <xmx:2zLbZwBuy5UzuJ3S6L-dwBAver38lEXufQES6EfCaHYLBmO8XQfZrQ>
    <xmx:2zLbZ1iatTC3rBPg_gDfxAFQUdiKwQe9GR5ePUCssPi2ixaUYZsZrA>
    <xmx:2zLbZ8pjBAAMXHJ4L6Kw2yipjWmIv5bol3F_QuOtnErVO_SzuM4q5g>
    <xmx:3TLbZ5A9xvJcehRcNbNvP1fAi4uRuiZm9MbXa3iN9Q3C1txCmT0H9S7C>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 933112220072; Wed, 19 Mar 2025 17:10:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tb672cc3182dc66af
Date: Wed, 19 Mar 2025 22:10:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bjorn Andersson" <andersson@kernel.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Chukun Pan" <amadeus@jmu.edu.cn>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>,
 "Aleksandrs Vinarskis" <alex.vinarskis@gmail.com>,
 "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Pengyu Luo" <mitltlatltl@gmail.com>,
 "Alexey Minnekhanov" <alexeymin@postmarketos.org>,
 "Danila Tikhonov" <danila@jiaxyga.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Manikanta Mylavarapu" <quic_mmanikan@quicinc.com>,
 "Nikita Travkin" <nikita@trvn.ru>,
 "Praveenkumar I" <quic_ipkumar@quicinc.com>,
 "Tingguo Cheng" <quic_tingguoc@quicinc.com>,
 "Cheng Jiang" <quic_chejiang@quicinc.com>,
 "Janaki Ramaiah Thota" <quic_janathot@quicinc.com>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "Lijuan Gao" <quic_lijuang@quicinc.com>,
 "Luca Weiss" <luca.weiss@fairphone.com>,
 "Mark Kettenis" <kettenis@openbsd.org>,
 "Maulik Shah" <maulik.shah@oss.qualcomm.com>,
 "Rajendra Nayak" <quic_rjendra@quicinc.com>,
 "Rakesh Kota" <quic_kotarake@quicinc.com>,
 "Viken Dadhaniya" <quic_vdadhani@quicinc.com>,
 "Wojciech Slenska" <wojciech.slenska@gmail.com>
Message-Id: <a2132f78-f113-460a-b7ea-022a39e4e64b@app.fastmail.com>
In-Reply-To: <20250317215921.2031880-1-andersson@kernel.org>
References: <20250317215921.2031880-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.15
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_141056_438892_58A54983 
X-CRM114-Status: UNSURE (   7.99  )
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

On Mon, Mar 17, 2025, at 22:59, Bjorn Andersson wrote:
>
> Krzysztof Kozlowski (17):
>       arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: 
> sa8775p: add QCrypto nodes"
>       arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: 
> qcs8300: add QCrypto nodes"
>       arm64: dts: qcom: x1e80100-slim7x: Drop incorrect 
> qcom,ath12k-calibration-variant
>       arm64: dts: qcom: msm8998: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: qrb2210-rb1: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: qrb4210-rb2: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sc7180: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sdm845: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sda660-ifc6560: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sm6115: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sm8150-hdk: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: qcm6490: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sa8775p-ride: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sc8280xp: Switch to undeprecated 
> qcom,calibration-variant
>       arm64: dts: qcom: sm8250-elish: Switch to undeprecated 
> qcom,calibration-variant

This seeems to remove the properties that the drivers expect
even in 6.14-rc7, so the branch is currently broken and I'll
skip it for 6.15. Let's see how we should handle this properly
in the next cycle, since it's too late now to fix it.

      Arnd

