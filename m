Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A6CC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGF28/ongkg1pjDH+01IcEm6dgrPiae6qX55Ok4Xvzs=; b=tIqlhdJHFH5qq5JDaATH/jCiYj
	Lq15aob2LKgzZNVzqX61ZYNSEypttVSyLAHIWAERboQOeKIsfPfVwsapcUo2vLanWBLWbhx9DMobY
	kI/jeq8Gevdj0egp3uu8or4/V4QWpDr/Q4AQTT7K+Npcv4dogUTVE/6gmz0k90AERDiy3gSjq3H8f
	1kF6mWLjoh5ywBuAWGiAxmc60K1+QqwB29DAkaYdJRnH1oNjGD+336dmWn5tgE1OGcogVjnObF152
	AxFtZWzukDrjfoGuRz0i545shMs8tU0bWiQGy2qwcQXCsZpWRl+XdMOy3QpZ5Cuirha2ORlmJ9WDK
	QrcTQ9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vRo-00000004aTW-1ym5;
	Tue, 22 Sep 2026 08:01:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vRa-00000004aGU-327j
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hGF28/ongkg1pjDH+01IcEm6dgrPiae6qX55Ok4Xvzs=; b=o9A1U5YZTzAHceA3hIpyXurScx
	8MuoH+LciUSBUyP56VdEMZ+VNUP+94lVSWwZHlPmzG3GFT2eNmDRI8zeBf/2wEyw50+b6C6rNKz+l
	V7J5HKeCIPEAkNZfC067eGMkh5OOojD5DCcBu8VyJx8xsogiTzNhyuBZDl11scF07Kl+3x/Z3vGHj
	7HHSTrpk06BHgMuclfB3S07TCW25V6nnPbS4y7S7VW4u9S6rf3ivUg+K6kkHdbaWMxYXbAgbSDYl4
	6OCkMeigV83dPdmDsJC5C09w+lu8WZJVAzDHhz5XQgxit9vq3EUZ1oew91u89Nq/Esz6kXJgj3dZq
	vPp3urKg==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8vRX-0000000DEeT-0dIW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:01:37 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49fbca514f8so2712645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064092; x=1790668892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGF28/ongkg1pjDH+01IcEm6dgrPiae6qX55Ok4Xvzs=;
        b=mFcGBUo1NibFEWB+t7/9fugEGGJgkS5k7r2Fu5iz+/wRwEOmP6FAxlcEtebHx2nzas
         KzAogQdNwOeDeTVgVa7yPcS4wVQvTWNWGfJoiSxN8VjrF/sK2TCznfolgBld8zjH6swn
         eJkRKnRqzSiV2EAkQ3qXqhs/B2Hkd2kFzhXXm9pzG7B8y9m9676IBDQEe82vUHfM7/UG
         fxWFoPqRjTi+5zjy1TqydSLAusTAaZZnu9dlKj+mPUbgrPpe51tWHEWq+56xrCv4kP5j
         5y+27ZEcL/nhCS6wnWCYQFTSityOhAa5leKhNl8l8MzTmPkay97AX6P8UVUmueByerYG
         BHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064092; x=1790668892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hGF28/ongkg1pjDH+01IcEm6dgrPiae6qX55Ok4Xvzs=;
        b=p5zl+ZRaUhgrHd9FZsiQQkIyKeKioRtrTaNHnf0SK0Q0r91KeGj0BzwuuWejjdqXvu
         pl4eAT01n9JL9ZKNizNd8SAdyD9b2EUUj/S//u+C6lgY9Qwc6UK7OngCKz8oOd5w5ItZ
         rJnlC4OPuJEpAh8J622Lq9pPQbpeobIr3r8fM/DePIesQmg92hNFSubl6ELHqFuoZ28m
         LoPRTSAY0lkCxccJicM/4YVt1Wt/tYTnFTldfdDFSFxtaJyKwC5F+psyc1OYVa92Q1sf
         jiA7Mn4WbhLvmxyJr3Sj7/2c95hssyzCgamqL1HvHBuQU0wSaS6y5Y4AF+wdmp+JaJb0
         uEiA==
X-Forwarded-Encrypted: i=1; AKwUvBzueChKE2slgJDg0ia4B10oMNJV68whZE+3arvJhEDVRtdm5hmPyGfirB4BO4cbqjr9DWw79tl7/9bSoEDULS0h@lists.infradead.org
X-Gm-Message-State: AFuF++l65j6/OethKdyvWFhRHhyDob0K+sXHZ2NAH6eY+/lSirOrDje+
	IoGtnSzREXYRKO/ihG/H3Em/USnu69PZhxCgkw6feHfmA0PQWiHXpm/9
