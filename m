Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEF1CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 07:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l7EX7vcwLIGLkhcOTF+L2EBQ6wXAup12KuoUfnu+n/g=; b=TSKaVwrvvvzVbQVtSlpEHDPkr1
	Lk/FWW5MP4HP1HEsFUsTTIhrDlJpPQDSV/j4V4Kzbb53M52gCRigXUcTeiLL8vvbw/S7OXT8C/8oK
	l2/cM2qEDtbrMIoOXQmKuVivelWafJZ1GYKoTjx6weZGs6CG7SRn/m1Y960yJ57M+heFrnfdRdhnO
	RTtftWl3XTc2alJIQa8JhE6UnTA3QU6ol7GN6eIhHBNhlRWFC0PLqLEtsdNOULSv1/dw+XbCCKKFm
	DrITgALl4h2BSwj+PMulQ9ZnTUthuEC7V2rSbJeJ6r21S4T+mqwe4c9E0k9jTXbt67GyUzPdwWOyx
	XTUq0ftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwH9-0000000ATCo-0SXu;
	Fri, 12 Jun 2026 07:25:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwH5-0000000ATCM-0i2y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 07:25:57 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso3501605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 00:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1781249153; x=1781853953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l7EX7vcwLIGLkhcOTF+L2EBQ6wXAup12KuoUfnu+n/g=;
        b=TSDPPlzBbQPuKJ7fHu4/mgX1UYltWRtDHTlDpMIMdl26fOM1xt81DVPyp6jEDKO90y
         pEQxUbyhOkq/Lzp0QtCE8jB7tJd2qWXX0LuhoXRd4eyM+Xb9QXYIoXs3+jduBbSSUG6p
         2QnLcdhSTjsVdusue86JXpdnAoqhx8oQyedqQrX7AFUCrecpx9ASKKQptJQzcRU0cuAr
         5zbFwgOFyIzyRWx7ryiLf0pIOGn91DhVjhv8+M0VnEaIz687iKfCLDyjjUb1WYzpQqP4
         vevxwI1cOcNewsgGdGFS0+8Upy70Io03sIMhLNSSjnMhMvQbDeMOvz4+ILep0naQOZOB
         H0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249153; x=1781853953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7EX7vcwLIGLkhcOTF+L2EBQ6wXAup12KuoUfnu+n/g=;
        b=TdWdlK+nB1Oc5MU4LWgWwqN0aYbF3OKMkMGixhgCfeUl3Pujr066YpX3TBZxEyWyxb
         XnHizUyFrDuFU7OJqhT6qG6FMSuVtx0tTESQHUH1j2M5IEAH0pUd0smvvy2t0bXBxllf
         /XuPusX+zgHiqeM3cv5iN1T73WsbuU1Q9stcvFx7wqQK/1lLaZ0IHlkThnq93yA7pwA+
         3vyFVwdgj/GS3DOsXRK93CzmfCfL7Tlp+llw50O5gO2URM1JRbN+BbBrJBEUDN2VE1Qv
         HX+vshW+jyS8YG91vrImkXX+RizhTUUHKaIVXrRguk8h3jn9ZMr5KXYpj1AQUYjpotrD
         KMjg==
X-Forwarded-Encrypted: i=1; AFNElJ/kLESnmkiEHrapuOvJq9EeRwNEqoFQ8CVae3VfyhzIQr2APdJLPI20Z3WwcXvodSnApmWeU/Ammzc4qzWEij43@lists.infradead.org
X-Gm-Message-State: AOJu0YwuOxjjzh0r559n6bz+4WAtYGj/dAeDGGB16rIkT0HkwunIO3Q6
	s52+xbV5uyqSx4b0sPbABxQ4t9N5o2nV7XPCth5/fvz9/2Jfp7TudVVvB13md+4WCtvjNleYHTe
	4wDOY
X-Gm-Gg: Acq92OEtS4tUboVivN1h/OcMu1P2wAhWI1e1/nH7TDnLi8f7nUjJI5aEY1/kHskF7JW
	Fd9NbO+MiN5NRv34uV/L8ZTgAa9vJ8lrW8+0Shn/1CbMWlc0m/RDrBVHOAtjSFCMn4hQ+fYvqse
	eaWPqUTvwUfich0hDnmVbZrpExwftVCJ0vR7N6CbQaFpCFpRpsqtW9ykRSXTv+9q7lt/7WRmxWI
	EUKwbAMiGJPlH7qLZ9QDCJszSegKyMTi4Y/nZF1l0L3/gWZ+8ppXU28TeVKxyccZYLB3UegtKfX
	JNLp4EQad6PZNJcEmb9F76hOcXhoF/9yd5Hx9vFiD1/T4kjFISBkP57xi7JYbse5nsALiMt71hh
	Hp5h36wO+Vqkg4CN0VLkS/+tw+0HxY3bKLspL7Vt5Ob1rvxQrf0wd4p71ZCzByQto5YyZdPnYGm
	EE+HHSoivRJDijN6ZSEs28rOf384FyEJGi78A3WGugZl+SKwkJklx82Pp1iesNL5xNBeSr6P7g6
	fQc5ZizPGfonIMMa8cJI5Xbz4VRiDdNsi3r7Uo=
X-Received: by 2002:a05:600c:5010:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-490ec4e1c7amr13862745e9.15.1781249153014;
        Fri, 12 Jun 2026 00:25:53 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea83d8f9sm47864355e9.9.2026.06.12.00.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:25:52 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ARM: dts: aspeed: g6: Add AST2600 pwm tacho controller
Date: Fri, 12 Jun 2026 07:23:40 +0000
Message-ID: <20260612072341.278591-1-gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_002555_677313_FD82D3A5 
X-CRM114-Status: UNSURE (   9.52  )
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

It use the existing ast2600-pwm-tach driver.
Placed according to bus adresses ordering.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 189bc3bbb47c..818d486b94ac 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -102,6 +102,15 @@ ahbc: bus@1e600000 {
 			reg = <0x1e600000 0x100>;
 		};
 
+		pwm_tach: pwm-tach-controller@1e610000 {
+			compatible = "aspeed,ast2600-pwm-tach";
+			reg = <0x1e610000 0x100>;
+			clocks = <&syscon ASPEED_CLK_AHB>;
+			resets = <&syscon ASPEED_RESET_PWM>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		fmc: spi@1e620000 {
 			reg = <0x1e620000 0xc4>, <0x20000000 0x10000000>;
 			#address-cells = <1>;
-- 
2.51.2


