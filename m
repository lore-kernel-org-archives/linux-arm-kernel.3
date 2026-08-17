Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC12C5DF77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 07:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sexVLaAvus5i+4QbLxv9ZcdjQTc6DH4O0Hmjp+yRD1Q=; b=ekfnkM0cSc0TGdq3JTONLtwQZ2
	//sY9wLDAoCCbC7SbuPO7hbG6zOoT7a9Wboa6PPMZ79m2DUcnlFw2IyFIe64wd3STem2wPsPrZua3
	c2xDHwQ7+8f5LCrrvUu6+a0AeU8vZo0/W76prtCgR2y8DEv8Jmtye1+dsCCkfWw0eedrJGRhfW4Wj
	DdRJ9Yc4dKiSaUhCLqjXt0sFVrnlPnMQCFkF9Lj5oyrALy+FRA1UypTzn0E4nleu9C9HbVj+zKPaa
	DozDQTpISF8uibxo/5cDfYOyP6akvmKxvow5SlSN+5quHsh3uOdSqbxEPEwbqcGeDPzA+3bDoedjP
	jvjskdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrif-00000005Xcw-0QaT;
	Mon, 17 Aug 2026 07:25:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvrid-00000005XcO-32Qh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 07:25:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C675601E9;
	Mon, 17 Aug 2026 07:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B671F00A3D;
	Mon, 17 Aug 2026 07:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786951514;
	bh=sexVLaAvus5i+4QbLxv9ZcdjQTc6DH4O0Hmjp+yRD1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cBkBczkgjJDmUoHfrp8HGEZR2Id2sZaSpmpYVmRamLLdwXZ3wzlONtL0t9CPxvw90
	 Lvr+rRcyhn4f/2uXYmIl7Fmjgfc0ldz46XMcHQZgmoMGdk04qPxr7KQ5k7dI7dP42o
	 Dust/XoKLfcrQTIFGUs1Jp6PkRitBEpTBaXhK5eOFumvk0iekWJM+8B4EijorUj8RU
	 skXAX6fxj6NB1repo3TNSekp0hWSNKKJRNK10dsoDxfz3vyZiLwGFEaGqYIQZH65JZ
	 41g39uNW4qdHvmZyF5XhPix8dbpoZjt0UWisWXHwgDIAbgsXOfQn/g0wjPCcoFtETw
	 RTFdnuS1jNHpw==
Date: Mon, 17 Aug 2026 09:25:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh
 clock controller
Message-ID: <20260817-gracious-infallible-duck-1dec6a@quoll>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-4-3079794f0f73@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260814-kuno-soc-support-v2-4-3079794f0f73@oss.qualcomm.com>
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

On Fri, Aug 14, 2026 at 01:01:35PM +0530, Hardeep Sharma wrote:
> Document the RPMh clock controller compatible for the Qualcomm Kuno SoC.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


