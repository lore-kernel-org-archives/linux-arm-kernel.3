Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C2ECCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 21:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfs9jmHOBI4D2ryFn/N/wC0tPkQkTDK0eCurhXH2cRA=; b=fyggLBdwSt2V3+RpLRJ2F/vd19
	IwoHVQZ7+rxCsKYoEp4q1P/7zh2mp70Po9pKU4XWbKmYGXTCqZ1bD62Z+Jn8BPUd7XTlTb86K+lmW
	iCIntxXCOl8xKuVVjbXx2AhXaS+8Lcbb1QnZKrukT3jrGoiD9fGV54yT4Hoc0wUUBmLpJvn6TuxVf
	hKD2WEmNFQQSYl7GJfNIh8VyUkqLaCwWkYiqmFo3Qau+BEVDpynEhcylEDzF9lwVZxJ/1dHxvrWCV
	cMYEC3c8IBhhKDA85jGy6yFQt4eq+TLis+yPcWWafYWAbDbshVIhuqoYRCUbZUacMYBqVtk5cOCnd
	4JVkenog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUWx-0000000EmOD-0a7D;
	Mon, 27 Oct 2025 21:13:31 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUWd-0000000EmEz-1aVT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 21:13:12 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cwR793JwLz9smr;
	Mon, 27 Oct 2025 22:13:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfs9jmHOBI4D2ryFn/N/wC0tPkQkTDK0eCurhXH2cRA=;
	b=KoyI8nhLcZjKzTsbLpqRj/IMzECGd7ZoOWJtIApZv2tBqhcp3/3u9lrmCZMmkO03q3FrmI
	1LTjr+ry7aNZkJEBsZliLK98Tl7mtgZr6gRzlsGWxpUEpUayjQ+PWdoCf7dQMkVGQuDd99
	6/s9VG1AFzJtVygXH0BiPfvABn0WOiH2TP6lqMFkPTrhuJoAqEhyGdEAbNrhJmNGdUsXZl
	T63SlT2cqhlJm/sW8bwkWYbePjMVDTXHSC8/f+UKygjpa6ofVcUnmWyWQii77d4TMChFMS
	zWS3ujTfNRoJh+nA57QdhHI0K3aAcs5DvPjiGfoTyoeSP21rFe7sLQutUKqjiw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761599587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfs9jmHOBI4D2ryFn/N/wC0tPkQkTDK0eCurhXH2cRA=;
	b=X9XlR2gxul/gdxyr4smvSR0k7O7rr5DvGcRZcd/9NJ36IB942CrCcYTk0uP9V+VhVIJ36Y
	l+E73WHaO4GXpQBnmIOjiotaG+FbA0v13GzZLMYYObi/wOXqmEkzzZZk31oRVVXcD7NfgW
	NKsVzKsmsvwIshDxQoxNdS3WSzqdTCGdIQbuEXMQQ9h6Vp4fqodSeHGgf3zY0YqS/8xPDK
	q4WhM0PilRfrTyKU4gUaroYe9NN2j+4xs2WBQQ028wN10fcZ8FtIOhzie5O5SrlVWze0LN
	UG1PIUqAbkZIaX7RlK80Y3p/BSOsaIhuwF7zxCZu4Ebk0DevfEiJ9lR1cRH/eQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: renesas: r8a77961-salvator-xs: Enable GPU support
Date: Mon, 27 Oct 2025 22:12:21 +0100
Message-ID: <20251027211249.95826-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3mu5xmrb6e5rnq3onu33i3h9ouk8aci9
X-MBO-RS-ID: 0860381f30184d42054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_141311_558383_090F9619 
X-CRM114-Status: UNSURE (   9.85  )
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

Enable GPU on Salvator-X 2nd version with R-Car M3-W+.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
index c7f14177f7b95..b35de49406a01 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts
@@ -40,3 +40,7 @@ &du {
 	clock-names = "du.0", "du.1", "du.2",
 		      "dclkin.0", "dclkin.1", "dclkin.2";
 };
+
+&gpu {
+	status = "okay";
+};
-- 
2.51.0


