Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8E4EEB57F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 11:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HA/Gty4bffKjDHJBqcHn+tzVR7NNSONJo7eGXQhFd0Q=; b=wG+A/twz7fwJaScRJqq/qzaIA4
	Q2CLlENK6SufiAkiS+uJBfFNWAt4nzaxY0dI0SgB7tj4ZejWUoTUdNkafwnEKnmInWpDPFcuCxOMH
	I4RYBA93vRk3wyrr3IuoKCf6UNDZ881v/Gz4Aou19BeBlQe2UgpeSWONfsN+EfqaXe2nm+V3olI/P
	8TPHHl5I7rft/XzNHbAH7XnXwKFYIdY6vhxe7/xAyMI1PHG1c4pUxVRSTIo3K9FhdryxO54yKOhbv
	mPePH///UC8B9sYal5y52kVbHNQ6NsF37VNhM1uZhDf/GFymz5g6ImWRUakr1ssL1CXKgElztf87Q
	3gLyLfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbGXY-00000006o1C-0wqq;
	Thu, 01 Jan 2026 11:08:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbGXV-00000006nzs-0s4r;
	Thu, 01 Jan 2026 11:08:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8332443DF;
	Thu,  1 Jan 2026 11:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15080C116B1;
	Thu,  1 Jan 2026 11:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265700;
	bh=oDX9OY3aMzQan91I3g8b+LhbDuDdQqiBxOgdnT9r130=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=GWOsDNdxz2NIQGByn4jsxvXUao/5a52yd5gNMaHfXOQOT+5kLGTdiz06Bwam00uD+
	 0IgLgGTTAQotzc4Ud2nlMG1GWtdZHPRYYhtsmOO6maQWHSrse6MxT65rcbhQG8C32g
	 8vdae/OMGHzZWPgw45+d1Mpref8xc3SU5HQoFnAnsgJTbhQpDHUQ6NjxCGnHbQXdf4
	 zm51WKVJ4Pim0i5+Io3w2ni+p0iISEhDwgKG0IZ0u2SvH5pj/mJ0ajmkAJIN9v90rO
	 EJ5SFt7OZYCTepC+ZOolQFfo4qCRXpVlxFkk8I1Q5jNu1iyWVXEiKoB12L2tqWPimN
	 qyYhaskoXB53Q==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] phy: rockchip: usb: Simplify with scoped for each
 OF child loop
Message-Id: <176726569771.201416.11757049759201403821.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:38:17 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_030821_292340_15FB076B 
X-CRM114-Status: UNSURE (   5.41  )
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


On Wed, 24 Dec 2025 13:44:08 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/3] phy: rockchip: usb: Simplify with scoped for each OF child loop
      commit: 943dbe1470529d7191dccdb56ee0bff83d3606c5
[2/3] phy: core: Simplify with scoped for each OF child loop
      commit: 175b46f31fe60d7772fae19f731f282327cb333f
[3/3] phy: renesas: rcar-gen2: Simplify with scoped for each OF child loop
      commit: b64b32791fb557f922beebddf74c47baf338cef0

Best regards,
-- 
~Vinod



