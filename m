Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16D6C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSDcvewipoZNYTT+WMH6V9nJ9au04QroQYI+jUHvzRg=; b=k0TPNyDX82SUEZrBGC8mOGm3DR
	DmRAK0Qqd1DtvkMA51Zmt2mqVRamMQj2Rz09dWxi4QiXxeLMSD6PSHRl9DK+SIoiCpFzEQ0drj8/C
	Zsu71ZK/n6q4lErQnuYXyRuopok6hUmnaZrRc8PTicDVPEaWrE6Lu8QJlrgZK2fzQSz63JY1SNXya
	dAtmtxnDAt8hIzq1tLwPu7dHYm8Gf3yRWgwbHZ4CFh798u0JL2hQwQlsU0Rtrvw3b37DENhACnNQx
	SV3zVx0C/tGrS/b2ksnMrDS2Ag97SIJn6uN/VexnlVBo/T3Pfnc3k90SQbscElhEb1aMFMWDKJOcS
	EOnqGEtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu90F-0000000GHET-0uup;
	Wed, 12 Aug 2026 13:28:19 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu90B-0000000GHDM-3sA3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 13:28:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4954d29264cso4753405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 06:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786541294; x=1787146094; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSDcvewipoZNYTT+WMH6V9nJ9au04QroQYI+jUHvzRg=;
        b=huRvTKZU9RF2I/my7xoRyKXmKyYKYFkjrhD3SNtlS13fQWQ3fZnIXROnOcD0f+8o7l
         rRvxw3CE7m1F8nMhsM1uDXEw6hmm23CjlN7TYd98tprfjlG+0VRDBH5yDbWSWxc+Fct6
         3xqpAKdE2ICkQ5CjBBQMtTTavDwHYS5JEG37qHnn4jL4m1ICiMHgkpOROhJhP5WcAQdF
         jj0vobsDefMHOy1wynvvKrULpRDcQ6hj84OP1NJNSxv9IpHBPVKEZkNPBAk8y9G4PE7S
         YN6gxuyHyLb2HrBN0jl6dPwxjOSPb0FfcaaDp138cY463YQsERUDoDg11Omm6+0Zb/o0
         Dy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541294; x=1787146094;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSDcvewipoZNYTT+WMH6V9nJ9au04QroQYI+jUHvzRg=;
        b=M/IEE1RsfrAvseoNUXvxLjBnNJ8eYbdMz21HcHlJhxi6pftC4Sxf7EA5UvlKEoEcDO
         aoLo2mM91Z0eosp2t2TIj644fv8ej6EifpAiMfiS6aMxsU1IIWLoYCOJYI0xNS1gfDlf
         GnVlb7W4JGJi+7lNeyuUOAtURHE5VKKJ9HEzad56Wx9APcG3jXFris1TFTcPe06Kkdt0
         vl1gU6Pquwjl+Fc4lx8ew6syAqMEXrxGB2oLEscmOsV7IEkz9hoZXAMQtCDQnbuNooZE
         IUDeFKNn7BKbOF4aEu5oLpD1fMHdo6s7Pp9FpeORrEhq5w7MJIUHKwmAaw07CF1vkBRs
         /xvg==
X-Forwarded-Encrypted: i=1; AHgh+RqhOOUmV+GXiUuhUZQfP2bKdbW5CgXCdIE/sknpXNiL7GsxMOczrX2pnb8lni6M4l5HscVb9LkclLuZYL+fycyp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2Q4+BCaRE5bN+6y9OWWGQPCRnYg2iTV78vUQq2HDp6oJOlq5l
	ubc2Dc1H8RXaZ15bds5dJqMmSqnY1La2lECuzD6Z5PCVkWdV4oE4FmQN
