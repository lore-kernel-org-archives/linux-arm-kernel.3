Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB00CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B1gRGSjw2aAAw0vLwu9XQY6YhFjjAP3pnVdOLPu8WI4=; b=4YKlzNAaxLL013i1AcMKOEUcOQ
	XQnw8v1z72ULJpkx/3OOqPyNGYWl5P1ClZ/B+JJFuMavse4Fz0weimqQex2ZWLo+qjT0ndOwcdkve
	U3N+41ENVV/V8jeYehffvN0f8qNzltIfXR59fTugANX7w9IqwBjzkrCgLLcXlI4yajMo3gxMkqNL5
	0wrjKCeDudfPSesRqhYaks/hF2DcyNRWz61Ty8iM+LxUFkC1aZWiL2olrHcmAxXnW0SWxqgn5IpxT
	Ud4eSx9fJ3zAOW4rjnLJGKJbT/aofv82QnxtqTmOAFIljcTtBSJCpJzK47guGR6oRUHMfxVV5dG+j
	69NFM/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugXf-00000005VcV-2sLv;
	Sat, 06 Sep 2025 00:12:31 +0000
Received: from haruka.juszkiewicz.com.pl ([185.243.53.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubhC-00000003zFE-3tQ1;
	Fri, 05 Sep 2025 19:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=juszkiewicz.com.pl;
	s=mail; t=1757098920;
	bh=OajqByBsH5OPlXRdcq8gSwhpir9mkJFlhq+DtZdjgdI=;
	h=From:Date:Subject:To:Cc:From;
	b=7FZXBHoRYSwGBBrBLCOJJADr8bmZs3LwZrIyKHRnc+7sk7nlQPIdl6Y/dF9MKAr7O
	 7Vsp6FUout0+mrDKRKNtlNGK1YTsaTNUO1K/lJ3lWxB0Lv25OMHQZ9FNYfaervecMq
	 eWialhNQm7+AeO5PNvijdXMbJ7dzD/fl2vI5E7Av1u90U7ms244lZEtBfogU/lOgvG
	 Vhk38sDyZOgMO3kUK4h17jigh8t+CGEv5hfKbpCIZBqsqgdrquZCcP8s/5HPXOnraN
	 f6qcBZ3JTpEC+LHP4qhhW9Z4X2sfvf5es4bgeAaYXFbKyaOyLNAzy8Mfd+i9Ar2qV4
	 pBfBuO6C5ufUw==
Received: from utena.juszkiewicz.com.pl (utena.juszkiewicz.com.pl [158.101.208.177])
	by haruka.juszkiewicz.com.pl (Postfix) with ESMTPSA id 04B481FB29;
	Fri, 05 Sep 2025 21:02:00 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7AF3545439;
	Fri,  5 Sep 2025 21:01:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=juszkiewicz.com.pl;
	s=mail; t=1757098919;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=B1gRGSjw2aAAw0vLwu9XQY6YhFjjAP3pnVdOLPu8WI4=;
	b=EY3Rm5jggcZGpgieNP9yQ8+ZMZ8Hh1diTRhlS961pP4bMMQgbMgIcP6GiDK7O8Esa7Mk9Z
	924TAdvAKfcMbLUzGnPLwxraSHFmTsHOkiDc2+fdT/i3YHOrfyi+KB+7QJ9w02U9iXelkx
	QgEgiAMDOzVc0yDUWW6q0SkweWbUIuNlxg4uw9bhRUo0oqe5kHdDfIIgdPzZ0CEtD7FhXT
	KTh6X2BQMR7F9LJQpSFjZ79nsKUrqFplRWoGglLS3gPXLEWHqkUDSjHzGf9YqOaLgNKJnK
	pp1CNjAVYdyVFpIh6ipDbGikj1XZF5A+V5NNzoroQeyo9qoeDWE29K2UtDklng==
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Date: Fri, 05 Sep 2025 21:01:51 +0200
Subject: [PATCH v2] arm64: dts: rockchip: Add vcc supply for SPI Flash on
 NanoPC-T6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-nanopc-t6-spi-nor-v2-1-098b476d9509@juszkiewicz.com.pl>
X-B4-Tracking: v=1; b=H4sIAJ4zu2gC/x3MQQqAIBBA0avErBsQIaOuEi3CGWs2o2hEIN49a
 fkW/1conIULrEOFzI8UidphxwH8dejJKNQN1tjJLGZCPTQmj7fDkgQ1ZpwNkSdnwxJm6F3KHOT
 9n9ve2gciHILRYwAAAA==
X-Change-ID: 20250905-nanopc-t6-spi-nor-70ddcd62f9f7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_120203_149973_44319866 
X-CRM114-Status: UNSURE (   9.28  )
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

FriendlyELEC NanoPC-T6 LTS schematics shows VCC_1V8_S3 being used to
power SPI NOR chip.

This fixes the following kernel message:

spi-nor spi5.0: supply vcc not found, using dummy regulator

Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Message-ID: <1652891b3fd7e1d1a279a3eb0e7a05ac763e48fb.1757097941.git.mjuszkiewicz@redhat.com>
---
FriendlyELEC NanoPC-T6 LTS schematics shows VCC_1V8_S3 being used to
power SPI NOR chip.

This fixes the following kernel message:

spi-nor spi5.0: supply vcc not found, using dummy regulator
---
Changes in v2:
- fixed format of "vcc-supply" field
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 3d8b6f0c55418805c0d614a4d65f67b0c660ca0f..69833a0a94d0f18d9ca86005ac22e58f4c036fa8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -731,6 +731,7 @@ flash@0 {
 		spi-max-frequency = <104000000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&vcc_1v8_s3>;
 	};
 };
 

---
base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
change-id: 20250905-nanopc-t6-spi-nor-70ddcd62f9f7

Best regards,
-- 
Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>


