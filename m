Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC7AC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoi+qAxbLbOdEbJC2ElBOo5ZUZgXdWhceK6CmEVeDBc=; b=XhMnD9nHt6QDgYgBSD4XuM/Tbs
	VOGX1SfoKW/r6oP5XF4u1X14durl59ye2IEvtXkb/L5h4/L36KEVQt6Pyea1k3jgz6eujqKgUMbPT
	Hlqf/t46+70zhL7rKUu6MCzmpiLUOEgOG3Yz1MUQHbjrZs2xTrdqv81XR6IYku1vurxsnlDqfTwbg
	vSe3i+cQYAZVJoREPj+NyWJiKZguQvwRDnX4y3RAzIVLrWo7v04M4oRgTOCgv4Iuu+gH1K9HBcfOU
	+WTL4fSc3m70mh4nB0k8T9KdUX9XKF5vx8hsAQTBKJbZ1Z8iIc+aB548iQqdOkwaX66ccEgHIjzAI
	6b82ij/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8h2v-00000002rFk-3Qoa;
	Mon, 21 Sep 2026 16:39:13 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8h2t-00000002rF6-197m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 16:39:12 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469d20963so2086612b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 09:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790008750; x=1790613550; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xoi+qAxbLbOdEbJC2ElBOo5ZUZgXdWhceK6CmEVeDBc=;
        b=XPqwue3wPx1sgfILsnJHdgXMYWpr7nlXf+RQgCuPhs+1QvWngYWRl/6wxZva7MoExc
         n4+N/Be9PfPtPhm1w5NoQa+Y1fEMDw3DthcRh0ubR8c2nd9zJXlSM8hRqBgq0Z7uuc6Z
         tA+03CLwncZSCBKIpzS2h/xy1Ic5sZkItwgFMaVpi294lci2eIkjIlwmSc8astx2RrTG
         /ifpgiXbdZ5p2i/vxTT/aeW1kwcCfpGTO2MCtJKo7HYBer7jWp9T+B6uLJMxtrOCUXWS
         0fPY2rKZdFQSbSVyOs1AgNScI9M7Og/RKdN9xzV8P6gns6h/i1lioN+abdwZeEYojFth
         LsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008750; x=1790613550;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xoi+qAxbLbOdEbJC2ElBOo5ZUZgXdWhceK6CmEVeDBc=;
        b=adGQz6qNara7XDKbulh9G9VRi372BWNxUQVLFxLp/BRDHsQCCnnnNzDvpBzfy7LurR
         J8qzfObcfNe/oZCOxyF63xRJLk/5iYE48XOILqXzt53Hj7bCghwuyqt0vpDThw0N2LxU
         1+52NX5oPlo8omoReP4e6yq8GpCXggi/H602wjCnW6Nx00ZKOyN9qazQ+swNOJQJ37kb
         biFIQHhUzs2MW5Yn5/Dd916KATxSGLPtsD0/B14O6Wh4pYhWcKVJqWev0s6XtX1wpXb6
         AVQQkFev50oo4DIbLsgnLKhDkhPqXc1DwPdpPVZ+ZTALn9Fufdqr3d7gJimRZ8pTpN79
         U0TQ==
X-Forwarded-Encrypted: i=1; AKwUvByu3dkgRrgWBGbpq8jhSYOtpC7B4/D6iaivRzM0Y7uHFvrXyqbwQPz2XpNZsd5yOQvzICO1gZdladGk6ITy/kHr@lists.infradead.org
X-Gm-Message-State: AFuF++nzt5NH5ZvBk0+PgMGuypVjN1kBtiDxc/G+jbBlQemKu01/M7+l
	ghulndAGmUbTxuxiU+Z+gufCW03ZjEFZwhhNVL7v3nrQvd7F/C8A49SNxYy0iofS/HM=
X-Gm-Gg: AYBFou2b4MyYtdeaVrZbNOyv2PWIOYSPL0BN8bnME5sghVdPR8NgnkiE0VFtCinObUX
	d1kttf/I/7F6LTVwo0lmtNtm2ryTZ+reKteEBYbHIsRkRCQTzuFktLDOwimlJnSj8k5isZSWKkX
	XcVVmUJxlv+k+SAinfO7XkM4taQW/3ist0a3QrhKPJRXDvfhW7Il0PSt477OceijpICX/sOvIsU
	WjqzdiNui5WYLVZ4s+PEp4rl0XxcqN4J7ZMxCMBq8JY3tjSdh2Gn0Q95dOf80JciODIgAPtpS8S
	SJsEWNXCTPUd1wcFzDuhbXVyDAGr7Ug/hG+ncHFnr+1W4EN4Akwm+v0bh+Ze/ikYLFf8k2VdhmC
	LJiIEDo7L/QKQunh2NV3USI9XVouqudYni6iI3iRrramr/Bm6Ft9Uc05haZw2LxcbMSWnUabJw5
	fY3HE++nMeDXPNdbwU3NgqZw6k9fv80dEfkhK6zEzfT01C3PMTdvZXdiYhGWaSABID+SV7
X-Received: by 2002:a05:6a00:2daa:b0:874:708d:b635 with SMTP id d2e1a72fcca58-874df4049e0mr15317101b3a.33.1790008750156;
        Mon, 21 Sep 2026 09:39:10 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-877a6ae6f56sm3597430b3a.6.2026.09.21.09.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:39:09 -0700 (PDT)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
To: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: OMAP2+: remove unused ctrl_module_wkup_44xx.h header
Date: Mon, 21 Sep 2026 09:38:50 -0700
Message-ID: <179000865429.4136193.7908982571634163469.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918025316.375757-1-enelsonmoore@gmail.com>
References: <20260918025316.375757-1-enelsonmoore@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_093911_313349_DEE84313 
X-CRM114-Status: UNSURE (   8.41  )
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


On Thu, 17 Sep 2026 19:53:13 -0700, Ethan Nelson-Moore wrote:
> The last use of ctrl_module_wkup_44xx.h was removed in
> commit 6bf588595913 ("ARM: OMAP4: Ctrl module register define diet"),
> but it was left behind. Remove it.

Applied, thanks!

[1/1] ARM: OMAP2+: remove unused ctrl_module_wkup_44xx.h header
      commit: d1e94aea2b15f076d3f95b309fbb372a8fe2e9f0

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

