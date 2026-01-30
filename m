Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80558D49C71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPIX0W/QwqFfqblc/FqF0IeuPkn1Wyp+rRntpvN5lJ4=; b=rQnBTjDdl+5/HgUOspJzwpT5YP
	8kymPPhX27BW5fhx33wd5UI4Qjxi3HnJVpZM36m9FLxD1B7wrIpNp/rWFRuw6ohSLAgNSQu8DWjuQ
	y3RaFdwrJfBiI6pxo/maxt6n+cb2P5k3vWor3Ow50eiVDO2Lao6/6WkDcRBW4fNWlvPWsFVX/8BbN
	04q809hX6oGbGYkgJLS1NFc44PY9yZ9wYrmUrCtXRWUELqRdoP2P62mqHMHgJegZcAUTlHk19y5OR
	zFK3Vv9zg/A8zkt5nv7u05JqUCB0rvMXeUqlFzvilKdreHJLTGafONOVAYquGpgPJ+5Y/Z8hzy5bO
	YugN7h1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljk2-00000001CV2-29nh;
	Fri, 30 Jan 2026 08:20:34 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljjw-00000001CRi-0kqb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:20:29 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-81f47610542so1080310b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761227; x=1770366027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPIX0W/QwqFfqblc/FqF0IeuPkn1Wyp+rRntpvN5lJ4=;
        b=YxFmg+0U+evrMVo3j2Qbc9wTDJKsoZ3jRLWL0QP+oKlbwTfhSnjyzsl7Ip90zhgojp
         1zG83EWh+1ce8bsOtSK6Yyhwq4CDhWfZ/E15KFvsD4Gifi+Q0+MDYbWlrmASbQy2jTB4
         4e2z+POO0JhLyfkVHv7hXh9D0mzFh5KfJbN9hXKN6SmOusPSGlSl5tUV7hxpGncbJH68
         +voPZ/o+Y7Qx/hfUmQL34KWpveB5PEuNVsz5tu6XaIyURRm9KA3yoXDj8TzuQfB3dY7L
         S8mHsGZ4zSwSZQZ0XW3GwacN1kh3ehTOHS2o16ESL7jf1wo0ophhLCE9106B8oGliS87
         6h2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761227; x=1770366027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uPIX0W/QwqFfqblc/FqF0IeuPkn1Wyp+rRntpvN5lJ4=;
        b=q5C+TS+mzy9KWNAeURWo89bLcf1Qm46PBPklOjEELsMGIAmofIsqwCrweUllU07t7t
         5pkj9s4hoVl9Oonx58WVT/PXLSIl7YRHSo6KnPUfkcnmrTqOzzOkkqO0cv/m3KWNgYDp
         GPxxWEGmbujSG19Emtt/R2ZNvNyX0G9CPN/g0J5OJk7kEjB0Fi/AeX4SWMRV1QGy31NF
         bAm6mYCDhjQQKUoA7ZT5twfIAW8FvUuwwGmAECnX8WYBERQGSv4L9fQeuyvxeCwFDyIN
         P7cTdNupKmi5zMvoznaaOk6DUGdq8L4K5Gu+bgxPMxIJeOAMrJXhOGmsluAVmtVlVpCZ
         vu1g==
X-Forwarded-Encrypted: i=1; AJvYcCX2qCuLqDarznYcg5trI5lM3GkNDkLhfF3DfLSSofU5maoyDD5TSCZNpeaG5c5+oxZM9an3IbKRNJKXMeXP9+az@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7tXBq2FaMdw4qPFVFOqyOUdszL5C3iekaANvNhBLY2W+YhJZ8
	4Zc5cA0hbREmsjgwzVTlNQUzxRTt99LH8SEdp0PqdTROZoocOSABbC3H
X-Gm-Gg: AZuq6aKClv3pAUAtvSCpKrl7Q2aXbqTdoXJl2rqSSseTTdmDXAg8rP92EBPYp1NpiBe
	XxVUoNd8rLlA8eHWv2I4W814O6G248hhy9ddUpLALcRk4z9cFh6k00KyTXR1FxlVzjLFzJs6VRs
	O0eZyYx9zNlK9yHWWtDj8UtESkuff14xfOPaqjaZiNr56s1EaHluYyoVeLfrsLeXuUDk6B1suya
	Y10Ix1BE6/bFc8nN8XGoUtqOiV+WTFNiAhC5QWdanI3QSEgv7h7LnygiXSECMe/xji5L3eUJyCL
	a/QhHGU6WgVk32sa4LoNVAYLskTwRNJOr0T90fRlGl5kbCcm7OXvVRJ6we6l3MsdsFfuQOEhcM/
	Mw+F/P02jYojxA4wDR+/pQe4ySzmpF87PPmRc2ilBHlgkSkGFP81dJfQmXq6IWsDhezEG7k18/5
	rirUkE0+NJB9k2bGpH9pTvX1dhvUPDiAh4u/x4UwcX5RGf+G/DZ855Ev+nzLnfrmTKZMD3XNnMO
	7+4aZFV/ROQvV/P2Ar0cbJ8ItTC+dKJTagLLx1S13n0TPNQL0hnwsXWSZx2ERTCj4LK/5rZHJRU
	hNpq8FVqBUrX
X-Received: by 2002:a05:6a00:248f:b0:81f:d605:b2c with SMTP id d2e1a72fcca58-823ab873c6emr1897727b3a.48.1769761227270;
        Fri, 30 Jan 2026 00:20:27 -0800 (PST)
Received: from 2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net (2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net. [2001:b400:e3e0:2a58:5bcf:a65d:c80e:2087])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm7866018b3a.40.2026.01.30.00.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:20:27 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 30 Jan 2026 16:20:12 +0800
Subject: [PATCH v4 4/7] ARM: dts: aspeed: yosemite5: Add ipmb node for OCP
 debug card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-yv5_revise_dts-v4-4-4d924455f3a7@gmail.com>
References: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
In-Reply-To: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769761212; l=881;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=MUMRve3kRE7pUB71SRAZkcB7pmeSsMqBTIHoXuxoOoA=;
 b=xVUYwrcxIkU1SuQ/nolx2k2lMN8102NKwD9efGjRAnqhuerUKmSd1F0eTs6qi+z2DjrAuDsQk
 ONI9NH6YPyfANvzfoyAAQenwBd+SDtNInZj1ywLnaatpk6SYI5Ceiuy
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_002028_231752_D13978B1 
X-CRM114-Status: GOOD (  11.49  )
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

Add the device tree node to enable the IPMB interface used by
the OCP debug card.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 983aebc394d9159c7e3db2e7c39e963f7b64c855..84d3731b17f7c7c87338672bbcc859de2b89b722 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -365,7 +365,14 @@ i2c6mux0ch3: i2c@3 {
 
 /* SCM CPLD I2C */
 &i2c7 {
+	multi-master;
 	status = "okay";
+
+	ipmb@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
+	};
 };
 
 &i2c8 {

-- 
2.52.0


