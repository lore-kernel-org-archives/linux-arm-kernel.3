Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA85E83821
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 18:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+a1WmFTmtt2HmepX4bGFNTbjSF3KiPQ0gf6TAdFhC+s=; b=4A02KtBE5PhDjEE4d4VlPem+K1
	I6cI5P6WpBfjs8Vq1SR+3s/XK37hFrj+JpjHr22HKKCd4+oswTC6Hm0BFX5ss6UOXzY/I2g3YTfLP
	58uqvaGEnsbjKgYNRowsIhuLz6BB1ScP52cR5SccHPP72MWoAKLpkTzavMyZ0ivxObRC3ELNEy958
	FUP9BgiVSJasyRwZCmVgn5YjP4RXGQRaHfM3HNbLeaN1irdHeW9YW3BzxusOexbKr69xAIiWh7fop
	g2+lvOtGScoZTbaBfatYZrsfFlsqs/OWNEJXMBxtDJ0DlRdrxjMLfFEgqfyuc8OLWM6CHO1/YZiwJ
	RsKIDC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs34M-0000000788T-3kgZ;
	Mon, 16 Feb 2026 18:11:38 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs34F-0000000785M-1nEs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 18:11:32 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1271257ae53so3481308c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771265491; x=1771870291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a1WmFTmtt2HmepX4bGFNTbjSF3KiPQ0gf6TAdFhC+s=;
        b=HLn/xuaSol3TxcLQtwspFFU0Il6lIcDSDnJ4vTveYw+kEs+jDv6MwcXidbGrdGxUte
         svjQsCf4lVntqarSMI7NwqbVIMf2PQCTZ3OrfMkzSA0Qb668cMIgZOezAAQQi5Sn3nPy
         RMxuZ6ekzQ1emk1TZJ/74xSC1CcX5W0r3Kiiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771265491; x=1771870291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+a1WmFTmtt2HmepX4bGFNTbjSF3KiPQ0gf6TAdFhC+s=;
        b=raJoCDp4fRfwujPebUA6zxdU05ieVhyhkV+jbJ0MVr3fMJUPUUvRTVt66ClXG7195H
         bDm8y9QME8aOmEeTBBz9P5ZoyvNECMk8Dm8AjrxprIz3RH0fcHMJKYwODz4lCL54/o8o
         XEwGLNhVczP+4lsKpnyLL88fFWmsFWFW3w9dPSBmJCMQomsBCHFGjPEJxzkmQ0rIOjTk
         7rB3K2BN+SA7p5y2FpNQYKB1GfONs69iSgKiueD2/SEupZ9z/0RzzU9d/rKpCqUsJgc/
         jAFkyqnKeKyDNYFROCl2utKjX8FrXrovNm2irsHCvgEOU4YZ5s2Nd3u5eZMWpYsqVXOj
         L0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXey8ko+FhRLPubCM00T4XPmg+fps8J1qN4jhhh/0HOqpn00WlMD09M1OnVX1NAoScC/PHgLo9lKRFqTDwEXQwk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnatih3eMYRUfG14JwmTOPtfqMiHlUTA91j/BCGOOzCEHDJOAM
	1B0C/5L8WX3oe7DA3XgtgJayFtfobV8HnpH6ntEkTqCb4AOt1E/0oyAD3HOh290Lo7RFD8py9eA
	X/NQ=
X-Gm-Gg: AZuq6aJ7of3J9+NftRNDcl6HWxd+yYB4JBHLqVuNO2om3cbAcEupZz1ddP+8EFsdzlc
	QrKojeifC4winkm4fl+2LcMYiFtSv6SHKoHzti+Y57g21ytPIg+MXyAlJT9wXta3HbUCQQLldng
	kqpZX6xs9dmLAasJPkBu9/Z3+2IuMEQgvB8J6znrMTtOdJH7mWed7IlO93ix+NiDj/8lglCPLvT
	AgrmwVVhJeoLdV2/hR8psyF/2SBH7i17XTje5PkOIMwecaTYYqTSfCfpK7ipBhRHG/H1deW2REJ
	7Oah+s5Q+gGEMzFxunqVn3DO82VqKLqr7OugB87goMFPgcovdIMKTBBIh232VnT6uBuGd9iLTOP
	RLVbPmYMrNpu6ZjsrGxKKF617RmLH02JgXVMvJ2ejH+jRXhxF2uIRUSx7XxQmZnTL43evVYIRuh
	fmdkwfiU0bH80q9sfcreD+bDVat4wTGV6I4vgK2eJb4EM5bdrUX5iQrbgYmOIn0Fp7oUuEL4umb
	bvtBJUqWyc=
X-Received: by 2002:a05:7022:f102:b0:11b:9386:a389 with SMTP id a92af1059eb24-1273ae68bcdmr2539975c88.44.1771265490556;
        Mon, 16 Feb 2026 10:11:30 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:2953:dae1:1e39:73b3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm13724326c88.5.2026.02.16.10.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:11:29 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Frank.Li@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	festevam@gmail.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/15] firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
Date: Mon, 16 Feb 2026 10:09:41 -0800
Message-ID: <20260216100943.v3.4.I4a571bdd344dfe8e819cfcba37ccd0ec29284e49@changeid>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
References: <20260216181002.3475421-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_101131_467710_CAB4F0AA 
X-CRM114-Status: GOOD (  12.21  )
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

As per the patch ("mailbox: Deprecate NULL mbox messages; Introduce
mbox_ring_doorbell()"), we want to switch all users of NULL mailbox
messages to use mbox_ring_doorbell().

This client only ever sent NULL messages, so the transition is
straightforward.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/firmware/imx/imx-dsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/imx-dsp.c b/drivers/firmware/imx/imx-dsp.c
index ed79e823157a..231e9f841226 100644
--- a/drivers/firmware/imx/imx-dsp.c
+++ b/drivers/firmware/imx/imx-dsp.c
@@ -30,7 +30,7 @@ int imx_dsp_ring_doorbell(struct imx_dsp_ipc *ipc, unsigned int idx)
 		return -EINVAL;
 
 	dsp_chan = &ipc->chans[idx];
-	ret = mbox_send_message(dsp_chan->ch, NULL);
+	ret = mbox_ring_doorbell(dsp_chan->ch);
 	if (ret < 0)
 		return ret;
 
-- 
2.53.0.273.g2a3d683680-goog


