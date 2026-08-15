Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF74C5DF6A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 18:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hn1w8vtbj9zAmfIr6OtJvXMx3Rjgqtv0x/ZQ8XLdFkg=; b=b0EEFngUx20KKcDzVQBYPOLS1p
	VUN56n581Ai+QuIJoIXaOR/YtwdnpIeZhcAg1YvwiHWr67LorLZejKDHuqmwn1wV86o7z1Snsl8ET
	qoRWcpAgjmUOq6l39cA2JiaQ1DCZLSlg2IiQOaYoypouVz4Lr26P9FN/Yf2xWrKcQHUh4XJDSV95/
	ETbGftBuLz6Dz2kyOfzA5IaQGpzG+zfIP6nXTa/rMBaRhYg2/eeSdP6lNRENnOI2aoYgOo2cntPw9
	HwrMfAdZS7fG/ghHYJJG5YmD8J3E5Mz4olDxaFCnk67ZhJEoREPR5LCe8J/lHVtP1V9F4xoatUSdK
	0of49mxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIsi-000000041aG-2A3Q;
	Sat, 15 Aug 2026 18:13:20 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvIsf-000000041ZN-3uqt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 18:13:19 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso2072243a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 11:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786817597; x=1787422397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hn1w8vtbj9zAmfIr6OtJvXMx3Rjgqtv0x/ZQ8XLdFkg=;
        b=o6pwdWWbPOrsAuy7rOYq2D4VljLkUHikD87eKA9DrCQ9e0lPH12SiiWPXWAY5yLo0O
         LJm0RIz+PUrvD7FzQ9hsn8Mby9AbwaO3r5sfnI8H8Y9XSG2lR3VM5YztZVu2/M1ghuQ9
         txtTRhVsNRUYNgUI2dcTqM/+srnXnR2Vuf3ND/mAriKnAKurMKJ7JPgERj+8cZxClabt
         TAMPhmI/T91y40MrQFiPqv/mlTB3Zew3SEq41b48E0moc58Kxo+q3dkzxayBktarBobH
         ETp7kyBor9pvNYYNXep56PPehaYROgA1VJ8sZ8KV38wjie58veTandheOGgRFuKGuht6
         9d6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786817597; x=1787422397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hn1w8vtbj9zAmfIr6OtJvXMx3Rjgqtv0x/ZQ8XLdFkg=;
        b=k6do3HVuZtj+m0XmQoTB7tdgwLNN+PWYBWGijYZlfAyUKdlE0cF7DXqkyGcTcsaPzQ
         ykzBm3DCWEkdOEM8f1nZxY3Tm/nv4QKdtRjFl5t19bcbdnUa0SazPJeVOOiJuxOMYFxf
         OOEzebM1NrPwo7JWzyV0iclmfVZ6viO+mlnD+S+TyBoKgEDV2tSMeYF8T9uVGNfpXChU
         B2UfmpcZNiKL8LQa5mzs1yUw+2659njAeMVlxKdHQC6wWm5rwSM1TuHZWt1NxJSzzueP
         ZIYNH8y2oMIGfCV8f/s4jIVFfT0YswISancWEC7vHw6VPCTBLXB81ToQ6wj5cpG3dooM
         e6pw==
X-Forwarded-Encrypted: i=1; AHgh+RqJJKqhD118Vy0WRo/vZUjuviQJDsNG0m/aJc3QnR0qsPgKbCgeEGB8t2Hp57Of+kPsxNOz1fk8yTM9+liGrvtX@lists.infradead.org
X-Gm-Message-State: AOJu0YzSbSsi85fFywyYcZIZu95RYGyjfAZQLhsh6A0pnGbudEYbnx3C
	xJKOZO6Xl9o/dXhinDHrTzOg2OjO3exsijxIuKL8+TfP+Kll920SuEB1
X-Gm-Gg: AR+sD10R1xumXeOemfEdF3He4Z8p0rr9GVIm5ov/ROog7D12+BzMaUqHNPHcMgBK9EW
	LxRQRakH+Q/HRiavyAfOL5z44hfU3gBfwbzIrxvjCJMLyRjRU4bEFvPNPUvBEqHYH+BOSnuJ63E
	28WYdMnosF9kjr/4ZEKYrR/R3zh5ZYRKr5KaJkdune3Ph/yYGjzH4aGbgA+/x46Fgss0hUKN5mZ
	BoS3lfW/WmHuUSYtCzO/BI4hAfrRO3xYPfahL9/i8qSc86E3gjGRYpmf1dL4uu94opqKepD01oD
	1LBDyUcUGW3BDh80DyNOLOAkmI9LHVqfWLSsSyNHbJ9aK8rF2v68BfZ5Z0A4sxVHvYW+SYvlwjV
	UxuzfZawDP1emCv8nxG5VfwUjuCERCEEkGBI4Kt0/YzsqwV9e9JhNkSn2Zj4wXtesLsfjcwYSKm
	RuhpKL922swTFFFwckIi3HPg9Wt4QAgrNpdiuO8SW45oSm4T57v+MzyeUEj5/xJqjgF2cpVrmF2
	NprXJ1n1vJ7ge+CR1Rbm8oTE+k=
