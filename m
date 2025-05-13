Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB5AC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u87NdICAW/jny13v/jgpJ1UqVv+ap0izXMLDhWUKyP8=; b=S9OQTN/SPu138ke/vgdgq+WIZV
	Y2jmQ8w8Ir8Qg0qgX/jFVj8386eQZnIyCrAwRx+PoQffhNdXdmD8tdzx/J0LXEneR/QPbIWt5/ijS
	QloMlGCcs6U1U6SOxtHJVkZzgcP3zknxHptCcpTEg5A3Tcsz3/YbOWyAHPkP3K/6fhWMNbN4OR7Up
	c6kVIve5h2AV+QDfptZG2T0u7dujgPZH/qnJq2/cQfLOTgPCyRXM16mSOSSpaFCyKFki6T0Gb8Nfq
	beuhvh5JIt9ewEEa2cF4O+v5fQBF3rM/RWMlLgL+SFklaPCP3DPmbVvU/4kGdpBEK2OP0Fve/uz7Q
	o32UXqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwa5-0000000DWZq-3HAK;
	Tue, 13 May 2025 20:50:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwWk-0000000DW3L-10Tj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 20:47:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A6932614B6;
	Tue, 13 May 2025 20:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EFFC4CEE4;
	Tue, 13 May 2025 20:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747169221;
	bh=91T1VPpN0iD8ktDa7qsOceVNZlZJTp4gav1Jy25LnSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQb0qC+ym000T53oAyQDwuHJRpVGuGBoVFyShbm+el146dau8o2JDPo5yxkgxKpti
	 LL50ws06ju3UEMaDdSS+su6PDAzv6pLH4NaZOy+obXcwx1X85nF8xUMLLePAD9g6XQ
	 g7rY8Y1qcePT8OjIDPPCyC0u4pGh181Uey9HNrRFpxhSPr6xGxJ1QSfc3gQYofz6Kn
	 A0N/R4uit7/ngka1Qut71KCitesZetpE/SjmhTnHFQL188qDH1P93gT/pCJwmi1JTs
	 S1SQzOBhP7sloLPAa4ZrRSoMG7L5s3KM9G3VfLXYJDAmMsei5WDu0TIKWqVIhbXIv5
	 BzatqSTAUTu3A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Georgi Djakov <djakov@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	David Heidelberg <david@ixit.cz>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 00/10] ARM: qcom: fix APQ8064 schema warnings
Date: Tue, 13 May 2025 21:46:40 +0100
Message-ID: <174716895379.39748.10076819557208209836.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
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


On Tue, 18 Mar 2025 15:21:53 +0200, Dmitry Baryshkov wrote:
> Rob's bot has reported [1] several warnings for Nexus 4 submisson,
> however none of those warnings are specific to that device. Fix all
> those warnings for all APQ8064 platforms by extending existing schemas,
> adding missing schemas and making APQ8064 DT follow all the schema
> files.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/
> 
> [...]

Applied, thanks!

[06/10] ARM: dts: qcom: apq8064: add missing clocks to the timer node
        commit: 4b0eb149df58b6750cd8113e5ee5b3ac7cc51743
[07/10] ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
        commit: 325c6a441ae1f8fcb1db9bb945b8bdbd3142141e
[08/10] ARM: dts: qcom: apq8064: use new compatible for SFPB device
        commit: 2a1282861b73a4b8e45904e079ed3279c3f1c93f
[09/10] ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
        commit: 92c377bcafcddd43d4dca1aa60c865cdd2d1dbbb
[10/10] ARM: dts: qcom: apq8064: move replicator out of soc node
        commit: f2420037d90a8354594b3da541e19dcbb60c75e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

