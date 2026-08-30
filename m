Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85589C61DF1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHhYLBIKN1DN/F0wUoE/Pe+3b3oJJH7KQIoUXmxvOHE=; b=zzU8XCttrC0pKe9Vrwg5vV1g3y
	yQNHL0n6xDzp4QYlkft5wA+q6BLrdHr9b9YmCnnpFeWSvqiZe+iaF+A3dxAUf7YOIHERA0PJ240zR
	0WHBo7lBSBCC58wcLRWtw2qRy6YYXWMTKM7OpmoblIXeiZTfHghY3AJo8oscEbZgO4J8c89haYoV4
	MB6dLP4PQY/tPvn6/1lQ4JQ4Ggs/woB0bpIuYLQjLdsaOIHuCP6k7sAm4yImg3QdPrJUisQ8qnjvq
	tuZBA1pPjnbiY21KCPDiX4py/4I3J2fW1UCHL55+ZpOTxq+T1eZK+wQ+8q+lXaPgTRJdxdB5STPwA
	HcYNEMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0I-000000082rT-0orX;
	Sun, 30 Aug 2026 20:19:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0G-000000082p4-2zsl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:19:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 01C0143D62;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C369BC2BCFB;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121183;
	bh=AM+uADRTsie5/REEheLPhgbwiWPLSEIpJ/A32xZhBDE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IWn/pepgyYo0JXKFvZJneBbfzMIlaXqEXdcG76dca5SbUyXoqPjEcS0noCsRIZjUH
	 641FkhSqmmX34iDI88DS9URNqb7vXhXh/52MxULj+QYpdYcgm+5GZPzVcJqZE0W4/s
	 D6DBOq/FjbXHJyowVhx8VQK/1hopnSSVfCOVz62gPwgAUNQ6PDlMXpcLIFlWIe8KhL
	 wMRqXHlj9baCWK82XspGFYFMpUUrVzkaMM6UaAcoI7yF1ec7YkZLSRCM90AuWbyS+b
	 addNxzzOxaUljDnbdF9Tqo9J7xyNFKAA+gdHBxFHAqVbf+fG8ggmbE5eiRCatLPIvU
	 EEGg6CvJ6ql3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C56C61DE2;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:19 +0200
Subject: [PATCH 01/19] dt-bindings: usb: Add thunderbolt-switch property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-1-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=AM+uADRTsie5/REEheLPhgbwiWPLSEIpJ/A32xZhBDE=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCUHRPSviIt489LzkwM0pd0Fr586tWgtyjb2DWzveW
 ChM4gnrKGVhEONikBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAExkuh3DX/G2G2avHrYoTJ7C
 +bRsRUKc/SFv/RiWGesK6rhuxTKm9jL89746k2XX7OdTNVyO3+1co37q7uyN4p9cT608FVHpKWX
 7iwcA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

The USB4/Thunderbolt host routers on Apple Silicon SoCs require cable
and mode details to be provided out-of-band by the Type-C port controller.
Add a thunderbolt-switch property next to the existing orientation and mode
switches which marks a node as handler of these notifications.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 Documentation/devicetree/bindings/usb/usb-switch.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
index f77731493dc4..5d125fbb252d 100644
--- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
@@ -25,4 +25,10 @@ properties:
     description: Possible handler of SuperSpeed signals retiming
     type: boolean
 
+  thunderbolt-switch:
+    description:
+      Possible handler of USB4/Thunderbolt host router activation and cable
+      information updates
+    type: boolean
+
 additionalProperties: true

-- 
2.55.0