X-Received: by 2002:a17:90b:37c3:b0:390:84db:888e with SMTP id 98e67ed59e1d1-3933afb4ba2mr11589304a91.7.1786817596734;
        Sat, 15 Aug 2026 11:13:16 -0700 (PDT)
Received: from localhost.localdomain ([240a:4280:4800:6ace:25e8:2607:e94d:caaf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb7539d3sm7304254a91.15.2026.08.15.11.13.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 15 Aug 2026 11:13:16 -0700 (PDT)
From: Liu Zhenlong <dragonliu2018@gmail.com>
To: andi.shyti@kernel.org,
	chris.packham@alliedtelesis.co.nz,
	jochen@scram.de,
	maddy@linux.ibm.com,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com
Cc: mpe@ellerman.id.uk,
	npiggin@gmail.com,
	chleroy@kernel.org,
	grant.likely@secretlab.ca,
	neelegup@linux.vnet.ibm.com,
	benh@kernel.crashing.org,
	wsa@kernel.org,
	stigge@antcom.de,
	linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liu Zhenlong <dragonliu2018@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/5] i2c: ibm_iic: fix device_node refcount leak in iic_probe()/iic_remove()
Date: Sun, 16 Aug 2026 02:12:02 +0800
Message-ID: <20260815181204.2321-4-dragonliu2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815181204.2321-1-dragonliu2018@gmail.com>
References: <20260815181204.2321-1-dragonliu2018@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_111317_975141_87233DA0 
X-CRM114-Status: GOOD (  13.38  )
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

iic_probe() calls of_node_get() to take an extra reference on the
platform device's of_node when assigning it to the adapter device, but
neither the probe error path nor iic_remove() drops it.

device_release() does not call of_node_put() and i2c_adapter_dev_release()
only completes a struct, so the extra reference is never released, leaking
the device_node on every probe failure and every adapter removal.

Add the matching of_node_put() to the probe error cleanup (error_cleanup,
which covers the i2c_add_adapter() failure path; the earlier error paths
jump to the same label before of_node_get() runs, but dev is kzalloc'ed
so dev->adap.dev.of_node is NULL and of_node_put() is a no-op there) and
to iic_remove().

In iic_remove(), i2c_del_adapter() clears adap->dev with memset() at the
end (commit bd4bc3dbded9 ("i2c: Clear i2c_adapter.dev on adapter
removal")), which zeroes adap->dev.of_node before of_node_put() runs.
Cache the pointer before calling i2c_del_adapter(), the same approach
used in i2c-mux (i2c_mux_del_adapters) and mtd (commit 56570bdad5e3
("mtd: core: Fix refcount error in del_mtd_device()")).

Compile-tested with gcc-powerpc-linux-gnu on ppc44x defconfig; no
hardware available for runtime testing.

Fixes: 9fd049927ccb ("of/i2c: Generalize OF support")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Liu Zhenlong <dragonliu2018@gmail.com>
---
 drivers/i2c/busses/i2c-ibm_iic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-ibm_iic.c b/drivers/i2c/busses/i2c-ibm_iic.c
index 7c70e8bda24e..5c3b973c40d9 100644
--- a/drivers/i2c/busses/i2c-ibm_iic.c
+++ b/drivers/i2c/busses/i2c-ibm_iic.c
@@ -751,6 +751,8 @@ static int iic_probe(struct platform_device *ofdev)
 		free_irq(dev->irq, dev);
 	}
 
+	of_node_put(dev->adap.dev.of_node);
+
 	if (dev->vaddr)
 		iounmap(dev->vaddr);
 
@@ -764,8 +766,10 @@ static int iic_probe(struct platform_device *ofdev)
 static void iic_remove(struct platform_device *ofdev)
 {
 	struct ibm_iic_private *dev = platform_get_drvdata(ofdev);
+	struct device_node *node = dev->adap.dev.of_node;
 
 	i2c_del_adapter(&dev->adap);
+	of_node_put(node);
 
 	if (dev->irq) {
 		iic_interrupt_mode(dev, 0);
-- 
2.55.0


