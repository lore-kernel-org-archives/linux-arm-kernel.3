Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95179F46111
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDljdw5WjH7cE6e1zkkdtoj0KrIOCGPQnFgDwGkvqO8=; b=1zSBpB+2+o9Qpivbp6YHB6wt5n
	ysB5advEQ4mf5lsCEHJVMU5CS5S9UJ9HgXkcsp0IPAuF25ourYOFoM/AWr9LxIq8kx/2zeyHu4Mht
	q1DSj9bCVqXnQYHDFndV4WwROEih3woKKxzWiB7dZ90efqOm8AvxpI+7rgv7OgQaWUNomqyfW8w0x
	UGiaBNgXiTS9axAXoMUJIcICn4C3aUBq+Qqm6W6Ahe2NS8YprRJNfdsbAdm/Th1HbUtIk4baY06Oq
	iwXMHjOA1ZuZ39qSxbxLt8AWoxSGF5YC0ULqFzWEpkjRFevRx6VVlqxO07uF1T/EdXID1Q5pOJOkE
	zMmACu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fUc-0000000GqWJ-498X;
	Mon, 23 Mar 2026 13:38:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fUc-0000000GqVi-22iX
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 13:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rDljdw5WjH7cE6e1zkkdtoj0KrIOCGPQnFgDwGkvqO8=; b=FWlA/FiCUL7HrhZeWvCokX1UfW
	q4J7hHC/4mM/UjAX2bsQI4LseyBBleyrFrhcMZPno5j7/1e2c+t6Ex/asT/TJO0/mHlHed2h5KxRd
	9L0+JSkx3I8Klimj4ez0J0TWJlETsqHI0NB4I/GNMXdHDV5xhpTkVGZZcZvRLrYdonRsYhVFoiASB
	KDtvoO1+hsa7VpKzDt5RxnZ0Ujo7fpGQaEiwlocFlhsq4yhN5tUhAWYdliMKyTx12VEBwj2v4Cenq
	wRC5uev7d94Cm4BcclSKMgdAU3HeEkYp45AWTZFTSNcbBw56mr39LRMqh9O+rF286GwmtuAHU8Ink
	90JOh1Rg==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fUY-00000001cuC-0hzv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:38:53 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-829781b2b01so130621b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273128; x=1774877928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDljdw5WjH7cE6e1zkkdtoj0KrIOCGPQnFgDwGkvqO8=;
        b=YnLYj0DpnkZML4PDuLKv+V/8MsgxDfuCSvoWWTOrx//vA60bfa2BOL+05INcgDqqva
         TkB3TstjEzUfbek5i/psx6vYNqWI/yT2Xoq2gVgClZeCEISJuBwenKbINlxBnxIJGMBQ
         K4HTWjNNr4aMhXxcY6c9uZ5IgSnhQPKG7uQEW/s3NMCPI1RRp3IuJAwR1beO4HIqrsXs
         yZfhhibz2z/fzErijL9tDxWQeCRGY5Iq5joPd4iBF3nwW77FPCKumlMM3r1TUjQnlL1K
         vfxNDqNuG8fiUrCY6DdNCFnHoVqK4k4ba9quby6nWkcE8fXtgDgYsc7v0VTcsqXdx8AD
         chQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273128; x=1774877928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rDljdw5WjH7cE6e1zkkdtoj0KrIOCGPQnFgDwGkvqO8=;
        b=NY5NxXWCDawqdRRmk0OGI6rqzToPYJBU+keifQZX1fsI0Kyyvrq2xEHI3zNH+jqBet
         PMNiDw9fz7+neUcYkGPz88ZvgYHWh7Lu/Q9JSALKpr6tdin+ViXScXlzWLghCOgQz+aI
         Lze0ecnXKJKWqJDSCFYiSWdEF6/y7rtTU+MytdB6SJtN9fEwIlEKJsB+7LSbM+6liWRD
         XoKlS5sB8gnNwW1Jr3sOA+fG3PX4kheGD9xqIJX3BiE8tn9WQxoIj6GybECdNCt/Xi6E
         p9l+nkjq9KJefFo+ln94rKhj1PgrwYtAsY9bXFWjWiSXhMrlsKxzh6iuQXwcVYgJ3U6P
         ZlUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAbPRCgE/yYkWSNUsc7bojTbxv1gAumAl7QJ2Mp9JE3jvgaYWTJLthG0mqA98BImwzvlktjE/Q29V8JhAXP1Mo@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ589FFaLffXxNxTwIwvTxQF0zK4KcjCv2qnQkRIozyN5YYfZZ
	mcaoLMGF6vgETiNS4ccmDYerKXZnrHunNst/7GLR6gwK0cEqlTRlMNSSmB8OVLti8I4=
