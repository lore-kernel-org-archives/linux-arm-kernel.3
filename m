Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EFAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 21:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tpj+MtbD1Voe05dyT9Fd9S36++WsVidg7tbKtFQLZbU=; b=BElF7xDdEjglwqCZaUutCKs4rM
	9MYh1+hYPk4+5OyWzr5VO0vXZ6lF269omZMGJzJwysBjvjah0nQ5Ko/eywA5CbhzJsGD7pDM4gTl1
	oWJHM7S0PGv1ENN1bSfsvT/blSSSUiffzZiCiC5Nj+dhDlHnOyDCAybw/f2imHjlzq1/NGm6a8hss
	BPXyTwzDKzOA3bm5VZ4iTjxp8S0YhO7HZHCmq4413R6LINswxdvUHBo3fuMmU0/D/NoUwdH4clRBU
	/Wu6O31omJeU9PuGBceVey7z5zsNhnKUPt7qowXArjCp7xo0RpubpdYNwzeRJakvWK11GZSF0jYA2
	pJYwD91Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPGV-00000005ZGy-34Op;
	Thu, 02 Jul 2026 21:48:11 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfPGT-00000005ZES-2yqh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 21:48:10 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-664d7863920so2157776d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 14:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783028888; x=1783633688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tpj+MtbD1Voe05dyT9Fd9S36++WsVidg7tbKtFQLZbU=;
        b=Bb1k3PA4JmebKHwExs+psT/fClkKhfchOuRqg/IvtiVNcoc9miBTFLx4+EvlyRZi3U
         4kJMDGHdCn8sx45qpbh9cyIy2ppDfVdRStAgPnvpLb7epQxJ6CE2HuYga7Mtz8d3kCbX
         BFU+w8S+VWAKbInLNd+UWT6zzZl0LrBELkdr3zg4gWGd9bb8KpQOdQl0LFtCLYfyqqjJ
         FRsqcYlYvJKCh19x3WHp0aE3bx61b69LZyO31FmxaWjlmIIgDJ3nCEAtY0VVj/RkQJ7N
         A0LWY41QYy7ZTCPUiw90v7EOkZG9d7kKXx/aRlvIqN3rqhNvbmvPeRJWsh4eno6nTcHY
         7yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783028888; x=1783633688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tpj+MtbD1Voe05dyT9Fd9S36++WsVidg7tbKtFQLZbU=;
        b=B2zgD6IwHEbB7A1NdlQ0ydVWzDY6Eya/qnHeQFboJQzMnDRT7vKV2zNMZCBu5MocKT
         gg4+MEuxa9KDEI3GjmavpM+iwgt13IAsvHXt0KFd0BJ18tjIIRAtuWclrBQJdbWbE2ry
         wKnDwXt0vP/HKhdjknCkHa6e79QWUCm2hXnlkmET1VcYtInbY3Q/CTNxvL33i6G5LO20
         aF4JdC72FAtJM8d7uL7zDyhv2dch05XB4RzZjxEtD/Nswb1ht6vNJPPGARYy+E9dB2gX
         OyKZuRm2izdu/gt98Xf+pjMB7/9CI0OW8cYl5ZQXk74BZ/W7Ca340fqe1tt5azIeurpS
         uYLg==
X-Forwarded-Encrypted: i=1; AHgh+RrlnDzSZuhZACbknzQ6W1ByCKrZ9nhRQ/mLh+PBpm9TnSZMlwOibMapZ+nqraM9oRFYTcICzl1h/+DfBtqQY7FF@lists.infradead.org
X-Gm-Message-State: AOJu0YzOePXqEpACebZs/eNcmnfO76F1uLwq/QU97eizptauGX1g5ZsO
	jtlXhX5B9TCp1+6eF7EHe0qxvUSpcjvsLExvQM+31MSHRiI2Nm9YBNo9
X-Gm-Gg: AfdE7cmelgBiQFjuyzpU4U0kDcYGj6mbJwt1YlFVRM+BPmAIfkQ8K+MuVrKvdJOVgwd
	ssJoMUUStSTwGE+/OuN9gG+ioPJK+DG846H5XpWj2OaSzeTXJsg/GzDfYA7QBIEJH+A5HTs79jl
	qVusZSTpzqFU4Jbtjypql9xD7I0dTdVuq7aDRFrFNnr1k9p62QZEQagzyJfIkuP/pjWHNvLKsGx
	Ineod5cSBTR/m3j240JNDUP9EsXAE3RsdnX7Iv4nZ1lpjhB4Sq++j4sscfSpMGDj15/7wJlKtss
	58AmbPsdsC/5EUsEqzZHjUo3R+BbaEQaAf/oyc6JPCrirKP8k+6znAM0CZaN5Qg607NZU+LsAnI
	Om0gYwZffxf2FHdv0QGl/8TemohmBVVj77gWEy1bo7WKAhOZrktPTNYKsrUwXqyavx8tYPyD7mq
	7vrufS1WgC6saEPqNMn5u9SA3EAJ7ZC37yz1xLWCK/0IGrM+w=
X-Received: by 2002:a05:690e:440c:b0:664:a0c8:f956 with SMTP id 956f58d0204a3-665916762d3mr4471470d50.15.1783028886926;
        Thu, 02 Jul 2026 14:48:06 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:169a:36bf:d0a4:1d7c])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66624021a75sm1631772d50.11.2026.07.02.14.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 14:48:06 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH 4/4] arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
Date: Thu,  2 Jul 2026 17:47:50 -0400
Message-ID: <20260702214750.3428694-5-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_144809_770822_589CC86A 
X-CRM114-Status: GOOD (  11.28  )
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

The X96Q Pro+ TV box has an IR receiver window on the front panel,
wired to the SoC CIR input on PL11.

Enable the CIR receiver.

Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..de2bdc21c781 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -266,6 +266,10 @@ reg_dcdc3_323: dcdc3 {
 	};
 };
 
+&r_ir {
+	status = "okay";
+};
+
 &r_pio {
 /*
  * Specifying the supply would create a circular dependency.
-- 
2.54.0


