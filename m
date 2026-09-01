Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15F2C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 02:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imccdf2g1mEFtExQXUXHUdzPH5T3kvgztV71j7lsVdk=; b=F5fZlZZJh92lPGdtWKwXaeQLpI
	Go/BcJxeY3ax+Aqy5oERd2k8GgEP0SFoRskou4bSwNgpPht3I9Nea2lN/qGueypnaCsPU1rQd8CT8
	MyNHiIIQms7nsIfwiQ/J3U+tSNtYzK1NBpD3MDHsXqtgX7cMoEDTwe9uIk1NMmS9lt5VmuBGegtRR
	nMqQ/HXsPPuxBK/czs8tKcQmpf+kujFlA4MJ1KWtMGm6XOUYLHALz71B6WtXsP5OStZyQsaJFiOHw
	+RAE9bgPmFyBQ40yLk1gOWSO2e75fiD6eTH6J475OaLgS3n4AF4vw65SP0GGz+V7sd3qmEtvUyoEa
	Uy8ZF41A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Dwb-0000000AqOM-1UpQ;
	Tue, 01 Sep 2026 02:09:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Dwa-0000000AqO5-0hk4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 02:09:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C067E40A42;
	Tue,  1 Sep 2026 02:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B25EF1F00ACA;
	Tue,  1 Sep 2026 02:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228585;
	bh=imccdf2g1mEFtExQXUXHUdzPH5T3kvgztV71j7lsVdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ok2cON5qzJUYs6HC/WtGf6nOZ+S7sog1jx06koojWhYpFvB1VjXlpU+vazbj6ys6X
	 5NaeODhTcaoc/Wr0vJz6n2tNSs+/7uMVVIQEQCklowwFfSRTC0jihy6WpRwsDFJhTw
	 utAT3OmjhjG2VfvLkMnFdFm2RfAE/kQ8ugvNCpyBdAyxBm35bEexK2wsO88UXt6SxC
	 J4hGZZQOjQ4lmZzuEyH0vh5MC4F1UfYUlc9dkyf+/VqvKRw7gSogBmSItmpuQXFjV9
	 sOqkbnoqyFXwJhzmXg95gCfi/FksnNECfYMWhmofd+jCJDZA4TWyC3W77+LTsVw++C
	 /fi4xgOjY/I9A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
Date: Mon, 31 Aug 2026 21:09:22 -0500
Message-ID: <178822856270.1835959.15842744749902984423.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
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


On Thu, 27 Aug 2026 23:21:03 +0530, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
> 
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
> 
>   - Global Clock Controller (GCC) and RPMh clock controller
>   - RPMh power domains
>   - Interconnect (NoC) provider
>   - TLMM pin controller
>   - PDC interrupt controller and SCM firmware interface
>   - Devicetree for the SoC and the Kuno IDP board
> 
> [...]

Applied, thanks!

[04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
        commit: e304e8919043712191462224ce9d40bb5f5a6bc1
[05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
        commit: 12918d595ac96b819b9c3ba0df4c6a4bf50c43a9
[11/15] clk: qcom: Add Global Clock Controller driver for Kuno
        commit: 7db06b5f624b583fa2206f98de8437819acada9b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

