Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE250CA5FC6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+yfqfhizfQ05zp6V77MZ9T7BSR5efZzEVT2zwBnQMYA=; b=haQFLLnFB/Z/FgxDyVI0GL6X0B
	twdEc7tA2jfLygIMLuRh5V6JfW2Lf0eykqQ/frXF6S5+RjLbo8GmtP+ocyWWQtxh7DgcFq3lf4kHs
	KAYLRdlsLlcaJXr2gSTfTfXjxv6iIrRmEdoIJdoHomkGDyCiRir9nCkTEWWIjIf/TGdL7EMY7S+Y+
	alMF4xJZPaMECrq6ZWiHbi3i4OP+laqY3CMmTxyUNiMPiGDYMdRfoi8ibzYSiesK+Unf52JOTE3iI
	ZmULxoWdQAWK3zvvS429txCFSo1c7j369g9QJ6EiQEZOA1H7mA2jXxG9XWbzjSE/IflB20QSZhFjD
	exbcKrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsL3-00000005qPg-3HH9;
	Wed, 30 Sep 2026 11:19:05 +0000
Received: from mail-pz2-x29.google.com ([2607:f8b0:4864:3b::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsL0-00000005qOl-3RxV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:19:04 +0000
Received: by mail-pz2-x29.google.com with SMTP id d2e1a72fcca58-88732460a36so265775b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767141; x=1791371941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yfqfhizfQ05zp6V77MZ9T7BSR5efZzEVT2zwBnQMYA=;
        b=N93w/lGTITeyl+xrSN8TaxLeoZmu914N1k0Qv1ayJq9krdkalFsVz/ttkhoMQO82Qa
         WD+LoqEDY94BuRciQa7o65ePS6fb5sYa11n+iJ2jmHm4+o/XfDX0gGPGecl3eTKEpZzQ
         BYGi5f1Lkk0Vciq+PTLi6+YBsXuXDDSKGDbUGdCKtupM+ThbfL01eYHlYtMq9GvMPlqZ
         eIPI/29MgJR8sVvPWer0mtFtVUz760cvu+Fz258uw+g5lZmL1ufHlRlyi5/YXSwIDvCU
         26vJTdEuR5P2fTV0Jaem5ENwL8Cbic9RvwHQiQ/03+HOXl+FB/2gNc6p7LjLCtyZ3LGE
         +4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767141; x=1791371941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yfqfhizfQ05zp6V77MZ9T7BSR5efZzEVT2zwBnQMYA=;
        b=GkHNk4NDpHnbTlbIiBNune58+7UyisnimlnHYmjmAtWTbXJOKGOUC50IKZdXuDcxQF
         n6O9uRAr8yKVuxaoxp7CF/4SRVC0veDlocsF1RMrsi1GztAFv2YYmBnBLRgVO//ZKz8u
         SWxFBcuYG+ou+C/A8Wrm0u+XGSIL664jcT0Xoo9AC8JrJiOXjPrn9wNf065lldmjqTsy
         9ZwCZ3izJVMKnGMM5uuWAhZX+bhTuUucPcs/DkKlP/9EQg5wzxmV3P3c7ExcN0gOM0H2
         +PY6WjixEHbMXyZNUb15d8yzy2DcGvrxc1tHAaTMzNaEVchKJ0CUSFyDk3p61Vp7htT9
         4BHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5gWXKiSDi5VEdZAWMhYtFueAq/j3d/56owB54ubeYn8QmlC92csGaPv0ZTnIRLoXaEkSfzzk1LqLH59JrPad4@lists.infradead.org
X-Gm-Message-State: AFuF++kCjl7luvR9/zNDAsJc9wRLYrxRcSuoXwRkty0IOegoLvVU/hTj
	Y4k1iNVB7QiEX/aAoCpil/420ss8VBtUFeKRn8kHjsskFC61MIaZVDx8
X-Gm-Gg: AYBFou1vvwAiKA8nmr7K1dNAmWIUdrTVqGjgaS0XKRt9cpgWp5n8FOnjLXhXAhVskhY
	DmSoDWR8fFVbCNkMLnbBODKTOVRZVtMUDL2YphIWDDKdl5sr8UtmuBEANqMErRkYKPdkfIbDOVn
	KuloX4DJdJ6ZVA6qRaanBWrcYSXEtoratv0bYH868dB3FooQtmVQ6LMHN54cGj8f98EFMHCdfp1
	Spf9UBIh5jqQR802TCwlx7NYyoyCVOX0VtV8HIdS9zayog5TBXV64TSUVPPZ4bdJQztss3A/4Q5
	wMK2GruObknShTu+MY25yn9MNFA0zWZMc3pmB+brp8drDSAezaS6BQKwwcV8k3LMoX0E95AbnOI
	cvK4mACQ63VWAbuJA/WPg1ZdTsFCNII4bacOK9DBuCiS2nrhtdCrFKh9sRy4s4kVv8y4z2M0piy
	44R/jTLpq6yiEOAScdzVfMztQcCAc14SZ1GzO95sJ0a0aRvbTAjvYwmqhNp6RgXdY3liQ0wBTJ0
	742mb/3CPKMQvdazH4W+3ifmm642FNfU6mvMym2n1+2
X-Received: by 2002:a05:6a00:2396:b0:880:78ca:8411 with SMTP id d2e1a72fcca58-8874c4ddee4mr771398b3a.11.1790767141213;
        Wed, 30 Sep 2026 04:19:01 -0700 (PDT)
Received: from cosmo-ubuntu-2404.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887253992a9sm650257b3a.17.2026.09.30.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:19:00 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com,
	Cosmo Chou <chou.cosmo@gmail.com>
Subject: [PATCH v3 0/4] ARM: dts: aspeed: bletchley: Cleanups and second source devices
Date: Wed, 30 Sep 2026 19:18:09 +0800
Message-ID: <20260930111813.52396-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_041903_001239_518BEA41 
X-CRM114-Status: UNSURE (   8.08  )
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

This series resolves dt-check-style warnings, sorts I2C nodes,
and adds second-source RTC/LED support for the Bletchley.

Changes in v3:
- memory@80000000: keep "device_type" first, per dts-coding-style.rst.
- Link to v2: https://lore.kernel.org/all/20260729114312.3947300-1-chou.cosmo@gmail.com/

Changes in v2:
- Added patches to sort I2C nodes and fix DTS coding style issues.
- Carried over the second-source RTC and LED patches from v1.
- Link to v1: https://lore.kernel.org/all/20260714120816.1504058-1-chou.cosmo@gmail.com/

Cosmo Chou (4):
  ARM: dts: aspeed: bletchley: Sort i2c device nodes by address
  ARM: dts: aspeed: bletchley: Fix style warnings
  ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers
  ARM: dts: aspeed: bletchley: Add second source ISL1208 RTC

 .../aspeed/aspeed-bmc-facebook-bletchley.dts  | 1315 +++++++++++------
 1 file changed, 902 insertions(+), 413 deletions(-)

-- 
2.43.0


