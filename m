Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5BEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1E44Sgh/fBb3+oxPV/igqOovjJZCJr4T8Ggc55Eveo0=; b=x49tVQAMt+NbS5PzITr23c4on5
	1Fc3fE6VwCQ7DKPKzs1av3y7sejOSY+MRB/KceptzT0yq2lsEySbrSkcdoi17UkIe4pqKI2cdzcDu
	gj5tlkcwAkWrLbnTCcwuUsjJz3lY36O8F3vd16E+XWSRU8qcjW0thgke8GAmQvAp1F3ifwOe0fijP
	JTctULgLl+Q/52fhFfr0uvNrK2y6EhCtHA2pZqHZFCXH+oxSTxy2Hf3aIUpkrpCI5HUtxNXl0rgWg
	ye+Kk0Uwh7D7oTE1ehOeXQgHw3WEG0qOSAaWOusafToTxQeTSdXdh0q0Z3iWk2bFrzxAA1DWGGDxk
	doxfidVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfH1x-00000004U7m-1MCw;
	Thu, 02 Jul 2026 13:00:37 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfH1u-00000004U74-0qV3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 13:00:36 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso971146a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782997233; x=1783602033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1E44Sgh/fBb3+oxPV/igqOovjJZCJr4T8Ggc55Eveo0=;
        b=XivuXnVEpDjd2p5KGiMyQiecjjQ5C53bvdAx5PWYaj/afDWVXEezchgu85fwXB62q0
         qdHGookMPlc3IqoWN4CTRK0HALWRscB/s09Z72eurYKpv+4qXvCLTN/Zvvt2QV6c8C9d
         iNl/GA5mh3Ifx5fKXsDNPkK3pE5WrTauX5LNlHWSYMoNEBbJjG1JaeklSo6JeiAoITba
         u1Fy395j3idUCt7nGnnk3WvmEifpSvy3ctmNI0XzgUl0nxuj79EI6ojaQpJQKUXgVVYp
         rxk8lJaEFeh9cBQZWK58Fo9uLzi5cia9LJBrEJozF/8N9Q5ZcjiHInLAsaJ6F2GoeIhA
         7UaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782997233; x=1783602033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1E44Sgh/fBb3+oxPV/igqOovjJZCJr4T8Ggc55Eveo0=;
        b=ARr0bqcjHRzgZi0ootB9gRPAgCSjYiaCzeI24BKTnTJwvJJi1UDbOvOzomoLyvtVA2
         3MZ2qsLueeLug/ztrlmE6dJV9GWyfNKXXnnzGGYEXJ7RBF1c4Re4Kg5URnihDN3vEYY6
         qFQ72ZAICUFOLGKIHKnTWpKVdJgQ/JbheQjzH8QXhNy0RPhntvZyvZ1+lSoK7cLw2rol
         wPcehvNo/czrucSpvFUIAR7BnTq1K2pkvUzoSzgNEA5khtpdwJk0XuA2Om21fA4ApXyT
         Meg/pVN/q9/1GbcvIo03Egf/8fcXkjSGKShTUDgh5Zr9eNei+I2sYzVRdCHGc17xJaCn
         10xQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5nv4HMeX3BYDC0BEhPFdLg/N6Z6m3pQA/N4rJuqQv92PBOTn9eJZiev0I8nQvPQScfQMEc9+yMD6AqL+Y7w4J@lists.infradead.org
X-Gm-Message-State: AOJu0YyFPS3tJy793txgcrjN+lzINLDk707/+czJLxuEAPAe27M+IKr8
	sbbM37rkGDT3SxwFUwC0+6KOaXpAM9xC9fkee0w7vXIhQYjjN1/7lfu4
X-Gm-Gg: AfdE7clbVGzE77iGmFwLkLF8u3ulBtyQIoJat1fYManIj3d80g841tPJzWbxOVusa6e
	foCF8iwzLy2918rhi9yBHzmtkDkPw5GmuHbU8ou0bn6l/rUNNdyvkPJksfWExGYTGLBXCBcNUu9
	eaVM98hkiw1nhmnkJnkvcbGH/aEww2AmIa1ihkULHyYlJk9Osua7ci/5uHoGT/LlZaiqixvvxZV
	AqBEm+s8s5xPB69S1dq1p47U9zW7IxIeDZHCw/xyIDAgOk17tnktXIjYClPoDCbW7nOfSBpbDLn
	KtgLbtj8pSba2F3MdK/Er9TCcNQRo9OLDsHN2GDhX81QuVRaRJmHZ9mSZyU+Jq4U5zzKwb38Pyj
	m3t9j9NZxGBARnZv8iRX+akZdC5kWbQN6KcRo27I8VTSOs9CGr5oDHIm2dNWNAj7DfLMzl+jOim
	TK48KUv//fAUSAvKO/Ha7Ubo+soHJdgUCVgJJTDw2Yjs5ylrUyT4aop/TghJXfArg350bqA9e07
	GpWPFvlDO9oLB+DoFT8TTtjAqvumHLPLyKei+eqR8I=
