Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED443C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b5p40yKNXmiRzyWRdpfFOTFd2Qmr/Bgk6kI4JtztrGo=; b=fzZpByNXpVfdlNddL63d/kpAwL
	h1RnmnKgI8B5OL3SooAanNNVEec6lgNiUrUw4QqoO2kWmEspO0vRI/bzVmCv8CDn99GaTMMMJwDoC
	71inlqBGOVnGwljqCo6V458Amf27o50JCrQnGzXuV6+l8iESVaxu70vyLlIuSFednKFjG6QJZtKSu
	CgoMAKtuBFlN2HE/7NA/04eVfHvXkUvlUayNS2Uv2lfINmAh0makUZg/h8flIQI5anKQ3KrSGJiT5
	kgS8CEnFtWaS1wceaAAZC8Imws2q1tudA93iZImnhSpYI4+cAsMMZmJe6+wOT0Hca5eQskaS2FZi4
	HUrz8b2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Pwg-00000008stV-3Cl9;
	Wed, 23 Sep 2026 16:35:47 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Pwa-00000008ssL-34aG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:35:45 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfbd148aso8743036d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181339; x=1790786139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5p40yKNXmiRzyWRdpfFOTFd2Qmr/Bgk6kI4JtztrGo=;
        b=DcOS2IIMPqh3YY4+7MMdg8fzCVyzB2lYzD3Xc6Bgm9P/UOJ94E/aa8ouOrnAgXtUsd
         j7ocLQITyD8dW8Dg4vvy4F9E/AUDIPVpq+foi5mZJ37imY/ldzE8DxA7ConUbFxlqPPa
         7tnOrIvx3xPGt/3NyqYw3VOPTZdWpLg6llpPBVQsPQF3ALrZ3jPN53Wvl2m5LNoug4t3
         2Y0lUkzGAWoYQ7rpoOIQIhbZQRHhKxRicgSjbq1QiWKaGf3KBk5HnVegptqhTmQpLBj6
         7CWcLAOyARfm/gJZOPLw8MjnX7Fs1DGJEe6iEJnQ1ZJ25VQ234fSDLzYEhmCaWcrLiPR
         zhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181339; x=1790786139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5p40yKNXmiRzyWRdpfFOTFd2Qmr/Bgk6kI4JtztrGo=;
        b=CEDQ6b80swdp7cW/WcIQ3JHI+VbiTUqBRTbTFj0vzmG2bblMNVKT/UdEJXAjJywrOP
         K12mHmZ4TOAWAIUnYZvCKBq4PFanMJQ3Mf/NjRo5r6e8U0N2QElD/luZ6d56B+0u4Q2n
         KvVCDqTrcNpizEw7b5V3Fnzng41JdHOasNjwAYzI/9jZW6mjycvloQu6U7q/LKMy4qs4
         eCLf2wxpn4fRe6xrFe8wGqs7CQw0nPrBneA6HoCBA/rgyHWH+OZuLilHC3vJMlspow5X
         8J/AcJcrXFmLBkFlmH0ggwMlfiDhu6eSxFke/kK7bh3qFfWkQefwtYWt8DVTkRcv6fwG
         KtDA==
X-Forwarded-Encrypted: i=1; AKwUvBwHmhAxq5fuO/eFpPYVTQh9VwRWp3yrs0xTzeqtKBHrYFfKVWTrx2leWAW9jYNc4aYB14eHE5FakapDqfsAjgcU@lists.infradead.org
X-Gm-Message-State: AFuF++kmz+de8SHezUC7HsbwyeWGNr7AZ4HcHncwzYvg0CYxerl3Lny7
	UjYqFOv5J/UXQlm5NKYaZPBk3pbgTn1rqT390jNn0DhcypvLBDutxKd8kOWFvQ5z
X-Gm-Gg: AYBFou0aOCVgHiMOXW5kJO0ZEheO+au7JeBT8NI70S5cfplkUCVxZy9xFIlfkI6dP5u
	KC8h5Hbqa/0KA6A+bSTAKA0DuND7gq87vMMP8IyUm9/POjfMaB43S3OYUM0K+iETM70G9fTRa0Q
	QhJ5LcunhVIEE1FH0MVz5LP29tbM/zvjbJBAiDdflbmHCcIWqU7PbBrxF+8ezkbjATYdaPo6/g0
	c9EO4RQ59aur7S4+3EFalQQS2cc9x/bDgU3QFd7aEwX0wBQ8B7Cvnu1Ly+AiqEnnZq6Iaj5A4rF
	hefUsrVbWdlsrdq9E+fxa8UEshonaiFHkuNiMhUnO5KWqvemNfgzWKhOI13lIFdzko4oevT4X95
	lwYj/+ig7saLYnAPF3U2OYWQ77v4nnv1bTI3TSoIoYZGL10QeBRScRCzyn0VjixhF9wAyTOFxGK
	mS8Q5kS2+64bH+HWOaCeFJGwj5bHTyepelf0dzVRfRk9PM0QFFHzCmnyHD6Nj/KywMSjg+GbxF/
	aLBu0qFl9g1rBZA3yC1eA==
X-Received: by 2002:a05:622a:1cc9:b0:52d:28f8:578c with SMTP id d75a77b69052e-532eada4922mr49461241cf.31.1790181339344;
        Wed, 23 Sep 2026 09:35:39 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb210527sm23066351cf.12.2026.09.23.09.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:35:39 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Nicolas Pitre <nico@fluxnic.net>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] bus: arm-cci: Drop CPU node reference in cci_ace_init_ports()
Date: Wed, 23 Sep 2026 12:35:15 -0400
Message-ID: <20260923163536.596107-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_093541_023957_1481AF54 
X-CRM114-Status: GOOD (  10.41  )
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

cci_ace_init_ports() looks up each possible CPU's node with
of_get_cpu_node(), which returns the node with its reference count
raised, but never releases it: neither when the CPU has no ACE port nor
after the port has been recorded.  Before the commit below the loop used
for_each_child_of_node(), which manages the references itself.

The node is only needed for the port lookup, so drop the reference right
after __cci_ace_get_port().

Fixes: 78b4d6e0fd26 ("drivers/bus: arm-cci: avoid parsing DT for cpu device nodes")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Found by code review; compile-tested only (multi_v7_defconfig, W=1).

 drivers/bus/arm-cci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 7f2baf0571286..076ac8e06bd01 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -199,6 +199,7 @@ static void cci_ace_init_ports(void)
 			continue;
 
 		port = __cci_ace_get_port(cpun, ACE_PORT);
+		of_node_put(cpun);
 		if (port < 0)
 			continue;
 

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0


