Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDEAC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBycfkJw5I/ng54OHAnOW8sWPT0mi9f8UR2eLGlndbc=; b=4SshL0/pcGKUd9ruzWIoAdykft
	8hYNOeseO0PaYo959PXcbwTI+a3LZ+WqTJm9INrKOrV99vb/M7ePSRKaq91oVWeLAG8PQf5m2b3JU
	ksO/PJbgjSpmnLsKSLP88jpAsFJFHPbhrO2FDOwTt5BG3w0O3PhmIfVAvcsbX6tA9qwmn7JG95nVc
	S/QFGYg2/yM4ZxYURas/dKNrY5SigMRVH9929oG3J+jtfG9i3aofmBqD3f6c3+t43AtRtN5o99sSV
	FB93YZoJybSX8zLtZxvU82I0jhB0SFioxN7YJ5bN7gDkDSqf5TvkE66CLrx/y7aGHS6m6V7FGOwiy
	Aj+2R37A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMXl-00000002oFg-0pWc;
	Tue, 04 Aug 2026 21:19:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMXk-00000002oFV-0RXj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:19:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D8F2D40E04;
	Tue,  4 Aug 2026 21:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008AC1F000E9;
	Tue,  4 Aug 2026 21:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785878363;
	bh=TBycfkJw5I/ng54OHAnOW8sWPT0mi9f8UR2eLGlndbc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jIJoUCcwm8Tp3eupSw3jTlPGD2RGQHuM+UFQSS77odS0q0ZUxRY6MlT/XFKQ/xtaf
	 azR+gN64IRiBGdDI32cNQwswHuCEzSOrFaZS8Ujgbbk+Y2PG/LyDomx4wIqcGh2U7R
	 oag8gUnezF0gRijEbcmqMZSeK6byN9ecBU+5sFCGD0A+r3iVCMbNj7TIA6jE7+gp6L
	 qf0KVoc7deMvpHqcOApvSWu7BipzwOS/VwwDMAK1lrlurX7a7C9FoqpSqWv5vtrzbX
	 LsT2Q0RrwiH702KayiY2Ofb+CAu2YxymlCWbHyp+svmdGyLB7Xxd0loBHDuwW2l6+l
	 H0gsFsSFnhfTw==
From: Mark Brown <broonie@kernel.org>
To: CL Wang <cl634@andestech.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kousik Sanagavarapu <five231003@gmail.com>, 
 Vladimir Moravcevic <vmoravcevic@axiado.com>, Tzu-Hao Wei <twei@axiado.com>, 
 Swark Yang <syang@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
References: <20260804-spi-num-cs-v1-0-4ccb13dcc7b0@oss.qualcomm.com>
Subject: Re: [PATCH 0/5] spi: Few cleanups while looking at num-cs
Message-Id: <178586591185.111355.14637687266555996787.b4-ty@b4>
Date: Tue, 04 Aug 2026 18:51:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1777; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pLt/cU+TnyqtlnI5xON5SLbuyKMa5di2C9UmmlL2O8c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcldY1DeS9mNj2yy1OE2P4KfiH21c9R+Pvn/L7
 /yLsmGB9ZqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanJXWAAKCRAk1otyXVSH
 0NbEB/0SYx3PdmLpeMU3PawZ31PrGosiVxngXQhyelNrGQ3m3g3dPn0j+nrDV2gGTSp98/6a//d
 kdWDwdJFXeCFwr5H0ghvXXBWvq95DotaZl0durAgcWbK/rmmFZtPhjrlWR1v+surxqTur9CkfrD
 CLJdqdF+OKooavAsnHqHn/iWI1f0vV9mihsZ3iiVuOB321w3GXGs4hQ8a1vuwZDw2/KQusHW3y1
 wkG/z3G0fqDLjMVOI7apxvh0Z9eFiJTeGazTneVF3nkDZ0cK/fNCb93IvZgAAz3vHdUMlw7Ua10
 Td7BmAwAaKl8hYxd8qfCr/2JnzUm34yvtju1Gm5WGvrf8ST5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Tue, 04 Aug 2026 09:16:56 +0200, Krzysztof Kozlowski wrote:
> spi: Few cleanups while looking at num-cs
> 
> Few minor cleanups for DT bindings and Andes driver.
> 
> Patches do not have inter-dependencies.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.3

Thanks!

[1/5] spi: dt-bindings: andestech,ae350-spi: Drop redundant num-cs
      https://git.kernel.org/broonie/spi/c/82024a7ae057
[2/5] spi: dt-bindings: marvell,armada-3700-spi: Drop redundant num-cs
      https://git.kernel.org/broonie/spi/c/9ec27e118da7
[3/5] spi: dt-bindings: axiado,ax3000-spi: Drop duplicated type/ref
      https://git.kernel.org/broonie/spi/c/577ada5875dc
[4/5] spi: dt-bindings: spi-cadence: Drop duplicated type/ref
      https://git.kernel.org/broonie/spi/c/ad0dcba3ab9c
[5/5] spi: atcspi200: Drop redundant andestech,qilai-spi compatible
      https://git.kernel.org/broonie/spi/c/463c840f54f8

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


