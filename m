Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8850CC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBy9QjZf0+4gjDOghZ/ztTm0V0wUCXKsc4ePrWpOXtE=; b=iXrwKW/AFM/Fa8yE6eMClEUiMh
	l9yhTefbSvrXBwiaD9E9tVH2ACS7fwfG1o1chuZ577dDZG4DVYVwUtsXJcKqdoq6mbh+wnTUdjY1H
	g40za7etUwEOuHP7KyvTOyysqxMOrOyqR+RRkdzpZvY0uzH3NKOHZwAT3hYAqwP9ydz902d/HOX/x
	IQ3EJAnZAd+lXpxRjx4gN1z4+SuHO31unkZChaE5gOsoPS851sJCKcRPQnjlPzSOt0R0jrM0WCpzA
	CMj8XdulA1y4Q2MUak80siDgTv4c+1fHxrjNTPB14qil/TLoymDlsO/+xW8z/RZIKwwQALo36NS3v
	nNWbkJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l3-00000008EWQ-38ib;
	Tue, 10 Jun 2025 22:47:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Qo-00000007P50-0LJT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:02:35 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a5096158dcso4814286f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571352; x=1750176152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBy9QjZf0+4gjDOghZ/ztTm0V0wUCXKsc4ePrWpOXtE=;
        b=IRinRLYIkm6lv3lrn5tQBBvikk8B1GuxW1emR+/SF470rWfVg9Tc4RzVLAqF8E8aBL
         0HJjIqiBz9jwiYyZEDbLJ1NGfaQWs3dXV2A4vOBjDgY1QTYfSUhGzkqtrIXSzS29aC+t
         g+naPKT5Lzb4NmRjdSYdtY4wx/H3sLBcrERFMR5nwBTqHcdD7gVoGV1QElo3ZEo9N0yL
         jjb7SLhWsvjSzI1PThrzhaFC/XKQD7Grh2vykd48le7UCIcBe+ioOp8Bs1TvPv44AgFm
         ImzkyGWmCWGa4GIXzRep4Rqzyq8mAG+4qNuDADC662Go6U8Ia2DlVUj5QUc8MiV98QIs
         3Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571352; x=1750176152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBy9QjZf0+4gjDOghZ/ztTm0V0wUCXKsc4ePrWpOXtE=;
        b=Rit6nHiO48BaSuO1nEHizSm9wyjc80ZABOV/62egV3KwbcTD9971gm4pf0mdOXBdOO
         oa2QFVIzm1QEE7VUUgGaCutcYC3e8OsDU4mfT053Os45XpzfoR+LBBrFc/3ZJD6/S+In
         OqSPWjtj+a8uQ1A6KX+IXOTVKcnnfmU5T+A+ozsiSHpHVOrND1iusFbKwEUfuyocmuF3
         rLCj0gDUOMXJSS975duQzF5aCmXXORfh0AcvtBi5ldQYpIjLX47N5MKZfRpMyvI+QyP9
         bzOx73cl2SIYR2dKWqF90GpYf4pKJrZrZJSOKPdDmW9susWiQe/MQL/Feqs5BwbH4enG
         +Jbw==
X-Forwarded-Encrypted: i=1; AJvYcCUbqQlTS12IvUvp2mtSuv8x/j5vPwnWPJvSTVpSHvlhnVb1vaqGnwt3x1JRCYW5TKY8nGxJeyKpIJTE74ZFNLw4@lists.infradead.org
X-Gm-Message-State: AOJu0YyHctBJe03xaZ3zRsSl8m4z0sQ5ThfLTxhVvFugkRPg49As3aXh
	xz4ABkrvCaSl9N5uzMjdK6JAQGSp9O50AC4Glz7FjXNjKP+Mfe0ZtSId
X-Gm-Gg: ASbGncuEx3IMnj4SHlQPZqBhAH8J2b7+H2wJLq6ETeC+xwdWZXRqnnS77vVF+aRqJUa
	ecKcJOAnAlS5oN9EDq2pt3SOa5KrIGovk2GT7k8uzcMYvvH7PKzkD2kSDWEy032rb2KFqXMogYT
	qfgtV8n3QyU7h+5N35Oxq0aSErUVzibvua0NPR4NwdoAcVb+kaCV1/RHx3nNu7fXERLqUopklSO
	yHp3ME3j7h929OJjhA2zHEDZhm2qdTvObUK3563RHzt8mndb4wAh0Z9bibYIbot2M0doxGAUDNZ
	2jFEr/qNx2ZF360AHEwah9LuryViv9TaFfqRJHYXVf3euHTTnkhfLusWl46lJf23gIhx1eI8mSu
	myOXhgm7CKGjGtBZmq37AUFQ=
X-Google-Smtp-Source: AGHT+IFlLzTJeUuewdTAL2iHVlMGazp305kQFv+kHaCRhgmhrh9tVXxRlRAZrnMhHVuL1e982fCHqA==
X-Received: by 2002:a05:6000:2289:b0:3a5:2fad:17af with SMTP id ffacd0b85a97d-3a531cf30abmr13544526f8f.57.1749571352279;
        Tue, 10 Jun 2025 09:02:32 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:31 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue, 10 Jun 2025 12:01:52 -0400
Message-Id: <20250610160152.1113930-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_090234_119581_5B88F94E 
X-CRM114-Status: GOOD (  13.00  )
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

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9b550f225856..26efea15f6b0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2435,6 +2435,11 @@ dsp: dsp@3b6e8000 {
 			firmware-name = "imx/dsp/hifi4.bin";
 			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
 			reset-names = "runstall";
+			access-controllers = <&aips5
+				IMX8MP_AIPSTZ_HIFI4
+				IMX8MP_AIPSTZ_MASTER
+				(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+			>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1


