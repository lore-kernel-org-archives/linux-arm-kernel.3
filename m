Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D74606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q4tYgTA6;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KpNTf234
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=; b=q4tYgTA6e6nAxc
	Q3TNlFAJnpUE7ckforNypd77fD5xEw8lUQeFZajXrcsN9t7xFSjvWDC1G9K1LsOAAdUTWhK1vA8yx
	VxqJVMBK6mZOtM17CElap8WQEGcGW4fbTykrwK7KhDEZNF9dmPlqYm2LxnhgwN6/TCTO2Tk2YYN4a
	1Opui9FD8X+PsViBDIv17YF/WLIisXA/oS6tMiXI3elmNkSinGtrfWBDSu4ZOwbqvio1s/SA65FoX
	hRNvSfcpptYfKTQgku2aO4zten+5FEQBfS8+B7f+sHHa6ijuCXqsh4PUYn5Q5/rqCL6mWZnKDy5Ge
	pdu5HdJ+FMewPYFQlmBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQDC-000000039ak-234i;
	Mon, 26 Oct 2026 19:18:26 +0000
Received: from mail-qk1-x761.google.com ([2607:f8b0:4864:20::761])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQD5-000000039Uc-2YmH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:18:21 +0000
Received: by mail-qk1-x761.google.com with SMTP id af79cd13be357-93f22a8515eso309327185a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042297; x=1793647097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=uXfMdIMoW7JF6HmBlBfcYImMRn/SuOK34x2+ANO9sMhtJsQQujPk2R7QIu2j8Y3M4P
         2s6ieTkhiZdHiJzy+NlLL454vvsq0t3c52EyDKCIvzb9erYuyqiRzc8XcMeTTdBScb/M
         to86hK90n1e1NRrdf61ZR1Wt3LZMhsLfuLulIDnsgz7I8oXWsczeFnGgQf8uczvQscyp
         9ZDBa08zgyYbgex4t3C5T0hHVcWXm2gYp5Fq2jyX0Zm3ic0GtaMaVIgBPvlpPyLCnvkl
         yXy5LzY3okCJ37BI7UJpezRLtzXJxlXwrTTxdUjuS8pzdHhcoYtLjpXZfmIqbek18Ej7
         dwqA==
X-Forwarded-Encrypted: i=1; AKwUvByS67vIEQ2HOZk3Pnd/hBRdEKar22aJactwmLdFLnUIhR49lyTneyv6Y+TzTo3rwUJ116tZJjivLQbJyrYMTxGJ@lists.infradead.org
X-Gm-Message-State: AFq9FYKTfCqAZw1ZCSrbd/9P4+6pWHnV7AHdIv9LNOJzXLo9hl5+k8nY
	WhKBYKKxrcINm+8qSJy7+zF2ZkCn1b9UwXk+I0wMfPvipUsD0HTe2yzxhr64XXYwXR/6/VtwaTC
	3sD7/W0rZLdebizOqwKiMDt/KL77v+EpeswcR/yyBC4aIHfKK1nqFnZhSNzM8GTnktEq0S104th
	v0BnKhLed4AP92EAH2o6jY4kdVNNFSL/E5LBWGRJugrgONmsrMh2GaqPVAX/t4HbAZxYvHQZQFq
	RT1Kun0WPLBT31lYoSiDNNuGDei5mP358bgLg==
X-Gm-Gg: AYBFou0fZev/r6icuBvTNXhzVAr11WngEhS1gWYPizZWy68sJ5LWA2j43UzBmG7FS3x
	W/pR+pL9JjPQUqbYqiC//ecMtRR+7kapjpg0TfWAtejjbMtC6dEnn4j24xzh5VNgP9P4ngol0VU
	MfpXFkRphMRkevhYqyUcg7vmvh2e6BrFffjRWh4zGLapsrKf7dk4/P9OBPNrbxca1Vsf1YrrWn7
	i4wnwPCtvpTJNodKURrvbMjnXN4WW5AGzrxQMpzQhgCmctcTB4SlCgpmBRiyu4J+X5XBTz62Zn+
	KpuVOdH9MsawEvmavOdNK77PuvkLCI2QM/gvNZrB5uP/aUBL0v2+4bjN4kgQ1r4CXZbOCJqCNNV
	kVonfYSACj9MJhA+LKT/U1+e+Po7BHVCs23E6ZZUh+F9r3lDP0Oj+9n1GHsIUY4RjnWRBvnexLm
	lfLFusf2ljtJRQTaduUnppnEVzMba0fs2wsETp2X09
X-Received: by 2002:a05:620a:1b95:b0:93f:2aa8:c555 with SMTP id af79cd13be357-940ef928ee3mr1158817085a.57.1793042296855;
        Mon, 26 Oct 2026 12:18:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-91c47c0b4a5sm706276d6.25.2026.10.26.12.18.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso806305085a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042296; x=1793647096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=KpNTf234Hsg5DZuQCIXczz5nrAHgNizBC2tUcxB++ma7MdgG333+klv2GqFGSVKzrF
         QBXzgPJP7VLrPML+NelpluIZTc4bnOJQWi31ULJm36yVTiQELTA2KLuIn4i5hjH4wCQs
         A1kR1xj08PtDNKiUvrtnHih+g7RElAyBccvtE=
X-Forwarded-Encrypted: i=1; AKwUvBzPh5ybFRRT00qjkRl9gS2pRcIC1f7bQc3AJUhUNqBXWS7uOV9sEm1jwZFv8kh/E6ILZoVBVSxsJ1Ddmc8KV8p+@lists.infradead.org
X-Received: by 2002:a05:620a:4487:b0:93c:29b3:3525 with SMTP id af79cd13be357-940ef8e9ad7mr1116012085a.36.1793042295637;
        Mon, 26 Oct 2026 12:18:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4487:b0:93c:29b3:3525 with SMTP id af79cd13be357-940ef8e9ad7mr1116005885a.36.1793042295194;
        Mon, 26 Oct 2026 12:18:15 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:14 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v3 5/6] ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
Date: Mon, 26 Oct 2026 12:16:17 -0700
Message-ID: <20261026191618.3178830-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121819_683708_3733ADD9 
X-CRM114-Status: GOOD (  12.73  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AHCI controller on BCM958625HR fails with the dma-coherent property
inherited from bcm-nsp.dtsi. Soft reset times out waiting for the first
FIS command, subsequent engine resets fail, and the disk is not detected.

AHCI allocates its command tables and received-FIS buffers with the DMA
API. Declaring the controller coherent bypasses the cache handling that
these buffers require on this board. Removing the property restores
hard disk detection and operation, as confirmed with a diagnostic DTB
that changed only this property.

Use noncoherent DMA for SATA on BCM958625HR, matching the downstream SDK.

Fixes: 56e2ff0346a3 ("ARM: dts: NSP: Add dma-coherent to relevant DT entries")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index a9b6aa04d573..53acae385822 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -182,6 +182,10 @@ partition@700000 {
 	};
 };
 
+&sata {
+	/delete-property/ dma-coherent;
+};
+
 &sata_phy0 {
 	status = "okay";
 };
-- 
2.53.0