X-Received: by 2002:a05:6a20:258f:b0:3bf:8b8d:3151 with SMTP id adf61e73a8af0-3bfed3efa54mr7187075637.44.1782997233311;
        Thu, 02 Jul 2026 06:00:33 -0700 (PDT)
Received: from leonardoc-nb (201-68-197-145.dsl.telesp.net.br. [201.68.197.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f116065c5sm7279613eec.11.2026.07.02.06.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:00:32 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: s-jain1@ti.com
Cc: airlied@gmail.com,
	aradhya.bhatia@linux.dev,
	conor+dt@kernel.org,
	devarsht@ti.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	h-shenoy@ti.com,
	jyri.sarha@iki.fi,
	kristo@kernel.org,
	krzk+dt@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	louis.chauvet@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	nm@ti.com,
	praneeth@ti.com,
	robh@kernel.org,
	simona@ffwll.ch,
	tomi.valkeinen@ideasonboard.com,
	tzimmermann@suse.de,
	vigneshr@ti.com,
	leonardo.costa@toradex.com
Subject: Re: [RESEND PATCH v2 5/5] drm/tidss: Fix sampling edge configuration
Date: Thu,  2 Jul 2026 09:59:43 -0300
Message-ID: <20260702130010.1238089-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106141227.899054-6-s-jain1@ti.com>
References: <20251106141227.899054-6-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_060034_241896_EF722293 
X-CRM114-Status: GOOD (  13.63  )
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

Hello,

We tested this patch and it introduces a regression on our panel.

On our board, a Toshiba TC358768 DPI-to-DSI bridge is connected to the parallel
RGB output. The bridge requires data to be driven on the negative edge, and
this is also reflected by the `ipc` variable in `dispc_vp_enable()`, which is
set to `1`.

With this patch applied, however, data is driven on the positive edge instead.

According to SPRUIV7C, both `MAIN_CTRL_MMR_CFG0_DPI0_CLK_CTRL[8]` and
`DSS_VP1_POL_FREQ[14] IPC` should be programmed consistently. However, if we
follow the actual bit descriptions, and ignore the sentence saying that the two
programmed values should be the same, the data is driven on the requested edge.

From SPRUIV7C (https://www.ti.com/lit/ug/spruiv7b/spruiv7c.pdf):

MAIN_CTRL_MMR_CFG0_DPI0_CLK_CTRL[8] (DPI0_CLK_CTRL_DATA_CLK_INVDIS):

        Clock edge select for DPI0 data outputs

        Note that this value should be the same as the programmed value of
        DSS_POL_FREQ[14] IPC.

        Reset Source: mod_por_rst_n

        0 DATA and DE are driven on the falling edge of clk
        1 DATA and DE are driven on the rising edge of clk


    DSS_VP1_POL_FREQ[14] (IPC)

        Invert pixel clock

        To set data to pixel clock relationship, CTRL_MMR_DPI0_CLK_CTRL[8]
        DPI0_CLK_CTRL_DATA_CLK_INVDIS setting should be the same as the [14]
        IPC setting.

        0 Data is driven on the LCD data lines on the rising-edge of the pixel clock
        1 Data is driven on the LCD data lines on the falling-edge of the pixel clock

So, the proposed fix to this patch is:

```diff
- regmap_update_bits(dispc->clk_ctrl, 0, 0x100, ipc ? 0x100 : 0x000);
+ regmap_update_bits(dispc->clk_ctrl, 0, 0x100, ipc ? 0x000 : 0x100);
```

Reverting the patch also makes the Toshiba bridge work correctly again.
However, we can confirm that the patch is needed, otherwise only the
positive-edge case (our case) works correctly.

In other words, the two registers need to match semantically, not numerically.

Please ignore the previous email I sent:
https://lore.kernel.org/all/20260702104817.1219078-1-leoreis.costa@gmail.com/
I hadn't seen this more recent thread at the time.

