Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0DFC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 20:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a73flGMOwQ2zw+tC92cS5o7YqiRzKglgGjirm26OwL8=; b=QMVamri3ErcjOL
	Q6I8v0cjn924c4SnqdNkHTOnqE3PBJLWnuukFA/D3XRAKF93RgXE6o+AAgIzGa22O+PlrzdfsrLGM
	V8u66pn/hJmstTAm4WvojYAraGv+yevI9b0e5W7sBIgnxHq7ho8arwPPXOJragG0BLqJiBb06AAgy
	zqs4zM4TzGF3Tynw7yS3i/x8AS9B4BfQsY4YSFHSilA8qRgxgWv6v+bMq3J/bHUdNN/01phbIS699
	pqcHR5d/m9WFQhXJJRotsJqI9Q/FZkqlN9UFC6tB44InhHGgA1Nc02VBifLP/ZQI0ebU4fvf3k2XG
	aJqPqMVDPDUMlGZ+zxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4lll-0000000FN6z-2qVP;
	Thu, 10 Sep 2026 20:53:17 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4lli-0000000FN6K-3V29
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 20:53:16 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-8523cc41f38so20244b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 13:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789073593; x=1789678393; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a73flGMOwQ2zw+tC92cS5o7YqiRzKglgGjirm26OwL8=;
        b=Yk9M9wFc2rLdf+be0+9u3pTCyzH+xAADskyNJ9HZbC/ci3oRqZsi5grBLXkEPqjR+l
         GjzbHOXdk80i2Luf6kwBmEOtTwvJAuyqfMjvhYm6jt0gpUVzx3omsaAFVRgH77zy+iFI
         Zw1xOvuA1u2c6IbAnnuGi79wJcC9gVBd3kmx2hofdQIHDUiJoHXozUP3i2GpZc3n15qV
         ZJI0hYHTXlOU6HoO3hlfFPz6eJeniR3b/MzniCXgzW0kFftFTz5R0U0ZHM7jYO14CKo6
         oofhgAeS8sG0vg23oam+a6xjoAaUPCNXHo/M3DmKlVFKj5VDm6h0bMFdsqVZHo9xwgmN
         UBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073593; x=1789678393;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a73flGMOwQ2zw+tC92cS5o7YqiRzKglgGjirm26OwL8=;
        b=KImgJDY9OjLQeeY1aQtsCyVwuZJNJJFPgwI/F9kyyFSZSidtRA6bg84KOPQTGca1yE
         buETop8k2qvYC+YG09c5jMwfsccCL4rYCVodgieq72ayLl6al5mYZVFiILhcSEfX4Eq1
         7zN2wW/pxsgFCXaZaIsVGUCoeWyaXkWYJEqUTQqIEsb7OgrnLOURuSaM57lix6FSJzEj
         GCsfg3AziVhKaY5CYFmWj0cDwQKT91EJ6rxzZU0RI/iWCeR2iwKf78M3r8atgihzB+Pr
         jHhRt8LPQMmH5xQjZduiA2s1iIOXoP8qDTg89D0FPHdk1P2zSlfyZxOP+3l5VJbp1lTM
         iP0g==
X-Gm-Message-State: AFuF++m9JkZzAe+n06gXBpspWT4QEZz8g03qHQITuvwpUH4salL7vQRs
	UTj76kQJGCokN+LHDMNsiQw28/s1fjVb9tKhHQAyWDaK9oWqFYYO7LINX70wMg==
X-Gm-Gg: AYBFou06LInGmIeBo7ewO+CcqVlAYiCxZc9Nx6yQhTP6TCwgq3HQVMn62PC5nTD+qHp
	J9UdR2+bAat7JphwPI3kRgKbni9+8EUq/9wsq4PH6DvtqOJwPtAZl7K1tZvltQwjqpbOCI3U1+Y
	yehC2um/ldmlzWdUDJP4jo1O9EEVOUnWpGH5Zg/XyHF4NDvYq7pXZJDC5M2u+eWU7b/0k2GsLa/
	vQxIbvSpRVjDX7N7haBx8zZkVYVSpdl1x32OrkWYWSPlNff0vhGzQ3YpYkD5sQRRpbY//A3Djdm
	N8FruYvSCz/BoOUjUNZY6lVq1ZrvyWpRAZK4ROQPFZl3gv15uMUQouLt3XLElxGb+dqzcG3qYEi
	32V/2xB23FOwBKrVhJfImMEWXjpw1bhy+csF2gwjLRlPhmb3W3LJceWXjAjKhSGETE5hkAkVCOe
	rHI+QXDmkuTS5POMEnssT9HhFiuSkVxY7PJxO6iABiNhcUky3cXwDXBDm3UZqhnPKZ1ejKEd+mK
	TSTkhCPSuAjTg==
X-Received: by 2002:a05:6a00:4706:b0:842:4af4:3080 with SMTP id d2e1a72fcca58-86b2db09168mr433675b3a.1.1789073593092;
        Thu, 10 Sep 2026 13:53:13 -0700 (PDT)
Received: from [172.29.212.252] ([2409:40c2:5431:4168:e542:5202:be02:6ae4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b250bf3e6sm150822b3a.5.2026.09.10.13.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:53:12 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH 0/2] ARM: dts: keystone-k2g: Fix usb-nop-xceiv dtbs_check
 warnings
Date: Fri, 11 Sep 2026 02:22:49 +0530
Message-Id: <20260911-ti-keystone-usb-phy-fix-v1-0-9f6e9cd649a3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM2wqDMBCE4VeRve6CifSgr1K8qDqtqxAlm5SK+
 O5Ge/kNzL+SwguUqmwlj6+oTC7BXDJq+5f7gKVLJpvbW14aw0F4xKJhcuCoDc/9wm/5sbEdgLJ
 43Isrpffskeaz/Kz/1tgMaMORo23bAREne817AAAA
X-Change-ID: 20260911-ti-keystone-usb-phy-fix-12deee938735
To: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789073586; l=763;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=1etk4KOXi29s0+VqLc6HiucY8F0vF73XSX3ZY6UDxlQ=;
 b=I58F2Ztvq5Yw4MKly35QrlL677tsLpM8s3BEC7GGLLbtmngGRS/qsw1o2QnO0jUDXBqppxWC0
 z9Y/0+VNb2ABnG833oRMZ0sMVp2YAqbDcdPe6agtuKmZWdS5yaEXcZN
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135314_879911_64B1F550 
X-CRM114-Status: UNSURE (   8.91  )
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

usb0_phy and usb1_phy fail dtbs_check because:
- missing the required #phy-cells.
- simple-bus wrapper that forces unnecessary reg.

Patch 1 adds #phy-cells with value 0 as required by binding.
Patch 2 drops the wrapper and moves the PHYs to root.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Bhargav Joshi (2):
      ARM: dts: keystone-k2g: Add required #phy-cells to usb-nop-xceiv nodes
      ARM: dts: keystone-k2g: Move usb-phy nodes out of simple-bus

 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)
---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260911-ti-keystone-usb-phy-fix-12deee938735

Best regards,
-- 
Bhargav


