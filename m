Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31583CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVM/Q2iunblfJ7G6uiz6InybINTATTyk3ou2HCwjpcM=; b=b+SUuIz7pH/JTMIVXaWdqlqXoX
	96+O/t1QjHPv1WBYrpGVGKZFv673W+rMSV35/TXnjMIpR3IQEBqKUHj7ETjJeelmc3xk2RRo2jzzn
	zZPYv7Zf3pyCXqo7ZiZ5e3eMafbyzJsDEcpouomnQEl8LzjAuUf/EJnUT6uPIthspNGhtwp9591Qe
	q+lE/5nJaYTL8Ld3Dy1JhmIcCUbJX4ByQgbDNRu2PQ0rReBRkUaUvd8+tAbdOX5INFFCTMwZVzJlT
	PtTSCB32mDlbZzH5b3ZB7L9OtxDjwYsCa8G8nMpMecXekKl6dW1YbPXV3WR0e7l+q7GRQlGdwWd2z
	+A3TW3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh6W-0000000BV6u-3C7f;
	Sat, 25 Oct 2025 16:26:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh6T-0000000BV4v-3lle
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5475C601E8;
	Sat, 25 Oct 2025 16:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3330C19421;
	Sat, 25 Oct 2025 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409613;
	bh=Pyi/deS0BK1bu5+MfdJKjF/aJj54u1WpI9UwOtwyXzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VpWurLt4sZ1WGpYJcUKZfXotlmn3+SYqt7y4SbGyIQH/bxg5ZdMXKyDTVqUXWjKnz
	 yA3XQq1ESDABBZntDvAJ/C/Ytug7bvLrDamz4GRyY+1bs/3gZ8/mGKgNKeFm50tWdW
	 Fpmqxf/+4yuC/CPA6q+O0Nmv0TBvGFDPH1vyMNHPh4E6AIvqWmVzrzHj6FP3kd0kNk
	 shOFhnUqUU/0Oo46R6Y7HSAPQvPq1vtJzD2k/qlfIUmZodZ1IN1ZAOQtyY0/N+yT1O
	 6wMdGbuyJGjMAjBYWXmbF+r5pttDGktZB6QXE080MIfY8KIy4GhPtgPYfhBhxOzXcl
	 F0ruSfp7ApYyQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Olivier Moysan <olivier.moysan@foss.st.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	arnaud.pouliquen@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.6] ASoC: stm32: sai: manage context in set_sysclk callback
Date: Sat, 25 Oct 2025 12:00:24 -0400
Message-ID: <20251025160905.3857885-393-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
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

From: Olivier Moysan <olivier.moysan@foss.st.com>

[ Upstream commit 27fa1a8b2803dfd88c39f03b0969c55f667cdc43 ]

The mclk direction now needs to be specified in endpoint node with
"system-clock-direction-out" property. However some calls to the
set_sysclk callback, related to CPU DAI clock, result in unbalanced
calls to clock API.
The set_sysclk callback in STM32 SAI driver is intended only for mclk
management. So it is relevant to ensure that calls to set_sysclk are
related to mclk only.
Since the master clock is handled only at runtime, skip the calls to
set_sysclk in the initialization phase.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Link: https://patch.msgid.link/20250916123118.84175-1-olivier.moysan@foss.st.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- Guarding `stm32_sai_set_sysclk()` until the card is instantiated
  (`sound/soc/stm/stm32_sai_sub.c:675-681`) prevents the early simple-
  card `init` call (`sound/soc/generic/simple-card-utils.c:571`) from
  programming clocks before runtime.
- That init-time call currently triggers a second
  `clk_rate_exclusive_get()` on the shared SAI kernel clock
  (`sound/soc/stm/stm32_sai_sub.c:442`) and another
  `clk_set_rate_exclusive()` on the MCLK
  (`sound/soc/stm/stm32_sai_sub.c:709`) before any matching “0 Hz”
  teardown happens; at shutdown we only drop one reference
  (`sound/soc/stm/stm32_sai_sub.c:692-702`), leaving the clocks
  permanently locked and causing later `-EBUSY` failures.
- The regression shows up as soon as boards tag the CPU endpoint with
  `system-clock-direction-out` (parsed in `simple-card-utils.c:290` and
  already present in ST’s shipping DTs such as
  `arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi:520`), a configuration
  encouraged since commit 5725bce709db; the exclusive clock management
  added in 2cfe1ff22555 made the imbalance fatal.
- The fix is minimal and contained: it simply skips the init-phase
  invocation for a driver that already derives MCLK from the stream
  rate, so the risk of regressions is low while it resolves a real
  runtime bug on current hardware.

 sound/soc/stm/stm32_sai_sub.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 463a2b7d023b9..0ae1eae2a59e2 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -672,6 +672,14 @@ static int stm32_sai_set_sysclk(struct snd_soc_dai *cpu_dai,
 	struct stm32_sai_sub_data *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret;
 
+	/*
+	 * The mclk rate is determined at runtime from the audio stream rate.
+	 * Skip calls to the set_sysclk callback that are not relevant during the
+	 * initialization phase.
+	 */
+	if (!snd_soc_card_is_instantiated(cpu_dai->component->card))
+		return 0;
+
 	if (dir == SND_SOC_CLOCK_OUT && sai->sai_mclk) {
 		ret = stm32_sai_sub_reg_up(sai, STM_SAI_CR1_REGX,
 					   SAI_XCR1_NODIV,
-- 
2.51.0


