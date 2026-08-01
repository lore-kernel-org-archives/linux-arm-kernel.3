Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B04C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 05:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d0YoODerQIzEOVN20KJQiVnY06JcnNCgCt2bly7t1Fo=; b=wcdtA6L/RhIrhLcfop167ftM5j
	sisgx7tsWwtec4/WTXFDqw7f4zg4whQejzy4TdtaWVROudyQCvcH5KCtnIBJhDI2+AUevpGBcw4a6
	WtbWFT1XvyTBsyfpG4eCYEhTw9qM/R8F9Khz38qaVXMPV3IBNzk1Z3/wMIexbQT0yCofctS1tjuDt
	916Ykk9aYjDoJncBVNMycSOeDsxsMSXjDUpX+7mmrixK6/yXxhDmoy8ssGCAMmQ4IbZ1jsaVEAfW8
	E+r48LEUGDtAz1Ng+BaQY+pjeNvJNEx+A2cRRnjiIywTkh51kJgeXedl+MCHceRywQKXHoCSdYoXy
	SmM5eMQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq2hB-0000000DvFC-1cXG;
	Sat, 01 Aug 2026 05:55:41 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq2h7-0000000DvEk-3Ojs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 05:55:40 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso986181a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 22:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1785563735; x=1786168535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0YoODerQIzEOVN20KJQiVnY06JcnNCgCt2bly7t1Fo=;
        b=ij7RAYnqtS8cOSagiLp37FcNQMa8f+GuL0heBpo8GrvzC6m1RQEOzvD8d3k825KRuf
         n0bzgFPWiKG251YDn300k15x78VAopBgShjVUqzVImJTMIxfh6ufysl3lGDZc2LohUE8
         YRN2Oo8UN0ySSjloNDKmgbkl++ieJy2pMjhQqebtmh9UQ2nK4EChzbTDkdGvD9vyqLAQ
         2sPjEJeOq8r2WbQ8ILTRR8fYYSNI11cRpoV/q79YLZkvFM/oEZHpJr14jbsREitu6AD9
         ABT4ovsXnOIvn9TYvVlUaG1TOG+eR7il/JybeG042bPxmjKnit8+wgEZnh0gi8h+VBkS
         wJ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785563735; x=1786168535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0YoODerQIzEOVN20KJQiVnY06JcnNCgCt2bly7t1Fo=;
        b=Q3N9igWz6R9o8YB9ncXuqz+fANktB1uxYnnwI2oPQzqyLVuhE7TSRCoPh6AiKBL56C
         YPnt9eWOcItgXL8naXgXe0iBen7doS9hfRHoJLHV8w+Q+RhM62Fmxx3GIFzY5OpRQDRy
         L4HjXl06su/RXEPGxhYj7siuTZvNz+gXagm80y8DObYkjK6OFUZ2lYaFdQz3TxtXlalk
         kNOvtG44hXLdfQJ674hXMMqYxzfGij+Gz2z83InIGd87irinUeb23hFua5oXsvQkvSBC
         iXfMYpqdFrmjh+AkiuXzX+rKc2QZ5l+jyHmyk4bDq5I+YWltsOXehHDARagRtr3SiLY+
         E5Kg==
X-Forwarded-Encrypted: i=1; AHgh+Rpi+SzZNEm/sxxbm+1Dpi3swRdBYAGNA4sUTNX4Wy2hw4A2I+Spqs7NDZQ7lXmKNYBDBmg36Jz54OvAQQEX0GHP@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+UPdchj+UjCiL+8codU75UuyNk0ETuQlmxh4YX866aKEzNrCf
	8TfZR0A6k81cGjDO1CIxyF5A/Marqzf7VOCREOSJM454FX1D4v6s7qrZC50D2hJ4Ov4=
