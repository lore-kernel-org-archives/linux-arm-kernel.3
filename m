Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDA6CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 02:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ePY+63uYRMrFDWAptdadiuSJ2ZP+/koDWoDpXgbL1M=; b=1MTx9KgFx/5u5r53GoVFtA1ou3
	kbjI3M91No3f+qlVi7CAtO8QXWiJz2gMTL/3xpi8Lp4h+yzbdZIh9sNKdZ5GaHeFAjMt/oG+kxMtR
	KAVBM5ZxkRyDU9aJovMcicn66N934HxvtnJnhQbmlVvruhmwbZ6d3En5AleM0coNA96sK3U8YAb5W
	Vj/o513VdYVHePrDOkz/9GTgyuAWfKIQ3QqDht1lhh26pQquPprJ5+cA6HbwIFLih3ONpw40E1+g0
	bhgq7j7BkCWVxFnn6iEjkJAHMLti83ZjtFnMmXZ7C5006R5pTIURgjMxC/E8I1CmTqPm7GhtflDN3
	B2wynbYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSJk-0000000BoBq-2EB1;
	Tue, 13 Oct 2026 02:32:40 +0000
Received: from mail-qk2-x08.google.com ([2607:f8b0:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSJh-0000000BoAJ-1bnf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 02:32:38 +0000
Received: by mail-qk2-x08.google.com with SMTP id af79cd13be357-9369a6afaf8so134359485a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 19:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791858755; x=1792463555; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ePY+63uYRMrFDWAptdadiuSJ2ZP+/koDWoDpXgbL1M=;
        b=gRgzfueBlnNkFm1aXuqYWjwL/b3/o6D4yC7K161NHHSpjuOP8XBukiT4RtOHeKlhHE
         6/ZHNLAOp+kIERdPlz7gm+A+6Z8PeTvAuf9FGtmnkPtwHZH91b5QQDGTrZQfN8USf43r
         3vL+0dep4My7VlGr8b62KDQKR16C7vxQeboq6hV8urDSqtRArkgNDZDY7PGfteUW2Q0Y
         vfQRM8kLmL96IHLLbRAmputxcXr79bOZ8Go7UIqKRlA/XXKyoVBIiT2zVfyU93UZsAmQ
         b1frAiLnenbq7OGIUP8D3sjLWkL2h4KgwJ0HKtbQvheTt4YKLm5//ZND2M0ebTYNTNi7
         teYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791858755; x=1792463555;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ePY+63uYRMrFDWAptdadiuSJ2ZP+/koDWoDpXgbL1M=;
        b=xmWBVylcGQgVGk6+U1qUDuDSKlt3TNfaJtHipQdkYbwaeO3EA+/SsWwtbRuvNkaa1c
         glp23BD3yiyGQCwlL+Ep55xScEGWmenGltMyk3bIo5phluLy6gxg1HKenc5S1udwixkU
         QArgTnxFzevQqE/LmEV+L/trpdQKSa5pN80DMPGh8UBkNEg7MlpUt2eg7MUHFWzyV3FZ
         swQVsMtDZhgZr+RTRCtRCt6Nqjnhko1SH1dbxtUD1yLh5xipLpeOxEpLcTnqiYuhHdq/
         FjTZoogVtRRCIi/xq7tTNLaJO2t4m85sYoTwUjwx7epPLtUYT+pqOBEplK0kG6xFazks
         FGHg==
X-Forwarded-Encrypted: i=1; AKwUvByRxkOoddcWpGZnlEx8v9BvknYXhSYBXvo8J1GS2vXFv1C1d4FdktaBDAtBMnx51g+oa4nvehm90CES0Cpblg0i@lists.infradead.org
X-Gm-Message-State: AFq9FYLrnd82/av3v2+3sQiT+lk9kpnGV1XHlL0Cv7qvQtWo2QgC39c/
	vQvM9vj4sruNS94Pxyl0lEU+ltw66J6KJHgEwQC48JImleIoExBc0obE1cTu/Bq0NTs=
X-Gm-Gg: AYBFou3+odwaDE6gDuTuIxpJjN2GBmk8q4zwql+AnXd1g58H+RdxvJa1SOfV2oexjHY
	6Me2kjUx8v9uI/awn8U01j8pNSm6gQGPTkuDtpUkJ6aAYNjXf3oT3Sjg/TyGtOvFQHL/LmuMOrk
	9huibKBidS7uQ6QHRpRfuX8lpTbW7UkAV3IJ8Ii194b91lN7bJXm6x9oXANoL+yVB6ZPqryDBPv
	tGm0xfsyBGlCKz0upaHqpGhOu7XcU4CSlLsfgtS/ZVtf4Kf39XWySJhFJU98cd886y/Lx9kucxv
	O8/XR1WwLb8SuVhEeHb64Kq0q0vMNOG0NZS7C36XfGnd+SkdO1NiHs3NUSOcsHOOQraIWuCJkvU
	4dL0MugyDA9OkoGU2aRlynVmeLh91qyLFz9VMCHG1KYBi733PeYECVjiIBt5o8O9adCacpPFpAW
	Vzjw8rT7lQSK/9YLpdDsBk70KkCOJs5EkD6b6Spc5Dw7QvIiwg9cW1A/xid7ElaUZPux0MCFqLI
	5MWL/A=
X-Received: by 2002:a05:620a:4552:b0:93c:6abf:c8ae with SMTP id af79cd13be357-93ebd231201mr1979508485a.50.1791858755323;
        Mon, 12 Oct 2026 19:32:35 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:8019:c46c:3784:400f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef500973asm134755585a.15.2026.10.12.19.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:32:34 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 0/6] AFBC fixes for MediaTek DRM
Date: Mon, 12 Oct 2026 22:32:22 -0400
Message-ID: <20261013023224.2195490-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cc128facb246d89408cf46aa7c9e250c56900940.camel@collabora.com>
References: <cc128facb246d89408cf46aa7c9e250c56900940.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_193237_434179_E094A9AC 
X-CRM114-Status: GOOD (  19.90  )
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

Hi Nícolas,

On Fri, Jan 9, 2026, Nícolas F. R. A. Prado wrote:
> I received a suggestion that the Lx_2ND_SUBBUF bit in OVL is not needed
> when cropping is not enabled, and that removing it should fix the extra
> pixels after the image described in 2.a., and perhaps even fix AFBC not
> working with MT8188, though I haven't had time to test it.

I tried this on an MT8189 Chromebook (Lenovo IdeaPad Slim 3 Chromebook,
board "quigon" of the skywalker family), and the suggestion holds there.

Setup: next-20261008 with the posted MT8189 display series and this
board's DT, plus patches 1-4 and 6 of this RFC (5 is MT8188-only; the
MT8189 OVL uses the MT8195 data). AFBC announced on OVL0 only, which
drives the internal 1920x1200 eDP panel. Mesa 26.2.4 Panfrost
(Mali-G57), Hyprland. The compositor picked AFBC 32x8|SPLIT|SPARSE for
both the 1920x1200 primary plane and the 512x512 cursor plane.

