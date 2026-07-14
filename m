Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E897C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 22:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLIsbd3rIu0q440Nh2W6RF4EH0NXixw4UPs/AFN2KRU=; b=DDdBwtWvXizQ7y/vz0pLNaDn6U
	Wp38m7fX73+KwPalBW7YiIvhE7Dth2sklzdio0/Q2O68vhO87dfq+2VhR+3CJdWRkbPm5MIkr9NSd
	8gHvqe8ktANJWHl7IznZjBVacE7pwjHCQYV7PTZB3nb1aE8pxcmbGabNcETjFWe6vtRHyW5ii79kA
	RggRTn6uHdBZM4JuvUM6RIzP7tcodxHUuS73tzf+hNUu8V06YwJiB8BlzIx6DEn1GPTMm7yEGKGfS
	nnzHpaov4cwiQadAT/PZt9Bv5mn3ulUMS/t5dcaDsqpAuHn2pOpox4uR1pf5Txlmkg0ngFEyncdsa
	vNZVXheg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlOH-0000000DOAd-2igc;
	Tue, 14 Jul 2026 22:14:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlOG-0000000DOAA-0Z21
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 22:14:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 74C4A43C89
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 22:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C1621F0155B
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784067251;
	bh=BLIsbd3rIu0q440Nh2W6RF4EH0NXixw4UPs/AFN2KRU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FaKgu+vB2YYShsFe2M1JXkalONH4g3PsMIU7elO6lSWiO9dMoJwlqx4j8W/8cPjYg
	 x+t2lVWhdjNNhMEYK4ngb8iqlT1Kj+JEQ/eCDilp9c4RWCuPiwkFuxCiatLqDGF5SL
	 2MOtduM7IRUQnPl2+LwD636S9a16tBhEDpCJaBLWK3zViZ4djKjamY+ToFzDEE/FFy
	 VAGAvB9TamK+/1fem6UcIodLpkiMqFiO/QyajNcoQu6P2ak6ssvHffzC3O7E81K1WG
	 GApTL//Y4RCUu/ta84KBQWM8VeimHtoQaOyZ/XPxfPQxb/EJi3FtHkRTc8dzmjVhZ3
	 7HsXS5GEem7zw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c166f1bbeaeso132792766b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 15:14:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpN8upWUfX4vZALyAgd8UfaZpryNVoLcQmqS0/CfqHHX6WR15NM4fu6aYFC5ROIhBXlRTsf2sC/BAFvnC0gbN7o@lists.infradead.org
X-Gm-Message-State: AOJu0YzZU8HL2DdbakuaJeIuZ7+oQlOYnpqhHvMoHBpPIE6L/Y2DP7cf
	UfQVl5f0522GcAB10GzpdCWGealyrR3d0SUIrE+6QX20LZ9VmaRYdCsXAJuHlP7YvuYN+BaQKga
	jc0JLlSFpsYt/coQXbHBoLXH8Z/hAgw==
X-Received: by 2002:a17:907:97ca:b0:c12:73fd:a6cd with SMTP id
 a640c23a62f3a-c1661928df9mr370952366b.52.1784067249841; Tue, 14 Jul 2026
 15:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
 <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
In-Reply-To: <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jul 2026 17:13:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
X-Gm-Features: AUfX_myV2MEj_WnNpL4PNdWyXrVcH3TfBaO-6JJmtqnBFQREW3AFA5aOuTd8Dkw
Message-ID: <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jul 13, 2026 at 8:58=E2=80=AFPM Jie Gan <jie.gan@oss.qualcomm.com> =
wrote:
>
> Add DT nodes for the CoreSight debug and trace subsystem on Qualcomm
> Shikra SoC.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 1298 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 1298 insertions(+)

NAK

Fix the sashiko issue.

Rob

