Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A30FEF99EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 01:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHKgEj1YO685ABoxn09XgLWVXkNh27wly27rECy0EgE=; b=XouPNYNCsv1Y2z5Cs+YYLfN0Nn
	mEqBde9YTjOZAgEZ5qP3Pwtz+cOm6qwwTim7qkQ4xFMHlF2Z/StQJ8cXtaNjGcunlroe8m895599L
	aHz/NMghSxs0eEapiV3k0I+psU23twBnfiFrimVmksxygnogUTU1+OrvB8sGFCnM+idYLneKpkg4X
	WDbqXwiVFmhVHp4Qbipbhj/NeypkNF7ZbL/E1BQJZVrI+GpwJsdFQt1DoIDEPztDF+ZvdswHnXzc2
	UiXnKVu4rkI9CrSI+mgaHS6gq+f1VxCWnoVg0G0VncgI6X68SkUfFrLiNc9k/tpk860sTfrPTcA6U
	mtpud2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr44A-000000045yI-0suA;
	Sat, 14 Feb 2026 01:03:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr449-000000045y7-1Kqo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 01:03:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF9D060054;
	Sat, 14 Feb 2026 01:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C904C16AAE;
	Sat, 14 Feb 2026 01:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031000;
	bh=Sj1dl4mJHIY1lAiXUEN7nZi6A3IVTki3mOPvGibGbMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D8JsEno8tXYXRV1R4vIR1bqBfusPsDSVOBGfZ7tVDMPJ/lvvNoHoBdvB2fjtbPfG8
	 eRGQ6VGiZaI3bLGvqgaa8ZBfj+vKPBhKDuYe6fn+97RMHjA3xPGQJNy34aYXORZ9aE
	 o0MxicSZxlDN0CFuLJV/To018jOY6zFmRu4hXTQ4kiYswRQs5KGl7l4IECeIyOTOhp
	 5ySleQmO0RygRK+CwOoeMllK1vjOhqwdml8YPH94y+cVWyb8IgUg2f4idOEIH5J8B0
	 ipEO/YPRPjkS3SppX+Zv58sQ74aCmlYj2tHCxYIhOXW4JeOTDfVSAdCw+M0PLuuglN
	 A/+vl0UhZ2M4Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ziyi Guo <n7l8m4@u.northwestern.edu>,
	Frank Li <Frank.Li@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-6.12] ASoC: fsl: imx-rpmsg: use snd_soc_find_dai_with_mutex() in probe
Date: Fri, 13 Feb 2026 19:58:19 -0500
Message-ID: <20260214010245.3671907-19-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
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

From: Ziyi Guo <n7l8m4@u.northwestern.edu>

[ Upstream commit 84faa91585fa22a161763f2fe8f84a602a196c87 ]

imx_rpmsg_probe() calls snd_soc_find_dai() without holding client_mutex.
However, snd_soc_find_dai() has lockdep_assert_held(&client_mutex)
indicating callers must hold this lock, as the function iterates over the
global component list.

All other callers of snd_soc_find_dai() either hold client_mutex via the
snd_soc_bind_card() path or use the snd_soc_find_dai_with_mutex() wrapper.

Use snd_soc_find_dai_with_mutex() instead to fix the missing lock
protection.

Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/20260205052429.4046903-1-n7l8m4@u.northwestern.edu
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

The wrapper was added in 2020, so it exists in all currently maintained
stable trees (5.10+, 5.15+, 6.1+, 6.6+, 6.12+). This confirms the fix
will apply cleanly to all relevant stable branches.

### User Impact

- Without this fix, users with i.MX RPMSG sound cards will hit **lockdep
  warnings** during probe when `CONFIG_PROVE_LOCKING` is enabled
- More seriously, without the lock, there is a real (though perhaps
  rare) **race condition** where concurrent component
  registration/deregistration during probe could corrupt the component
  list, leading to crashes or undefined behavior
- The i.MX RPMSG audio is used on NXP i.MX SoC platforms, which are
  widely deployed in embedded systems

### Stability Indicators

- **Reviewed-by: Frank Li** (NXP maintainer) - indicates domain
  expertise review
- **Applied by Mark Brown** (ASoC subsystem maintainer) - indicates
  acceptance by the subsystem maintainer
- Single-line change with zero risk of regression

### Summary

This is a textbook stable backport candidate:
1. **Fixes a real bug**: Missing lock protection for a global list
   traversal (race condition + lockdep warning)
2. **Obviously correct**: Uses the existing mutex wrapper that all other
   callers use
3. **Small and surgical**: Single line change
4. **No new features**: Just corrects locking
5. **Low risk**: The wrapper function has existed since 2020 and is
   well-tested
6. **No dependencies**: Self-contained fix

**YES**

 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 53f04d1f32806..76a8e68c1b620 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -145,7 +145,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->dai.ignore_pmdown_time = 1;
 
 	data->dai.cpus->dai_name = pdev->dev.platform_data;
-	cpu_dai = snd_soc_find_dai(data->dai.cpus);
+	cpu_dai = snd_soc_find_dai_with_mutex(data->dai.cpus);
 	if (!cpu_dai) {
 		ret = -EPROBE_DEFER;
 		goto fail;
-- 
2.51.0


