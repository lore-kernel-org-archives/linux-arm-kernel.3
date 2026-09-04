Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA096C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 12:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ye8hj6N2qvNGA2gMQYOs4PavKXmbhFPMCLKjkjvEeRo=; b=4Lkyp68+CSHHpiQGanzItu7kaC
	4eVLp254PuC/hKQbNA5P2veYxQghuKBZpo8G64RMC5T8O9ryRDqpzGA5kwdxSEyS/Raf8s82xWXeK
	I3GMZZnNbrw91Ue7aXPp5bMP87C+bHeYdiTLAPQRGQ2wCExi5UQjKrwPADlIwljJrOHZEX+Ju6jrS
	Jlv9yzRb2amvtBq+nReaz3085Ep1To8/Le0pYesm58ivZA5AHUHt4LRupyESt3W1FnuRVNq+/zyyC
	vqTy3vrCL0emt1L1A0KPv1sCsXUf8eNSqsfTPwzjPyjNzkVsHzcqzJWY/LB70JzXkHfl4HgSSD048
	Rx4tZDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2T99-0000000234N-1379;
	Fri, 04 Sep 2026 12:35:55 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2T96-0000000232x-432k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 12:35:54 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6b12d146e6fso459329eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 05:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525352; x=1789130152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ye8hj6N2qvNGA2gMQYOs4PavKXmbhFPMCLKjkjvEeRo=;
        b=fJEAGGkZhBC7hPrBzdU509tA1WreLPOu5Rz/qJBRA5KHOzwqcrSQ3MVhwsGdsCJyya
         UjqSYeA3IvSu7FIug2J1yt7GJJoiEC8uz3+gpikbtajEiQyamvEoUJFeHWWzSHo4gR00
         Jg35aq2QwXubd2Alz9J2/vCt2R9F08sKjCu8r7jmLTKO3AIh/EQx6k43ZvChYcDgjZks
         kzHIwfmv4o8ws5iktD4M+FNsChdiTRXEXunwTs807Jq1SUAEZZ+DW4lqUPR6EFryYGhP
         Z9OEQ9O/N7u+EOvG3ysb5tbgiftbZWdHEeL8SGyiXHMj2fOtQHdt5Yeip3NvXApjTh0i
         Dm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525352; x=1789130152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ye8hj6N2qvNGA2gMQYOs4PavKXmbhFPMCLKjkjvEeRo=;
        b=j9rjoR+lzbpwOvHOCVvY6dgkkEBOgwC+Kq+Io3np6uf0x1M1oCETrXDY0zGcwdHxni
         K4c9yJNvcmkcLC7ljEITBQVvX05Fl/e+Q/DwnHhKvuiTS/Eb6LeIBoDH4atfrP9Ohts2
         VcIpU6Bo2PnRnhch+roa8mW11dO2+C+OkBrQovNBFqObfIyyfuu6/foEPOTOYO9MSM1Z
         twQ3U6Epx0ORCQ26FYlXDgyEoK0aie/UbWobArpV6buJYohqKgZKnPRxOBdJooBA6Qqe
         xNzqpRd6pgz6lmTVh6jD+cTDpB7Tr0qUZCZwB6ziSMPaBe+Lg0xIE8WWre7oGhH95gZM
         eKnw==
X-Forwarded-Encrypted: i=1; AKwUvByH1q75KkNtyCFiWiOytFIVWV2Ie3LeJgubpolYKRnePM2gDCXxpxoRj2+/V8rg9ft+1oa3GR+YKygDQeFV/Nfw@lists.infradead.org
X-Gm-Message-State: AFuF++lglgLXWK+Hu6Kj0WFH1rfrn/ZKlvTGQgPcPebv2CTqsPxZIIhz
	IjLC26aWwwwekACE5R42srmdC5ukTUe/0zn30qnfQsanvy0qZjznOuU7
X-Gm-Gg: AYBFou3yHxxtrWKWIqiXpWAAGq3GakgvgABcYFxEXTG8/wLKWhuSpAKGSCOWiA9EDQr
	RO7Bwj32lJe0km51529jyZ8ea7d9zjOFnCmDy1SKdj76ktZHrfPosSk0QXM9gY/DwD9JZpEJZ05
	jaXeZoch+wHG3asDkSZI4ZgWgUvHzOf6C/ajTbD+NvucO2NChTuaEwNBGlQ6H85VCdoFesYOzQB
	oKJdViWZ7eZSXCFKoGvMyhWn/zFBwQitayLwSuH1DpL9XYrcgGH9HBpPa4oYWQ7VtWTHiQJapu6
	rswxGGzM9ppl1qWeUiF40lHATkBp6x5NS75qihrQ1iCdrCCkKkx4HUDP5Ae2rsJaHGQrKOKlcH8
	mAWfsevyfRhkieO5A4aFRe8HwaD4pcunSCADbF3rATKCjNXLJc7PvT3Fbp0doQElDS+twb7vbYG
	o+v02Iek65yh9V9AcmXoHsjA2a7pU2qqj1zl+zMqy07dk2nuis079x0r5ZpbR/S0w4lMRi4oki5
	8M//GlqOMLomYA=
X-Received: by 2002:a05:6820:f00b:b0:6aa:f585:aabb with SMTP id 006d021491bc7-6b6fa7e38a4mr3826883eaf.1.1788525351811;
        Fri, 04 Sep 2026 05:35:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm6229374c88.1.2026.09.04.05.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:35:51 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 2/2] perf: fix typo "binded" in comment
Date: Fri,  4 Sep 2026 18:05:39 +0530
Message-ID: <20260904123541.38602-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904123541.38602-1-hemanth.selam@gmail.com>
References: <20260904123541.38602-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_053553_008599_DDC56293 
X-CRM114-Status: GOOD (  12.60  )
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

Correct "binded" to "bound", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/perf/dwc_pcie_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 6b9ed59de26e..e2435ccc04ca 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -639,7 +639,7 @@ static void dwc_pcie_pmu_remove_cpuhp_instance(void *hotplug_node)
 }
 
 /*
- * Find the binded DES capability device info of a PCI device.
+ * Find the bound DES capability device info of a PCI device.
  * @pdev: The PCI device.
  */
 static struct dwc_pcie_dev_info *dwc_pcie_find_dev_info(struct pci_dev *pdev)
-- 
2.48.1