X-Gm-Gg: AYBFou0gu5ZkO5dpntxXX11JPEV+Z0q00DxWsMTLrYBPQEFXINTeUqIDYP/AQQTKVVx
	zk0/uIvBQnkjjWEGKNYoEGhmSriAVIfKdXyonMcjo4l2qIv/Nc4k5fcI8xZ3rZ/TrDZpQEEhDZN
	eRlZH7bJK1Pvxr/mr/gBgPuoJL/Bz1nEx0sOjOJEwZc0q5nh4tornwDqIS/Pgl6JMsUUtl9SK7B
	w7280YSHkR5erLwZyEgwMEKo+aC/ycWHtMq2C6VUzCMasfpEJXO4572yvfJnQGfgIgtaklBbk1m
	GSWJszJIMtCl+4ZNG5x6aKfMM+UhJ3qo73A98XobmuQP+F7YYeg08e+ntCUMFMg0e+o6+1KN5oM
	YETckfNLfTK/jrIphd7wC65GbEydup1KdhtQji38buboBKopKuVf+FeXRkDe98nHEwaqULbargp
	V6SG53nzQ/pkEaLo5Kp82YIk5Il0C673adkIVskPNM9dTdhhcu+nS4dMnAfGtyYlo0WXBuR+VaI
	WfSj9y+CePftV41QD7qVCdFfBoqBeNK6opOzOM0DzIHsA3G3X3XIjUeAZ0SOmw7rB0FZTKIChMZ
	UIE=
X-Received: by 2002:a05:600c:3b99:b0:49e:6683:d227 with SMTP id 5b1f17b1804b1-49fc7bbfe4bmr199176535e9.0.1790064092385;
        Tue, 22 Sep 2026 01:01:32 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:31 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 05/11] accel/rocket: request the core clocks by name
Date: Tue, 22 Sep 2026 10:01:08 +0200
Message-ID: <20260922080114.44662-6-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_090135_771845_F392D5C2 
X-CRM114-Status: GOOD (  19.84  )
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

rocket_core_init() hands core->clks to devm_clk_bulk_get() without ever
setting the .id members. The rocket_core array is allocated with
devm_kcalloc() in rocket_device_init(), and rocket_probe() only fills in
.rdev, .dev and .index, so all four clk_bulk_data entries are requested
with a NULL con_id (unlike core->resets, whose ids are set a few lines
above).

clk_get(dev, NULL) ends up in of_clk_get_hw(np, 0, NULL), and
of_parse_clkspec() only consults "clock-names" when a name was passed,
so the index stays 0 for all four entries. Every entry therefore ends up
holding a handle to the *first* clock of the DT "clocks" property, i.e.
ACLK_NPUn. Nothing fails: probe succeeds and the driver believes it owns
four different clocks.

The consequence is that rocket_device_runtime_resume() prepares and
enables the AXI clock four times, while hclk, pclk and - most
importantly - the NPU compute clock ("npu", SCMI_CLK_NPU on RK3588) are
never prepared or enabled by this driver at all. The NPU still works
only because the Rockchip power-domain driver sets GENPD_FLAG_PM_CLK and
its attach_dev() callback walks the device node with of_clk_get() and
adds every clock to the pm_clk list, so genpd happens to keep the
remaining clocks running. The bug is therefore latent today, but it
means the driver holds no reference to the clock that actually feeds the
NPU, which stands in the way of any future frequency scaling
(OPP/devfreq) work.

Found on an Orange Pi 5 Plus (RK3588) by reading the live clock tree:
/sys/kernel/debug/clk/clk_summary shows four "fdab0000.npu" consumer
handles on aclk_npu0 (and likewise on aclk_npu1/aclk_npu2 for the other
two cores), while hclk_npu0, pclk_npu_root and scmi_clk_npu have no
"fdab0000.npu" consumer at all - their only consumers are the
"npu@fdab0000" handles created by the power-domain driver via
of_clk_get().

Set the ids explicitly, in the order mandated by the binding
(Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml):
aclk, hclk, npu, pclk. After the change the driver holds one handle per
distinct clock and clk_bulk_prepare_enable() covers all four.

Note that this is a user-visible tightening for out-of-tree DTs: the
old NULL-id requests resolved by index and succeeded no matter what
"clock-names" contained, while the named requests fail probe with
-ENOENT when one of the four names is missing. That is the right
outcome for in-tree users - the binding requires exactly these four
clock-names and rk3588-base.dtsi carries them on all three cores - but
a DT that relied on the permissive lookup goes from silently running on
the wrong clock handles to not probing at all, so record the change
here where git log will find it.

Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, NanoPC-T6 Plus
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Jiaxing Hu <gahing@gahingwoo.com>
---
Same diff and the same message text (his copy re-wraps the lines) as
01/14 of Jiaxing Hu's RK3576 series, which carries this patch as well;
whichever lands first, the other drops it. The trailers differ: Jiaxing
asked me to drop his Signed-off-by from my own posting of it, as he did
not pass this copy along, and Assisted-by is added because an LLM helped
with the checks on this v2.

 drivers/accel/rocket/rocket_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index b3b2fa9ba645a..5dd260bacbff6 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -28,6 +28,10 @@ int rocket_core_init(struct rocket_core *core)
 	if (err)
 		return dev_err_probe(dev, err, "failed to get resets for core %d\n", core->index);
 
+	core->clks[0].id = "aclk";
+	core->clks[1].id = "hclk";
+	core->clks[2].id = "npu";
+	core->clks[3].id = "pclk";
 	err = devm_clk_bulk_get(dev, ARRAY_SIZE(core->clks), core->clks);
 	if (err)
 		return dev_err_probe(dev, err, "failed to get clocks for core %d\n", core->index);
-- 
2.43.0


