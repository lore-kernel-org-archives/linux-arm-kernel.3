Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B998DC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 09:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPg1uLKI5p/H7J2E4b3w0DPqeVInWxkk5y+GYwVR13I=; b=NtYg3fT4gWZighaey/Ku9wUxqf
	Y4/3sxtSKiid1nDwXN+yEmONSbVQk24JyzSZFSMRbSRiUSQbUw/8cu4aLP54j39OyrCnku2+og6sZ
	BZIFk/pYGSMpFEXwF+zV1HcfO0Sq9zCoLkm5oi/e2n2JEXgFsFLSMY7X66sIfnSDRw22Rzw77X2Zv
	G8x55yYEVoFf7o1g5RP0z6H0Gd4HJFVvcXhCU+gyaDv81j3tFu64WlRw2QHF+23TKkNVs/XJRvsh6
	+P0r5YV4jfXNSyAU5Zq3YfpVv7eVl/HnnObs+uvLwmv7WON7PgGrZnmbmEATkDhmu36lgW/38DOOa
	MLH0vj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s8c-00000008Zgl-1MEi;
	Tue, 08 Sep 2026 09:29:10 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3s8Z-00000008ZeK-2ZfR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 09:29:09 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc439aa0078so3566349a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788859746; x=1789464546; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPg1uLKI5p/H7J2E4b3w0DPqeVInWxkk5y+GYwVR13I=;
        b=WassrYhbN5ZGJmP+q+a7avTGhdgyPwQi7xhoerNnM8zqJ/ZUuqLP/J2knPlsHsuxDh
         nH3dHfBxTmmy6ZvDbOidyIl8Cuyk1w9w8U2Ch9QbfdjtWeRLMPy1JLbc4yVeNy1SrPaE
         O/4iNbsZl9BWzsK689AGLZM0mmtmKBci5GcaevyeyDr22mfPy78fi+btT5IruJMK1tCa
         9owXha7fMsiwAYbXIQ8H0j7cNQRHQcI860c9IPz0Wf57UFeIfyDzDJjNu8v3JN4Gp1N2
         Rmy/wqki6UQg4i0Dg7HRXg9DOaklBaT93Dnm2fqyEW+M49nR8oFbrN0VXq2vf/An42ck
         JI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859746; x=1789464546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPg1uLKI5p/H7J2E4b3w0DPqeVInWxkk5y+GYwVR13I=;
        b=XaZ56k1mldE3AmZoGvkQttGEwaP4/Nlx60KPNMEvwOIwixkK3W3m0392wIu0npgcTc
         2OdL0NkaBkIgLe3wB07mbTx5it28PjABKSDQiJqFmIiyBxcewnnW18OQuBw2BPcIskfm
         jglGAJrntWXRv0+6YO4vE+MXz8+cGp8xkv0r1bQvEGNNxzDAVbxhSJUooayl6cutuUes
         jHY7OGlf8EVFz8eCrWAPW+SwO8e5kJcZnEBoaP5j2e5fnS3XBXFopQbDakykrIBzzBfS
         ZDK7qCv+3eCYYMTigRDSh2/M3bkBhHXEWD8vl9x3Gf0OZ3bJMWKYvJEDRqjHjiPUqVPo
         v/mw==
X-Forwarded-Encrypted: i=1; AKwUvBxjddAdbDuo1MqHuKLsdusc6Awsh1HcsEm5hpgSnSvXh1ZZs3Akyb1F59VyTWuu0OIGkXmg6BqW/tcQRKWFBsRA@lists.infradead.org
X-Gm-Message-State: AFuF++kBfA7vzkH/jmYZK1vEpzHJL7+LOXpDY/J8aQuLMK8nvHLlgS/5
	4MEWpuHbLhP/ok+LZsuLkM68zhIK8Oj/AeHo7zd4omN7JZTRykb3ZV91
X-Gm-Gg: AYBFou3zb1hEaZfel146VFoPwtq8YjGEMHDf6ag9pAicZNWDvxTW7fL8r2k1KqpXiTR
	VqE2yipCvuOGOhKnZncZejyS/uv+xGe6mUob03bBti81tCkHK5n2fffaECkMU4IjgUES3NNHqep
	BPABa7KB54R20Twy3hOYUQphpjWiyKZchcgM+qZb09ixQCpPaRPQPhpecCX/0me2lWphOsLB2c7
	qM8Fqy50cy5cnUq5HjdlpBMoQFC2t/ndHHZJRH5A/exGPc8u8zrkti6FnvlSrq/kx8cDxEGy3y0
	nlPm8cGLH6hFuHU4/wasI1PY5xmmYkGT5jhUFis5FuFrH1i7ndTkf4yEykpFhiyy5QxTuoJuf62
	x935OghtxV9Cul5EDFojh99iIoKAe/gKLTKibvLuiYi9SUo320oXr6b/nqoYYkFHAaMseqbFE+j
	JJ/aNx3GJMoP3c018Y7G0DWTx0yxL5/Hw9nXCrJ8We1ultoCspR536YWfI+ZKY9rNLBjMx3QMjk
	iMCVG5S3datgfdeQKY9niDfvVg2vc7B/5HN0s2hTWHK3fRU+ExqlTYzG8bdIrs=
X-Received: by 2002:a17:90b:1641:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39b260dd3fdmr40172772a91.5.1788859746500;
        Tue, 08 Sep 2026 02:29:06 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39227sm32109846a91.9.2026.09.08.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:29:06 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v6 5/6] drm/verisilicon: add DCUltraLite chip identity to HWDB
Date: Tue,  8 Sep 2026 17:28:39 +0800
Message-ID: <20260908092840.225220-6-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908092840.225220-1-a0987203069@gmail.com>
References: <20260908092840.225220-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_022908_008808_B1AF24CB 
X-CRM114-Status: GOOD (  12.27  )
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

The Nuvoton MA35D1 chip contains a DCUltraLite display controller with
model number 0x0 (sic, the model name contains no number either),
revision 0x5560 and customer ID 0x305.  It has a similar register map
with DC8000, only one display output and only 32x32 cursor supported.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 91524d16f7785..7d630a667a3f0 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -129,6 +129,16 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.max_cursor_size = 64,
 		.formats = &vs_formats_no_yuv444,
 	},
+	{
+		.model = 0x0,		/* DCUltraLite */
+		.revision = 0x5560,
+		.customer_id = 0x305,
+
+		.generation = VSDC_GEN_DC8000,
+		.display_count = 1,
+		.max_cursor_size = 32,
+		.formats = &vs_formats_no_yuv444,
+	},
 };
 
 int vs_fill_chip_identity(struct regmap *regs,
-- 
2.43.0


