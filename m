Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C26C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 19:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4TXKZrBRp6Vz4sMfZzR8NXZyvfSmNCJEm5ltozR7CI=; b=cyVjEhAIzhb4iOBjyRN2+V5KRy
	7kYQO78vdWNu9XJRq7aq1BJ3KcfeWZbT+XM06PwdqwnRM9uB49O27971QTS74kcBIlifMj1DCDG4B
	YIWjiZGcqhvtbp+QcFDMZdkFuVtQ6+QHwNuR5gWhV3yBkUUSm5DjJO2KyGtEx8LpAwBI04WxGl7sz
	JqLa6eucPcYHf8zColTMi/r8WGW3cEz58zTYN/OJKegOo008iKV3BAAZmH3uXeXHBvSCxg7dtxsuN
	drpQjZzMfS0wXoRMeWMx3ZPcXM5ld/iCMStEsQqBh43jxz36YCXby26IEgFkGzt0EnN0RVYswVx6i
	0ums+NiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widiB-00000006pIQ-1JyC;
	Sat, 11 Jul 2026 19:50:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1widi9-00000006pHO-0lWY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 19:50:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C3994385C;
	Sat, 11 Jul 2026 19:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EA31F00A3A;
	Sat, 11 Jul 2026 19:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783799404;
	bh=C4TXKZrBRp6Vz4sMfZzR8NXZyvfSmNCJEm5ltozR7CI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZleJ7h2ce1/4ys52OET4PocZxKV6z4WYrLLPKe+9KQWdAI6R58kxMbQYuOlN7OmvS
	 kW1ZX5WzichxlVfhECELM1XUo5HwhyO4o+2CS324MaxbtPTKpgSMNrGA/kfdifKqkg
	 MGokP7j2w4acAsrNgWhFmKg2tmV+EPvLzZvtSN6GkzjEpLGcoFxHTuYAEAsu5CFPb/
	 Yc8CUJn3VrkCYRTDhA8EI5fV+VNoRxIwX8UhR0+gjorbo5s9fFh+x+fP15KdYPdb2h
	 7UNe5o5N2NDgMl2urbKFzqu88yPsTnJDhi3BJmda+a+7DyDPp1IvFHfsaRysjBl43Q
	 2xgXc83mwhbVA==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/2] Enable ETR and CTCU device for hamoa
Date: Sat, 11 Jul 2026 14:49:43 -0500
Message-ID: <178379938588.163099.2863497424373585668.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
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


On Thu, 06 Nov 2025 09:57:24 +0800, Jie Gan wrote:
> Enable support for ETR and CTCU devices on the Hamoa platform. The
> newly added CTCU compatible will fallback to qcom,sa8775p-ctcu for device
> probing.
> 
> Dependency of the binding patch:
> https://lore.kernel.org/all/20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
      commit: f77ef7a6a97eb29020be430d3125e3b0e0e713f8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

