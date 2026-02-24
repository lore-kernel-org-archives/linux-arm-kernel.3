Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688F0F4BB6C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pZsOoj4DMSaeClPAIb5u9k2sya8rnziXDtRdWXJ3wU=; b=nyxwS32grVAmnvq5euOO3+3vHO
	fayDjiQ1zDqSvvPoEu+4P5rTRApdH+BqJf9RpBdplP5m9effyzCBAOW2Ym05BGoy3lyY2B6+qiscH
	THE24X5GhFMtPKw0HkkJPk7EmqCD/i2wUSwnEbl1seaiLURA5rTQTc68zJKquK/2mf/jVF0lcMlY7
	dXAFEd2LY7U1QOZrJ8chNkw29snbkzGFJFqJPn4Npw4YdgwtIvEazugY+GcBA/DAhKfEtZjoi7sCf
	7U5dqYSE8dH1FQv/rYs9tJcy9OxoeQf5q9mgR2rYRpuWQKrHpOo9ZP3lupo0zRtfGJOCnakkCS7N+
	ZSmHc+lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfZ-00000002Wc1-04SD;
	Tue, 24 Feb 2026 17:58:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfT-00000002WYH-1Tpf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:57:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A72E2442A1;
	Tue, 24 Feb 2026 17:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D882AC19422;
	Tue, 24 Feb 2026 17:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771955874;
	bh=SQb91GNf6kVtqmOCOt3loCbr4Ww0TH1GIwC6YpIa3uc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FlzYna74ue06WvicglgW5ofZKmiQcZYJBYKZPX8MGqAMXDGHaYh8mKmSzR39lAyf+
	 cc+jWS36ewuLRiEjD9X+ss8iEUip74NsxIZ7HsG6AEoMVgWSy30nIQZXoWQOkOSFWF
	 kDA4WkOl70NES7HOrUg4FvIkH8OEPhLSVh4+1pURK53zh8I2S75RccB+wSWBcBP33u
	 CaFSdxrtliwgHJEye52dr0VhlRb7VgeQ0QWPPMfM8n2jx0VELRqvp3MOl5/tuo76NU
	 VkAlQsvBd+LQlzi7VB5ESr/h+N+p/IcKukRVXMIJWAsD2J0K7HQ5EAcvUlhV8yyQpQ
	 wmVQNodQ9fWdQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: jernej.skrabec@gmail.com, samuel@sholland.org, mripard@kernel.org, 
 Ethan Tidmore <ethantidmore06@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, neil.armstrong@linaro.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260217014801.60760-1-ethantidmore06@gmail.com>
References: <20260217014801.60760-1-ethantidmore06@gmail.com>
Subject: Re: [PATCH] drm/sun4i: backend: fix error pointer dereference
Message-Id: <177195587163.131169.15955848927842554754.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 01:57:51 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_095755_431412_7320C95B 
X-CRM114-Status: UNSURE (   6.43  )
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

On Mon, 16 Feb 2026 19:48:01 -0600, Ethan Tidmore wrote:
> The function drm_atomic_get_plane_state() can return an error pointer
> and is not checked for it. Add error pointer check.
> 
> Detected by Smatch:
> drivers/gpu/drm/sun4i/sun4i_backend.c:496 sun4i_backend_atomic_check() error:
> 'plane_state' dereferencing possible ERR_PTR()
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: backend: fix error pointer dereference
      commit: 06277983eca4a31d3c2114fa33d99a6e82484b11

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


