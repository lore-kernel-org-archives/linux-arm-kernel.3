Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5769CC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 15:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQygm47vH/WofEnzOqR26vDr26pm660we3NQTOLEBBA=; b=UgGh6yGMog7Z9NHzqn2aFobcP+
	E8YtTRQgd1iy38tLC9lnMfJ2AIhvCRnwSVtE2a1RuHxzVisgdwdyGiS3nlGouAhbwt23EU20gHfqG
	uhYDQmhppzArz3FkoBpMHWgAzfHUlwtb1wjqNGFalNOcQI5YIiNiBWp4KCZE0/DD/9OwI7jKIHuG0
	ZzsJW3rSKXKVls/xTO0XFhzchmvrHcrMaEotAretRnUMwcuOT2qaqTjMELReqplUmBzX8UzGr0ea2
	WSbxsaJ04hid8nxd7q4oLBFI6KkgpjgWb/ccPgRKutIJMHtdhRYrmkWQXlE7UQHW2+HLPzPtP4/cE
	Nge8+Gjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4F4-000000085jC-018B;
	Wed, 16 Jul 2025 15:40:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4Ca-000000085Qx-0rIE;
	Wed, 16 Jul 2025 15:37:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12678A52163;
	Wed, 16 Jul 2025 15:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A91C4CEF7;
	Wed, 16 Jul 2025 15:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752680266;
	bh=kREwtPjCgKfqsTgv5NM0Mvvtgu8NBDUf/T41rzVZ/eM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BLwgbfXuexHaW+TPNa+a6iWrfr4C93SXyFNP1m6zjdbchQIQjSDQN2bPIFxq8BOpe
	 3Y4LzFtdIUdhJXmJbTn203g5qdg44tOZHIiKBjGVH/5wnPgme7Tctz2W+/IpaDnKLe
	 8BH6cepPRo11/392JBcaABYWXwIdAxzxeBnssoB5sZ9TDXipnQosvkIEHom5c/u7FR
	 D5nq5bg/vTcOff2xiwUMeSzoEHZJ+oD85tH7KUakcBcdGy7jLA6BdqiTOB742SS7aD
	 cPI1ykzdDf1e9s8V5rHlN8rkVCKkwk/zgI6tMkbncjd8p53Y7Ww2OULF2uyhky8RTf
	 UqoBVX+/4gwsg==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
	Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/14] drm/panel: Use refcounted allocation in place of devm_kzalloc() - Part5
Date: Wed, 16 Jul 2025 17:37:42 +0200
Message-ID: <175268024705.1893267.8357084891720845996.b4-ty@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250710-b4-driver-convert-last-part-july-v1-0-de73ba81b2f5@redhat.com>
References: <20250710-b4-driver-convert-last-part-july-v1-0-de73ba81b2f5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_083748_306744_EBDB95BD 
X-CRM114-Status: GOOD (  10.69  )
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

On Thu, 10 Jul 2025 23:31:11 -0500, Anusha Srivatsa wrote:
> Use the new API devm_drm_panel_alloc() for panel allocations.
> A major chunk of driver conversion was sent in a 3 part series
> which is already merged. The coccinelle patch that was used to
> identify unsafe panel allocations didnt flag about 20 drivers.
> 
> Not using any semantic patch for the remaining drivers.
> This series does the conversion by not passing explicit type
> to the helper and maintaining type safety suggested by Geert.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

