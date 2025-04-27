Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F5CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 06:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arlXjTtgy3BAr37xUh1VQDxToO9hlb9HPCoLz/1bTAk=; b=QZmW5Rw9t2e3Wp8Kf3rsSb6DnR
	aBZn9BVSyUXV6ueLwvmIEg/b6YuSAAzudkZfRWLv9XfjmSxscUWW9bgu7Z+kYWSHTM4M7OxUvzDXL
	DZ5HtM9Hx257CgLyvfAZoh16oKI13gGyb4iK8FsyRN311oQgLMNJfXMQ1DSuXs/rYHxxHdx0OepKJ
	kUO0vvK5k7whPUh6KnzEGN1kbs4atwGiPPH1bGhPulU5vmnAzxEBRobWkY3qdeehTQna0A3z0o39W
	VmGSDOOt5VgQccWPq7XrDBgPhlnagaeAsw/ulZCJoPA5HVtxqM5pCwZIPbK+QGx9GWRZRbpcxaXu6
	BxybkWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vP7-00000002yLk-3l1k;
	Sun, 27 Apr 2025 06:22:17 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8vJV-00000002xny-3sOt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 06:16:31 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-af52a624283so3255227a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 23:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745734588; x=1746339388; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arlXjTtgy3BAr37xUh1VQDxToO9hlb9HPCoLz/1bTAk=;
        b=j3lBUpSrlMfpCO3JqgURWwQHai9urmO4yEfHktElJUJUYiqCfaEqfrQ/gq8bAHx2Wl
         /kHX9w8EWCgruIpZNuYIYnXArxTME7p6pTH7cr5VGO0f290I9gzpaeSBTISYe0YPCtv8
         yi4k/7TNQHW+6RHGjOZ0ym8A55Fv1zSy6bmFjIX/f+7iEReT8A3yLi5DLNQ2d+6/eInp
         YhanUsarRRuJc52JbnK6t657Ohn2eUiakCVS9ou2bwCL/kn/IawJ8wjPdSSgOeI8SDeF
         J5yicOYgSSwubKL80FLdI//JM9vHbbMxehH/ptRyJmR9rA9K48NDShp3GrexqCsNWxWO
         Jc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745734588; x=1746339388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arlXjTtgy3BAr37xUh1VQDxToO9hlb9HPCoLz/1bTAk=;
        b=PsByS5rRobFJkgW8imDmN1z4NKQ9abQMGlqu9mwC+B96lnZaEfsFv8MTKCoG7+B2pM
         BJ1c/W12nXFAksdO98GatrUgV1oLijjywVPJ9ebJB6ONPeexY8MuGSAwCzpQ6K/8n0+O
         /V1dEnmGsu3uLHO0q2+zb18WKSyxm/2wx25kwPwEll8N+ulj5g3MrjJZLgdfhaLxoSwQ
         pprG0zDka1WF/WWwNEf3rOhMNglPezAEYagME34QDqh2kxkg7V/CLEeNiuVNYLbbuCCF
         GttLeiOnApe1v/Hbw191DHDMGhGHio+tFgt0QGyRblOF5kVp63OIhCauCX3MmOA8lUdZ
         Gcog==
X-Forwarded-Encrypted: i=1; AJvYcCUFV6/vL3L4pkXw7VgEoT/jVddlt35y1Vx4Ec6k770YPm1fV6GzXLSAO81bfSTEhjChqQXVYqYWSZlcUdRGaVTL@lists.infradead.org
X-Gm-Message-State: AOJu0YzURNJKwxAnZbFn2j8Yre53GfhSmLeAkaKvpp9xLtkobmwgE7fm
	S4R2ixsAfK1UQQQIEvxFInwmPzDAGz/l+EaKWERtE4D+P/wCHW0VpdikR35KhSOEQcEH
X-Gm-Gg: ASbGncuoSvScsBT0aINPNuDNu62pj+qmiegxF0/dOFfBkfqr2+Hparh5s9EhrUxJ8IJ
	+3RECPD+i8HQKrvZ/U3Ca5bVPzcY0Lzl7yqsD7zwvNvdJTHNCXuaxbp69lDkiRt7Gqvoh6N+fCI
	YHUAJ9EymygoCvhRRUc+VgMPi8EGd/R0yUzlEIJmBZzwbfQtDwB16mHbhQdS+h9qSjQL0XaGjo2
	YGOFNUxbCe1bCRDvYGaIwiy4lo3YidqZV70AdXKHRaktw3neurK1yGtzh37/vLvgvBPpEfuypGs
	+PDaZUdX3hh3AMpY9slzvC8Q
X-Google-Smtp-Source: AGHT+IHI7FfMmiHvegnH3jYRRExzK2Sstbajg7ZocUmpjDuKv+l+0QX83bfc8/fIIkBGnpajgMyTQQ==
X-Received: by 2002:a17:90b:42:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-309ee37b550mr17322947a91.7.1745734588534;
        Sat, 26 Apr 2025 23:16:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d461sm5080287a91.39.2025.04.26.23.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 23:16:28 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sun, 27 Apr 2025 14:16:10 +0800
Subject: [PATCH v2 2/2] i2c: imx: drop master prefix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-i2c-imx-update-v2-2-d312e394b573@gmail.com>
References: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
In-Reply-To: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745734572; l=873;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=JHmA+1ZeQK8oyp8y9eMk6Hv0vqiXhbFGyjgYkZxY8Io=;
 b=brBU5+4z/15z6LPbx1Emc7dlsMzWr4mB+pXCEvGTacv+PnzSKbtWKD2fEFPLA/3wrRBLY49cj
 ffZoQ1gOG/EChkqymt2Edi//dG0kft8qcLuY1pf/DD6+0X0LiDOVCjO
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_231629_965581_9F982506 
X-CRM114-Status: GOOD (  11.98  )
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

In light of the recent updates to the i2c subsystem,
drop master prefix.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index a98bf01c5dde..fca3d1adb627 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1689,8 +1689,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_imx_algo = {
-	.master_xfer = i2c_imx_xfer,
-	.master_xfer_atomic = i2c_imx_xfer_atomic,
+	.xfer = i2c_imx_xfer,
+	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
 	.reg_slave	= i2c_imx_reg_slave,
 	.unreg_slave	= i2c_imx_unreg_slave,

-- 
2.34.1


