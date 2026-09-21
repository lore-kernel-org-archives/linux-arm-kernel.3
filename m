Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20CAC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=; b=nepRGZKAB8PeZOIulaFMzEUWy2
	7XFpxXd8BulqIXvs03lguhFkdMbHRd0RrE+osxY8KABy08PTLZj5apPn98MXXxD+TfUz7umZVI2UX
	zfw1WzmtoVq3tf9p7KIskQXN0Sb4UPzHrzGZhXNeULemHKFE5PmuD+M9uaP04Zr6SLReLBfaueULd
	lMeuDDZcFHdTpB187LDCGxyqgL1O0aDM+fst6MsPHkIG9jp0dd8R5b35A4W5h8ZZvzm+cEjTlAAGO
	tQCsHxD8AidFeOogmy1gyJYCWfp1p6sT3pMN+op/bXuz0hE2WCsWogYyB4bykm2Wg0cD2D2/DEqV6
	cw2DN+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ijD-0000000379l-2QbT;
	Mon, 21 Sep 2026 18:26:59 +0000
Received: from mail-wr2-f12.google.com ([74.125.225.76])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8iix-0000000372V-0sei
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:26:44 +0000
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so1124015f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790015201; x=1790620001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=;
        b=idAssEw4gEeRgHYflrh3Jp2pKDxImP0YoUU1FlDOybpEA0RxPvqYIij6NFhOiu2PCC
         OZe1pPE6TKN4Pc4Tfe/yZZKurMrIwYYaaVc7U9ZsfNLzLJ0+g06hIG+UKN3fcK4RuVb1
         CP4QdMDvxZxKzEVFMPyzqXA2yJYbM2Nd7KukYvDXqXy2CIcX0CMavFzmZGO9fIwZ/k4Y
         Fy1SyckOWnTvYsPNJ7MYSRA6q/vK09hIt0PKWTLRkWn6gs/M7CD3rBvNK6Z5ZVhCtkyE
         WWUa23mYFAyMz2LSXkTvUNs0SCVLvShV7gnVXwZumVXV6Cpku+3G+XdNLir93dLJcyhm
         XFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015201; x=1790620001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RfbhD5QaD4wJNjO8bt14TtWKzvgd7QRbHTerWPS0g/w=;
        b=LsBlXJ0FKX19A6Rv+0TiacbqpJRwdFdH63mjyX1g7mGQRJT4kS+tcMolbrJhNlSD+a
         LEA6P2mnSBvPaomKV/dXklzR28AZ2ojQGYiseP5jkMtp3J6+Rof25XejsfPgOAF4w1ZQ
         XAwdoqoUH/jIpWmeZziyr+DNyn+jlhZo7Ady+RVdGG/tFdgH6SkpkNibGF82RW6LgIIa
         eXLWiSJnS3GBN/H3UPnOHJhbP75y89AZLqNB7AkzJIQOEH2aTRyS2rwdHalveskVVMf9
         PxhVd8V3N6JuS1uWHXerrVxo0lrY0r6EGADJxPe6OF4K1mEiELeb4tqApCVi2nE8QF/1
         t4hw==
X-Gm-Message-State: AFuF++nNJJK8tiq+u92TMHOFGEqx1mhBZuQ3Qg3I41GKyr6L+b7bNce0
	5Gz8EYRv/ShBf6FiZfjCTBJ6Kx4WdnL4mU0BcsoOnBcMoL5PbqyxyMAJPQsXh8QhoXlct1HsGSa
	wQCTeCZY=
X-Gm-Gg: AYBFou1FFVqNl2JzxHcuZwlC0kchBBc4BiuZcKrqww4SL20c8fq4FNSgVt4Y+AsDysq
	YsZR7G/+IK990h1adRxiFGQFasEDhajaWewPyT2cduBdina/uC/re7QBsUqWRG6/CVd4UDDhCU/
	oZXutdtSeQzWvlODczEZUtbrn+zwvk35sb9+h52zV5iGupeaGKMRtbjrFTZOxDHmPKY4K4lwkIT
	JU1xchwJsVw34n0W/iNqJ9rVHarcv+v+qzvQVZcMwA2wRCQkbyfwa1703G0p5FM3ZR0uGs9vR6e
	llnp2XtEDZDjAa+P5sdd1smhtBUcqAc7S0Eoz7kd0YzmYSaip6vxL/v3AToLpb+v9N/9d90TCTQ
	12O9B9NqWuWMbj4TYS76f9CfFKowrn4jL6p0EVB4o3PBTbDOpsJzp7J5dvyJTCmsbeoHx5zaJrA
	6TJpQAcYwu0/h+GF9PKvnXTR/iU+vSJ8hZl3CWfDbYP76/pwzQjLVylsiEekqPZQDhAUvqNLiZ2
	chWXZiHifMt7r5lGLWlbQiUIxpaVJbR3dBc
X-Received: by 2002:a05:6000:985:b0:486:f3ae:7d93 with SMTP id ffacd0b85a97d-4886100499cmr799279f8f.12.1790015200880;
        Mon, 21 Sep 2026 11:26:40 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872446067asm25126184f8f.12.2026.09.21.11.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:26:40 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v3 2/6] dt-bindings: arm: sunplus: add Tibbo LTPP3G2 board compatible string
Date: Mon, 21 Sep 2026 20:26:16 +0200
Message-ID: <20260921182620.17597-3-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921182620.17597-1-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_112643_253512_905A0C6F 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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

Add tibbo,ltpp3g2 to the list of compatible boards for the Sunplus
SP7021 SoC binding.

Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
index def7d0cfeb31..8ec006576f74 100644
--- a/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
+++ b/Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
@@ -9,6 +9,7 @@ title: Sunplus SP7021 Boards
 
 maintainers:
   - qinjian <qinjian@cqplus1.com>
+  - Andrew Gaylard <ag@ffroot.co.za>
 
 description: |
   ARM platforms using Sunplus SP7021, an ARM Cortex A7 (4-cores) based SoC.
@@ -22,6 +23,7 @@ properties:
       - enum:
           - sunplus,sp7021-achip
           - sunplus,sp7021-demo-v3
+          - tibbo,ltpp3g2
       - const: sunplus,sp7021
 
 additionalProperties: true
-- 
2.53.0


