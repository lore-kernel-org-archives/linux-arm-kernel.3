Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2118DC982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHpblPyGPvzLFJJQPED7TjfXg7mj3B+pu1lqZzx1RFk=; b=L05QekK0RBpQIRF1VS/snu5PO+
	Wmm16OOAHvtySNGtWyi2mufCKr0nQO6fBswGTFs5tOhG1lvl+sbLHCYgxWNS0bVIGVbo5zO/zqlnG
	nx1LZzbgBG0Qmp6qn+WIIlHlkrUcbj2BZ0VbhYPWib55+GkGJ08U+fSfDjAQUiu096bM7qr6CBVWK
	M4FEi71TWE7ENNemvdqiPOTHZfj08UJrOp+iajG+f/DmUIl6QxJUHJ3gDIjPtDdukiIjNv2VCNOOu
	zS40+ggAKJ6vDRWMifSw1dnoPRVWd+VhJaSXIyzeUcKiGRKXIlEQWG227zgWh4eC4WHAjZrUMRmev
	tF0EdeJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UkQ-0000000DvDG-00oo;
	Fri, 18 Sep 2026 09:19:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UkP-0000000DvBk-144i
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 09:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kHpblPyGPvzLFJJQPED7TjfXg7mj3B+pu1lqZzx1RFk=; b=QfKcxxU1sYE1KXhaFD2eUC/iY2
	gi2HQhPUHLIOjUn7y1GgDdVuEcnk95JdklKklGI21IBoTW5NW31T2+o4w/HsYUSGPwAKdF1LNgvfm
	R8orj2brbtnYw7KxkFj7i99tRC9xYBhEX8Nx1puNOg6raIa5X4goY6Cl7E9CiQD4v07woYfUQMW7+
	VGcBIJ+YY8Es4u+F03nBezra0gLNVGapFN94S18f4LM6zhoN7n1XpANYifpSxZuZ84fs5fhh7uzXO
	2iJlKpN94LborWZ1EtlVqHEfW8KV8T+FtNXfjVUDnr3GVff0AWeZuXMc5acRUXpdv0tSsed6nCqdy
	jARk4fHw==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7UkL-00000009qZE-2muT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:19:08 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e721b5503so5150995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723144; x=1790327944; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHpblPyGPvzLFJJQPED7TjfXg7mj3B+pu1lqZzx1RFk=;
        b=oodE/Ruo+j456k70IqdVIq0s/HlqBc4jFZ9vXNlrKeKxJ1Oi9r2vtd++eW3bHbkrPi
         ONbIbMvjej4aOqqIw5nwblgUFB5hNF81MaSItj+OdXPoAzzzhHIquKKrrNdoQWPR0yzU
         Ee0KUgQ6nx0QANzKoHPf1TWRn2D++YcEDLTL6bVslIMzccJfEmN0kvUhwlHBFpDmphZY
         a8/ALZLh8Kg7D5Rah/MjO7WGRt1x7n7ZMmEt2SKwc1HuBAZAKsd8KOvWUn2k8R9KuqZZ
         y1vmQ31kCEpxhFtKLiW5m3VDIUiP3HeCdW7uN3WhUi8BeInfgCNOSgMfFjW2Us3YTqlr
         Rxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723144; x=1790327944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kHpblPyGPvzLFJJQPED7TjfXg7mj3B+pu1lqZzx1RFk=;
        b=osO7gTPOEHiavQna0JtTaFue6MJo0x9mJ+0qOQOmWg5ieej1RnmkpwVMo7RRqSD9+Z
         o/qO0PsMy3xRCB8AKgCPQ20NBSTRV24y65RRUwmxSrFCN1+M37GDb8StXEpnNQ5Hrpff
         nHE53OpfizgvDOxZMJEZ0BPBeY1XydbcBlyEZU3EObVwqcxFvuhudf8tOXCRajvyd/7c
         5B+8b1Sd0AbFewSj+IK0ZIT6D/IwaHdLD17n8HrcliweBw/XjAIjg5ifGA9jygKj471S
         Im/rIXuUBUIPYudOseev5IOh/hAxe/KjHpDLsp0F52Yf3Pr7z/qnGUDRFZY9lJIlzw8c
         KCJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOLgK1fAaU6jRgCk/0U98AzeAGp8MiMSWafVaJVNVP9MEtkOzP1B+4dHPFBI1JyzrDcBo3oLvBeQNfPxjwWduk@lists.infradead.org
X-Gm-Message-State: AFuF++mVQ4l69ngOhKsyK/cPluK4bxYp9B1cF2Sunc4HQQ2MRAbEkDUb
	fM1bHkThx3v2FxyeHzk35sSeYpVZ/xixmGnnRrOe0humu/9N7YDNOkOLySZetxRsHhw=
X-Gm-Gg: AYBFou2nGnI8BhtZkNO20F4ugziwUwFk6rARKvqQ5W68uaA9AIEtSwHRP6xOsV4cPi+
	BGAiZbzCng1pIysPo6U0tt4LEk0T9VNoq8eM72XUrW50AkZOO2MdGOMdzFdH1126sW+perDZJ+I
	Y7pTZne/WEoaUH3TvfCinsE23P1lBOjXAsyXIolrnSleXRDoX6TDowUYHdYzQXLuBfL9PVCiETW
	hQ4F7COEc+odeYyYkk2xloRB6GrBldWk5hx69PRz4cgIZU983u8u6QppwrXzb3Ygy6phmBMtEQn
	9wz5Tsq0PB+QcupAxjs652yNM1Wvat4hhyRydUAtHRFk0JNTd6lhkgOOK/ZIrWM1OaABq6rF8/7
	5HzRaEa+WrUfk31VPUIjUyu7uxSXjUuwKjkV5g0jZkLezfQiJRNhhicdRwrgKJQW0LkpU34iZM2
	FU1EncPSHExOv3plBMZsdtNsAcMbTnuY0rdRdZK7y6Ws+O+Ivh1WyLyYjMWJloGK+Q3xY=
X-Received: by 2002:a05:600c:4505:b0:49e:84bf:6121 with SMTP id 5b1f17b1804b1-49fc56dac58mr22897685e9.13.1789723144132;
        Fri, 18 Sep 2026 02:19:04 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7d4b9ecsm38524255e9.14.2026.09.18.02.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:03 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:48 +0200
Subject: [PATCH v9 4/9] arm64: dts: ti: k3-am62p-verdin: Fix wkup R5F
 memory region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-4-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Bw9T9kPoDvx3jWedb2GuXmBKbd8nnRyCUqGqNMfPoNQ=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jBe7CzRZcpRcuvewa1x5NO164+TseMH5R0Q7Ha2VV
 zpuM+3qKGVhEONikBVTZOlMDE37L7/zWPKiZZth5rAygQxh4OIUgIn8FWJkeCgslX5SN1vQ9cPG
 jve+i0P3M/e/3TFTI/f/HAPXL7vWsjH8jw7+OF2esbPB4q5za5es4Bpl+4SnRxZtllqSrc3topf
 HBQA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_101906_386231_1E28DEFD 
X-CRM114-Status: GOOD (  11.22  )
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

The wkup_r5fss0_core0_memory_region was reserved with
0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 7ee894d59113..8a5ff5c45757 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -170,7 +170,7 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 	};

-- 
2.55.0


