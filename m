Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB87C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKAwUXOLwMRO+DlBAOVwR1oRm93Guv88/PxNLjpkT9I=; b=2KQdDZK8GopSVBHpfe2X4gVluq
	xc/5uaL5WJ23Tbiuq8ZxFjlgLx1F999pIvBAkjyt4aIqVU8LWoBPFcEobe05L+5H8J44SK2e5opnm
	iwl82m3ExATftXE9amZ5TTcwXv+8JtNmv7BO6P0EvZWlu1qV2JKqQKEiK26qRnRKsVtXx8x+P/+f2
	vs8+WIZb/RoNMXUO+tcSUyngnfBvh+2jgdTBN7QJU8EcPmiC2foqDXHuSNnTWjE72Omt8P9Sg/6tb
	buksLiA5jSocoPUHHaxq3KPgWSr2iwCqy5xyppOw0i3sZoeY9LGyg30jlZ9KW9IlhVxHnHl2ziASO
	4YKKvmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua03O-0000000DC9M-3pNX;
	Thu, 10 Jul 2025 22:47:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZF-0000000Ct8e-15Fm;
	Thu, 10 Jul 2025 20:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FKAwUXOLwMRO+DlBAOVwR1oRm93Guv88/PxNLjpkT9I=; b=cW+6+Pbk643yjOAN1NF2YRJKWS
	5hDA9eLoszrZ+VamtsR4PMOCoh6OLtGGE46himuOTdh+fKnolZJlNaAAz1wdmr3m2w6EFJ4CBBr9w
	sIa5RKcAaMCrP9dEVO4s9khT6fMpeQk3tcmRr16u2/abkm3d8LMf95Z+ZyUKocTUeo56Cx9LmWKHa
	n8d2sON0WcyQr04faJub+6I6Jzvr/XoLjVcIGXmODj9z6MUMysrK/ZQZ5nVNVyUgGNnLz0olW3bjG
	/JJyXv5Fp94ArjxManl0iy8Rgw2W100jcEnwSde9GLawCpCMsyd6CvhzC0MunFfegcDnsbaTinVuO
	7Q7i3j1w==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZC-000000098xo-1fxs;
	Thu, 10 Jul 2025 20:08:28 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-73972a54919so1264887b3a.3;
        Thu, 10 Jul 2025 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752178104; x=1752782904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKAwUXOLwMRO+DlBAOVwR1oRm93Guv88/PxNLjpkT9I=;
        b=egRGp8vu3RdB/9zraNiNRddNJ8kTj5jdIQ+BjoPCKhMc/+K6GTDu8sn1Pv6jj+tbbl
         OBLHbaP31318dhltX+0/pGpZG1P7DFeL6sWsrgBayExaDy0JbqUd9dTtMMZyoMvdi/Ee
         dKBlYr6MFkNwH80oohhb442J7S/NBq1EKo1jFoxNHqWyqYYMMJ4RJTFglHX7UAjS3ypd
         qkZYcZSZlX9HG621nz2ygEA4gNBhdq+3eIOV5YfjsVFaAk7gnIHSX4bedcsrBxep2BT5
         e/Ziumct700p0PdJONDLXAjfGgZW64GCb7DMkciekYvDEjURvVFqtbLW4d1dRAapzJNi
         iRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752178104; x=1752782904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKAwUXOLwMRO+DlBAOVwR1oRm93Guv88/PxNLjpkT9I=;
        b=aoSv1LtmS9X4QiE1uVbd5kQHXljPuxoJWql16V8kPVjIJ9rX7SuShyLuXaohVSCHWD
         0Hsqmnx1Ix1A02FaNKmwOfjl6cVERF3yJ2LFUyYNlgqLMQjYXrO6HUsNndQ2X/VveGbM
         Wv3qgtTIhFjMaTCNlDOs4X4IDGtgfYRIBt5X54teHJ0Vv47fp5lX1+6O1ZBYd8XVhr3d
         B7GmQqwDczHGT5ZjjiBxLpXQlDCN0ZS5u7jhzNNDMLzrmQtgO2HsLVU1ewt4zZ+eYKaA
         fHZFuHotSn4xuVV+BNOUOB6rtSo74SJSWqhkiveGz3lfftnApyhopf+ntjM41/Ntygj1
         6Q3g==
X-Forwarded-Encrypted: i=1; AJvYcCX6/MfoQUhrRxFsUg+r248kn4AKeOv2W0EI+5SUjPQGNE7DEE1n/Z9UFHOsuS6M3bo8+KsSc5X+JTVd73rbvpA=@lists.infradead.org, AJvYcCXTHAM71y4qtSu1ClRMhYLgAKwKyqILzSBvP8iFbPu2jKayFmR3nRzpVyBiQOWBjwR+wLMOLP463hUPEJU4/AGJ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn8PWMRpfVwAhFteK14Y5FHNeEyjQsjMpVpA8BrLvUim/D8ZQg
	39ZVhJ3EenZ0q6PZjBR4bN/aXftR9WpQcKAwUEQTuCJsNlzXUR56scRx
X-Gm-Gg: ASbGncso0A0sally21ZtfQ2YrWmmi4E6zHs+0zGPABq2HzOE8ICAdusuAWqoNNHmxrH
	R9MaXHoDTQqW9LoPTSUAiDcA7mM774kEE8I8WUoMIAl2UxoFB6BIHF+AC6sDW3CuASY4Ycs3gwI
	WOsLanBZzR3IegLn69G8HPWPBB9fL7CqdLIf9PWoAwfrs++EZZc+nH2+i6oDyPK2nSfCzZ5ILbg
	D+Mv4/MbVohqVPWjNR+3mXC7k/FULlUbesZnx6EqycwoSo4qw23ehKuAVjOuY2gYm7zmqxI7Pul
	jNe1KttIfTQ1P627xWYaBJpO0ry6vPvBcZ7r3wvBLfc=
X-Google-Smtp-Source: AGHT+IHIoyNrGJo/EIqzw1srVVXSz6Hg7IDYitZm1P+VMxLFLgoRFUVoV4IOf2xwEsG8pptxtDj/oA==
X-Received: by 2002:a05:6a00:b90:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-74ee07a860amr530115b3a.7.1752178104580;
        Thu, 10 Jul 2025 13:08:24 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b29asm2729453b3a.87.2025.07.10.13.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 13:08:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv3 wireless-next 2/7] wifi: rt2x00: remove mod_name from platform_driver
Date: Thu, 10 Jul 2025 13:08:15 -0700
Message-ID: <20250710200820.262295-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710200820.262295-1-rosenp@gmail.com>
References: <20250710200820.262295-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210826_590297_02CDD8B9 
X-CRM114-Status: GOOD (  11.08  )
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

mod_name is a legacy debugging feature with no real modern use. An
analysis of the underlying MIPS setup code reveals it to also be unused.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index 701ba54bf3e5..e73394cf6ea6 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -246,7 +246,6 @@ static int rt2800soc_probe(struct platform_device *pdev)
 static struct platform_driver rt2800soc_driver = {
 	.driver		= {
 		.name		= "rt2800_wmac",
-		.mod_name	= KBUILD_MODNAME,
 	},
 	.probe		= rt2800soc_probe,
 	.remove		= rt2x00soc_remove,
-- 
2.50.0


