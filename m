Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E5DC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 15:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUfhFIAuuxHyoIK02RnTA8La0/z0w6Oz5SQr/C+g/RE=; b=brdn0CsZIM2EZgUjFWyBGdjk1w
	33KVLJOSaBYVcH2sR/5Dqy5EElKSPkMOP6RJNzUOdZ7c1/5Zjc6iUMRVzeT8JPSZOSSubENswgTUQ
	DLkpXbNc7q7KJzJtfWEei7NgeXx14jJILtDjR2zMWXUYtRjIT7IjO7un3Vvwbjg8596jVtBoFBa4t
	i5JB9EMYiAObsNxgzLf4xrJQrsVNTNYpve2UeMHxEAd25n4DDTbGriFM0H9vF0Wv7UNGZrc7Ka5mO
	v1+H0jfLgtg5DdrPMhjDCU7CEy9ZEys+PHynmMN9SltXUCxFEMy9Jiyek9kTDI7U/frpdWSHdFeJf
	TozCyO5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLCE-00000000sUw-0esV;
	Tue, 04 Feb 2025 15:50:42 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKzY-00000000qUy-0Wlk;
	Tue, 04 Feb 2025 15:37:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738683433; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AvmAv3ZMNNQjKa92Q6A2zTNwgoxiWnuPZzRppLkhkGNhZTOwYvFJ0ieCOJkgvakEiC3gTdK7ZskBm+GinrqsWsKrf2kyGLJZBpvJ76vkdJau6YA3gRi1+tfvTqavfFwjqcM+8uJQQbcFK3yNGB9KvKAtBA91HlkUu+aM0cwP/Fw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738683433; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BUfhFIAuuxHyoIK02RnTA8La0/z0w6Oz5SQr/C+g/RE=; 
	b=BZhD3Zacf06Fmqn84zREbGo0msErPb0U58lhgoqwReNycuGx4TzkfpIka2KhKh+j2xWgF2j1rcKPDL8Vm3zjV7q5MK15Cq8g7eGVJTYuDuVPCFXpR9qS2h9AIVx4jw/F/bSkoItarHChVzxI5RLkOL9FvAqYJlQzr2fMifuWVZA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738683433;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=BUfhFIAuuxHyoIK02RnTA8La0/z0w6Oz5SQr/C+g/RE=;
	b=DXzJxLQFAlVb8TqTDspK5pXb87qZEYvLfBtpV3b2+T4pRghR4U9PhIyqi7AGjuKm
	YlVwBQz+fJ4MwKy8/6uVzOapV01IScLgUYAkqR5fXQm5z53v39J74qlFupKgTQzWEUa
	kjn/P6i44WKej6TjjUfHLMvxqw6UKy0QHrQz63AM=
Received: by mx.zohomail.com with SMTPS id 1738683409157388.8818067976115;
	Tue, 4 Feb 2025 07:36:49 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 04 Feb 2025 16:35:52 +0100
Subject: [PATCH v2 7/7] MAINTAINERS: add Nicolas Frattaroli to rockchip-rng
 maintainers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-rk3588-trng-submission-v2-7-608172b6fd91@collabora.com>
References: <20250204-rk3588-trng-submission-v2-0-608172b6fd91@collabora.com>
In-Reply-To: <20250204-rk3588-trng-submission-v2-0-608172b6fd91@collabora.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Daniel Golle <daniel@makrotopia.org>, Aurelien Jarno <aurelien@aurel32.net>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_073736_232609_A3A7AF31 
X-CRM114-Status: GOOD (  10.31  )
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

I maintain the rockchip,rk3588-rng bindings, and I guess also the part
of the driver that implements support for it. Therefore, add me to the
MAINTAINERS for this driver and these bindings.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 256d0217196586d179197393e46a1e78da850712..7daf9bfeb0cb4e9e594b809012c7aa243b0558ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20420,6 +20420,7 @@ F:	include/uapi/linux/rkisp1-config.h
 ROCKCHIP RK3568 RANDOM NUMBER GENERATOR SUPPORT
 M:	Daniel Golle <daniel@makrotopia.org>
 M:	Aurelien Jarno <aurelien@aurel32.net>
+M:	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/rng/rockchip,rk3568-rng.yaml
 F:	Documentation/devicetree/bindings/rng/rockchip,rk3588-rng.yaml

-- 
2.48.1