X-Gm-Gg: ATEYQzz5Vg49h1MB5rFvUR5kGbJmYvAsH9BX3JBTcmfBR/UtGKZKqwwR8YS/D3CEnPI
	7qXOD7cdFlgDK3nbNMQRetHPYnU0Bno8/PcQa/VUvQb47JwVnWrEOAJbU9hRHeVuSev+bVRzSXg
	Kb5R5gyeTdyovqemXo0Gp72xGUDTuQ4XtEirZB/6OO7XHTJNkdrPnhkHIJMghj4r95LTuI+oEX1
	+d+AxG7hw3RJNU8grefM8SUO22tgXH0Q8LNi0qQiOnpVOiVJDh/fDTDMJyedLdtrEeSf3it0uvK
	xZk4wkjKwyCK8e7LXyYDxKIp/bRYfC2VYOQ4i0BCmu6TNeDG4yLdnoQn/HcecVxbxRJVE0Keo/R
	8OfrTLqy2YLZ7wzKKJSi9WDG6XEpt988WoKf1dJlKy2c1OtPibCiL7SqW0bfQPJrcjER3eBdv3u
	YLu+lH6LlrfBBQLfPiC7sSpaf0g+ygLJ3GUMmvyDffkhXrgXxnU6NiNMa/IlxRcn+TB+rCQoYhh
	DU=
X-Received: by 2002:a05:6a00:14c1:b0:824:9ffc:256c with SMTP id d2e1a72fcca58-82a8c392254mr10063609b3a.43.1774273128123;
        Mon, 23 Mar 2026 06:38:48 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410b1bdsm12069224b3a.57.2026.03.23.06.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:38:47 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH 2/2] ARM: dts: st: spear: fix dtbs warning on spear thermal sensor
Date: Mon, 23 Mar 2026 19:08:09 +0530
Message-ID: <20260323133814.14152-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260323133814.14152-1-krishnagopi487@gmail.com>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_133850_425681_8E5B5EF2 
X-CRM114-Status: GOOD (  12.32  )
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

Running DTBS checks on st/spear1340-evb.dtb results in the following
warning:

thermal@e07008c4 (st,thermal-spear1340): Unevaluated properties are not allowed ('thermal_flags' was unexpected)
  from schema $id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml

Rename thermal_flags to st,thermal-flags to fix the warning.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 arch/arm/boot/dts/st/spear13xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/spear13xx.dtsi b/arch/arm/boot/dts/st/spear13xx.dtsi
index 159e941708ca..97357680dd51 100644
--- a/arch/arm/boot/dts/st/spear13xx.dtsi
+++ b/arch/arm/boot/dts/st/spear13xx.dtsi
@@ -332,7 +332,7 @@ wdt@ec800620 {
 			thermal@e07008c4 {
 				compatible = "st,thermal-spear1340";
 				reg = <0xe07008c4 0x4>;
-				thermal_flags = <0x7000>;
+				st,thermal-flags = <0x7000>;
 			};
 		};
 	};
-- 
2.52.0


