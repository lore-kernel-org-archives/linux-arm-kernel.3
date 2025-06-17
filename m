Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26889C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 16:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5puOQiTV+dMcJIN5xrLM/KYjgCTI9s0l+XPT4hDsmLc=; b=hqpuoSVWZBOSGYE+VOd3ur4aTQ
	BdOwupdp9R1NO2nqmKXN0JL9m2qHjEzlBXiPoEcZi7aEpxMRpXtzLPMWVaDI/86YEvXYZ2ppUrf7a
	vJgzX+Kxr2YlhH0JQVVA9PU8fEgX+NhQXezgX3Mj9WIXTuNcOIBH6Tvp49yAgUm/BZ9Ws/LoaffLp
	PUFCGMovwKEYLsitbCh/C8Pks7eS1fVD3tdzJLptl9s8lqXnyPhR8tGCsvKpZZPfVJpt0AWVDlb6Q
	yhN8nMfEbtmedkd75unzLMKVySLQOPAW5xfIJmuwlsxZOKwsJ7ivvKEre5Ylv3coQWdK1q9EUeHm8
	/IGzG6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRYni-00000007pO7-2I7u;
	Tue, 17 Jun 2025 16:04:42 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXgF-00000007eGs-2t7H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 14:52:57 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so9972059a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 07:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171974; x=1750776774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5puOQiTV+dMcJIN5xrLM/KYjgCTI9s0l+XPT4hDsmLc=;
        b=cAMVapJ/LpQbFjkUmQEmy2OZRTGyipy5RA6Q9puiPfgFzc/ukse6oGZ1wlpuvqkWqv
         tGhv9c5r8m1dq/dU9hz40kUwzOcEc5/3pipL6q2xfME/JIlKuwG13CjQynhPytrn6+D1
         G0r9QnbuB3OGWqM4cRVc27ThPcirc6wcDLpcYXRhUk+XxQg/jzy0dfR479/WowXgCmDP
         cb2BKOK6oAh+H7NBDHpToDGFXb65JwXPJi7/SxoSuTGkO9sL5JzfYaouE0L3+fNL2gbs
         UPjx0AJJ9bJKdob1Xvuf3tnjFbC7I5vrzUNPh891QJ72w4Afx2hegI3YgdS8Ou5ZNaHR
         jWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171974; x=1750776774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5puOQiTV+dMcJIN5xrLM/KYjgCTI9s0l+XPT4hDsmLc=;
        b=S7B9eknQYseLQp1LN8hjQ+Xchib2oxlBWVt+CJfg+M5UVrkXVLGPMIBDedwv1Kb69j
         sc0PbOmn4bEyhgmObs3mDItn6+GZKjfZdg0EYsDxTGdwcKoI6MYyDOqF7RzIjwdaIn3F
         LODjLLs9NUswKPjEz6IKGFP5x7qK+no5vGG/0MYnQbf5muYyJP8/pZ1EqVxCA9DZX7h+
         V5Xe4Nhw/jraZ9pT2xZiTUsoJi2ijpPIz3t7Ol/9xytuhEQfY8L8PXYn81o+vpWnC08v
         Ju0uSd7/8YnqMUpSbG3gVz7I2yYLYtIfc+7f2wgjJx47el/VM/F/C1LpyfWZLELg/Qo3
         2xUA==
X-Forwarded-Encrypted: i=1; AJvYcCWPMsMvasGC7NyO6rJmu38IOk5lzyJLxMWROn+D+hsDce9FV4fCTNCdEocm3A0roVPaear6GLY/BjvCAXr59Wfe@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv8QkOvEnXiJP4LyOy5i09ZhgCe4m5gwrcQRIOnecyMI0Zzo2U
	ZOqs0pIlb+TNG9XbxlpqrcIe0SJPGon2Q3bHwJqjEYaWcm6REFDeZC2s
X-Gm-Gg: ASbGncvE6OKS+mV+jmACYPcYXFtC5K5Q0lXojWWXy0eZMqjktGIJTM856/xbRKf4ftP
	aUm6kM97TEcYdb+3ecaxbWLZ8Jtx16rT2xjqjy8ngY06zhVnf538i/m+McX6vk49CAMajU42Bl6
	iHQGsDPykvyE5dGva8bOJ3Ovc966qydsY6t5xyB2LAoUPce0IdvItPUmn2xKM0GkS32rAIhph8Y
	ZPcB5GxYMy1dN9iPke2VwHf/lffaevWJEdC3FtDtvsAXrG2CfNcFLP7p/sqNZYuvmFtTp8/f4Q8
	a3Qim+OG9FWhRs2qNYSAAJSB57kj+YKn74aqLIrsM2JmrV+t7KktWhFiVUBAJ9ZR7vnCHMFwlN7
	coxaLvepW76CxHJlDuLd06V8=
X-Google-Smtp-Source: AGHT+IH772Vr7ziQrhMcxd6rpBnuGlcNRLhAme87+SagE+LcRuwRz2XSrdK5bdCJnsIm5faeH4Mv+Q==
X-Received: by 2002:a17:907:72c4:b0:ad2:5499:7599 with SMTP id a640c23a62f3a-adfad320f66mr1474816166b.18.1750171973381;
        Tue, 17 Jun 2025 07:52:53 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8153573sm869775666b.21.2025.06.17.07.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:52:53 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: imx8qm(qxp)-mek: support the wm8962 codec
Date: Tue, 17 Jun 2025 10:52:18 -0400
Message-Id: <20250617145220.1131165-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_075255_725066_D9647C72 
X-CRM114-Status: UNSURE (   8.47  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series adds DT support for the WM8962 codec found on the i.MX8QM MEK
RevD and i.MX8QXP WCPU MEK boards. The WM8962 codec comes as a replacement
for the WM8960 codec found on the i.MX8QM MEK and i.MX8QXP MEK boards.

Laurentiu Mihalcea (2):
  arm64: dts: imx8qxp-mek: support wcpu board's wm8962 codec
  arm64: dts: imx8qm-mek: support revd board's wm8962 codec

 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 101 +++++++++++++----
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 103 ++++++++++++++----
 2 files changed, 161 insertions(+), 43 deletions(-)

-- 
2.34.1


