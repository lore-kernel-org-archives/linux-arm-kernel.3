Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE942F46C47
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmO4WqH+TlUVF5nz8u7wTqPxKjgJH060rYQn1/hPbw4=; b=kA7jAXmdxL2RM8G2w2iUoAWUIw
	c5zi3PX7BkwiRc7WsMY2NCXKeo3fHwkhJeDebcRQTGh+J3774qs7vuEjh1lN6zIM0lXVV6RnRBzsS
	YbPkzm7WWZKRrTcsS69mUJD6hT8k1oNV6vQONlhmCfavG6/HPMFy0op/lxhmB/Kvtm3L5gz4HGoXz
	cQaXxsV12CPXf1zx+K4+CRJtcrYr2hLq6RKdWOZZ8PbPEmkU3b7kUxi3D0oq6ym7NQPCpZ/IMGliV
	bo4jK8JttwaBKx9Dcnp9TzAqDzaWcwcoUAkWAYdxmOWG6uEc95pYgpmWPwPKy0l/rXivkl38fsFV2
	a8FfV/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lai-00000005FXJ-1rQB;
	Mon, 06 Apr 2026 15:10:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lae-00000005FUj-0GmL;
	Mon, 06 Apr 2026 15:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EC27444A7;
	Mon,  6 Apr 2026 15:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6F1C2BCAF;
	Mon,  6 Apr 2026 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488211;
	bh=7qkIHfQVLcoQezNsVQifK9LFrH/5VNd34wwBfkCPenI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WIFrzrJv5Bp7FEpK5WpiBeY5ctfo9JX8NhEbxV7nd3R2ZEFiygOhv28TItIy0twSN
	 eIEwIxURWFdOeo2o7RSZ4PcKTp2bQwLC6D0Ai5q9fwyAsLjbb/JLU6gynq8uBlSSQk
	 zvHcIkOc3VaoWfvDkGWYdHUqgPhXgVEm3M3Quvx2P/ofQLuwu4iFmA760djGd0c55k
	 IQc7BW/ScFTlvfxYTnE++1G4yHFB1/KjYp54isX3lwj7zw0I9Krgnv+edaKkxECMv9
	 MFCS/Nalby2hCsp5DtsQeHZyhBA/vxZY2lQY1zsMlUlz6hTj6kaX7dXo0V7nK3NN7j
	 /v2dcS4MX2DKA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify buffer passed to send functions
Date: Mon,  6 Apr 2026 10:10:00 -0500
Message-ID: <177548820150.2290739.14526256413084425131.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_081012_152666_AAAFF0F3 
X-CRM114-Status: UNSURE (   8.36  )
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


On Tue, 17 Mar 2026 13:36:49 +0100, Krzysztof Kozlowski wrote:
> This got acks from Mathieu (remoteproc) and Mark (audio), so can we
> funnel everything via Qualcomm remoteproc tree?
> 
> Dependencies / merging
> ======================
> Entire patchset is one logical chain, all further patches depend on
> previous ones, thus everything should be taken via same tree or shared
> between trees with tags.  Probably everything should go via ASoC with
> necessary acks.
> 
> [...]

Applied, thanks!

[1/5] remoteproc: mtk_scp_ipi: Constify buffer passed to scp_ipi_send()
      commit: 4251dab9d176212afdf4ced263b59bc0d5292c7f
[2/5] remoteproc: mtk_scp: Constify buffer passed to scp_send_ipi()
      commit: 90dacbf4bf13410c727ffaca8fe3ce3276ae58c2
[3/5] rpmsg: Constify buffer passed to send API
      commit: b8077b4da2e89917ec4c632b66e60d49089bbda3
[4/5] ASoC: qcom:: Constify GPR packet being send over GPR interface
      commit: 66ec83627902d2585e14911692b317496731767a
[5/5] media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
      commit: 3e2fa997d1e2b651993ae7e81646aadd55470bce

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

