Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB00E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lM0mNCtHjT+hsg9qAEDa4xZpSra1ZeG4WjgSFO0QQkI=; b=iyXk79H/LicdGNO01OYQW0GRFX
	Wkz8ooFDY50+H91SFCeA4x2loQraKO1UsNveU8acn/YGS36iP9HiuGAhTdOEHepFFztNJkmeuGcB8
	lugiR/F5vDLuFO5nOclnBjMFYOL/kakxHcY2ZDPlal6FRCz1kerIzUCmojWTvDBfn3uwxqXJ0wLWD
	W+G/NbW9sOVwTKLSYouT7P1F++mOJnm5bugtoEeB5/0NJ/manbzO9izvhPh1Z3LhfOXOeTpRsVFqZ
	nqBR8ksPuvaF3qDxJTp9T4d2lH3MHMK3hbfajCWO+dEbEOUpc3bv3UD4HoUe4J/uMwOf8wSVoiXWk
	bu/c77yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDFS-0000000GQ9I-3ntR;
	Thu, 05 Dec 2024 14:54:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDDS-0000000GPjP-3JcG;
	Thu, 05 Dec 2024 14:52:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so6542005e9.0;
        Thu, 05 Dec 2024 06:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733410349; x=1734015149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lM0mNCtHjT+hsg9qAEDa4xZpSra1ZeG4WjgSFO0QQkI=;
        b=M579ccA9fusZVQS3n53ewNRueVeoJyHKKZHIRzGwHQFiHDNYjnKtMgtCBaBPnI/CsJ
         BxUc9VPbl1uvVm8/vK9AxpnhnNi+bWPi/oiivNGWvvok3MTKXQQDiaFELDXdxwVCoMsx
         FMqT9xPbyl+cYKwmatyNhwNrd464Owe03K2XiGVyb7B9W3JW4Ka4QdNa5ZDQznrWr0FZ
         S3tttW89OJTztytZRrUH62whV8sXP8Y1KbJD1c0JSQxEt0DbYYsh2rz+fs2vYkyL/xC3
         rZwfAG6LdBRdG18sNQPfh38g3LTzn8xkp6G1pOJZ7QJRDbtp8AZy49+KvU0LJxEHhnTZ
         K16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733410349; x=1734015149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lM0mNCtHjT+hsg9qAEDa4xZpSra1ZeG4WjgSFO0QQkI=;
        b=PhwcenFimZoVIe3ONcF7U3xiyYZZtlDQBvzJSniX+6R3BQCftlF//bPQJzOk1ocnd1
         OzOE2Y65tyBonvdAkUfYeiGp0f87Wl7JbKJuKAk0g14jP3JEAh/d3HywmQzlCy2dkYHp
         3mYAsMATW0+ofCh/GS1o7xBcg3sxlyh3hk2cOp/9iqP9HpRn14a7GrK/vp5f0DmESclh
         p/PihjA0/bvkvuezmDvPdtMOHZ4ddOaVkl/uivIV9BbtfUkN8zzLG6Jx0UlchRmkvMal
         VE0wXPPPqCNw6DvC7eEwrfXbm1ymBOZxWs9hFLxwiEfayFutpvTV7bqp4z6kU5JO5qW4
         aYmg==
X-Forwarded-Encrypted: i=1; AJvYcCUelHpsqWCgYyuRSe+B49oq7tSbQbNvDBU8n0bXp2O2PeVK8+pWFM1g3zQbx8BmldcWCBRnc0mvWUXVyp9/w6PI@lists.infradead.org, AJvYcCXwLGOVpcVh1BPGSlw6zyDggTaYjLeN2r+UeerwdK6CfKl/sz7dLSJpC26glvs6A+wJvDZzFzdpd/k/AfujpvE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOcYxk/C4B5K9DWT6YA/8jbWmD6p/sV9uBIuPvZI4UZ3ZWduG+
	tKtMS6f6cGKRLDao4NFL7XhlXhIubhVjep8bD/eoB6io3jPeCb5dL/o1aA==
X-Gm-Gg: ASbGnctE6t4YvQKeF4KBosL7IERLI0r326y5LQG0X7byusbLuNmfawO3lalMO/GnDjR
	06dOuxqcnEbDsDr6/99lYoj86lhMLNuKskN5MNEP7MLou+MiDj7HgP4cjXhGhZw1utDt0dROc/0
	sNR6+3+Mwzt4+P8FYV4QnKOHDp7N0RDy5gTJfzJT1JJaVUGPiQrHi0iFGHQhR1xO4xzrbqs06ba
	i52Q38Q7Le7vwiORWSSu9P0BhMWMkCnLu+h8CtLAxLXlPEORCdea84F6xM8wyv2kYjVy6WVZf6Y
	q3HSFPYSusBOpUevQjs=
X-Google-Smtp-Source: AGHT+IGnoyqwOOVYCV9qD7ONeMIC9R1ayJbcX/cSJOs0/DfqcFNWMmtEIiHEzgGy0mkLPSyUnS5p/w==
X-Received: by 2002:a05:600c:208:b0:434:a4d3:31f0 with SMTP id 5b1f17b1804b1-434d92699ebmr29065195e9.3.1733410348408;
        Thu, 05 Dec 2024 06:52:28 -0800 (PST)
Received: from localhost.localdomain (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434da113580sm26728035e9.29.2024.12.05.06.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 06:52:28 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v9 1/4] net: dsa: add devm_dsa_register_switch()
Date: Thu,  5 Dec 2024 15:51:31 +0100
Message-ID: <20241205145142.29278-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241205145142.29278-1-ansuelsmth@gmail.com>
References: <20241205145142.29278-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_065230_819405_5D140B66 
X-CRM114-Status: GOOD (  11.96  )
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

Some DSA driver can be simplified if devres takes care of unregistering
the DSA switch. This permits to effectively drop the remove OP from
driver that just execute the dsa_unregister_switch() and nothing else.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/net/dsa.h |  1 +
 net/dsa/dsa.c     | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 72ae65e7246a..c703d5dc3fb0 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -1355,6 +1355,7 @@ static inline void dsa_tag_generic_flow_dissect(const struct sk_buff *skb,
 
 void dsa_unregister_switch(struct dsa_switch *ds);
 int dsa_register_switch(struct dsa_switch *ds);
+int devm_dsa_register_switch(struct device *dev, struct dsa_switch *ds);
 void dsa_switch_shutdown(struct dsa_switch *ds);
 struct dsa_switch *dsa_switch_find(int tree_index, int sw_index);
 void dsa_flush_workqueue(void);
diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 5a7c0e565a89..aca6aee68248 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -1544,6 +1544,25 @@ int dsa_register_switch(struct dsa_switch *ds)
 }
 EXPORT_SYMBOL_GPL(dsa_register_switch);
 
+static void devm_dsa_unregister_switch(void *data)
+{
+	struct dsa_switch *ds = data;
+
+	dsa_unregister_switch(ds);
+}
+
+int devm_dsa_register_switch(struct device *dev, struct dsa_switch *ds)
+{
+	int err;
+
+	err = dsa_register_switch(ds);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(dev, devm_dsa_unregister_switch, ds);
+}
+EXPORT_SYMBOL_GPL(devm_dsa_register_switch);
+
 static void dsa_switch_remove(struct dsa_switch *ds)
 {
 	struct dsa_switch_tree *dst = ds->dst;
-- 
2.45.2


