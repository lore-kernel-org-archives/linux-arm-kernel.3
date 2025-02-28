Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A92C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=rHvKJLvygA9GD0SeTmwciLbo162z0lSbgYmgI1PHUcE=; b=1xKN2AN//AchiR
	GoHls83YD3l5SAa+JwulgHmBqdsRV3FlcaNL68pcmIju8CgeJ4BNIU1rKL8uHkw92+n1JQdut69Py
	/qOdN33AhLd5KzfoNj8ZGz+yWENjLfBqu3nrWSsz5DDYVNxkEUH2Zm2HySNWreeGM29iuRh2ux4KT
	KZWN4AsZ2Al419vxTPzmORVQBHG2F2VeXgswqihBnAbFjuMmyeZQxRl+yzfzCbqHy/5RhUTZNRB37
	nNpfqvdCh+8XhaOkron1S236wUiXWU/7lVPGFUwdfrxWHKpBE1fj4dBtef3Jx19sdXOvt2Ewr9dno
	nQpeadgcCEdYLCxIDBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1oq-0000000BMMU-1Joy;
	Fri, 28 Feb 2025 14:58:28 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1cR-0000000BJvX-3FjV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:45:41 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250228144534epoutp02573636f78b125de6b81268919f3cad0a~oZnseLsYl1685916859epoutp02f
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 14:45:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250228144534epoutp02573636f78b125de6b81268919f3cad0a~oZnseLsYl1685916859epoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1740753934;
	bh=rHvKJLvygA9GD0SeTmwciLbo162z0lSbgYmgI1PHUcE=;
	h=From:To:Cc:Subject:Date:References:From;
	b=CWq1GMaCDDL3US/XQMTEFRGEyt28nvmShz/Rk7bqoPBloVTxhIkCv/CoklOrMPWpB
	 qj6y8qQb4z9JX1Sk7E6DcQUK2wFmMNFDpLTl1HumiviitXUTYU2PXJ/9uH7u/tMYoh
	 olJ0sFDZw/MlRTl47SYvtbtvGqa7shQDWj13QW9k=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20250228144533epcas5p1366a164956bc530c046b29a778e0fc84~oZnrj4LXE0649806498epcas5p1M;
	Fri, 28 Feb 2025 14:45:33 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.177]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Z49x80ytDz4x9Pp; Fri, 28 Feb
	2025 14:45:32 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9B.6A.20052.C0CC1C76; Fri, 28 Feb 2025 23:45:32 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250228144531epcas5p217fab73da682601a89e208fff5a3775e~oZnpQO48S1123011230epcas5p2G;
	Fri, 28 Feb 2025 14:45:31 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250228144531epsmtrp2c9ba04d92e99f0522ffdc7b96ac4ccb3~oZnpPn-q82769427694epsmtrp2W;
	Fri, 28 Feb 2025 14:45:31 +0000 (GMT)
