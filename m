Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4ED3FC6170
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 04:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IemGK6UKm2mXTRoqZ7nJckWppu1HiqhJjxUp5QVLL0Y=; b=NqkTIyncwFWRVCTFd+uam5sgst
	ruJHVTbtO/2J+JS/iqq25BM6D5VzjRhoHGVBgASERb1nu1prbjbpODFUub6miXUfW46F24HaYyXGg
	wi7XXBZaV05aPgTH2DpRY76qpUOU+xXmtm2TYrc2Mj0mdRUSRXxIJ+5nQgM+rx2+EEBoYqoIiL3Qn
	gG+TAJ0RtK6XfguL/W8Oxbsf1kzo65E9/CiVkoKo1xYEPcxlfO4GZd9OjzBnsk9YaLWW6obVbkfA7
	OzkPHx4ZsgK+RvEoK3PcyZRaSMp6e8v8n7UBI3ceYYzSw0M0rmQlazZZUbNjAAC5EE9OmUDwVO1OJ
	lB89+Byg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbtLa-00000008y7X-106Z;
	Sat, 03 Jan 2026 04:34:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbtLX-00000008y7E-2ZPZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 04:34:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 277184194A;
	Sat,  3 Jan 2026 04:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0CFC113D0;
	Sat,  3 Jan 2026 04:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767414871;
	bh=p4A87N5ftzlH7YFKC1X2sdFtN5r6pL2CEkpBHwe3nWc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FoFAWFv0lY+JVohu01zqcCw8tuwA1uHc05+YrtEMK13FmWN09mrTGtnGwBcFoUY9Z
	 OD1SD1GxaH84HSesyeIvKXu8qF9R3gqoaTyc4kFECH8n7SfmgJGRTgJ0VlE7QY+MUL
	 gcVEvSZvtsqsEH8zLPlndtmFrIYrvxi3Y2wcqOTO+XShu+VaUZPd4e8hpBfT47Bs4a
	 cgulWgrF8Q6ar3V2V/W+0AY5LgjOiPjtk+UjyIEz6unA9J9NcMJIBY+4blcBN+lNVn
	 J3HBE+5EtTDrSeGpzYjm/GaALsoQY11LPmZgZi8ov+Li8lpwtKXTZyU3sLJs5JwAng
	 k7JjYLrX7fG5w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/2] bus: qcom-ebi2: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 22:34:26 -0600
Message-ID: <176741484218.2558240.11360428266466272086.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125030.65186-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_203435_699566_DCB54345 
X-CRM114-Status: UNSURE (   5.93  )
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


On Fri, 02 Jan 2026 13:50:31 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/2] bus: qcom-ebi2: Simplify with scoped for each OF child loop
      commit: 9c252f3c8f390fae4ca09de36c9262a35ae88ace

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

