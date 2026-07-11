Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E4AC44506
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 19:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MeqxyuSFOsfA7kp2hQbDLGK4Y258AvNZPf0lyCyxsQ=; b=tkmjZQkPsCyrCDziYzhz4wy2cp
	bVbRrN3xbBUYkDLK3QvXdyl2tsLWy8RdMfasQqDg6NCxH8yuMyng4UFbk3vWAOsrwsJ06+Elrpysz
	QBaHE+4VFgpAGGHFrJ8kbBJ1gLW8nPt4TKx09MaYyTdcUXf9xii3dZ3JMJby28qwH6f1Uc23aPQje
	ETPSXr8HUsVwCrz6TC2JworggXDPNClES/6WZHpWBM3vO8ykyPVzpNCxVQaHCqDX3hotcUY68Wb15
	sepsge7WILwKV0MujodDVLMyLwOEyugs5xIxi19T7BAKrmtj1gpp96wkYiHB7SePZTu/8apgVqSHj
	n1/TEs4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widiE-00000006pIv-1k4u;
	Sat, 11 Jul 2026 19:50:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widiA-00000006pI7-2AuN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 19:50:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F22286136D;
	Sat, 11 Jul 2026 19:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49431F000E9;
	Sat, 11 Jul 2026 19:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799405;
	bh=8MeqxyuSFOsfA7kp2hQbDLGK4Y258AvNZPf0lyCyxsQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S9xKZS1AxJRSq75MmrZbbaBfjl45aPKS4vPveMu/Eaa0RTSt4MMbBv7RGamjCFgoF
	 /iu6UALf5m3eQZTPuFu+nZHv2xC5AXD5JLoQ2FKXpIb8qi4QVet771OKAb2kgTJM94
	 cSqFjfogApolQM5CVLth/anoOAOYmVthO6C9bX9cTC5HmP48LYsgjaANqgNHTKsEyy
	 1NafuQXxAU7yrqdJr3/vuKG4PHzzztfn8OKXLukau0GhP/1Zcr9h0IET2YWgJ8A7VN
	 Y74oWMLTkE8fIISQ5ZiFCVax1ChIqyUFIJsOjPiMS6KgaaUE+5YHvf1vv9VzqDk+hF
	 N5jfRpwUrsi/A==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] Enable CTCU and ETR devices for multiple QCOM platforms
Date: Sat, 11 Jul 2026 14:49:44 -0500
Message-ID: <178379938589.163099.8612045419740937512.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
References: <20260204-enable-ctcu-and-etr-v3-0-0bb95c590ae1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 04 Feb 2026 10:22:00 +0800, Jie Gan wrote:
> The DT‑binding patch adds platform‑specific compatibles for the
> CTCU device, and the following Qualcomm platforms are included:
> Kaanapali
> Pakala(sm8750)
> Hamoa(x1e80100)
> Glymur
> 
> [...]

Applied, thanks!

[1/3] dt-binding: document QCOM platforms for CTCU device
      commit: 1ab1005cb6beb278df53b23f7cf520b4d6bd56cb
[2/3] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
      commit: f77ef7a6a97eb29020be430d3125e3b0e0e713f8
[3/3] arm64: dts: qcom: sm8750: enable ETR and CTCU devices
      commit: 55d6c80716b1ceb39fb8143976dfb1dda4e43a2e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

