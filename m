Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E2AC282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lai7igtQIFv/dGyjh+B7p4pUnmY9ogTS/9V5m/U0Yjc=; b=3Ex90OmzVAD7ksDnOlQbsW2jRw
	kY4VHETDq3WGiXZj+8COL/gZR5XdFVS4Eoa6tznveSnbrZpX8KmFe3v7jovXvNlFqjhVEX2gG34ZB
	VRFYpNf21n8898IJmKzc52aFldDPwckMo8MjvhZw+lZGPh8Bxt2MnqEh5/B2540Ebw1KFDFrTeceq
	97FoKCQSjm1D7YnQOTWinX/pemgserRQXYULnp0chd9bQZ2VZ2NebBEDYm9dufABrRjvzBiL0vLYY
	WN4maxCWHDaw3LxeW96ecSVhBVERtlRr/qsRi3jIFHm1wWAIzwEVX7pm0q+6YoqDUC4RRoqZu/Nbk
	BZs0uSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPcm-00000004BI6-3cm6;
	Tue, 04 Mar 2025 10:35:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPWZ-000000049G8-40kO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D67E5C49BD;
	Tue,  4 Mar 2025 10:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A307AC4CEE5;
	Tue,  4 Mar 2025 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741084158;
	bh=EplWlSoRJA83AmlqX8c2hMFGp2dhjVihkkYBWa3OdiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pCEw2nDVmaMxddk+m0CxK9txDxc76pc+CXngQjvGIXPsu0HykeXtCHepJ6nX9feIX
	 HKFp+zbC3ngQmgzo2RAbfhObvVm+KSGUal7pEeGi/hTkg44iiNaF90pfa4lIKS3x6o
	 Qvv0rxoRcAfLjQraZH4FMzphDqWSBACDQ6AULldtUPt69f+9gV7aeP+3fhHZsYsS2h
	 c6NDfUovmdiz1WiidYCZqJX/3OcC4dMtOix2g19bY8lLJUzGVYCTHEX7VW+ia8uRW+
	 JTA+GJ3zSWBKsQQ4UrA8ekhsTQF1nLIgFUqjXDZl4SoNAY7OPAqXNudJCEdAeF8hVF
	 /NmyTeDsE7c5A==
From: William Breathitt Gray <wbg@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	alexandre.torgue@foss.st.com,
	olivier.moysan@foss.st.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] counter: stm32-lptimer-cnt: fix error handling when enabling
Date: Tue,  4 Mar 2025 19:28:42 +0900
Message-ID: <174108402893.227977.9200776572329997415.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224170657.3368236-1-fabrice.gasnier@foss.st.com>
References: <20250224170657.3368236-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=758; i=wbg@kernel.org; h=from:subject:message-id; bh=voCn1RjNuoiczOEdMALQZ3vX+Eb+fDa/WmXmEaBSPz8=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDOnHru6brC/xqmPi2tDZG2b0cfjqJiZluXM5y1dI3N1vp uKiV7Kro5SFQYyLQVZMkaXX/OzdB5dUNX68mL8NZg4rE8gQBi5OAZjIqkmMDCear2b9vbU4Ikb1 hO1OrsO/Xhd1LJvO3pB5sfEPz+94s4eMDG9Osugv4eVMn6adcZt1R4JAkaitr2HlzADdaZnVCh4 eXAA=
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_022920_051789_F8B80B10 
X-CRM114-Status: GOOD (  11.03  )
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


On Mon, 24 Feb 2025 18:06:57 +0100, Fabrice Gasnier wrote:
> In case the stm32_lptim_set_enable_state() fails to update CMP and ARR,
> a timeout error is raised, by regmap_read_poll_timeout. It may happen,
> when the lptimer runs on a slow clock, and the clock is gated only
> few times during the polling.
> 
> Badly, when this happen, STM32_LPTIM_ENABLE in CR register has been set.
> So the 'enable' state in sysfs wrongly lies on the counter being
> correctly enabled, due to CR is read as one in stm32_lptim_is_enabled().
> 
> [...]

Applied, thanks!

[1/1] counter: stm32-lptimer-cnt: fix error handling when enabling
      commit: 8744dcd4fc7800de2eb9369410470bb2930d4c14

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>

