Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F4BC61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0eONpZwW40x0uk4ADcmlbKKiJGpmyohwPTROgwok3X8=; b=wwQ/7RpjBr4BEI/Q3hrWoE5xwu
	ZeZUIzfGvW2/uCx5EFO3MXZqWMN+H/XKFxsOW9znbuyGkIJly/gIe5hCSx7cQieSl4rH2KDNWDxeA
	R5NECnXAlG62pnZvZoLuFcSVyvUdzU9VO2bP21zdIshyYFqTziLcG4pYporFy1wzPd1TL9Vac5pTu
	J4f363hI6IvYR+E0Sk5VVMctpcFrt7V26uUDhHuK/V7CZXMW7LqUR5A9+s1SfFjuzO2CpGfX8LTOm
	EXo9KG8ueADwhH8BQ84Ld0DL+7f21f//Td1HQ/2tojpAPJIeO6V6pBSeGLgpbRqsUC+g1fMQlbWag
	3R/xacgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynC2-00000000SUz-2Y2Z;
	Tue, 25 Aug 2026 09:11:42 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynBx-00000000SU6-3NGi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:11:39 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so4749058b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 02:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649097; x=1788253897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0eONpZwW40x0uk4ADcmlbKKiJGpmyohwPTROgwok3X8=;
        b=AQWQAt/wliKlnb85L6pbqM8E8OnejVbC1zX8mUpNKnvT9htXmSD3hl97AHblfzFvd4
         S9v43ATdtIw4U5BIyGMOPnztheDZky41wh+UXqL9wTWE26azLVzQct43tJZgcjRwy03Z
         kEIV0jT0yQ/COKzTM7nIFwMvzh0LLI9Z04of31gTdSNHS8j/T9evwZ5AipbOGKXwrCe5
         rO3wGtU5d2lLhNzx8VGHK76lh1+7+JcAK8sOY7hIHb0QtlWB8KJR5T5nVttV2iSb4OnP
         ogiAEmTA4EH1qYdFa1BWW3qBpYKJvw/7ZnvnNo9eOBUpusBTZHWivJHy5Duo2EYu+PZz
         5qBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649097; x=1788253897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eONpZwW40x0uk4ADcmlbKKiJGpmyohwPTROgwok3X8=;
        b=SmV8Tbh7NvTsiz1AkTZ+110Ba4R6Y69TBNp0FNIU7TGLvaRHau/LNXITcS7sYTlXWN
         q0AVpvvjOnoy/sRK3uJL4d2QBLHdABDIoNfWvR/RAjeyxEHv4z+o7f3m7THxp0AN5x7A
         UPd8SNkO/5j5ulvrVLVQ6DbcopxObqaHv3gPeN0G1Zyx4FfpYZLc1qAihTXzhJhxjycr
         sOHSSyWUbLn0drwOOVZD8BFT6DTnaQ62aCyTTYgQoU4Onqb9iIO1+Z+NhAv5O5by6uUZ
         eIQpuxlcy0G+cso7br3Dfljm1FcBTMDec248UPqSo3cEbgHB4JuFupDxLuJvxw5/PBml
         4BcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQ3lcEgN3wcD6yFRbJ5B/CnsfGMsGJnRhAG6khjHGR3kMSC6ecwK93dtB1Ep9HTIoPWLkSGgYlw1rSBvHGWl5U@lists.infradead.org
X-Gm-Message-State: AFuF++lFYRlztRBXhmq89XPjv7TzjC3Xo+xPc3bIHE2kzflVcKKWsxlg
	EQrHmsIqhXczvkWXWJ4tgMi2XcM2xjROuM9tYtgQKEqlncKKkBAn3rE=
X-Gm-Gg: AR+sD125TF7i0/CM8bxuqvvnlA5gDUXcpo16/FDwOcpFjtRhmtGSRlajEx2lybQ3cc+
	j5Njp/C2tycb+rQbA2ReVp0FrS32cRCl8f5ONC825w0JWbcTTS3xHPQrLxiwtZipN3nawmFyGre
	5YWrUcjPmQy/yBojl+iw+J0/l1rt9rWhztUiRPJlUGmdNAt8n41OWe5nIIC2TNbtVRP3uC0Z3Fi
	espzhUDVOFFlvG97SuSK8R3NtkXWZcFXlSax+uXfgBduzCFVTka/t6c74+rm13JuKybxHGfDxo7
	TFOs+eySsmh5Dbh+b81qssyP+xGYVX2w5RAkrWuldVWLEmvArwjMcMaQXqHvPh+dutc+S3mOElQ
	89FxbqaVXaUCcSZzLsyYnJxmAYAfKp+cc5tRubzBWpNs2ogYB1tHIfgqVPoN0n//hzDNEsYrnbg
	LgBxYPAvNm2BnYCy3JLsODJFnnw/cbOmQPnJNXMWA6XSFxpHa1iRR8X6nrnmy0SlNo/h5zIL+kD
	g==
X-Received: by 2002:a05:6a00:9493:b0:851:fb0a:633d with SMTP id d2e1a72fcca58-851fb0a68cbmr13131683b3a.11.1787649096899;
        Tue, 25 Aug 2026 02:11:36 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e4b125sm1703846a12.20.2026.08.25.02.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:11:36 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH v2 0/2] memory: Convert drivers to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Tue, 25 Aug 2026 16:11:16 +0700
Message-ID: <20260825091118.271720-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_021138_608399_BE06E158 
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

This series converts the Atmel EBI and PL353 SMC memory drivers to use
DEFINE_SIMPLE_DEV_PM_OPS().

This is a straightforward cleanup with no functional change intended.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
Changes in v2:
- Wrap to 75 ish chars for commit messages.
- Organize patches into a series with a cover letter.
---
Triet Hoang (2):
  memory: atmel-ebi: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  memory: pl353: Convert to DEFINE_SIMPLE_DEV_PM_OPS()

 drivers/memory/atmel-ebi.c | 6 +++---
 drivers/memory/pl353-smc.c | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.53.0


