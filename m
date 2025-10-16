Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49ADCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LINeZ92B6as9p5YZGgLinLU9LTl3+cggwI044K3HV9U=; b=P9bi4rmm0adhIeSWEbxpgpZFGv
	htqSRTMo3efS/H+we5fyvmq5WZUpy1xwh1pX1OIE/OBxgQBE0284b2iZmA3gDkZmWa0LmEE+IoZQM
	RxNWLS+0Sj9fit14/c3JkgsBdrJdEWi/QR8oQ2Y6WMWWdzIqpX3XzQuAHUmtmgQMsw/qVuw6hUklp
	TujKKqUG1Zjr3+QVL0PbywfNGV4rDZHiLfKGZrvIv/w1bN923q7VQa4NhH2sZhNBgOUNoD5XlsmKf
	ikS+LcnJbVtk2IkHMunTutIw5LgUW/TcGQuB0VrwxZSk/p88R3KGrn1ftYqhIYa5kMBkDRYbX+PQE
	3eownWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QQw-00000005LOZ-0Q9s;
	Thu, 16 Oct 2025 16:02:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QQt-00000005LLq-1QTL;
	Thu, 16 Oct 2025 16:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LINeZ92B6as9p5YZGgLinLU9LTl3+cggwI044K3HV9U=; b=sT6vRqMeha5paYOSJJkSbuqkpg
	Dp43S1p+pwtPhKwOG6B80p9xTHolM7IisIytC11DgzOYHwKjpCKzJsyVOmgYQJej92NGpQ9FmQJE2
	qwsMRzdgTKKzqS3ivGXz/tsQMaGnO1Sd3VqGGaXiuFnHWQA7EgurTM9Fb/x4OEChwbyE99TVdjE1l
	ouTJD/fgaJvWMHyYwhIVl5oJtVSCD0MoCLQ8kmj6Dx1yWz0oOzDTGV0yvH7b353OLJQJTJJonRDXB
	mSaS4JqvUBI9xnJOOcQVkq+J1fNHnCjAzdpKuMW/YYeJ+mjWPddVpKjCeMqn4DYmVJJgvbLSeEBPJ
	LZVNDmrQ==;
Received: from i53875b4f.versanet.de ([83.135.91.79] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v9QQG-0001Hf-SA; Thu, 16 Oct 2025 18:01:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/rockchip: dw_hdmi: use correct SCLIN mask for RK3228
Date: Thu, 16 Oct 2025 18:01:39 +0200
Message-ID: <176063049204.2255429.1568270425140283082.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251010173143.72733-1-alok.a.tiwari@oracle.com>
References: <20251010173143.72733-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_090227_367622_6C86B411 
X-CRM114-Status: UNSURE (   9.29  )
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


On Fri, 10 Oct 2025 10:31:41 -0700, Alok Tiwari wrote:
> In dw_hdmi_rk3228_setup_hpd(), the SCLIN mask incorrectly references
> the RK3328 variant. This change updates it to the RK3228-specific mask
> RK3228_HDMI_SCLIN_MSK using FIELD_PREP_WM16, ensuring proper HPD and
> I2C pin configuration for RK3228.
> 
> Change: RK3328_HDMI_SCLIN_MSK -> RK3228_HDMI_SCLIN_MSK
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: dw_hdmi: use correct SCLIN mask for RK3228
      commit: c700e7279b29948f5d2aee30df2dbd3124df3b9c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

