Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331CDC18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQWD29wnrAJlObQ2+b6JbHQHIRXSBf6Z16/xLVUUT5k=; b=Il9F3RHL9ox2kfYpunrrdp76Ax
	EiErDDX5m8PbQInSyz5rVgxzoucs2T24NoUvXUWSRPaBJPrrvPRrCFD5RgricsxgC34LDPi2qCnwN
	8+s4MPe5oRNST104wBnO52XQwoTsjEIAf992S6RR7QMaTfE2V0Q4lOjIwyMCSP3p3yxnd3pamG9Tx
	0uhanIibsAXr+tDVO12qf8CJBIfVSC3XnosZhU89D2aUhOTBMccZudg18YmyfxoXllOvO9AvksQRb
	D4KQzGw49eRLLUUcF7JL66vlNmnU42WSYblQ5QTTM1aKkyvHlsX8Twuj0kEp3g8Co5fcg6Erxyq6z
	+DvqbRBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHPM-00000003poh-1UV6;
	Wed, 26 Feb 2025 13:25:04 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFbN-00000003TeN-3Qyn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 11:29:23 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5ded7cb613eso1290779a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 03:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740569360; x=1741174160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQWD29wnrAJlObQ2+b6JbHQHIRXSBf6Z16/xLVUUT5k=;
        b=v1QYDJBR/dVwsas5tA6czcGBfQXPL1mp16RhQNECPEz8FeL6RoMUuApyY5pB/fQVY5
         1kYwQJG6DzuTP7/nTPzrZsPAtjc2cZV4TAFs979FHTzEq+W5+1IV7jkVrutTqLmtuvsl
         5CynJUoGGoiGlIgW4VkMFE4zmdfJDaeQ2g3YrC/HZa/T4st795I/iw7ROO0Hxl9/vQbb
         sXgg/MnWNRILebn8FhRE10VmN+E2Atn82+Bgu/YcvkUGi/DJuNa91HPaFnsEsx6ccQOU
         6wlp60wOa53XkoTZaemuAN7y1wFe+UQYEAvUvK26iBxuATfemu7PYLjQmmtRTiNwRJ+x
         y0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740569360; x=1741174160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQWD29wnrAJlObQ2+b6JbHQHIRXSBf6Z16/xLVUUT5k=;
        b=idZ9HUPmPd/rDmWO0+d0Eqn8vG16uN9AFh9Wn7W8XDSKqfYrJiVZnDdmgIK3Uva1I3
         d+Vxbh8zaaeBk8VPjGtBZx+mpyCxulB7ml4cnn6TaexAf730LvQbUT/WezzEq0jg0CSC
         NxsQqLoM56LglfhXMhcvtKdkDNgJlz4Df94y+peL9NJeA+P8nKIGObLQeV8gjd2iNop4
         M/p1isIj3YOjXvZCKJLBaCPqPbCyLW98nHJPj/cq3WaGuzMFM7E36Yx4zLx1ozbhuTU3
         TPdyOq9jg2LbYL3l+1lxZTbaC/PbHAAawMX2x4Fgl8K6LrO62ufDYgjfquglILyKMpBI
         vk8A==
X-Forwarded-Encrypted: i=1; AJvYcCXXyB02KxHJTHSvCxdImavkMyqlwVip1VptKthn4DFfEhogg2oWLlUM9/JMqTMS5mEippI5tcWV6kxNCV1nCOgK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsv/6BlBkaF5UqsK1OrH0gbRMm6ClPIHMraO4IUdWqavmV1bQR
	QeMYMnJp4nb6Y626bqz6/yGThtfAPmkJb8nQ6U6IPslUB+3EKrHaGy6HZXuvZUA=
X-Gm-Gg: ASbGncslILrkxBR9d9HokmW+oy29Y08iBwqRUMfhC4wLy9MBIvdhN74NFd8UW+SvPmJ
	yCG1NRqMgqLkpKv316X2oeNOhQgznKVddm60JaD+R29oLhm7eDKwSqYQQtBZDHw6825cQCFrtHg
	nNGkK8DVZo3PJ+GGRHvFDneqeegAHPyKTJW/yk2PQpKNTsOEM7XsSztPfDDTeWFVpKlrYHbDhZ9
	LNUuVBdKiQoTeLU4jNXKcRDI2rxyJ8HNL+6LYWEXCrxh7rzztBdyQ7vefkhEvcgiuagEboOXrRg
	QJhgsGc53CZPsypuPv8GnD9QCospmMTXFMXbPUCVnvci4FUuJamwdBWKOvjd34c4HJyo+PRlw0o
	=
X-Google-Smtp-Source: AGHT+IGUGEs167MMU50Z/gsJMetu4k7d/Wn5NbBN1LtAChUhdquWuXdeMtmsG/KUgqB4AhKanou3/g==
X-Received: by 2002:a05:6402:430c:b0:5dc:7ee8:866e with SMTP id 4fb4d7f45d1cf-5e0b70dadffmr7109591a12.3.1740569359899;
        Wed, 26 Feb 2025 03:29:19 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e45b7174cesm2610049a12.34.2025.02.26.03.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 03:29:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: coresight: qcom,coresight-tpdm: Fix too many 'reg'
Date: Wed, 26 Feb 2025 12:29:14 +0100
Message-ID: <20250226112914.94361-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226112914.94361-1-krzysztof.kozlowski@linaro.org>
References: <20250226112914.94361-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_032921_882039_83F18B14 
X-CRM114-Status: GOOD (  10.13  )
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

Binding listed variable number of IO addresses without defining them,
however example DTS code, all in-tree DTS and Linux kernel driver
mention only one address space, so drop the second to make binding
precise and correctly describe the hardware.

Fixes: 6c781a35133d ("dt-bindings: arm: Add CoreSight TPDM hardware")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 52ba5420c497..74eeb2b63ea3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -41,8 +41,7 @@ properties:
       - const: arm,primecell
 
   reg:
-    minItems: 1
-    maxItems: 2
+    maxItems: 1
 
   qcom,dsb-element-bits:
     description:
-- 
2.43.0