X-AuditID: b6c32a49-3d20270000004e54-52-67c1cc0ccff4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1D.C6.23488.B0CC1C76; Fri, 28 Feb 2025 23:45:31 +0900 (KST)
Received: from Jaguar.sa.corp.samsungelectronics.net (unknown
	[107.109.115.6]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250228144530epsmtip15c4a6355b383e399ecdc8d3e5da32266~oZnoLHFPS1886718867epsmtip1e;
	Fri, 28 Feb 2025 14:45:30 +0000 (GMT)
From: Anindya Sundar Gayen <anindya.sg@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: aswani.reddy@samsung.com
Subject: [PATCH] drm/exynos: fixed a spelling error
Date: Fri, 28 Feb 2025 19:32:57 +0530
Message-Id: <20250228140257.75045-1-anindya.sg@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEKsWRmVeSWpSXmKPExsWy7bCmui7PmYPpBudPsFo8mLeNzeLQ5q3s
	Fle+vmezOH9+A7vFpsfXWC0u75rDZjHj/D4mB3aPTas62Tzudx9n8ti8pN6jb8sqRo/Pm+QC
	WKOybTJSE1NSixRS85LzUzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOArlBS
	KEvMKQUKBSQWFyvp29kU5ZeWpCpk5BeX2CqlFqTkFJgU6BUn5haX5qXr5aWWWBkaGBiZAhUm
	ZGf07L7AVrCHo2Ltnh/MDYwt7F2MnBwSAiYSE7ZPYOti5OIQEtjNKPGvbQ8ThPOJUeLO+svM
	EM43RomNV3vgWg7e+8kEYgsJ7GWU+PZEB6KomUniw8PTLF2MHBxsAsYSbQ8qQWpEBHYwSvTf
	zgSxmQVkJFZc2soIYgsDlSxp+g42k0VAVWLxt+lgM3kFrCW+z+pmg9glL7F6wwGwIyQEVrFL
	rFiyAeoIF4mXHd2MELawxKvjW6DiUhKf3+1lA7lBQiBfYsnZbIhwjsSB5Q+YIGx7iQNX5oCd
	ySygKbF+lz7EaXwSvb+fMEF08kp0tAlBmCoSEztYYGbP/rGDGcL2kFi9s50FEgixEqdOzmWZ
	wCgzC2HmAkbGVYySqQXFuempxaYFhnmp5fCISc7P3cQITkxanjsY7z74oHeIkYmD8RCjBAez
	kgjvrNgD6UK8KYmVValF+fFFpTmpxYcYTYGBNJFZSjQ5H5ga80riDU0sDUzMzMxMLI3NDJXE
	eZt3tqQLCaQnlqRmp6YWpBbB9DFxcEo1MK07yKm1pOt5zcTCVcmlHxzSfu3RPB9cHPCWYW9s
	yLP0VS9CLpzLyHs5/bmzdkTAHakbYneOTrm5vvqDxgbl391sVjkna2OyJngs9uAomapUHW4w
	rbiK9dPpy76xtaoPjihnWDUzXKnkyDS6mxZ1fbGH3msnhdUnZSzeHZuSM8f66GP3T/Jp3Ct+
	XI2eELTj4c3O+P+WO1JnHriyp33KhX01DME2d10+7Xgz23VimoBFQdbBTz12Mxu0FWvLhZ4/
	tSiuP37p9QN1M1/nBVVJp+JKWreICv7S3x25oVj7qf3EvlrdysQ/h6S3h+1vNv39S+vBF29d
	vR7nbQJ3pU/deTbXerlQ0lFRY98je8/paSqxFGckGmoxFxUnAgB6Y1/B1QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHJMWRmVeSWpSXmKPExsWy7bCSnC73mYPpBv//SFg8mLeNzeLQ5q3s
	Fle+vmezOH9+A7vFpsfXWC0u75rDZjHj/D4mB3aPTas62Tzudx9n8ti8pN6jb8sqRo/Pm+QC
	WKO4bFJSczLLUov07RK4Mnp2X2Ar2MNRsXbPD+YGxhb2LkZODgkBE4mD934ydTFycQgJ7GaU
	uPxqGhtEQkri9v9ORghbWGLlv+fsEEWNTBL7T24D6uDgYBMwlmh7UAkSFxHYxyix+8BUsKnM
	AjISKy5tBWsWBqpZ0vQdLM4ioCqx+Nt0JhCbV8Ba4vusbqhl8hKrNxxgnsDIs4CRYRWjZGpB
	cW56brJhgWFearlecWJucWleul5yfu4mRnAQaWnsYHz3rUn/ECMTB+MhRgkOZiUR3lmxB9KF
	eFMSK6tSi/Lji0pzUosPMUpzsCiJ8640jEgXEkhPLEnNTk0tSC2CyTJxcEo1MPVe4/D7vfvV
	ty/+ZRw2kSFlqRmM8495uSq1zvbo8X3XWv1hkezNqwtWrjrOLqvOpOm4dfIBvzXqrC1y9Rv3
	CYS92rhcY0Wf2IxJySme3222tlcmnOkt/tebK7pF9amR4elKO2HxSZn/9RveXnfPi+GNV8rj
	6i5YyvuecbJjCfvynAXFt20XP7n4S+tVZJnPw+uJL1uzFENCtsssmenx9OCt+bsEf2c77nqQ
	VtC1tOe+ySXpxTGB//0ZHjbEtHtZO9y/XPr6osXPOxJiJjlN51tTYnfaSq73Pfk44f2KNw4W
	kZ7fUiIyU68rLyhYGTk31nHT5EQT7kWxy34krtWK1H6zKP6c8tV5ItZ+v5PUlFiKMxINtZiL
	ihMBp1UOxJECAAA=
X-CMS-MailID: 20250228144531epcas5p217fab73da682601a89e208fff5a3775e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250228144531epcas5p217fab73da682601a89e208fff5a3775e
References: <CGME20250228144531epcas5p217fab73da682601a89e208fff5a3775e@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_064540_441649_8C77D9AF 
X-CRM114-Status: GOOD (  17.20  )
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

Corrected a spelling mistake in the exynos_drm_fimd driver to improve code
readability. No functional changes were made.

Signed-off-by: Anindya Sundar Gayen <anindya.sg@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 1ad87584b1c2..c394cc702d7d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -731,7 +731,7 @@ static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
 	/*
 	 * Setting dma-burst to 16Word causes permanent tearing for very small
 	 * buffers, e.g. cursor buffer. Burst Mode switching which based on
-	 * plane size is not recommended as plane size varies alot towards the
+	 * plane size is not recommended as plane size varies a lot towards the
 	 * end of the screen and rapid movement causes unstable DMA, but it is
 	 * still better to change dma-burst than displaying garbage.
 	 */
-- 
2.17.1


