Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A5DF47CCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 20:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e7ZYKBVruApI8Lg7SIwWtlcpJWziK6Oev9y2DvYJxqA=; b=gkM4oIguKrPFTwspKKe8USyF3g
	yjnhjnvojpIMdFjDNe4FUJziSoQvMFHMPOD6HX5f3ynHHDJChSrDtcQfedqBt8hDHXMsbitpbVuCQ
	tsqvQio850CfASp47jBVbwdswj7GVgavHI6UuJu9Nq3zcJY2qI/EdYnFPShwweAnJqz4z31J0tP5J
	H/RjcElqLFuVL5oNjsJs/H+e8RYZdqLOR3RXI7oK/6Pfp4sNq6K2Vo6WQPaX2Z90X6KO+NVPWjFtr
	LNHhn0qJSSCAYPMyiT8gzca/DlNsoRA8EgT1I/po3reJHkiDMVjSDBGCBO9Wnhc6MZ1LE4nqN8tuk
	V2ZsMDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFFn-00000002WxR-3vbE;
	Thu, 05 Mar 2026 20:25:03 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFFl-00000002Wwb-0662
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 20:25:03 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6775a46c6dfso3294335eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 12:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772742299; x=1773347099; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e7ZYKBVruApI8Lg7SIwWtlcpJWziK6Oev9y2DvYJxqA=;
        b=Vx/14Bk7RMwMdPUMVB+u48VoKH2uI0LZbkaz/njrM99wXu4p+gWQZLdyowUzynsOEJ
         NMwy8LrPwiT8mbhYTBlo9QV5K39f5qGqDdq/q6E3SjgOHKzTSvnY/5FjiJQvMB1+89ZS
         efbKcPK9ij1tLiYpvrY8Uj1oQUPsTUG3+nJGRR0Er+PxEX9RN+Gdj3+XIH2xZXUMP5+J
         O42KIQ6z53h1Li+u8O//dQVH78F2NyIpJtNjRQDzgS6dvh6R8m9jIyc3r9FE4+vLbnBY
         1ITx7uDhceBWGF0FfUErBHMcI/EWk1ggC+GUp/TrNcJ31oGo2qZVUnOhYWLpmkJNE8lB
         vXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772742299; x=1773347099;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7ZYKBVruApI8Lg7SIwWtlcpJWziK6Oev9y2DvYJxqA=;
        b=qbVSy4WI/c3RWy+BMpquXO46ceWvkxvWz8VZ3sprZqaHpeDqegKT6cwHzKJudmrMhw
         mLKMJvH9eyGGNnLbgxajftwhkwzZbUqGkj5A9bTft7GzIkDm9JKq9CvPBq9DXAJ7fxYW
         8+FOkvWk9mA3HkiKe8209MEOn7Ll8TdL1A0BipmmNe25VZ+1vwbnphP+JE92yLlPu9KX
         2aI3nIvNFG9htReq9QLcLfMxZQ2H414YSqfxjVvh29Ol6ARo23ZBna67yu2NqZRuw6Qc
         EOFPaSzxoMcpKfMvQOz3ZIGXPJK97vx+eYOIflrwHyglNZIBlw3nNOxSBwEi6mKNrIvv
         bkrA==
X-Gm-Message-State: AOJu0Yzofz4cEh64P6mN/AHknZRCpyUoYlplh2cLfS5kIdTnIWo5aOMi
	voc08inp3djY3Majwl67d2KJhXwhLNx4xu9p8nMTo/2nXDZvnQnX7JJ8vkGiweB2OgQ=
