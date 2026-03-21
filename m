Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD931099B56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 01:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t13zBT/T6/lDXSt7yrtbcb88tX0zdjCe4g/9CVLLbBg=; b=2bGfZIftRcoEHcC8R6Pb/t2Z2o
	y7lqdiVdXcdobkdJhde4C4BLo7oGQwUGt2pkZgHsTQf9ZQe544q9EylyIgILXt4/qX8R/anbYz4O1
	/vRDzahiNRW+Se9co4Jjry7OC7ShchWZRxNj68gFKupLC0Hur1JvUh7vuWQIL2o0vSQyrBFRuisnz
	D6CNxij3eRTI1ESXFpRe3nNxqvWMJaToS0U5of75+lM2f6AEcxItFL1ye11yxpCtw8aB9f2J2Lg4+
	I4uyvdKgZomwV1JtwF9RpNqyq4SvFUP+Lr5lxGPAvhpUSkXwqFXfj10JPSZpmJpOVK5Toc8imNKey
	DULEv3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3l18-0000000DsRU-1n1C;
	Sat, 21 Mar 2026 01:20:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3l13-0000000DsR9-2b8N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 01:20:40 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-439b2965d4bso796063f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 18:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774056035; x=1774660835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t13zBT/T6/lDXSt7yrtbcb88tX0zdjCe4g/9CVLLbBg=;
        b=cacpfZ+2V6REx57Jmk33uV4i/nwj2hqi7k5ZVgk1154JdHzstqAfs897N4baFi/+Oc
         MkUj0l3KLi6trm8Y7IzDN9/9Fn7ZY6mOyeld5+AJLkSPKST+DNZShI8VzZWlNtrDDHop
         yYosD66XLwpSDAT79tG3/j64/DzCVo/b27HA8VZ0WF5iTl6TSeYVzpGulF0ENJGpvmUO
         /hRBCnmIgW5qKzBgek8P4tcca07EzJnx+4oqrQC3xzv+iET79Vi3/VZBf7y4OtwccqRr
         2sopvQxCFve6YeYKzQX7659/mjvTQf9DvJXoTE0PEINSQkqq5j6bCAZPL46pnJWrlSqb
         ldhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774056035; x=1774660835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t13zBT/T6/lDXSt7yrtbcb88tX0zdjCe4g/9CVLLbBg=;
        b=fu0yPzzlAhbPe80XL1wIDSLjMQD0txCD5GxQX8NsIizmU86pPPLP4WF6uIl+8sj6jB
         QxsFjtUydvXCxH3WBGSeoW1fhURjZRrYyKMe3O55l4aN9deYxx5kqKNUAuqyBoy9/BXh
         1jgq5oVQUlqsG08Ogc+2ppSgfDk0fulYsmCiqI7Io3jnaGY6YgzaplvHzLRRemQssO06
         pdNlAkki8xsjsdZaJ1jeQsABtpvIMbJ3E8u4BPRLWHZex4VZLO/AGzaRJAGkM26JcgK7
         Ks52ITMrMEK+MICxeE6dhnLDMCu6azFzk8Mzd+q61acCzq1FyHu/rd/FnQYrTMVDfCfC
         epZw==
X-Forwarded-Encrypted: i=1; AJvYcCVvq8NCiRqKriiGHUTtTqhJtSe/Yga2WMLC/i2dFLHwlXqaxH+VvfARbXluEs8wZuZVDfMz7jb4UWYPKV1XRDDn@lists.infradead.org
X-Gm-Message-State: AOJu0YxrvQWcV1Zsp/ri5gvBjXhYqgz6afFwTnEXfbRQe6G9rnyy1I2g
	5lSXnTp346UWbFN/tdbbzqRK/1shrewR7rj7Q+HEzAYzwSMT/DrosTI=
X-Gm-Gg: ATEYQzzae8D9vsDNoAGoYSL+YUSYcAiP8nwb69bj93yTru4CVQSy89iVHCb/dHjDzRM
	kNMqwuMcF83euvWmUiQtshMH8hEmFZQXnwiOGjwxQn4Hi+udPDMVYHWtU/Xwl2aS63qxq6hxu1T
	onrtEPTVJQLrrKt3k3TmQ4sH+MJwKUCu9LvV0S4/jc1ZuiBX3AjXiM4JkkAVRvtsY3wG2uvR3JT
	t+URlP6dIkElfYcTVw2XFmuDIcJIWwSytf4U/pNioIp9nFdvMrez2vbu6eILD/GhZwj+IW7zpxh
	cOcz96iGfP1YjJ3OwSdIJUBIEhMs728ClipVQaKn8lw65AwzJjUPqrm6btdnfB+09NcYw2Pbtvz
	w9WCANJf7JgRndQa1+LbjW2Ilwt6QtbrMrVARlcD5/oUV49LqBjwsMAttTkkcA5c+tjJTqtVN2+
	+SGt6JUHNy/bkmaj47ccIuL03MrP4DfI/gj9BKNo8U
X-Received: by 2002:a05:6000:2dc2:b0:43b:6352:a262 with SMTP id ffacd0b85a97d-43b64286a5amr8476539f8f.41.1774056035153;
        Fri, 20 Mar 2026 18:20:35 -0700 (PDT)
Received: from localhost.localdomain ([37.166.81.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b647036e0sm11091605f8f.21.2026.03.20.18.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 18:20:32 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: olivier.moysan@foss.st.com,
	arnaud.pouliquen@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ASoC: dt-bindings: stm32: Fix incorrect compatible string in stm32h7-sai match
Date: Sat, 21 Mar 2026 02:20:11 +0100
Message-ID: <20260321012011.125791-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_182037_688885_4966E757 
X-CRM114-Status: GOOD (  10.45  )
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

The conditional block that defines clock constraints for the stm32h7-sai
variant references "st,stm32mph7-sai", which does not match any compatible
string in the enum. As a result, clock validation for the h7 variant is
silently skipped. Correct the compatible string to "st,stm32h7-sai".

Fixes: 8509bb1f11a1f ("ASoC: dt-bindings: add stm32mp25 support for sai")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 Documentation/devicetree/bindings/sound/st,stm32-sai.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
index 4a7129d0b157..551edf39e766 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
@@ -164,7 +164,7 @@ allOf:
       properties:
         compatible:
           contains:
-            const: st,stm32mph7-sai
+            const: st,stm32h7-sai
     then:
       properties:
         clocks:
-- 
2.47.3


