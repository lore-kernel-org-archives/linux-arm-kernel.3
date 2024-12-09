Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEFBE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZaKRkQ++zE9MSO9ISV6gYj3UsACoYvIwFoqWZLd5Wt8=; b=xLhOuJ2ttNlbGgsMPtS43JSTPS
	Jo20oy8zI5tqlXa/FK+l7sUd+6wHqbCcgFYppWhqjumXUlfMeZc4CT8XnJ4gtAYaxQ+oedUA+3hPI
	TQxrJ693V92mY0tjCxgWKpGWIGQY1tY0WGBPKUqcDsETlwf/43zCIw2uwDrtpdV4AndTc7UpCO9ZN
	HtME1Zu7ykd5PFdahCILVsqC3HIi4xUtj764+0WmZQIMlGTlk5tGDXg1tAcetUywyG29YYf5BpCtU
	0BSQxc/jLcws8ALKqJurDYY7+JBVwFuwgwg0ZzLTr9IJ6AwTkvm1lcTk5UcLOH+IHyGDgR0wChlN0
	5yARGrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbyD-00000007VDP-0HEG;
	Mon, 09 Dec 2024 11:30:33 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbx8-00000007Usy-1Lod
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 11:29:28 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d3c0bd1cc4so240612a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 03:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733743764; x=1734348564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaKRkQ++zE9MSO9ISV6gYj3UsACoYvIwFoqWZLd5Wt8=;
        b=sTe214HUcbLUGIenYT04uGTBnfN+yUoQBOimh7XRFTxdqSAffEQFJSeBfZjkY4qMgq
         NlqBNM0t5rRZRrKfbA4BQIqD1uOHfvQIxnbqzVh99iPu5SPXFFSaEHOUggWKD4gt5KWo
         T1phjAQ5fiWdPX1y+QTpWZotFLuqoz+crx+We0CtiZnASgGk9CtXhxxlB+sZXvPeeVZj
         4tz645qarz4aLe16GVyQg2BKj22bcZ51s2TK3j89bsOywnOt+RO1AGZjECoiq7+lrv13
         Jj+0/ukR6vizDelbFgM3kw8PgwmPXUyLTnCgX9mA+1w+ceaDankYGXk1ww2HY9Wz7K9o
         uEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733743764; x=1734348564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZaKRkQ++zE9MSO9ISV6gYj3UsACoYvIwFoqWZLd5Wt8=;
        b=RyKPLme00lhCPcAfgboMqZ++CzxKfQBVHCOnMjvirbbj9eiJN2Guoe3evxt9c5kNlc
         hayy8aNIKKLPXIaz/kHeCGNWeftuN/hK5x9mA/JcIIWt3OlUdlFMfPb69BxQsl6467i2
         1JevI2GJMMZL0jWeYgfAfyt6KsHVj5SlWDPM2cbC+6UsMRWhZQinxaNElak+H449tSRc
         roijL01ymhReEOAtMjXdS3SlENQmQrUVCXOEALnyIUdI3KFhMsh60YvO0oID9THxBPY+
         ytUsi1ViqZG/h2somTX76s5gHRVSFQL8WlRs0V4HHGbMSxKutt/srjmbaqNZamPDKmHO
         eeIw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ4T3Pa1OtPo/Je6pUwwk7FarEp2i/tkt1QC6eEwG9fmJfXtJRvdp0TID7sOl740Uxr6zsKvWAfmOOqrgJXW5c@lists.infradead.org
X-Gm-Message-State: AOJu0YyGCZMloGHLhaArhRJVmIoxS8MBekrYvghLPdFbiYzHvB/PUWzP
	NvnvciQ11Pph3L9e0uHqL2RmXVDS+gEl0WTyWib+ZPWK2yB+BCm6L8WJ9w/xGzM=
X-Gm-Gg: ASbGncuAL+HJBoz4zTUyF7aeuEGE5h+/bXRjdd+paFzr5H1BxalkDqHfdZBn99ew1Pb
	oba+ToUr6Zt0Mc2zdNUkbdwCeLY+Wrn3tfsXNnvyCy3qm72C7hRBxJkNUGJBuO+HkUfvhq3l1VV
	66Plq0qhoJzwMaaTbj6l7S1LAvup+9vLcwHO3eFPyucje5n5KMArqhBM6hgCnrV65tIg9E+/WF2
	lZeLUDaC7U7zH+O4gTvjy/nOuX5VHoEoY0/9YI6eDdd5slJEzwpSoa8mJ4eSQnpyDAb
X-Google-Smtp-Source: AGHT+IEnfZKzpVPLUq5YoVunalUaONsSympM3QhF2go/NVblXkK0DCFFX68Kg5WtSW1gpOjQLKqhQA==
X-Received: by 2002:a05:6402:43cc:b0:5d3:efcf:f163 with SMTP id 4fb4d7f45d1cf-5d3efcff680mr1894926a12.11.1733743764583;
        Mon, 09 Dec 2024 03:29:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7aaa09sm5976741a12.80.2024.12.09.03.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:29:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [RESEND PATCH] arm64: dts: mediatek: mt8183-kukui: align thermal node names with bindings
Date: Mon,  9 Dec 2024 12:29:20 +0100
Message-ID: <20241209112920.70060-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_032926_390866_04446903 
X-CRM114-Status: GOOD (  12.37  )
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

Bindings expect thermal zones node name to follow certain pattern.
This fixes dtbs_check warning:

  mt8183-kukui-jacuzzi-burnet.dtb: thermal-zones: 'tboard1', 'tboard2'
    do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Sent in July, then Chen-Yu pinged in October. Can you apply it?
https://lore.kernel.org/all/CAGXv+5HSZfr14K1sGky4g9Sik987DAisH7KTZn9v_svOwF+y6A@mail.gmail.com/
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 4b974bb781b1..2828f34949ae 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -944,13 +944,13 @@ &ssusb {
 };
 
 &thermal_zones {
-	tboard1 {
+	tboard1-thermal {
 		polling-delay = <1000>; /* milliseconds */
 		polling-delay-passive = <0>; /* milliseconds */
 		thermal-sensors = <&tboard_thermistor1>;
 	};
 
-	tboard2 {
+	tboard2-thermal {
 		polling-delay = <1000>; /* milliseconds */
 		polling-delay-passive = <0>; /* milliseconds */
 		thermal-sensors = <&tboard_thermistor2>;
-- 
2.43.0