X-Gm-Gg: ATEYQzwrz99LDdWOdYUe2EsUGttnrWGxO8PFOAAc5YZ5RrRSqY5/9OQ7eqDTWQ2KCvF
	5zFq/6/+HDLPd+miNZkPkaBqtxlVLS6NI5G1QUI79VYlWzi2sRhtaT+RwgN0C7O9hEnd2xo2GIf
	me061lIThp2Lu4BlQTnp3cdp5yxeFhXm6N9W/6xEnBZMqDQHEeht3OY8yA5/XbQNkg5xWeW9AJH
	DVj3XSQ/SgUFOlnCFEJA0JeDW+V9nBLarsScP8pBNLzel7xJddeQg9fumJyFNgpDYqZ1Csas+SN
	pi+/u0ROKVyq0K35IYys+digxw7l6FjBV5+1OTgoaZFgP+qw5U0UEnYL02sRr05dn0q+INkgVcS
	9WS356kVYE0t6k49Y1fXFF5085eIptvMhDPTKbeXVuQ28IGUHWQA6fCgZPlqwQBKB82zn7IaPXy
	QMsM/vOQz6stGLhSVHf7UAhLbETInq
X-Received: by 2002:a05:6820:1799:b0:679:dd71:db78 with SMTP id 006d021491bc7-67b176e81e5mr4267637eaf.12.1772742299132;
        Thu, 05 Mar 2026 12:24:59 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:874e:e775:4f67:b3a5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2bcd3c5sm15417943eaf.1.2026.03.05.12.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 12:24:58 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 05 Mar 2026 14:24:50 -0600
Subject: [PATCH] ARM: defconfig: remove duplicate CONFIG_TI_PRUSS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-arm-defconfig-remove-dup-ti-pruss-v1-1-bd518ab2627c@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NwQqDMAyA4VeRnA3UyAb6KsNDManLwbYkUwbiu
 6/s+F3+/wIXU3GYuwtMTnUtuWHoO1jfMW+Cys1AgZ5hDA+MtiNLWktOuqHJXk5BPip+FKsd7ig
 cp4EiEacRWqeaJP3+H6/lvn/3F7X1cwAAAA==
X-Change-ID: 20260305-arm-defconfig-remove-dup-ti-pruss-eda912a22df3
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=N3MQaBbD/mr93c9VrfcDHwGfEOBT8CXfibyctV/QTtE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpqeaTD0YE3QcuvzNDNFwpgFrqtDR2tongdpqG6
 Qq9XDsto2yJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaanmkwAKCRDCzCAB/wGP
 wHxCCACZVspXhVCcg3YV2CJZ/Wvq+JPYXw1NcghcRDvyB6st4aKINyeWwFBrNFHU3aU01r9+YEV
 NJjcxMBGUgJazIV3zC4ceJcmNI21pUADGHPAE4OKF7veSOhrBH3srwNaTsLzHuh6eMIwwRci2Mk
 NvOfqv8oLkYNWF8sSdYjA75NMmyx/D/RAFkZUa3Ok8J9ZLpM1lZJAY9GyGIylkLUye52FudHfk3
 sfLf9wtfQhorCF7dOWiYGnRnfRINKIBWgWhw8dN9HjNdYwZfBeetJZJeWDJ2hW5yulmiS7tDle2
 jPMudwmQQO2y//2xsQs1XpoucnVRiwrphaExUC3ClVi9mvCE
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_122501_333610_222527B5 
X-CRM114-Status: GOOD (  10.85  )
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

Remove a duplicate entry of CONFIG_TI_PRUSS=m in the multi_v7_defconfig
file.

This was noticed by the following warning during a build:

    arch/arm/configs/multi_v7_defconfig:1152:warning: override: reassigning to symbol TI_PRUSS

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
In case anyone is wondering, I used savedefconfig to make sure I removed
the one in the "incorrect" place.
---
 arch/arm/configs/multi_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f75d75cf91c8..70d05f74049e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -279,7 +279,6 @@ CONFIG_TI_CPSW_SWITCHDEV=y
 CONFIG_TI_CPTS=y
 CONFIG_TI_KEYSTONE_NETCP=y
 CONFIG_TI_KEYSTONE_NETCP_ETHSS=y
-CONFIG_TI_PRUSS=m
 CONFIG_TI_PRUETH=m
 CONFIG_XILINX_EMACLITE=y
 CONFIG_SFP=m

---
base-commit: 3f9cd19e764b782706dbaacc69e502099cb014ba
change-id: 20260305-arm-defconfig-remove-dup-ti-pruss-eda912a22df3

Best regards,
-- 
David Lechner <dlechner@baylibre.com>