X-Gm-Gg: AR+sD12WNav4cQOh3PnwqUtyIdMIoV4SmwOMIUZdCV76xA9QnrskvzUl6WDDbzAWORA
	cCRxSWY7Vao94NaSiL5bUugqR1FhV6vz7/WpXlexGmoJn/sBat8G/nEerO7+Js2WcLfiJ1doy0H
	Hqo/+PI+u2N6PBHJm9Dg9rWvoozfX3SJa0PBw1FGi6ztwL4BORiqqs/O2p/YK7QbvO0cVsp9WTj
	KPLW2eUpo+tP/YnWjStP/mVX89Wb0bnSWfJFjuF3+w9LjE0QhaopeqTkXeL6EeEKY7FKZ1kVsW+
	DNI0rFPiOT0r145Fmd5P4T8k8hyWtebhhxmiK86K8CxqKegpVNn86xbOuoSoF7pFJkLa+Z2p+tp
	XV+p+WaoE3rj4nbCQU7oUukm9Q7FZ7Yqc/TVhVXXlw0BLkDHKBXA8IdFRWcSxbNS+XyeYkUCIlh
	fswgY/kaD3uF+N/fQ4cKeQc7qDqKMNsjd69aRucamHLpLGC3lb9cV6+IQcFtPAtTNwA3awVwakV
	6HllMSwvVxS+ZtWU+L179sGdMC3n8k+j3h8IAEH
X-Received: by 2002:a05:600c:a207:b0:499:7024:9d4a with SMTP id 5b1f17b1804b1-4997c10e847mr41921955e9.8.1786541293829;
        Wed, 12 Aug 2026 06:28:13 -0700 (PDT)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997abf917csm87818995e9.13.2026.08.12.06.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:28:13 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V3 2/4 net-next?] net: dsa: b53: prefer CPU port 8 for Northstar devices
Date: Wed, 12 Aug 2026 15:27:53 +0200
Message-ID: <20260812132755.32585-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260812132755.32585-1-zajec5@gmail.com>
References: <20260812132755.32585-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_062816_000957_912CDA8C 
X-CRM114-Status: GOOD (  15.81  )
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

From: Rafał Miłecki <rafal@milecki.pl>

It allows using all switch features in opposite to ports 5 and 7.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
I think this can be net-next but I was asked to send a complete patchset
Can you pick those 2 patches to different trees?

 drivers/net/dsa/b53/b53_common.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 5fd8362d0430..052812d2faa9 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -766,6 +766,32 @@ void b53_disable_port(struct dsa_switch *ds, int port)
 }
 EXPORT_SYMBOL(b53_disable_port);
 
+static struct dsa_port *b53_preferred_default_local_cpu_port(struct dsa_switch *ds)
+{
+	struct b53_device *dev = ds->priv;
+	struct dsa_port *cpu_dp;
+
+	/*
+	 * Northstar SoCs devices have 3 Ethernet controllers and 3 CPU ports:
+	 * 5 (IMP1), 7, 8 (IMP0). This design was meant for dual IMP setups when
+	 * WAN traffic goes to port 5 and LAN traffic goes to port 8.
+	 *
+	 * While all 3 ports support Broadcom header, ports 5 and 7 have their
+	 * limitations. Features that relay on trapping to CPU (e.g. EAP, STP)
+	 * won't work when using those as CPU ones.
+	 *
+	 * Prefer CPU port 8 if available.
+	 */
+	if (is5301x(dev)) {
+		cpu_dp = dsa_to_port(ds, B53_CPU_PORT);
+
+		if (dsa_port_is_cpu(cpu_dp))
+			return cpu_dp;
+	}
+
+	return NULL;
+}
+
 void b53_brcm_hdr_setup(struct dsa_switch *ds, int port)
 {
 	struct b53_device *dev = ds->priv;
@@ -2724,6 +2750,7 @@ static const struct dsa_switch_ops b53_switch_ops = {
 	.port_setup		= b53_setup_port,
 	.port_enable		= b53_enable_port,
 	.port_disable		= b53_disable_port,
+	.preferred_default_local_cpu_port = b53_preferred_default_local_cpu_port,
 	.support_eee		= b53_support_eee,
 	.set_mac_eee		= b53_set_mac_eee,
 	.set_ageing_time	= b53_set_ageing_time,
-- 
2.51.0