With the series as posted, I see what you list as 2.a: the top 4 rows
are missing, and stray pixels show up after the image (here right below
the cursor, on the cursor plane). On top of that, the IOMMU reports read
faults from the display side while AFBC layers are on:

  mtk-iommu 1e802000.iommu: fault type=0x5 iova=0xfad06000 pa=0x0 master=0x21810410(larb=1 port=4) layer=1 read

(always larb 1 port 4, two different iovas, presumably one per plane)

With OVL_PITCH_MSB_2ND_SUBBUF left out of DISP_REG_OVL_PITCH_MSB for
these layers, the picture is correct (nothing missing at the top, no
stray pixels) and there are no faults. I made the bit switchable at
runtime to check that it is the cause: with the bit off, 0 faults in
30 s; set again, 20 faults in the next 10 s and the artifacts are back;
off again, the faults stop once both planes have been updated.

What I run now sets it only when the layer is cropped, going by the
suggestion:

	bool cropped = pending->clip_left || pending->clip_right ||
		       pending->clip_top || pending->clip_bottom;

	mtk_ddp_write_relaxed(cmdq_pkt,
			      (cropped ? OVL_PITCH_MSB_2ND_SUBBUF : 0) | pitch_msb,
			      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH_MSB(idx));

I haven't been able to exercise a cropped AFBC layer here (the
compositor only uses full-screen and cursor planes), so I can't say
whether the bit is right in that case. I also haven't tried the
resolutions from 2.b/2.c or the external pipeline (OVL1).

I can test a v2 on MT8189. The board's patches and notes are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy

The testing was done with help from an AI assistant (Claude).

Thanks,
zoan37

