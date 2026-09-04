Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567D9C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7o7pGTYJ1j9htjyKompyXPu5oGlEszk3L/eQl+FLhg=; b=Ou2V6aApoyDMODAu1EZXgOkGv1
	IZr9fsjASXg4ZwVKZzw7HHha2H4VPV1Iwr3Dk46J/x63o26q5+qoEplDV2QGuDV269QoH7ycLDqCe
	GvbBaMg560K+6iOFoa2jlh0V9nvHROGchFmUSQvc4rPFiF5gr3I6EbE4LQflfSnf3yBIrzvCOR7EW
	VOZE7ci2DVEpjHT8l60kiZFS3TM8Pm9GbwbkV6FEfJVjdDQ9KWkNKMJw0q3bn4NelO7T9JSqUWbN+
	w3c8xpefyxARiUllu+LAY4XsMlN8nfAwpgICvQpVsapzUJFf/ATFn6IQJ69GzOHkdOnqH4nmjk7wD
	V7flNoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tfe-000000026bJ-1vMh;
	Fri, 04 Sep 2026 13:09:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TfZ-000000026Wd-1J1d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:09:26 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so929625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 06:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527364; x=1789132164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7o7pGTYJ1j9htjyKompyXPu5oGlEszk3L/eQl+FLhg=;
        b=ipKz573IdnlcGH7T1lpimyKXwVeGbmhth5tgaN/1/8wXbs9x0cGnbG/T6RSMn6tu+o
         AJqpnGOy8f/d/TwwBcn3A67crw5TEGNZbKuxkUyMYhkZvP68vpUMHbxrOuQoZAhgzAtP
         mxnsWUp/3jByBXOhDXP30qVdhr5ZmHZFPwtZfuq489WikvF/Xze6Q61+NilkZrRnsg0t
         UqXk9WPOazPeJAnBib2E3GHMazE6LXZjlHJqS4+IsBGpP0IUekBECo40TVeLT8HKvixt
         oCgOAV5IXm70yZAgQ+cgIv9KIXLsc8xhOxsAtQPHTTbcW6MSZcugCldQPpJQiq+Dsp4d
         M6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527364; x=1789132164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t7o7pGTYJ1j9htjyKompyXPu5oGlEszk3L/eQl+FLhg=;
        b=iyUl7nnFHxDAnJoRVYI2VxuiPAi0zNGqZeeytf4zZa7YNgyK7FEAn5r2Np54wimWIW
         fy9SdoZ6pYxOBvzxOOrkOGUX74SYrGcjnsd+fNsz8NH2Oz77xkWRnxubtb40mRP15Zmy
         lVDWOPqCbMWLn448cYxAjSwnffD2ezD4zffO+8KKht5/rg3uL7aEHTmaFiXNj8Ap9tHR
         P6XYiFIrWhTtiVYMTLMqLjb36R5ruQyyMisomJmMDBaEKx0VMYydTwnapPcO/ersKpyt
         iEdBGYK9tuBM594xsGXfbpiAz7Xmcd4qMdMPXdVv3rRDA1Ti9sZQySGAD+zgPCfd2kVu
         9V5g==
X-Forwarded-Encrypted: i=1; AKwUvBxlMwewNEA5hgvkEBpYwNea96I+no1P3ysDhbQp8jTzHyqjdac3ljto1VH94mpCcDXUDf0A7csqEmiAARqUt6Kd@lists.infradead.org
X-Gm-Message-State: AFuF++k7wcAniyp7ZV46I5FBafGBaMIMg9nab+gNzth4ew7y8+/z3lZx
	X9pL5QVeN5O5H1NdYuv6JB/GG3BLORAU8/Jpcq/2IubsBV3+4rX2WA/H
X-Gm-Gg: AYBFou0glLobqXGiWFiWTkyP2iH7bEBfcWGDjJkT5RhSjBGdhaoSB4gG+yLcvzS4eih
	aisKPkW+5DSjWEsutJ7adsLCbGGcwKKom8oc/z92o2Hz07QgNLAP+LrJoG8EcfCaBWjc26q6Dw8
	nLZphlQasBVn580MJK8O4AeYhVatOlA+xxeJgTXECu5VInH3l9omuYOG3BdIzzeW6/zm+3hFEv1
	XVsDcXdGcLS9zuYnYuDa24JSMQxJHkz8Cc4gaJzMYsHLFHDygwv7y64qvxMJW5f7350WwTxBfBk
	UoxCq0u56q2iyRfBzXMXw+GsxMrj839d1LYti1hCa8aSwHKnpySyAA7r4xziOTmaKjlSa2GFEFy
	KAIKbK4PdaWM5m6xgf9+efZhP944H/7uenOf4zbl7Aj4mf7EvZWWtFizuUQfdvl4FsjcWd3I5eT
	p1ZYSzXmr/QmN2Xz6Mgq8/SgeH+wSKByW9jb0y2sSIXgPdbQa10rFuM4vFOTJNDkif36EhYYNdN
	V80WYDoaXV/VcygY82CjP04qY8Op6KH18mHq1N3WVqeLS6WBFoH3Etn6ESoxMvkz8MWr86J4TKV
	P8E=
X-Received: by 2002:a05:600c:8b6d:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49cf82420afmr41030795e9.1.1788527363631;
        Fri, 04 Sep 2026 06:09:23 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135575435e9.3.2026.09.04.06.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:09:23 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 1/7] accel/rocket: request the core clocks by name
Date: Fri,  4 Sep 2026 15:08:52 +0200
Message-ID: <20260904130858.27803-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_060925_395731_C9D5E781 
X-CRM114-Status: GOOD (  19.43  )
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
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, NanoPC-T6 Plus
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Jiaxing Hu <gahing@gahingwoo.com>
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
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


