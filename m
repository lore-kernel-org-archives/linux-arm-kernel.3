Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F46BCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 08:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ryGCoaa5Mw0tnHL+6AJfKDs1HN3Csc9peumNiIny3k=; b=duZXpqoPd3lOpQCPgFu8u1PLfU
	ts7BVNpk4bLDvd/zO1JpgutkWzYe1UeNws79cBEmiZKcSh6ZHMvCqY6g4iGxlHOfXilgqgmlLWfuq
	2PGwiz5Ijn3CdizlCdFtABVbvxr6Slgy7FbQJcLnc1gCg0nY+YleL361xc8GUJf6ET4bOsZ9Nncnh
	jwpuhcQ+NmRRdAvlDCNOw+nEvPsnxY58Sq3J98ik1TQHa6ciE8rFWLe6PHyY+iiaGWPfRi+K1LI6g
	ewJ4lF2vxx2M3xopW+uKiXUv1kSZ6cnE8F2UwgGjQ4NcKxfPcLAoWdWzPBGlcAbaKr/REihHSed9k
	ds54Nd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqbV-00000005WvJ-03OX;
	Thu, 23 Oct 2025 08:23:25 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBqbR-00000005Wl2-1Vag
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 08:23:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1761207725;
	bh=/ryGCoaa5Mw0tnHL+6AJfKDs1HN3Csc9peumNiIny3k=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=l2TUuhMmJbcJDZfe+YXV3qhuj3YMlFIm9wf1gkEkNm+MXN+ItPw137za40aRFoDoP
	 5vG8sQD6fk4DGFhYOOsuA0WefhSY3EkvKLqcJKaHYjTdl9GwgQsBw2kPID/FcbV1Lr
	 R8d4qA6zoND/p4l83O66Pf2Pqiom4lvPM5/VuIqQ=
X-QQ-mid: esmtpsz17t1761207709t44688b9d
X-QQ-Originating-IP: x+i7FOkwA4c7J7VYbfCrjqnVkzs0wKgBvPuewy/Lez0=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 16:21:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7804790617074854445
EX-QQ-RecipientCnt: 6
From: Qiang Ma <maqianga@uniontech.com>
To: ardb@kernel.org,
	linux@armlinux.org.uk
Cc: linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH 2/2] efi/arm*: Remove the useless failure return message print
Date: Thu, 23 Oct 2025 16:21:29 +0800
Message-Id: <20251023082129.75612-2-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251023082129.75612-1-maqianga@uniontech.com>
References: <20251023082129.75612-1-maqianga@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MgRpQMLhR5LwNsRitc7y1SqH4bnZ3sJ504yZfnKpqJam2871zjeOMTrD
	7Br6iWKlNcaEraKyvyY8uYPq6KW605LVT72hrSTb2CgeuwFiW3mI6OaCeacx3fDLfBY5uzg
	qWzVynzPFdRt2zQorAmjMR4p8mZiK1lXZrkhDtI/TxCyq6KvqKrGAKvFXmQjMDc0Q77gMap
	pLQtwkppYGrn9xvnw6Fcpim+93vhTTML4Fb1WUSpQLu3EiaSgIVtBvq3opHejg+8WbPjHlr
	FYUgc1e86MFcKVjDsCRDlI97az6K8AcTmGPX5mIwmOlyMKtihDPgZUq377SePYoAvF0YHrF
	uCMWspyG4r5USmvfMSVot4UUGhca9bihFLffHNFFXpLT0lhWnMCCYs+INhWj8MY4Eq1W4aN
	PjMMzkqQ8KJZ67LGHkMPkN8X8ASPqUTNgWGCtNWKEI+2AfKcI/7TiGUYxfbOGCr5K8q4ORr
	j5bcWLb/Ca+yU91G0XRFkXjA22gKSxroem3gOTkJ3wxD35ZcH4SpZrXuJ31si50smWhjSTZ
	ppUZVign68nnNf9R8Np3XRX9tKtHMUSAXgIWSJTMr5n0/daG2IvtV2jGwM44EVRY+xa2zpy
	rNvC/CxKp8zvSjIY6L2+c0C3QV1ZQtjBVp5j86PUqXPJhOsABNh0Stbd8QgbJSQwRS5+ZDx
	QCCvYM53ZRINVtXhoFFo3xdVGMGt5dwjaFtD5hNf0dOU1K2A/c9rBbF8hSaNUSj5OgTUyp8
	KNKkfveap58uhZrApCNc0KxRP1fv34x6evKVuiZNBCHbcuWIQTTpTmg1hm+VJgk4MxK93vK
	vLQf7QWKFs7vdaTzJm7q0XJZPNqYdWXLZIx3KHSYm5nNrO1ZdhtC7s3QENAOVVnB2jkrZU8
	cfOtvyQII6FEl4l2cu6IuYYo9icT/aJXUP6HwoOGfUzzl/AfhsOtRPDA3Zpv6xPFuCafWMl
	Wuu9ls9FUXtdhUWCeWorqiJYzLl0pLvL72sgg/+0Mw1dszAKpgf9VkI4fl22aauxwdDMT1a
	QE40UH96RKD0BmjS5oMl7Eji72doK8x1M1pzRPVp2GPEW3wIPhjE80YOJ19DY=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_012321_853905_9AED05F3 
X-CRM114-Status: GOOD (  10.18  )
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

In the efi_create_mapping() in arch/arm*/kernel/efi.c,
the return value is always 0, and this debug message
is unnecessary. So, remove it.

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 drivers/firmware/efi/arm-runtime.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/firmware/efi/arm-runtime.c b/drivers/firmware/efi/arm-runtime.c
index 83092d93f36a..ca27fbfaff5c 100644
--- a/drivers/firmware/efi/arm-runtime.c
+++ b/drivers/firmware/efi/arm-runtime.c
@@ -66,12 +66,7 @@ static bool __init efi_virtmap_init(void)
 		if (md->virt_addr == U64_MAX)
 			return false;
 
-		ret = efi_create_mapping(&efi_mm, md);
-		if (ret) {
-			pr_warn("  EFI remap %pa: failed to create mapping (%d)\n",
-				&phys, ret);
-			return false;
-		}
+		efi_create_mapping(&efi_mm, md);
 	}
 
 	if (efi_memattr_apply_permissions(&efi_mm, efi_set_mapping_permissions))
-- 
2.20.1