X-Gm-Gg: AR+sD10jDnOtpzZIpVfnmDqoU7vZD9+kDo6SH11FUGL9+07p60c+Yl+UaJfhQCkTJ7d
	S1DpNJE1legOq26KJTZ63VO4W8apP49feXgXURdN/J7a/m0Mmvv2yKTKAlear/oQzG2ZP8fpzYg
	anKBzWPToW8XmkZUYDR5APn3up8ihf4qaitsAaFX1Lo8Vdi14SwAZ+iojFcLq6xwdp2wudK57t4
	5TjmdsPGewymIHh0VUvDVPUNT1T8uCdnSlFnfFo1KfPRh2W1pVam6j6i3h/YmFXRlaObPdPPCN5
	foqi3wuQbuqB5LDXC+30g+o63AascVLgPjZOVkBWE5c3nhyTpFzyCs0+Dvdp8CvQyd+BJgPRaYr
	9sparuN9xnk9mi6MidO7y0m68+39hRNUArO8u7+v//9kjJCuSufKB/mXOcw8R7gQGP4fT2XcQD7
	ULqOGNDLFAbA8LG+y//nWwTgCHK38Hsq4lnGqRFHs5kuekZwkh8eI3HgLbjZsM19qmMvhksgdvV
	NuwGfvyPLt0Tu5coh+QygjX96cycNFmDSxmt3KR43pB3kmB03HfwXSxlvXyOU0PrhzeyMS1EyUD
	/hoYYjz1xqIuLfQ=
X-Received: by 2002:a05:6a21:9995:b0:3c3:b4e8:5565 with SMTP id adf61e73a8af0-3c92a8f301emr2512911637.61.1785563735027;
        Fri, 31 Jul 2026 22:55:35 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-13fab050d8csm16502537c88.0.2026.07.31.22.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 22:55:34 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: Steen.Hegelund@microchip.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	joe@dama.to,
	horatiu.vultur@microchip.com,
	stable@vger.kernel.org
Subject: [PATCH v3 net] net: microchip: vcap api: Fix possible memory leak in vcap_decode_rule()
Date: Sat,  1 Aug 2026 11:25:05 +0530
Message-ID: <20260801055507.47534-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_225538_119750_4D6B76BE 
X-CRM114-Status: GOOD (  12.68  )
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

The memory allocated for struct vcap_rule_internal, keyfields and
actionfields inside vcap_dup_rule() are not freed in some of the error
paths in vcap_decode_rule(). Fix that by calling vcap_free_rule().

Compile tested only. Issue found using a prototype static analysis tool
built on top of the LLVM compiler infrastructure.

Fixes: 610c32b2ce66 ("net: microchip: vcap: Add vcap_get_rule")
Cc: stable@vger.kernel.org
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---

v2->v3:
- Rename the error label to "err_free_rule" to denote the first action
  being undone, as suggested by Jakub Kicinski
- Move the information about compile tested only, and how the issue was
  found to the commit message, as suggested by Jakub Kicinski.

v1->v2:
- Convert the error labels from "err" to "out_err" to avoid confusion
  with the err variable, as suggested by Joe Damato.

Link to v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260727125757.134611-1-nihaal@cse.iitm.ac.in/
Link to v2: https://patchwork.kernel.org/project/netdevbpf/patch/20260728114253.196398-1-nihaal@cse.iitm.ac.in/

 drivers/net/ethernet/microchip/vcap/vcap_api.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net/ethernet/microchip/vcap/vcap_api.c
index ff86cde11a32..788c0728d763 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
@@ -2427,18 +2427,21 @@ struct vcap_rule *vcap_decode_rule(struct vcap_rule_internal *elem)
 
 	err = vcap_read_rule(ri);
 	if (err)
-		return ERR_PTR(err);
+		goto err_free_rule;
 
 	err = vcap_decode_keyset(ri);
 	if (err)
-		return ERR_PTR(err);
+		goto err_free_rule;
 
 	err = vcap_decode_actionset(ri);
 	if (err)
-		return ERR_PTR(err);
+		goto err_free_rule;
 
 out:
 	return &ri->data;
+err_free_rule:
+	vcap_free_rule(&ri->data);
+	return ERR_PTR(err);
 }
 
 struct vcap_rule *vcap_get_rule(struct vcap_control *vctrl, u32 id)
-- 
2.43.0


