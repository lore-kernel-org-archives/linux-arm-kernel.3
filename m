Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD653C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mq40chmiQYOJ0gNp2bpIfeyZ0OR86JtTGyJZDUn+cjk=; b=4mkOJomglbwphG5yIZgM8yvSUD
	8sTYylI3UQksZqlWL3ecGUNiv6YTQUxo6c1if/04Zs+9sN86uX1T450N49XKGT1vKG4MhMWn/W8pz
	YP6Y7otdiAvMJ/4z7mebeP8Uur37VCSmXzPVNvPUgYtfwF8Hp9KV+T0oGTLZALrEA2Yf3TxsJk+I8
	YGHW/RdArh9U86Ei8rrAqJXRb0V3LQXVWZk6yOOacMrxtgTNLIZL1T3tfK9W3zwiKGBSO+vmWoyQx
	JNs/6GIx0+ulDJM+8LxUVWoa0RyQlj7mGi1Pz/S7gf3CeD/c5Q4s8VspCrHlmtwAO+nKUtxbjh95c
	SNsYjUzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DjT-0000000BdXI-1eB8;
	Thu, 17 Sep 2026 15:09:03 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DjQ-0000000BdVz-3XmD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:09:02 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b912e2406so5224355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657738; x=1790262538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mq40chmiQYOJ0gNp2bpIfeyZ0OR86JtTGyJZDUn+cjk=;
        b=rbarmKrprH6FVL4vcNy7oX58LZn1whCFV0dC8aLkFRZ0FsD6qbJhgA2kc6Eqtk5q4i
         M1p20W+liUGnJ534yR//3f+ULN6ellpSmpBPx1ddZ3w8ev0HmqZB6lcuImKgN67XNDf+
         aU0PuhqcRkd30iiMlx81QqYMn98mUuJpIfs4+dKsOVUxuJDNiLHbLIyflBAycDp17zRM
         0JLtKZyBFr+LD9RxzS8iy/k9CR7utQTwLSf2gpvRnIDxsyu3Vl58WmQCHRvoPVx6Bvrb
         6BcjPSucKTAZddi2zKyREnBVRxdELErjdzCRDZH1btDMXZrYjuyqqi8y4urfL/K/G35V
         bNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657738; x=1790262538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq40chmiQYOJ0gNp2bpIfeyZ0OR86JtTGyJZDUn+cjk=;
        b=KGzJvU2s0glmL4LmvuDvcclanPXta8nG38GBOJ/K7aEKgXlFThW3ul8SKdhhpQlt3r
         ncIh8vNQAMyUK3jV2McrFyiqZqpt/UJDsuiBMwBwS64bXjeRBfZ4ryq3DrL4ntGNd9sT
         BeY08uE/hXFo/SwCPPEzaoAc1f4oz1+wu79KyVz32LJNAVF0q8Cp+7XDg7qEzgS8MsZN
         VdU3UvJntviemLgO5xh6lI2C0T++a0h0BXu8OHrUoIa245W6esiqy3OGUgYEU+VFe34U
         HgjcIH4qd82zzzZMpdea/2T6EvaMqX89eXC7hPIXeFVbx77GwCXYEAr7TmpQX+sdPEn4
         sRWg==
X-Forwarded-Encrypted: i=1; AKwUvByz3JlybJCcPGU8reTNUrpwtkL2PKEGRfumamzu4es9pZ3jB4dmEDV6tkSk3jbOG9MzFG4zMVJF50cbYOzhykit@lists.infradead.org
X-Gm-Message-State: AFuF++lFf5BoHRQ0DetU52YhaCMrLN/wOoO1gr/1kK02BRF3iiUj7skK
	yBgAAIXgkzZuO1Fi/edFzLhyQX0GoSQUQLSXpZT1Es6s1O3F6OftkQhX
X-Gm-Gg: AYBFou0RT/1JL+Dn2fwfXnOV278gOoCLLTlmCb+vHmxNpoLbQigx4fRmQD8ufqv50Kj
	Frvdx8CNsTb483gv+4labaz4w7fB6yDh3ATE3OZTY8x5fDWpv6R+FkohoB/4v5msOh+IHlo91eB
	zzBKVZgARyuWn5MwGKcRvqBkT36YmTok7FsKwSrbW+R+9A2c0fbjvOaK2bLwMTnt8NeAAXtyyXz
	vpmu/QjosJtMKngWXBqN/ADIl3Qzr3cc+JVtUsOKZKPzphameQ3PLrQWP4lnZQxYj4gPpX0e828
	exS8WWsicG9mTnnZZH9SseVL14/r2tRHR+uabWN/5O3KE606UuJuxJ7oeFkFQ6d6aFzqAn5Y1GJ
	0r2DEa17ggcbu3O4Ts48zrgH4JNjtH8NNcq1Z1JgNdCw5qqgNhBdvrtSGSVnQ1CQB3kVaXWjZGQ
	NC0ZoTVwwXPGDgfrCqoVQHcKPzyy2dOWUVoK28aMFzOeUF2rQXwJ0+58PILZcqpj0DLeCDvD8ig
	Zy4sTVHph8SbhhjnFjFz4Pp+oQc4GOozcV7sadkJdGnnove8glb/oi4WwNcSZAIluogbGbQZDSg
	CrfZeatgyu/Bvm8TQpXO5g==
X-Received: by 2002:a05:600c:1992:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fbd1af43dmr50366195e9.3.1789657738046;
        Thu, 17 Sep 2026 08:08:58 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:08:57 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/3] arm64: dts: imx8mm-var-dart: update SoM support
Date: Thu, 17 Sep 2026 17:08:42 +0200
Message-ID: <cover.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_080900_891269_EC58E999 
X-CRM114-Status: UNSURE (   8.61  )
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

This series updates the Variscite DART-MX8M-MINI SoM device tree to
better reflect the currently supported hardware configuration.

The changes configure SAI3 in synchronous RX mode, add TPM support,
and increase the Ethernet PHY reset deassert delay to improve PHY
detection reliability.

Stefano Radaelli (3):
  arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
  arm64: dts: imx8mm-var-dart: add TPM support
  arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)


base-commit: 46d8fa682d263271f3ef7bf95166b124c19d6c62
-- 
2.47.3


