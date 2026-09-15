Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0FFC88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 11:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IL/M9C+9tQ0Kk34dqluvw+MHZP0Z0vOWF8jr2i8QPWY=; b=J1kC+iT326msXm52zyBPmFL0BS
	n2/B5fxhiUr1wI8fS5NMmJnpTXKqfFREVwP3+rBCPr+m3+sH2xybUhil9fGu53uybDMro7VyYm5NV
	ktMjtOTFspU17ifXhFDjOjfqpwTjVTPrVB+Kp4Muc5ZBqXQ/YXnW0CWUZSYgLavTMh2J5XSiKe4um
	jm2nZpNGo0ayAO90re5smBmg8XG9YvH30IMej9W30gfQGNzWuk1BzvI7fkpsWEy8HqR3JcbFBwOCS
	JgCvX0kDdD8vSTJ18+YrrFDaUi90LMlbaxAvHdJENc5djhar8EcYg916HC/HR/FrDfrq11+E/1UsC
	1jfLq7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RmP-00000006KcO-3kZo;
	Tue, 15 Sep 2026 11:56:53 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RmJ-00000006KZa-2cd5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 11:56:49 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so2340825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789473406; x=1790078206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IL/M9C+9tQ0Kk34dqluvw+MHZP0Z0vOWF8jr2i8QPWY=;
        b=tJhR8AkIQwzwOehuiaAJd2iThdLyQKEK0wD1WPqaScu2ezUt9piN0Y4MSP6wCu4UD3
         RkMLtYXlTxdMC21rBTEHjF5/+qE0kZNDNLombw0wH+Zrhu6Ptdo08WDxHd2a016Pcjj3
         zuOqVpSuDmklOJabcL+HOydzC7bEUOhsLHqDIyK0DDKeTwzcy8SSJud3RWhw0NDiHdqk
         a2m+j4/AQDxELZVqfOUh4+vQFDkKXCePmrDA75xm8RGDQeqyxE9U6Zhex/GZvd7taIjO
         qE6epV/dS4N+JnrOhAmDmOyEQncaIzpdNQ4nBYRkOgOvYrihKMT2E2kJ8CjUK1QZZqg7
         Nb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789473406; x=1790078206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IL/M9C+9tQ0Kk34dqluvw+MHZP0Z0vOWF8jr2i8QPWY=;
        b=xrkQKzLY7mMtv65Z2H8+BPw3jj4Br6b2s9vgnoFkDGfT+5xZLSP08JHoHPmXr9Cx81
         kpl/dVbHmgsu3TMTX5b3x/DVWbEm/AM2LFQJlu7ah5C2RkY0Djxyvl+NQeAdiIX91S/O
         6kuWxdQywd2zx1UQs2hnMTwrz6s30w7tWmN1nnIyhq4lfgatGGYmC06Z5X6fP88TEdDd
         onYMpH449U5f6CRp9n5ENQY94qKHm7y063lZB+iNKINoonxY2WXxcOklVFfnMWgJwzXR
         BmlC8GEbMWCW8jCVyMru+6yVdn3T805gfew0NVITSDcRfgVApjKQho9568Bt6yfFyI8w
         2XDA==
X-Forwarded-Encrypted: i=1; AKwUvBxfYjyroQ5YgW5DUCRhe26UfFQAct7kMyKHMy4m0cWZG7eu+8xh3WxOxNYFgry8CpNiG6c3U80FdTDDD4qcbEN3@lists.infradead.org
X-Gm-Message-State: AFuF++kk7ezIZDOG8w627n1uKXn/S1kVXAP05qj+f1kXv4VWxxlsERfn
	kbEZyMhEFr7ajf1Xh3m/1nljU5+TJdwm3qQf1vuYBPGutTwZ3/FBeJoAUClVVg==
X-Gm-Gg: AYBFou1JRH97dxeWI59cY0ktv9qkOsVX+0Uo/GDZnE+jDC6R1TVRpPURUGQJ/quGZwC
	0EFz6kIajgJ8IaS20RqQdEKY2UUnZqwFi+UoPUe6SL6zXZX3mLd/0WqYes9ncZJZ3Ih5wufdQ3u
	4vJIFrgkGSjWaMu66MoTp/WyyfYBzgADNioPB8HUlmku/uE23e7sJJFe4/yDy1lH/+mnz3Wovju
	FXST7MEbjQ+60DhFYmUNa2kcX0sdiysKSMw27nJI37X3ZSoHwr7MPsQASuLuHrDZwAA7uJgwKLA
	eGNROFbbdVSkdURg95TulDrApzDevXO04JoDYrp9XM7VWYI4VtPPriyefQlKN+ABR/8ZAOPQJCL
	/RfuR//JjPthY77Vl/j+1H/bVmV+s2U6v9049+7M4UoqnENmtH/wuHfCD1CV+V2PMSjsKLkOiwF
	BDxgRWk77q8mfqTmJ1wtrqPXuB+7uwez8uY3Ln+QnXKGWqoJ2mjHIuVjrw8lVqQBeZ+pG+zWAKO
	szkltj/V5hiddzLd4iNBp1s4t1+saCPYNX1g7uakvLK7fzxxzaWO2tIu/PHdh+kPgM=
X-Received: by 2002:a05:600c:4e51:b0:49e:7cff:f8ca with SMTP id 5b1f17b1804b1-49e822a63ffmr11750555e9.29.1789473405919;
        Tue, 15 Sep 2026 04:56:45 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef88754sm63175565e9.13.2026.09.15.04.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:56:45 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Tue, 15 Sep 2026 13:56:40 +0200
Subject: [PATCH v2 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3576 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-csi-2-rcv-dts-v2-1-bdaf8141616a@gmail.com>
References: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
In-Reply-To: <20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789473404; l=1108;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=76t/6TvrHo/ckJ30OYPKat5fWAU1rA0fOHpl6d6Cs/A=;
 b=U/+xcpmDD44TQLOMhpTWGOwHvugHp+qVjCLKGJpJc12iRo2mVKucsEvPRwhvI7BINPCfkaRtm
 ERXc22c4d6aC02BGFdZ1GwYSFiZhhii8gTNoE53pdNPf+ra6wSiiQVc
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_045647_692934_99CFB49D 
X-CRM114-Status: GOOD (  11.88  )
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

The RK3576 MIPI CSI-2 receivers are compatible to the ones found in the
RK3568: the register map is identical. Add the RK3576 variant to the list
of compatible variants falling back to the RK3568 one.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 8bfad0fca3b7..1898f3787a98 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -23,6 +23,7 @@ properties:
           - rockchip,rk3568-mipi-csi2
       - items:
           - enum:
+              - rockchip,rk3576-mipi-csi2
               - rockchip,rk3588-mipi-csi2
           - const: rockchip,rk3568-mipi-csi2
 

-- 
2.43.0


