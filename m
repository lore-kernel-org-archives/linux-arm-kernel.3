Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A64C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NL+29R9pgDU6U78Df4LR5nXsbj3S7YAmFmbuIa1dcEg=; b=ipS98A18roZI5mPHWK7mdmUDjJ
	j7azCfr6xC30WGI0sIsqQJpJGepiI/Y0jbARaO2D8zqDriXOa7YeWNjwvkmsZn+79mnuoy3ZjqyfJ
	gxq9Vsxp9p52jzqMUZcwHGxgle52zxJC4NwEVfSYSQhLPQW3l0MdxxxaTgQaJnJexME9FnoWj+JwQ
	s9wYW84k3s7bsZfIIRhKteApAlvpUg9T2kvhuKdvIH2svbN7zxHSsXd9eMsrD8ElblDMTwxFnio2O
	vU1MSt48eW5vekIN0rcEClIA5UVbBxhyQIUA7apDwnikmuLXREJYCd9IzjAeS4XEYXMauuGASD+DE
	upg/RVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJEH-0000000CkCN-40QD;
	Thu, 20 Mar 2025 16:58:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvJCE-0000000Cju6-3sGJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 16:56:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72C7F61145;
	Thu, 20 Mar 2025 16:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA57CC4CEDD;
	Thu, 20 Mar 2025 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742489801;
	bh=q+IeQ8/ESh5rf+qzsf+KECfiCFZQenJ76BHXW6oyuk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QfN9oUvMuCbSejQdSZ8tHkyue9mySPL+JPDxJNFyATnpwpkD31gWUfZQ5XkRX45HH
	 gJd+0WYbErcyhIVvSdpS/r3d5m6r7Bps6jep6RY9dE+ypP3BHSekh2H5dS3Qn4KKeD
	 uve3FVFeQNVdoIBsA8GOyvz8+pThvrf5RtGKAWFZdYr6BYV6oFyuWhULd/tw6baWbK
	 r4nIsQFij5gulOdTpWdBcfxwVeBBeW3Gcygsiw6UNSTe7VShTOj0+7vol9uk6UDPWO
	 d0h4YsWfzN1Q5NbVntFR9j26QshcDgoT2KOd1nvRimAsGRpLzsL+3jckwBOWu6FhA8
	 EJ2FbRJqal54Q==
Date: Thu, 20 Mar 2025 11:56:37 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Luca Weiss <luca@lucaweiss.eu>, 
	Pengyu Luo <mitltlatltl@gmail.com>, Alexey Minnekhanov <alexeymin@postmarketos.org>, 
	Danila Tikhonov <danila@jiaxyga.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, Nikita Travkin <nikita@trvn.ru>, 
	Praveenkumar I <quic_ipkumar@quicinc.com>, Tingguo Cheng <quic_tingguoc@quicinc.com>, 
	Cheng Jiang <quic_chejiang@quicinc.com>, Janaki Ramaiah Thota <quic_janathot@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>, 
	Luca Weiss <luca.weiss@fairphone.com>, Mark Kettenis <kettenis@openbsd.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Rakesh Kota <quic_kotarake@quicinc.com>, Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
	Wojciech Slenska <wojciech.slenska@gmail.com>
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.15
Message-ID: <i7x76sr4njtoijtte453b7bhubiirpot3hzck7j6umyjhmay5h@ui77ajauxmzc>
References: <20250317215921.2031880-1-andersson@kernel.org>
 <a2132f78-f113-460a-b7ea-022a39e4e64b@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2132f78-f113-460a-b7ea-022a39e4e64b@app.fastmail.com>
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

On Wed, Mar 19, 2025 at 10:10:31PM +0100, Arnd Bergmann wrote:
> On Mon, Mar 17, 2025, at 22:59, Bjorn Andersson wrote:
> >
> > Krzysztof Kozlowski (17):
> >       arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: 
> > sa8775p: add QCrypto nodes"
> >       arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: 
> > qcs8300: add QCrypto nodes"
> >       arm64: dts: qcom: x1e80100-slim7x: Drop incorrect 
> > qcom,ath12k-calibration-variant
> >       arm64: dts: qcom: msm8998: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: qrb2210-rb1: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: qrb4210-rb2: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sc7180: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sdm845: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sda660-ifc6560: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sm6115: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sm8150-hdk: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: qcm6490: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sa8775p-ride: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sc8280xp: Switch to undeprecated 
> > qcom,calibration-variant
> >       arm64: dts: qcom: sm8250-elish: Switch to undeprecated 
> > qcom,calibration-variant
> 
> This seeems to remove the properties that the drivers expect
> even in 6.14-rc7, so the branch is currently broken and I'll
> skip it for 6.15. Let's see how we should handle this properly
> in the next cycle, since it's too late now to fix it.
> 

Sorry about that. I didn't spot the comment(s) that these patches
shouldn't be merged until v6.16.

I think for this case it's okay not to provide more forwards
compatibility than a single release, so picking them up then should be
fine.

Regards,
Bjorn

