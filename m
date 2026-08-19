Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A314C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ww10+OJo0719/xus/YZCQo06xfKOWmvT6qT+Uurk6l4=; b=b+azmduc35w0UAIol2giBWSDfN
	ppLCZVXSx5tGRsjtRsmruhMBeoBobD/wkr94ZazFE+u5JQpHDLGKkB2sWXv7TRQVVFixJX7DlXSZw
	64g0UodDEcaQhXvAuKeqNcFci/Bnnge/KWd+A5tfBWRRZ4+6/FE3vVl0umhva3zyEWccNTTVzKIpZ
	k3oJ2AyfDqgtMgB9QCqDo3l9dW1NclTYJ33gY8eSnTDHqGAv42c6P9LL6k9pxyoF4UmTV89CzwsK/
	i2sDoYcg7Uj5ckooeVoVyAR0J7+U7RQb04546l0BcYR/o3mQ3wnG62gkSoHP1CpHiZ3WyyxLO+YQe
	ywLMiZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwd8n-00000009TNT-2hDT;
	Wed, 19 Aug 2026 10:03:25 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwd8k-00000009TME-49GJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:03:24 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47f5d5dbf80so94664f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787133801; x=1787738601; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ww10+OJo0719/xus/YZCQo06xfKOWmvT6qT+Uurk6l4=;
        b=W0RRp3VWWoKK2UQIe4Przelq8VWBf5nJ43LyisjaYss9HwzHKkV7Sn3gZhk3rqMGD0
         sTQn0to7mVwkUEo4IB0QiQNQjAQ1uPGdBW3fZeGFifzm5PrT7+nbH/lNPXaVXHe59j2n
         DVEO7ujs/riIdnT5Fg4Xw2A9yMawD/lM8k17xlbQw1iwdHu0a9mArnoV5bgcYUXsgv0a
         iwIRF5dJ+xdmfucke/JGONngVN9ytfW0SZU7MPBPdOyfoa33Oqkld4GtSHOP2du06+Xb
         MPVKBOq6I6es8SredLcqSnPdVGfZR1lBhPWil7+jtmSwZTvMqu7Dk4BSge3HTV7mkHlj
         /yNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787133801; x=1787738601;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ww10+OJo0719/xus/YZCQo06xfKOWmvT6qT+Uurk6l4=;
        b=NuNuOZ+khe9cO/RaLHv0I93cWEG5UqpZVjoIuF9YidnQSi5xjgqH9kToolYzCWJm25
         xY+CfIfPwne4mjHFtMxXKwRGR+naos7q+45ZZZLyZKso6I4eXCEIZdlf9UlbGyVUY+qq
         Blg0WhC55kp34arZzBaMlBEuUxGnlZwVci9ZID+PrkJn1IgpQYx1N6RhcIf0LWAhBHly
         50hFTk8pA8Pme0kuo6xTHil3i5RlRiPHDJ1J5gWLYh55YQKrSmllB4/m/70GsrGs9SmV
         Sx2nap3q7aV2GfyOK/n0CQf98awFgH6T6Xn8Zv2l/a+NVSQOEmAZtMg571HZyZtn7VXD
         E1Zw==
X-Forwarded-Encrypted: i=1; AHgh+RrfWGFe+A3NZYB+HKzQwYly3ewsnuBM4VYg+iAuE9UhcEkThm+wUuCdhV09uVbrAxAZvyfhPGSgygrj0uDVIWkX@lists.infradead.org
X-Gm-Message-State: AOJu0YyYetK1kk1ebCORfP9jxddesBwR4ON6u4jua7oznlo+mKByMz30
	BWZ4gkBS1IgholOdxXeOuaxRQLAC9PETmGvPL2ZAfRCPk9tXGj1eWLxk
X-Gm-Gg: AR+sD10VnzzTHaF51XNBpN4ixMXwHFC198N8crZNrmmpD5x6tvsQ1Gi9nkarTXS17HX
	09zPdffWWhu0ois9YRgeu5q9sFaLJJEb6T9htMRK3QO4cltc2tcl9VhkicF8Uhp55azFn9rtK8n
	YEq+Am4R24P488xrb0eFQWEhKCf/StXvvuZbhmvzDqQu/MY+PaOyJg2T0A1Va4LEAKdsbbESbeJ
	oQxrruNxjLvjrv0nFH0gSdMkrvcArBod1+VM0cjb3xV8AsArRcXiFMp0FYNJE0Trpbfkt78+2D4
	/JN0UEHXwoJSSNmcJCp7EW/UTYUyree6aWLNK0QgbQPcGVa38+294ThqiEZOKEAU1MHG00st3KJ
	OEe9O9Evbmpci64vqxc8b0QwRs/8aQ/5Ke3RtZ4AIZcoUCTXReX1hBMLtweFUdKKQrJzL3kxzvY
	MsCuTVcONJ0wfIm/QPwp9zDeicoZaeB8EDcg+GTx5osRPIbsEfQQ0tJkZgFvFPQffrKxcPjM4O7
	bNTDx8Qz+NQfcIjiJYDjHsTqdjJ1PNPpOy+3oWc2MX/GGhhhaNLwG3+n2ba1rMApvwdrQ==
X-Received: by 2002:a05:6000:385:b0:482:a902:bfb5 with SMTP id ffacd0b85a97d-482b1e07e79mr2759906f8f.0.1787133800795;
        Wed, 19 Aug 2026 03:03:20 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B92960062A31D8DDD4EA0DC.dsl.pool.telekom.hu. [2001:4c4e:1b92:9600:62a3:1d8d:dd4e:a0dc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1441748sm4935688f8f.8.2026.08.19.03.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:03:20 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: support <support@armdesigner.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-rockchip <linux-rockchip@lists.infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/rockchip: vop2: Scale the AXI clock to the bandwidth the mode needs
Date: Wed, 19 Aug 2026 12:02:47 +0200
Message-ID: <20260819100249.7945-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026081916331211222713@armdesigner.com>
References: <20260813154501.21332-1-royalnet026@gmail.com> <2026081916331211222713@armdesigner.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_030323_043467_A57BD31C 
X-CRM114-Status: GOOD (  14.68  )
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

Hi Owen,

Thank you - and thank you for bringing this to the list. A fanless
RK3588J chassis at 60C ambient running dual HDMI plus DP is a far
stronger argument for scaling this clock than my bench ever was, and
the +3-5C junction delta at 750 MHz is exactly the number the
power/thermal side of this discussion was missing.

On your question - both, sequenced, because they answer different
questions:

- The BSP 6.1 48h soak first. That is your production reality and it
  needs no bring-up; what it buys is the real-world deployment
  evidence, and with your permission I will cite it in the v3 cover
  letter alongside the multi-CRTC tearing observation.

- The mainline clean-room run when your DTS bring-up is ready. v3 will
  be against drm-misc-next, and that run is the one I would attach
  your Tested-by to, so the tag attests the tree the patch actually
  targets. No rush on this one - if it lands during the v3 review
  cycle rather than before it, that is still perfect timing.

I will CC you on v3. It will state the FRL/ACLK relationship
explicitly (on my board the HDMI FRL path holds the clock at 750 MHz
independently, which is why the DP path was the one that exposed the
scaling gap), and it will pick one direction for commit_setup vs
commit_tail and defend it in the cover letter - the question to the
maintainers about a rockchip-wide hook pair is still open, and v3
cannot wait on it forever.

Regards,
Igor

