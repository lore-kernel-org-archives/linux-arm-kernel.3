Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65418C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8f50ReeNO2ewLKOc+m/ce/otGU09DrlDIWdxnZUlcMA=; b=t4QdpB5vMDBu61A4keqWHMUwzm
	JYZfO4zCIPf40kYVHmlGhAxtp7Joina1O3v9DALp668jZt6rXucegaCTVcbTg4h8H1SqHO4bjJGrD
	mvB2R84sktWhyT84/+v0Ft4348SDYsB0a8G9zsmkHh62TiHjGM/qHJLd9E7nTUjAh4t80cgNi0CPj
	1G1DbMKCSTbel2w7G0d3FLwcAZpYJSKuabgdgwvxykadldEBV7hbnjQmdubUp8dXSvbHjbn/S1wOz
	UQcZV6NL0FP7k8XJwaMMDPYj9f89Ubt/Qs3s5zx30OCQd/lKf54EFN6Cz/mpEyTZhBHSZxEiHbTSt
	gZKV3Mtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmt6N-0000000H22p-1n9G;
	Tue, 25 Feb 2025 11:27:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrvG-0000000GlrR-4B1w;
	Tue, 25 Feb 2025 10:12:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4397dff185fso47060355e9.2;
        Tue, 25 Feb 2025 02:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740478337; x=1741083137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8f50ReeNO2ewLKOc+m/ce/otGU09DrlDIWdxnZUlcMA=;
        b=DLODRFEGFO99xTP/2lUHUylvomPPGX3yH8AnrsebirrngU8ZaTtMPHsjfTtNVGtFC5
         rGCFwOO5XoNTaSCsBptNU8g0hXRuFJJA/OtDVHFHhrAotf5O2IFZOY6GXFUYw58UI+gx
         4L8vJk7KsrmHV6jYaXCB5pDetZK66nBNcJQoDikWw1T92XQ5nACHDknWclEXAZse+hCl
         jR5oU04eJ4kgwqtPCAO4i87d/qvIwHatKoBJmvaTeKGmFVKFIXmy6XlqY5JSdKiRkxsT
         T36AC7gksdKbKnjw9kbLolhQ/ACOauIEHBlbFdUM2GMQVJSEWPYbWU2nAYY2KAz0/6hh
         C6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740478337; x=1741083137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8f50ReeNO2ewLKOc+m/ce/otGU09DrlDIWdxnZUlcMA=;
        b=TBN6QIJG7pXEP3iQBv6wSaMg5/iGW+KxAMjLCY6NSlTjrJtUmEPbIJrsIVT6iIvqBf
         rQ/yTuXLR+b7J6/yF8nwwmhySDP64Ms8ktByUlfgRvP/B3jqrGjwsYlA3xTnRtKEhujA
         zetf9JAnG6eAqT0zG9h8xfcD+tFFX8cTFlXeOx567Vai4XxmgY1mEriQ5GvVSoLFHvSm
         urXGvHW1KW0iDEQ3I5fgcZJQN+GZSUSiE9jzKgXB3VHZpt/kYs30pl36oawBBwUmtTt8
         aw8I3B98wOhCNMSMOMVylcTeUZpOLPBzwRTy/V1R4ZTDnMl283Z1+T7axvYWGwZfGxsE
         aSUw==
X-Forwarded-Encrypted: i=1; AJvYcCUQe3HsPR2StAHIPWHRTeP8WO1mNx9eJj5bOq+MVJLyoou94g9YePT1vb4nZ7TBqxxrvz+oWpGQiKqTyG02kBA=@lists.infradead.org, AJvYcCX9lUlubF+j5crgxnhJ06akIef/UVZ/Miu6I+WBlVzvs/4nxBXzEX9/Y05gU2AQIDKGdPWcOJCpwd6e17N20ZON@lists.infradead.org
X-Gm-Message-State: AOJu0YzCIn2djccCh+P9kYaUteEYykxTJTySiUvZmoJj6sfrZK0gz2UW
	18DIU6rElXYZzS+Bd2EAcBJeG6uVzv5aSh0u3wpXt8haRjG7FJps
X-Gm-Gg: ASbGnctNDY6b9jlLMEM1HbDnaQJGIcmOxggIFQ3p2NtwQlafpEvKcklhtzCj23dffRg
	BglgZ7PvEW8fVGqz2kiXMZVq5n/oALcpnkvz9Wq8TPvTi5zmOkLghldmZYnawuPXU2PLMw7b7fz
	K/6PxPt7VGfFKmV/l+WgbHNizI1KHy627ib6iLxAOtJ7mtIzwamULTN95aMbpNyTz0fzFbcYiMU
	Z3c6/1pjRNKdNkSWPTBgudTPU55raBwOb1whlNpJWp/uLRw5m+9SSw53qYFIPq7hHmUJ5Zg+eMe
	mKUOE0g+bJO7cIRt9drz10S9A+c=
X-Google-Smtp-Source: AGHT+IH3M1TCXeGQjPYelk3PO2DOrAA7RTWE9FnFRNNtZ+SU4MlPMarj5Sh4XgmPSVxXCUY6AifVTA==
X-Received: by 2002:a05:600c:1390:b0:439:9274:81dd with SMTP id 5b1f17b1804b1-439ae1d7b20mr113737095e9.1.1740478336758;
        Tue, 25 Feb 2025 02:12:16 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-439b0367577sm134605925e9.25.2025.02.25.02.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:12:16 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] scsi: ufs: rockchip: Fix spelling mistake "susped" -> "suspend"
Date: Tue, 25 Feb 2025 10:11:42 +0000
Message-ID: <20250225101142.161474-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_021219_035343_2FCA535C 
X-CRM114-Status: GOOD (  11.06  )
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

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/ufs/host/ufs-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-rockchip.c b/drivers/ufs/host/ufs-rockchip.c
index 5b0ea9820767..dddff5f538b9 100644
--- a/drivers/ufs/host/ufs-rockchip.c
+++ b/drivers/ufs/host/ufs-rockchip.c
@@ -307,7 +307,7 @@ static int ufs_rockchip_system_suspend(struct device *dev)
 
 	err = ufshcd_system_suspend(dev);
 	if (err) {
-		dev_err(hba->dev, "UFSHCD system susped failed %d\n", err);
+		dev_err(hba->dev, "UFSHCD system suspend failed %d\n", err);
 		return err;
 	}
 
-- 
2.47.2


