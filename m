Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE62FC97EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 20:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRcoZ1iR+Zft8TDDmCol/NQjdrUX/469MdzYJEtnt0k=; b=LrgKSatoKrLhMnwcb07EDPvp0G
	w6Csbj610kUAstXUawLqt/4GCQjyFo1qRQJ4SbGBcsLFs/R43+p7E99Yomp1555nyllZB4fZJlMxH
	oZ2v1VtuJEw0Qp5q5sKtUUOJDLaEWTTl8IHyyCBr51qCXEvobYMlCYXXD30I2zdGEU2//uCm5rHd2
	tgLMf1h6mu1MHDRNJr8Hnu0czCLtPyYJjRIeKkBvfhmwcSK/UlQyTJDRimwJHBOq5OcduHrEqBG4O
	+cCZUq8hBn/9vtUkVNeT3MihPWSDDIOoQrtWTdvWffQFyKenl5H0yZl39qne21/EZCBURIsxw2grO
	3/1RJVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6x7Y-0000000AK8g-3btr;
	Sun, 29 Mar 2026 20:52:32 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6x7W-0000000AK7u-3fJp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 20:52:32 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-35c124d2613so2482196a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 13:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774817550; x=1775422350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRcoZ1iR+Zft8TDDmCol/NQjdrUX/469MdzYJEtnt0k=;
        b=q6w79SABvpwKeoi0GZpZY1iPEdeyU+hKVuMUNSWH/5w/hJ9zsY9q81shf5qODNCIjV
         Q2KR+e0H6d0k+1iZc64OVtrx3QFro0iwwtIvIrtifMvH7ymwJ91ijwLLKh1r3ii3J6Oq
         EayNrAlNPDaN5vEtrCgw7hnsrAH6t8/h0BT+EldIOo4MykrZR1SwcrlvaZC9e7N1KBsh
         3mnqfOMPSMagyR0o/FFxLUCxkr4dqZEfP0hqAb/elOURDpl/aARL+JEK65bs/ypMKJ0O
         R3gE57pUbdM5hHi7unVMWkGLwgMHfNpuPFRyhwFYjsVj7QWRNoqWd4QehK5CLJRgWCEe
         YrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774817550; x=1775422350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jRcoZ1iR+Zft8TDDmCol/NQjdrUX/469MdzYJEtnt0k=;
        b=jb8ECM9fNFhwj+LtFgNxxFe1lY7+u2E9SDxkqY7QY4etjHjgJhOutwcfyJ+O9Cr+i7
         SHM+MRCXHO38z+H9x5/uj0WLO05HET+r87ji8QNOMTtUdkuxVNsQ3bc8m9TVLrViYbWT
         KXM9BBxg5QlA+jMrw0l8sxvE4xmFttaZDvtbnJ4CLN2JXZ2OgXTLghfCPSUSW3nD0FQ4
         lUFfCGSgS7onZOHsRcamVXEB+nXJ/VERR22LfKlrONsVhmue6JXLujZ8fAhQtd+nCeSc
         fKa6CDDaW4lQj/viEczrdR6HhzbjtX42cbHti7j580Jj6DkK1lRPse9ONLGm3GF6xqwp
         Ig5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPXnffgEblqVH6yNmXkaGNl5N8cTt8IGpT1TvabYF0Rz3eWtvb9nOHL5kAgadot+qQfqPXv4FFD767VaNw6rEt@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn0wGSk5jVHzflUyXjDt/za+ZNKOuS7bTCZatQV6WcANeDV7EV
	yG1iKvrwAikKG+pPTFikpIZenWJBbZRqK9JDCWipNoiP6f4piLpTVNUw
X-Gm-Gg: ATEYQzy3YwuXDtfBkBct6zErzzNxeV5qBneadCEUPwHrxU+x/7hQnqI3uFAUesCj2Wv
	qud7rqyWIuCGCnV869UVZ+pkBIGIFDTTbP/o8zKArruF6FR1mhx2L75Sm3WrPSv8THThzM3KorS
	8b+upUZ5HmVpZRsmbZt9JdXixldQzWfQyUaIhxa1KVUYuKaJqNxRNIQyLQyXTGyUMzw1NclqjgW
	TDtI3nzsPyT8weP/XY4Z0pVvgAQWcbs53RiM8813tEPsydMbK4+GpH1sDWLQ/+fZgU0bXhAtOha
	uxi51U5B28PVpSQSXne4JRFSPm5F4lzL68IAazvrY61DVZre73Xykc/wzz3H/X1jEgDyOd2bjXg
	T0EKYhcVAfV+LZ8MJRZk3J6SuCRwo4Wabjtxo/d9/cFETZ7iERJGV99tTa0aSSmxEqtv0cPR2u0
	2aVKLFgEVnrp6qTydfGVdse+onH4vr
X-Received: by 2002:a17:90a:158f:b0:35c:30a8:327 with SMTP id 98e67ed59e1d1-35c30a809demr6408184a91.0.1774817549987;
        Sun, 29 Mar 2026 13:52:29 -0700 (PDT)
Received: from snowman ([2401:4900:646d:9af6:7748:701:6c70:4173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d8c500sm10423412a91.10.2026.03.29.13.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 13:52:29 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: sre@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulli.kroll@googlemail.com,
	linusw@kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v2 2/2] ARM: dts: gemini: Rename power controller node to gemini-poweroff
Date: Mon, 30 Mar 2026 02:21:51 +0530
Message-ID: <20260329205151.15161-3-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329205151.15161-1-khushalchitturi@gmail.com>
References: <20260329205151.15161-1-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_135230_918466_CED289D0 
X-CRM114-Status: GOOD (  11.95  )
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

Update the node name for the Cortina Gemini power controller from
power-controller to gemini-poweroff since node "power controller" is
reserved for power domain controller.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 arch/arm/boot/dts/gemini/gemini.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/gemini/gemini.dtsi b/arch/arm/boot/dts/gemini/gemini.dtsi
index befe322bd7de..c524adadcf81 100644
--- a/arch/arm/boot/dts/gemini/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini/gemini.dtsi
@@ -228,7 +228,7 @@ intcon: interrupt-controller@48000000 {
 			#interrupt-cells = <2>;
 		};
 
-		power-controller@4b000000 {
+		gemini-poweroff@4b000000 {
 			compatible = "cortina,gemini-power-controller";
 			reg = <0x4b000000 0x100>;
 			interrupts = <26 IRQ_TYPE_EDGE_RISING>;
-- 
2.53.0


